package com.quiz.practice;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.UUID;

/**
 * 刷题接口（需登录）。
 */
@RestController
@RequestMapping("/api/practice")
public class PracticeController {

    public record StartReq(String mode, String target, Integer limit) {}

    public record AnswerReq(Integer questionId, String answer) {}

    private final PracticeService practice;

    public PracticeController(PracticeService practice) {
        this.practice = practice;
    }

    @PostMapping("/start")
    public Map<String, Object> start(@AuthenticationPrincipal UUID uid, @RequestBody StartReq req) {
        int limit = req.limit() == null ? 200 : Math.min(Math.max(req.limit(), 1), 500);
        return practice.start(uid, req.mode(), req.target(), limit);
    }

    @GetMapping("/{sessionId}/next")
    public Map<String, Object> next(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId) {
        return practice.next(sessionId, uid);
    }

    @PostMapping("/{sessionId}/answer")
    public Map<String, Object> answer(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId,
                                      @RequestBody AnswerReq req) {
        return practice.submit(sessionId, req.questionId(), req.answer() == null ? "" : req.answer(), uid);
    }

    @PostMapping("/{sessionId}/finish")
    public Map<String, Object> finish(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId) {
        return practice.finish(sessionId, uid);
    }

    @GetMapping("/{sessionId}/review/{questionId}")
    public Map<String, Object> review(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId,
                                      @PathVariable int questionId) {
        return practice.review(sessionId, questionId, uid);
    }

    @ExceptionHandler({IllegalArgumentException.class, IllegalStateException.class})
    public ResponseEntity<Map<String, String>> handle(RuntimeException e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", e.getMessage()));
    }
}
