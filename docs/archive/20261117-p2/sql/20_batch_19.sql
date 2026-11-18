-- P2 第 19 批（25 道；html=25 colon=0 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(358225, $q${"A": "双击", "B": "单击", "C": "<SHIFT>+单击", "D": "<ALT>+单击"}$q$, NULL, NULL),(358230, $q${"A": "$6 / 20$", "B": "=6/20", "C": "\"6/20\"", "D": "$= 6 / 20^{\\prime \\prime}$"}$q$, NULL, NULL),(358232, $q${"A": "$\\langle \\mathrm{{ESC}}\\rangle$", "B": "<ALT>", "C": "<SHIFT>", "D": "<CTRL>"}$q$, NULL, NULL),(358233, $q${"A": "<ALT> + <ENTER>", "B": "<ESC>", "C": "<ESC>+<ALTI>", "D": "$$ +A"}$q$, NULL, NULL),(358475, $q${"A": "负数的补码其符号位是\"1\"", "B": "负数的补码是该数绝对值的原码最末位加 1", "C": "负数的补码是该数绝对值的反码最末位加 1", "D": "正数的补码与该数的原码形式相同"}$q$, NULL, NULL),(358777, $q${"A": "需要打印的文件，按\"先来先服务\"的顺序存放在打印队列中", "B": "用户可查看打印队列的工作情况", "C": "用户可暂停正在进行的打印任务", "D": "用户不能取消正在进行的打印任务"}$q$, NULL, NULL),(358797, $q${"A": "一台 PC 机只可能感染一种‚木马‛病毒", "B": "‚木马‛运行时，比较隐蔽，一般不会在任务栏上显示出来", "C": "‚木马‛运行时，会占用系统的 CPU、内存等资源", "D": "\"木马\"运行时，可以截获键盘输入，从而盗取用户的口令、帐号等私密信息"}$q$, NULL, NULL),(358805, $q${"A": "计算机病毒只传染给可执行文件", "B": "计算机病毒是后缀名为\"exe\"的文件", "C": "计算机病毒只会通过后缀名为\"exe\"的文件传播", "D": "所有的计算机病毒都是人为制造出来的"}$q$, NULL, NULL),(358811, $q${"A": "虚拟存储器可以克服内存容量有限不够用的问题", "B": "虚拟存储器对多任务处理提供了有力的支持", "C": "虚拟存储器用于构作软件防火墙，有效抵御黑客的入侵", "D": "虚拟存储器技术的指导思想是\"以时间换取空间\""}$q$, NULL, NULL),(359004, $q${"A": "通过 Windows 的\"网上邻居\"功能，局域网中相同工作组中的计算机可以相互共享软硬件资源", "B": "相同工作组中的计算机可以无条件地访问彼此的所有文件", "C": "即使与因特网没有物理连接，局域网中的计算机也可以进行网上银行支付", "D": "无线局域网对资源共享的限制比有线局域网小得多"}$q$, NULL, NULL),(359029, $q${"A": "方便用户操作", "B": "尽可能防止\"木马\"盗取用户信息", "C": "提高软件的运行速度", "D": "为了查杀‚木马‛病毒"}$q$, NULL, NULL),(359120, $q${"A": "简单文本由一连串用于表达正文内容的字符的编码组成，它几乎不包含任何格式信息和结构信息", "B": "简单文本进行排版处理后以整齐、美观的形式展现给用户，就形成了丰富格式文本", "C": "Windows 操作系统中的\"帮助\"文件(.hlp 文件)是一种丰富格式文本", "D": "使用微软公司的 Word 软件只能生成 DOC 文件，不能生成 TXT 文件"}$q$, NULL, NULL),(359192, $q${"A": "物理数据库指长期存放在外存上的可共享的相关数据的集合", "B": "数据库中存放有\"元数据\"", "C": "数据库系统支持环境不包括操作系统", "D": "用户使用 SQL 实现对数据库的基本操作"}$q$, NULL, NULL),(359212, $q${"A": "SELECT XM，SA FROM STUD FOR SA<20", "B": "SELECT XM，SA FROM STUD WHERE SA<20", "C": "SELECT XM，SA ON STUD FOR SA<20", "D": "SELECT XM，SA ON STUD WHERE SA<20"}$q$, NULL, NULL),(359229, $q${"A": "SELECT XM,SA FROM STUD FOR SA<25;", "B": "SELECT XM,SA FROM STUD WHERE SA<25;", "C": "SELECT XM,SA ON STUD FOR SA<25;", "D": "SELECT XM,SA ON STUD WHERE SA<25;"}$q$, NULL, NULL),(359364, $q${"A": "Windows-->DBMS-->A", "B": "DBMS-->A-->Windows", "C": "A-->Windows-->DBMS", "D": "Windows-->A-->DBMS"}$q$, NULL, NULL),(359641, $q${"A": "$\\text{\" } \\mathbf{a} \\text{\" }$ 比“b”大", "B": "$\\text{\" f \" }$ 比“Q”大", "C": "空格比逗号大", "D": "$\\text{\" } H \\text{\" }$ 比 $\\text{\" } R \\text{\" }$ 大"}$q$, NULL, NULL),(359825, $q${"A": "南京北京. RTF", "B": "XYZ. TXT. DOC", "C": "ABC<华>XYZ", "D": "ABCDEF1234"}$q$, NULL, NULL),(359827, $q${"A": "文件名中允许使用汉字", "B": "文件名中允许使用多个圆点分隔符", "C": "文件名中允许使用空格", "D": "文件名中允许使用竖线（\" | \")"}$q$, NULL, NULL),(359837, $q${"A": "将鼠标光标移到待标记的字块的起始位置并拖动鼠标", "B": "将鼠标光标移到待标记的字块的起始位置按下<Alt>键并拖动鼠标", "C": "将鼠标光标移到工作区最左侧的选择条并拖动鼠标", "D": "按下 Ctrl 键再将鼠标光标移到待标记的字块的任意位置单击鼠标"}$q$, NULL, NULL),(360001, $q${"A": "$p=n+m$", "B": "$p <= n + m$", "C": "$p \\geqslant n + m$", "D": "$p=n*m$"}$q$, NULL, NULL),(360069, $q${"A": "“李”&*", "B": "李*", "C": "李?", "D": "“李”+*"}$q$, NULL, NULL),(360085, $q${"A": "<Ctrl>+<Enter>", "B": "<Enter>", "C": "<Alt>+<Enter>", "D": "<Shift> + <Enter>"}$q$, NULL, NULL),(360226, $q${"A": "$p < (m + n)$", "B": "$p\\leqslant (m + n)$", "C": "$p < (m \\times n)$", "D": "$p \\leqslant (m \\times n)$"}$q$, NULL, NULL),(360229, $q${"A": "SELECT XM, SA FROM STUD FOR SA<20", "B": "SELECT XM, SA FROM STUD WHERE NOT SA>=20", "C": "SELECT XM, SA ON STUD FOR SA<20", "D": "SELECT XM, SA ON STUD WHERE SA<20"}$q$, NULL, NULL)
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
  IF n <> 25 THEN RAISE EXCEPTION '第 19 批 HTML 更新数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 19 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 19 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 19 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 19 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
