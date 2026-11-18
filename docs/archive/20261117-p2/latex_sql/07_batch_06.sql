-- LaTeX 第 6 批（10 道）
BEGIN;
CREATE TEMP TABLE latex_expected (id integer PRIMARY KEY, option_new text NOT NULL) ON COMMIT DROP;
INSERT INTO latex_expected (id, option_new) VALUES
(388521, $q${"A": "Sheet1 中的 A1:B3 区域中的数据相加,结果放在 Sheet1 的 E1 单元格中<br/><br/>$$<br/>1 0 0, 2 0 0) = 3 0 0,<br/>$$<br/><br/>50 为及格)”功能<br/><br/>格）<br/><br/>及格\")<br/><br/>\");<br/><br/>)。<br/><br/>2 同时为真, 则<br/><br/>25单元格区域，<br/><br/>二作簿引用。注<br/><br/>$$<br/>B3 + \\text {SUM(A1:}<br/>$$<br/><br/>中", "B": "Sheet1 中的 A1:B3 区域中的数据相加,结果放在 Sheet3 的 B3 单元格中", "C": "Sheet3 中的 A1:B3 区域中的数据相加,结果放在 Sheet1 的 E1 单元格中", "D": "Sheet3 中的 A1:B3 区域中的数据相加,结果放在 Sheet3 的 B2 单元格中"}$q$),
(389294, $q${"A": "$10 kHz$", "B": "$20 kHz$", "C": "$80 kHz$", "D": "$160 kHz$"}$q$),
(389398, $q${"A": "$120 ~KB$", "B": "240KB", "C": "480KB", "D": "960KB"}$q$),
(389413, $q${"A": "$= IF(B2\\geqslant 60,''$ 及格\"，\"不及格\")", "B": "| 平均成绩 | 平均成绩 |<br/>| --- | --- |<br/>| >60 | <75 |", "C": "| 平均成绩 |<br/>| --- |<br/>| >60 |<br/>| <75 |", "D": "| 平均成绩 | 平均成绩 |<br/>| --- | --- |<br/>| >60 | |<br/>| | <75 |"}$q$),
(389579, $q${"A": "内存容量为 $64MB$", "B": "运算速度为 64 MIPS", "C": "主频为 $64MHz$", "D": "整数寄存器和定点运算器的宽度为64位"}$q$),
(389768, $q${"A": "0.1ms", "B": "$4 ~ms$", "C": "8ms", "D": "$120ms$"}$q$),
(389793, $q${"A": "$88.2 ~kb / s$", "B": "176.4 kb/s", "C": "$705.6 ~kb / s$", "D": "$1411.2 ~kb / s$"}$q$),
(389975, $q${"A": "$= A1 + A4$", "B": "$= A1 + SUM(A2,A3,A4)$", "C": "$= SUM(A1,A2 + A3 + A4)$", "D": "$= SUM(A1,A4)$"}$q$),
(390290, $q${"A": "$14MB$", "B": "15 MB", "C": "17 MB", "D": "19 MB"}$q$),
(390586, $q${"A": "$a = 0xA5$", "B": "$b = 5 + {1.5}e2$", "C": "$c = 5.0$", "D": "d = 25.5 % 5"}$q$)
;
UPDATE t_question q
SET option_json = e.option_new
FROM latex_expected e
WHERE q.id = e.id AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id
   WHERE q.option_json = e.option_new;
  IF n <> 10 THEN RAISE EXCEPTION '第 6 批更新数应为 10，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_latex b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 6 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 6 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
