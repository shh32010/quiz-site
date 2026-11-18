-- P2 第 22 批（25 道；html=23 colon=1 prefix=1）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(365323, $q${"A": "Select SNO, SNAME From Student", "B": "Select SNO, SNAME From Student Where Sex = '男'", "C": "Select * From Student Where Sex = '男'", "D": "Select * From Student<br/><br/>【答案】.B<br/><br/>## 表 2<br/><br/>## 白羊叔计算机 转本专业课"}$q$, NULL, NULL),(365372, $q${"A": "SELECT SNO, SNAME FROM Student", "B": "SELECT SNO, SNAME FROM Student WHERE Sex = '男'", "C": "SELECT * FROM STUDENT n. SELECT 3"}$q$, NULL, NULL),(365463, $q${"A": "SELECT sno，sname FROM student WHERE sname='_t%'；", "B": "SELECT sno，sname FROM student WHERE sname LIKE '_t%'；", "C": "SELECT sno，sname FROM student WHERE $\\mathrm{same}=\\% \\mathrm{t}_{-} \\uparrow$", "D": "SELECT sno，sname FROM student WHERE $\\mathrm{same_LICE_\\%t_{-}}$ ；"}$q$, NULL, NULL),(365535, $q${"A": "Select SNO, SNAME From Student", "B": "Select SNO, SNAME From Student Where Sex = '男'", "C": "Select * From Student Where Sex = '男'", "D": "Select * From Student<br/><br/>表2<br/><br/>【答案】B<br/><br/>## 白羊叔计算机 转本专业课"}$q$, NULL, NULL),(365562, $q${"A": "SELECT sno，sname FROM student WHERE sname='_t%'；", "B": "SELECT sno，sname FROM student WHERE sname LIKE '_t%'；", "C": "SELECT sno，sname FROM student WHERE $\\mathrm{sname}= \\% \\mathrm{t}_{-}$", "D": "SELECT sno，sname FROM student WHERE sname LIKE '%t_'；"}$q$, NULL, NULL),(366045, $q${"A": "<Ctrl>+空格", "B": "<Alt>+<Esc>", "C": "<Shift>+空格", "D": "<Alt>+空格"}$q$, NULL, NULL),(366057, $q${"A": "<Alt>+<Tab>", "B": "<Ctrl>+<Esc>", "C": "<Shift> + <Tab>", "D": "<Ctrl>+<Tab>"}$q$, NULL, NULL),(366058, $q${"A": "<Ctrl>+<Shift>", "B": "<Ctrl>+<Space>", "C": "<Shift>+<Space>", "D": "<Ctrl> + <F9>"}$q$, NULL, NULL),(366065, $q${"A": "<Home>", "B": "<Ctrl>+<Home>", "C": "<End>", "D": "<Ctrl>+<End>"}$q$, NULL, NULL),(366067, $q${"A": "<ALT>+<TAB>", "B": "<TAB>", "C": "<CTRL>+<TAB>", "D": "<ESC>"}$q$, NULL, NULL),(366074, $q${"A": "<Ctrl>+<Esc>", "B": "<Alt>+<Tab>", "C": "<Ctrl>+<F6>", "D": "<Shift>+<Esc>"}$q$, NULL, NULL),(366078, $q${"A": "<Ctrl>+<Shift>", "B": "<Ctrl>+空格", "C": "<Alt>+F 功能键", "D": "<Shift>+F 功能键"}$q$, NULL, NULL),(366080, $q${"A": "\"文档\"", "B": "\"设置\"", "C": "\"运行\"", "D": "\"程序\""}$q$, NULL, NULL),(366081, $q${"A": "\"程序\"", "B": "\"启动\"", "C": "\"附件\"", "D": "\"游戏\""}$q$, NULL, NULL),(366082, $q${"A": "<ESC>", "B": "<ALT>", "C": "<ENTER>", "D": "<BACKSPACE>"}$q$, NULL, NULL),(366087, $q${"A": "<Alt>+<F4>", "B": "<Ctrl>+<F4>", "C": "<Shift>+<F4>", "D": "<Ctrl>+<Alt>+<F1>"}$q$, NULL, NULL),(366090, $q${"A": "<ESC>", "B": "<ALT>", "C": "<SHIFT>", "D": "<CTRL>+A"}$q$, NULL, NULL),(366124, NULL, $q$q! 强制退出不保存。$q$, NULL),(366158, $q${"A": "<Ctrl>+<Shift>", "B": "<Shift> +", "C": "<A1t>+<Del>", "D": "<Ctrl>+"}$q$, NULL, NULL),(366159, $q${"A": "<Ctrl>+<Esc>", "B": "<Alt>+<Tab>", "C": "<Ctrl>+<F6>", "D": "<Shift> + <Esc>"}$q$, NULL, NULL),(366172, $q${"A": "<Ctrl>+<Shift>", "B": "$$ +空格", "C": "<Alt>+F 功能键", "D": "<Shift>+F 功能键"}$q$, NULL, NULL),(366174, $q${"A": "<ESC>", "B": "<ALT>", "C": "<ENTER>", "D": "<BACKSPACE>"}$q$, NULL, NULL),(366225, $q${"A": "<Alt>+<F4>", "B": "<Ctrl>+<F4>", "C": "<Shift>+<F4>", "D": "<Ctrl>+<Alt>+<Del>"}$q$, NULL, NULL),(366237, $q${"A": "设置\"允许远程协助连接这台计算机", "B": "设置\"不允许远程连接到计算机\"", "C": "设置\"允许远程连接到此计算机\"", "D": "设置\"不允许远程协助连接这台计算机\""}$q$, NULL, NULL),(366262, NULL, NULL, $q$DVD驱动器设计为向下兼容CD，因此DVD驱动器可以读CD盘中存储的信息。$q$)
;
UPDATE t_question q
SET option_json = coalesce(e.option_new, q.option_json),
    analysis = coalesce(e.analysis_new, q.analysis),
    stem = coalesce(e.stem_new, q.stem)
FROM p2_expected e
WHERE q.id = e.id AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.option_new IS NOT NULL AND q.option_json = e.option_new;
  IF n <> 23 THEN RAISE EXCEPTION '第 22 批 HTML 更新数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 1 THEN RAISE EXCEPTION '第 22 批解析去冒号数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 1 THEN RAISE EXCEPTION '第 22 批前缀修复数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 22 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 22 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
