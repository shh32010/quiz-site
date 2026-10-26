package com.quiz.compose;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 随机组卷：按大纲题型配比 + 课程/技能占比 + 难度 3:5:2 抽题。
 * 抽题复用数据库函数 pick_questions（已适配三级章节：按 code 递归取子孙）。
 */
@Service
public class ComposeService {

    private record Bucket(String[] codes, int n) {}

    private record Section(int type, Bucket[] buckets) {}

    private static final String[] CODES_A = {"A1", "A2", "A3", "A4"};
    private static final String[] CODES_B = {"B1", "B2", "B3", "B4", "B5", "B6", "B7"};

    private static final Map<Integer, List<Section>> PLANS = new HashMap<>();

    static {
        PLANS.put(4, List.of(
                new Section(1, new Bucket[]{new Bucket(CODES_A, 30), new Bucket(CODES_B, 20)}),
                new Section(2, new Bucket[]{new Bucket(CODES_A, 6), new Bucket(CODES_B, 4)}),
                new Section(3, new Bucket[]{new Bucket(CODES_A, 6), new Bucket(CODES_B, 4)}),
                new Section(4, new Bucket[]{new Bucket(CODES_A, 6), new Bucket(CODES_B, 4)})
        ));
        PLANS.put(5, List.of(
                new Section(1, new Bucket[]{
                        new Bucket(new String[]{"S1"}, 8), new Bucket(new String[]{"S2"}, 4),
                        new Bucket(new String[]{"S3"}, 2), new Bucket(new String[]{"S4"}, 2),
                        new Bucket(new String[]{"S5"}, 2), new Bucket(new String[]{"S6"}, 2)}),
                new Section(3, new Bucket[]{
                        new Bucket(new String[]{"S1"}, 3), new Bucket(new String[]{"S2"}, 1),
                        new Bucket(new String[]{"S3"}, 1), new Bucket(new String[]{"S4"}, 1),
                        new Bucket(new String[]{"S5"}, 1), new Bucket(new String[]{"S6"}, 1)}),
                new Section(4, new Bucket[]{
                        new Bucket(new String[]{"S1"}, 4), new Bucket(new String[]{"S2"}, 2),
                        new Bucket(new String[]{"S3"}, 1), new Bucket(new String[]{"S4"}, 1),
                        new Bucket(new String[]{"S5"}, 1), new Bucket(new String[]{"S6"}, 1)}),
                new Section(5, new Bucket[]{
                        new Bucket(new String[]{"S1"}, 1), new Bucket(new String[]{"S2"}, 1)})
        ));
    }

    private final JdbcTemplate jdbc;

    public ComposeService(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    /** 难度权重 3:5:2，按最大余数法拆分 */
    private static List<int[]> splitByDifficulty(int n) {
        double[] w = {0.3, 0.5, 0.2};
        int[] base = new int[3];
        double[] rem = new double[3];
        int sum = 0;
        for (int i = 0; i < 3; i++) {
            double exact = n * w[i];
            base[i] = (int) Math.floor(exact);
            rem[i] = exact - base[i];
            sum += base[i];
        }
        int left = n - sum;
        Integer[] order = {0, 1, 2};
        java.util.Arrays.sort(order, (a, b) -> Double.compare(rem[b], rem[a]));
        for (int i = 0; i < left; i++) {
            base[order[i % 3]]++;
        }
        List<int[]> out = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            if (base[i] > 0) {
                out.add(new int[]{i + 1, base[i]});
            }
        }
        return out;
    }

    @Transactional
    public Map<String, Object> start(UUID uid, int subject) {
        List<Section> plan = PLANS.get(subject);
        if (plan == null) {
            throw new IllegalArgumentException("subject 仅支持 4（理论）或 5（实操）");
        }

        List<Integer> picked = new ArrayList<>();
        Map<Integer, Integer> seen = new LinkedHashMap<>();

        for (Section sec : plan) {
            for (Bucket b : sec.buckets()) {
                for (int[] dn : splitByDifficulty(b.n())) {
                    pick(uid, subject, sec.type(), b.codes(), dn[1], dn[0], picked);
                }
                // 该桶按配比没抽满 → 不限难度回填
                int got = countOfType(subject, sec.type(), b.codes(), picked);
                int need = b.n() - got;
                if (need > 0) {
                    pick(uid, subject, sec.type(), b.codes(), need, null, picked);
                }
            }
        }

        if (picked.isEmpty()) {
            throw new IllegalStateException("题库不足，无法组卷");
        }

        // mode 受 CHECK 约束限制，随机组卷沿用 'random'
        Long sessionId = jdbc.queryForObject("""
                insert into practice_session (user_id, mode, target_id, started_at)
                values (?, 'random', ?, now()) returning id
                """, Long.class, uid, subject);

        List<Object[]> rows = new ArrayList<>();
        for (int i = 0; i < picked.size(); i++) {
            rows.add(new Object[]{sessionId, i + 1, picked.get(i)});
        }
        jdbc.batchUpdate("insert into session_question (session_id, item_order, question_id) values (?,?,?)", rows);

        return Map.of("sessionId", sessionId, "count", picked.size(), "subject", subject);
    }

