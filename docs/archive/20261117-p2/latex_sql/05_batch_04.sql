-- LaTeX 第 4 批（25 道）
BEGIN;
CREATE TEMP TABLE latex_expected (id integer PRIMARY KEY, option_new text NOT NULL) ON COMMIT DROP;
INSERT INTO latex_expected (id, option_new) VALUES
(357799, $q${"A": "内存容量为64MB", "B": "运算速度为 64MIPS (5) 芯", "C": "主频为 $64MHz$", "D": "整数寄存器和定点运算器的宽度 (6) 现"}$q$),
(357849, $q${"A": "1000b/s", "B": "1000字节/s", "C": "$1024 / s$", "D": "1024 个字节/s"}$q$),
(357868, $q${"A": "6 H", "B": "$4H$", "C": "$2 H$", "D": "8H"}$q$),
(358107, $q${"A": "$2^{n}$", "B": "$-2^{n}$", "C": "$2^{n - 1}$", "D": "$-2^{n - 1}$"}$q$),
(358224, $q${"A": "$$ +A", "B": "$\\langle$ CTRL $\\rangle +V$", "C": "$\\langle CTRL\\rangle+B$", "D": "$ + X$"}$q$),
(358269, $q${"A": "单击 “文件” 下拉菜单中的 “关闭” 命令", "B": "单击 “文件” 下拉菜单的 “退出” 命令", "C": "按快捷键 $[A1t] + [F4]$", "D": "双击 PowerPoint 窗口的控制菜单图标"}$q$),
(359852, $q${"A": "$= SUM(B2:B5)$", "B": "=SUM(C2:C5)", "C": "=SUM(B3:B6)", "D": "$= SUM(C3:C6)$"}$q$),
(359864, $q${"A": "=SUM(A1:A5)", "B": "$= SUM(A1:A4,A5)$", "C": "$= A1 + A2 + A3 + A4 + A5$", "D": "$= SUM(A1,A2,A3,A4,A5)$"}$q$),
(360169, $q${"A": "$(73)_{0}$", "B": "$(A9)_{H}$", "C": "$(10101000)_{B}$", "D": "$(75)_{D}$"}$q$),
(360201, $q${"A": "机内码为 $(BBAA)_{H}$", "B": "国标码为 $(3B2A)_{H}$", "C": "国标码为 $(4730)_{H}$", "D": "机内码为 $(9B8A)_{H}$"}$q$),
(361659, $q${"A": "$10 ~m$", "B": "3 m", "C": "$30 ~m$", "D": "$300m$"}$q$),
(361725, $q${"A": "$20Hz \\sim 20KHz$", "B": "$300Hz\\sim 3400Hz$", "C": "20MHz~40MHz", "D": "300KHz～3400KHz"}$q$),
(361726, $q${"A": "$960kB$", "B": "$480kB$", "C": "$120kB$", "D": "$60kB$"}$q$),
(361805, $q${"A": "300000%", "B": "=3000/1", "C": "$30E + 2$", "D": "3,000"}$q$),
(361843, $q${"A": "A1+5", "B": "$+B1 + 5$", "C": "SUM(A1:B2)", "D": "=COUNT(A1,B2)"}$q$),
(361989, $q${"A": "$= (15 - A1) / 3$", "B": "$= A2 / C1$", "C": "SUM(A2:A4)/2", "D": "$= A2 + A3 + D4$"}$q$),
(362353, $q${"A": "$20Hz \\sim 20KHz$", "B": "$300Hz\\sim 3400Hz$", "C": "20MHz~40MHz", "D": "300KHz～3400KHz"}$q$),
(364526, $q${"A": "i", "B": "n=i", "C": "n-i+1", "D": "不确定<br/><br/>:C : C<br/><br/>答案解析:<br/><br/>$$<br/>p 1 = n, p 2 = n - 1, p 3 = n - 2 \\dots<br/>$$<br/><br/>$$<br/>pi = n-i+1<br/>$$"}$q$),
(365463, $q${"A": "SELECT sno，sname FROM student WHERE sname='_t%'；", "B": "SELECT sno，sname FROM student WHERE sname LIKE '_t%'；", "C": "SELECT sno，sname FROM student WHERE $same=\\% t_{-} \\uparrow$", "D": "SELECT sno，sname FROM student WHERE $\\mathrm{same_LICE_\\%t_{-}}$ ；"}$q$),
(365562, $q${"A": "SELECT sno，sname FROM student WHERE sname='_t%'；", "B": "SELECT sno，sname FROM student WHERE sname LIKE '_t%'；", "C": "SELECT sno，sname FROM student WHERE $sname= \\% t_{-}$", "D": "SELECT sno，sname FROM student WHERE sname LIKE '%t_'；"}$q$),
(367690, $q${"A": "64MB", "B": "$128 MB$", "C": "256MB", "D": "512M"}$q$),
(369469, $q${"A": "2000KB/", "B": "$4000KB / s$", "C": "$6000 ~KB / s$", "D": "8000 KB/s"}$q$),
(369684, $q${"A": "$= C2 + 5$", "B": "+B1+5", "C": "=SUM(A1:B2)", "D": "COUNT (A1, B2)"}$q$),
(369970, $q${"A": "34H", "B": "54H", "C": "$64 H$", "D": "$24 H$"}$q$),
(370385, $q${"A": "$7445 \\times 128 ~B$", "B": "$7445 \\times 1024 ~B$", "C": "$6763 \\times 128 ~B$", "D": "$6763 \\times 256B$"}$q$)
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
  IF n <> 25 THEN RAISE EXCEPTION '第 4 批更新数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_latex b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
