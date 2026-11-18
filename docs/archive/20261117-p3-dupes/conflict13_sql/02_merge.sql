-- 冲突 13 组合并（13 行软删）
BEGIN;
CREATE TEMP TABLE dupe_map (dup_id integer PRIMARY KEY, survivor_id integer NOT NULL) ON COMMIT DROP;
INSERT INTO dupe_map VALUES (338532,338806),(338738,338669),(355072,354959),(357231,356530),(361042,347213),(362450,358468),(362452,358467),(362546,358609),(363135,358435),(363215,358453),(367094,337160),(384501,384498),(384937,384935);
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
  SELECT count(*) INTO n FROM dupe_map; IF n <> 13 THEN RAISE EXCEPTION 'map 应为 13，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE id IN (337160,338532,338669,338738,338806,347213,354959,355072,356530,357231,358435,358453,358467,358468,358609,361042,362450,362452,362546,363135,363215,367094,384498,384501,384935,384937) AND NOT deleted; IF n <> 13 THEN RAISE EXCEPTION '存活应为 13，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE id IN (337160,338532,338669,338738,338806,347213,354959,355072,356530,357231,358435,358453,358467,358468,358609,361042,362450,362452,362546,363135,363215,367094,384498,384501,384935,384937) AND deleted; IF n <> 13 THEN RAISE EXCEPTION '软删应为 13，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n <> 44419 THEN RAISE EXCEPTION '活跃应为 44419，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status='ok'; IF n <> 44174 THEN RAISE EXCEPTION '可练应为 44174，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status='ok' AND qc_grade='good' AND answer_check='match'; IF n <> 28070 THEN RAISE EXCEPTION 'good/match 应为 28070，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status='ok' AND qc_grade='error'; IF n <> 125 THEN RAISE EXCEPTION 'ok/error 应为 125，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n <> 200 THEN RAISE EXCEPTION '金标应为 200，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question_kp WHERE question_id IN (338532,338738,355072,357231,361042,362450,362452,362546,363135,363215,367094,384501,384937); IF n <> 0 THEN RAISE EXCEPTION '仍有知识点链接指向重复题 %', n; END IF;
  SELECT count(*) INTO n FROM (SELECT question_id,kp_id FROM t_question_kp GROUP BY 1,2 HAVING count(*)>1) x; IF n <> 0 THEN RAISE EXCEPTION '知识点链接重复 %', n; END IF;
  SELECT count(*) INTO n FROM practice_answer WHERE question_id IN (338532,338738,355072,357231,361042,362450,362452,362546,363135,363215,367094,384501,384937) AND deleted_at IS NULL; IF n <> 0 THEN RAISE EXCEPTION '仍有作答 %', n; END IF;
  SELECT count(*) INTO n FROM wrong_question WHERE question_id IN (338532,338738,355072,357231,361042,362450,362452,362546,363135,363215,367094,384501,384937) AND deleted_at IS NULL; IF n <> 0 THEN RAISE EXCEPTION '仍有错题 %', n; END IF;
  SELECT count(*) INTO n FROM favorite_question WHERE question_id IN (338532,338738,355072,357231,361042,362450,362452,362546,363135,363215,367094,384501,384937); IF n <> 0 THEN RAISE EXCEPTION '仍有收藏 %', n; END IF;
  SELECT count(*) INTO n FROM session_question WHERE question_id IN (338532,338738,355072,357231,361042,362450,362452,362546,363135,363215,367094,384501,384937); IF n <> 0 THEN RAISE EXCEPTION '仍有会话题 %', n; END IF;
  SELECT count(*) INTO n FROM exam_paper_question WHERE question_id IN (338532,338738,355072,357231,361042,362450,362452,362546,363135,363215,367094,384501,384937); IF n <> 0 THEN RAISE EXCEPTION '仍有试卷题 %', n; END IF;
  SELECT count(*) INTO n FROM feedback WHERE question_id IN (338532,338738,355072,357231,361042,362450,362452,362546,363135,363215,367094,384501,384937); IF n <> 0 THEN RAISE EXCEPTION '仍有反馈 %', n; END IF;
  SELECT count(*) INTO n FROM ai_explain_cache WHERE question_id IN (338532,338738,355072,357231,361042,362450,362452,362546,363135,363215,367094,384501,384937); IF n <> 0 THEN RAISE EXCEPTION '仍有 AI 缓存 %', n; END IF;
END $$;
COMMIT;
