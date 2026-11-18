BEGIN;
CREATE TABLE t_question_backup_20261118_361828 AS SELECT * FROM t_question WHERE id = 361828;
CREATE TABLE t_text_content_backup_20261118_361828 AS SELECT * FROM t_text_content WHERE id = 362068;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question_backup_20261118_361828; IF n <> 1 THEN RAISE EXCEPTION '题目备份应为1，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_text_content_backup_20261118_361828; IF n <> 1 THEN RAISE EXCEPTION '文本备份应为1，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question_backup_20261118_361828 WHERE is_golden; IF n <> 0 THEN RAISE EXCEPTION '不应含金标'; END IF;
END $$;
COMMIT;
