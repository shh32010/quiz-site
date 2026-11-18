-- 跨章节 28 组合并（30 行软删）
BEGIN;
CREATE TEMP TABLE dupe_map (dup_id integer PRIMARY KEY, survivor_id integer NOT NULL) ON COMMIT DROP;
INSERT INTO dupe_map VALUES (334861,367344),(337129,367044),(338130,338444),(338160,362000),(338240,362917),(338248,341873),(341970,341873),(341975,364486),(347394,345268),(347754,361039),(358420,363277),(358560,377417),(359713,382977),(362316,342609),(362368,364346),(363952,385019),(363955,385020),(363966,365935),(364331,364305),(364438,364305),(365175,365157),(365178,365154),(369949,352472),(370805,370926),(374779,383905),(375287,374896),(382814,367032),(382836,334538),(383241,380919),(389227,389327);
CREATE INDEX ON dupe_map(survivor_id);
CREATE TEMP TABLE affected_sessions ON COMMIT DROP AS
SELECT DISTINCT pa.session_id FROM practice_answer pa JOIN dupe_map m ON pa.question_id = m.dup_id WHERE pa.deleted_at IS NULL;

CREATE TEMP TABLE kp_target ON COMMIT DROP AS
SELECT DISTINCT ON (question_id, kp_id) question_id, kp_id, match_source, confidence
FROM (
  SELECT k.question_id, k.kp_id, k.match_source, k.confidence, 0 AS pri
  FROM t_question_kp k JOIN (SELECT DISTINCT survivor_id FROM dupe_map) s ON s.survivor_id = k.question_id
  UNION ALL
  SELECT m.survivor_id, k.kp_id, k.match_source, k.confidence, 1 AS pri
  FROM t_question_kp k JOIN dupe_map m ON k.question_id = m.dup_id
) x
ORDER BY question_id, kp_id, pri, match_source NULLS LAST, confidence NULLS LAST;
DELETE FROM t_question_kp WHERE question_id IN (SELECT survivor_id FROM dupe_map UNION SELECT dup_id FROM dupe_map);
WITH base AS MATERIALIZED (SELECT coalesce(max(id),0) AS max_id FROM t_question_kp)
INSERT INTO t_question_kp (id, question_id, kp_id, match_source, confidence)
SELECT (base.max_id + row_number() OVER (ORDER BY t.question_id, t.kp_id))::int, t.question_id, t.kp_id, t.match_source, t.confidence
FROM kp_target t CROSS JOIN base;

UPDATE practice_answer pa SET deleted_at = now()
FROM dupe_map m
WHERE pa.question_id = m.dup_id AND pa.deleted_at IS NULL
  AND EXISTS (SELECT 1 FROM practice_answer s WHERE s.session_id = pa.session_id AND s.question_id = m.survivor_id);
UPDATE practice_answer pa SET question_id = m.survivor_id
FROM dupe_map m WHERE pa.question_id = m.dup_id AND pa.deleted_at IS NULL;

UPDATE wrong_question w
SET wrong_count = w.wrong_count + s.wrong_count,
    last_wrong_at = greatest(w.last_wrong_at, s.last_wrong_at),
    next_review_at = least(w.next_review_at, s.next_review_at),
    streak_correct = greatest(w.streak_correct, s.streak_correct),
    resolved = w.resolved AND s.resolved
FROM dupe_map m, wrong_question s
WHERE w.question_id = m.dup_id AND w.deleted_at IS NULL
  AND s.user_id = w.user_id AND s.question_id = m.survivor_id;
UPDATE wrong_question w SET deleted_at = now()
FROM dupe_map m
WHERE w.question_id = m.dup_id AND w.deleted_at IS NULL
  AND EXISTS (SELECT 1 FROM wrong_question s WHERE s.user_id = w.user_id AND s.question_id = m.survivor_id);
