BEGIN;
CREATE TABLE t_question_backup_20261118_imgpilot2 AS SELECT * FROM t_question WHERE id IN (364320,364696,365240);
CREATE TABLE t_text_content_backup_20261118_imgpilot2 AS SELECT * FROM t_text_content WHERE id IN (364560,364936,365480);
DO $$ DECLARE n int; BEGIN SELECT count(*) INTO n FROM t_question_backup_20261118_imgpilot2; IF n<>3 THEN RAISE EXCEPTION '题目备份应为3，实际%',n; END IF; SELECT count(*) INTO n FROM t_text_content_backup_20261118_imgpilot2; IF n<>3 THEN RAISE EXCEPTION '文本备份应为3，实际%',n; END IF; END $$;
COMMIT;
