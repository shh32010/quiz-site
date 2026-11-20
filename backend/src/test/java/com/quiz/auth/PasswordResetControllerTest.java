package com.quiz.auth;

import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * 找回密码控制器单元测试：验证同账号 60 秒冷却防邮件轰炸与异步发信流程。
 */
class PasswordResetControllerTest {

    private static User verifiedUser(String username, String email) {
        User u = new User();
        u.setId(UUID.randomUUID());
        u.setUsername(username);
        u.setEmail(email);
        u.setEmailVerified(true);
        return u;
    }

    @Test
    void forgotSkipsSendingWhenWithinCooldownWindow() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UserRepository users = mock(UserRepository.class);
        MailService mail = mock(MailService.class);
        PasswordEncoder encoder = mock(PasswordEncoder.class);

        User u = verifiedUser("alice", "alice@example.com");
        when(users.findByEmailIgnoreCase("alice@example.com")).thenReturn(List.of(u));
        when(jdbc.queryForObject(contains("from password_reset_token"), eq(Integer.class), eq(u.getId())))
                .thenReturn(1);

        // 注入同步 Executor 便于断言异步任务是否执行
        PasswordResetController controller = new PasswordResetController(jdbc, users, mail, encoder, Runnable::run);
        Map<String, Object> res = controller.forgot(new PasswordResetController.ForgotReq("alice@example.com"));

        assertThat(res.get("ok")).isEqualTo(true);
        verify(mail, never()).sendResetLink(anyString(), anyString(), anyString());
        verify(jdbc, never()).update(contains("insert into password_reset_token"), any(), any());
    }

    @Test
    void forgotDispatchesMailSendingViaAsyncExecutor() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UserRepository users = mock(UserRepository.class);
        MailService mail = mock(MailService.class);
        PasswordEncoder encoder = mock(PasswordEncoder.class);

        User u = verifiedUser("bob", "bob@example.com");
        when(users.findByEmailIgnoreCase("bob@example.com")).thenReturn(List.of(u));
        when(jdbc.queryForObject(contains("from password_reset_token"), eq(Integer.class), eq(u.getId())))
                .thenReturn(0);
        when(mail.enabled()).thenReturn(true);
        when(mail.sendResetLink(eq("bob@example.com"), eq("bob"), anyString())).thenReturn(true);

        // 捕获提交给异步执行器的任务，验证主请求返回前不阻塞在 SMTP 上
        final Runnable[] capturedTask = new Runnable[1];
        PasswordResetController controller = new PasswordResetController(jdbc, users, mail, encoder, task -> capturedTask[0] = task);
        Map<String, Object> res = controller.forgot(new PasswordResetController.ForgotReq("bob@example.com"));

        assertThat(res.get("ok")).isEqualTo(true);
        verify(mail, never()).sendResetLink(anyString(), anyString(), anyString());
        assertThat(capturedTask[0]).isNotNull();

        capturedTask[0].run();
        verify(mail, times(1)).sendResetLink(eq("bob@example.com"), eq("bob"), anyString());
    }
}
