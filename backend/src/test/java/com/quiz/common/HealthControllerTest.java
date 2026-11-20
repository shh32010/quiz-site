package com.quiz.common;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.*;

/**
 * 健康检查控制器单元测试：验证数据库异常返回 503 且不泄露底层错误信息。
 */
class HealthControllerTest {

    @Test
    @SuppressWarnings("unchecked")
    void returns503WithoutLeakingInternalErrorMessageWhenDbFails() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        when(jdbc.queryForObject("select 1", Integer.class))
                .thenThrow(new RuntimeException("FATAL: password authentication failed for user quiz_app at 127.0.0.1:5432"));

        HealthController controller = new HealthController(jdbc);
        ResponseEntity<Map<String, Object>> resp = controller.health();

        assertThat(resp.getStatusCode()).isEqualTo(HttpStatus.SERVICE_UNAVAILABLE);
        assertThat(resp.getBody()).isNotNull();
        assertThat(resp.getBody().get("ok")).isEqualTo(false);
        Map<String, Object> db = (Map<String, Object>) resp.getBody().get("db");
        assertThat(db.get("reachable")).isEqualTo(false);
        assertThat(db).doesNotContainKey("error");
    }
}
