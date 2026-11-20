package com.quiz.practice;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.Duration;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 游客试做与知识点随堂自测判分：不落库、不进错题本。
 * 为防止匿名脚本通过本接口批量抓取全库答案与解析，施加按自然日（Asia/Shanghai）的去重题量限额：
 * - 未登录游客：按真实 IP 每日最多 20 道不同题（同题重做不重复扣额）
 * - 已登录普通用户（讲义随堂自测）：按用户 ID 每日最多 200 道不同题
 * - admin / unlimited 角色：免限
 */
@RestController
@RequestMapping("/api/guest")
public class GuestController {

    private static final Logger log = LoggerFactory.getLogger(GuestController.class);
    private static final int GUEST_DAILY_LIMIT = 20;
    private static final int USER_DAILY_LIMIT = 200;
    private static final int MAX_ANSWER_LENGTH = 10_000;
    private static final int LOCAL_FALLBACK_MAX_KEYS = 10_000;
    private static final Duration QUOTA_TTL = Duration.ofHours(25);
    private static final ZoneId SHANGHAI = ZoneId.of("Asia/Shanghai");

    public record Req(Integer questionId, String answer) {}

    private final JdbcTemplate jdbc;
    private final ObjectMapper om;
    private final StringRedisTemplate redis;

    /** Redis 不可用时的进程内兜底限流表，按自然日自动清理 */
    private final ConcurrentHashMap<String, Set<Integer>> localFallback = new ConcurrentHashMap<>();
    private final Object localFallbackLock = new Object();
    private volatile String localFallbackDay = "";

    public GuestController(JdbcTemplate jdbc, ObjectMapper om, StringRedisTemplate redis) {
        this.jdbc = jdbc;
        this.om = om;
        this.redis = redis;
    }

    @PostMapping("/answer")
    @SuppressWarnings("unchecked")
    public ResponseEntity<?> answer(@AuthenticationPrincipal UUID uid,
                                    @RequestBody Req req,
                                    HttpServletRequest request) {
        if (req == null || req.questionId() == null) {
            throw new IllegalArgumentException("questionId 必填");
        }
        String answer = req.answer() == null ? "" : req.answer();
        if (answer.length() > MAX_ANSWER_LENGTH) {
            throw new IllegalArgumentException("答案过长");
        }

        // 分级日配额拦截（放在 judge_answer 之前，防止刷题库答案）
        String limitErr = checkDailyQuota(uid, req.questionId(), request);
        if (limitErr != null) {
            return ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS)
                    .body(Map.of("message", limitErr));
        }

        String json = jdbc.queryForObject("select judge_answer(?, ?)::text",
                String.class, req.questionId(), answer);
        try {
            Map<String, Object> result = om.readValue(json, Map.class);
            String quality = jdbc.queryForObject(
                    "select qc_grade from t_question where id = ?", String.class, req.questionId());
            result.put("qcGrade", quality == null ? "" : quality);
            return ResponseEntity.ok(result);
        } catch (Exception e) {
            throw new IllegalStateException("判分失败");
        }
    }

    /** 校验并记入当日去重题量；通过返回 null，超限返回提示文案 */
    private String checkDailyQuota(UUID uid, int questionId, HttpServletRequest request) {
        String day = LocalDate.now(SHANGHAI).toString().replace("-", "");
        if (uid != null) {
            List<Map<String, Object>> rows = jdbc.queryForList(
                    "select role from profiles where id = ?", uid);
            Object role = rows.isEmpty() ? null : rows.getFirst().get("role");
            if ("admin".equals(role) || "unlimited".equals(role)) {
                return null;
            }
            String key = "quiz:guest:u:" + uid + ":" + day;
            return tryAcquire(key, day, questionId, USER_DAILY_LIMIT)
                    ? null
                    : "今日自测已达 200 题上限，明天再来";
        }
        String ip = clientIp(request);
        String key = "quiz:guest:ip:" + ip + ":" + day;
        return tryAcquire(key, day, questionId, GUEST_DAILY_LIMIT)
                ? null
                : "游客今日试做已达 20 题上限，登录后可继续练习";
    }

    /** 在 Redis Set 中原子登记去重题号，超限时回滚新增项；Redis 异常自动降级本地有界表 */
    private boolean tryAcquire(String key, String day, int questionId, int limit) {
        if (redis != null) {
            try {
                SetOperations<String, String> ops = redis.opsForSet();
                String qid = String.valueOf(questionId);
                if (Boolean.TRUE.equals(ops.isMember(key, qid))) {
                    return true;
                }
                Long added = ops.add(key, qid);
                redis.expire(key, QUOTA_TTL);
                Long count = ops.size(key);
                if (count != null && count > limit) {
                    if (added != null && added > 0) {
                        ops.remove(key, qid);
                    }
                    return false;
                }
                return true;
            } catch (Exception e) {
                log.warn("Redis 游客限流异常，降级为本地内存限流: {}", e.getMessage());
            }
        }
        return tryAcquireLocal(key, day, questionId, limit);
    }

    private boolean tryAcquireLocal(String key, String day, int questionId, int limit) {
        if (!day.equals(localFallbackDay) || localFallback.size() > LOCAL_FALLBACK_MAX_KEYS) {
            synchronized (localFallbackLock) {
                if (!day.equals(localFallbackDay) || localFallback.size() > LOCAL_FALLBACK_MAX_KEYS) {
                    localFallback.clear();
                    localFallbackDay = day;
                }
            }
        }
        Set<Integer> seen = localFallback.computeIfAbsent(key, k -> ConcurrentHashMap.newKeySet());
        synchronized (seen) {
            if (seen.contains(questionId)) {
                return true;
            }
            if (seen.size() >= limit) {
                return false;
            }
            seen.add(questionId);
            return true;
        }
    }

    /** 优先取 nginx 覆盖写入的 X-Real-IP，避免客户端伪造 X-Forwarded-For */
    private static String clientIp(HttpServletRequest request) {
        if (request == null) {
            return "unknown";
        }
        String real = request.getHeader("X-Real-IP");
        if (real != null && !real.isBlank()) {
            return truncate(real.trim());
        }
        String xff = request.getHeader("X-Forwarded-For");
        if (xff != null && !xff.isBlank()) {
            String first = xff.split(",")[0].trim();
            if (!first.isEmpty()) {
                return truncate(first);
            }
        }
        String remote = request.getRemoteAddr();
        return remote == null || remote.isBlank() ? "unknown" : truncate(remote.trim());
    }

    private static String truncate(String s) {
        return s.length() > 64 ? s.substring(0, 64) : s;
    }
}
