package com.quiz.chapter;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

/**
 * 章节节点：L1 章/技能 → L2 节 → L3 目。
 */
@Entity
@Table(name = "t_chapter")
@Getter
@Setter
public class Chapter {

    @Id
    private Integer id;

    @Column(name = "subject_id")
    private Integer subjectId;

    @Column(name = "parent_id")
    private Integer parentId;

    private String name;

    /** 1=章/技能 2=节 3=目 */
    private Short level;

    @Column(name = "item_order")
    private Integer itemOrder;

    private String code;

    private Boolean deleted;
}
