-- 366525 软删（重复于 370025）；373370 金标修正；379832 保持隔离
BEGIN;
SET LOCAL session_replication_role = replica;

-- 366525：知识点迁移到 370025 后软删
DELETE FROM t_question_kp WHERE question_id = 366525;
INSERT INTO t_question_kp (id, question_id, kp_id, match_source, confidence)
SELECT (b.max_id + row_number() OVER (ORDER BY x.kp_id))::int, 370025, x.kp_id, x.match_source, x.confidence
FROM (VALUES (31904, 'KP补挂v4_20261022', '高'), (31918, 'KP补挂v4_20261022', '高'), (32418, 'KP补挂v4_20261022', '高')) AS x(kp_id, match_source, confidence)
CROSS JOIN (SELECT coalesce(max(id),0) AS max_id FROM t_question_kp) b
WHERE NOT EXISTS (SELECT 1 FROM t_question_kp k WHERE k.question_id = 370025 AND k.kp_id = x.kp_id);
UPDATE t_question SET deleted = true WHERE id = 366525 AND NOT is_golden;

-- 373370：金标修正为 4 空
UPDATE t_question SET
  stem = $q$student 表已经创建完成了，使用修改表结构语句在 s_name 字段上建立 s_NameIdx 的普通索引。

________ TABLE student ________ ________ ________ (s_name);$q$,
  correct = $q$ALTER；ADD；INDEX；s_NameIdx$q$,
  analysis = $q$使用修改表结构方式创建普通索引：ALTER TABLE student ADD INDEX s_NameIdx (s_name); 依次填 ALTER、ADD、INDEX、s_NameIdx。$q$,
  blank_count = 4,
  review_status = 'ok',
  qc_grade = 'good',
  answer_check = 'match'
WHERE id = 373370;

UPDATE t_text_content SET content = $q${"titleContent": "student 表已经创建完成了，使用修改表结构语句在 s_name 字段上建立 s_NameIdx 的普通索引。<br/><br/>________ TABLE student ________ ________ ________ (s_name);", "analyze": "使用修改表结构方式创建普通索引：ALTER TABLE student ADD INDEX s_NameIdx (s_name); 依次填 ALTER、ADD、INDEX、s_NameIdx。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "ALTER", "itemUuid": "00000000000000003733700100000000", "score": null}, {"prefix": "2", "content": "ADD", "itemUuid": "00000000000000003733700200000000", "score": null}, {"prefix": "3", "content": "INDEX", "itemUuid": "00000000000000003733700300000000", "score": null}, {"prefix": "4", "content": "s_NameIdx", "itemUuid": "00000000000000003733700400000000", "score": null}]}$q$ WHERE id = 373610;

DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question WHERE id = 366525 AND deleted; IF n <> 1 THEN RAISE EXCEPTION '366525 未软删'; END IF;
  SELECT count(*) INTO n FROM t_question_kp WHERE question_id = 366525; IF n <> 0 THEN RAISE EXCEPTION '366525 KP 残留'; END IF;
  SELECT count(*) INTO n FROM t_question_kp WHERE question_id = 370025; IF n <> 6 THEN RAISE EXCEPTION '370025 KP 应为6，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE id = 373370 AND question_type = 5 AND blank_count = 4
    AND correct = 'ALTER；ADD；INDEX；s_NameIdx' AND review_status = 'ok' AND qc_grade = 'good' AND answer_check = 'match' AND is_golden;
  IF n <> 1 THEN RAISE EXCEPTION '373370 修正不符'; END IF;
  SELECT count(*) INTO n FROM t_text_content WHERE id = 373610 AND pg_input_is_valid(content,'json') AND position('s_NameIdx' in content) > 0;
  IF n <> 1 THEN RAISE EXCEPTION '373610 文本未同步'; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n <> 44389 THEN RAISE EXCEPTION '活跃应为44389，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n <> 200 THEN RAISE EXCEPTION '金标应为200，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type = 5; IF n <> 1535 THEN RAISE EXCEPTION 'type5 应为1535，实际%', n; END IF;
END $$;
ROLLBACK;
