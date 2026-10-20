package com.quiz.report;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 学习报告：总览 + 最近练习。
 */
@RestController
@RequestMapping("/api/report")
public class ReportController {

    private final JdbcTemplate jdbc;

    public ReportController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @GetMapping
    public Map<String, Object> report(@AuthenticationPrincipal UUID uid) {
        Map<String, Object> summary = jdbc.queryForMap("""
                select count(*)                                            as "answered",
                       count(*) filter (where is_correct)                  as "correct",
                       count(distinct date(answered_at))                   as "activeDays",
                       coalesce(sum(score_got), 0)                         as "score"
                  from practice_answer
                 where user_id = ?
                """, uid);

        List<Map<String, Object>> recent = jdbc.queryForList("""
                select id, mode, target_id as "targetId", started_at as "startedAt",
                       finished_at as "finishedAt", score, total_score as "totalScore",
                       correct_count as "correctCount", question_count as "questionCount"
                  from practice_session
                 where user_id = ?
                 order by started_at desc
                 limit 10
                """, uid);

        Map<String, Object> wrong = jdbc.queryForMap("""
                select count(*) as "total",
                       count(*) filter (where not resolved) as "pending"
                  from wrong_question where user_id = ?
                """, uid);

        return Map.of("summary", summary, "recent", recent, "wrong", wrong);
    }
}
