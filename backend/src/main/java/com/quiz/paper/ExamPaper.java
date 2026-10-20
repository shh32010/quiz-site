package com.quiz.paper;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

/**
 * 真题卷。
 */
@Entity
@Table(name = "t_exam_paper")
@Getter
@Setter
public class ExamPaper {

    @Id
    private Integer id;

    private String name;

    @Column(name = "subject_id")
    private Integer subjectId;

    @Column(name = "paper_type")
    private Integer paperType;

    private Integer score;

    @Column(name = "question_count")
    private Integer questionCount;

    @Column(name = "suggest_time")
    private Integer suggestTime;

    private Boolean deleted;
}
