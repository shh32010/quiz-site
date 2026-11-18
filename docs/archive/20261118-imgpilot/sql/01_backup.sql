BEGIN;
CREATE TABLE t_question_backup_20261118_imgpilot AS SELECT * FROM t_question WHERE id IN (336356,338655,340736,354973);
CREATE TABLE t_text_content_backup_20261118_imgpilot AS SELECT * FROM t_text_content WHERE id IN (336596,338895,340976,355213);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_imgpilot;
 IF n<>4 THEN RAISE EXCEPTION '题目备份应为4，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content_backup_20261118_imgpilot;
 IF n<>4 THEN RAISE EXCEPTION '文本备份应为4，实际%',n; END IF;
END $$;
COMMIT;
