package com.quiz.knowledge;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 知识点学习页接口（只读）。
 */
@RestController
@RequestMapping("/api/knowledge")
public class KnowledgeController {

    private final KnowledgeService service;

    public KnowledgeController(KnowledgeService service) {
        this.service = service;
    }

    /** 大纲树 + 知识点数：GET /api/knowledge/tree?subject=4 */
    @GetMapping("/tree")
    public List<KnowledgeNode> tree(@RequestParam(required = false) Integer subject) {
        return service.tree(subject);
    }

    /** 某章节子树下的知识点：GET /api/knowledge?chapter=1&q=关键字 */
    @GetMapping
    public Map<String, Object> list(@RequestParam int chapter,
                                    @RequestParam(defaultValue = "") String q,
                                    @RequestParam(defaultValue = "1") int page,
                                    @RequestParam(defaultValue = "50") int size) {
        return service.list(chapter, q, page, size);
    }
}