    /**
     * 一级/二级章内随机组卷：一级理论 80 题、一级实操 40 题、二级统一 40 题。
     * 按大纲题型配比抽题；某题型不足时用其他题型补齐，整章题量不足时才少于目标。
     * type 可选（1-5）；mode 使用 chapter_random，target_id 存章节 id。
     */
    @Transactional
    public Map<String, Object> startChapter(UUID uid, int chapterId, int count, Integer type) {
        List<Map<String, Object>> chapters = jdbc.queryForList(
                "select subject_id, level from t_chapter where id = ? and not deleted", chapterId);
        if (chapters.isEmpty()) {
            throw new IllegalArgumentException("章节不存在");
        }
        int subject = ((Number) chapters.get(0).get("subject_id")).intValue();
        int level = ((Number) chapters.get(0).get("level")).intValue();
        if (level != 1 && level != 2) {
            throw new IllegalArgumentException("随机组卷仅支持一级/二级章");
        }
        int n;
        if (level == 1) {
            n = subject == 5 ? 40 : 80;
        } else {
            n = 40;
        }
        Integer typeFilter = (type != null && type >= 1 && type <= 5) ? type : null;

        int available = countChapterQuestions(chapterId, typeFilter);
        if (available == 0) {
            throw new IllegalStateException("本章没有可练习题");
        }
        int target = Math.min(n, available);
        List<Integer> picked = new ArrayList<>();

        if (typeFilter != null) {
            // 明确指定题型：只抽该题型，不做大纲配比
            picked.addAll(pickChapterQuestions(uid, subject, chapterId, typeFilter, target, picked));
        } else {
            // 按大纲题型配比分配名额；题型不足的部分后面用其他题型补齐
            for (Map.Entry<Integer, Integer> e : allocateTypes(subject, target).entrySet()) {
                picked.addAll(pickChapterQuestions(uid, subject, chapterId, e.getKey(), e.getValue(), picked));
            }
            int deficit = target - picked.size();
            if (deficit > 0) {
                picked.addAll(pickChapterQuestions(uid, subject, chapterId, null, deficit, picked));
            }
        }

        if (picked.size() < target) {
            throw new IllegalStateException("组卷题量不足");
        }

        Long sessionId = jdbc.queryForObject("""
                insert into practice_session (user_id, mode, target_id, started_at)
                values (?, 'chapter_random', ?, now()) returning id
                """, Long.class, uid, chapterId);

        List<Object[]> rows = new ArrayList<>();
        for (int i = 0; i < picked.size(); i++) {
            rows.add(new Object[]{sessionId, i + 1, picked.get(i)});
        }
        jdbc.batchUpdate("insert into session_question (session_id, item_order, question_id) values (?,?,?)", rows);

        return Map.of("sessionId", sessionId, "count", picked.size(),
                "chapterId", chapterId, "requested", n, "shortfall", n - picked.size());
    }

    /** 章节子树内可练习题数（可按题型） */
    private int countChapterQuestions(int chapterId, Integer type) {
        List<Object> args = new ArrayList<>();
        args.add(chapterId);
        String typeFilter = "";
        if (type != null) {
            typeFilter = " and q.question_type = ?";
            args.add(type);
        }
        Integer n = jdbc.queryForObject("""
                with recursive sub as (
                  select id from t_chapter where id = ?
                  union all
                  select c.id from t_chapter c join sub s on c.parent_id = s.id
                )
                select count(*)
                  from t_question q
                  join sub on sub.id = q.chapter_id
                 where not q.deleted and q.review_status = 'ok'
                """ + typeFilter, Integer.class, args.toArray());
        return n == null ? 0 : n;
    }

