-- P0 十一题三路盲答：3/3 一致的处理（2026-11-18）
-- 改答案：339591 -> C,D；378787 -> B,C,D,E,F
-- 仅确认答案、清除 uncertain：344071(B)、353937(C)、357108(A,B,C)
BEGIN;
CREATE TEMP TABLE b11(id integer PRIMARY KEY, new_correct text, confirm_only boolean NOT NULL) ON COMMIT DROP;
INSERT INTO b11 VALUES
 (339591, 'C,D', false),
 (344071, NULL, true),
 (353937, NULL, true),
 (357108, NULL, true),
 (378787, 'B,C,D,E,F', false);
UPDATE t_question q SET
  correct = coalesce(e.new_correct, q.correct),
  qc_grade = 'good',
  answer_check = 'match'
FROM b11 e WHERE q.id = e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN b11 e ON e.id = q.id
   WHERE q.qc_grade = 'good' AND q.answer_check = 'match'
     AND (e.new_correct IS NULL OR q.correct = e.new_correct);
  IF n <> 5 THEN RAISE EXCEPTION '处理应为5，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question q JOIN b11 e ON e.id = q.id WHERE e.confirm_only AND q.correct IS DISTINCT FROM (SELECT correct FROM t_question_backup_20261118_blind11 b WHERE b.id=q.id);
  IF n <> 0 THEN RAISE EXCEPTION '仅确认题被改答案%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n <> 44419 THEN RAISE EXCEPTION '活跃应为44419，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n <> 200 THEN RAISE EXCEPTION '金标应为200，实际%', n; END IF;
END $$;
ROLLBACK;
