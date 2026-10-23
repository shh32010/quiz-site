package com.quiz.auth;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;

/**
 * 解析 Authorization: Bearer <jwt>，把用户 id 放进 SecurityContext。
 * 同时校验 token 版本：改密/重置密码后，旧 token 立即失效。
 */
@Component
public class JwtAuthFilter extends OncePerRequestFilter {

    private final JwtService jwtService;
    private final JdbcTemplate jdbc;

    public JwtAuthFilter(JwtService jwtService, JdbcTemplate jdbc) {
        this.jwtService = jwtService;
        this.jdbc = jdbc;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
            throws ServletException, IOException {
        String header = req.getHeader("Authorization");
        if (header != null && header.startsWith("Bearer ")) {
            String token = header.substring(7);
            JwtService.TokenInfo info = jwtService.parse(token);
            String role = info == null ? null : currentRole(info);
            if (role != null) {
                String authority = "admin".equals(role) ? "ROLE_ADMIN" : "ROLE_USER";
                var auth = new UsernamePasswordAuthenticationToken(
                        info.uid(), null, List.of(new SimpleGrantedAuthority(authority)));
                SecurityContextHolder.getContext().setAuthentication(auth);
            }
        }
        chain.doFilter(req, res);
    }

    /**
     * 用数据库中的 role + token_version 校验；
     * 角色变更立即生效，用户不存在或版本不一致都视为未登录。
     */
    private String currentRole(JwtService.TokenInfo info) {
        List<java.util.Map<String, Object>> rows = jdbc.queryForList(
                "select role, coalesce(token_version, 0) as ver from profiles where id = ?", info.uid());
        if (rows.isEmpty()) {
            return null;
        }
        Object ver = rows.get(0).get("ver");
        if (!(ver instanceof Number) || ((Number) ver).intValue() != info.version()) {
            return null;
        }
        Object role = rows.get(0).get("role");
        return role == null ? "user" : role.toString();
    }
}
