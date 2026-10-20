package com.quiz.auth;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.time.OffsetDateTime;
import java.util.Map;
import java.util.UUID;

/**
 * 注册 / 登录 / 当前用户。
 */
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    public record RegisterReq(
            @NotBlank @Pattern(regexp = "^[A-Za-z0-9_]{3,32}$", message = "用户名需 3-32 位字母数字下划线") String username,
            @NotBlank @Size(min = 6, max = 64, message = "密码需 6-64 位") String password) {}

    public record LoginReq(@NotBlank String username, @NotBlank String password) {}

    private final UserRepository users;
    private final PasswordEncoder encoder;
    private final JwtService jwt;

    public AuthController(UserRepository users, PasswordEncoder encoder, JwtService jwt) {
        this.users = users;
        this.encoder = encoder;
        this.jwt = jwt;
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody RegisterReq req) {
        if (users.existsByUsernameIgnoreCase(req.username())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(Map.of("message", "用户名已被占用"));
        }
        User u = new User();
        u.setId(UUID.randomUUID());
        u.setUsername(req.username());
        u.setNickname(req.username());
        u.setRole("user");
        u.setPasswordHash(encoder.encode(req.password()));
        u.setCreatedAt(OffsetDateTime.now());
        users.save(u);
        return ResponseEntity.ok(Map.of("token", jwt.issue(u), "username", u.getUsername(), "role", u.getRole()));
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@Valid @RequestBody LoginReq req) {
        User u = users.findByUsernameIgnoreCase(req.username()).orElse(null);
        if (u == null || u.getPasswordHash() == null
                || !encoder.matches(req.password(), u.getPasswordHash())) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "用户名或密码错误"));
        }
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
                        "nickname", u.getNickname() == null ? "" : u.getNickname(), "role", u.getRole())))
                .orElseGet(() -> ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("message", "用户不存在")));
    }
}
