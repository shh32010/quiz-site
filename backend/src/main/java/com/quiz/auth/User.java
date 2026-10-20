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

    private String nickname;

    @Column(name = "avatar_url")
    private String avatarUrl;

    private String role;

    @Column(name = "password_hash")
    private String passwordHash;

    @Column(name = "created_at")
    private OffsetDateTime createdAt;
}
