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
    void saveProgressUpsertsAndReturnsPersistedValues() {
        ChapterRepository chapterRepo = mock(ChapterRepository.class);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        // 部分更新只传 learned=true、progressPct=null 时，应返回数据库保留的真实 progressPct=85
        when(jdbc.queryForList(contains("insert into user_knowledge_progress"), any(Object[].class)))
                .thenReturn(List.of(Map.of("progressPct", 85, "learned", true)));

        KnowledgeService service = new KnowledgeService(chapterRepo, jdbc, new ObjectMapper());
        Map<String, Object> res = service.saveProgress(uid, 238, null, true, 30314);

        assertThat(res.get("ok")).isEqualTo(true);
        assertThat(res.get("sectionId")).isEqualTo(238);
        assertThat(res.get("progressPct")).isEqualTo(85);
        assertThat(res.get("learned")).isEqualTo(true);
        verify(jdbc).queryForList(contains("returning progress_pct"), any(Object[].class));
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
    @SuppressWarnings("unchecked")
    void searchSearchesPublishedRevisionSearchText() {
        ChapterRepository chapterRepo = mock(ChapterRepository.class);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);

        when(jdbc.queryForObject(contains("from kb_entry e"), eq(Integer.class), eq("main"), eq("%main%"), eq("%main%"), eq("%main%")))
                .thenReturn(1);
        when(jdbc.queryForList(contains("order by"),
                eq("main"), eq("%main%"), eq("%main%"), eq("%main%"),
                eq("main"), eq("main"), eq("%main%"), eq("%main%"),
                eq("main"), eq("main"), eq(20), eq(0)))
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
        List<Map<String, Object>> rows = (List<Map<String, Object>>) res.get("rows");
        assertThat(rows).hasSize(1);
        assertThat(rows.get(0).get("content")).isEqualTo("main 函数是唯一入口");
        // 确保检索 SQL 具备相关性排序：代码精确匹配 -> 代码包含 -> 标题匹配 -> 正文命中位置
        verify(jdbc).queryForList(contains("lower(c.code) = lower(?)"), any(Object[].class));
    }

    @Test
    @SuppressWarnings("unchecked")
    void searchCentersSnippetAroundLateKeywordHit() {
        ChapterRepository chapterRepo = mock(ChapterRepository.class);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        String longBody = "1、排序基本概念与选择排序、冒泡排序、快速排序与直接插入排序对比说明，前置内容非常长用于模拟真实长篇讲义。"
                + "A".repeat(140)
                + "8、二分查找（折半查找）要求线性表有序且支持随机访问，每次将待查区间缩小一半。";

        when(jdbc.queryForObject(contains("from kb_entry e"), eq(Integer.class), any(Object[].class)))
                .thenReturn(1);
        when(jdbc.queryForList(contains("from kb_entry e"), any(Object[].class)))
                .thenReturn(List.of(Map.of(
                        "id", 263, "nodeId", 263, "sectionId", 259,
                        "nodeCode", "S1-6.4", "nodeName", "使用一维数组解决批量数据查找或排序等问题",
                        "title", "使用一维数组解决批量数据查找或排序等问题", "section", "数组的应用",
                        "content", longBody, "importance", "",
                        "questionCount", 12
                )));

        KnowledgeService service = new KnowledgeService(chapterRepo, jdbc, new ObjectMapper());
        Map<String, Object> res = service.search("二分查找", 1, 20);

        List<Map<String, Object>> rows = (List<Map<String, Object>>) res.get("rows");
        String snippet = String.valueOf(rows.get(0).get("content"));
        assertThat(snippet).contains("二分查找");
        assertThat(snippet).startsWith("…");
        assertThat(snippet.length()).isLessThanOrEqualTo(140);
    }

    @Test
    void extractSnippetHandlesEdgesAndCaseInsensitivity() {
        assertThat(KnowledgeService.extractSnippet(null, "kw", 160)).isEmpty();
        assertThat(KnowledgeService.extractSnippet("   ", "kw", 160)).isEmpty();

        // 命中位于开头附近时不加前省略号
        String head = "二分查找（折半查找）需要有序数组。" + "B".repeat(200);
        String headSnippet = KnowledgeService.extractSnippet(head, "二分查找", 100);
        assertThat(headSnippet).startsWith("二分查找");
        assertThat(headSnippet).endsWith("…");

        // 命中位于末尾时不加后省略号
        String tail = "C".repeat(200) + "最终核心结论：Time Complexity is O(log n)。";
        String tailSnippet = KnowledgeService.extractSnippet(tail, "time complexity", 80);
        assertThat(tailSnippet).startsWith("…");
        assertThat(tailSnippet).contains("Time Complexity");
        assertThat(tailSnippet).doesNotEndWith("…");

        // 仅标题命中、正文不含关键词时回退开头摘要
        String fallback = "这里是一段较长的导论正文。" + "D".repeat(200);
        String fallbackSnippet = KnowledgeService.extractSnippet(fallback, "不存在的词", 80);
        assertThat(fallbackSnippet).startsWith("这里是一段较长的导论正文。");
        assertThat(fallbackSnippet).endsWith("…");
    }

    @Test
    @SuppressWarnings("unchecked")
    void listSearchesChapterSubtreeWithRelevanceAndSnippets() {
        ChapterRepository chapterRepo = mock(ChapterRepository.class);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        String longBody = "X".repeat(160) + "顺序表与二分查找时间复杂度分析。";

        when(jdbc.queryForObject(contains("with recursive sub as"), eq(Integer.class),
                eq(258), eq("二分查找"), eq("%二分查找%"), eq("%二分查找%"), eq("%二分查找%")))
                .thenReturn(1);
        when(jdbc.queryForList(contains("with recursive sub as"),
                eq(258), eq("二分查找"), eq("%二分查找%"), eq("%二分查找%"), eq("%二分查找%"),
                eq("二分查找"), eq("二分查找"), eq("%二分查找%"), eq("%二分查找%"),
                eq("二分查找"), eq("二分查找"), eq(20), eq(0)))
                .thenReturn(List.of(Map.of(
                        "id", 263, "nodeId", 263, "sectionId", 259,
                        "nodeCode", "S1-6.4", "nodeName", "一维数组查找与排序",
                        "title", "一维数组查找与排序", "section", "数组的应用",
                        "content", longBody, "importance", "", "questionCount", 12
                )));

        KnowledgeService service = new KnowledgeService(chapterRepo, jdbc, new ObjectMapper());
        Map<String, Object> res = service.list(258, "二分查找", 1, 20);

        assertThat(res.get("total")).isEqualTo(1);
        List<Map<String, Object>> rows = (List<Map<String, Object>>) res.get("rows");
        assertThat(String.valueOf(rows.get(0).get("content"))).startsWith("…").contains("二分查找");
    }

    @Test
    void searchEscapesLikeWildcards() {
        ChapterRepository chapterRepo = mock(ChapterRepository.class);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);

        when(jdbc.queryForObject(contains("escape '\\'"), eq(Integer.class), any(Object[].class)))
                .thenReturn(0);
        when(jdbc.queryForList(contains("escape '\\'"), any(Object[].class)))
                .thenReturn(List.of());

        KnowledgeService service = new KnowledgeService(chapterRepo, jdbc, new ObjectMapper());
        service.search("100%_test", 1, 20);

        verify(jdbc).queryForObject(contains("escape '\\'"), eq(Integer.class),
                eq("100%_test"), eq("%100\\%\\_test%"), eq("%100\\%\\_test%"), eq("%100\\%\\_test%"));
    }
}
