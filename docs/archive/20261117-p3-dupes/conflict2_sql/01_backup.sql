BEGIN;
CREATE TABLE t_question_backup_20261117_conflict2 AS SELECT * FROM t_question WHERE id IN (358468,345588,369492,338738,357231);
DO $$ DECLARE n int; BEGIN SELECT count(*) INTO n FROM t_question_backup_20261117_conflict2; IF n<>5 THEN RAISE EXCEPTION '备份应为5，实际%',n; END IF; END $$;
COMMIT;
