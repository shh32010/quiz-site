package com.quiz.config;

import com.quiz.chapter.ChapterNode;
import com.quiz.knowledge.KnowledgeNode;
import org.junit.jupiter.api.Test;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;
import org.springframework.util.LinkedCaseInsensitiveMap;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

/**
 * Redis 缓存序列化安全测试：验证白名单内业务 DTO 正常往返，且拒绝任意非白名单类反序列化。
 */
class CacheConfigTest {

    @Test
    @SuppressWarnings("unchecked")
    void roundTripsCachedDomainDtosAndJdbcRows() {
        GenericJackson2JsonRedisSerializer serializer = CacheConfig.buildSerializer();

        // 1) ChapterNode（Java record，嵌套树）
        List<ChapterNode> chapters = new ArrayList<>();
        chapters.add(new ChapterNode(1, 4, "A1", "计算机硬件", (short) 1, 120,
                new ArrayList<>(List.of(new ChapterNode(2, 4, "A1-1", "数制转换", (short) 2, 40, new ArrayList<>())))));
        byte[] chapterBytes = serializer.serialize(chapters);
        List<ChapterNode> restoredChapters = (List<ChapterNode>) serializer.deserialize(chapterBytes);
        assertThat(restoredChapters).hasSize(1);
        assertThat(restoredChapters.getFirst()).isInstanceOf(ChapterNode.class);
        assertThat(restoredChapters.getFirst().children().getFirst().name()).isEqualTo("数制转换");

        // 2) KnowledgeNode（Java record）
        List<KnowledgeNode> kps = new ArrayList<>();
        kps.add(new KnowledgeNode(238, 5, "S1-1", "C 语言程序的结构", (short) 2, 3, new ArrayList<>()));
        List<KnowledgeNode> restoredKps = (List<KnowledgeNode>) serializer.deserialize(serializer.serialize(kps));
        assertThat(restoredKps).hasSize(1);
        assertThat(restoredKps.getFirst()).isInstanceOf(KnowledgeNode.class);
        assertThat(restoredKps.getFirst().kpCount()).isEqualTo(3);

        // 3) JdbcTemplate.queryForList 返回的 LinkedCaseInsensitiveMap（含 Long / Short / BigDecimal / OffsetDateTime / Timestamp / UUID）
        LinkedCaseInsensitiveMap<Object> row = new LinkedCaseInsensitiveMap<>();
        row.put("course", "A");
        row.put("cnt", 1234L);
        row.put("level", (short) 2);
        row.put("score", new BigDecimal("150.0"));
        row.put("updatedAt", OffsetDateTime.parse("2026-11-19T08:00:00+08:00"));
        row.put("ts", java.sql.Timestamp.from(java.time.Instant.parse("2026-11-19T00:00:00Z")));
        row.put("uid", java.util.UUID.fromString("11111111-1111-1111-1111-111111111111"));
        List<Map<String, Object>> rows = new ArrayList<>(List.of(row));
        List<Map<String, Object>> restoredRows = (List<Map<String, Object>>) serializer.deserialize(serializer.serialize(rows));
        assertThat(restoredRows).hasSize(1);
        assertThat(restoredRows.getFirst().get("course")).isEqualTo("A");
        assertThat(((Number) restoredRows.getFirst().get("cnt")).longValue()).isEqualTo(1234L);
        assertThat(((Number) restoredRows.getFirst().get("level")).shortValue()).isEqualTo((short) 2);

        // 4) 不可变空集合与 Map.of 也能正常往返
        Object emptyList = serializer.deserialize(serializer.serialize(List.of()));
        assertThat(emptyList).isInstanceOf(List.class);
        Object immutableMap = serializer.deserialize(serializer.serialize(Map.of("k", 1)));
        assertThat(immutableMap).isInstanceOf(Map.class);
    }

    @Test
    void rejectsArbitraryGadgetClassDeserialization() {
        GenericJackson2JsonRedisSerializer serializer = CacheConfig.buildSerializer();
        byte[] scriptEngine = """
                {"@class":"javax.script.ScriptEngineManager"}
                """.getBytes(StandardCharsets.UTF_8);
        byte[] processBuilder = """
                {"@class":"java.lang.ProcessBuilder","command":["echo","hi"]}
                """.getBytes(StandardCharsets.UTF_8);

        assertThatThrownBy(() -> serializer.deserialize(scriptEngine))
                .isInstanceOf(SerializationException.class);
        assertThatThrownBy(() -> serializer.deserialize(processBuilder))
                .isInstanceOf(SerializationException.class);
    }
}
