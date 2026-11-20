-- 2026-11-20 题型误标专项：124 道「填空型判断题」（type4，答案对/错）批量转判断题 type3
-- 答案映射：对→A，错→B；同时清洗 3 道题干（365274 OCR 错乱、369906/374775 括号未闭合）
BEGIN;

CREATE TABLE IF NOT EXISTS t_question_backup_20261120_judge4 AS
SELECT * FROM t_question
 WHERE question_type = 4 AND deleted = false AND trim(correct) IN ('对', '错');

UPDATE t_question
   SET question_type = 3,
       correct = CASE WHEN trim(correct) = '对' THEN 'A' ELSE 'B' END
 WHERE question_type = 4 AND deleted = false AND trim(correct) IN ('对', '错');

-- 365274：OCR 错乱题干还原
UPDATE t_question
   SET stem = '高级语言编写的程序称为源程序，它不能直接在计算机中运行，必须经相应的编译程序将其翻译成机器语言程序才能执行。'
 WHERE id = 365274;

-- 369906 / 374775：补齐未闭合的括号
UPDATE t_question
   SET stem = regexp_replace(stem, '（\s*$', '（ ）')
 WHERE id IN (369906, 374775);

DO $$
DECLARE
  n int;
BEGIN
  SELECT count(*) INTO n FROM t_question
   WHERE question_type = 4 AND deleted = false AND trim(correct) IN ('对', '错');
  IF n <> 0 THEN
    RAISE EXCEPTION '仍有 % 道 type4 对/错题未转换', n;
  END IF;
  SELECT count(*) INTO n
    FROM t_question q JOIN t_question_backup_20261120_judge4 b ON b.id = q.id
   WHERE q.question_type = 3 AND q.correct IN ('A', 'B');
  IF n <> 124 THEN
    RAISE EXCEPTION '批量转 type3 数量不符: %', n;
  END IF;
  IF (SELECT stem FROM t_question WHERE id = 365274) NOT LIKE '%编译程序%' THEN
    RAISE EXCEPTION '365274 题干未清洗';
  END IF;
  IF (SELECT stem FROM t_question WHERE id = 369906) NOT LIKE '%（ ）%' THEN
    RAISE EXCEPTION '369906 括号未修复';
  END IF;
  IF (SELECT stem FROM t_question WHERE id = 374775) NOT LIKE '%（ ）%' THEN
    RAISE EXCEPTION '374775 括号未修复';
  END IF;
END $$;

COMMIT;
