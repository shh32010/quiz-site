package com.quiz.paper;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 真题卷读取。
 */
@Service
public class PaperService {

    private final JdbcTemplate jdbc;

    public PaperService(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @Cacheable(value = "paperList", key = "'all'")
    public List<Map<String, Object>> list() {
        return jdbc.queryForList("""
                select p.id, p.name, p.subject_id as "subjectId", p.score,
                       p.question_count as "questionCount", p.suggest_time as "suggestTime",
                       coalesce(av.cnt, 0) as "availableCount",
                       coalesce(av.score, 0) as "availableScore"
                  from t_exam_paper p
                  left join lateral (
                    select count(*) as cnt, coalesce(sum(q.score), 0) as score
                      from exam_paper_question e
                      join t_question q on q.id = e.question_id
                     where e.paper_id = p.id and e.is_active
                       and not q.deleted and q.review_status = 'ok'
                  ) av on true
                 where not p.deleted
                 order by p.id
                """);
    }

    /** 卷面分节：原卷题数 / 可练题数 / 可练分值 */
    @Cacheable(value = "paperSections", key = "#paperId")
    public List<Map<String, Object>> sections(int paperId) {
        return jdbc.queryForList("""
                select e.section_no            as "sectionNo",
                       max(e.section_name)     as "sectionName",
                       count(*)                as "items",
                       count(*) filter (where not q.deleted and q.review_status = 'ok') as "available",
                       count(*) filter (where q.deleted or q.review_status <> 'ok') as "missing",
                       coalesce(sum(q.score) filter (where not q.deleted and q.review_status = 'ok'), 0) as "score"
                  from exam_paper_question e
                  join t_question q on q.id = e.question_id
                 where e.paper_id = ? and e.is_active
                 group by e.section_no
                 order by e.section_no
                """, paperId);
    }

    @Cacheable(value = "paperDetail", key = "#paperId", unless = "#result == null")
    public Map<String, Object> detail(int paperId) {
        List<Map<String, Object>> papers = jdbc.queryForList("""
                select p.id, p.name, p.subject_id as "subjectId", p.score,
                       p.question_count as "questionCount", p.suggest_time as "suggestTime",
                       coalesce(av.cnt, 0) as "availableCount",
                       coalesce(av.score, 0) as "availableScore"
                  from t_exam_paper p
                  left join lateral (
                    select count(*) as cnt, coalesce(sum(q.score), 0) as score
                      from exam_paper_question e
                      join t_question q on q.id = e.question_id
                     where e.paper_id = p.id and e.is_active
                       and not q.deleted and q.review_status = 'ok'
                  ) av on true
                 where p.id = ? and not p.deleted
                """, paperId);
        if (papers.isEmpty()) {
            return null;
        }
        return Map.of("paper", papers.get(0), "sections", sections(paperId));
    }
}
