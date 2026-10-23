package com.quiz.practice;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 做题历史：只返回当前用户自己的练习会话与作答明细。
 * GET /api/practice/history?page=1&size=20
 * GET /api/practice/history/{sessionId}?page=1&size=50
 */
@RestController
@RequestMapping("/api/practice/history")
public class PracticeHistoryController {

    /** 会话标题：按 mode 关联章节 / 试卷 / 知识点 / 单题 */
    private static final String TARGET_NAME = """
            case s.mode
              when 'chapter' then (select trim(coalesce(c.code, '') || ' ' || c.name) from t_chapter c where c.id = s.target_id)
              when 'paper' then (select p.name from t_exam_paper p where p.id = s.target_id)
              when 'kp' then (select k.title from t_knowledge_point k where k.id = s.target_id)
              when 'single' then (select left(q.stem, 60) from t_question q where q.id = s.target_id)
              when 'random' then case s.target_id when 4 then '随机组卷 · 理论' when 5 then '随机组卷 · 实操' else '随机组卷' end
              else null
            end
            """;

    private final JdbcTemplate jdbc;

    public PracticeHistoryController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @GetMapping
    public Map<String, Object> list(@AuthenticationPrincipal UUID uid,
                                    @RequestParam(defaultValue = "1") int page,
                                    @RequestParam(defaultValue = "20") int size) {
        int p = Math.max(page, 1);
        int s = Math.min(Math.max(size, 1), 100);
        Integer total = jdbc.queryForObject(
                "select count(*) from practice_session where user_id = ?", Integer.class, uid);
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select s.id, s.mode, s.target_id as "targetId",
                       s.started_at as "startedAt", s.finished_at as "finishedAt",
                       s.score, s.total_score as "totalScore",
                       (select count(*) from session_question x where x.session_id = s.id) as "questionCount",
                       coalesce(s.elapsed_sec,
                                extract(epoch from (coalesce(s.finished_at, now()) - s.started_at))::int) as "elapsedSec",
                       (select count(*) from practice_answer a where a.session_id = s.id) as "answeredCount",
                       (select count(*) from practice_answer a where a.session_id = s.id and a.is_correct) as "correctCount",
                       %s as "targetName"
                  from practice_session s
                 where s.user_id = ?
                 order by s.started_at desc
                 limit ? offset ?
                """.formatted(TARGET_NAME), uid, s, (p - 1) * s);
        return Map.of("total", total == null ? 0 : total, "page", p, "size", s, "rows", rows);
    }

    @GetMapping("/{sessionId}")
    public ResponseEntity<?> detail(@AuthenticationPrincipal UUID uid,
                                    @PathVariable long sessionId,
                                    @RequestParam(defaultValue = "1") int page,
                                    @RequestParam(defaultValue = "50") int size) {
        List<Map<String, Object>> sessions = jdbc.queryForList("""
                select s.id, s.mode, s.target_id as "targetId",
                       s.started_at as "startedAt", s.finished_at as "finishedAt",
                       s.score, s.total_score as "totalScore",
                       (select count(*) from session_question x where x.session_id = s.id) as "questionCount",
                       coalesce(s.elapsed_sec,
                                extract(epoch from (coalesce(s.finished_at, now()) - s.started_at))::int) as "elapsedSec",
                       %s as "targetName"
                  from practice_session s
                 where s.id = ? and s.user_id = ?
                """.formatted(TARGET_NAME), sessionId, uid);
        if (sessions.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("message", "记录不存在"));
        }

        int p = Math.max(page, 1);
        int s = Math.min(Math.max(size, 1), 200);
        Integer total = jdbc.queryForObject(
                "select count(*) from practice_answer where session_id = ? and user_id = ?",
                Integer.class, sessionId, uid);
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select a.question_id as "questionId", a.user_answer as "userAnswer",
                       a.is_correct as "isCorrect", a.score_got as "scoreGot",
                       a.answered_at as "answeredAt",
                       q.question_type as "questionType", q.stem, q.score,
                       q.blank_count as "blankCount", q.correct, q.analysis,
                       (select substring(tc.content from '/qimg/[A-Za-z0-9._-]+')
                          from t_text_content tc where tc.id = q.info_text_content_id) as "imageUrl"
                  from practice_answer a
                  join t_question q on q.id = a.question_id
                 where a.session_id = ? and a.user_id = ?
                 order by a.answered_at, a.id
                 limit ? offset ?
                """, sessionId, uid, s, (p - 1) * s);
        return ResponseEntity.ok(Map.of("session", sessions.get(0),
                "total", total == null ? 0 : total, "page", p, "size", s, "rows", rows));
    }
}
