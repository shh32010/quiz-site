package com.quiz.auth;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * 邮箱找回密码。
 * - POST /forgot：输入邮箱，生成一次性令牌并异步发重置链接；始终返回 ok，避免暴露邮箱是否存在与时序侧信道
 * - POST /reset：令牌 + 新密码
 * 邮件服务未配置或发送失败时，自动落 password_reset_request，由管理员后台兜底。
 */
@RestController
@RequestMapping("/api/auth")
public class PasswordResetController {

    private static final Logger log = LoggerFactory.getLogger(PasswordResetController.class);
    private static final SecureRandom RANDOM = new SecureRandom();
    private static final int TOKEN_MINUTES = 30;
    private static final int COOLDOWN_SECONDS = 60;

    public record ForgotReq(String email) {}

    public record ResetReq(
            @NotBlank(message = "缺少令牌") String token,
            @NotBlank @Size(min = 6, max = 64, message = "密码需 6-64 位") String password) {}

    private final JdbcTemplate jdbc;
    private final UserRepository users;
    private final MailService mail;
    private final PasswordEncoder encoder;
    private final Executor mailExecutor;

    @Autowired
    public PasswordResetController(JdbcTemplate jdbc, UserRepository users,
                                   MailService mail, PasswordEncoder encoder) {
        this(jdbc, users, mail, encoder, Executors.newVirtualThreadPerTaskExecutor());
    }

    PasswordResetController(JdbcTemplate jdbc, UserRepository users,
                            MailService mail, PasswordEncoder encoder, Executor mailExecutor) {
        this.jdbc = jdbc;
        this.users = users;
        this.mail = mail;
        this.encoder = encoder;
        this.mailExecutor = mailExecutor;
    }

    @PostMapping("/forgot")
    public Map<String, Object> forgot(@RequestBody ForgotReq req) {
        String email = req == null || req.email() == null ? "" : req.email().trim().toLowerCase(Locale.ROOT);
        // 格式不对、找不到用户，都返回同样的结果
        if (!validEmail(email)) {
            return Map.of("ok", true);
        }
        List<User> matches = users.findByEmailIgnoreCase(email);
        if (matches.isEmpty()) {
            return Map.of("ok", true);
        }
        // 未验证邮箱允许重复：优先取已验证账号；都未验证时不自动发信
        User u = matches.stream()
                .filter(x -> Boolean.TRUE.equals(x.getEmailVerified()))
                .findFirst()
                .orElse(null);
        if (u == null) {
            requestAdmin(matches.get(0), email, "邮箱未完成归属验证，转人工核实");
            return Map.of("ok", true);
        }

        // 同一用户 60 秒内最多发一封，防止单邮箱被持续轰炸
        Integer recent = jdbc.queryForObject("""
                select count(*) from password_reset_token
                 where profile_id = ? and created_at > now() - interval '%d seconds'
                """.formatted(COOLDOWN_SECONDS), Integer.class, u.getId());
        if (recent != null && recent > 0) {
            return Map.of("ok", true);
        }

        // 顺手清理 7 天前的旧令牌
        jdbc.update("delete from password_reset_token where created_at < now() - interval '7 days'");

        // 只有完成归属验证的邮箱才自动发重置链接；SMTP 发信走异步执行，抹平响应时序差异
        if (mail.enabled()) {
            String raw = newToken();
            // 同一用户旧令牌作废
            jdbc.update("update password_reset_token set used_at = now() where profile_id = ? and used_at is null", u.getId());
            jdbc.update("""
                    insert into password_reset_token(profile_id, token_hash, expires_at)
                    values (?, ?, now() + interval '%d minutes')
                    """.formatted(TOKEN_MINUTES), u.getId(), sha256(raw));
            User targetUser = u;
            mailExecutor.execute(() -> {
                try {
                    boolean sent = mail.sendResetLink(email, targetUser.getUsername(), raw);
                    if (!sent) {
                        requestAdmin(targetUser, email, "邮件服务发送失败，系统自动转人工");
                    }
                } catch (Exception e) {
                    log.warn("异步发送重置密码邮件异常: {}", e.getMessage());
                    requestAdmin(targetUser, email, "邮件服务发送异常，系统自动转人工");
                }
            });
        } else {
            requestAdmin(u, email, "邮件服务未配置，系统自动转人工");
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

    /** 转管理员人工处理；同一用户已有 open 工单时不重复插入 */
    private void requestAdmin(User user, String contact, String note) {
        Integer open = jdbc.queryForObject("""
                select count(*) from password_reset_request
                 where username = ? and status = 'open'
                """, Integer.class, user.getUsername());
        if (open != null && open > 0) {
            return;
        }
        jdbc.update("""
                insert into password_reset_request(username, contact, note)
                values (?, ?, ?)
                """, user.getUsername(), contact, note);
        log.warn("密码找回转管理员处理: {}", user.getUsername());
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
