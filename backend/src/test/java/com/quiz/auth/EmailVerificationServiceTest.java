package com.quiz.auth;

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
 * 邮箱验证服务单元测试：验证 60 秒发送冷却、正常消费令牌、已占用邮箱拦截与邮箱变更后旧链接失效。
 */
class EmailVerificationServiceTest {

    @Test
    void sendRespects60SecondCooldown() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        MailService mail = mock(MailService.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForObject(contains("from email_verification_token"), eq(Integer.class), eq(uid)))
                .thenReturn(1);

        EmailVerificationService service = new EmailVerificationService(jdbc, mail);
        boolean sent = service.send(uid, "user@example.com", "alice");

        assertThat(sent).isFalse();
        verify(mail, never()).sendVerificationLink(anyString(), anyString(), anyString());
    }

    @Test
    void verifyActivatesEmailAndRejectsTakenOrChangedEmail() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        MailService mail = mock(MailService.class);
        UUID uid = UUID.randomUUID();

        // 1) 正常验证通过
        when(jdbc.queryForList(contains("update email_verification_token"), anyString()))
                .thenReturn(List.of(Map.of("profile_id", uid.toString(), "email", "alice@example.com")));
        when(jdbc.queryForObject(contains("email_verified and id <> ?"), eq(Integer.class), eq("alice@example.com"), eq(uid)))
                .thenReturn(0);
        when(jdbc.update(contains("update profiles"), eq("alice@example.com"), eq(uid), eq("alice@example.com"), eq("alice@example.com")))
                .thenReturn(1);

        EmailVerificationService service = new EmailVerificationService(jdbc, mail);
        assertThat(service.verify("raw-token-ok")).isEqualTo("alice@example.com");

        // 2) 已被其他已验证账号占用 -> 拒绝
        when(jdbc.queryForObject(contains("email_verified and id <> ?"), eq(Integer.class), eq("alice@example.com"), eq(uid)))
                .thenReturn(1);
        assertThatThrownBy(() -> service.verify("raw-token-taken"))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("已被其他账号使用");

        // 3) 用户已解绑/修改邮箱 -> updated=0 拒绝
        when(jdbc.queryForObject(contains("email_verified and id <> ?"), eq(Integer.class), eq("alice@example.com"), eq(uid)))
                .thenReturn(0);
        when(jdbc.update(contains("update profiles"), eq("alice@example.com"), eq(uid), eq("alice@example.com"), eq("alice@example.com")))
                .thenReturn(0);
        assertThatThrownBy(() -> service.verify("raw-token-stale"))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("已失效");
    }
}
