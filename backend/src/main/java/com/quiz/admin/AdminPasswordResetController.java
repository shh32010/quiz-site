package com.quiz.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.bind.annotation.*;

import java.security.SecureRandom;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 管理员处理忘记密码：查看申请、生成临时密码。
 * - 禁止重置其他管理员密码
 * - 改密、递增令牌版本、作废未使用的重置令牌与工单状态变更在同一事务内完成
 * - 记录执行操作的管理员 ID 审计日志
 */
@RestController
@RequestMapping("/api/admin/password-resets")
public class AdminPasswordResetController {

    private static final Logger log = LoggerFactory.getLogger(AdminPasswordResetController.class);

    public record ResetReq(String username) {}

    private static final String ALPHABET =
            "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789";

    private final JdbcTemplate jdbc;
    private final PasswordEncoder encoder;
    private final TransactionTemplate tx;
    private final SecureRandom random = new SecureRandom();

    public AdminPasswordResetController(JdbcTemplate jdbc, PasswordEncoder encoder, TransactionTemplate tx) {
        this.jdbc = jdbc;
        this.encoder = encoder;
        this.tx = tx;
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
    public Map<String, Object> reset(@AuthenticationPrincipal UUID adminId, @RequestBody ResetReq req) {
        String username = req == null || req.username() == null ? "" : req.username().trim();
        return tx.execute(status -> resetFor(adminId, username));
    }

    /** 处理一条找回申请 */
    @PostMapping("/{id}/reset")
    public Map<String, Object> resetRequest(@AuthenticationPrincipal UUID adminId, @PathVariable long id) {
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select username from password_reset_request where id = ? and status = 'open'", id);
        if (rows.isEmpty()) {
            throw new IllegalArgumentException("申请不存在或已处理");
        }
        String username = String.valueOf(rows.get(0).get("username"));
        try {
            return tx.execute(status -> {
                Map<String, Object> result = resetFor(adminId, username);
                jdbc.update("""
                        update password_reset_request
                           set status = 'handled', admin_note = '已重置并发放临时密码', handled_at = now()
                         where id = ?
                        """, id);
                return result;
            });
        } catch (RuntimeException e) {
            jdbc.update("""
                    update password_reset_request
                       set status = 'rejected', admin_note = ?, handled_at = now()
                     where id = ?
                    """, e.getMessage(), id);
            throw e;
        }
    }

    private Map<String, Object> resetFor(UUID adminId, String username) {
        if (username.length() < 3 || username.length() > 32) {
            throw new IllegalArgumentException("用户名长度需 3-32 位");
        }
        List<Map<String, Object>> rows = jdbc.queryForList(
                "select id, username, role from profiles where lower(username) = lower(?)", username);
        if (rows.isEmpty()) {
            throw new IllegalArgumentException("用户不存在");
        }
        Map<String, Object> target = rows.getFirst();
        if ("admin".equals(target.get("role"))) {
            throw new IllegalArgumentException("不能通过后台接口重置管理员密码");
        }
        String temp = tempPassword();
        Object targetId = target.get("id");
        // 递增令牌版本并作废全部未使用的自助重置令牌：所有已登录设备强制下线
        jdbc.update("update profiles set password_hash = ?, token_version = coalesce(token_version, 0) + 1 where id = ?",
                encoder.encode(temp), targetId);
        jdbc.update("update password_reset_token set used_at = now() where profile_id = ? and used_at is null",
                targetId);
        log.info("管理员 {} 重置用户 {} 密码并作废其旧令牌", adminId, target.get("username"));
        return Map.of("ok", true, "username", target.get("username"), "password", temp);
    }

    private String tempPassword() {
        StringBuilder sb = new StringBuilder(16);
        for (int i = 0; i < 16; i++) {
            sb.append(ALPHABET.charAt(random.nextInt(ALPHABET.length())));
        }
        return sb.toString();
    }
}
