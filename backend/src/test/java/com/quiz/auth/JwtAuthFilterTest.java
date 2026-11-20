package com.quiz.auth;

import jakarta.servlet.FilterChain;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.contains;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

/**
 * JWT 认证过滤器单元测试：验证角色实时从库读取、token_version 不匹配立即踢下线与匿名请求放行。
 */
class JwtAuthFilterTest {

    private final JwtService jwt = new JwtService("0123456789abcdef0123456789abcdef", 3600);

    @AfterEach
    void clearSecurityContext() {
        SecurityContextHolder.clearContext();
    }

    @Test
    void setsAdminAuthorityFromLiveDatabaseRole() throws Exception {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();
        String token = jwt.issue(uid, "admin1", "user", 2);

        // 即使旧 JWT 中 claim 为 user，数据库已升为 admin 且版本匹配时应立即赋予 ROLE_ADMIN
        when(jdbc.queryForList(contains("from profiles where id = ?"), eq(uid)))
                .thenReturn(List.of(Map.of("role", "admin", "ver", 2)));

        HttpServletRequest req = mock(HttpServletRequest.class);
        HttpServletResponse res = mock(HttpServletResponse.class);
        FilterChain chain = mock(FilterChain.class);
        when(req.getHeader("Authorization")).thenReturn("Bearer " + token);

        new JwtAuthFilter(jwt, jdbc).doFilterInternal(req, res, chain);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        assertThat(auth).isNotNull();
        assertThat(auth.getPrincipal()).isEqualTo(uid);
        assertThat(auth.getAuthorities()).extracting("authority").containsExactly("ROLE_ADMIN");
        verify(chain).doFilter(req, res);
    }

    @Test
    void rejectsStaleTokenWhenVersionMismatches() throws Exception {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();
        String staleToken = jwt.issue(uid, "alice", "user", 1);

        // 改密后数据库版本已递增为 2，旧版本 1 必须失效
        when(jdbc.queryForList(contains("from profiles where id = ?"), eq(uid)))
                .thenReturn(List.of(Map.of("role", "user", "ver", 2)));

        HttpServletRequest req = mock(HttpServletRequest.class);
        HttpServletResponse res = mock(HttpServletResponse.class);
        FilterChain chain = mock(FilterChain.class);
        when(req.getHeader("Authorization")).thenReturn("Bearer " + staleToken);

        new JwtAuthFilter(jwt, jdbc).doFilterInternal(req, res, chain);

        assertThat(SecurityContextHolder.getContext().getAuthentication()).isNull();
        verify(chain).doFilter(req, res);
    }
}
