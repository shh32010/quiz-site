package com.quiz.practice;

import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * 刷题服务单元测试：验证每日 200 题限额、同题重做免占新额度与 admin/unlimited 免限角色。
 */
class PracticeServiceTest {

    @Test
    void regularUserBlockedWhen200OtherQuestionsAlreadyAnsweredToday() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForObject(startsWith("select count(*)"), eq(Integer.class), eq(10L), eq(1001)))
                .thenReturn(1);
        when(jdbc.queryForObject(eq("select role from profiles where id = ?"), eq(String.class), eq(uid)))
                .thenReturn("user");
        when(jdbc.queryForList(startsWith("select pg_advisory_xact_lock"), anyString()))
                .thenReturn(List.of());
        // 除当前题 1001 以外，今日已答满 200 道不同题 -> 拦截第 201 道新题
        when(jdbc.queryForObject(contains("count(distinct question_id)"), eq(Integer.class), eq(uid), eq(1001)))
                .thenReturn(200);

        PracticeService service = new PracticeService(jdbc);
        assertThatThrownBy(() -> service.submit(10L, 1001, "A", uid))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("200 题上限");
    }

    @Test
    void unlimitedAndAdminRolesBypassDailyLimit() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForObject(startsWith("select count(*)"), eq(Integer.class), eq(10L), eq(1001)))
                .thenReturn(1);
        when(jdbc.queryForObject(eq("select role from profiles where id = ?"), eq(String.class), eq(uid)))
                .thenReturn("unlimited");
        when(jdbc.queryForObject(startsWith("select set_config"), eq(String.class), anyString()))
                .thenReturn("");
        when(jdbc.queryForObject(startsWith("select submit_answer"), eq(String.class), eq(10L), eq(1001), eq("A")))
                .thenReturn("{\"is_correct\":true,\"score_got\":2,\"max_score\":2}");

        PracticeService service = new PracticeService(jdbc);
        Map<String, Object> res = service.submit(10L, 1001, "A", uid);

        assertThat(res.get("is_correct")).isEqualTo(true);
        verify(jdbc, never()).queryForObject(contains("count(distinct question_id)"), eq(Integer.class), any(), any());
    }
}
