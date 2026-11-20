package com.quiz.config;

import com.quiz.auth.JwtAuthFilter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;
import java.util.List;

/**
 * 安全配置：JWT 无状态认证。
 * 只读接口公开；练习/错题/反馈等需登录。
 */
@Configuration
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, JwtAuthFilter jwtFilter,
                                           @Value("${quiz.cors.allowed-origins:}") String allowedOrigins)
            throws Exception {
        http
            .csrf(AbstractHttpConfigurer::disable)
            .cors(c -> c.configurationSource(corsSource(allowedOrigins)))
            .sessionManagement(s -> s.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            .exceptionHandling(e -> e
                .authenticationEntryPoint((req, res, ex) -> {
                    res.setStatus(401);
                    res.setContentType("application/json;charset=UTF-8");
                    res.getWriter().write("{\"message\":\"未登录或登录已过期\"}");
                })
                .accessDeniedHandler((req, res, ex) -> {
                    res.setStatus(403);
                    res.setContentType("application/json;charset=UTF-8");
                    res.getWriter().write("{\"message\":\"无权访问\"}");
                }))
            .authorizeHttpRequests(auth -> auth
                // 公开入口：仅放行明确无需登录的认证接口与健康探针
                .requestMatchers("/api/health", "/actuator/health",
                        "/api/auth/register", "/api/auth/login",
                        "/api/auth/forgot", "/api/auth/reset",
                        "/api/auth/email/verify").permitAll()
                // 其余认证接口（/me、/email、/password、/email/resend 等）强制需登录
                .requestMatchers("/api/auth/**").authenticated()
                // 其余 Actuator 端点仅管理员可访问
                .requestMatchers("/actuator/**").hasRole("ADMIN")
                // 知识点阅读进度需登录（置于 /api/knowledge/** 之前）
                .requestMatchers("/api/knowledge/progress/**").authenticated()
                .requestMatchers("/api/chapters/**", "/api/courses", "/api/papers/**", "/api/questions/**",
                        "/api/knowledge/**", "/api/guest/**", "/api/stats/collect", "/api/announcement").permitAll()
                // 需登录
                .requestMatchers("/api/admin/**").hasRole("ADMIN")
                .requestMatchers("/api/practice/**", "/api/wrong/**", "/api/feedback/**",
                        "/api/compose/**", "/api/exam/**", "/api/ai/**", "/api/report/**",
                        "/api/favorites/**").authenticated()
                .anyRequest().denyAll()
            )
            .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }

    private CorsConfigurationSource corsSource(String allowedOrigins) {
        List<String> patterns = allowedOrigins == null ? List.of()
                : Arrays.stream(allowedOrigins.split(",")).map(String::trim)
                        .filter(s -> !s.isEmpty()).toList();
        if (patterns.isEmpty()) {
            // 默认只允许本站已知入口，避免任意 Origin 携带凭证访问
            patterns = List.of("https://101-37-14-222.sslip.io", "https://*.teacher-wishes.asia",
                    "http://101.37.14.222", "http://localhost:3000");
        }
        CorsConfiguration cfg = new CorsConfiguration();
        cfg.setAllowedOriginPatterns(patterns);
        cfg.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        cfg.setAllowedHeaders(List.of("*"));
        cfg.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource src = new UrlBasedCorsConfigurationSource();
        src.registerCorsConfiguration("/**", cfg);
        return src;
    }
}
