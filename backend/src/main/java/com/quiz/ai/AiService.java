package com.quiz.ai;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.client.RestClient;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.HexFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * AI 答疑：单题讲解 / 引导式思考 / 变式题 / 错题周报。
 * - 提示词只含题干+选项+官方解析，**不含用户答案**（单题缓存键只有 题目+模式，不串户）
 * - 命中缓存不调模型、不占配额
 * - 每日配额由数据库 ai_quota_take 控制；外部 HTTP 调用放在事务外，避免长耗时占满数据库连接池
 */
@Service
public class AiService {

    private static final Logger log = LoggerFactory.getLogger(AiService.class);
    private static final ZoneId SHANGHAI = ZoneId.of("Asia/Shanghai");
    private static final Duration WEEKLY_CACHE_TTL = Duration.ofHours(6);

    private final JdbcTemplate jdbc;
    private final TransactionTemplate tx;
    private final ObjectMapper om;
    private final StringRedisTemplate redis;
    private final RestClient client;
    private final String apiKey;
    private final String model;

    public AiService(JdbcTemplate jdbc,
                     TransactionTemplate tx,
                     ObjectMapper om,
                     StringRedisTemplate redis,
                     @Value("${quiz.ai.base-url:https://api.deepseek.com}") String baseUrl,
                     @Value("${quiz.ai.key:}") String apiKey,
                     @Value("${quiz.ai.model:deepseek-chat}") String model) {
        this.jdbc = jdbc;
        this.tx = tx;
        this.om = om;
        this.redis = redis;
        this.apiKey = apiKey;
        this.model = model;

        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(5000);
        factory.setReadTimeout(60000);
        this.client = RestClient.builder()
                .requestFactory(factory)
                .baseUrl(baseUrl)
                .defaultHeader("Authorization", "Bearer " + (apiKey == null ? "" : apiKey))
                .defaultHeader("Content-Type", "application/json")
                .build();
    }

    private static final String SYS_EXPLAIN = """
            你是江苏专转本（计算机专业大类）的答疑老师。
            基于题目与官方解析，用简洁中文讲清考点、解题思路与易错点。不要发散。
            """;
    private static final String SYS_GUIDE = """
            你是江苏专转本（计算机专业大类）的引导式答疑老师。
            只给思路与提示，**不要直接给出答案**，用提问引导学生自己推出来。
            """;

    public Map<String, Object> explain(UUID uid, int questionId, String mode) {
        String m = "guide".equals(mode) ? "guide" : "explain";

        // 1) 缓存命中直接返回（无事务、不占配额）
        List<Map<String, Object>> hit = jdbc.queryForList(
                "select answer_md, model from ai_explain_cache where question_id = ? and mode = ?",
                questionId, m);
        if (!hit.isEmpty()) {
            return Map.of("content", hit.get(0).get("answer_md"), "cached", true,
                    "model", hit.get(0).get("model"));
        }

        if (apiKey == null || apiKey.isBlank()) {
            throw new IllegalStateException("AI 答疑未配置密钥");
        }

        // 2) 短事务：查题 + 扣减配额，立即释放数据库连接
        String userPrompt = tx.execute(status -> {
            List<Map<String, Object>> rows = jdbc.queryForList("""
                    select stem, option_json, analysis from t_question where id = ? and not deleted
                    """, questionId);
            if (rows.isEmpty()) {
                throw new IllegalArgumentException("题目不存在或已下架");
            }
            takeQuotaInTx(uid);
            Map<String, Object> q = rows.getFirst();
            return "题干：\n" + q.get("stem")
                    + "\n\n选项：\n" + (q.get("option_json") == null ? "（无）" : q.get("option_json"))
                    + "\n\n官方解析：\n" + (q.get("analysis") == null ? "（无）" : q.get("analysis"));
        });

        // 3) 事务外调用外部模型（最长 60s），不占用数据库连接池
        String content = callModel("guide".equals(m) ? SYS_GUIDE : SYS_EXPLAIN, userPrompt);

        // 4) 单条自动提交写缓存
        jdbc.update("""
                insert into ai_explain_cache (question_id, mode, answer_md, model)
                values (?,?,?,?)
                on conflict (question_id, mode) do update set answer_md = excluded.answer_md, model = excluded.model
                """, questionId, m, content, model);

        return Map.of("content", content, "cached", false, "model", model);
    }

