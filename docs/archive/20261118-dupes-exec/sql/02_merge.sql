-- 02_merge_direct_20261118.sql
-- 先 dry-run：保留最后的 ROLLBACK；断言通过后改为 COMMIT。
BEGIN;

CREATE TEMP TABLE dupe_map ON COMMIT DROP AS
SELECT dup_id, survivor_id FROM dupe44_map_20261118 WHERE batch = 'direct';
CREATE INDEX ON dupe_map (survivor_id);

CREATE TEMP TABLE affected_sessions ON COMMIT DROP AS
SELECT DISTINCT pa.session_id
FROM practice_answer pa
JOIN dupe_map m ON pa.question_id = m.dup_id
WHERE pa.deleted_at IS NULL;

CREATE TEMP TABLE affected_sessions_sq ON COMMIT DROP AS
SELECT DISTINCT sq.session_id
FROM session_question sq
JOIN dupe_map m ON sq.question_id = m.dup_id;

CREATE TEMP TABLE affected_papers ON COMMIT DROP AS
SELECT DISTINCT ep.paper_id
FROM exam_paper_question ep
JOIN dupe_map m ON ep.question_id = m.dup_id;

-- 1) 知识点链接：survivor 现有链接优先，重复链接去重后重建
CREATE TEMP TABLE kp_target ON COMMIT DROP AS
SELECT DISTINCT ON (question_id, kp_id) question_id, kp_id, match_source, confidence
FROM (
  SELECT k.question_id, k.kp_id, k.match_source, k.confidence, 0 AS pri
  FROM t_question_kp k
  JOIN (SELECT DISTINCT survivor_id FROM dupe_map) s ON s.survivor_id = k.question_id
  UNION ALL
  SELECT m.survivor_id, k.kp_id, k.match_source, k.confidence, 1 AS pri
  FROM t_question_kp k
  JOIN dupe_map m ON k.question_id = m.dup_id
) x
ORDER BY question_id, kp_id, pri, match_source NULLS LAST, confidence NULLS LAST;

DELETE FROM t_question_kp
WHERE question_id IN (SELECT survivor_id FROM dupe_map UNION SELECT dup_id FROM dupe_map);

WITH base AS MATERIALIZED (SELECT coalesce(max(id),0) AS max_id FROM t_question_kp)
INSERT INTO t_question_kp (id, question_id, kp_id, match_source, confidence)
SELECT (base.max_id + row_number() OVER (ORDER BY t.question_id, t.kp_id))::int,
       t.question_id, t.kp_id, t.match_source, t.confidence
FROM kp_target t CROSS JOIN base;

-- 2) 做题记录：同会话已有 survivor 则软删重复，否则改挂
UPDATE practice_answer pa
SET deleted_at = now()
FROM dupe_map m
WHERE pa.question_id = m.dup_id AND pa.deleted_at IS NULL
  AND EXISTS (SELECT 1 FROM practice_answer s
              WHERE s.session_id = pa.session_id AND s.question_id = m.survivor_id);

UPDATE practice_answer pa
SET question_id = m.survivor_id
FROM dupe_map m
WHERE pa.question_id = m.dup_id AND pa.deleted_at IS NULL;

-- 3) 错题本：同用户已有 survivor 则合并计数并软删重复，否则改挂
UPDATE wrong_question w
SET wrong_count = w.wrong_count + s.wrong_count,
    last_wrong_at = greatest(w.last_wrong_at, s.last_wrong_at),
    next_review_at = least(w.next_review_at, s.next_review_at),
    streak_correct = greatest(w.streak_correct, s.streak_correct),
    resolved = w.resolved AND s.resolved
FROM dupe_map m, wrong_question s
WHERE w.question_id = m.dup_id AND w.deleted_at IS NULL
  AND s.user_id = w.user_id AND s.question_id = m.survivor_id;

UPDATE wrong_question w
SET deleted_at = now()
FROM dupe_map m
WHERE w.question_id = m.dup_id AND w.deleted_at IS NULL
  AND EXISTS (SELECT 1 FROM wrong_question s
              WHERE s.user_id = w.user_id AND s.question_id = m.survivor_id);

UPDATE wrong_question w
SET question_id = m.survivor_id
FROM dupe_map m
WHERE w.question_id = m.dup_id AND w.deleted_at IS NULL;

