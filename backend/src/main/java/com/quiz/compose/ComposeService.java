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
                new Section(3, new Bucket[]{new Bucket(CODES_A, 6), new Bucket(CODES_B, 4)}),
                new Section(1, new Bucket[]{new Bucket(CODES_A, 30), new Bucket(CODES_B, 20)}),
                new Section(2, new Bucket[]{new Bucket(CODES_A, 6), new Bucket(CODES_B, 4)}),
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
