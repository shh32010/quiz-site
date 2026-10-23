package com.quiz.admin;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.security.SecureRandom;
import java.util.List;
import java.util.Map;

/**
 * 管理员处理忘记密码：查看申请、生成临时密码。
 */
@RestController
@RequestMapping("/api/admin/password-resets")
public class AdminPasswordResetController {

    public record ResetReq(String username) {}

    private static final String ALPHABET =
            "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789";

    private final JdbcTemplate jdbc;
    private final PasswordEncoder encoder;
    private final SecureRandom random = new SecureRandom();

    public AdminPasswordResetController(JdbcTemplate jdbc, PasswordEncoder encoder) {
        this.jdbc = jdbc;
        this.encoder = encoder;
    }

    @GetMapping
    public Map<String, Object> list() {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select id, username, contact, note, created_at as "createdAt"
                  from password_reset_request
                 where status = 'open'
                 order by created_at desc
                 limit 200
                """);
        return Map.of("rows", rows);
    }

    /** 直接按用户名重置（管理员页面用） */
    @PostMapping("/reset")
    public Map<String, Object> reset(@RequestBody ResetReq req) {
        String username = req.username() == null ? "" : req.username().trim();
        return resetFor(username);
    }

    /** 处理一条找回申请 */
    @PostMapping("/{id}/reset")
    public Map<String, Object> resetRequest(@PathVariable long id) {
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select username from password_reset_request where id = ? and status = 'open'", id);
        if (rows.isEmpty()) {
            throw new IllegalArgumentException("申请不存在或已处理");
        }
        String username = String.valueOf(rows.get(0).get("username"));
        Map<String, Object> result;
        try {
            result = resetFor(username);
        } catch (RuntimeException e) {
            jdbc.update("""
                    update password_reset_request
                       set status = 'rejected', admin_note = ?, handled_at = now()
                     where id = ?
                    """, e.getMessage(), id);
            throw e;
        }
        jdbc.update("""
                update password_reset_request
                   set status = 'handled', admin_note = '已重置并发放临时密码', handled_at = now()
                 where id = ?
                """, id);
        return result;
    }

    private Map<String, Object> resetFor(String username) {
        if (username.length() < 3 || username.length() > 32) {
            throw new IllegalArgumentException("用户名长度需 3-32 位");
        }
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select id, username from profiles where lower(username) = lower(?)", username);
        if (rows.isEmpty()) {
            throw new IllegalArgumentException("用户不存在");
        }
        String temp = tempPassword();
        // 递增令牌版本：管理员重置后，该用户所有已登录设备强制下线
        jdbc.update("update profiles set password_hash = ?, token_version = coalesce(token_version, 0) + 1 where id = ?",
                encoder.encode(temp), rows.get(0).get("id"));
        return Map.of("ok", true, "username", rows.get(0).get("username"), "password", temp);
    }

    private String tempPassword() {
        StringBuilder sb = new StringBuilder(16);
        for (int i = 0; i < 16; i++) {
            sb.append(ALPHABET.charAt(random.nextInt(ALPHABET.length())));
        }
        return sb.toString();
    }
}
