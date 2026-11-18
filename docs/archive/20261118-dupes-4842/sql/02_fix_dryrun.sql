-- 4842 组：389393 → 389064，补全选项并恢复可练
BEGIN;
UPDATE t_question SET
  option_json = $json${"A": "计算机接入不同类型的局域网需使用不同类型的网卡", "B": "局域网以帧为单位进行数据传输，不同类型局域网的帧格式相同", "C": "局域网的数据帧中包含源计算机的 MAC 地址和目的计算机的 MAC 地址", "D": "现在广泛使用的局域网是以太网"}$json$,
  correct = 'B',
  analysis = $txt$不同类型局域网的帧格式并不相同，故 B 叙述错误。$txt$,
  qc_grade = 'good', answer_check = 'match', review_status = 'ok'
WHERE id = 389064;

CREATE TEMP TABLE dupe_map AS SELECT 389393::int AS dup_id, 389064::int AS survivor_id;

CREATE TEMP TABLE kp_target AS
SELECT DISTINCT ON (question_id, kp_id) question_id, kp_id, match_source, confidence
FROM (
  SELECT k.question_id, k.kp_id, k.match_source, k.confidence, 0 AS pri
  FROM t_question_kp k WHERE k.question_id = 389064
  UNION ALL
  SELECT 389064, k.kp_id, k.match_source, k.confidence, 1 AS pri
  FROM t_question_kp k WHERE k.question_id = 389393
) x
ORDER BY question_id, kp_id, pri, match_source NULLS LAST, confidence NULLS LAST;

DELETE FROM t_question_kp WHERE question_id IN (389064,389393);
WITH base AS MATERIALIZED (SELECT coalesce(max(id),0) AS max_id FROM t_question_kp)
INSERT INTO t_question_kp (id, question_id, kp_id, match_source, confidence)
SELECT (base.max_id + row_number() OVER (ORDER BY t.kp_id))::int, 389064, t.kp_id, t.match_source, t.confidence
FROM kp_target t CROSS JOIN base;

DELETE FROM exam_paper_question ep USING dupe_map m
WHERE ep.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM exam_paper_question s WHERE s.paper_id = ep.paper_id AND s.question_id = m.survivor_id);
UPDATE exam_paper_question ep SET question_id = m.survivor_id FROM dupe_map m WHERE ep.question_id = m.dup_id;

UPDATE t_question SET deleted = true WHERE id = 389393;

DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question WHERE id=389064 AND correct='B' AND review_status='ok' AND qc_grade='good'; IF n<>1 THEN RAISE EXCEPTION '389064'; END IF;
 SELECT count(*) INTO n FROM t_question WHERE id=389393 AND deleted; IF n<>1 THEN RAISE EXCEPTION '389393 未删'; END IF;
 SELECT count(*) INTO n FROM t_question_kp WHERE question_id=389393; IF n<>0 THEN RAISE EXCEPTION 'KP 残留'; END IF;
 SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n<>44383 THEN RAISE EXCEPTION '活跃数'; END IF;
END $$;
ROLLBACK;
