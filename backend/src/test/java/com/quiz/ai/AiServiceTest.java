package com.quiz.ai;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.mockito.InOrder;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import java.time.Duration;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * AI 服务单元测试：验证缓存命中免配额、短事务解耦外部 HTTP 调用、weekly 配额与 Redis 缓存、上游错误脱敏。
 */
class AiServiceTest {

    /** 构造同步执行且可观测事务边界的 TransactionTemplate 替身 */
    private static TransactionTemplate recordingTx(AtomicBoolean inTx) {
        TransactionTemplate tx = mock(TransactionTemplate.class);
        when(tx.execute(any())).thenAnswer(inv -> {
            TransactionCallback<?> cb = inv.getArgument(0);
            inTx.set(true);
            try {
                return cb.doInTransaction(mock(TransactionStatus.class));
            } finally {
                inTx.set(false);
            }
        });
        return tx;
    }

    @Test
    void explainCacheHitSkipsQuotaAndModelCall() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        AtomicBoolean inTx = new AtomicBoolean(false);
        TransactionTemplate tx = recordingTx(inTx);
        StringRedisTemplate redis = mock(StringRedisTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForList(contains("from ai_explain_cache"), eq(1001), eq("explain")))
                .thenReturn(List.of(Map.of("answer_md", "已有讲解", "model", "deepseek-chat")));

        AtomicBoolean modelCalled = new AtomicBoolean(false);
        AiService service = new AiService(jdbc, tx, new ObjectMapper(), redis,
                "https://api.deepseek.com", "test-key", "deepseek-chat") {
            @Override
            protected String callModel(String system, String user) {
                modelCalled.set(true);
                return "不应调用";
            }
        };

