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
        String msg = e.getMostSpecificCause().getMessage();
        log.warn("数据库操作失败: {}", msg);
        // plpgsql 主动 raise 的业务提示可以直接透出；SQL 细节不外泄
        if (msg == null || msg.isBlank() || msg.length() > 80
                || msg.contains("SQL") || msg.contains("relation") || msg.contains("column")) {
            msg = "操作失败，请稍后重试";
        }
        return body(HttpStatus.BAD_REQUEST, msg);
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
