package com.quiz.feedback;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 用户反馈（复用数据库 submit_feedback：含 20 条/天限流；并提供 /mine 查看处理结果）。
 */
@RestController
@RequestMapping("/api/feedback")
public class FeedbackController {

    public record Req(Integer questionId, String type, String content) {}

    private final JdbcTemplate jdbc;
    private final ObjectMapper mapper;

    public FeedbackController(JdbcTemplate jdbc) {
        this(jdbc, new ObjectMapper());
    }

    @Autowired
    public FeedbackController(JdbcTemplate jdbc, ObjectMapper mapper) {
        this.jdbc = jdbc;
        this.mapper = mapper;
    }

    /** 当前登录用户的反馈记录与处理状态（含管理员回复） */
    @GetMapping("/mine")
    public Map<String, Object> mine(@AuthenticationPrincipal UUID uid) {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select f.id, f.question_id as "questionId", f.type, f.content,
                       f.status, f.admin_note as "adminNote",
                       f.created_at as "createdAt", f.handled_at as "handledAt",
                       left(q.stem, 80) as "stemPreview"
                  from feedback f
                  left join t_question q on q.id = f.question_id
                 where f.user_id = ?
                 order by f.created_at desc
                 limit 100
                """, uid);
        return Map.of("rows", rows);
    }

    @PostMapping
    @Transactional
    public Map<String, Object> submit(@AuthenticationPrincipal UUID uid, @RequestBody Req req) {
        jdbc.queryForObject("select set_config('request.jwt.claim.sub', ?, true)", String.class, uid.toString());
        String json = jdbc.queryForObject(
                "select submit_feedback(?, ?, ?, ?)::text", String.class,
                req.questionId(), req.type() == null ? "other" : req.type(),
                req.content() == null ? "" : req.content(), null);
        try {
            @SuppressWarnings("unchecked")
            Map<String, Object> result = new LinkedHashMap<>(mapper.readValue(json, Map.class));
            if (req.questionId() != null) {
                result.put("similarCount", similarCount(req.questionId()));
            }
            return result;
        } catch (Exception e) {
            throw new IllegalStateException("反馈提交失败");
        }
    }

    /** 同章节同题型统计相似题数，供“举一反三”提示 */
    private Integer similarCount(Integer questionId) {
        Integer count = jdbc.queryForObject("""
                with target as (
                  select question_type, chapter_id from t_question where id = ? and not deleted
                )
                select count(*)
                  from t_question q
                 where q.id <> ?
                   and not q.deleted and q.review_status = 'ok'
                   and q.chapter_id = (select chapter_id from target)
                   and q.question_type = (select question_type from target)
                """, Integer.class, questionId, questionId);
        return count == null ? 0 : count;
    }
}
