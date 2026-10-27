package com.quiz.auth;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.UUID;

/**
 * 邮箱归属验证：
 * - POST /api/auth/email/verify：公开，消费一次性令牌
 * - POST /api/auth/email/resend：需登录，重发验证邮件
 */
@RestController
@RequestMapping("/api/auth/email")
public class EmailVerificationController {

    public record VerifyReq(@NotBlank(message = "缺少验证令牌") String token) {}

    private final EmailVerificationService service;

    public EmailVerificationController(EmailVerificationService service) {
        this.service = service;
    }

    @PostMapping("/verify")
    public Map<String, Object> verify(@Valid @RequestBody VerifyReq req) {
        String email = service.verify(req.token());
        return Map.of("ok", true, "email", email);
    }

    @PostMapping("/resend")
    public ResponseEntity<?> resend(@AuthenticationPrincipal UUID uid) {
        if (uid == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "未登录"));
        }
        boolean sent = service.sendForCurrent(uid);
        return ResponseEntity.ok(Map.of("ok", true, "sent", sent));
    }
}
