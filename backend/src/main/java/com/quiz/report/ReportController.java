package com.quiz.report;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 学习报告：总览 + 最近练习 + 章节/知识点掌握度。
 */
@RestController
@RequestMapping("/api/report")
public class ReportController {

    private final JdbcTemplate jdbc;

    public ReportController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    /** 全站总进度：去重已做过的题 / 当前可练总题（走用户作答索引，避免全表左连接）。 */
    @GetMapping("/progress")
    public Map<String, Object> progress(@AuthenticationPrincipal UUID uid) {
        Map<String, Object> row = jdbc.queryForMap("""
                select (select count(*) from t_question where not deleted and review_status = 'ok') as "total",
                       (select count(distinct pa.question_id)
                          from practice_answer pa
                          join t_question q on q.id = pa.question_id
                         where pa.user_id = ? and pa.deleted_at is null
                           and not q.deleted and q.review_status = 'ok') as "answered"
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
                         on pa.question_id = q.id and pa.user_id = ? and pa.deleted_at is null
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
                 where user_id = ? and deleted_at is null
                """, uid);

        List<Map<String, Object>> recent = jdbc.queryForList("""
                select id, mode, target_id as "targetId", started_at as "startedAt",
                       finished_at as "finishedAt", score, total_score as "totalScore",
                       correct_count as "correctCount", question_count as "questionCount"
                  from practice_session
                 where user_id = ? and deleted_at is null
                 order by started_at desc
                 limit 10
                """, uid);

        Map<String, Object> wrong = jdbc.queryForMap("""
                select count(*) as "total",
                       count(*) filter (where not resolved) as "pending"
                  from wrong_question where user_id = ? and deleted_at is null
                """, uid);

        // 单次递归 CTE 同时查出章级与节级明细，避免两次重复扫描整棵章节树与作答表
        List<Map<String, Object>> rawRows = jdbc.queryForList("""
                with recursive anc as (
                  select id, parent_id, id as root,
                         case when level = 2 then id end as section
                    from t_chapter where level = 1 and not deleted
                  union all
                  select c.id, c.parent_id, a.root,
                         case when c.level = 2 then c.id else a.section end
                    from t_chapter c join anc a on c.parent_id = a.id
                   where not c.deleted
                )
                select l.code as "chapterCode", l.name as "chapterName",
                       s.code as "sectionCode", s.name as "sectionName",
                       count(*) as "total",
                       count(*) filter (where pa.is_correct) as "correct",
                       round(100.0 * count(*) filter (where pa.is_correct) / count(*)) as "rate"
                  from practice_answer pa
                  join t_question q on q.id = pa.question_id
                  join anc on anc.id = q.chapter_id
                  join t_chapter l on l.id = anc.root
                  left join t_chapter s on s.id = anc.section
                 where pa.user_id = ? and pa.deleted_at is null and not q.deleted and q.review_status = 'ok'
                 group by l.code, l.name, s.code, s.name
                 order by l.code, s.code nulls first
                """, uid);

        Map<String, long[]> chapterAgg = new LinkedHashMap<>();
        Map<String, String> chapterNames = new LinkedHashMap<>();
        List<Map<String, Object>> sections = new ArrayList<>();

        for (Map<String, Object> r : rawRows) {
            String chCode = (String) r.get("chapterCode");
            String chName = (String) r.get("chapterName");
            long total = ((Number) r.get("total")).longValue();
            long correct = ((Number) r.get("correct")).longValue();

            chapterNames.putIfAbsent(chCode, chName);
            long[] counts = chapterAgg.computeIfAbsent(chCode, k -> new long[2]);
            counts[0] += total;
            counts[1] += correct;

            if (r.get("sectionCode") != null || r.get("sectionName") != null) {
                sections.add(r);
            }
        }

        List<Map<String, Object>> mastery = new ArrayList<>();
        for (Map.Entry<String, long[]> entry : chapterAgg.entrySet()) {
            String code = entry.getKey();
            long total = entry.getValue()[0];
            long correct = entry.getValue()[1];
            long rate = total > 0 ? Math.round(100.0 * correct / total) : 0L;
            mastery.add(Map.of(
                    "code", code,
                    "name", chapterNames.getOrDefault(code, ""),
                    "total", total,
                    "correct", correct,
                    "rate", rate
            ));
        }

        // 薄弱知识点（按用户答题所属的三级考纲章节聚合统计，至少答过 2 次）
        List<Map<String, Object>> kps = jdbc.queryForList("""
                select c.id,
                       c.id as "nodeId",
                       c.parent_id as "sectionId",
                       coalesce(c.code || ' ', '') || c.name as "title",
                       count(*) filter (where not pa.is_correct) as "wrongCount",
                       count(*) as "totalCount",
                       count(*) as "total",
                       count(*) filter (where pa.is_correct) as "correct",
                       round(100.0 * count(*) filter (where pa.is_correct) / count(*)) as "accuracy",
                       round(100.0 * count(*) filter (where pa.is_correct) / count(*)) as "rate"
                  from practice_answer pa
                  join t_question q on q.id = pa.question_id and not q.deleted
                  join t_chapter c on c.id = q.chapter_id and c.level = 3 and not c.deleted
                 where pa.user_id = ? and pa.deleted_at is null
                 group by c.id, c.parent_id, c.code, c.name
                having count(*) >= 2
                 order by count(*) filter (where not pa.is_correct) desc, count(*) desc, c.id
                 limit 20
                """, uid);

        return Map.of("summary", summary, "recent", recent, "wrong", wrong,
                "mastery", mastery, "sections", sections, "kps", kps);
    }
}
