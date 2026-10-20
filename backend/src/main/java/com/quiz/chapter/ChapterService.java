package com.quiz.chapter;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 章节树与课程统计（读多写少，全部走 Redis 缓存）。
 */
@Service
public class ChapterService {

    private final ChapterRepository chapterRepo;
    private final JdbcTemplate jdbc;

    public ChapterService(ChapterRepository chapterRepo, JdbcTemplate jdbc) {
        this.chapterRepo = chapterRepo;
        this.jdbc = jdbc;
    }

    /** 每个 chapter 节点的直属可练习题数 */
    private Map<Integer, Integer> directCounts() {
        Map<Integer, Integer> m = new HashMap<>();
        jdbc.query("""
                select chapter_id, count(*) as cnt
                  from t_question
                 where not deleted and review_status = 'ok' and chapter_id is not null
                 group by chapter_id
                """, rs -> {
            m.put(rs.getInt("chapter_id"), rs.getInt("cnt"));
        });
        return m;
    }

    /**
     * 章节树：subjectId 为空则返回全部学科；questionCount 为子树汇总。
     */
    @Cacheable(value = "chapterTree", key = "#subjectId == null ? 'all' : #subjectId")
    public List<ChapterNode> tree(Integer subjectId) {
        List<Chapter> all = chapterRepo.findByDeletedFalseOrderBySubjectIdAscItemOrderAscIdAsc();
        Map<Integer, Integer> counts = directCounts();

        Map<Integer, List<Chapter>> byParent = new LinkedHashMap<>();
        List<Chapter> roots = new ArrayList<>();
        for (Chapter c : all) {
            if (subjectId != null && !subjectId.equals(c.getSubjectId())) {
                continue;
            }
            if (c.getParentId() == null) {
                roots.add(c);
            } else {
                byParent.computeIfAbsent(c.getParentId(), k -> new ArrayList<>()).add(c);
            }
        }
        roots.sort(Comparator.comparing((Chapter c) -> c.getItemOrder() == null ? 0 : c.getItemOrder())
                .thenComparing(Chapter::getId));

        List<ChapterNode> out = new ArrayList<>();
        for (Chapter root : roots) {
            out.add(build(root, byParent, counts));
        }
        return out;
    }

    private ChapterNode build(Chapter c, Map<Integer, List<Chapter>> byParent, Map<Integer, Integer> counts) {
        int own = counts.getOrDefault(c.getId(), 0);
        List<Chapter> kids = byParent.getOrDefault(c.getId(), List.of());
        if (kids.isEmpty()) {
            return ChapterNode.leaf(c, own);
        }
        List<Chapter> sorted = new ArrayList<>(kids);
        sorted.sort(Comparator.comparing((Chapter x) -> x.getItemOrder() == null ? 0 : x.getItemOrder())
                .thenComparing(Chapter::getId));
        int total = own;
        List<ChapterNode> childNodes = new ArrayList<>();
        for (Chapter kid : sorted) {
            ChapterNode n = build(kid, byParent, counts);
            childNodes.add(n);
            total += n.questionCount();
        }
        return new ChapterNode(c.getId(), c.getSubjectId(), c.getCode(), c.getName(),
                c.getLevel() == null ? 0 : c.getLevel(), total, childNodes);
    }

    /** 课程级统计（A/B/S1-S6 的可练习题数） */
    @Cacheable(value = "courseCounts", key = "'all'")
    public List<Map<String, Object>> courseCounts() {
        return jdbc.queryForList("select course, cnt from v_course_counts order by course");
    }
}