    private static final String SYS_VARIANT = """
            你是江苏专转本（计算机专业大类）的命题老师。
            基于给定题目出一道**同考点变式题**：改变数字/情境/表述，但考查知识点相同，难度相当。
            只输出一个 JSON 对象（不要 markdown）：
            {"stem":"题干","options":{"A":"...","B":"...","C":"...","D":"..."},"answer":"A","explanation":"一句解析"}
            判断题 options 留空、answer 用「对」或「错」；填空题 options 留空、answer 填答案文本。
            """;

    /** 举一反三：生成同考点变式题（按题目缓存，外部模型调用在事务外） */
    public Map<String, Object> variant(UUID uid, int questionId) {
        List<Map<String, Object>> hit = jdbc.queryForList(
                "select answer_md from ai_explain_cache where question_id = ? and mode = 'variant'", questionId);
        if (!hit.isEmpty()) {
            return Map.of("content", hit.get(0).get("answer_md"), "cached", true);
        }
        if (apiKey == null || apiKey.isBlank()) {
            throw new IllegalStateException("AI 未配置密钥");
        }

        String userPrompt = tx.execute(status -> {
            List<Map<String, Object>> rows = jdbc.queryForList(
                    "select stem, option_json, analysis, correct from t_question where id = ? and not deleted",
                    questionId);
            if (rows.isEmpty()) {
                throw new IllegalArgumentException("题目不存在或已下架");
            }
            takeQuotaInTx(uid);
            Map<String, Object> q = rows.getFirst();
            return "原题：\n" + q.get("stem")
                    + "\n选项：" + (q.get("option_json") == null ? "（无）" : q.get("option_json"))
                    + "\n答案：" + q.get("correct")
                    + "\n解析：" + (q.get("analysis") == null ? "（无）" : q.get("analysis"));
        });

        String content = callModel(SYS_VARIANT, userPrompt);
        jdbc.update("""
                insert into ai_explain_cache (question_id, mode, answer_md, model) values (?, 'variant', ?, ?)
                on conflict (question_id, mode) do update set answer_md = excluded.answer_md, model = excluded.model
                """, questionId, content, model);
        return Map.of("content", content, "cached", false);
    }

    private static final String SYS_WEEKLY = """
            你是江苏专转本（计算机专业大类）的学习顾问。
            根据学生最近 7 天的错题清单，用简明中文输出：
            1）薄弱知识点（按错误次数排序，最多 5 条）
            2）针对性建议（具体到该练什么）
            不要泛泛而谈，不要编造清单里没有的知识点。
            """;

