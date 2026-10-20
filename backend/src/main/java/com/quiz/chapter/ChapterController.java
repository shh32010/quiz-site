package com.quiz.chapter;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 章节浏览接口（只读）。
 */
@RestController
@RequestMapping("/api")
public class ChapterController {

    private final ChapterService chapterService;

    public ChapterController(ChapterService chapterService) {
        this.chapterService = chapterService;
    }

    /**
     * 章节树：GET /api/chapters/tree?subject=4
     * 不传 subject 返回全部学科。
     */
    @GetMapping("/chapters/tree")
    public List<ChapterNode> tree(@RequestParam(required = false) Integer subject) {
        return chapterService.tree(subject);
    }

    /** 课程级统计：GET /api/courses */
    @GetMapping("/courses")
    public List<Map<String, Object>> courses() {
        return chapterService.courseCounts();
    }
}
