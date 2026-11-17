-- 孤儿知识点链接备份（2026-11-17）
BEGIN;
CREATE TABLE t_question_kp_backup_20261117_orphans AS
SELECT k.* FROM t_question_kp k JOIN t_question q ON q.id = k.question_id WHERE q.deleted;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question_kp_backup_20261117_orphans;
  IF n <> 12706 THEN RAISE EXCEPTION '备份应为 12706，实际 %', n; END IF;
END $$;
COMMIT;
