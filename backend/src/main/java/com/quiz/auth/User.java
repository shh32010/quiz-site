package com.quiz.auth;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.time.OffsetDateTime;
import java.util.UUID;

/**
 * 用户（profiles 表）。password_hash 为 BCrypt，兼容原 Supabase Auth 迁移过来的哈希。
 */
@Entity
@Table(name = "profiles")
@Getter
@Setter
public class User {

    @Id
    private UUID id;

    private String username;

    /** 登录/找回密码用，唯一（不区分大小写），可为空 */
    private String email;

    /** 邮箱是否已完成归属验证；历史邮箱在迁移时标记为已验证 */
    @Column(name = "email_verified")
    private Boolean emailVerified = false;

    /** 待验证的新邮箱；验证通过后才替换 email */
    @Column(name = "pending_email")
    private String pendingEmail;

    private String nickname;

    @Column(name = "avatar_url")
    private String avatarUrl;

    private String role;

    @Column(name = "password_hash")
    private String passwordHash;

    /** 令牌版本：改密/重置时 +1，旧 token 立即失效 */
    @Column(name = "token_version")
    private Integer tokenVersion = 0;

    @Column(name = "created_at")
    private OffsetDateTime createdAt;
}