        Map<String, Object> res = service.explain(uid, 1001, "explain");
        assertThat(res.get("cached")).isEqualTo(true);
        assertThat(res.get("content")).isEqualTo("已有讲解");
        assertThat(modelCalled.get()).isFalse();
        verify(tx, never()).execute(any());
        verify(jdbc, never()).queryForObject(contains("ai_quota_take"), eq(Integer.class));
    }

    @Test
    void explainCallsModelOutsideTransactionAfterTakingQuota() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        AtomicBoolean inTx = new AtomicBoolean(false);
        TransactionTemplate tx = recordingTx(inTx);
        StringRedisTemplate redis = mock(StringRedisTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForList(contains("from ai_explain_cache"), eq(1002), eq("explain")))
                .thenReturn(List.of());
        when(jdbc.queryForList(contains("from t_question where id = ?"), eq(1002)))
                .thenReturn(List.of(Map.of("stem", "测试题干", "option_json", "{}", "analysis", "测试解析")));
        when(jdbc.queryForObject(startsWith("select set_config"), eq(String.class), eq(uid.toString())))
                .thenReturn("");
        when(jdbc.queryForObject("select ai_quota_take(50)", Integer.class)).thenReturn(1);

        AtomicBoolean modelSawOpenTx = new AtomicBoolean(true);
        AiService service = new AiService(jdbc, tx, new ObjectMapper(), redis,
                "https://api.deepseek.com", "test-key", "deepseek-chat") {
            @Override
            protected String callModel(String system, String user) {
                modelSawOpenTx.set(inTx.get());
                return "新生成讲解";
            }
        };

        Map<String, Object> res = service.explain(uid, 1002, "explain");

        assertThat(res.get("cached")).isEqualTo(false);
        assertThat(res.get("content")).isEqualTo("新生成讲解");
        // 核心断言：外部模型调用必须在数据库连接事务提交之后执行
        assertThat(modelSawOpenTx.get()).isFalse();

        InOrder order = inOrder(tx, jdbc);
        order.verify(tx).execute(any());
        order.verify(jdbc).update(contains("insert into ai_explain_cache"), eq(1002), eq("explain"), eq("新生成讲解"), eq("deepseek-chat"));
    }

    @Test
    @SuppressWarnings("unchecked")
    void weeklyEnforcesQuotaAndCachesResultInRedis() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        AtomicBoolean inTx = new AtomicBoolean(false);
        TransactionTemplate tx = recordingTx(inTx);
        StringRedisTemplate redis = mock(StringRedisTemplate.class);
        ValueOperations<String, String> valueOps = mock(ValueOperations.class);
        when(redis.opsForValue()).thenReturn(valueOps);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForList(contains("from wrong_question w"), eq(uid)))
                .thenReturn(List.of(Map.of("wrongCount", 3, "stem", "TCP 三次握手", "catL1", "A3", "catL3", "传输层")));
        when(valueOps.get(anyString())).thenReturn(null).thenReturn("缓存周报");
        when(jdbc.queryForObject(startsWith("select set_config"), eq(String.class), eq(uid.toString())))
                .thenReturn("");
        when(jdbc.queryForObject("select ai_quota_take(50)", Integer.class)).thenReturn(1);

        AtomicBoolean modelSawOpenTx = new AtomicBoolean(true);
        AiService service = new AiService(jdbc, tx, new ObjectMapper(), redis,
                "https://api.deepseek.com", "test-key", "deepseek-chat") {
            @Override
            protected String callModel(String system, String user) {
                modelSawOpenTx.set(inTx.get());
                return "最新周报";
            }
        };

        // 第一次：未命中缓存 -> 短事务扣配额 -> 事务外调模型 -> 写 Redis 缓存
        Map<String, Object> first = service.weekly(uid);
        assertThat(first.get("content")).isEqualTo("最新周报");
        assertThat(first.get("cached")).isEqualTo(false);
        assertThat(modelSawOpenTx.get()).isFalse();
        verify(jdbc, times(1)).queryForObject("select ai_quota_take(50)", Integer.class);
        verify(valueOps).set(startsWith("quiz:ai:weekly:" + uid + ":"), eq("最新周报"), any(Duration.class));

        // 第二次：命中缓存 -> 不再扣配额
        Map<String, Object> second = service.weekly(uid);
        assertThat(second.get("content")).isEqualTo("缓存周报");
        assertThat(second.get("cached")).isEqualTo(true);
        verify(jdbc, times(1)).queryForObject("select ai_quota_take(50)", Integer.class);
    }

    @Test
    void weeklyWithNoWrongsSkipsQuotaAndModel() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        TransactionTemplate tx = recordingTx(new AtomicBoolean(false));
        StringRedisTemplate redis = mock(StringRedisTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForList(contains("from wrong_question w"), eq(uid))).thenReturn(List.of());

        AiService service = new AiService(jdbc, tx, new ObjectMapper(), redis,
                "https://api.deepseek.com", "test-key", "deepseek-chat");
        Map<String, Object> res = service.weekly(uid);

        assertThat(res.get("count")).isEqualTo(0);
        verify(tx, never()).execute(any());
        verify(jdbc, never()).queryForObject(contains("ai_quota_take"), eq(Integer.class));
    }

    @Test
    void explainHidesUpstreamInternalErrorDetails() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        TransactionTemplate tx = recordingTx(new AtomicBoolean(false));
        StringRedisTemplate redis = mock(StringRedisTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForList(contains("from ai_explain_cache"), eq(1003), eq("explain"))).thenReturn(List.of());
        when(jdbc.queryForList(contains("from t_question where id = ?"), eq(1003)))
                .thenReturn(List.of(Map.of("stem", "题干", "option_json", "{}", "analysis", "解析")));
        when(jdbc.queryForObject(startsWith("select set_config"), eq(String.class), eq(uid.toString()))).thenReturn("");
        when(jdbc.queryForObject("select ai_quota_take(50)", Integer.class)).thenReturn(1);

        // 指向不可达的本地关闭端口，触发真实 RestClient 异常，验证对外错误消息不泄露 URL/细节
        AiService service = new AiService(jdbc, tx, new ObjectMapper(), redis,
                "http://127.0.0.1:1", "secret-token-xyz", "deepseek-chat");

        assertThatThrownBy(() -> service.explain(uid, 1003, "explain"))
                .isInstanceOf(IllegalStateException.class)
                .hasMessage("AI 服务暂时不可用，请稍后重试")
                .hasMessageNotContaining("127.0.0.1")
                .hasMessageNotContaining("secret");
    }
}
