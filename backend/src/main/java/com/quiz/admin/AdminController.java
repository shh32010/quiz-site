package com.quiz.admin;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 管理后台（仅 admin）。
 */
@RestController
@RequestMapping("/api/admin")
public class AdminController {

    private final JdbcTemplate jdbc;

    public AdminController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    /** 反馈列表 */
    @GetMapping("/feedback")
    public Map<String, Object> feedback(@RequestParam(defaultValue = "pending") String status) {
        String where = "pending".equals(status) ? "and f.status = 'open'" : "";
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select f.id, f.question_id as "questionId", f.type, f.content,
                       f.status, f.admin_note as "adminNote",
                       f.created_at as "createdAt", p.username,
                       left(q.stem, 80) as "stemPreview"
                  from feedback f
                  left join profiles p on p.id = f.user_id
                  left join t_question q on q.id = f.question_id
                 where true %s
                 order by f.created_at desc
                 limit 200
                """.formatted(where));
        return Map.of("rows", rows);
    }

    /** 标记处理 */
    @PostMapping("/feedback/{id}/resolve")
    public Map<String, Object> resolve(@PathVariable long id, @RequestBody(required = false) Map<String, String> body) {
        String note = body == null ? null : body.get("note");
        int n = jdbc.update("update feedback set status = 'handled', admin_note = ?, handled_at = now() where id = ?",
                note, id);
        return Map.of("updated", n);
    }

    /** 用户列表（含最近登录 IP / 时间） */
    @GetMapping("/users")
    public Map<String, Object> users() {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select p.id, p.username, coalesce(p.email, '') as email, p.role,
                       p.created_at as "createdAt",
                       p.last_ip as "lastIp", p.last_login_at as "lastLoginAt",
                       (select count(*) from practice_session s where s.user_id = p.id and s.deleted_at is null) as "sessions",
                       (select count(*) from practice_answer a where a.user_id = p.id and a.deleted_at is null) as "answers"
                  from profiles p
                 order by p.created_at desc
                """);
        return Map.of("rows", rows);
    }

    /** 概览统计 */
    @GetMapping("/stats")
    public Map<String, Object> stats() {
        return jdbc.queryForMap("""
                select (select count(*) from profiles)                                     as "users",
                       (select count(*) from practice_session where deleted_at is null)   as "sessions",
                       (select count(*) from practice_answer where deleted_at is null)    as "answers",
                       (select count(*) from wrong_question where not resolved and deleted_at is null) as "wrongPending",
                       (select count(*) from feedback where status = 'open')               as "feedbackPending"
                """);
    }

    /** 访问统计：近 N 天 PV/UV、每日趋势、热门页面 */
    @GetMapping("/visits")
    public Map<String, Object> visits(@RequestParam(defaultValue = "7") int days) {
        int d = Math.min(Math.max(days, 1), 90);
        // 统一从“近 N 天第一个自然日 00:00（Asia/Shanghai）”起算，保证 summary/top/daily 口径一致
        String start = "((now() at time zone 'Asia/Shanghai')::date - (?::int - 1))::timestamp at time zone 'Asia/Shanghai'";
        Map<String, Object> summary = jdbc.queryForMap("""
                select count(*) as "pv",
                       count(distinct visitor_id) as "uv",
                       count(*) filter (where is_mobile) as "mobilePv"
                  from page_view
                 where created_at >= %s
                """.formatted(start), d);
        List<Map<String, Object>> daily = jdbc.queryForList("""
                with days as (
                  select generate_series(
                    (now() at time zone 'Asia/Shanghai')::date - (?::int - 1),
                    (now() at time zone 'Asia/Shanghai')::date,
                    interval '1 day'
                  )::date as day
                ),
                agg as (
                  select (created_at at time zone 'Asia/Shanghai')::date as day,
                         count(*) as pv,
                         count(distinct visitor_id) as uv
                    from page_view
                   where created_at >= %s
                   group by 1
                )
                select to_char(d.day, 'MM-DD') as "day",
                       coalesce(agg.pv, 0) as "pv",
                       coalesce(agg.uv, 0) as "uv"
                  from days d
                  left join agg on agg.day = d.day
                 order by d.day
                """.formatted(start), d, d);
        List<Map<String, Object>> top = jdbc.queryForList("""
                select path,
                       count(*) as "pv",
                       count(distinct visitor_id) as "uv"
                  from page_view
                 where created_at >= %s
                 group by path
                 order by "pv" desc
                 limit 20
                """.formatted(start), d);
        return Map.of("days", d, "summary", summary, "daily", daily, "top", top);
    }
}
