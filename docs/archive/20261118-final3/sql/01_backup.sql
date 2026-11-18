BEGIN;
CREATE TABLE t_question_backup_20261118_final3 AS SELECT * FROM t_question WHERE id IN (366525,373370);
CREATE TABLE t_text_content_backup_20261118_final3 AS SELECT * FROM t_text_content WHERE id = 373610;
CREATE TABLE t_question_kp_backup_20261118_final3 AS SELECT * FROM t_question_kp WHERE question_id = 366525;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question_backup_20261118_final3; IF n <> 2 THEN RAISE EXCEPTION '题目备份应为2，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_text_content_backup_20261118_final3; IF n <> 1 THEN RAISE EXCEPTION '文本备份应为1，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question_kp_backup_20261118_final3; IF n <> 3 THEN RAISE EXCEPTION '知识点备份应为3，实际%', n; END IF;
END $$;
COMMIT;
