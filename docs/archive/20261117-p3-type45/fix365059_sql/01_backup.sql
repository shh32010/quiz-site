BEGIN;
CREATE TABLE t_question_backup_20261117_fix365059 AS SELECT * FROM t_question WHERE id=365059;
DO $$ DECLARE n int; BEGIN SELECT count(*) INTO n FROM t_question_backup_20261117_fix365059; IF n<>1 THEN RAISE EXCEPTION '备份应为1，实际%',n; END IF; END $$;
COMMIT;
