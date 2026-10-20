package com.quiz.practice;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 刷题会话：开始 → 取题 → 判分 → 交卷。
 *
 * 判分/交卷复用数据库里已验证的 plpgsql 函数（submit_answer / finish_session / get_answer），
 * 调用前在**同一事务**内注入 request.jwt.claim.sub，使 auth.uid() 生效。
 */
@Service
public class PracticeService {

    private final JdbcTemplate jdbc;

    public PracticeService(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    private void bindUser(UUID uid) {
        jdbc.queryForObject("select set_config('request.jwt.claim.sub', ?, true)", String.class, uid.toString());
    }

    /** 开始会话，返回 sessionId 与题量 */
    @Transactional
    public Map<String, Object> start(UUID uid, String mode, String target, int limit) {
        Integer targetId = switch (mode) {
            case "chapter", "paper" -> {
                try {
                    yield Integer.valueOf(target);
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("target 必须是数字 id");
                }
            }
            default -> null;
        };
        List<Integer> ids = switch (mode) {
            case "chapter" -> jdbc.queryForList("""
                    with recursive sub as (
                      select id from t_chapter where id = ?
                      union all
                      select c.id from t_chapter c join sub s on c.parent_id = s.id
                    )
                    select q.id from t_question q join sub on sub.id = q.chapter_id
                     where not q.deleted and q.review_status = 'ok'
                     order by q.id limit ?
                    """, Integer.class, targetId, limit);
            case "course" -> jdbc.queryForList("""
                    select id from t_question
                     where not deleted and review_status = 'ok' and cat_l1 = ?
                     order by id limit ?
                    """, Integer.class, target, limit);
            case "paper" -> jdbc.queryForList("""
                    select e.question_id from exam_paper_question e
                      join t_question q on q.id = e.question_id
                     where e.paper_id = ? and e.is_active and not q.deleted
                     order by e.item_order limit ?
                    """, Integer.class, targetId, limit);
            default -> throw new IllegalArgumentException("mode 非法: " + mode);
        };
        if (ids.isEmpty()) {
            throw new IllegalStateException("该范围下没有可练习题");
        }

        Long sessionId = jdbc.queryForObject("""
                insert into practice_session (user_id, mode, target_id, started_at)
                values (?, ?, ?, now()) returning id
                """, Long.class, uid, mode, targetId);

        List<Object[]> rows = new java.util.ArrayList<>();
        for (int i = 0; i < ids.size(); i++) {
            rows.add(new Object[]{sessionId, i + 1, ids.get(i)});
        }
        jdbc.batchUpdate("insert into session_question (session_id, item_order, question_id) values (?,?,?)", rows);

        return Map.of("sessionId", sessionId, "count", ids.size());
    }

    private void requireOwn(long sessionId, UUID uid) {
        Integer n = jdbc.queryForObject(
                "select count(*) from practice_session where id = ? and user_id = ?", Integer.class, sessionId, uid);
        if (n == null || n == 0) {
            throw new IllegalStateException("会话无效");
        }
    }

    /** 下一道未作答的题（不含答案） */
    public Map<String, Object> next(long sessionId, UUID uid) {
        requireOwn(sessionId, uid);
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select q.id, q.question_type as "questionType", q.stem, q.option_json as "optionJson",
                       q.score, q.blank_count as "blankCount", sq.item_order as "itemOrder",
                       (select count(*) from session_question x where x.session_id = sq.session_id) as "total",
                       (select count(*) from practice_answer a where a.session_id = sq.session_id) as "answered"
                  from session_question sq
                  join t_question q on q.id = sq.question_id
                  left join practice_answer a
                         on a.session_id = sq.session_id and a.question_id = sq.question_id
                 where sq.session_id = ? and a.id is null
                 order by sq.item_order
                 limit 1
                """, sessionId);
        if (rows.isEmpty()) {
            return Map.of("kind", "done");
        }
        return Map.of("kind", "question", "question", rows.get(0));
    }

    @SuppressWarnings("unchecked")
    private Map<String, Object> readJson(String json) {
        try {
            return new com.fasterxml.jackson.databind.ObjectMapper().readValue(json, Map.class);
        } catch (Exception e) {
            throw new IllegalStateException("解析函数返回值失败: " + e.getMessage());
        }
    }

    /** 提交作答并判分；返回 is_correct / score_got / max_score */
    @Transactional
    public Map<String, Object> submit(long sessionId, int questionId, String answer, UUID uid) {
        bindUser(uid);
        String json = jdbc.queryForObject("select submit_answer(?, ?, ?)::text",
                String.class, sessionId, questionId, answer);
        return readJson(json);
    }

    /** 交卷 */
    @Transactional
    public Map<String, Object> finish(long sessionId, UUID uid) {
        bindUser(uid);
        String json = jdbc.queryForObject("select finish_session(?)::text", String.class, sessionId);
        return readJson(json);
    }

    /** 会话状态：计时以服务端 started_at 为准 */
    public Map<String, Object> status(long sessionId, UUID uid) {
        requireOwn(sessionId, uid);
        Map<String, Object> row = jdbc.queryForMap("""
                select s.started_at as "startedAt",
                       s.finished_at as "finishedAt",
                       s.mode,
                       p.suggest_time as "limitSec",
                       extract(epoch from (now() - s.started_at))::int as "elapsedSec"
                  from practice_session s
                  left join t_exam_paper p on p.id = s.target_id and s.mode = 'paper'
                 where s.id = ?
                """, sessionId);
        Integer limit = (Integer) row.get("limitSec");
        Integer elapsed = (Integer) row.get("elapsedSec");
        boolean expired = limit != null && elapsed != null && elapsed >= limit;
        return Map.of(
                "startedAt", row.get("startedAt") == null ? "" : row.get("startedAt").toString(),
                "finished", row.get("finishedAt") != null,
                "mode", row.get("mode"),
                "limitSec", limit == null ? 0 : limit,
                "elapsedSec", elapsed == null ? 0 : elapsed,
                "remainingSec", limit == null ? -1 : Math.max(0, limit - elapsed),
                "expired", expired);
    }

    /** 受控复盘：仅本会话已作答的题 */
    @Transactional
    public Map<String, Object> review(long sessionId, int questionId, UUID uid) {
        bindUser(uid);
        String json = jdbc.queryForObject("select get_answer(?, ?)::text", String.class, sessionId, questionId);
        return readJson(json);
    }
}
