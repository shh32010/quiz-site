package com.quiz.chapter;

import java.util.ArrayList;
import java.util.List;

/**
 * 章节树节点（对外 DTO）。questionCount 为整棵子树的题数。
 */
public record ChapterNode(
        Integer id,
        Integer subjectId,
        String code,
        String name,
        short level,
        int questionCount,
        List<ChapterNode> children
) {
    public static ChapterNode leaf(Chapter c, int count) {
        return new ChapterNode(c.getId(), c.getSubjectId(), c.getCode(), c.getName(),
                c.getLevel() == null ? 0 : c.getLevel(), count, new ArrayList<>());
    }
}
