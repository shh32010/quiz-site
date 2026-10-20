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
                select id, name, subject_id as "subjectId", score,
                       question_count as "questionCount", suggest_time as "suggestTime"
                  from t_exam_paper
                 where not deleted
                 order by id
                """);
    }

    /** 卷面分节：题数 / 分值 / 失效题数 */
    @Cacheable(value = "paperSections", key = "#paperId")
    public List<Map<String, Object>> sections(int paperId) {
        return jdbc.queryForList("""
                select e.section_no            as "sectionNo",
                       max(e.section_name)     as "sectionName",
                       count(*)                as "items",
                       count(*) filter (where q.deleted) as "missing",
                       coalesce(sum(q.score) filter (where not q.deleted), 0) as "score"
                  from exam_paper_question e
                  join t_question q on q.id = e.question_id
                 where e.paper_id = ? and e.is_active
                 group by e.section_no
                 order by e.section_no
                """, paperId);
    }

    public Map<String, Object> detail(int paperId) {
        List<Map<String, Object>> papers = jdbc.queryForList("""
                select id, name, subject_id as "subjectId", score,
                       question_count as "questionCount", suggest_time as "suggestTime"
                  from t_exam_paper where id = ? and not deleted
                """, paperId);
        if (papers.isEmpty()) {
            return null;
        }
        return Map.of("paper", papers.get(0), "sections", sections(paperId));
    }
}