-- 4) 收藏
DELETE FROM favorite_question f
USING dupe_map m
WHERE f.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM favorite_question s
              WHERE s.user_id = f.user_id AND s.question_id = m.survivor_id);

UPDATE favorite_question f
SET question_id = m.survivor_id
FROM dupe_map m
WHERE f.question_id = m.dup_id;

-- 5) 会话题目：先改挂，再删同会话重复
DELETE FROM session_question sq
USING dupe_map m
WHERE sq.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM session_question s
              WHERE s.session_id = sq.session_id AND s.question_id = m.survivor_id);

UPDATE session_question sq
SET question_id = m.survivor_id
FROM dupe_map m
WHERE sq.question_id = m.dup_id;

DELETE FROM session_question sq
USING session_question s
WHERE sq.session_id = s.session_id
  AND sq.question_id = s.question_id
  AND sq.item_order > s.item_order
  AND sq.session_id IN (SELECT session_id FROM affected_sessions_sq);

-- 6) 试卷题目
DELETE FROM exam_paper_question ep
USING dupe_map m
WHERE ep.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM exam_paper_question s
              WHERE s.paper_id = ep.paper_id AND s.question_id = m.survivor_id);

UPDATE exam_paper_question ep
SET question_id = m.survivor_id
FROM dupe_map m
WHERE ep.question_id = m.dup_id;

DELETE FROM exam_paper_question ep
USING exam_paper_question s
WHERE ep.paper_id = s.paper_id
  AND ep.question_id = s.question_id
  AND ep.item_order > s.item_order
  AND ep.paper_id IN (SELECT paper_id FROM affected_papers);

-- 7) 反馈
UPDATE feedback f
SET question_id = m.survivor_id
FROM dupe_map m
WHERE f.question_id = m.dup_id;

-- 8) AI 解析缓存
DELETE FROM ai_explain_cache c
USING dupe_map m
WHERE c.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM ai_explain_cache s
              WHERE s.question_id = m.survivor_id AND s.mode = c.mode);

UPDATE ai_explain_cache c
SET question_id = m.survivor_id
FROM dupe_map m
WHERE c.question_id = m.dup_id;

-- 9) 软删重复题（不物理删除；金标保护）
UPDATE t_question q
SET deleted = true
FROM dupe_map m
WHERE q.id = m.dup_id
  AND NOT q.is_golden;

-- 10) 会话计数与已交卷会话分数
UPDATE practice_session s
SET question_count = (SELECT count(*) FROM session_question sq WHERE sq.session_id = s.id)
WHERE s.id IN (SELECT session_id FROM affected_sessions_sq);

UPDATE practice_session s
SET score = coalesce((SELECT sum(a.score_got) FROM practice_answer a
                      WHERE a.session_id = s.id AND a.deleted_at IS NULL), 0),
    correct_count = coalesce((SELECT count(*) FROM practice_answer a
                              WHERE a.session_id = s.id AND a.deleted_at IS NULL AND a.is_correct), 0)
WHERE s.id IN (SELECT session_id FROM affected_sessions)
  AND s.finished_at IS NOT NULL;

-- 11) 事务内断言
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question q
  JOIN dupe_map m ON q.id = m.dup_id
  WHERE NOT q.deleted;
  IF n <> 0 THEN RAISE EXCEPTION '仍有未软删的重复题 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q
  JOIN (SELECT DISTINCT survivor_id FROM dupe_map) s ON q.id = s.survivor_id
  WHERE q.deleted;
  IF n <> 0 THEN RAISE EXCEPTION 'survivor 被软删 %', n; END IF;

  SELECT count(*) INTO n FROM t_question_kp k
  JOIN dupe_map m ON k.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION 'dup KP 残留 %', n; END IF;

  SELECT count(*) INTO n FROM (
    SELECT question_id, kp_id FROM t_question_kp GROUP BY 1,2 HAVING count(*) > 1
  ) x;
  IF n <> 0 THEN RAISE EXCEPTION 'KP 重复 %', n; END IF;

  SELECT count(*) INTO n FROM session_question sq JOIN dupe_map m ON sq.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION '会话引用残留 %', n; END IF;

  SELECT count(*) INTO n FROM exam_paper_question ep JOIN dupe_map m ON ep.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION '试卷引用残留 %', n; END IF;
END $$;

COMMIT;