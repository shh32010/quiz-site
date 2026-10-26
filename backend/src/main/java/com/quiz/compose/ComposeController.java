package com.quiz.compose;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
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

    public record ChapterReq(@NotNull(message = "chapterId 不能为空") Integer chapterId,
                             Integer count, Integer type) {}

    private final ComposeService compose;

    public ComposeController(ComposeService compose) {
        this.compose = compose;
    }

    @PostMapping("/start")
    public Map<String, Object> start(@AuthenticationPrincipal UUID uid, @RequestBody StartReq req) {
        int subject = req.subject() == null ? 4 : req.subject();
        return compose.start(uid, subject);
    }

    /** 章节内随机组卷：默认 20 题，可按题型筛选 */
    @PostMapping("/chapter")
    public Map<String, Object> startChapter(@AuthenticationPrincipal UUID uid,
                                            @Valid @RequestBody ChapterReq req) {
        int count = req.count() == null ? 20 : req.count();
        return compose.startChapter(uid, req.chapterId(), count, req.type());
    }
}
