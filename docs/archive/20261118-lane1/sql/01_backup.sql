BEGIN;
CREATE TABLE t_question_backup_20261118_lane1a AS SELECT * FROM t_question WHERE id IN (344390,366683,368523,385604);
CREATE TABLE t_text_content_backup_20261118_lane1a AS SELECT * FROM t_text_content WHERE id IN (344630,366923,368763,385844);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question_backup_20261118_lane1a; IF n<>4 THEN RAISE EXCEPTION '题目备份应为4，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content_backup_20261118_lane1a; IF n<>4 THEN RAISE EXCEPTION '文本备份应为4，实际%',n; END IF;
END $$;
COMMIT;
