package com.quiz.announcement;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

class AnnouncementControllerTest {

    private JdbcTemplate jdbc;
    private AnnouncementController controller;

    @BeforeEach
    void setUp() {
        jdbc = mock(JdbcTemplate.class);
        controller = new AnnouncementController(jdbc, new ObjectMapper());
    }

    @Test
    void getAnnouncementFallsBackToDefaultWhenDbEmpty() {
        when(jdbc.queryForList(anyString())).thenReturn(List.of());

        Map<String, Object> res = controller.getAnnouncement();
        assertNotNull(res.get("version"));
        assertNotNull(res.get("title"));
        assertTrue(res.get("items") instanceof List<?>);
        assertTrue(res.get("history") instanceof List<?>);
    }

    @Test
    void updateAnnouncementValidatesRequiredFieldsAndPersists() {
        assertThrows(IllegalArgumentException.class, () -> controller.updateAnnouncement(Map.of("version", "", "title", "标题")));
        assertThrows(IllegalArgumentException.class, () -> controller.updateAnnouncement(Map.of("version", "2026-11-02-3", "title", "  ")));

        when(jdbc.queryForList(anyString())).thenReturn(List.of());
        Map<String, Object> payload = Map.of(
                "version", "2026-11-02-3",
                "title", "新公告标题",
                "subtitle", "副标题",
                "date", "2026 年 11 月 2 日",
                "footnote", "底部说明",
                "items", List.of(Map.of("tag", "更新", "title", "条目1", "desc", "说明1")),
                "history", List.of(Map.of("date", "2026-11-02", "text", "后台热更新公告"))
        );

        Map<String, Object> saved = controller.updateAnnouncement(payload);
        assertEquals("2026-11-02-3", saved.get("version"));
        assertEquals("新公告标题", saved.get("title"));
        verify(jdbc).update(contains("insert into site_announcement"),
                eq("2026-11-02-3"), eq("新公告标题"), eq("副标题"),
                eq("2026 年 11 月 2 日"), eq("底部说明"), anyString(), anyString());
    }
}
