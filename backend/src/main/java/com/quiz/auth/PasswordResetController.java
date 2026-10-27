package com.quiz.auth;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.HexFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * 邮箱找回密码。
 * - POST /forgot：输入邮箱，生成一次性令牌并发重置链接；始终返回 ok，避免暴露邮箱是否存在
 * - POST /reset：令牌 + 新密码
 * 邮件服务未配置或发送失败时，自动落 password_reset_request，由管理员后台兜底。
 */
@RestController
@RequestMapping("/api/auth")
public class PasswordResetController {

    private static final Logger log = LoggerFactory.getLogger(PasswordResetController.class);
    private static final SecureRandom RANDOM = new SecureRandom();
    private static final int TOKEN_MINUTES = 30;

    public record ForgotReq(String email) {}

    public record ResetReq(
            @NotBlank(message = "缺少令牌") String token,
            @NotBlank @Size(min = 6, max = 64, message = "密码需 6-64 位") String password) {}

    private final JdbcTemplate jdbc;
    private final UserRepository users;
    private final MailService mail;
    private final PasswordEncoder encoder;

    public PasswordResetController(JdbcTemplate jdbc, UserRepository users,
                                   MailService mail, PasswordEncoder encoder) {
        this.jdbc = jdbc;
        this.users = users;
        this.mail = mail;
        this.encoder = encoder;
    }

    @PostMapping("/forgot")
    public Map<String, Object> forgot(@RequestBody ForgotReq req) {
        String email = req.email() == null ? "" : req.email().trim().toLowerCase(Locale.ROOT);
        // 格式不对、找不到用户，都返回同样的结果
        if (!validEmail(email)) {
            return Map.of("ok", true);
        }
        User u = users.findByEmailIgnoreCase(email).orElse(null);
        if (u == null) {
            return Map.of("ok", true);
        }

        // 顺手清理 7 天前的旧令牌
        jdbc.update("delete from password_reset_token where created_at < now() - interval '7 days'");

        boolean sent = false;
        // 只有完成归属验证的邮箱才自动发重置链接；未验证走管理员兜底
        if (Boolean.TRUE.equals(u.getEmailVerified()) && mail.enabled()) {
            String raw = newToken();
            // 同一用户旧令牌作废
            jdbc.update("update password_reset_token set used_at = now() where profile_id = ? and used_at is null", u.getId());
            jdbc.update("""
                    insert into password_reset_token(profile_id, token_hash, expires_at)
                    values (?, ?, now() + interval '%d minutes')
                    """.formatted(TOKEN_MINUTES), u.getId(), sha256(raw));
            sent = mail.sendResetLink(email, u.getUsername(), raw);
        }
        if (!sent) {
            // 邮件不可用：转管理员人工处理（前台文案保持一致）
            jdbc.update("""
                    insert into password_reset_request(username, contact, note)
                    values (?, ?, ?)
                    """, u.getUsername(), email, "邮件服务未配置或发送失败，系统自动转人工");
            log.warn("重置邮件未发出，已转管理员处理: {}", u.getUsername());
        }
        return Map.of("ok", true);
    }

    @Transactional
    @PostMapping("/reset")
    public ResponseEntity<?> reset(@Valid @RequestBody ResetReq req) {
        if (PasswordPolicy.tooLong(req.password())) {
            return ResponseEntity.badRequest().body(Map.of("message", PasswordPolicy.tooLongMessage()));
        }
        // 原子消费令牌：并发请求只有一个能成功
        List<Map<String, Object>> rows = jdbc.queryForList("""
                update password_reset_token
                   set used_at = now()
                 where token_hash = ? and used_at is null and expires_at > now()
                returning profile_id
                """, sha256(req.token().trim()));
        if (rows.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("message", "链接无效或已过期，请重新申请"));
        }
        Object profileId = rows.get(0).get("profile_id");
        // 同时递增令牌版本：所有已登录设备强制下线
        jdbc.update("update profiles set password_hash = ?, token_version = coalesce(token_version, 0) + 1 where id = ?",
                encoder.encode(req.password()), profileId);
        // 其余未使用令牌一并作废
        jdbc.update("update password_reset_token set used_at = now() where profile_id = ? and used_at is null", profileId);
        return ResponseEntity.ok(Map.of("ok", true));
    }

    private static boolean validEmail(String email) {
        return email.length() <= 128
                && email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$");
    }

    private static String newToken() {
        byte[] bytes = new byte[32];
        RANDOM.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }

    private static String sha256(String value) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            return HexFormat.of().formatHex(md.digest(value.getBytes(StandardCharsets.UTF_8)));
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("SHA-256 不可用", e);
        }
    }
}
