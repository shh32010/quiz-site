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
            id, question_type as "questionType", stem, score,
            has_image as "hasImage", chapter_id as "chapterId", cat_l1 as "catL1"
            """;

    /** 某章节（含全部子孙）下的题；chapterId 为空则不限章节 */
    public Map<String, Object> page(Integer chapterId, String course, int page, int size) {
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