UPDATE wrong_question w SET question_id = m.survivor_id
FROM dupe_map m WHERE w.question_id = m.dup_id AND w.deleted_at IS NULL;

DELETE FROM favorite_question f USING dupe_map m
WHERE f.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM favorite_question s WHERE s.user_id = f.user_id AND s.question_id = m.survivor_id);
UPDATE favorite_question f SET question_id = m.survivor_id FROM dupe_map m WHERE f.question_id = m.dup_id;

DELETE FROM session_question sq USING dupe_map m
WHERE sq.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM session_question s WHERE s.session_id = sq.session_id AND s.question_id = m.survivor_id);
UPDATE session_question sq SET question_id = m.survivor_id FROM dupe_map m WHERE sq.question_id = m.dup_id;
DELETE FROM session_question sq USING session_question s
WHERE sq.session_id = s.session_id AND sq.question_id = s.question_id AND sq.item_order > s.item_order;

DELETE FROM exam_paper_question ep USING dupe_map m
WHERE ep.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM exam_paper_question s WHERE s.paper_id = ep.paper_id AND s.question_id = m.survivor_id);
UPDATE exam_paper_question ep SET question_id = m.survivor_id FROM dupe_map m WHERE ep.question_id = m.dup_id;
DELETE FROM exam_paper_question ep USING exam_paper_question s
WHERE ep.paper_id = s.paper_id AND ep.question_id = s.question_id AND ep.item_order > s.item_order;

UPDATE feedback f SET question_id = m.survivor_id FROM dupe_map m WHERE f.question_id = m.dup_id;
DELETE FROM ai_explain_cache c USING dupe_map m
WHERE c.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM ai_explain_cache s WHERE s.question_id = m.survivor_id AND s.mode = c.mode);
UPDATE ai_explain_cache c SET question_id = m.survivor_id FROM dupe_map m WHERE c.question_id = m.dup_id;

UPDATE t_question q SET deleted = true FROM dupe_map m WHERE q.id = m.dup_id AND NOT q.is_golden;

UPDATE practice_session s
SET score = coalesce((SELECT sum(a.score_got) FROM practice_answer a WHERE a.session_id = s.id AND a.deleted_at IS NULL), 0),
    correct_count = coalesce((SELECT count(*) FROM practice_answer a WHERE a.session_id = s.id AND a.deleted_at IS NULL AND a.is_correct), 0)
WHERE s.id IN (SELECT session_id FROM affected_sessions) AND s.finished_at IS NOT NULL;

DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM dupe_map; IF n <> 30 THEN RAISE EXCEPTION 'map 应为 30，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE id IN (334538,334861,337129,338130,338160,338240,338248,338444,341873,341970,341975,342609,345268,347394,347754,352472,358420,358560,359713,361039,362000,362316,362368,362917,363277,363952,363955,363966,364305,364331,364346,364438,364486,365154,365157,365175,365178,365935,367032,367044,367344,369949,370805,370926,374779,374896,375287,377417,380919,382814,382836,382977,383241,383905,385019,385020,389227,389327) AND NOT deleted; IF n <> 28 THEN RAISE EXCEPTION '存活应为 28，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE id IN (334538,334861,337129,338130,338160,338240,338248,338444,341873,341970,341975,342609,345268,347394,347754,352472,358420,358560,359713,361039,362000,362316,362368,362917,363277,363952,363955,363966,364305,364331,364346,364438,364486,365154,365157,365175,365178,365935,367032,367044,367344,369949,370805,370926,374779,374896,375287,377417,380919,382814,382836,382977,383241,383905,385019,385020,389227,389327) AND deleted; IF n <> 30 THEN RAISE EXCEPTION '软删应为 30，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n <> 44432 THEN RAISE EXCEPTION '活跃应为 44432，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status='ok'; IF n <> 44187 THEN RAISE EXCEPTION '可练应为 44187，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status='ok' AND qc_grade='good' AND answer_check='match'; IF n <> 28079 THEN RAISE EXCEPTION 'good/match 应为 28079，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status='ok' AND qc_grade='error'; IF n <> 125 THEN RAISE EXCEPTION 'ok/error 应为 125，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n <> 200 THEN RAISE EXCEPTION '金标应为 200，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question_kp WHERE question_id IN (334861,337129,338130,338160,338240,338248,341970,341975,347394,347754,358420,358560,359713,362316,362368,363952,363955,363966,364331,364438,365175,365178,369949,370805,374779,375287,382814,382836,383241,389227); IF n <> 0 THEN RAISE EXCEPTION '仍有知识点链接指向重复题 %', n; END IF;
  SELECT count(*) INTO n FROM (SELECT question_id,kp_id FROM t_question_kp GROUP BY 1,2 HAVING count(*)>1) x; IF n <> 0 THEN RAISE EXCEPTION '知识点链接重复 %', n; END IF;
  SELECT count(*) INTO n FROM practice_answer WHERE question_id IN (334861,337129,338130,338160,338240,338248,341970,341975,347394,347754,358420,358560,359713,362316,362368,363952,363955,363966,364331,364438,365175,365178,369949,370805,374779,375287,382814,382836,383241,389227) AND deleted_at IS NULL; IF n <> 0 THEN RAISE EXCEPTION '仍有作答 %', n; END IF;
  SELECT count(*) INTO n FROM wrong_question WHERE question_id IN (334861,337129,338130,338160,338240,338248,341970,341975,347394,347754,358420,358560,359713,362316,362368,363952,363955,363966,364331,364438,365175,365178,369949,370805,374779,375287,382814,382836,383241,389227) AND deleted_at IS NULL; IF n <> 0 THEN RAISE EXCEPTION '仍有错题 %', n; END IF;
  SELECT count(*) INTO n FROM favorite_question WHERE question_id IN (334861,337129,338130,338160,338240,338248,341970,341975,347394,347754,358420,358560,359713,362316,362368,363952,363955,363966,364331,364438,365175,365178,369949,370805,374779,375287,382814,382836,383241,389227); IF n <> 0 THEN RAISE EXCEPTION '仍有收藏 %', n; END IF;
  SELECT count(*) INTO n FROM session_question WHERE question_id IN (334861,337129,338130,338160,338240,338248,341970,341975,347394,347754,358420,358560,359713,362316,362368,363952,363955,363966,364331,364438,365175,365178,369949,370805,374779,375287,382814,382836,383241,389227); IF n <> 0 THEN RAISE EXCEPTION '仍有会话题 %', n; END IF;
  SELECT count(*) INTO n FROM exam_paper_question WHERE question_id IN (334861,337129,338130,338160,338240,338248,341970,341975,347394,347754,358420,358560,359713,362316,362368,363952,363955,363966,364331,364438,365175,365178,369949,370805,374779,375287,382814,382836,383241,389227); IF n <> 0 THEN RAISE EXCEPTION '仍有试卷题 %', n; END IF;
  SELECT count(*) INTO n FROM feedback WHERE question_id IN (334861,337129,338130,338160,338240,338248,341970,341975,347394,347754,358420,358560,359713,362316,362368,363952,363955,363966,364331,364438,365175,365178,369949,370805,374779,375287,382814,382836,383241,389227); IF n <> 0 THEN RAISE EXCEPTION '仍有反馈 %', n; END IF;
  SELECT count(*) INTO n FROM ai_explain_cache WHERE question_id IN (334861,337129,338130,338160,338240,338248,341970,341975,347394,347754,358420,358560,359713,362316,362368,363952,363955,363966,364331,364438,365175,365178,369949,370805,374779,375287,382814,382836,383241,389227); IF n <> 0 THEN RAISE EXCEPTION '仍有 AI 缓存 %', n; END IF;
END $$;
COMMIT;
