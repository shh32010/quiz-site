BEGIN;
CREATE TABLE t_question_backup_20261118_blank7 AS SELECT * FROM t_question WHERE id IN (371191,373366,373421,379686,384888,384892);
CREATE TABLE t_text_content_backup_20261118_blank7 AS SELECT * FROM t_text_content WHERE id IN (371431,373606,373661,379926,385128,385132);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_blank7; IF n<>6 THEN RAISE EXCEPTION '题目备份应为6'; END IF;
 SELECT count(*) INTO n FROM t_text_content_backup_20261118_blank7; IF n<>6 THEN RAISE EXCEPTION '文本备份应为6'; END IF;
 SELECT count(*) INTO n FROM t_question_backup_20261118_blank7 WHERE is_golden; IF n<>0 THEN RAISE EXCEPTION '含金标'; END IF;
END $$;
COMMIT;
