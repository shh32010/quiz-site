package com.quiz.knowledge;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 知识点学习页接口（浏览公开；阅读进度同步需登录）。
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

    /** 全库搜索知识点：GET /api/knowledge/search?q=关键字 */
    @GetMapping("/search")
    public Map<String, Object> search(@RequestParam(defaultValue = "") String q,
                                      @RequestParam(defaultValue = "1") int page,
                                      @RequestParam(defaultValue = "50") int size) {
        return service.search(q, page, size);
    }

    /** 获取当前用户的服务端阅读进度：GET /api/knowledge/progress */
    @GetMapping("/progress")
    public Map<String, Object> listProgress(@AuthenticationPrincipal UUID uid) {
        return service.listProgress(uid);
    }

    /** 更新当前用户在某节的阅读进度或已学状态：PUT /api/knowledge/progress/{sectionId} */
    @PutMapping("/progress/{sectionId}")
    public Map<String, Object> saveProgress(@AuthenticationPrincipal UUID uid,
                                            @PathVariable int sectionId,
                                            @RequestBody Map<String, Object> body) {
        Integer progressPct = body.get("progressPct") instanceof Number n ? n.intValue() : null;
        Boolean learned = body.get("learned") instanceof Boolean b ? b : null;
        Integer lastKpId = body.get("lastKpId") instanceof Number n ? n.intValue() : null;
        return service.saveProgress(uid, sectionId, progressPct, learned, lastKpId);
    }

    /** 节阅读器：GET /api/knowledge/section/123?page=1&size=60 */
    @GetMapping("/section/{id}")
    public ResponseEntity<?> section(@PathVariable int id,
                                     @RequestParam(defaultValue = "1") int page,
                                     @RequestParam(defaultValue = "60") int size) {
        Map<String, Object> data = service.section(id, page, size);
        if (data == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("message", "章节不存在"));
        }
        return ResponseEntity.ok(data);
    }

    /** 单条知识点：GET /api/knowledge/123 */
    @GetMapping("/{id}")
    public ResponseEntity<?> detail(@PathVariable int id) {
        Map<String, Object> data = service.detail(id);
        if (data == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("message", "知识点不存在"));
        }
        return ResponseEntity.ok(data);
    }
}
