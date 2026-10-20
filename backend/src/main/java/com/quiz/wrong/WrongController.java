package com.quiz.wrong;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 错题本（读侧）：错题的入本与复习节奏由数据库 submit_answer 维护。
 */
@RestController
@RequestMapping("/api/wrong")
public class WrongController {

    private final JdbcTemplate jdbc;

    public WrongController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @GetMapping
    public Map<String, Object> list(@AuthenticationPrincipal UUID uid) {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select w.question_id      as "questionId",
                       w.wrong_count      as "wrongCount",
                       w.next_review_at   as "nextReviewAt",
                       w.resolved,
                       q.question_type    as "questionType",
                       q.stem
                  from wrong_question w
                  join t_question q on q.id = w.question_id
                 where w.user_id = ? and not q.deleted
                 order by w.resolved asc, w.next_review_at nulls last
                 limit 300
                """, uid);
        long pending = rows.stream().filter(r -> Boolean.FALSE.equals(r.get("resolved"))).count();
        return Map.of("total", rows.size(), "pending", pending, "rows", rows);
    }
}
