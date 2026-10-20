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
            chapter_id as "chapterId", cat_l1 as "catL1"
            """;

    /** 题干关键词搜索（pg_trgm 索引加速） */
    public Map<String, Object> search(String q, int page, int size) {
        String kw = q == null ? "" : q.trim();
        if (kw.length() < 2) {
            return Map.of("total", 0, "page", page, "size", size, "rows", List.of());
        }
        int offset = Math.max(0, (page - 1) * size);
        String like = "%" + kw + "%";
        Integer total = jdbc.queryForObject(
                "select count(*) from t_question where not deleted and review_status = 'ok' and stem ilike ?",
                Integer.class, like);
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select " + COLS + " from v_question_public where review_status = 'ok' and stem ilike ?"
                        + " order by id limit ? offset ?", like, size, offset);
        return Map.of("total", total == null ? 0 : total, "page", page, "size", size, "rows", rows);
    }

    /** 某章节（含全部子孙）/ 课程 / 试卷下的题 */
    public Map<String, Object> page(Integer chapterId, String course, Integer paperId, int page, int size) {
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

        Integer total = jdbc.queryForObject(
                "select count(*) from v_question_public " + where, Integer.class, args.toArray());

        args.add(size);
        args.add(offset);
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select " + COLS + " from v_question_public " + where
                        + " order by id limit ? offset ?", args.toArray());

        return Map.of("total", total == null ? 0 : total, "page", page, "size", size, "rows", rows);
    }
}
