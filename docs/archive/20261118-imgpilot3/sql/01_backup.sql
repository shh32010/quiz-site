BEGIN;
CREATE TABLE t_question_backup_20261118_imgpilot3 AS SELECT * FROM t_question WHERE id IN (375284,375565,375595,376032,377847);
CREATE TABLE t_text_content_backup_20261118_imgpilot3 AS SELECT * FROM t_text_content WHERE id IN (375524,375805,375835,376272,378087);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_imgpilot3; IF n<>5 THEN RAISE EXCEPTION '题目备份应为5，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content_backup_20261118_imgpilot3; IF n<>5 THEN RAISE EXCEPTION '文本备份应为5，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question_backup_20261118_imgpilot3 WHERE is_golden; IF n<>0 THEN RAISE EXCEPTION '不应含金标'; END IF;
END $$;
COMMIT;
