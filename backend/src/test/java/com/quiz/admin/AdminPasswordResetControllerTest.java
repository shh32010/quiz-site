package com.quiz.admin;

import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * 管理员密码重置控制器单元测试：验证禁止重置管理员、作废旧重置令牌与事务一致性。
 */
class AdminPasswordResetControllerTest {

    private static TransactionTemplate syncTx() {
        TransactionTemplate tx = mock(TransactionTemplate.class);
        when(tx.execute(any())).thenAnswer(inv -> {
            TransactionCallback<?> cb = inv.getArgument(0);
            return cb.doInTransaction(mock(TransactionStatus.class));
        });
        return tx;
    }

    @Test
    void forbidsResettingAdminAccount() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        PasswordEncoder encoder = mock(PasswordEncoder.class);
        UUID adminId = UUID.randomUUID();
        UUID targetId = UUID.randomUUID();

        when(jdbc.queryForList(contains("from profiles where lower(username)"), eq("rootadmin")))
                .thenReturn(List.of(Map.of("id", targetId, "username", "rootadmin", "role", "admin")));

        AdminPasswordResetController controller = new AdminPasswordResetController(jdbc, encoder, syncTx());
        assertThatThrownBy(() -> controller.reset(adminId, new AdminPasswordResetController.ResetReq("rootadmin")))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("管理员");
        verify(jdbc, never()).update(contains("update profiles set password_hash"), any(), any());
    }

    @Test
    void resetsUserPasswordAndInvalidatesResetTokens() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        PasswordEncoder encoder = mock(PasswordEncoder.class);
        UUID adminId = UUID.randomUUID();
        UUID targetId = UUID.randomUUID();

        when(jdbc.queryForList(contains("from profiles where lower(username)"), eq("student1")))
                .thenReturn(List.of(Map.of("id", targetId, "username", "student1", "role", "user")));
        when(encoder.encode(anyString())).thenReturn("hashed-temp");

        AdminPasswordResetController controller = new AdminPasswordResetController(jdbc, encoder, syncTx());
        Map<String, Object> res = controller.reset(adminId, new AdminPasswordResetController.ResetReq("student1"));

        assertThat(res.get("ok")).isEqualTo(true);
        assertThat(res.get("username")).isEqualTo("student1");
        assertThat(String.valueOf(res.get("password"))).hasSize(16);
        verify(jdbc).update(contains("update profiles set password_hash"), eq("hashed-temp"), eq(targetId));
        verify(jdbc).update(contains("update password_reset_token set used_at = now()"), eq(targetId));
    }
}
