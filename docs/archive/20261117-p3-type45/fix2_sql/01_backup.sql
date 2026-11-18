BEGIN;
CREATE TABLE t_question_backup_20261117_t45fix2 AS SELECT * FROM t_question WHERE id IN (341857,347283);
DO $$ DECLARE n int; BEGIN SELECT count(*) INTO n FROM t_question_backup_20261117_t45fix2; IF n<>2 THEN RAISE EXCEPTION '备份应为2，实际%',n; END IF; END $$;
COMMIT;