    /** 错题周报：纳入每日 AI 配额，并按「用户 + 当日 + 错题摘要哈希」缓存 6 小时避免重复刷额度 */
    public Map<String, Object> weekly(UUID uid) {
        List<Map<String, Object>> wrongs = jdbc.queryForList("""
                select w.wrong_count as "wrongCount", left(q.stem, 60) as "stem",
                       coalesce(q.cat_l1, '') as "catL1", coalesce(q.cat_l3, '') as "catL3"
                  from wrong_question w join t_question q on q.id = w.question_id
                 where w.user_id = ? and w.deleted_at is null and w.last_wrong_at > now() - interval '7 days'
                 order by w.wrong_count desc limit 40
                """, uid);
        if (wrongs.isEmpty()) {
            return Map.of("content", "最近 7 天没有错题，保持得不错。", "count", 0, "cached", false);
        }

        StringBuilder sb = new StringBuilder("错题清单（错误次数 | 考点 | 题干）：\n");
        for (Map<String, Object> w : wrongs) {
            sb.append(w.get("wrongCount")).append(" | ")
              .append(w.get("catL1")).append(" ").append(w.get("catL3")).append(" | ")
              .append(w.get("stem")).append("\n");
        }
        String prompt = sb.toString();
        String cacheKey = weeklyCacheKey(uid, prompt);

        // 1) 命中同日同错题集缓存直接返回，不扣配额
        String cached = readWeeklyCache(cacheKey);
        if (cached != null && !cached.isBlank()) {
            return Map.of("content", cached, "count", wrongs.size(), "cached", true);
        }

        if (apiKey == null || apiKey.isBlank()) {
            throw new IllegalStateException("AI 未配置密钥");
        }

        // 2) 短事务扣减每日 AI 配额，随后在事务外调用模型
        tx.execute(status -> {
            takeQuotaInTx(uid);
            return null;
        });

        String content = callModel(SYS_WEEKLY, prompt);
        writeWeeklyCache(cacheKey, content);
        return Map.of("content", content, "count", wrongs.size(), "cached", false);
    }

    private String weeklyCacheKey(UUID uid, String prompt) {
        String day = LocalDate.now(SHANGHAI).toString().replace("-", "");
        return "quiz:ai:weekly:" + uid + ":" + day + ":" + sha256Prefix(prompt);
    }

    private String readWeeklyCache(String key) {
        if (redis == null) {
            return null;
        }
        try {
            return redis.opsForValue().get(key);
        } catch (Exception e) {
            log.warn("读取 AI 周报缓存失败，降级直连模型: {}", e.getMessage());
            return null;
        }
    }

    private void writeWeeklyCache(String key, String content) {
        if (redis == null || content == null || content.isBlank()) {
            return;
        }
        try {
            redis.opsForValue().set(key, content, WEEKLY_CACHE_TTL);
        } catch (Exception e) {
            log.warn("写入 AI 周报缓存失败: {}", e.getMessage());
        }
    }

    /** 在当前事务内绑定用户并扣减当日 AI 配额；超限时转成友好提示 */
    private void takeQuotaInTx(UUID uid) {
        jdbc.queryForObject("select set_config('request.jwt.claim.sub', ?, true)", String.class, uid.toString());
        try {
            jdbc.queryForObject("select ai_quota_take(50)", Integer.class);
        } catch (org.springframework.dao.DataAccessException e) {
            String msg = String.valueOf(e.getMostSpecificCause().getMessage());
            if (msg.contains("上限")) {
                throw new IllegalStateException("今日 AI 次数已用完（50 次/天）");
            }
            throw e;
        }
    }

    protected String callModel(String system, String user) {
        String body;
        try {
            body = om.writeValueAsString(Map.of(
                    "model", model,
                    "messages", List.of(Map.of("role", "system", "content", system),
                            Map.of("role", "user", "content", user)),
                    "stream", false));
        } catch (Exception e) {
            throw new IllegalStateException("请求构造失败");
        }
        try {
            String resp = client.post().uri("/chat/completions").body(body).retrieve().body(String.class);
            JsonNode node = om.readTree(resp);
            String content = node.path("choices").path(0).path("message").path("content").asText("");
            if (content.isBlank()) {
                log.warn("AI 模型返回空内容");
                throw new IllegalStateException("AI 服务暂时不可用，请稍后重试");
            }
            return content;
        } catch (IllegalStateException e) {
            throw e;
        } catch (Exception e) {
            // 只记录服务端日志，避免把上游地址、响应体等内部信息透传给前端
            log.warn("AI 模型调用失败: {}", e.getMessage());
            throw new IllegalStateException("AI 服务暂时不可用，请稍后重试");
        }
    }

    private static String sha256Prefix(String text) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            return HexFormat.of().formatHex(md.digest(text.getBytes(StandardCharsets.UTF_8))).substring(0, 16);
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("SHA-256 不可用", e);
        }
    }
}
