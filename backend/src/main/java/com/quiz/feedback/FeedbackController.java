package com.quiz.feedback;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 用户反馈（复用数据库 submit_feedback：含 20 条/天限流）。
 */
@RestController
@RequestMapping("/api/feedback")
public class FeedbackController {

    public record Req(Integer questionId, String type, String content) {}

    private final JdbcTemplate jdbc;

    public FeedbackController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @PostMapping
    @Transactional
    public Map<String, Object> submit(@AuthenticationPrincipal UUID uid, @RequestBody Req req) {
        jdbc.queryForObject("select set_config('request.jwt.claim.sub', ?, true)", String.class, uid.toString());
        String json = jdbc.queryForObject(
                "select submit_feedback(?, ?, ?, ?)::text", String.class,
                req.questionId(), req.type() == null ? "other" : req.type(),
                req.content() == null ? "" : req.content(), null);
        try {
            Map<String, Object> result = new LinkedHashMap<>(
                    new com.fasterxml.jackson.databind.ObjectMapper().readValue(json, Map.class));
            if (req.questionId() != null) {
                result.put("similarCount", similarCount(req.questionId()));
            }
            return result;
        } catch (Exception e) {
            throw new IllegalStateException("反馈提交失败");
        }
    }

    /** 同一知识点优先、没有知识点时退化为同章节同题型，供“举一反三”提示 */
    private Integer similarCount(Integer questionId) {
        Integer count = jdbc.queryForObject("""
                with target as (
                  select question_type, chapter_id from t_question where id = ? and not deleted
                ), kps as (
                  select kp_id from t_question_kp where question_id = ?
                ), has_kp as (
                  select exists(select 1 from kps) as ok
                )
                select count(distinct q.id)
                  from t_question q
                 where q.id <> ?
                   and not q.deleted and q.review_status = 'ok'
                   and q.question_type = (select question_type from target)
                   and (
                     ((select ok from has_kp)
                       and exists (select 1 from t_question_kp x
                                    where x.question_id = q.id
                                      and x.kp_id in (select kp_id from kps)))
                     or
                     ((not (select ok from has_kp))
                       and q.chapter_id = (select chapter_id from target))
                   )
                """, Integer.class, questionId, questionId, questionId);
        return count == null ? 0 : count;
    }
}
