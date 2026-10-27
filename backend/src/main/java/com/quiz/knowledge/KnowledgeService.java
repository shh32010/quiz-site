package com.quiz.knowledge;

import com.quiz.chapter.Chapter;
import com.quiz.chapter.ChapterRepository;
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
 * 知识点浏览：按大纲树聚合知识点数，并按章节子树取知识点。
 */
@Service
public class KnowledgeService {

    private final ChapterRepository chapterRepo;
    private final JdbcTemplate jdbc;

    public KnowledgeService(ChapterRepository chapterRepo, JdbcTemplate jdbc) {
        this.chapterRepo = chapterRepo;
        this.jdbc = jdbc;
    }

    /** 每个章节节点直属的知识点数 */
    private Map<Integer, Integer> directCounts() {
        Map<Integer, Integer> m = new HashMap<>();
        jdbc.query("""
                select node_id, count(*) as cnt
                  from t_knowledge_point
                 where not deleted and node_id is not null
                 group by node_id
                """, rs -> {
            m.put(rs.getInt("node_id"), rs.getInt("cnt"));
        });
        return m;
    }

    /** 大纲树（含知识点数，子树汇总） */
    @Cacheable(value = "knowledgeTree", key = "#subjectId == null ? 'all' : #subjectId")
    public List<KnowledgeNode> tree(Integer subjectId) {
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

        List<KnowledgeNode> out = new ArrayList<>();
        for (Chapter root : roots) {
            out.add(build(root, byParent, counts));
        }
        return out;
    }

    private KnowledgeNode build(Chapter c, Map<Integer, List<Chapter>> byParent, Map<Integer, Integer> counts) {
        int own = counts.getOrDefault(c.getId(), 0);
        List<Chapter> kids = byParent.getOrDefault(c.getId(), List.of());
        if (kids.isEmpty()) {
            return KnowledgeNode.leaf(c, own);
        }
        List<Chapter> sorted = new ArrayList<>(kids);
        sorted.sort(Comparator.comparing((Chapter x) -> x.getItemOrder() == null ? 0 : x.getItemOrder())
                .thenComparing(Chapter::getId));
        int total = own;
        List<KnowledgeNode> childNodes = new ArrayList<>();
        for (Chapter kid : sorted) {
            KnowledgeNode n = build(kid, byParent, counts);
            childNodes.add(n);
            total += n.kpCount();
        }
        return new KnowledgeNode(c.getId(), c.getSubjectId(), c.getCode(), c.getName(),
                c.getLevel() == null ? 0 : c.getLevel(), total, childNodes);
    }

    /** 某章节（含子孙）下的知识点，可按标题/内容搜索 */
    public Map<String, Object> list(int chapterId, String q, int page, int size) {
        int safeSize = Math.min(Math.max(size, 1), 200);
        int offset = Math.max(0, (page - 1) * safeSize);
        String kw = q == null ? "" : q.trim();
        String like = "%" + kw + "%";

        String sub = """
                with recursive sub as (
                  select id from t_chapter where id = ?
                  union all
                  select c.id from t_chapter c join sub s on c.parent_id = s.id
                )
                """;
        String where = " where not k.deleted and k.node_id in (select id from sub) "
                + " and (? = '' or k.title ilike ? or k.content ilike ?) ";

        Integer total = jdbc.queryForObject(
                sub + "select count(*) from t_knowledge_point k" + where,
                Integer.class, chapterId, kw, like, like);

        List<Map<String, Object>> rows = jdbc.queryForList(
                sub + """
                        select k.id, k.title, k.section, k.content, k.importance,
                               c.code as "nodeCode", c.name as "nodeName",
                               (select count(*)
                                  from t_question_kp x
                                  join t_question q on q.id = x.question_id
                                 where x.kp_id = k.id and not q.deleted and q.review_status = 'ok') as "questionCount"
                          from t_knowledge_point k
                          left join t_chapter c on c.id = k.node_id
                        """ + where + """
                         order by k.item_order nulls last, k.id
                         limit ? offset ?
                        """,
                chapterId, kw, like, like, safeSize, offset);

        return Map.of("total", total == null ? 0 : total, "page", page, "size", safeSize, "rows", rows);
    }

