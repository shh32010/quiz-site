package com.quiz.question;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 题目浏览（只读）：章节子树 / 课程 / 全库分页。
 * 注意：返回字段**不含 correct**，答案只在作答后经受控接口下发。
 */
@Service
public class QuestionService {

    private final JdbcTemplate jdbc;

    public QuestionService(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    private static final String COLS = """
            id, question_type as "questionType", stem, option_json as "optionJson", score,
            blank_count as "blankCount", has_image as "hasImage",
            chapter_id as "chapterId", cat_l1 as "catL1",
            (select c.code from t_chapter c where c.id = v_question_public.chapter_id) as "chapterCode",
            (select c.name from t_chapter c where c.id = v_question_public.chapter_id) as "chapterName",
            (with recursive anc as (
               select c.id, c.parent_id, c.code, c.name, 0 as depth
                 from t_chapter c where c.id = v_question_public.chapter_id
               union all
               select p.id, p.parent_id, p.code, p.name, a.depth + 1
                 from t_chapter p join anc a on p.id = a.parent_id
             )
             select string_agg(trim(coalesce(code, '') || ' ' || name), ' › ' order by depth desc)
               from anc) as "chapterPath",
            (select substring(tc.content from '/qimg/[A-Za-z0-9._-]+')
               from t_question tq join t_text_content tc on tc.id = tq.info_text_content_id
              where tq.id = v_question_public.id) as "imageUrl",
            (select string_agg(m[1], ',')
               from t_question tq join t_text_content tc on tc.id = tq.info_text_content_id,
                    regexp_matches(tc.content, '(/qimg/[A-Za-z0-9._-]+)', 'g') m
              where tq.id = v_question_public.id) as "imageUrls"
            """;

    /** 题干关键词搜索（pg_trgm 索引加速）；可按知识点过滤 */
    public Map<String, Object> search(String q, Integer kpId, int page, int size) {
        String kw = q == null ? "" : q.trim();
        if (kw.length() < 2 && kpId == null) {
            return Map.of("total", 0, "page", page, "size", size, "rows", List.of());
        }
        int offset = Math.max(0, (page - 1) * size);
        String like = "%" + escapeLike(kw) + "%";
        String kpFilter = kpId == null ? "" : " and (chapter_id = ? or id in (select question_id from t_question_kp where kp_id = ?))";
        List<Object> args = new ArrayList<>();
        args.add(like);
        if (kpId != null) {
            args.add(kpId);
            args.add(kpId);
        }

        Integer total = jdbc.queryForObject(
                "select count(*) from t_question where not deleted and review_status = 'ok' and stem ilike ? escape '\\'" + kpFilter,
                Integer.class, args.toArray());
        args.add(size);
        args.add(offset);
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select " + COLS + " from v_question_public where review_status = 'ok' and stem ilike ? escape '\\'" + kpFilter
                        + " order by id limit ? offset ?", args.toArray());
        return Map.of("total", total == null ? 0 : total, "page", page, "size", size, "rows", rows);
    }

    private static String escapeLike(String kw) {
        return kw.replace("\\", "\\\\").replace("%", "\\%").replace("_", "\\_");
    }

    /** 某章节（含全部子孙）/ 课程 / 试卷 / 知识点下的题；id 用于单题练习（游客） */
    public Map<String, Object> page(Integer chapterId, String course, Integer paperId,
                                    Integer kpId, Integer questionId, Integer questionType,
                                    int page, int size) {
        int offset = Math.max(0, (page - 1) * size);
        List<Object> args = new ArrayList<>();
        String where = "where review_status = 'ok'";
        if (chapterId != null && chapterId < 0) {
            // 虚拟“综合题（未挂三级）”：一级直属题 + 二级非叶子章直属题
            int root = -chapterId - 100000;
            where += """
                     and chapter_id in (
                       select c.id from t_chapter c
                        where not c.deleted and (
                          c.id = ? or (c.parent_id = ? and c.level = 2
                            and exists (select 1 from t_chapter ch where ch.parent_id = c.id and not ch.deleted))))
                    """;
            args.add(root);
            args.add(root);
        } else if (chapterId != null) {
            where += """
                     and chapter_id in (
                       with recursive sub as (
                         select id from t_chapter where id = ?
                         union all
                         select c.id from t_chapter c join sub s on c.parent_id = s.id
                       ) select id from sub)
                    """;
            args.add(chapterId);
        }
        if (course != null && !course.isBlank()) {
            where += " and cat_l1 = ?";
            args.add(course);
        }
        if (paperId != null) {
            where += """
                     and id in (select question_id from exam_paper_question where paper_id = ? and is_active)
                    """;
            args.add(paperId);
        }
        if (kpId != null) {
            where += " and (chapter_id = ? or id in (select question_id from t_question_kp where kp_id = ?))";
            args.add(kpId);
            args.add(kpId);
        }
        if (questionId != null) {
            where += " and id = ?";
            args.add(questionId);
        }

        // 按题型筛选前先保留基础条件，用于返回各题型数量
        String baseWhere = where;
        List<Object> baseArgs = new ArrayList<>(args);
        if (questionType != null && questionType >= 1 && questionType <= 5) {
            where += " and question_type = ?";
            args.add(questionType);
        }

        Integer total = jdbc.queryForObject(
                "select count(*) from v_question_public " + where, Integer.class, args.toArray());
        List<Map<String, Object>> typeCounts = jdbc.queryForList(
                "select question_type as \"type\", count(*) as \"count\" from v_question_public "
                        + baseWhere + " group by question_type order by question_type",
                baseArgs.toArray());

        // 真题按卷面顺序（参数化绑定 paperId，避免污染 SQL 执行计划缓存）；其他按 id
        String orderBy;
        if (paperId == null) {
            orderBy = " order by id ";
        } else {
            orderBy = " order by (select e.item_order from exam_paper_question e"
                    + " where e.paper_id = ? and e.question_id = v_question_public.id and e.is_active)"
                    + " nulls last, id ";
            args.add(paperId);
        }
        args.add(size);
        args.add(offset);
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select " + COLS + " from v_question_public " + where
                        + orderBy + " limit ? offset ?", args.toArray());

        return Map.of("total", total == null ? 0 : total, "page", page, "size", size,
                "rows", rows, "typeCounts", typeCounts);
    }

    /** 一道题关联的考纲三级讲义节点 */
    public List<Map<String, Object>> kps(int questionId) {
        return jdbc.queryForList("""
                select c.id, c.id as "nodeId", c.parent_id as "sectionId",
                       coalesce(c.code || ' ', '') || c.name as "title",
                       p.name as "section",
                       c.code as "nodeCode", c.name as "nodeName"
                  from t_question q
                  join t_chapter c on c.id = q.chapter_id and not c.deleted
                  left join t_chapter p on p.id = c.parent_id
                 where q.id = ?
                """, questionId);
    }
}
