-- W5 收口：5 道冲突题（2026-10-25）
-- 均非金标、均不在真题卷；事务内先备份 5 行，再写入并断言。
BEGIN;

\copy (select id, question_type, correct, qc_grade, review_status, is_golden, analysis from t_question where id in (343131,366988,368568,373125,381036) order by id) to '/opt/quiz-backups/w5_data_before_20261025.csv' with (format csv, header true)

-- 题干/选项无法唯一作答：隔离
UPDATE t_question
   SET review_status = 'quarantined'
 WHERE id IN (343131, 368568, 373125)
   AND NOT is_golden;

-- 组合型单选题误标为多选：改答案并改回单选
UPDATE t_question
   SET correct = 'B', question_type = 1
 WHERE id = 366988
   AND NOT is_golden;

-- SOA：改 A,C；解析仍含 D，保留 qc_grade=error 让前端提示
UPDATE t_question
   SET correct = 'A,C', qc_grade = 'error'
 WHERE id = 381036
   AND NOT is_golden;

DO $$
DECLARE
    n integer;
    g integer;
    active integer;
BEGIN
    SELECT count(*) INTO g FROM t_question WHERE is_golden;
    IF g <> 200 THEN RAISE EXCEPTION 'gold count changed: %', g; END IF;

    SELECT count(*) INTO n FROM t_question
     WHERE id IN (343131,368568,373125) AND review_status = 'quarantined';
    IF n <> 3 THEN RAISE EXCEPTION 'quarantine mismatch: %', n; END IF;

    SELECT count(*) INTO n FROM t_question
     WHERE id = 366988 AND correct = 'B' AND question_type = 1;
    IF n <> 1 THEN RAISE EXCEPTION '366988 mismatch: %', n; END IF;

    SELECT count(*) INTO n FROM t_question
     WHERE id = 381036 AND correct = 'A,C' AND qc_grade = 'error';
    IF n <> 1 THEN RAISE EXCEPTION '381036 mismatch: %', n; END IF;

    SELECT count(*) INTO active FROM t_question
     WHERE NOT deleted AND review_status = 'ok';
    IF active <> 44570 THEN RAISE EXCEPTION 'active count mismatch: %', active; END IF;
END $$;

COMMIT;
