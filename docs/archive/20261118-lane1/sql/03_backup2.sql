BEGIN;
CREATE TABLE t_question_backup_20261118_lane1b AS SELECT * FROM t_question WHERE id IN (344660,370126);
CREATE TABLE t_text_content_backup_20261118_lane1b AS SELECT * FROM t_text_content WHERE id IN (344900,370366);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_lane1b; IF n<>2 THEN RAISE EXCEPTION '题目备份应为2'; END IF;
 SELECT count(*) INTO n FROM t_text_content_backup_20261118_lane1b; IF n<>2 THEN RAISE EXCEPTION '文本备份应为2'; END IF;
END $$;
COMMIT;
