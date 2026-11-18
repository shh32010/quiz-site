-- 三道有原卷答案佐证的保留题：清除 uncertain（2026-11-18）
-- 363378：白羊小白书【答案】错误 → B
-- 388560：2005 真题判断题 4 → F → B
-- 388843：2005 真题判断题 11 → T → A
BEGIN;
UPDATE t_question SET qc_grade = 'good', answer_check = 'match'
WHERE id IN (363378, 388560, 388843) AND NOT is_golden;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN t_question_backup_20261118_source3 b ON b.id = q.id
   WHERE q.qc_grade = 'good' AND q.answer_check = 'match' AND q.correct = b.correct;
  IF n <> 3 THEN RAISE EXCEPTION '处理应为3，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n <> 44419 THEN RAISE EXCEPTION '活跃应为44419，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n <> 200 THEN RAISE EXCEPTION '金标应为200，实际%', n; END IF;
END $$;
COMMIT;
