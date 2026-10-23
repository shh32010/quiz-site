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
        String like = "%" + kw + "%";
        String kpFilter = kpId == null ? "" : " and id in (select question_id from t_question_kp where kp_id = ?)";
        List<Object> args = new ArrayList<>();
        args.add(like);
        if (kpId != null) args.add(kpId);

        Integer total = jdbc.queryForObject(
                "select count(*) from t_question where not deleted and review_status = 'ok' and stem ilike ?" + kpFilter,
                Integer.class, args.toArray());
        args.add(size);
        args.add(offset);
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select " + COLS + " from v_question_public where review_status = 'ok' and stem ilike ?" + kpFilter
                        + " order by id limit ? offset ?", args.toArray());
        return Map.of("total", total == null ? 0 : total, "page", page, "size", size, "rows", rows);
    }

    /** 某章节（含全部子孙）/ 课程 / 试卷 / 知识点下的题；id 用于单题练习（游客） */
    public Map<String, Object> page(Integer chapterId, String course, Integer paperId,
                                    Integer kpId, Integer questionId, int page, int size) {
        int offset = Math.max(0, (page - 1) * size);
        List<Object> args = new ArrayList<>();
        String where = "where review_status = 'ok'";
        if (chapterId != null) {
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
            where += " and id in (select question_id from t_question_kp where kp_id = ?)";
            args.add(kpId);
        }
        if (questionId != null) {
            where += " and id = ?";
            args.add(questionId);
        }

        Integer total = jdbc.queryForObject(
                "select count(*) from v_question_public " + where, Integer.class, args.toArray());

        // 真题按卷面顺序；其他按 id
        String orderBy = paperId == null ? " order by id "
                : (" order by (select e.item_order from exam_paper_question e"
                        + " where e.paper_id = %d and e.question_id = v_question_public.id and e.is_active)"
                        + " nulls last, id ").formatted(paperId);
        args.add(size);
        args.add(offset);
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select " + COLS + " from v_question_public " + where
                        + orderBy + " limit ? offset ?", args.toArray());

        return Map.of("total", total == null ? 0 : total, "page", page, "size", size, "rows", rows);
    }

    /** 一道题关联的知识点（最多 10 条，高置信度优先） */
    public List<Map<String, Object>> kps(int questionId) {
        return jdbc.queryForList("""
                select k.id, k.title, k.section,
                       c.code as "nodeCode", c.name as "nodeName"
                  from t_question_kp x
                  join t_knowledge_point k on k.id = x.kp_id and not k.deleted
                  left join t_chapter c on c.id = k.node_id
                 where x.question_id = ?
                 order by case x.confidence when '高' then 0 when '中' then 1 else 2 end, k.id
                 limit 10
                """, questionId);
    }
}
