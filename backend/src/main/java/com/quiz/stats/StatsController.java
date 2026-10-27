package com.quiz.stats;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.Locale;
import java.util.Map;

/**
 * 第一方访问统计采集：只存页面路径、匿名访客 ID、来源域名、是否移动端。
 * 不记录 IP 和原始 User-Agent；同一访客同一路径 30 秒内只记一次。
 */
@RestController
@RequestMapping("/api/stats")
public class StatsController {

    private final JdbcTemplate jdbc;
    private volatile long lastCleanup = 0;

    public StatsController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public record CollectReq(String path, String visitorId, String referrer, Boolean mobile) {}

    @Transactional
    @PostMapping("/collect")
    public Map<String, Object> collect(@RequestBody(required = false) CollectReq req,
                                       HttpServletRequest request) {
        if (req == null) {
            return Map.of("ok", true);
        }
        String path = normalizePath(req.path());
        String visitor = normalizeVisitor(req.visitorId());
        if (path == null || visitor == null) {
            return Map.of("ok", true);
        }

        String ua = request.getHeader("User-Agent");
        if (ua == null || ua.isBlank() || isBot(ua)) {
            return Map.of("ok", true);
        }

        // 同一访客+路径的事务级 advisory lock，避免并发“先查后插”同时插入
        jdbc.queryForList("select pg_advisory_xact_lock(hashtext(?), hashtext(?))", visitor, path);

        Integer recent = jdbc.queryForObject("""
                select count(*) from page_view
                 where visitor_id = ? and path = ? and created_at > now() - interval '30 seconds'
                """, Integer.class, visitor, path);
        if (recent != null && recent > 0) {
            return Map.of("ok", true);
        }

        jdbc.update("""
                insert into page_view(path, visitor_id, referrer_host, is_mobile)
                values (?, ?, ?, ?)
                """, path, visitor, normalizeReferrer(req.referrer()), Boolean.TRUE.equals(req.mobile()));

        cleanupOld();
        return Map.of("ok", true);
    }

    private static String normalizePath(String raw) {
        if (raw == null) {
            return null;
        }
        String path = raw.trim();
        int query = path.indexOf('?');
        if (query >= 0) path = path.substring(0, query);
        int hash = path.indexOf('#');
        if (hash >= 0) path = path.substring(0, hash);
        if (!path.startsWith("/") || path.length() > 200) {
            return null;
        }
        if (path.startsWith("/api/") || path.startsWith("/_nuxt") || path.startsWith("/qimg/")
                || path.equals("/admin") || path.startsWith("/admin/")
                || path.startsWith("/verify-email")) {
            return null;
        }
        return path.matches("^/[A-Za-z0-9/_-]*$") ? path : null;
    }

    private static String normalizeVisitor(String raw) {
        if (raw == null) {
            return null;
        }
        String value = raw.trim();
        return value.matches("^[A-Za-z0-9_-]{8,64}$") ? value : null;
    }

    private static String normalizeReferrer(String raw) {
        if (raw == null || raw.isBlank()) {
            return null;
        }
        try {
            String host = URI.create(raw.trim()).getHost();
            if (host == null || host.isBlank()) {
                return null;
            }
            return host.length() > 128 ? host.substring(0, 128) : host;
        } catch (Exception e) {
            return null;
        }
    }

    private static boolean isBot(String userAgent) {
        String ua = userAgent.toLowerCase(Locale.ROOT);
        return ua.contains("bot") || ua.contains("spider") || ua.contains("crawler")
                || ua.contains("headless") || ua.contains("curl") || ua.contains("wget")
                || ua.contains("python-requests") || ua.contains("uptimerobot");
    }

    /** 每小时最多清理一次 180 天前的数据 */
    private void cleanupOld() {
        long now = System.currentTimeMillis();
        if (now - lastCleanup < 3_600_000L) {
            return;
        }
        lastCleanup = now;
        try {
            jdbc.update("delete from page_view where created_at < now() - interval '180 days'");
        } catch (Exception ignored) {
            // 清理失败不影响采集
        }
    }
}
