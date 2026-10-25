package com.quiz.report;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 学习报告：总览 + 最近练习。
 */
@RestController
@RequestMapping("/api/report")
public class ReportController {

    private final JdbcTemplate jdbc;

    public ReportController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    /** 全站总进度：去重已做过的题 / 当前可练总题。 */
    @GetMapping("/progress")
    public Map<String, Object> progress(@AuthenticationPrincipal UUID uid) {
        Map<String, Object> row = jdbc.queryForMap("""
                select count(distinct q.id) as "total",
                       count(distinct q.id) filter (where pa.id is not null) as "answered"
                  from t_question q
                  left join practice_answer pa
                         on pa.question_id = q.id and pa.user_id = ?
                 where not q.deleted and q.review_status = 'ok'
                """, uid);
        int total = ((Number) row.get("total")).intValue();
        int answered = ((Number) row.get("answered")).intValue();
        int pct = total > 0 ? (int) Math.round(answered * 100.0 / total) : 0;
        return Map.of("total", total, "answered", answered, "pct", pct);
    }

    /**
     * 章节进度：按 L1 章/技能统计“已做过的不同题数 / 可练总题数”。
     * 与 /api/report 的 mastery（作答次数正确率）区分，专门供 /chapters 进度条使用。
     */
    @GetMapping("/chapters")
    public List<Map<String, Object>> chapterProgress(@AuthenticationPrincipal UUID uid) {
        return jdbc.queryForList("""
                with recursive anc as (
                  select id, parent_id, id as root
                    from t_chapter where level = 1 and not deleted
                  union all
                  select c.id, c.parent_id, a.root
                    from t_chapter c join anc a on c.parent_id = a.id
                   where not c.deleted
                )
                select l.id, l.code, l.name,
                       count(distinct q.id) as "total",
                       count(distinct q.id) filter (where pa.id is not null) as "answered",
                       count(distinct q.id) filter (where pa.is_correct) as "correct"
                  from t_question q
                  join anc on anc.id = q.chapter_id
                  join t_chapter l on l.id = anc.root
                  left join practice_answer pa
                         on pa.question_id = q.id and pa.user_id = ?
                 where not q.deleted and q.review_status = 'ok'
                 group by l.id, l.code, l.name
                 order by l.code
                """, uid);
    }

    @GetMapping
    public Map<String, Object> report(@AuthenticationPrincipal UUID uid) {
        Map<String, Object> summary = jdbc.queryForMap("""
                select count(*)                                            as "answered",
                       count(*) filter (where is_correct)                  as "correct",
                       count(distinct date(answered_at))                   as "activeDays",
                       coalesce(sum(score_got), 0)                         as "score"
                  from practice_answer
                 where user_id = ?
                """, uid);

        List<Map<String, Object>> recent = jdbc.queryForList("""
                select id, mode, target_id as "targetId", started_at as "startedAt",
                       finished_at as "finishedAt", score, total_score as "totalScore",
                       correct_count as "correctCount", question_count as "questionCount"
                  from practice_session
                 where user_id = ?
                 order by started_at desc
                 limit 10
                """, uid);

        Map<String, Object> wrong = jdbc.queryForMap("""
                select count(*) as "total",
                       count(*) filter (where not resolved) as "pending"
                  from wrong_question where user_id = ?
                """, uid);

        // 章节掌握度（按 L1 章/技能汇总，已答题目正确率）
        List<Map<String, Object>> mastery = jdbc.queryForList("""
                with recursive anc as (
                  select id, parent_id, id as root from t_chapter where level = 1 and not deleted
                  union all
                  select c.id, c.parent_id, a.root from t_chapter c join anc a on c.parent_id = a.id
                 where not c.deleted
                )
                select l.code, l.name,
                       count(*) as "total",
                       count(*) filter (where pa.is_correct) as "correct",
                       round(100.0 * count(*) filter (where pa.is_correct) / count(*)) as "rate"
                  from practice_answer pa
                  join t_question q on q.id = pa.question_id
                  join anc on anc.id = q.chapter_id
                  join t_chapter l on l.id = anc.root
                 where pa.user_id = ?
                 group by l.code, l.name
                 order by l.code
                """, uid);

        // 知识点掌握度（已答题关联知识点，至少答过 2 次）
        List<Map<String, Object>> kps = jdbc.queryForList("""
                select k.id, k.title,
                       count(*) as "total",
                       count(*) filter (where pa.is_correct) as "correct",
                       round(100.0 * count(*) filter (where pa.is_correct) / count(*)) as "rate"
                  from practice_answer pa
                  join t_question_kp x on x.question_id = pa.question_id
                  join t_knowledge_point k on k.id = x.kp_id and not k.deleted
                 where pa.user_id = ?
                 group by k.id, k.title
                having count(*) >= 2
                 order by count(*) desc, k.id
                 limit 20
                """, uid);

        return Map.of("summary", summary, "recent", recent, "wrong", wrong,
                "mastery", mastery, "kps", kps);
    }
}
