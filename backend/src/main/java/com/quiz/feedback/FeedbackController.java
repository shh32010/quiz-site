package com.quiz.feedback;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

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
            return new com.fasterxml.jackson.databind.ObjectMapper().readValue(json, Map.class);
        } catch (Exception e) {
            throw new IllegalStateException("反馈提交失败");
        }
    }
}
