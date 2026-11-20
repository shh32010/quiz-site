-- 2026-11-20 严格重复题合并：软删 337865（与 358502 归一化后题干完全相同）
-- 337865 的 3 个知识点链接已被 358502 全覆盖；清该题做题记录并重算会话 302
BEGIN;

CREATE TABLE IF NOT EXISTS t_question_backup_20261120_dupe AS
SELECT * FROM t_question WHERE id = 337865;

CREATE TABLE IF NOT EXISTS t_question_kp_backup_20261120_337865 AS
SELECT * FROM t_question_kp WHERE question_id = 337865;

CREATE TABLE IF NOT EXISTS practice_answer_backup_20261120_337865 AS
SELECT * FROM practice_answer WHERE question_id = 337865;

CREATE TABLE IF NOT EXISTS wrong_question_backup_20261120_337865 AS
SELECT * FROM wrong_question WHERE question_id = 337865;

CREATE TABLE IF NOT EXISTS practice_session_backup_20261120_337865 AS
SELECT * FROM practice_session WHERE id = 302;

DELETE FROM t_question_kp WHERE question_id = 337865;
UPDATE t_question SET deleted = true WHERE id = 337865;
DELETE FROM practice_answer WHERE question_id = 337865;
DELETE FROM wrong_question WHERE question_id = 337865;

UPDATE practice_session s SET
  score = (SELECT coalesce(sum(pa.score_got), 0) FROM practice_answer pa WHERE pa.session_id = 302 AND pa.deleted_at IS NULL),
  correct_count = (SELECT count(*) FROM practice_answer pa WHERE pa.session_id = 302 AND pa.deleted_at IS NULL AND pa.is_correct),
  question_count = (SELECT count(*) FROM practice_answer pa WHERE pa.session_id = 302 AND pa.deleted_at IS NULL),
  total_score = (SELECT coalesce(sum(q.score), 0) FROM practice_answer pa JOIN t_question q ON q.id = pa.question_id WHERE pa.session_id = 302 AND pa.deleted_at IS NULL)
 WHERE s.id = 302;

DO $$
DECLARE
  v record;
BEGIN
  IF (SELECT deleted FROM t_question WHERE id = 337865) IS NOT TRUE THEN
    RAISE EXCEPTION '337865 未软删';
  END IF;
  IF (SELECT count(*) FROM t_question_kp WHERE question_id = 337865) <> 0 THEN
    RAISE EXCEPTION '337865 KP 未清理';
  END IF;
  IF EXISTS (SELECT 1 FROM practice_answer WHERE question_id = 337865) THEN
    RAISE EXCEPTION '337865 作答未清理';
  END IF;
  IF (SELECT deleted FROM t_question WHERE id = 358502) IS DISTINCT FROM false THEN
    RAISE EXCEPTION '358502 保留题状态异常';
  END IF;
  SELECT score, total_score, correct_count, question_count INTO v FROM practice_session WHERE id = 302;
  IF v.score <> 83 OR v.total_score <> 142 OR v.correct_count <> 46 OR v.question_count <> 76 THEN
    RAISE EXCEPTION '会话 302 重算不符: score=%, total=%, correct=%, count=%',
      v.score, v.total_score, v.correct_count, v.question_count;
  END IF;
END $$;

COMMIT;
