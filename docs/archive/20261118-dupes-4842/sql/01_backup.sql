BEGIN;
CREATE TABLE t_question_backup_20261118_4842 AS SELECT * FROM t_question WHERE id IN (389064,389393);
CREATE TABLE t_question_kp_backup_20261118_4842 AS SELECT * FROM t_question_kp WHERE question_id IN (389064,389393);
CREATE TABLE exam_paper_question_backup_20261118_4842 AS SELECT * FROM exam_paper_question WHERE question_id IN (389064,389393);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_4842; IF n<>2 THEN RAISE EXCEPTION '题目备份应为2'; END IF;
END $$;
COMMIT;
