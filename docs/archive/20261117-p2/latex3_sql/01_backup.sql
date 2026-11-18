BEGIN;
CREATE TABLE t_question_backup_20261117_latex3 AS SELECT * FROM t_question WHERE id IN (343205,351329);
DO $$ DECLARE n int; BEGIN SELECT count(*) INTO n FROM t_question_backup_20261117_latex3; IF n<>2 THEN RAISE EXCEPTION '备份应为2，实际%',n; END IF; END $$;
COMMIT;
