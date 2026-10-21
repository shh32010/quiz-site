package com.quiz.knowledge;

import com.quiz.chapter.Chapter;

import java.util.ArrayList;
import java.util.List;

/**
 * 知识点树节点（对外 DTO）。kpCount 为整棵子树的知识点数。
 */
public record KnowledgeNode(
        Integer id,
        Integer subjectId,
        String code,
        String name,
        short level,
        int kpCount,
        List<KnowledgeNode> children
) {
    public static KnowledgeNode leaf(Chapter c, int count) {
        return new KnowledgeNode(c.getId(), c.getSubjectId(), c.getCode(), c.getName(),
                c.getLevel() == null ? 0 : c.getLevel(), count, new ArrayList<>());
    }
}
