package com.quiz.auth;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * 认证控制器单元测试：验证改密不篡改 JPA 托管实体（避免 Hibernate 二次全列覆盖更新）且签发新版本令牌。
 */
class AuthControllerTest {

    @Test
    @SuppressWarnings("unchecked")
    void changePasswordUpdatesViaJdbcWithoutMutatingManagedEntity() {
        UserRepository users = mock(UserRepository.class);
        PasswordEncoder encoder = mock(PasswordEncoder.class);
        JwtService jwt = new JwtService("0123456789abcdef0123456789abcdef", 3600);
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        EmailVerificationService verification = mock(EmailVerificationService.class);

        UUID uid = UUID.randomUUID();
        User u = new User();
        u.setId(uid);
        u.setUsername("student");
        u.setRole("user");
        u.setPasswordHash("old-hash");
        u.setTokenVersion(2);

        when(users.findById(uid)).thenReturn(Optional.of(u));
        when(encoder.matches("oldPass123", "old-hash")).thenReturn(true);
        when(encoder.matches("newPass456", "old-hash")).thenReturn(false);
        when(encoder.encode("newPass456")).thenReturn("new-hash");

        AuthController controller = new AuthController(users, encoder, jwt, jdbc, verification);
        ResponseEntity<?> resp = controller.changePassword(uid, new AuthController.ChangePasswordReq("oldPass123", "newPass456"));

        assertThat(resp.getStatusCode()).isEqualTo(HttpStatus.OK);
        Map<String, Object> body = (Map<String, Object>) resp.getBody();
        assertThat(body.get("ok")).isEqualTo(true);

        // 签发的新令牌版本应为 3
        JwtService.TokenInfo parsed = jwt.parse(String.valueOf(body.get("token")));
        assertThat(parsed).isNotNull();
        assertThat(parsed.version()).isEqualTo(3);

        // 托管实体本身未被就地修改，避免事务提交时触发 Hibernate 二次 UPDATE
        assertThat(u.getPasswordHash()).isEqualTo("old-hash");
        assertThat(u.getTokenVersion()).isEqualTo(2);
        verify(jdbc).update(contains("update profiles set password_hash = ?, token_version = ?"), eq("new-hash"), eq(3), eq(uid));
        verify(jdbc).update(contains("update password_reset_token set used_at = now()"), eq(uid));
    }
}
