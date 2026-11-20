package com.quiz.compose;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * 随机组卷服务单元测试：验证多桶回填准确性与章节组卷统计/抽题口径一致。
 */
class ComposeServiceTest {

    @Test
    void startBackfillsSecondBucketEvenWhenFirstBucketAlreadyPickedSameType() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();
        AtomicInteger seq = new AtomicInteger(1000);

        // 模拟理论卷（subject=4）：
        // - CODES_A 所有题型/难度都满额抽齐
        // - CODES_B 单选（type=1）按难度抽每档只返回 1 题（共 3 题，缺 17 题），不限难度回填时补齐 17 题
        when(jdbc.queryForList(
                eq("select pick_questions_for_user(?, ?, ?, ?, ?, ?, ?)"),
                eq(Integer.class),
                eq(uid), eq(4), anyInt(), any(String[].class), anyInt(), any(), any()))
                .thenAnswer(inv -> {
                    int type = inv.getArgument(4);
                    String[] codes = inv.getArgument(5);
                    int count = inv.getArgument(6);
                    Integer diff = inv.getArgument(7);
                    boolean isB = codes.length > 0 && codes[0].startsWith("B");
                    int returnCount = (isB && type == 1 && diff != null) ? 1 : count;
                    Integer[] out = new Integer[returnCount];
                    for (int i = 0; i < returnCount; i++) {
                        out[i] = seq.incrementAndGet();
                    }
                    return Arrays.asList(out);
                });

        when(jdbc.queryForObject(contains("insert into practice_session"), eq(Long.class), eq(uid), eq(4)))
                .thenReturn(501L);

        ComposeService service = new ComposeService(jdbc);
        Map<String, Object> res = service.start(uid, 4);

        assertThat(res.get("sessionId")).isEqualTo(501L);
        // 理论总题量：单选 50 + 多选 10 + 判断 10 + 填空 10 = 80
        assertThat(res.get("count")).isEqualTo(80);
        // 关键断言：CODES_B 单选（目标 20，按难度抽到 3）必须触发一次 difficult=null 且 count=17 的回填
        verify(jdbc).queryForList(
                eq("select pick_questions_for_user(?, ?, ?, ?, ?, ?, ?)"),
                eq(Integer.class),
                eq(uid), eq(4), eq(1),
                argThat((String[] codes) -> codes != null && codes.length > 0 && "B1".equals(codes[0])),
                eq(17),
                isNull(),
                any());
    }

    @Test
    void startChapterUsesSameStandardScoreAndNotDeletedFilterForCountAndPick() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForList(contains("from t_chapter where id = ? and not deleted"), eq(10)))
                .thenReturn(List.of(Map.of("subject_id", 4, "level", 2)));

        // 统计章内可练标准分值题数为 2（模拟总题多但标准分值题仅 2 道）
        ArgumentCaptor<String> countSqlCaptor = ArgumentCaptor.forClass(String.class);
        when(jdbc.queryForObject(countSqlCaptor.capture(), eq(Integer.class), any(Object[].class)))
                .thenReturn(2);

        // target=2 时按理论配比只为单选分配 2 题；模拟单选只抽到 1 题，其余 1 题由补齐阶段抽出
        when(jdbc.queryForList(contains("order by exists"), eq(Integer.class), any(Object[].class)))
                .thenReturn(List.of(301))
                .thenReturn(List.of(302));

        when(jdbc.queryForObject(contains("insert into practice_session"), eq(Long.class), eq(uid), eq(10)))
                .thenReturn(601L);

        ComposeService service = new ComposeService(jdbc);
        Map<String, Object> res = service.startChapter(uid, 10, 40, null);

        assertThat(res.get("sessionId")).isEqualTo(601L);
        assertThat(res.get("count")).isEqualTo(2);
        assertThat(res.get("requested")).isEqualTo(40);
        assertThat(res.get("shortfall")).isEqualTo(38);

        String countSql = countSqlCaptor.getValue();
        // 统计查询必须同时过滤已删除章节与大纲标准分值
        assertThat(countSql).contains("not deleted");
        assertThat(countSql).contains("q.score = case");
    }
}
