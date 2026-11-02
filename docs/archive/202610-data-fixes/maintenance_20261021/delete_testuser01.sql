-- 删除测试账号 testuser01（用户 2026-10-21 指示「做4 账号清理」）
-- 先全量快照，再按依赖顺序删除
BEGIN;

\copy (select * from profiles where username='testuser01') to '/tmp/testuser01_profile.csv' with (format csv, header)
\copy (select * from practice_session where user_id=(select id from profiles where username='testuser01')) to '/tmp/testuser01_sessions.csv' with (format csv, header)
\copy (select * from practice_answer where session_id in (select id from practice_session where user_id=(select id from profiles where username='testuser01'))) to '/tmp/testuser01_answers.csv' with (format csv, header)
\copy (select * from session_question where session_id in (select id from practice_session where user_id=(select id from profiles where username='testuser01'))) to '/tmp/testuser01_session_q.csv' with (format csv, header)
\copy (select * from wrong_question where user_id=(select id from profiles where username='testuser01')) to '/tmp/testuser01_wrong.csv' with (format csv, header)
\copy (select * from favorite_question where user_id=(select id from profiles where username='testuser01')) to '/tmp/testuser01_fav.csv' with (format csv, header)
\copy (select * from feedback where user_id=(select id from profiles where username='testuser01')) to '/tmp/testuser01_feedback.csv' with (format csv, header)
\copy (select * from ai_usage where user_id=(select id from profiles where username='testuser01')) to '/tmp/testuser01_ai.csv' with (format csv, header)

DELETE FROM practice_answer WHERE session_id IN (
  SELECT id FROM practice_session WHERE user_id = (SELECT id FROM profiles WHERE username='testuser01'));
DELETE FROM session_question WHERE session_id IN (
  SELECT id FROM practice_session WHERE user_id = (SELECT id FROM profiles WHERE username='testuser01'));
DELETE FROM practice_session WHERE user_id = (SELECT id FROM profiles WHERE username='testuser01');
DELETE FROM wrong_question WHERE user_id = (SELECT id FROM profiles WHERE username='testuser01');
DELETE FROM favorite_question WHERE user_id = (SELECT id FROM profiles WHERE username='testuser01');
DELETE FROM feedback WHERE user_id = (SELECT id FROM profiles WHERE username='testuser01');
DELETE FROM ai_usage WHERE user_id = (SELECT id FROM profiles WHERE username='testuser01');
DELETE FROM profiles WHERE username='testuser01';

SELECT count(*) AS left_profiles FROM profiles WHERE username='testuser01';
COMMIT;
