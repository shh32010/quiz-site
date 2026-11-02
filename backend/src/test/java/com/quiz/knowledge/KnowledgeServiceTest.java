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
        when(jdbc.queryForObject(contains("select count(*) from t_knowledge_point"), eq(Integer.class), eq(238)))
                .thenReturn(55);
        when(jdbc.queryForList(contains("select k.id, k.node_id"), eq(238), eq(60), eq(0)))
                .thenReturn(List.of());
        when(jdbc.queryForList(contains("select k.id as \"kpId\""), eq(238), eq(60), eq(0)))
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
}