    /** 章节子树内抽题：优先未做过的题；type 为空表示不限题型；只抽大纲标准分值 */
    private List<Integer> pickChapterQuestions(UUID uid, int subject, int chapterId, Integer type,
                                               int limit, List<Integer> exclude) {
        if (limit <= 0) {
            return List.of();
        }
        List<Object> args = new ArrayList<>();
        args.add(chapterId);
        String typeFilter = "";
        if (type != null) {
            typeFilter = " and q.question_type = ?";
            args.add(type);
        }
        // 只抽符合大纲分值的题，保证整卷总分稳定 150/80
        String scoreFilter = """
                 and q.score = case
                   when ? = 4 then case q.question_type
                     when 3 then 1 when 1 then 2 when 2 then 2 when 4 then 2 else q.score end
                   when ? = 5 then case q.question_type
                     when 3 then 1 when 1 then 2 when 4 then 2 when 5 then 6 else q.score end
                   else q.score end
                """;
        args.add(subject);
        args.add(subject);
        String excludeFilter = "";
        if (!exclude.isEmpty()) {
            excludeFilter = " and q.id <> all(?)";
            args.add(exclude.toArray(new Integer[0]));
        }
        args.add(uid);
        args.add(limit);

        return jdbc.queryForList("""
                with recursive sub as (
                  select id from t_chapter where id = ?
                  union all
                  select c.id from t_chapter c join sub s on c.parent_id = s.id
                )
                select q.id
                  from t_question q
                  join sub on sub.id = q.chapter_id
                 where not q.deleted and q.review_status = 'ok'
                """ + typeFilter + scoreFilter + excludeFilter + """
                 order by exists (
                     select 1 from practice_answer pa
                      where pa.user_id = ? and pa.question_id = q.id
                   ) asc,
                   random()
                 limit ?
                """, Integer.class, args.toArray());
    }

    /**
     * 大纲题型配比：理论 判断10:单选50:多选10:填空10；实操 判断8:单选20:填空10:综合2。
     * 用最大余数法把 target 拆成整数题量，余数相同时优先权重大的题型，再按声明顺序。
     */
    private static Map<Integer, Integer> allocateTypes(int subject, int target) {
        int[] types;
        int[] weights;
        if (subject == 4) {
            types = new int[]{1, 2, 3, 4};
            weights = new int[]{50, 10, 10, 10};
        } else if (subject == 5) {
            types = new int[]{1, 3, 4, 5};
            weights = new int[]{20, 8, 10, 2};
        } else {
            return Map.of();
        }

        int weightSum = 0;
        for (int w : weights) {
            weightSum += w;
        }
        Map<Integer, Integer> out = new LinkedHashMap<>();
        double[] remainders = new double[types.length];
        int assigned = 0;
        for (int i = 0; i < types.length; i++) {
            double exact = target * weights[i] / (double) weightSum;
            int base = (int) Math.floor(exact);
            out.put(types[i], base);
            remainders[i] = exact - base;
            assigned += base;
        }

        Integer[] order = {0, 1, 2, 3};
        java.util.Arrays.sort(order, (a, b) -> {
            int cmp = Double.compare(remainders[b], remainders[a]);
            if (cmp != 0) {
                return cmp;
            }
            cmp = Integer.compare(weights[b], weights[a]);
            if (cmp != 0) {
                return cmp;
            }
            return Integer.compare(a, b);
        });
        for (int i = 0; i < target - assigned; i++) {
            int idx = order[i % order.length];
            out.merge(types[idx], 1, Integer::sum);
        }
        return out;
    }

    private int countOfType(int subject, int type, String[] codes, List<Integer> picked) {
        if (picked.isEmpty()) {
            return 0;
        }
        Integer n = jdbc.queryForObject("""
                select count(*) from t_question q
                  join t_chapter c on c.id = q.chapter_id
                 where q.id = any(?) and q.question_type = ?
                """, Integer.class, picked.toArray(new Integer[0]), type);
        return n == null ? 0 : n;
    }

    private void pick(UUID uid, int subject, int type, String[] codes, int count,
                      Integer difficult, List<Integer> into) {
        if (count <= 0) {
            return;
        }
        // 同题型/难度桶内优先未做过的题，未做过的不足时自然回落到做过的题
        List<Integer> got = jdbc.queryForList(
                "select pick_questions_for_user(?, ?, ?, ?, ?, ?, ?)",
                Integer.class,
                uid, subject, type, codes, count, difficult,
                into.isEmpty() ? null : into.toArray(new Integer[0]));
        for (Integer id : got) {
            if (!into.contains(id)) {
                into.add(id);
            }
        }
    }
}
