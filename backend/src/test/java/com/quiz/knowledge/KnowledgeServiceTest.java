package com.quiz.knowledge;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.quiz.chapter.ChapterRepository;
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
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 * 知识点服务单元测试：验证新旧双轨讲义加载（kb_entry + kb_revision）与服务端阅读进度同步。
 */
class KnowledgeServiceTest {

    @Test
    @SuppressWarnings("unchecked")
    void sectionReturnsPublishedStructuredEntriesAlongsideLegacyKps() {
        ChapterRepository chapterRepo = mock(ChapterRepository.class);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        ObjectMapper mapper = new ObjectMapper();

        when(jdbc.queryForList(contains("from t_chapter c"), eq(238)))
                .thenReturn(List.of(Map.of("id", 238, "code", "S1-1", "name", "C 语言程序的结构")));
        when(jdbc.queryForList(contains("select id, node_id as \"nodeId\""), eq(238)))
                .thenReturn(List.of());
        when(jdbc.queryForList(contains("join kb_entry e"), eq(238)))
                .thenReturn(List.of(Map.of(
                        "nodeId", 239,
                        "nodeCode", "S1-1.1",
                        "nodeName", "程序的构成，main 函数和其他函数。",
                        "revNo", 1,
                        "blocksJson", "[{\"t\":\"list\",\"imp\":\"core\",\"title\":\"C 源程序\",\"items\":[\"测试条目\"]}]"
                )));
        when(jdbc.queryForList(contains("select s.id as \"nodeId\", q.id"), eq(238)))
                .thenReturn(List.of(Map.of("nodeId", 239, "id", 366001, "questionType", 1, "stem", "C 程序入口函数是？")));

        KnowledgeService service = new KnowledgeService(chapterRepo, jdbc, mapper);
        Map<String, Object> result = service.section(238, 1, 60);

        assertThat(result).isNotNull();
        List<Map<String, Object>> entries = (List<Map<String, Object>>) result.get("entries");
        assertThat(entries).hasSize(1);
        assertThat(entries.getFirst().get("nodeCode")).isEqualTo("S1-1.1");
        List<Map<String, Object>> blocks = (List<Map<String, Object>>) entries.getFirst().get("blocks");
        assertThat(blocks).hasSize(1);
        assertThat(blocks.getFirst().get("imp")).isEqualTo("core");
    }

    @Test
    void saveProgressUpsertsUserKnowledgeProgress() {
        ChapterRepository chapterRepo = mock(ChapterRepository.class);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        KnowledgeService service = new KnowledgeService(chapterRepo, jdbc, new ObjectMapper());
        Map<String, Object> res = service.saveProgress(uid, 238, 85, true, 30314);

        assertThat(res.get("ok")).isEqualTo(true);
        assertThat(res.get("sectionId")).isEqualTo(238);
        assertThat(res.get("progressPct")).isEqualTo(85);
        assertThat(res.get("learned")).isEqualTo(true);
        verify(jdbc).update(contains("insert into user_knowledge_progress"), any(Object[].class));
    }

    @Test
    void detailResolvesChapterFirstThenFallsBackToLegacyKp() {
        ChapterRepository chapterRepo = mock(ChapterRepository.class);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);

        // 1. 传入三级章节 ID
        when(jdbc.queryForList(contains("from t_chapter c"), eq(239)))
                .thenReturn(List.of(Map.of("id", 239, "nodeId", 239, "sectionId", 238,
                        "nodeCode", "S1-1.1", "nodeName", "程序的构成", "title", "程序的构成", "section", "C 语言程序的结构")));

        // 2. 传入旧 kp ID（在 t_chapter 查不到）
        when(jdbc.queryForList(contains("from t_chapter c"), eq(9999)))
                .thenReturn(List.of());
        when(jdbc.queryForList(contains("from t_knowledge_point k"), eq(9999)))
                .thenReturn(List.of(Map.of("id", 9999, "nodeId", 239, "sectionId", 238,
                        "nodeCode", "S1-1.1", "nodeName", "程序的构成", "title", "main 函数", "importance", "core")));

        KnowledgeService service = new KnowledgeService(chapterRepo, jdbc, new ObjectMapper());

        Map<String, Object> chapterRes = service.detail(239);
        assertThat(chapterRes).isNotNull();
        assertThat(chapterRes.get("nodeId")).isEqualTo(239);
        assertThat(chapterRes.get("sectionId")).isEqualTo(238);

        Map<String, Object> kpRes = service.detail(9999);
        assertThat(kpRes).isNotNull();
        assertThat(kpRes.get("nodeId")).isEqualTo(239);
        assertThat(kpRes.get("sectionId")).isEqualTo(238);
        assertThat(kpRes.get("title")).isEqualTo("main 函数");
    }

    @Test
    void searchSearchesPublishedRevisionSearchText() {
        ChapterRepository chapterRepo = mock(ChapterRepository.class);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);

        when(jdbc.queryForObject(contains("from kb_entry e"), eq(Integer.class), eq("main"), eq("%main%"), eq("%main%"), eq("%main%")))
                .thenReturn(1);
        when(jdbc.queryForList(contains("select c.id, c.id as \"nodeId\""), eq("main"), eq("%main%"), eq("%main%"), eq("%main%"), eq(20), eq(0)))
                .thenReturn(List.of(Map.of(
                        "id", 239, "nodeId", 239, "sectionId", 238,
                        "nodeCode", "S1-1.1", "nodeName", "程序的构成",
                        "title", "程序的构成", "section", "C 语言程序的结构",
                        "content", "main 函数是唯一入口", "importance", "必记",
                        "questionCount", 5
                )));

        KnowledgeService service = new KnowledgeService(chapterRepo, jdbc, new ObjectMapper());
        Map<String, Object> res = service.search("main", 1, 20);

        assertThat(res.get("total")).isEqualTo(1);
        List<?> rows = (List<?>) res.get("rows");
        assertThat(rows).hasSize(1);
    }
}