    /** 节阅读器：节信息 + 分片知识点（默认每部分 60 条） */
    public Map<String, Object> section(int id, int page, int size) {
        int safeSize = Math.min(Math.max(size, 1), 100);
        int safePage = Math.max(page, 1);
        int offset = (safePage - 1) * safeSize;
        List<Map<String, Object>> sectionRows = jdbc.queryForList("""
                select c.id, c.code, c.name, c.level,
                       c.subject_id as "subjectId",
                       p.id as "chapterId",
                       coalesce(p.code, c.code) as "chapterCode",
                       coalesce(p.name, c.name) as "chapterName",
                       r.id as "courseId",
                       coalesce(r.code, p.code, c.code) as "courseCode",
                       coalesce(r.name, p.name, c.name) as "courseName"
                  from t_chapter c
                  left join t_chapter p on p.id = c.parent_id
                  left join t_chapter r on r.id = coalesce(p.parent_id, p.id)
                 where c.id = ? and not c.deleted
                """, id);
        if (sectionRows.isEmpty()) {
            return null;
        }

        Integer total = jdbc.queryForObject("""
                with recursive sub as (
                  select id from t_chapter where id = ?
                  union all
                  select ch.id from t_chapter ch join sub s on ch.parent_id = s.id
                )
                select count(*) from t_knowledge_point k
                 where not k.deleted and k.node_id in (select id from sub)
                """, Integer.class, id);

        List<Map<String, Object>> kps = jdbc.queryForList("""
                with recursive sub as (
                  select id from t_chapter where id = ?
                  union all
                  select ch.id from t_chapter ch join sub s on ch.parent_id = s.id
                )
                select k.id, k.title, k.section, k.content, k.importance,
                       (select count(*)
                          from t_question_kp x
                          join t_question q on q.id = x.question_id
                         where x.kp_id = k.id and not q.deleted and q.review_status = 'ok') as "questionCount"
                  from t_knowledge_point k
                 where not k.deleted and k.node_id in (select id from sub)
                 order by k.item_order nulls last, k.id
                 limit ? offset ?
                """, id, safeSize, offset);

        return Map.of("section", sectionRows.get(0), "kps", kps,
                "total", total == null ? 0 : total, "page", safePage, "size", safeSize);
    }

    /** 单条知识点（用于题目页跳转定位） */
    public Map<String, Object> detail(int id) {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select k.id, k.title, k.section, k.content, k.importance,
                       k.node_id as "nodeId", c.code as "nodeCode", c.name as "nodeName"
                  from t_knowledge_point k
                  left join t_chapter c on c.id = k.node_id
                 where k.id = ? and not k.deleted
                """, id);
        return rows.isEmpty() ? null : rows.get(0);
    }

    /** 全库搜索知识点 */
    public Map<String, Object> search(String q, int page, int size) {
        int safeSize = Math.min(Math.max(size, 1), 200);
        int offset = Math.max(0, (page - 1) * safeSize);
        String kw = q == null ? "" : q.trim();
        String like = "%" + kw + "%";
        String where = " where not k.deleted and (? = '' or k.title ilike ? or k.content ilike ?) ";

        Integer total = jdbc.queryForObject(
                "select count(*) from t_knowledge_point k" + where,
                Integer.class, kw, like, like);

        List<Map<String, Object>> rows = jdbc.queryForList("""
                select k.id, k.title, k.section, k.content, k.importance,
                       c.code as "nodeCode", c.name as "nodeName",
                       (select count(*)
                          from t_question_kp x
                          join t_question q on q.id = x.question_id
                         where x.kp_id = k.id and not q.deleted and q.review_status = 'ok') as "questionCount"
                  from t_knowledge_point k
                  left join t_chapter c on c.id = k.node_id
                """ + where + """
                 order by k.id
                 limit ? offset ?
                """, kw, like, like, safeSize, offset);

        return Map.of("total", total == null ? 0 : total, "page", page, "size", safeSize, "rows", rows);
    }
}
