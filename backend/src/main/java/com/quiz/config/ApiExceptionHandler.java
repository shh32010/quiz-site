package com.quiz.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLException;
import java.util.Map;

/**
 * 统一接口异常：业务校验 400、数据冲突 409、未知异常 500。
 * 不把 SQL/堆栈细节直接返回给前端。
 */
@RestControllerAdvice
public class ApiExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(ApiExceptionHandler.class);

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<?> validation(MethodArgumentNotValidException e) {
        String msg = e.getBindingResult().getFieldErrors().stream()
                .findFirst().map(f -> f.getDefaultMessage()).orElse("参数不合法");
        return body(HttpStatus.BAD_REQUEST, msg);
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<?> unreadable(HttpMessageNotReadableException e) {
        return body(HttpStatus.BAD_REQUEST, "请求体格式不正确");
    }

    @ExceptionHandler({IllegalArgumentException.class, IllegalStateException.class})
    public ResponseEntity<?> business(RuntimeException e) {
        return body(HttpStatus.BAD_REQUEST, e.getMessage() == null ? "操作失败" : e.getMessage());
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<?> conflict(DataIntegrityViolationException e) {
        log.warn("数据冲突: {}", e.getMostSpecificCause().getMessage());
        return body(HttpStatus.CONFLICT, "数据冲突，请稍后重试");
    }

    @ExceptionHandler(DataAccessException.class)
    public ResponseEntity<?> data(DataAccessException e) {
        Throwable root = e.getMostSpecificCause();
        // 仅对 PostgreSQL 显式业务 RAISE EXCEPTION（P0001 / 28000）返回业务提示；其余基础设施/SQL 错误统一返回 500 脱敏
        if (root instanceof SQLException sqlEx) {
            String state = sqlEx.getSQLState();
            if ("28000".equals(state)) {
                return body(HttpStatus.UNAUTHORIZED, "未登录或登录已过期");
            }
            if ("P0001".equals(state)) {
                String bizMsg = extractPgMessage(sqlEx);
                log.warn("数据库业务校验拒绝: {}", bizMsg);
                if (bizMsg == null || bizMsg.isBlank() || bizMsg.length() > 80) {
                    bizMsg = "操作失败，请稍后重试";
                }
                return body(HttpStatus.BAD_REQUEST, bizMsg);
            }
        }
        log.error("数据库访问异常: {}", root.getMessage(), e);
        return body(HttpStatus.INTERNAL_SERVER_ERROR, "服务器内部错误");
    }

    private static String extractPgMessage(SQLException sqlEx) {
        String raw = sqlEx.getMessage();
        if (raw == null) {
            return null;
        }
        // 只取首行并去掉 PostgreSQL 默认的 "ERROR: " 前缀，避免透出 Where/Context 堆栈
        int nl = raw.indexOf('\n');
        String firstLine = (nl >= 0 ? raw.substring(0, nl) : raw).trim();
        if (firstLine.startsWith("ERROR:")) {
            firstLine = firstLine.substring("ERROR:".length()).trim();
        }
        return firstLine;
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<?> unknown(Exception e) {
        log.error("未处理异常", e);
        return body(HttpStatus.INTERNAL_SERVER_ERROR, "服务器内部错误");
    }

    private static ResponseEntity<Map<String, String>> body(HttpStatus status, String message) {
        return ResponseEntity.status(status).body(Map.of("message", message));
    }
}
