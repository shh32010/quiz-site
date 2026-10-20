package com.quiz.ai;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.UUID;

/**
 * AI 答疑接口（需登录）。
 */
@RestController
@RequestMapping("/api/ai")
public class AiController {

    public record Req(Integer questionId, String mode) {}

    private final AiService ai;

    public AiController(AiService ai) {
        this.ai = ai;
    }

    @PostMapping("/explain")
    public Map<String, Object> explain(@AuthenticationPrincipal UUID uid, @RequestBody Req req) {
        if (req.questionId() == null) {
            throw new IllegalArgumentException("questionId 必填");
        }
        return ai.explain(uid, req.questionId(), req.mode());
    }

    @ExceptionHandler(IllegalStateException.class)
    public org.springframework.http.ResponseEntity<Map<String, String>> handle(IllegalStateException e) {
        return org.springframework.http.ResponseEntity.badRequest().body(Map.of("message", e.getMessage()));
    }
}
