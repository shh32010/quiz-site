package com.quiz.report;

import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.contains;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * 学习报告控制器单元测试：验证总进度与章节/节级掌握度单次 CTE 聚合。
 */
class ReportControllerTest {

    @Test
    void progressCalculatesPercentageWithoutFullTableLeftJoin() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForMap(contains("count(distinct pa.question_id)"), eq(uid)))
                .thenReturn(Map.of("total", 44455, "answered", 445));

        ReportController controller = new ReportController(jdbc);
        Map<String, Object> res = controller.progress(uid);

        assertThat(res.get("total")).isEqualTo(44455);
        assertThat(res.get("answered")).isEqualTo(445);
        assertThat(res.get("pct")).isEqualTo(1);
    }

    @Test
    @SuppressWarnings("unchecked")
    void reportAggregatesChapterMasteryAndSectionsFromSingleRecursiveQuery() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForMap(contains("from practice_answer"), eq(uid)))
                .thenReturn(Map.of("answered", 10, "correct", 8, "activeDays", 2, "score", 16));
        when(jdbc.queryForList(contains("from practice_session"), eq(uid)))
                .thenReturn(List.of());
        when(jdbc.queryForMap(contains("from wrong_question"), eq(uid)))
                .thenReturn(Map.of("total", 2, "pending", 1));
        when(jdbc.queryForList(contains("with recursive anc"), eq(uid)))
                .thenReturn(List.of(
                        Map.of("chapterCode", "A1", "chapterName", "信息技术概述",
                                "sectionCode", "1.1", "sectionName", "信息与信息技术",
                                "total", 6L, "correct", 5L, "rate", 83L),
                        Map.of("chapterCode", "A1", "chapterName", "信息技术概述",
                                "sectionCode", "1.2", "sectionName", "数字技术基础",
                                "total", 4L, "correct", 3L, "rate", 75L)
                ));
        when(jdbc.queryForList(contains("c.level = 3"), eq(uid)))
                .thenReturn(List.of(
                        Map.of("id", 239, "nodeId", 239, "sectionId", 238, "title", "S1-1.1 程序的构成",
                                "wrongCount", 1L, "totalCount", 3L, "accuracy", 67L)
                ));

        ReportController controller = new ReportController(jdbc);
        Map<String, Object> report = controller.report(uid);

        List<Map<String, Object>> mastery = (List<Map<String, Object>>) report.get("mastery");
        List<Map<String, Object>> sections = (List<Map<String, Object>>) report.get("sections");
        List<Map<String, Object>> kps = (List<Map<String, Object>>) report.get("kps");

        assertThat(sections).hasSize(2);
        assertThat(mastery).hasSize(1);
        assertThat(mastery.getFirst().get("code")).isEqualTo("A1");
        assertThat(mastery.getFirst().get("total")).isEqualTo(10L);
        assertThat(mastery.getFirst().get("correct")).isEqualTo(8L);
        assertThat(mastery.getFirst().get("rate")).isEqualTo(80L);
        assertThat(kps).hasSize(1);
        assertThat(kps.getFirst().get("nodeId")).isEqualTo(239);
        assertThat(kps.getFirst().get("sectionId")).isEqualTo(238);
    }
}
