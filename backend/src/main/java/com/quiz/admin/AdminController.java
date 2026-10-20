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
        String where = "pending".equals(status) ? "and f.status = 'pending'" : "";
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
        int n = jdbc.update("update feedback set status = 'resolved', admin_note = ?, handled_at = now() where id = ?",
                note, id);
        return Map.of("updated", n);
    }

    /** 概览统计 */
    @GetMapping("/stats")
    public Map<String, Object> stats() {
        return jdbc.queryForMap("""
                select (select count(*) from profiles)                                     as "users",
                       (select count(*) from practice_session)                             as "sessions",
                       (select count(*) from practice_answer)                              as "answers",
                       (select count(*) from wrong_question where not resolved)            as "wrongPending",
                       (select count(*) from feedback where status = 'pending')            as "feedbackPending"
                """);
    }
}
