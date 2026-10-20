package com.quiz.ai;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestClient;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * AI 答疑：单题讲解 / 引导式思考。
 * - 提示词只含题干+选项+官方解析，**不含用户答案**（缓存键只有 题目+模式，不串户）
 * - 命中 ai_explain_cache 不调模型、不占配额
 * - 每日配额由数据库 ai_quota_take 控制
 */
@Service
public class AiService {

    private final JdbcTemplate jdbc;
    private final ObjectMapper om = new ObjectMapper();
    private final String baseUrl;
    private final String apiKey;
    private final String model;

    public AiService(JdbcTemplate jdbc,
                     @Value("${quiz.ai.base-url:https://api.deepseek.com}") String baseUrl,
                     @Value("${quiz.ai.key:}") String apiKey,
                     @Value("${quiz.ai.model:deepseek-chat}") String model) {
        this.jdbc = jdbc;
        this.baseUrl = baseUrl;
        this.apiKey = apiKey;
        this.model = model;
    }

    private static final String SYS_EXPLAIN = """
            你是江苏专转本（计算机专业大类）的答疑老师。
            基于题目与官方解析，用简洁中文讲清考点、解题思路与易错点。不要发散。
            """;
    private static final String SYS_GUIDE = """
            你是江苏专转本（计算机专业大类）的引导式答疑老师。
            只给思路与提示，**不要直接给出答案**，用提问引导学生自己推出来。
            """;

    @Transactional
    public Map<String, Object> explain(UUID uid, int questionId, String mode) {
        String m = "guide".equals(mode) ? "guide" : "explain";

        // 1) 缓存命中直接返回
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

        // 2) 配额
        jdbc.queryForObject("select set_config('request.jwt.claim.sub', ?, true)", String.class, uid.toString());
        takeQuota();

        // 3) 组织题目上下文（不含用户答案）
        Map<String, Object> q = jdbc.queryForMap("""
                select stem, option_json, analysis from t_question where id = ? and not deleted
                """, questionId);
        String user = "题干：\n" + q.get("stem")
                + "\n\n选项：\n" + (q.get("option_json") == null ? "（无）" : q.get("option_json"))
                + "\n\n官方解析：\n" + (q.get("analysis") == null ? "（无）" : q.get("analysis"));

        // 4) 调模型
        String content = callModel("guide".equals(m) ? SYS_GUIDE : SYS_EXPLAIN, user);

        // 5) 写缓存
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

    /** 举一反三：生成同考点变式题（按题目缓存，不占用户配额以外的资源） */
    @Transactional
    public Map<String, Object> variant(UUID uid, int questionId) {
        List<Map<String, Object>> hit = jdbc.queryForList(
                "select answer_md from ai_explain_cache where question_id = ? and mode = 'variant'", questionId);
        if (!hit.isEmpty()) {
            return Map.of("content", hit.get(0).get("answer_md"), "cached", true);
        }
        if (apiKey == null || apiKey.isBlank()) {
            throw new IllegalStateException("AI 未配置密钥");
        }
        jdbc.queryForObject("select set_config('request.jwt.claim.sub', ?, true)", String.class, uid.toString());
        takeQuota();

        Map<String, Object> q = jdbc.queryForMap(
                "select stem, option_json, analysis, correct from t_question where id = ? and not deleted", questionId);
        String user = "原题：\n" + q.get("stem")
                + "\n选项：" + (q.get("option_json") == null ? "（无）" : q.get("option_json"))
                + "\n答案：" + q.get("correct")
                + "\n解析：" + (q.get("analysis") == null ? "（无）" : q.get("analysis"));

        String content = callModel(SYS_VARIANT, user);
        jdbc.update("""
                insert into ai_explain_cache (question_id, mode, answer_md, model) values (?, 'variant', ?, ?)
                on conflict (question_id, mode) do update set answer_md = excluded.answer_md
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

    /** 错题周报：基于最近 7 天错题让模型做薄弱点分析（不缓存，按用户即时生成） */
    public Map<String, Object> weekly(UUID uid) {
        if (apiKey == null || apiKey.isBlank()) {
            throw new IllegalStateException("AI 未配置密钥");
        }
        List<Map<String, Object>> wrongs = jdbc.queryForList("""
                select w.wrong_count as "wrongCount", left(q.stem, 60) as "stem",
                       coalesce(q.cat_l1, '') as "catL1", coalesce(q.cat_l3, '') as "catL3"
                  from wrong_question w join t_question q on q.id = w.question_id
                 where w.user_id = ? and w.last_wrong_at > now() - interval '7 days'
                 order by w.wrong_count desc limit 40
                """, uid);
        if (wrongs.isEmpty()) {
            return Map.of("content", "最近 7 天没有错题，保持得不错。", "count", 0);
        }
        StringBuilder sb = new StringBuilder("错题清单（错误次数 | 考点 | 题干）：\n");
        for (Map<String, Object> w : wrongs) {
            sb.append(w.get("wrongCount")).append(" | ")
              .append(w.get("catL1")).append(" ").append(w.get("catL3")).append(" | ")
              .append(w.get("stem")).append("\n");
        }
        String content = callModel(SYS_WEEKLY, sb.toString());
        return Map.of("content", content, "count", wrongs.size());
    }


    /** 扣减当日 AI 配额；超限时数据库会 raise，这里转成友好提示 */
    private void takeQuota() {
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

    private String callModel(String system, String user) {
        RestClient client = RestClient.builder()
                .baseUrl(baseUrl)
                .defaultHeader("Authorization", "Bearer " + apiKey)
                .defaultHeader("Content-Type", "application/json")
                .build();
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
            return node.path("choices").path(0).path("message").path("content").asText();
        } catch (Exception e) {
            throw new IllegalStateException("AI 调用失败：" + e.getMessage());
        }
    }
}
