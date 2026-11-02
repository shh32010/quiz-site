package com.quiz.knowledge;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import java.util.UUID;

/**
 * 知识点浏览：按大纲树聚合知识点数，支持新旧双轨讲义（kb_entry + t_knowledge_point）与服务端阅读进度同步。
 */
@Service
public class KnowledgeService {

    private final ChapterRepository chapterRepo;
    private final JdbcTemplate jdbc;
    private final ObjectMapper mapper;

    public KnowledgeService(ChapterRepository chapterRepo, JdbcTemplate jdbc, ObjectMapper mapper) {
        this.chapterRepo = chapterRepo;
        this.jdbc = jdbc;
        this.mapper = mapper;
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

    /** 节阅读器：节信息 + 新版结构化讲义 entries + 旧版分片知识点 kps */
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
                select k.id, k.node_id as "nodeId", k.title, k.section, k.content, k.importance,
                       (select count(*)
                          from t_question_kp x
                          join t_question q on q.id = x.question_id
                         where x.kp_id = k.id and not q.deleted and q.review_status = 'ok') as "questionCount"
                  from t_knowledge_point k
                 where not k.deleted and k.node_id in (select id from sub)
                 order by k.item_order nulls last, k.id
                 limit ? offset ?
                """, id, safeSize, offset);

        // 当前分片每个知识点最多 2 道自测题，供阅读页内嵌预览
        List<Map<String, Object>> questions = jdbc.queryForList("""
                with recursive sub as (
                  select id from t_chapter where id = ?
                  union all
                  select ch.id from t_chapter ch join sub s on ch.parent_id = s.id
                )
                select k.id as "kpId",
                       q.id, q.question_type as "questionType", q.stem, q.score,
                       q.option_json as "optionJson", q.blank_count as "blankCount"
                  from t_knowledge_point k
                  join lateral (
                    select q.id, q.question_type, q.stem, q.score, q.option_json, q.blank_count
                      from t_question_kp x
                      join t_question q on q.id = x.question_id
                     where x.kp_id = k.id and not q.deleted and q.review_status = 'ok'
                     order by case x.confidence when '高' then 0 when '中' then 1 else 2 end, q.id
                     limit 2
                  ) q on true
                 where not k.deleted
                   and k.node_id in (select id from sub)
                   and k.id in (
                     select k2.id from t_knowledge_point k2
                      where not k2.deleted and k2.node_id in (select id from sub)
                      order by k2.item_order nulls last, k2.id
                      limit ? offset ?
                   )
                 order by k.id, q.id
                """, id, safeSize, offset);

        List<Map<String, Object>> entries = loadPublishedEntries(id);

        return Map.of(
                "section", sectionRows.getFirst(),
                "entries", entries,
                "kps", kps,
                "questions", questions,
                "total", total == null ? 0 : total,
                "page", safePage,
                "size", safeSize
        );
    }

    /** 加载本节下已发布的新版结构化讲义（kb_entry + kb_revision）及每条讲义代表性自测题 */
    private List<Map<String, Object>> loadPublishedEntries(int sectionId) {
        try {
            List<Map<String, Object>> raw = jdbc.queryForList("""
                    with recursive sub as (
                      select id, code, name, item_order from t_chapter where id = ? and not deleted
                      union all
                      select ch.id, ch.code, ch.name, ch.item_order
                        from t_chapter ch join sub s on ch.parent_id = s.id
                       where not ch.deleted
                    )
                    select s.id as "nodeId", s.code as "nodeCode", s.name as "nodeName",
                           r.rev_no as "revNo", r.blocks::text as "blocksJson",
                           (select count(*) from t_question q
                             where not q.deleted and q.review_status = 'ok' and q.chapter_id = s.id) as "questionCount"
                      from sub s
                      join kb_entry e on e.node_id = s.id and e.status = 'published'
                      join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
                     order by s.item_order nulls last, s.id
                    """, sectionId);
            if (raw.isEmpty()) {
                return List.of();
            }

            List<Map<String, Object>> nodeQuestions = jdbc.queryForList("""
                    with recursive sub as (
                      select id from t_chapter where id = ? and not deleted
                      union all
                      select ch.id from t_chapter ch join sub s on ch.parent_id = s.id where not ch.deleted
                    )
                    select s.id as "nodeId", q.id, q.question_type as "questionType",
                           q.stem, q.score, q.option_json as "optionJson", q.blank_count as "blankCount"
                      from sub s
                      join kb_entry e on e.node_id = s.id and e.status = 'published'
                      join lateral (
                        select q.id, q.question_type, q.stem, q.score, q.option_json, q.blank_count
                          from t_question q
                         where not q.deleted and q.review_status = 'ok' and q.chapter_id = s.id
                         order by case q.qc_grade when 'good' then 0 else 1 end, q.id
                         limit 3
                      ) q on true
                     order by s.id, q.id
                    """, sectionId);

            Map<Integer, List<Map<String, Object>>> qByNode = new HashMap<>();
            for (Map<String, Object> q : nodeQuestions) {
                int nodeId = ((Number) q.get("nodeId")).intValue();
                qByNode.computeIfAbsent(nodeId, k -> new ArrayList<>()).add(q);
            }

            List<Map<String, Object>> out = new ArrayList<>();
            for (Map<String, Object> row : raw) {
                int nodeId = ((Number) row.get("nodeId")).intValue();
                String blocksJson = String.valueOf(row.getOrDefault("blocksJson", "[]"));
                List<Map<String, Object>> blocks = mapper.readValue(
                        blocksJson, new TypeReference<List<Map<String, Object>>>() {});
                Map<String, Object> item = new LinkedHashMap<>();
                item.put("nodeId", nodeId);
                item.put("nodeCode", row.get("nodeCode"));
                item.put("nodeName", row.get("nodeName"));
                item.put("revNo", row.get("revNo"));
                item.put("questionCount", row.getOrDefault("questionCount", 0));
                item.put("blocks", blocks);
                item.put("questions", qByNode.getOrDefault(nodeId, List.of()));
                out.add(item);
            }
            return out;
        } catch (Exception e) {
            return List.of();
        }
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
        return rows.isEmpty() ? null : rows.getFirst();
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

    /** 获取当前用户的服务端知识点阅读进度与已学状态 */
    public Map<String, Object> listProgress(UUID uid) {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select p.section_id as "sectionId",
                       c.code as "sectionCode",
                       c.name as "sectionName",
                       r.name as "courseName",
                       p.progress_pct as "progressPct",
                       p.learned,
                       p.last_kp_id as "lastKpId",
                       p.updated_at as "updatedAt"
                  from user_knowledge_progress p
                  join t_chapter c on c.id = p.section_id and not c.deleted
                  left join t_chapter ch on ch.id = c.parent_id
                  left join t_chapter r on r.id = coalesce(ch.parent_id, ch.id)
                 where p.user_id = ?
                 order by p.updated_at desc
                """, uid);
        return Map.of("rows", rows);
    }

    /** 保存/更新当前用户在某节的阅读进度或已学标记 */
    public Map<String, Object> saveProgress(UUID uid, int sectionId, Integer progressPct, Boolean learned, Integer lastKpId) {
        Integer safePct = progressPct == null ? null : Math.max(0, Math.min(100, progressPct));
        jdbc.update("""
                insert into user_knowledge_progress (user_id, section_id, progress_pct, learned, last_kp_id, updated_at)
                values (?, ?, coalesce(?, 0), coalesce(?, false), ?, now())
                on conflict (user_id, section_id) do update
                set progress_pct = coalesce(?, user_knowledge_progress.progress_pct),
                    learned = coalesce(?, user_knowledge_progress.learned),
                    last_kp_id = coalesce(?, user_knowledge_progress.last_kp_id),
                    updated_at = now()
                """, uid, sectionId, safePct, learned, lastKpId, safePct, learned, lastKpId);
        return Map.of(
                "ok", true,
                "sectionId", sectionId,
                "progressPct", safePct == null ? 0 : safePct,
                "learned", Boolean.TRUE.equals(learned)
        );
    }
}
