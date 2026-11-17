package com.quiz.practice;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedHashMap;
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

    /** 非管理员每天最多做 200 道不同的题（按 Asia/Shanghai 自然日） */
    private static final int DAILY_QUESTION_LIMIT = 200;

    private final JdbcTemplate jdbc;

    public PracticeService(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    /**
     * 检查当日做题额度：管理员不限；普通用户按不同 question_id 计数。
     * 先取用户级事务锁，避免并发提交同时越过上限。
     * 不按 deleted_at 过滤，避免用户清空历史后重置额度。
     */
    private void enforceDailyQuestionLimit(UUID uid, int questionId) {
        String role = jdbc.queryForObject("select role from profiles where id = ?", String.class, uid);
        // admin：后台权限；unlimited：仅免限，仍是普通用户权限
        if ("admin".equals(role) || "unlimited".equals(role)) return;

        jdbc.queryForList("select pg_advisory_xact_lock(hashtextextended('practice_quota:' || ?, 0))",
                uid.toString());
        Integer used = jdbc.queryForObject("""
                select count(distinct question_id)
                  from practice_answer
                 where user_id = ?
                   and question_id <> ?
                   and answered_at >= date_trunc('day', now() at time zone 'Asia/Shanghai') at time zone 'Asia/Shanghai'
                   and answered_at <  (date_trunc('day', now() at time zone 'Asia/Shanghai') + interval '1 day') at time zone 'Asia/Shanghai'
                """, Integer.class, uid, questionId);
        if (used != null && used >= DAILY_QUESTION_LIMIT) {
            throw new IllegalStateException("今日做题已达 200 题上限，明天再来");
        }
    }

    private void bindUser(UUID uid) {
        jdbc.queryForObject("select set_config('request.jwt.claim.sub', ?, true)", String.class, uid.toString());
    }

    /** 开始会话，返回 sessionId 与题量 */
    @Transactional
    public Map<String, Object> start(UUID uid, String mode, String target, int limit, Integer type) {
        Integer targetId = switch (mode) {
            case "chapter", "paper", "kp", "single" -> {
                try {
                    yield Integer.valueOf(target);
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("target 必须是数字 id");
                }
            }
            default -> null;
        };
        List<Integer> ids = switch (mode) {
            case "chapter" -> {
                List<Object> params = new java.util.ArrayList<>();
                String sql;
                if (targetId != null && targetId < 0) {
                    // 虚拟“综合题（未挂三级）”：一级直属 + 二级非叶子章直属
                    int root = -targetId - 100000;
                    sql = """
                            select q.id from t_question q join t_chapter c on c.id = q.chapter_id
                             where not q.deleted and q.review_status = 'ok' and not c.deleted
                               and (c.id = ? or (c.parent_id = ? and c.level = 2
                                 and exists (select 1 from t_chapter ch where ch.parent_id = c.id and not ch.deleted)))
                            """;
                    params.add(root);
                    params.add(root);
                } else {
                    sql = """
                            with recursive sub as (
                              select id from t_chapter where id = ?
                              union all
                              select c.id from t_chapter c join sub s on c.parent_id = s.id
                            )
                            select q.id from t_question q join sub on sub.id = q.chapter_id
                             where not q.deleted and q.review_status = 'ok'
                            """;
                    params.add(targetId);
                }
                String typeFilter = "";
                if (type != null && type >= 1 && type <= 5) {
                    typeFilter = " and q.question_type = ?";
                    params.add(type);
                }
                params.add(limit);
                yield jdbc.queryForList(sql + typeFilter + " order by q.id limit ?", Integer.class, params.toArray());
            }
            case "course" -> jdbc.queryForList("""
                    select id from t_question
                     where not deleted and review_status = 'ok' and cat_l1 = ?
                     order by id limit ?
                    """, Integer.class, target, limit);
            case "paper" -> jdbc.queryForList("""
                    select e.question_id from exam_paper_question e
                      join t_question q on q.id = e.question_id
                     where e.paper_id = ? and e.is_active and not q.deleted
                       and q.review_status = 'ok'
                     order by e.item_order limit 500
                    """, Integer.class, targetId);
            case "kp" -> jdbc.queryForList("""
                    select q.id from t_question q
                     where not q.deleted and q.review_status = 'ok'
                       and (q.chapter_id = ? or q.id in (select x.question_id from t_question_kp x where x.kp_id = ?))
                     order by q.id limit ?
                    """, Integer.class, targetId, targetId, limit);
            // 单题练习：从章节题目列表点进来
            case "single" -> jdbc.queryForList("""
                    select id from t_question
                     where id = ? and not deleted and review_status = 'ok'
                    """, Integer.class, targetId);
            // 错题复习：支持按间隔重复状态（due/pending/frequent/resolved）与题型过滤，按未掌握优先、复习时间排序
            case "wrong" -> {
                List<Object> params = new java.util.ArrayList<>();
                params.add(uid);
                String statusFilter = switch (target == null ? "" : target.trim()) {
                    case "due" -> " and not w.resolved and (w.next_review_at is null or w.next_review_at <= now())";
                    case "pending" -> " and not w.resolved";
                    case "frequent" -> " and w.wrong_count >= 2";
                    case "resolved" -> " and w.resolved";
                    default -> "";
                };
                String typeFilter = "";
                if (type != null && type >= 1 && type <= 5) {
                    typeFilter = " and q.question_type = ?";
                    params.add(type);
                }
                params.add(limit);
                yield jdbc.queryForList("""
                        select w.question_id
                          from wrong_question w
                          join t_question q on q.id = w.question_id
                         where w.user_id = ? and w.deleted_at is null and not q.deleted and q.review_status = 'ok'
                        """ + statusFilter + typeFilter + """
                         order by w.resolved asc, w.next_review_at nulls last, w.question_id
                         limit ?
                        """, Integer.class, params.toArray());
            }
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
                "select count(*) from practice_session where id = ? and user_id = ? and deleted_at is null", Integer.class, sessionId, uid);
        if (n == null || n == 0) {
            throw new IllegalStateException("会话无效");
        }
    }

    /** 下一道未作答的题（不含答案） */
    public Map<String, Object> next(long sessionId, UUID uid) {
        requireOwn(sessionId, uid);
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select q.id, q.question_type as "questionType", q.stem, q.option_json as "optionJson",
                       q.score, q.blank_count as "blankCount",
                       (select substring(tc.content from '/qimg/[A-Za-z0-9._-]+')
                          from t_text_content tc where tc.id = q.info_text_content_id) as "imageUrl",
                       (select string_agg(m[1], ',')
                          from t_text_content tc, regexp_matches(tc.content, '(/qimg/[A-Za-z0-9._-]+)', 'g') m
                         where tc.id = q.info_text_content_id) as "imageUrls",
                       q.chapter_id as "chapterId",
                       c.code as "chapterCode", c.name as "chapterName",
                       (with recursive anc as (
                          select c2.id, c2.parent_id, c2.code, c2.name, 0 as depth
                            from t_chapter c2 where c2.id = q.chapter_id
                          union all
                          select p.id, p.parent_id, p.code, p.name, a.depth + 1
                            from t_chapter p join anc a on p.id = a.parent_id
                        )
                        select string_agg(trim(coalesce(code, '') || ' ' || name), ' › ' order by depth desc)
                          from anc) as "chapterPath",
                       sq.item_order as "itemOrder",
                       (select count(*) from session_question x where x.session_id = sq.session_id) as "total",
                       (select count(*) from practice_answer a where a.session_id = sq.session_id) as "answered"
                  from session_question sq
                  join practice_session ps on ps.id = sq.session_id and ps.finished_at is null and ps.deleted_at is null
                  join t_question q on q.id = sq.question_id
                  left join t_chapter c on c.id = q.chapter_id
                  left join practice_answer a
                         on a.session_id = sq.session_id and a.question_id = sq.question_id and a.deleted_at is null
                 where sq.session_id = ? and a.id is null
                 order by sq.item_order
                 limit 1
                """, sessionId);
        if (rows.isEmpty()) {
            return Map.of("kind", "done");
        }
        return Map.of("kind", "question", "question", rows.get(0));
    }

    /**
     * 答题卡：整个会话的题位与作答状态。
     * 不返回答案与解析，只返回是否作答、对错、得分。
     */
    public Map<String, Object> sheet(long sessionId, UUID uid) {
        requireOwn(sessionId, uid);
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select sq.item_order as "itemOrder",
                       sq.question_id as "questionId",
                       q.question_type as "questionType",
                       q.score,
                       (a.id is not null) as "answered",
                       a.is_correct as "isCorrect",
                       a.score_got as "scoreGot"
                  from session_question sq
                  join t_question q on q.id = sq.question_id
                  left join practice_answer a
                         on a.session_id = sq.session_id and a.question_id = sq.question_id and a.deleted_at is null
                 where sq.session_id = ?
                 order by sq.item_order
                """, sessionId);
        long answered = rows.stream()
                .filter(r -> Boolean.TRUE.equals(r.get("answered")))
                .count();
        Map<String, Object> out = new LinkedHashMap<>();
        out.put("total", rows.size());
        out.put("answered", answered);
        out.put("remaining", rows.size() - answered);
        out.put("rows", rows);
        return out;
    }

    /**
     * 续做：当前用户最近一个“有作答、非单题、未结束”的会话。
     * 单题会话不进入续做，避免首页/历史被大量点开就走的 single 会话淹没。
     */
    public Map<String, Object> resume(UUID uid) {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select s.id, s.mode, s.target_id as "targetId",
                       s.started_at as "startedAt",
                       case s.mode
                         when 'chapter' then (select trim(coalesce(c.code, '') || ' ' || c.name)
                                                from t_chapter c where c.id = s.target_id)
                         when 'chapter_random' then (select trim(coalesce(c.code, '') || ' ' || c.name)
                                                from t_chapter c where c.id = s.target_id)
                         when 'paper' then (select p.name from t_exam_paper p where p.id = s.target_id)
                         when 'kp' then coalesce((select trim(coalesce(c.code, '') || ' ' || c.name) from t_chapter c where c.id = s.target_id), (select k.title from t_knowledge_point k where k.id = s.target_id))
                         when 'wrong' then '错题复习'
                         when 'course' then '课程练习'
                         when 'random' then case s.target_id
                                              when 4 then '随机组卷 · 理论'
                                              when 5 then '随机组卷 · 实操'
                                              else '随机组卷' end
                         else s.mode
                       end as "targetName",
                       (select count(*) from session_question x where x.session_id = s.id) as "questionCount",
                       (select count(*) from practice_answer a where a.session_id = s.id and a.deleted_at is null) as "answeredCount",
                       (select count(*) from session_question x where x.session_id = s.id
                          and not exists (select 1 from practice_answer a
                                           where a.session_id = s.id and a.question_id = x.question_id
                                             and a.deleted_at is null)) as "remainingCount",
                       coalesce(s.elapsed_sec,
                                extract(epoch from (now() - s.started_at))::int) as "elapsedSec",
                       coalesce(p.suggest_time, 0) as "limitSec",
                       case when p.suggest_time is null then -1
                            else greatest(0, p.suggest_time - extract(epoch from (now() - s.started_at))::int)
                       end as "remainingSec"
                  from practice_session s
                  left join t_exam_paper p on p.id = s.target_id and s.mode = 'paper'
                 where s.user_id = ? and s.finished_at is null and s.deleted_at is null
                   and s.mode <> 'single'
                   and (select count(*) from session_question x where x.session_id = s.id) > 1
                   and (select count(*) from practice_answer a where a.session_id = s.id and a.deleted_at is null) > 0
                   and (s.mode <> 'paper' or p.suggest_time is null
                        or extract(epoch from (now() - s.started_at)) < p.suggest_time)
                 order by s.started_at desc
                 limit 1
                """, uid);
        Map<String, Object> out = new LinkedHashMap<>();
        out.put("session", rows.isEmpty() ? null : rows.get(0));
        return out;
    }

    /** 按顺序取某一道题（含是否已答），用于上一题/下一题 */
    public Map<String, Object> item(long sessionId, int order, UUID uid) {
        requireOwn(sessionId, uid);
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select q.id, q.question_type as "questionType", q.stem, q.option_json as "optionJson",
                       q.score, q.blank_count as "blankCount",
                       (select substring(tc.content from '/qimg/[A-Za-z0-9._-]+')
                          from t_text_content tc where tc.id = q.info_text_content_id) as "imageUrl",
                       (select string_agg(m[1], ',')
                          from t_text_content tc, regexp_matches(tc.content, '(/qimg/[A-Za-z0-9._-]+)', 'g') m
                         where tc.id = q.info_text_content_id) as "imageUrls",
                       q.chapter_id as "chapterId",
                       c.code as "chapterCode", c.name as "chapterName",
                       (with recursive anc as (
                          select c2.id, c2.parent_id, c2.code, c2.name, 0 as depth
                            from t_chapter c2 where c2.id = q.chapter_id
                          union all
                          select p.id, p.parent_id, p.code, p.name, a.depth + 1
                            from t_chapter p join anc a on p.id = a.parent_id
                        )
                        select string_agg(trim(coalesce(code, '') || ' ' || name), ' › ' order by depth desc)
                          from anc) as "chapterPath",
                       sq.item_order as "itemOrder",
                       (select count(*) from session_question x where x.session_id = sq.session_id) as "total",
                       (a.id is not null) as "answered", a.user_answer as "userAnswer",
                       a.is_correct as "isCorrect", a.score_got as "scoreGot"
                  from session_question sq
                  join practice_session ps on ps.id = sq.session_id and ps.finished_at is null and ps.deleted_at is null
                  join t_question q on q.id = sq.question_id
                  left join t_chapter c on c.id = q.chapter_id
                  left join practice_answer a
                         on a.session_id = sq.session_id and a.question_id = sq.question_id and a.deleted_at is null
                 where sq.session_id = ? and sq.item_order = ?
                """, sessionId, order);
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
        // 只允许提交当前会话内的可练习题，防止借任意 questionId 套取答案解析
        Integer inSession = jdbc.queryForObject("""
                select count(*)
                  from session_question sq
                  join practice_session ps on ps.id = sq.session_id and ps.deleted_at is null
                  join t_question q on q.id = sq.question_id
                 where sq.session_id = ? and sq.question_id = ?
                   and not q.deleted and q.review_status = 'ok'
                """, Integer.class, sessionId, questionId);
        if (inSession == null || inSession == 0) {
            throw new IllegalArgumentException("题目不属于当前会话");
        }
        enforceDailyQuestionLimit(uid, questionId);
        bindUser(uid);
        String json = jdbc.queryForObject("select submit_answer(?, ?, ?)::text",
                String.class, sessionId, questionId, answer);
        return readJson(json);
    }

    /** 交卷：总分按整卷/整个会话的题目分值计算，未作答的题也计入分母 */
    @Transactional
    public Map<String, Object> finish(long sessionId, UUID uid) {
        // 幂等：多标签页或浏览器后退重复交卷时，返回已有结算，不覆盖成绩
        List<Map<String, Object>> sessions = jdbc.queryForList("""
                select s.finished_at as "finishedAt", s.score, s.total_score as "totalScore",
                       s.correct_count as "correctCount",
                       (select count(*) from session_question x where x.session_id = s.id) as "questionCount"
                  from practice_session s
                 where s.id = ? and s.user_id = ? and s.deleted_at is null
                """, sessionId, uid);
        if (sessions.isEmpty()) {
            throw new IllegalStateException("会话无效");
        }
        Map<String, Object> existing = sessions.get(0);
        if (existing.get("finishedAt") != null) {
            Map<String, Object> out = new LinkedHashMap<>();
            out.put("score", existing.get("score"));
            out.put("total_score", existing.get("totalScore"));
            out.put("correct_count", existing.get("correctCount"));
            out.put("question_count", existing.get("questionCount"));
            addPaperInfo(sessionId, out);
            return out;
        }

        bindUser(uid);
        Integer totalScore = jdbc.queryForObject("""
                select coalesce(sum(q.score), 0)
                  from session_question sq
                  join t_question q on q.id = sq.question_id
                 where sq.session_id = ?
                """, Integer.class, sessionId);
        String json = jdbc.queryForObject("select finish_session(?, ?)::text",
                String.class, sessionId, totalScore);
        Map<String, Object> result = readJson(json);
        // finish_session 返回的是已答题数；这里改成会话总题数，避免“共 1 题”的误导
        Integer totalQuestions = jdbc.queryForObject(
                "select count(*) from session_question where session_id = ?", Integer.class, sessionId);
        result.put("question_count", totalQuestions == null ? 0 : totalQuestions);
        addPaperInfo(sessionId, result);
        return result;
    }

    /** 真题结算补充原卷题数/满分，前端据此说明缺口 */
    private void addPaperInfo(long sessionId, Map<String, Object> result) {
        List<Map<String, Object>> papers = jdbc.queryForList("""
                select p.question_count as "paperQuestionCount", p.score as "paperScore"
                  from practice_session s
                  join t_exam_paper p on p.id = s.target_id
                 where s.id = ? and s.mode = 'paper'
                """, sessionId);
        if (!papers.isEmpty()) {
            result.putAll(papers.get(0));
        }
    }

    private static Integer toInt(Object val) {
        return val instanceof Number n ? n.intValue() : null;
    }

    /** 会话状态：计时以服务端 started_at 为准；章节随机卷按题量×75秒计时且只提醒不强制交卷 */
    public Map<String, Object> status(long sessionId, UUID uid) {
        requireOwn(sessionId, uid);
        Map<String, Object> row = jdbc.queryForMap("""
                select s.started_at as "startedAt",
                       s.finished_at as "finishedAt",
                       s.mode,
                       coalesce(p.suggest_time,
                                case
                                  when s.mode = 'random' then
                                    case s.target_id when 4 then 6000 when 5 then 3000 end
                                  when s.mode = 'chapter_random' then
                                    nullif((select count(*)::int from session_question x where x.session_id = s.id), 0) * 75
                                end) as "limitSec",
                       extract(epoch from (now() - s.started_at))::int as "elapsedSec"
                  from practice_session s
                  left join t_exam_paper p on p.id = s.target_id and s.mode = 'paper'
                 where s.id = ?
                """, sessionId);
        String sessionMode = row.get("mode") == null ? "" : row.get("mode").toString();
        Integer limit = toInt(row.get("limitSec"));
        Integer elapsed = toInt(row.get("elapsedSec"));
        int safeElapsed = elapsed == null ? 0 : Math.max(0, elapsed);
        boolean timed = limit != null && limit > 0;
        boolean expired = timed && safeElapsed >= limit;
        // 仅章节随机组卷超时后不强制自动交卷，保持用户自主控制交卷节奏
        boolean autoSubmit = timed && !"chapter_random".equals(sessionMode);
        int remainingSec = !timed ? -1 : Math.max(0, limit - safeElapsed);
        int overtimeSec = (timed && safeElapsed > limit) ? (safeElapsed - limit) : 0;
        Map<String, Object> out = new LinkedHashMap<>();
        out.put("startedAt", row.get("startedAt") == null ? "" : row.get("startedAt").toString());
        out.put("finished", row.get("finishedAt") != null);
        out.put("mode", sessionMode);
        out.put("limitSec", timed ? limit : 0);
        out.put("elapsedSec", safeElapsed);
        out.put("remainingSec", remainingSec);
        out.put("overtimeSec", overtimeSec);
        out.put("expired", expired);
        out.put("autoSubmit", autoSubmit);
        return out;
    }

    /** 受控复盘：仅本会话已作答的题 */
    @Transactional
    public Map<String, Object> review(long sessionId, int questionId, UUID uid) {
        requireOwn(sessionId, uid);
        bindUser(uid);
        String json = jdbc.queryForObject("select get_answer(?, ?)::text", String.class, sessionId, questionId);
        Map<String, Object> result = readJson(json);
        // 复用现有 qc_grade 标记“解析可能不准确”，不新增字段
        String quality = jdbc.queryForObject(
                "select qc_grade from t_question where id = ?", String.class, questionId);
        result.put("qcGrade", quality == null ? "" : quality);
        return result;
    }
}
