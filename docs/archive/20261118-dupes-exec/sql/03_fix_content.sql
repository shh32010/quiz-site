-- 4 组 after_fix 的内容修正（2026-11-18）
BEGIN;
CREATE TABLE t_question_backup_20261118_afterfix AS
SELECT * FROM t_question WHERE id IN (389934,389371,389471,389416,389516);

UPDATE t_question
SET option_json = $json${"A": "高级语言程序有解释与编译两种执行方式", "B": "用于辅助编写汇编语言程序的编辑软件称为汇编程序", "C": "机器语言与计算机硬件关系密切,用它编写的程序可移植性较差。", "D": "机器语言和汇编语言都属于低级语言"}$json$,
    analysis = $txt$汇编程序（汇编器）是把汇编语言源程序翻译成机器语言目标程序的翻译程序，不是用于辅助编写汇编语言程序的编辑软件，故 B 叙述错误。$txt$,
    qc_grade = 'good'
WHERE id = 389934;

UPDATE t_question
SET correct = 'C', answer_check = 'match', qc_grade = 'good',
    quality_flags = array_remove(quality_flags, 'answer_conflict')
WHERE id IN (389371, 389471);

UPDATE t_question
SET question_type = 2, correct = 'A,B,D', answer_check = 'match', qc_grade = 'good',
    quality_flags = array_remove(quality_flags, 'answer_conflict')
WHERE id IN (389416, 389516);

-- 修正后解除隔离
UPDATE t_question SET review_status = 'ok' WHERE id IN (389371, 389416);

DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question WHERE id=389934 AND position('汇编程序（汇编器）' in analysis)>0; IF n<>1 THEN RAISE EXCEPTION '389934'; END IF;
 SELECT count(*) INTO n FROM t_question WHERE id IN (389371,389471) AND correct='C'; IF n<>2 THEN RAISE EXCEPTION '95f9'; END IF;
 SELECT count(*) INTO n FROM t_question WHERE id IN (389416,389516) AND question_type=2 AND correct='A,B,D'; IF n<>2 THEN RAISE EXCEPTION 'e36c'; END IF;
 SELECT count(*) INTO n FROM t_question WHERE id IN (389371,389416) AND review_status='ok'; IF n<>2 THEN RAISE EXCEPTION 'unquarantine'; END IF;
END $$;
COMMIT;
