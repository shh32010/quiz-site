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
                       q.review_status    as "reviewStatus",
                       (q.review_status = 'ok') as "available",
                       q.stem,
                       kp.kps as "kps"
                  from wrong_question w
                  join t_question q on q.id = w.question_id
                  left join lateral (
                    select string_agg(k.title, '、' order by k.id) as kps
                      from t_question_kp x
                      join t_knowledge_point k on k.id = x.kp_id and not k.deleted
                     where x.question_id = q.id
                  ) kp on true
                 where w.user_id = ? and w.deleted_at is null and not q.deleted
                 order by w.resolved asc, w.next_review_at nulls last
                 limit 300
                """, uid);
        long pending = rows.stream()
                .filter(r -> Boolean.FALSE.equals(r.get("resolved")) && Boolean.TRUE.equals(r.get("available")))
                .count();
        long unavailable = rows.stream()
                .filter(r -> !Boolean.TRUE.equals(r.get("available")))
                .count();
        return Map.of("total", rows.size(), "pending", pending,
                "unavailable", unavailable, "rows", rows);
    }

    /** 打印用：返回可练习错题的题干、选项、答案和解析（仅当前用户） */
    @GetMapping("/print")
    public Map<String, Object> print(@AuthenticationPrincipal UUID uid) {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select w.question_id      as "questionId",
                       w.wrong_count      as "wrongCount",
                       q.question_type    as "questionType",
                       q.stem,
                       q.option_json      as "optionJson",
                       q.correct,
                       q.analysis
                  from wrong_question w
                  join t_question q on q.id = w.question_id
                 where w.user_id = ? and w.deleted_at is null and not q.deleted and q.review_status = 'ok'
                 order by w.resolved asc, w.next_review_at nulls last, w.question_id
                 limit 300
                """, uid);
        return Map.of("rows", rows);
    }
}
