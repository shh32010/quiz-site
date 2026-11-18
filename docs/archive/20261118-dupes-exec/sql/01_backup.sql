-- 01_backup_20261118.sql
BEGIN;

CREATE TABLE IF NOT EXISTS t_question_backup_20261118_dupes AS
SELECT q.* FROM t_question q WHERE q.id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS t_question_kp_backup_20261118_dupes AS
SELECT k.* FROM t_question_kp k WHERE k.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS practice_answer_backup_20261118_dupes AS
SELECT a.* FROM practice_answer a WHERE a.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS wrong_question_backup_20261118_dupes AS
SELECT w.* FROM wrong_question w WHERE w.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS favorite_question_backup_20261118_dupes AS
SELECT f.* FROM favorite_question f WHERE f.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS session_question_backup_20261118_dupes AS
SELECT s.* FROM session_question s WHERE s.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS exam_paper_question_backup_20261118_dupes AS
SELECT e.* FROM exam_paper_question e WHERE e.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS feedback_backup_20261118_dupes AS
SELECT f.* FROM feedback f WHERE f.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS ai_explain_cache_backup_20261118_dupes AS
SELECT c.* FROM ai_explain_cache c WHERE c.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS t_question_notes_archive_backup_20261118_dupes AS
SELECT n.* FROM t_question_notes_archive n WHERE n.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS dupes44_baseline_20261118 AS
SELECT now() AS captured_at,
       (SELECT count(*) FROM t_question WHERE NOT deleted) AS active_q,
       (SELECT count(*) FROM t_question WHERE NOT deleted AND is_golden) AS golden_q,
       (SELECT count(*) FROM t_question_kp) AS kp_links;

DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question_backup_20261118_dupes;
  IF n <> 92 THEN RAISE EXCEPTION 't_question 备份应为 92，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question_backup_20261118_dupes WHERE is_golden;
  IF n <> 1 THEN RAISE EXCEPTION '备份金标应为 1，实际 %', n; END IF;
END $$;

COMMIT;