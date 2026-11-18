-- P2 第 24 批（25 道；html=23 colon=0 prefix=2）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(367607, $q${"A": "数据进入了拉圾箱，仍可恢复", "B": "数据保存在内存中，只是没有显示", "C": "数据全部被删除，但是能用\"撤消\"来恢复", "D": "数据全部被删除，且不能用\"撤消\"来恢复"}$q$, NULL, NULL),(367613, $q${"A": "单击 A6 单元格使之成为活动单元格，再利用\"→←\"键将光标移到\"去\"字的前方，输入\"再\"字", "B": "单击 A6 单元格使之成为活动单元格，再回车键修改状态，用\"→←\"键将光标移到\"去\"字的前方，输入\"再\"", "C": "单击 A6 单元格使之成为活动单元格，再单击公式编辑区，在公式编辑区中用\"→←\"键将光标移到\"去\"字的前方，再按 Delete 键", "D": "将形状为实心\"十\"的鼠标指针移到 A6 单元格的\"去\"字后面，按下鼠标的左键，再按 Delete 键"}$q$, NULL, NULL),(367628, $q${"A": "delete from emp where name='dony';", "B": "Delete * from emp where name='dony';", "C": "Drop from emp where name='dony';", "D": "Drop * from emp where name='dony';"}$q$, NULL, NULL),(367657, $q${"A": "SELECT Sanme FROM Student WHERE Sname LIKE '上官%';", "B": "SELECT Sanme FROM Student WHERE Sname LIKE '上官__';", "C": "SELECT Sanme FROM Student WHERE Sname LIKE '上官%';", "D": "SELECT Sanme FROM Student WHERE Sname LIKE '上官_%',"}$q$, NULL, NULL),(367662, $q${"A": "SELECT email FROM student WHERE email !=NULL", "B": "SELECT email FROM student WHERE email <> NULL", "C": "SELECT email FROM student WHERE email NOT IS NULL", "D": "SELECT email FROM student WHERE email IS NOT NULL"}$q$, NULL, NULL),(367672, $q${"A": "SElECT * FROM ORDER WHERE ORDER_price BETWEEN 1000 AND 5000 ORDER BY ORDER_price ASC", "B": "SElECT * FROM ORDER WHERE ORDER_price BETWEEN 1000 AND 5000 ORDER BY ORDER_price DESC", "C": "SElECT * FROM ORDER WHERE 1000<ORDER_price<5000 ORDER BY ORDER_price ASC", "D": "SElECT * FROM ORDER WHERE 1000<ORDER_price<5000 ORDER BY ORDER_price DESC :A : A 答案解析: 订单金额(order_price)在1000和5000之间，可以使用 ORDER_price BETWEEN 1000 AND 5000 或 $$ \\text {ORDER_price} > = 1 0 0 0 \\text {AND ORDER_pri"}$q$, NULL, NULL),(367691, $q${"A": "SELECT MAX(成绩)FROM A GROUP BY 学科 HAVING MAX(成绩)>80;", "B": "SELECT MAX(成绩) FROM A GROUP BY 学科 HAVING 成绩>80;", "C": "SELECT 学科 FROM A GROUP BY 学科 HAVING MAX(成绩)>80;", "D": "SELECT 学科 FROM A GROUP BY 学科 WHERE MAX(成绩)>80;"}$q$, NULL, NULL),(367778, $q${"A": "简单文本由一连串用于表达正文内容的字符的编码组成，它几乎不包含任何其他的格式信息和结构信息", "B": "为了使文本能以整齐、美观的形式展现给用户，人们还需要对文本进行排版", "C": "Windows 操作系统中的\"帮助\"文件(.hlp 文件)是一种丰富格式文本", "D": "使用微软公司的 Word 软件生成的DOC 文件，与使用记事本生成的 TXT 文件一样，都属于简单文本文件"}$q$, NULL, NULL),(367896, $q${"A": "kill", "B": "\"Ctrl+c\"组合键", "C": "shutdown", "D": "halt"}$q$, NULL, NULL),(367938, NULL, NULL, $q$幻灯片打包时可以连同播放软件一起打包。$q$),(368046, $q${"A": "insert 学生 into (学号,姓名,性别) values (10021,\"王平\",\"男\")", "B": "insert 学生 (学号,姓名,性别) values (10021,\"王平\",\"男\")", "C": "insert into 学生 (学号,姓名,性别) values (10021, 王平,男)", "D": "insert into学生(学号,姓名,性别) values (10021,\"王平\",\"男\")"}$q$, NULL, NULL),(368070, $q${"A": "A->SQLSERVER->Unix", "B": "SQLSERVER->Unix->A", "C": "Unix->A—>SQLSERVER", "D": "A—>Unix->SQLSERVER"}$q$, NULL, NULL),(368203, $q${"A": "五号>四号，13 磅>12 磅", "B": "五号<四号，13 磅<12 磅", "C": "五号<四号，13 磅>12 磅", "D": "五号>四号，13 磅<12 磅"}$q$, NULL, NULL),(368211, $q${"A": "双击 Excel 控制菜单图标", "B": "单击“文件”菜单下的“退出”命令", "C": "使用最小化按钮", "D": "单击“文件”菜单下的“关闭”或“关闭文件”命令", "E": "同时按 Alt 和 F4", "F": "单击标题栏右上角的\"关闭\"按钮"}$q$, NULL, NULL),(368280, $q${"A": "find ‘*’ file", "B": "wc -l ‘*’ <FILE", "C": "grep -n ‘*’ file", "D": "grep ‘*’ file"}$q$, NULL, NULL),(368674, $q${"A": "信息插座连接到无线路由器的 WAN 口,台式电脑连接到无线路由器的 LAN 口", "B": "设置上网方式为\"静态IP\",输入IP地址、子网掩码、网关以及首选DNS", "C": "设置路由器的无线网络名称为 SSID 为\"office01\",无线网络连接密码\"abc123\",单击\"完成\"按钮", "D": "将电脑设置为静态 IP 地址,打开浏览器,输入 tplogin.cn 按 Enter 键,输入账号和密码,进入路由器设置界面"}$q$, NULL, NULL),(368862, $q${"A": "ARP", "B": "ICMPv4", "C": "家庭和其他用户", "D": "账户信息<br/><br/><br/><br/>协议类型(0): 任何<br/>协议号(0):<br/>本地接口(L): 新有端口<br/>远程接口(U): 新有端口<br/>示例: 80.443.9000-9010<br/>示例: 80.443.9000-9010<br/>Internet 控制系统协议(ODP)设置:<br/> 下一步(N)> 取消"}$q$, NULL, NULL),(369134, $q${"A": "RIP 第 2 版支持 VLSM。", "B": "RIP 第 2 版支持 16 台以上的路由器。", "C": "RIP 第 2 版支持有类（而不是无类）路由", "D": "RIP 第 2 版不支持路由更新验证 ![](操作技能--计算机类.images/84385d3c665519c2.jpg) <details> <summary>flowchart</summary> ```mermaid graph LR   subgraph Switch1[\"Switch 1: SW1\"]   A[\"A\"] -->|\"中继\"| B[\"B\"]   C[\"C\"] -->|\"中继\"| D[\"D\"]   E[\"E\"] -"}$q$, NULL, NULL),(369218, $q${"A": "集线器工作于物理层，以广播的形式进行数据转发<br/>-", "B": "连接到集线器的结点发送数据时采用CSMA/CD算法", "C": "通过在网络链路中串接一个集线器可以监听该链路中的数据包", "D": "连接到一个集线器的所有结点独占一个冲突域<br/><br/>我的答案:D 正确答案:D"}$q$, NULL, NULL),(369222, $q${"A": "网络位置感知服务<br/>•", "B": "网络位置共享服务<br/>•", "C": "网络切换服务", "D": "网络发现<br/><br/>我的答案:D 正确答案:A"}$q$, NULL, NULL),(369279, $q${"A": "打开【控制面板】窗口，将【查看方式】设置为【大图标】或【小图标】，然后单击【Internet选项】链接。", "B": "打开【控制面板】窗口，将【查看方式】设置为【大图标】或【小图标】，然后单击【网络和共享中心】链接，然后单击【Internet选项】链接", "C": "系统搜索框输入\"Internet 选项\", 然后单击【Internet 选项】链接。", "D": "右击【开始】菜单，选择【Internet 选项】链接。"}$q$, NULL, NULL),(369532, NULL, NULL, $q$PowerPoint 规定，对于任何一张幻灯片，都要在“动画效果列表”中选择一种动画方式，否则系统将提示错误信息。$q$),(369660, $q${"A": "单击常用工具栏上的\"字体颜色\"调色板", "B": "单击常用工具栏上的\"填充色\"调色板", "C": "选定该单元格，单击常用工具栏上的\"字体颜色\"调色板", "D": "选定该单元格，单击常用工具栏上的\"填充色\"调色板"}$q$, NULL, NULL),(369680, $q${"A": "AA.DOC.TXT", "B": "BB>XX. RTF", "C": "Could This Be Love", "D": "背影_朱自清. DOC"}$q$, NULL, NULL),(369688, $q${"A": "=IF(B2≥60, \"及格\", \"不及格\")", "B": "=IF(B2>=60, 及格，不及格)", "C": "=IF(B2<60,不及格，及格)", "D": "=IF(B2<60, \"不及格\", \"及格\")"}$q$, NULL, NULL)
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
  IF n <> 23 THEN RAISE EXCEPTION '第 24 批 HTML 更新数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 24 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 2 THEN RAISE EXCEPTION '第 24 批前缀修复数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 24 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 24 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
