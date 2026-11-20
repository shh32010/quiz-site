package com.quiz.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.OffsetDateTime;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 健康检查：确认应用存活 + 数据库可达。
 * 数据库异常时返回 503 且不向公网透传底层错误详情。
 */
@RestController
@RequestMapping("/api")
public class HealthController {

    private static final Logger log = LoggerFactory.getLogger(HealthController.class);

    private final JdbcTemplate jdbc;

    public HealthController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @GetMapping("/health")
    public ResponseEntity<Map<String, Object>> health() {
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("ok", true);
        body.put("time", OffsetDateTime.now().toString());
        try {
            Integer one = jdbc.queryForObject("select 1", Integer.class);
            Integer questions = jdbc.queryForObject(
                    "select count(*) from t_question where not deleted", Integer.class);
            body.put("db", Map.of("reachable", one != null && one == 1, "activeQuestions", questions));
            return ResponseEntity.ok(body);
        } catch (Exception e) {
            log.warn("健康检查数据库不可达: {}", e.getMessage());
            body.put("ok", false);
            body.put("db", Map.of("reachable", false));
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body(body);
        }
    }
}
