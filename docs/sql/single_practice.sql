-- 单题练习（2026-10-22）
-- 章节题目列表点击进入：/practice?mode=single&target=<questionId>
-- 顺带补上 course（PracticeService 已支持但旧约束没放行）
ALTER TABLE practice_session DROP CONSTRAINT IF EXISTS practice_session_mode_check;
ALTER TABLE practice_session ADD CONSTRAINT practice_session_mode_check
    CHECK (mode = ANY (ARRAY['chapter', 'kp', 'paper', 'wrong', 'random', 'exam', 'random_exam', 'course', 'single']));
