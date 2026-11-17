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
            out.add(build(root, byParent, counts, true));
        }
        return out;
    }

    /** 虚拟“综合题”节点 id：-100000 - 一级章节 id */
    public static int virtualId(int rootId) {
        return -100000 - rootId;
    }

    /** 虚拟节点对应的根章节 id；非虚拟返回 null */
    public static Integer virtualRootId(int id) {
        int root = -id - 100000;
        return id < 0 && root > 0 ? root : null;
    }

    private ChapterNode build(Chapter c, Map<Integer, List<Chapter>> byParent,
                              Map<Integer, Integer> counts, boolean isRoot) {
        int own = counts.getOrDefault(c.getId(), 0);
        List<Chapter> kids = byParent.getOrDefault(c.getId(), List.of());
        if (kids.isEmpty()) {
            return ChapterNode.leaf(c, own);
        }
        List<Chapter> sorted = new ArrayList<>(kids);
        sorted.sort(Comparator.comparing((Chapter x) -> x.getItemOrder() == null ? 0 : x.getItemOrder())
                .thenComparing(Chapter::getId));
        int total = 0;
        List<ChapterNode> childNodes = new ArrayList<>();
        for (Chapter kid : sorted) {
            ChapterNode n = build(kid, byParent, counts, false);
            childNodes.add(n);
            total += n.questionCount();
        }
        if (isRoot) {
            // 一级直属题 + 二级非叶子章直属题，归入“综合题（未挂三级）”虚拟节点
            int virtualCount = own;
            for (Chapter kid : sorted) {
                if (!byParent.getOrDefault(kid.getId(), List.of()).isEmpty()) {
                    virtualCount += counts.getOrDefault(kid.getId(), 0);
                }
            }
            if (virtualCount > 0) {
                childNodes.add(new ChapterNode(virtualId(c.getId()), c.getSubjectId(),
                        (c.getCode() == null ? "" : c.getCode()) + "-综合", "综合题（未挂三级）",
                        (short) 3, virtualCount, new ArrayList<>()));
                total += virtualCount;
            }
        }
        return new ChapterNode(c.getId(), c.getSubjectId(), c.getCode(), c.getName(),
                c.getLevel() == null ? 0 : c.getLevel(), total, childNodes);
    }

    /** 课程级统计（A/B/S1-S6 的可练习题数） */
    @Cacheable(value = "courseCounts", key = "'all'")
    public List<Map<String, Object>> courseCounts() {
        return jdbc.queryForList("select course, cnt from v_course_counts order by course");
    }

    /** 单个章节基本信息：用于判断是否一级章、选择整卷题量；支持虚拟“综合题”节点 */
    public Map<String, Object> one(int id) {
        Integer rootId = virtualRootId(id);
        if (rootId != null) {
            List<Map<String, Object>> roots = jdbc.queryForList("""
                    select id, subject_id as "subjectId", code, name
                      from t_chapter where id = ? and not deleted
                    """, rootId);
            if (roots.isEmpty()) {
                return null;
            }
            Map<String, Object> root = roots.get(0);
            return Map.of(
                    "id", id,
                    "subjectId", root.get("subjectId"),
                    "parentId", rootId,
                    "code", String.valueOf(root.get("code")) + "-综合",
                    "name", "综合题（未挂三级）",
                    "level", 3,
                    "virtual", true);
        }
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select id, subject_id as "subjectId", parent_id as "parentId",
                       code, name, level
                  from t_chapter
                 where id = ? and not deleted
                """, id);
        return rows.isEmpty() ? null : rows.get(0);
    }
}
