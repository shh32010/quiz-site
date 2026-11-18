-- 365190/374903 转换备份
BEGIN;
CREATE TABLE t_question_backup_20261117_manual2 AS SELECT * FROM t_question WHERE id IN (365190,374903);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261117_manual2;
 IF n<>2 THEN RAISE EXCEPTION '备份应为2，实际%',n; END IF;
END $$;
COMMIT;
