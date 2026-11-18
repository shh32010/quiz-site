BEGIN;
CREATE TABLE t_question_backup_20261118_blind11 AS SELECT * FROM t_question WHERE id IN (339591,344071,353937,357108,378787);
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question_backup_20261118_blind11; IF n <> 5 THEN RAISE EXCEPTION '备份应为5，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question_backup_20261118_blind11 WHERE is_golden; IF n <> 0 THEN RAISE EXCEPTION '不应含金标'; END IF;
END $$;
COMMIT;
