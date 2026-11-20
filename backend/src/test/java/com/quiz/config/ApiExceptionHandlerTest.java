package com.quiz.config;

import org.junit.jupiter.api.Test;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.UncategorizedSQLException;

import java.sql.SQLException;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * 全局异常处理器单元测试：验证仅透传 PostgreSQL 主动业务异常（P0001/28000），其余数据库错误统一返回 500 脱敏。
 */
class ApiExceptionHandlerTest {

    @Test
    @SuppressWarnings("unchecked")
    void returns500AndHidesDetailsForInfrastructureDataAccessException() {
        ApiExceptionHandler handler = new ApiExceptionHandler();
        var ex = new DataAccessResourceFailureException("HikariPool-1 - Connection is not available");

        ResponseEntity<?> resp = handler.data(ex);
        assertThat(resp.getStatusCode()).isEqualTo(HttpStatus.INTERNAL_SERVER_ERROR);
        Map<String, String> body = (Map<String, String>) resp.getBody();
        assertThat(body.get("message")).isEqualTo("服务器内部错误");
    }

    @Test
    @SuppressWarnings("unchecked")
    void surfacesFriendlyMessageForPlpgsqlRaiseExceptionP0001() {
        ApiExceptionHandler handler = new ApiExceptionHandler();
        SQLException sqlEx = new SQLException("ERROR: 今日反馈已达上限\n  Where: PL/pgSQL function submit_feedback", "P0001");
        var ex = new UncategorizedSQLException("submit_feedback", "select submit_feedback()", sqlEx);

        ResponseEntity<?> resp = handler.data(ex);
        assertThat(resp.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
        Map<String, String> body = (Map<String, String>) resp.getBody();
        assertThat(body.get("message")).isEqualTo("今日反馈已达上限");
    }

    @Test
    @SuppressWarnings("unchecked")
    void mapsAuthSqlState28000ToUnauthorized() {
        ApiExceptionHandler handler = new ApiExceptionHandler();
        SQLException sqlEx = new SQLException("ERROR: 未登录", "28000");
        var ex = new UncategorizedSQLException("submit_answer", "select submit_answer()", sqlEx);

        ResponseEntity<?> resp = handler.data(ex);
        assertThat(resp.getStatusCode()).isEqualTo(HttpStatus.UNAUTHORIZED);
        Map<String, String> body = (Map<String, String>) resp.getBody();
        assertThat(body.get("message")).isEqualTo("未登录或登录已过期");
    }
}
