BEGIN;
CREATE TABLE t_question_backup_20261118_t45left AS SELECT * FROM t_question WHERE id IN (342185,359513,377437,389898);
CREATE TABLE t_text_content_backup_20261118_t45left AS SELECT * FROM t_text_content WHERE id IN (342425,359753,377677,390179);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_t45left; IF n<>4 THEN RAISE EXCEPTION '题目备份应为4，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content_backup_20261118_t45left; IF n<>4 THEN RAISE EXCEPTION '文本备份应为4，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question_backup_20261118_t45left WHERE is_golden; IF n<>0 THEN RAISE EXCEPTION '不应含金标'; END IF;
END $$;
COMMIT;
