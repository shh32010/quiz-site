-- 379832 拆分：保留金标原题隔离，新建 7 道可练题（2026-11-18）
BEGIN;
CREATE TABLE t_question_backup_20261118_379832_split AS SELECT * FROM t_question WHERE id = 379832;
CREATE TABLE t_text_content_backup_20261118_379832_split AS SELECT * FROM t_text_content WHERE id = (SELECT info_text_content_id FROM t_question WHERE id = 379832);
CREATE TABLE t_question_kp_backup_20261118_379832_split AS SELECT * FROM t_question_kp WHERE question_id = 379832;

COMMIT;
