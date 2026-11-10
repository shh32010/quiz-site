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

    /** 每个考纲三级节点下已发布讲义的内容块数（未发布回退 0） */
    private Map<Integer, Integer> directCounts() {
        Map<Integer, Integer> m = new HashMap<>();
        jdbc.query("""
                select e.node_id, coalesce(jsonb_array_length(r.blocks), 0) as cnt
                  from kb_entry e
                  join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
                 where e.status = 'published'
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

    /** 某章节（含子孙）下的已发布讲义，可按标题/内容搜索 */
    public Map<String, Object> list(int chapterId, String q, int page, int size) {
        int safeSize = Math.min(Math.max(size, 1), 200);
        int offset = Math.max(0, (page - 1) * safeSize);
        String kw = q == null ? "" : q.trim();
        String like = "%" + kw + "%";

        String sub = """
                with recursive sub as (
                  select id from t_chapter where id = ? and not deleted
                  union all
                  select c.id from t_chapter c join sub s on c.parent_id = s.id where not c.deleted
                )
                """;
        String where = """
                 where e.status = 'published'
                   and not c.deleted
                   and c.id in (select id from sub)
                   and (? = '' or c.name ilike ? or c.code ilike ? or r.search_text ilike ?)
                """;

        Integer total = jdbc.queryForObject(
                sub + """
                select count(*)
                  from kb_entry e
                  join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
                  join t_chapter c on c.id = e.node_id
                """ + where,
                Integer.class, chapterId, kw, like, like, like);

        List<Map<String, Object>> rows = jdbc.queryForList(
                sub + """
                select c.id, c.id as "nodeId", c.parent_id as "sectionId",
                       c.code as "nodeCode", c.name as "nodeName",
                       c.name as "title",
                       p.name as "section",
                       left(r.search_text, 160) as "content",
                       '必记' as "importance",
                       (select count(*)
                          from t_question q
                         where not q.deleted and q.review_status = 'ok' and q.chapter_id = c.id) as "questionCount"
                  from kb_entry e
                  join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
                  join t_chapter c on c.id = e.node_id
                  left join t_chapter p on p.id = c.parent_id
                """ + where + """
                 order by c.item_order nulls last, c.id
                 limit ? offset ?
                """,
                chapterId, kw, like, like, like, safeSize, offset);

        return Map.of("total", total == null ? 0 : total, "page", page, "size", safeSize, "rows", rows);
    }

    /** 节阅读器：节信息 + 新版结构化讲义 entries + 极简旧版锚点映射 kps */
    public Map<String, Object> section(int id, int page, int size) {
        int safeSize = Math.min(Math.max(size, 1), 100);
        int safePage = Math.max(page, 1);
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

        // 仅保留极简映射供旧 #kp-123 锚点定位到新版考纲节点 #group-{nodeId}
        List<Map<String, Object>> kps = jdbc.queryForList("""
                with recursive sub as (
                  select id from t_chapter where id = ? and not deleted
                  union all
                  select ch.id from t_chapter ch join sub s on ch.parent_id = s.id where not ch.deleted
                )
                select id, node_id as "nodeId"
                  from t_knowledge_point
                 where not deleted and node_id in (select id from sub)
                """, id);

        List<Map<String, Object>> entries = loadPublishedEntries(id);

        return Map.of(
                "section", sectionRows.getFirst(),
                "entries", entries,
                "kps", kps,
                "questions", List.of(),
                "total", entries.size(),
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

    /** 单条考纲节点或旧知识点（用于题目/深链跳转定位到节讲义） */
    public Map<String, Object> detail(int id) {
        List<Map<String, Object>> chapterRows = jdbc.queryForList("""
                select c.id, c.id as "nodeId", c.parent_id as "sectionId",
                       c.code as "nodeCode", c.name as "nodeName",
                       c.name as "title",
                       p.name as "section"
                  from t_chapter c
                  left join t_chapter p on p.id = c.parent_id
                 where c.id = ? and not c.deleted
                """, id);
        if (!chapterRows.isEmpty()) {
            return chapterRows.getFirst();
        }
        List<Map<String, Object>> kpRows = jdbc.queryForList("""
                select k.id, c.id as "nodeId", c.parent_id as "sectionId",
                       c.code as "nodeCode", c.name as "nodeName",
                       k.title, k.section, k.content, k.importance
                  from t_knowledge_point k
                  join t_chapter c on c.id = k.node_id
                 where k.id = ? and not k.deleted
                """, id);
        return kpRows.isEmpty() ? null : kpRows.getFirst();
    }

    /** 全库搜索已发布讲义 */
    public Map<String, Object> search(String q, int page, int size) {
        int safeSize = Math.min(Math.max(size, 1), 200);
        int offset = Math.max(0, (page - 1) * safeSize);
        String kw = q == null ? "" : q.trim();
        String like = "%" + kw + "%";
        String where = """
                 where e.status = 'published'
                   and not c.deleted
                   and (? = '' or c.name ilike ? or c.code ilike ? or r.search_text ilike ?)
                """;

        Integer total = jdbc.queryForObject("""
                select count(*)
                  from kb_entry e
                  join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
                  join t_chapter c on c.id = e.node_id
                """ + where,
                Integer.class, kw, like, like, like);

        List<Map<String, Object>> rows = jdbc.queryForList("""
                select c.id, c.id as "nodeId", c.parent_id as "sectionId",
                       c.code as "nodeCode", c.name as "nodeName",
                       c.name as "title",
                       p.name as "section",
                       left(r.search_text, 160) as "content",
                       '必记' as "importance",
                       (select count(*)
                          from t_question q
                         where not q.deleted and q.review_status = 'ok' and q.chapter_id = c.id) as "questionCount"
                  from kb_entry e
                  join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
                  join t_chapter c on c.id = e.node_id
                  left join t_chapter p on p.id = c.parent_id
                """ + where + """
                 order by c.item_order nulls last, c.id
                 limit ? offset ?
                """, kw, like, like, like, safeSize, offset);

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
