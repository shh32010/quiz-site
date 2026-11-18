BEGIN;
CREATE TABLE t_question_backup_20261118_blank6 AS SELECT * FROM t_question WHERE id IN (369578,370025,370432,374604,378661,378666);
CREATE TABLE t_text_content_backup_20261118_blank6 AS SELECT * FROM t_text_content WHERE id IN (369818,370265,370672,374844,378901,378906);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_blank6; IF n<>6 THEN RAISE EXCEPTION '题目备份应为6'; END IF;
 SELECT count(*) INTO n FROM t_text_content_backup_20261118_blank6; IF n<>6 THEN RAISE EXCEPTION '文本备份应为6'; END IF;
 SELECT count(*) INTO n FROM t_question_backup_20261118_blank6 WHERE is_golden; IF n<>0 THEN RAISE EXCEPTION '含金标'; END IF;
END $$;
COMMIT;
