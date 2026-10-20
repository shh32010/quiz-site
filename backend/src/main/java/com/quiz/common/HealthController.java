package com.quiz.common;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.OffsetDateTime;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 健康检查：确认应用存活 + 数据库可达。
 */
@RestController
@RequestMapping("/api")
public class HealthController {

    private final JdbcTemplate jdbc;

    public HealthController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @GetMapping("/health")
    public Map<String, Object> health() {
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("ok", true);
        body.put("time", OffsetDateTime.now().toString());
        try {
            Integer one = jdbc.queryForObject("select 1", Integer.class);
            Integer questions = jdbc.queryForObject(
                    "select count(*) from t_question where not deleted", Integer.class);
            body.put("db", Map.of("reachable", one != null && one == 1, "activeQuestions", questions));
        } catch (Exception e) {
            body.put("ok", false);
            body.put("db", Map.of("reachable", false, "error", e.getMessage()));
        }
        return body;
    }
}
