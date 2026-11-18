BEGIN;
CREATE TABLE t_question_backup_20261117_blank370013 AS SELECT * FROM t_question WHERE id=370013;
DO $$ DECLARE n int; BEGIN SELECT count(*) INTO n FROM t_question_backup_20261117_blank370013; IF n<>1 THEN RAISE EXCEPTION '备份应为1，实际%',n; END IF; END $$;
COMMIT;
