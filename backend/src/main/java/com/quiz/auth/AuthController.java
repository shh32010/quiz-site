package com.quiz.auth;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.OffsetDateTime;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

/**
 * 注册 / 登录 / 当前用户 / 绑定邮箱。
 * 登录标识支持用户名或邮箱（含 @ 时按邮箱查）。
 */
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private static final Logger log = LoggerFactory.getLogger(AuthController.class);

    public record RegisterReq(
            @NotBlank @Pattern(regexp = "^[A-Za-z0-9_]{3,32}$", message = "用户名需 3-32 位字母数字下划线") String username,
            @NotBlank @Size(min = 6, max = 64, message = "密码需 6-64 位") String password,
            @Email(message = "邮箱格式不正确") @Size(max = 128, message = "邮箱过长") String email) {}

    public record LoginReq(@NotBlank String username, @NotBlank String password) {}

    public record BindEmailReq(
            @NotBlank(message = "请输入当前密码") String password,
            @Email(message = "邮箱格式不正确") @Size(max = 128, message = "邮箱过长") String email) {}

    public record ChangePasswordReq(
            @NotBlank(message = "请输入当前密码") String oldPassword,
            @NotBlank @Size(min = 6, max = 64, message = "新密码需 6-64 位") String newPassword) {}

    private final UserRepository users;
    private final PasswordEncoder encoder;
    private final JwtService jwt;
    private final org.springframework.jdbc.core.JdbcTemplate jdbc;
    private final EmailVerificationService verification;

    public AuthController(UserRepository users, PasswordEncoder encoder, JwtService jwt,
                          org.springframework.jdbc.core.JdbcTemplate jdbc,
                          EmailVerificationService verification) {
        this.users = users;
        this.encoder = encoder;
        this.jwt = jwt;
        this.jdbc = jdbc;
        this.verification = verification;
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody RegisterReq req, HttpServletRequest request) {
        if (PasswordPolicy.tooLong(req.password())) {
            return ResponseEntity.badRequest().body(Map.of("message", PasswordPolicy.tooLongMessage()));
        }
        if (users.existsByUsernameIgnoreCase(req.username())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(Map.of("message", "用户名已被占用"));
        }
        String email = normalizeEmail(req.email());
        // 未验证邮箱允许重复（QQ 等收不到验证邮件时仍可注册）；只拦截已验证邮箱
        if (email != null && users.findFirstByEmailIgnoreCaseAndEmailVerifiedTrue(email).isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(Map.of("message", "邮箱已被使用"));
        }
        User u = new User();
        u.setId(UUID.randomUUID());
        u.setUsername(req.username());
        u.setEmail(email);
        u.setEmailVerified(false);
        u.setPendingEmail(null);
        u.setNickname(req.username());
        u.setRole("user");
        u.setPasswordHash(encoder.encode(req.password()));
        u.setCreatedAt(OffsetDateTime.now());
        try {
            users.save(u);
        } catch (DataIntegrityViolationException e) {
            // 并发注册同名/同邮箱时由唯一索引兜底
            return ResponseEntity.status(HttpStatus.CONFLICT).body(Map.of("message", "用户名或邮箱已被占用"));
        }
        recordLogin(u.getId(), request);
        boolean verificationSent = email != null && verification.send(u.getId(), email, u.getUsername());
        return ResponseEntity.ok(Map.of(
                "token", jwt.issue(u),
                "username", u.getUsername(),
                "role", u.getRole(),
                "emailVerificationSent", verificationSent));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody LoginReq req, HttpServletRequest request) {
        // 超长密码不进入 BCrypt.matches，统一按凭据错误返回，避免暴露长度策略
        if (PasswordPolicy.tooLong(req.password())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "用户名/邮箱或密码错误"));
        }
        String identifier = req.username().trim();
        User u;
        if (identifier.contains("@")) {
            // 邮箱可能被多个未验证账号重复占用：优先已验证账号；多个未验证账号时要求改用用户名
            var matches = users.findByEmailIgnoreCase(identifier);
            u = matches.stream()
                    .filter(x -> Boolean.TRUE.equals(x.getEmailVerified()))
                    .findFirst()
                    .orElse(matches.size() == 1 ? matches.get(0) : null);
        } else {
            u = users.findByUsernameIgnoreCase(identifier).orElse(null);
        }
        if (u == null || u.getPasswordHash() == null
                || !encoder.matches(req.password(), u.getPasswordHash())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "用户名/邮箱或密码错误"));
        }
        recordLogin(u.getId(), request);
        return ResponseEntity.ok(Map.of("token", jwt.issue(u), "username", u.getUsername(), "role", u.getRole()));
    }

    @GetMapping("/me")
    public ResponseEntity<?> me(@AuthenticationPrincipal UUID uid) {
        if (uid == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "未登录"));
        }
        return users.findById(uid)
                .<ResponseEntity<?>>map(u -> ResponseEntity.ok(Map.of(
                        "id", u.getId(), "username", u.getUsername(),
                        "nickname", u.getNickname() == null ? "" : u.getNickname(),
                        "email", u.getEmail() == null ? "" : u.getEmail(),
                        "emailVerified", Boolean.TRUE.equals(u.getEmailVerified()),
                        "pendingEmail", u.getPendingEmail() == null ? "" : u.getPendingEmail(),
                        "role", u.getRole())))
                .orElseGet(() -> ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "用户不存在")));
    }

    /** 绑定/修改邮箱（需当前密码确认）；传空邮箱表示解绑 */
    @PostMapping("/email")
    public ResponseEntity<?> bindEmail(@AuthenticationPrincipal UUID uid, @Valid @RequestBody BindEmailReq req) {
        if (uid == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "未登录"));
        }
        User u = users.findById(uid).orElse(null);
        if (u == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "用户不存在"));
        }
        if (PasswordPolicy.tooLong(req.password())
                || u.getPasswordHash() == null
                || !encoder.matches(req.password(), u.getPasswordHash())) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(Map.of("message", "当前密码错误"));
        }
        String email = normalizeEmail(req.email());
        if (email == null) {
            // 解绑：清掉邮箱和待验证状态，并作废未使用的验证令牌
            u.setEmail(null);
            u.setEmailVerified(false);
            u.setPendingEmail(null);
            try {
                users.save(u);
                verification.invalidate(uid);
            } catch (DataIntegrityViolationException e) {
                return ResponseEntity.status(HttpStatus.CONFLICT).body(Map.of("message", "邮箱已被使用"));
            }
            return ResponseEntity.ok(Map.of(
                    "ok", true, "email", "", "emailVerified", false,
                    "pendingEmail", "", "mailSent", false));
        }

        // 已绑定且已验证的同一邮箱：清掉待验证状态，避免旧令牌继续生效
        if (email.equalsIgnoreCase(u.getEmail() == null ? "" : u.getEmail())
                && Boolean.TRUE.equals(u.getEmailVerified())) {
            u.setPendingEmail(null);
            users.save(u);
            verification.invalidate(uid);
            return ResponseEntity.ok(Map.of(
                    "ok", true, "email", email, "emailVerified", true,
                    "pendingEmail", "", "mailSent", false));
        }

        // 只拦截已验证邮箱；未验证邮箱允许真实持有人通过验证接管
        User other = users.findFirstByEmailIgnoreCaseAndEmailVerifiedTrue(email).orElse(null);
        if (other != null && !other.getId().equals(uid)) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(Map.of("message", "邮箱已被使用"));
        }

        // 新邮箱先写 pending_email，验证通过后才替换 email
        u.setPendingEmail(email);
        try {
            users.save(u);
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(Map.of("message", "邮箱已被使用"));
        }
        boolean sent = verification.send(uid, email, u.getUsername());
        return ResponseEntity.ok(Map.of(
                "ok", true,
                "email", u.getEmail() == null ? "" : u.getEmail(),
                "emailVerified", Boolean.TRUE.equals(u.getEmailVerified()),
                "pendingEmail", email,
                "mailSent", sent));
    }

    /** 修改密码（需当前密码确认）；成功后作废所有未使用的重置令牌 */
    @Transactional
    @PostMapping("/password")
    public ResponseEntity<?> changePassword(@AuthenticationPrincipal UUID uid,
                                            @Valid @RequestBody ChangePasswordReq req) {
        if (uid == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "未登录"));
        }
        User u = users.findById(uid).orElse(null);
        if (u == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "用户不存在"));
        }
        if (PasswordPolicy.tooLong(req.oldPassword())
                || u.getPasswordHash() == null
                || !encoder.matches(req.oldPassword(), u.getPasswordHash())) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(Map.of("message", "当前密码错误"));
        }
        if (PasswordPolicy.tooLong(req.newPassword())) {
            return ResponseEntity.badRequest().body(Map.of("message", PasswordPolicy.tooLongMessage()));
        }
        if (encoder.matches(req.newPassword(), u.getPasswordHash())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", "新密码不能与当前密码相同"));
        }
        int newVersion = (u.getTokenVersion() == null ? 0 : u.getTokenVersion()) + 1;
        String hash = encoder.encode(req.newPassword());
        jdbc.update("update profiles set password_hash = ?, token_version = ? where id = ?", hash, newVersion, uid);
        jdbc.update("update password_reset_token set used_at = now() where profile_id = ? and used_at is null", uid);
        // 当前会话换发新 token，其他设备上的旧 token 立即失效（不修改托管实体 u，避免 Hibernate 提交时二次全列 UPDATE）
        String newToken = jwt.issue(u.getId(), u.getUsername(), u.getRole(), newVersion);
        return ResponseEntity.ok(Map.of("ok", true, "token", newToken));
    }

    /** 登录/注册成功后记录最近 IP 与时间；记录失败不影响主流程 */
    private void recordLogin(UUID uid, HttpServletRequest request) {
        try {
            jdbc.update("update profiles set last_ip = ?, last_login_at = now() where id = ?",
                    clientIp(request), uid);
        } catch (Exception e) {
            log.warn("记录登录 IP 失败: {}", e.getMessage());
        }
    }

    /** 优先取 nginx 覆盖写入的 X-Real-IP，避免客户端伪造 X-Forwarded-For */
    private static String clientIp(HttpServletRequest request) {
        String real = request.getHeader("X-Real-IP");
        if (real != null && !real.isBlank()) {
            return truncateIp(real.trim());
        }
        String xff = request.getHeader("X-Forwarded-For");
        if (xff != null && !xff.isBlank()) {
            String first = xff.split(",")[0].trim();
            if (!first.isEmpty()) {
                return truncateIp(first);
            }
        }
        return truncateIp(request.getRemoteAddr());
    }

    private static String truncateIp(String ip) {
        if (ip == null) {
            return "";
        }
        return ip.length() > 64 ? ip.substring(0, 64) : ip;
    }

    private static String normalizeEmail(String email) {
        if (email == null) {
            return null;
        }
        String e = email.trim().toLowerCase(Locale.ROOT);
        return e.isEmpty() ? null : e;
    }
}
