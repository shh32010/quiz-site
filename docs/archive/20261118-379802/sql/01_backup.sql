BEGIN;
CREATE TABLE t_question_backup_20261118_379802 AS SELECT * FROM t_question WHERE id = 379802;
CREATE TABLE t_text_content_backup_20261118_379802 AS SELECT * FROM t_text_content WHERE id = 380042;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question_backup_20261118_379802; IF n <> 1 THEN RAISE EXCEPTION '题目备份应为1'; END IF;
  SELECT count(*) INTO n FROM t_text_content_backup_20261118_379802; IF n <> 1 THEN RAISE EXCEPTION '文本备份应为1'; END IF;
END $$;
COMMIT;
