package com.quiz.auth;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Date;
import java.util.UUID;

/**
 * JWT 签发与校验（HS256）。密钥由环境变量注入（QUIZ_JWT_SECRET），禁止硬编码。
 */
@Service
public class JwtService {

    private final SecretKey key;
    private final long expireSeconds;

    public JwtService(@Value("${quiz.jwt.secret}") String secret,
                      @Value("${quiz.jwt.expire-seconds:604800}") long expireSeconds) {
        if (secret == null || secret.length() < 32) {
            throw new IllegalStateException("quiz.jwt.secret 未配置或长度不足 32（请设置环境变量 QUIZ_JWT_SECRET）");
        }
        this.key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));
        this.expireSeconds = expireSeconds;
    }

    /** 令牌解析结果；version 用于改密后强制旧 token 失效 */
    public record TokenInfo(UUID uid, String role, int version) {}

    public String issue(User user) {
        return issue(user.getId(), user.getUsername(), user.getRole(),
                user.getTokenVersion() == null ? 0 : user.getTokenVersion());
    }

    /** 直接按字段签发 JWT（避免改密后为签发新 token 修改 JPA 托管实体触发多余全列 UPDATE） */
    public String issue(UUID uid, String username, String role, int tokenVersion) {
        Instant now = Instant.now();
        return Jwts.builder()
                .subject(uid.toString())
                .claim("username", username)
                .claim("role", role)
                .claim("ver", tokenVersion)
                .issuedAt(Date.from(now))
                .expiration(Date.from(now.plusSeconds(expireSeconds)))
                .signWith(key)
                .compact();
    }

    /** 校验并解析令牌；无效返回 null。旧 token 没有 ver 字段，按 0 处理 */
    public TokenInfo parse(String token) {
        try {
            Claims c = Jwts.parser().verifyWith(key).build().parseSignedClaims(token).getPayload();
            Integer ver = c.get("ver", Integer.class);
            return new TokenInfo(UUID.fromString(c.getSubject()), c.get("role", String.class),
                    ver == null ? 0 : ver);
        } catch (Exception e) {
            return null;
        }
    }
}
