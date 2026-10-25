package com.quiz.practice;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 游客试做：无需登录，判分不落库、不进错题本。
 * 登录后走 /api/practice/**（正常会话）。
 */
@RestController
@RequestMapping("/api/guest")
public class GuestController {

    public record Req(Integer questionId, String answer) {}

    private final JdbcTemplate jdbc;
    private final ObjectMapper om = new ObjectMapper();

    public GuestController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @PostMapping("/answer")
    public Map<String, Object> answer(@RequestBody Req req) {
        if (req.questionId() == null) {
            throw new IllegalArgumentException("questionId 必填");
        }
        String json = jdbc.queryForObject("select judge_answer(?, ?)::text",
                String.class, req.questionId(), req.answer() == null ? "" : req.answer());
        try {
            Map<String, Object> result = om.readValue(json, Map.class);
            String quality = jdbc.queryForObject(
                    "select qc_grade from t_question where id = ?", String.class, req.questionId());
            result.put("qcGrade", quality == null ? "" : quality);
            return result;
        } catch (Exception e) {
            throw new IllegalStateException("判分失败");
        }
    }
}
