package com.quiz.chapter;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * 章节读取：只取未删除节点，按学科与排序号排列。
 */
public interface ChapterRepository extends JpaRepository<Chapter, Integer> {

    List<Chapter> findByDeletedFalseOrderBySubjectIdAscItemOrderAscIdAsc();
}
