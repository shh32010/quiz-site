package com.quiz.practice;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import org.junit.jupiter.api.Test;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;

import java.time.Duration;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * 游客/随堂自测判分控制器单元测试：验证按 IP/用户分级日配额、同题重做免占、免限角色与 Redis 异常降级。
 */
class GuestControllerTest {

    @SuppressWarnings("unchecked")
    private static StringRedisTemplate inMemorySetRedis() {
        StringRedisTemplate redis = mock(StringRedisTemplate.class);
        SetOperations<String, String> setOps = mock(SetOperations.class);
        when(redis.opsForSet()).thenReturn(setOps);
        Map<String, Set<String>> store = new java.util.concurrent.ConcurrentHashMap<>();

        when(setOps.isMember(anyString(), any())).thenAnswer(inv -> {
            Set<String> s = store.get(inv.getArgument(0));
            return s != null && s.contains(String.valueOf(inv.getArgument(1)));
        });
        when(setOps.add(anyString(), any(String[].class))).thenAnswer(inv -> {
            String key = inv.getArgument(0);
            String[] values = inv.getArgument(1);
            Set<String> s = store.computeIfAbsent(key, k -> new HashSet<>());
            long added = 0;
            for (String v : values) {
                if (s.add(v)) added++;
            }
            return added;
        });
        when(setOps.size(anyString())).thenAnswer(inv -> {
            Set<String> s = store.get(inv.getArgument(0));
            return s == null ? 0L : (long) s.size();
        });
        when(setOps.remove(anyString(), any(Object[].class))).thenAnswer(inv -> {
            Set<String> s = store.get(inv.getArgument(0));
            if (s == null) return 0L;
            Object[] values = inv.getArgument(1);
            long removed = 0;
            for (Object v : values) {
                if (s.remove(String.valueOf(v))) removed++;
            }
            return removed;
        });
        when(redis.expire(anyString(), any(Duration.class))).thenReturn(true);
        return redis;
    }

    private static void stubJudge(JdbcTemplate jdbc) {
        when(jdbc.queryForObject(eq("select judge_answer(?, ?)::text"), eq(String.class), anyInt(), anyString()))
                .thenReturn("{\"is_correct\":true,\"score_got\":2,\"max_score\":2,\"correct\":\"A\",\"analysis\":\"解析\"}");
        when(jdbc.queryForObject(eq("select qc_grade from t_question where id = ?"), eq(String.class), anyInt()))
                .thenReturn("good");
    }

    @Test
    void anonymousGuestLimitedTo20DistinctQuestionsPerDayAndAllowsRetry() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        stubJudge(jdbc);
        StringRedisTemplate redis = inMemorySetRedis();
        HttpServletRequest req = mock(HttpServletRequest.class);
        when(req.getHeader("X-Real-IP")).thenReturn("203.0.113.10");

        GuestController controller = new GuestController(jdbc, new ObjectMapper(), redis);

        // 前 20 道不同题正常放行
        for (int qid = 1; qid <= 20; qid++) {
            ResponseEntity<?> resp = controller.answer(null, new GuestController.Req(qid, "A"), req);
            assertThat(resp.getStatusCode()).isEqualTo(HttpStatus.OK);
        }

        // 重做今天已答过的第 1 题：不占新额度，允许通过
        ResponseEntity<?> retry = controller.answer(null, new GuestController.Req(1, "B"), req);
        assertThat(retry.getStatusCode()).isEqualTo(HttpStatus.OK);

        // 第 21 道新题：返回 429 拦截，且绝不调用 judge_answer
        ResponseEntity<?> blocked = controller.answer(null, new GuestController.Req(21, "A"), req);
        assertThat(blocked.getStatusCode()).isEqualTo(HttpStatus.TOO_MANY_REQUESTS);
        assertThat(String.valueOf(blocked.getBody())).contains("20 题上限");
        verify(jdbc, never()).queryForObject(eq("select judge_answer(?, ?)::text"), eq(String.class), eq(21), anyString());
    }

    @Test
    void loggedInAdminAndUnlimitedBypassGuestDailyLimit() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        stubJudge(jdbc);
        StringRedisTemplate redis = mock(StringRedisTemplate.class);
        HttpServletRequest req = mock(HttpServletRequest.class);
        UUID adminId = UUID.randomUUID();

        when(jdbc.queryForList(eq("select role from profiles where id = ?"), eq(adminId)))
                .thenReturn(List.of(Map.of("role", "admin")));

        GuestController controller = new GuestController(jdbc, new ObjectMapper(), redis);
        ResponseEntity<?> resp = controller.answer(adminId, new GuestController.Req(100, "A"), req);

        assertThat(resp.getStatusCode()).isEqualTo(HttpStatus.OK);
        verify(redis, never()).opsForSet();
    }

    @Test
    void loggedInRegularUserAllowedUpTo200DistinctQuestions() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        stubJudge(jdbc);
        StringRedisTemplate redis = inMemorySetRedis();
        HttpServletRequest req = mock(HttpServletRequest.class);
        UUID userId = UUID.randomUUID();

        when(jdbc.queryForList(eq("select role from profiles where id = ?"), eq(userId)))
                .thenReturn(List.of(Map.of("role", "user")));

        GuestController controller = new GuestController(jdbc, new ObjectMapper(), redis);
        // 第 1~200 题放行，超过游客 20 题上限但不超过普通用户 200 题上限
        for (int qid = 1; qid <= 200; qid++) {
            assertThat(controller.answer(userId, new GuestController.Req(qid, "A"), req).getStatusCode())
                    .isEqualTo(HttpStatus.OK);
        }
        // 第 201 题被拦截
        ResponseEntity<?> blocked = controller.answer(userId, new GuestController.Req(201, "A"), req);
        assertThat(blocked.getStatusCode()).isEqualTo(HttpStatus.TOO_MANY_REQUESTS);
        assertThat(String.valueOf(blocked.getBody())).contains("200 题上限");
    }

    @Test
    void redisFailureFallsBackToLocalMemoryLimitInsteadOfOpeningHole() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        stubJudge(jdbc);
        StringRedisTemplate redis = mock(StringRedisTemplate.class);
        when(redis.opsForSet()).thenThrow(new RuntimeException("redis down"));
        HttpServletRequest req = mock(HttpServletRequest.class);
        when(req.getHeader("X-Real-IP")).thenReturn("198.51.100.8");

        GuestController controller = new GuestController(jdbc, new ObjectMapper(), redis);

        for (int qid = 1; qid <= 20; qid++) {
            assertThat(controller.answer(null, new GuestController.Req(qid, "A"), req).getStatusCode())
                    .isEqualTo(HttpStatus.OK);
        }
        assertThat(controller.answer(null, new GuestController.Req(21, "A"), req).getStatusCode())
                .isEqualTo(HttpStatus.TOO_MANY_REQUESTS);
    }

    @Test
    void rejectsMissingQuestionIdOrOversizedAnswer() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        GuestController controller = new GuestController(jdbc, new ObjectMapper(), inMemorySetRedis());
        HttpServletRequest req = mock(HttpServletRequest.class);

        assertThatThrownBy(() -> controller.answer(null, new GuestController.Req(null, "A"), req))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("questionId");

        assertThatThrownBy(() -> controller.answer(null, new GuestController.Req(1, "x".repeat(10001)), req))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("答案过长");
    }
}
