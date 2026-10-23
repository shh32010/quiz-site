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
            if (info != null && versionMatches(info)) {
                String authority = "admin".equals(info.role()) ? "ROLE_ADMIN" : "ROLE_USER";
                var auth = new UsernamePasswordAuthenticationToken(
                        info.uid(), null, List.of(new SimpleGrantedAuthority(authority)));
                SecurityContextHolder.getContext().setAuthentication(auth);
            }
        }
        chain.doFilter(req, res);
    }

    /** 比对数据库中的 token_version；用户不存在或版本不一致都视为未登录 */
    private boolean versionMatches(JwtService.TokenInfo info) {
        List<Integer> rows = jdbc.queryForList(
                "select coalesce(token_version, 0) from profiles where id = ?", Integer.class, info.uid());
        return !rows.isEmpty() && rows.get(0) == info.version();
    }
}
