-- 综合 10 道备份（2026-11-17）
BEGIN;
CREATE TABLE t_question_backup_20261117_comp AS
SELECT * FROM t_question WHERE id IN (342200,342210,359347,363951,363959,366249,370095,384492,384946,390385);
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question_backup_20261117_comp;
  IF n <> 10 THEN RAISE EXCEPTION '备份行数应为 10，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question_backup_20261117_comp WHERE is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '备份中含金标 % 道，停止', n; END IF;
END $$;
COMMIT;
