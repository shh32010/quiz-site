BEGIN;
CREATE TABLE t_question_backup_20261118_imgpilot5 AS SELECT * FROM t_question WHERE id IN (374996,375051);
CREATE TABLE t_text_content_backup_20261118_imgpilot5 AS SELECT * FROM t_text_content WHERE id IN (375236,375291);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_imgpilot5; IF n<>2 THEN RAISE EXCEPTION '题目备份应为2，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content_backup_20261118_imgpilot5; IF n<>2 THEN RAISE EXCEPTION '文本备份应为2，实际%',n; END IF;
END $$;
COMMIT;
