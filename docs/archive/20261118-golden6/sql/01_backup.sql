-- 金标 6 道 P2 修复备份（2026-11-18）
BEGIN;
CREATE TABLE t_question_backup_20261118_golden6 AS SELECT * FROM t_question WHERE id IN (342936,345683,371903,373523,373704,382012);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_golden6; IF n<>6 THEN RAISE EXCEPTION '备份应为6，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question_backup_20261118_golden6 WHERE is_golden; IF n<>6 THEN RAISE EXCEPTION '应全为金标'; END IF;
END $$;
COMMIT;
