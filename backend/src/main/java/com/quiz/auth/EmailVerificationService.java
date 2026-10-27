package com.quiz.auth;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.HexFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 邮箱归属验证：一次性令牌（存 SHA-256，24 小时有效）。
 * 新注册/修改邮箱只写 pending_email，验证成功后才替换 profiles.email。
 */
@Service
public class EmailVerificationService {

    private static final SecureRandom RANDOM = new SecureRandom();
    private static final int TOKEN_HOURS = 24;

    private final JdbcTemplate jdbc;
    private final MailService mail;

    public EmailVerificationService(JdbcTemplate jdbc, MailService mail) {
        this.jdbc = jdbc;
        this.mail = mail;
    }

    /** 生成令牌并发送验证邮件；返回 false 表示冷却中、未配置或发送失败 */
    public boolean send(UUID profileId, String email, String nickname) {
        if (email == null || email.isBlank()) {
            return false;
        }
        // 同一用户 60 秒内只发一封，防止绑定/注册接口被用来轰炸邮箱
        Integer recent = jdbc.queryForObject("""
                select count(*) from email_verification_token
                 where profile_id = ? and created_at > now() - interval '60 seconds'
                """, Integer.class, profileId);
        if (recent != null && recent > 0) {
            return false;
        }

        // 清理 7 天前旧令牌；同一用户未使用的旧令牌作废
        jdbc.update("delete from email_verification_token where created_at < now() - interval '7 days'");
        jdbc.update("update email_verification_token set used_at = now() where profile_id = ? and used_at is null", profileId);

        String raw = newToken();
        jdbc.update("""
                insert into email_verification_token(profile_id, token_hash, email, expires_at)
                values (?, ?, ?, now() + interval '%d hours')
                """.formatted(TOKEN_HOURS), profileId, sha256(raw), email);
        // SMTP 调用放在事务外，避免慢邮件长时间占用数据库连接
        return mail.sendVerificationLink(email, nickname, raw);
    }

    /** 作废当前用户未使用的验证令牌（解绑/撤回邮箱时调用） */
    @Transactional
    public void invalidate(UUID profileId) {
        jdbc.update("update email_verification_token set used_at = now() where profile_id = ? and used_at is null", profileId);
    }

    /** 当前用户重新发送验证邮件：优先 pending_email，其次是未验证的 email */
    public boolean sendForCurrent(UUID profileId) {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select username, email, pending_email, email_verified
                  from profiles where id = ?
                """, profileId);
        if (rows.isEmpty()) {
            throw new IllegalArgumentException("用户不存在");
        }
        Map<String, Object> row = rows.get(0);
        String pending = row.get("pending_email") == null ? null : row.get("pending_email").toString();
        String email = row.get("email") == null ? null : row.get("email").toString();
        boolean verified = Boolean.TRUE.equals(row.get("email_verified"));

        String target = pending != null && !pending.isBlank()
                ? pending
                : (!verified ? email : null);
        if (target == null || target.isBlank()) {
            throw new IllegalArgumentException("当前邮箱已验证或未设置邮箱");
        }

        Integer recent = jdbc.queryForObject("""
                select count(*) from email_verification_token
                 where profile_id = ? and created_at > now() - interval '60 seconds'
                """, Integer.class, profileId);
        if (recent != null && recent > 0) {
            throw new IllegalStateException("验证邮件发送过于频繁，请稍后再试");
        }

        String username = row.get("username") == null ? null : row.get("username").toString();
        return send(profileId, target, username);
    }

    /** 消费令牌并把邮箱写入 profiles；返回验证通过的邮箱 */
    @Transactional
    public String verify(String rawToken) {
        if (rawToken == null || rawToken.isBlank()) {
            throw new IllegalArgumentException("缺少验证令牌");
        }
        List<Map<String, Object>> rows = jdbc.queryForList("""
                update email_verification_token
                   set used_at = now()
                 where token_hash = ? and used_at is null and expires_at > now()
                returning profile_id, email
                """, sha256(rawToken.trim()));
        if (rows.isEmpty()) {
            throw new IllegalArgumentException("验证链接无效或已过期");
        }

        UUID profileId = UUID.fromString(rows.get(0).get("profile_id").toString());
        String email = rows.get(0).get("email").toString();

        Integer taken = jdbc.queryForObject("""
                select count(*) from profiles
                 where lower(email) = lower(?) and email_verified and id <> ?
                """, Integer.class, email, profileId);
        if (taken != null && taken > 0) {
            throw new IllegalArgumentException("该邮箱已被其他账号使用");
        }

        try {
            // 令牌必须仍对应当前待验证邮箱；解绑/撤回后旧链接自动失效
            int updated = jdbc.update("""
                    update profiles
                       set email = ?, email_verified = true, pending_email = null
                     where id = ? and (
                       lower(pending_email) = lower(?)
                       or (pending_email is null and lower(email) = lower(?) and not email_verified)
                     )
                    """, email, profileId, email, email);
            if (updated == 0) {
                throw new IllegalArgumentException("验证链接已失效（邮箱已变更），请重新发送");
            }
        } catch (DataIntegrityViolationException e) {
            throw new IllegalArgumentException("该邮箱已被其他账号使用");
        }
        return email;
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
