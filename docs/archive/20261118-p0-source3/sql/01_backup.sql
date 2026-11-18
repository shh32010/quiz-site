BEGIN;
CREATE TABLE t_question_backup_20261118_source3 AS SELECT * FROM t_question WHERE id IN (363378,388560,388843);
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question_backup_20261118_source3; IF n <> 3 THEN RAISE EXCEPTION '备份应为3，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question_backup_20261118_source3 WHERE is_golden; IF n <> 0 THEN RAISE EXCEPTION '不应含金标'; END IF;
END $$;
COMMIT;
