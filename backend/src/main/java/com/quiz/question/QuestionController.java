package com.quiz.question;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 题目浏览接口（只读，不含答案）。
 */
@RestController
@RequestMapping("/api/questions")
public class QuestionController {

    private final QuestionService questionService;

    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    /**
     * GET /api/questions?chapter=1&page=1&size=50
     * GET /api/questions?course=A&page=1&size=50
     */
    @GetMapping("/search")
    public Map<String, Object> search(@RequestParam(defaultValue = "") String q,
                                      @RequestParam(required = false) Integer kp,
                                      @RequestParam(defaultValue = "1") int page,
                                      @RequestParam(defaultValue = "20") int size) {
        return questionService.search(q, kp, Math.max(page, 1), Math.min(Math.max(size, 1), 100));
    }

    @GetMapping
    public Map<String, Object> page(@RequestParam(required = false) Integer chapter,
                                    @RequestParam(required = false) String course,
                                    @RequestParam(required = false) Integer paper,
                                    @RequestParam(required = false) Integer kp,
                                    @RequestParam(required = false) Integer id,
                                    @RequestParam(defaultValue = "1") int page,
                                    @RequestParam(defaultValue = "50") int size) {
        int safeSize = Math.min(Math.max(size, 1), 200);
        return questionService.page(chapter, course, paper, kp, id, Math.max(page, 1), safeSize);
    }

    /** 一道题关联的知识点：GET /api/questions/123/knowledge */
    @GetMapping("/{id}/knowledge")
    public java.util.List<Map<String, Object>> knowledge(@org.springframework.web.bind.annotation.PathVariable int id) {
        return questionService.kps(id);
    }
}
