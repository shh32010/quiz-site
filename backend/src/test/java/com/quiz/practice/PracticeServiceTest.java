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

        when(jdbc.queryForList(contains("from practice_session where id = ? and user_id = ?"), eq(10L), eq(uid)))
                .thenReturn(List.of(Map.of("finished", false)));
        when(jdbc.queryForObject(contains("from session_question sq"), eq(Integer.class), eq(10L), eq(1001)))
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

        when(jdbc.queryForList(contains("from practice_session where id = ? and user_id = ?"), eq(10L), eq(uid)))
                .thenReturn(List.of(Map.of("finished", false)));
        when(jdbc.queryForObject(contains("from session_question sq"), eq(Integer.class), eq(10L), eq(1001)))
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

    @Test
    void submitRejectsForeignSessionBeforeCheckingQuestionMembership() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID attacker = UUID.randomUUID();

        when(jdbc.queryForList(contains("from practice_session where id = ? and user_id = ?"), eq(999L), eq(attacker)))
                .thenReturn(List.of());

        PracticeService service = new PracticeService(jdbc);
        assertThatThrownBy(() -> service.submit(999L, 1001, "A", attacker))
                .isInstanceOf(IllegalStateException.class)
                .hasMessage("会话无效");
        // 未通过归属校验时，绝不能再去查 session_question，防止探测他人会话题目
        verify(jdbc, never()).queryForObject(contains("from session_question"), eq(Integer.class), any(), any());
    }

    @Test
    void nextExcludesSoftDeletedAnswersFromAnsweredCount() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForObject(startsWith("select count(*) from practice_session"), eq(Integer.class), eq(10L), eq(uid)))
                .thenReturn(1);
        when(jdbc.queryForList(contains("from session_question sq"), eq(10L)))
                .thenReturn(List.of());

        PracticeService service = new PracticeService(jdbc);
        Map<String, Object> res = service.next(10L, uid);

        assertThat(res.get("kind")).isEqualTo("done");
        verify(jdbc).queryForList(
                contains("select count(*) from practice_answer a where a.session_id = sq.session_id and a.deleted_at is null"),
                eq(10L));
    }

    @Test
    void wrongModeSupportsDueAndFrequentTargetFilters() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForList(contains("w.next_review_at <= now()"), eq(Integer.class), any(Object[].class)))
                .thenReturn(List.of(2001, 2002));
        when(jdbc.queryForObject(startsWith("insert into practice_session"), eq(Long.class), eq(uid), eq("wrong"), isNull()))
                .thenReturn(99L);

        PracticeService service = new PracticeService(jdbc);
        Map<String, Object> res = service.start(uid, "wrong", "due", 20, null);

        assertThat(res.get("sessionId")).isEqualTo(99L);
        assertThat(res.get("count")).isEqualTo(2);
        verify(jdbc).queryForList(contains("not w.resolved and (w.next_review_at is null or w.next_review_at <= now())"),
                eq(Integer.class), any(Object[].class));
    }

    @Test
    void kpModeQueriesBothChapterIdAndQuestionKp() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForList(contains("q.chapter_id = ? or q.id in (select x.question_id from t_question_kp"),
                eq(Integer.class), eq(239), eq(239), eq(20)))
                .thenReturn(List.of(101, 102));
        when(jdbc.queryForObject(startsWith("insert into practice_session"), eq(Long.class), eq(uid), eq("kp"), eq(239)))
                .thenReturn(100L);

        PracticeService service = new PracticeService(jdbc);
        Map<String, Object> res = service.start(uid, "kp", "239", 20, null);

        assertThat(res.get("sessionId")).isEqualTo(100L);
        assertThat(res.get("count")).isEqualTo(2);
    }

    @Test
    void chapterRandomStatusUsesQuestionCountTimes75AndDisablesAutoSubmit() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForObject(startsWith("select count(*) from practice_session"), eq(Integer.class), eq(88L), eq(uid)))
                .thenReturn(1);
        // 未超时：40 题 -> 3000 秒，已用时 120 秒
        when(jdbc.queryForMap(contains("when s.mode = 'chapter_random'"), eq(88L)))
                .thenReturn(Map.of(
                        "startedAt", "2026-11-13T09:00:00Z",
                        "mode", "chapter_random",
                        "limitSec", 3000,
                        "elapsedSec", 120));

        PracticeService service = new PracticeService(jdbc);
        Map<String, Object> active = service.status(88L, uid);
        assertThat(active.get("mode")).isEqualTo("chapter_random");
        assertThat(active.get("limitSec")).isEqualTo(3000);
        assertThat(active.get("remainingSec")).isEqualTo(2880);
        assertThat(active.get("overtimeSec")).isEqualTo(0);
        assertThat(active.get("expired")).isEqualTo(false);
        assertThat(active.get("autoSubmit")).isEqualTo(false);

        // 已超时：24 题 -> 1800 秒，已用时 1935 秒 -> 只提醒不强制（autoSubmit=false, overtimeSec=135）
        when(jdbc.queryForMap(contains("when s.mode = 'chapter_random'"), eq(88L)))
                .thenReturn(Map.of(
                        "startedAt", "2026-11-13T09:00:00Z",
                        "mode", "chapter_random",
                        "limitSec", 1800,
                        "elapsedSec", 1935));

        Map<String, Object> overtime = service.status(88L, uid);
        assertThat(overtime.get("limitSec")).isEqualTo(1800);
        assertThat(overtime.get("remainingSec")).isEqualTo(0);
        assertThat(overtime.get("overtimeSec")).isEqualTo(135);
        assertThat(overtime.get("expired")).isEqualTo(true);
        assertThat(overtime.get("autoSubmit")).isEqualTo(false);
    }

    @Test
    void paperAndRandomStatusKeepAutoSubmitEnabledWhenTimed() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForObject(startsWith("select count(*) from practice_session"), eq(Integer.class), eq(77L), eq(uid)))
                .thenReturn(1);
        when(jdbc.queryForMap(contains("when s.mode = 'chapter_random'"), eq(77L)))
                .thenReturn(Map.of(
                        "startedAt", "2026-11-13T09:00:00Z",
                        "mode", "random",
                        "limitSec", 6000,
                        "elapsedSec", 6005));

        PracticeService service = new PracticeService(jdbc);
        Map<String, Object> res = service.status(77L, uid);
        assertThat(res.get("expired")).isEqualTo(true);
        assertThat(res.get("autoSubmit")).isEqualTo(true);
        assertThat(res.get("remainingSec")).isEqualTo(0);
    }
}
