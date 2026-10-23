package com.quiz.practice;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
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

    public record StartReq(@NotBlank(message = "mode 不能为空") String mode,
                           String target, Integer limit) {}

    public record AnswerReq(@NotNull(message = "questionId 不能为空") Integer questionId,
                            @Size(max = 10000, message = "答案过长") String answer) {}

    private final PracticeService practice;

    public PracticeController(PracticeService practice) {
        this.practice = practice;
    }

    @PostMapping("/start")
    public Map<String, Object> start(@AuthenticationPrincipal UUID uid, @Valid @RequestBody StartReq req) {
        int limit = req.limit() == null ? 200 : Math.min(Math.max(req.limit(), 1), 500);
        return practice.start(uid, req.mode(), req.target(), limit);
    }

    @GetMapping("/{sessionId}/next")
    public Map<String, Object> next(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId) {
        return practice.next(sessionId, uid);
    }

    /** 按顺序取题（上一题/下一题） */
    @GetMapping("/{sessionId}/item/{order}")
    public Map<String, Object> item(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId,
                                    @PathVariable int order) {
        return practice.item(sessionId, order, uid);
    }

    @PostMapping("/{sessionId}/answer")
    public Map<String, Object> answer(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId,
                                      @Valid @RequestBody AnswerReq req) {
        return practice.submit(sessionId, req.questionId(), req.answer() == null ? "" : req.answer(), uid);
    }

    @PostMapping("/{sessionId}/finish")
    public Map<String, Object> finish(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId) {
        return practice.finish(sessionId, uid);
    }

    @GetMapping("/{sessionId}/status")
    public Map<String, Object> status(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId) {
        return practice.status(sessionId, uid);
    }

    @GetMapping("/{sessionId}/review/{questionId}")
    public Map<String, Object> review(@AuthenticationPrincipal UUID uid, @PathVariable long sessionId,
                                      @PathVariable int questionId) {
        return practice.review(sessionId, questionId, uid);
    }

}
