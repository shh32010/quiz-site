package com.quiz.compose;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.UUID;

/**
 * 随机组卷接口（需登录）。
 */
@RestController
@RequestMapping("/api/compose")
public class ComposeController {

    public record StartReq(Integer subject) {}

    private final ComposeService compose;

    public ComposeController(ComposeService compose) {
        this.compose = compose;
    }

    @PostMapping("/start")
    public Map<String, Object> start(@AuthenticationPrincipal UUID uid, @RequestBody StartReq req) {
        int subject = req.subject() == null ? 4 : req.subject();
        return compose.start(uid, subject);
    }
}
