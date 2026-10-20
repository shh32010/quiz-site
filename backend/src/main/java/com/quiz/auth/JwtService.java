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

    public String issue(User user) {
        Instant now = Instant.now();
        return Jwts.builder()
                .subject(user.getId().toString())
                .claim("username", user.getUsername())
                .claim("role", user.getRole())
                .issuedAt(Date.from(now))
                .expiration(Date.from(now.plusSeconds(expireSeconds)))
                .signWith(key)
                .compact();
    }

    /** 校验并返回用户 id；无效则返回 null */
    public UUID parseSubject(String token) {
        try {
            Claims c = Jwts.parser().verifyWith(key).build().parseSignedClaims(token).getPayload();
            return UUID.fromString(c.getSubject());
        } catch (Exception e) {
            return null;
        }
    }
}
