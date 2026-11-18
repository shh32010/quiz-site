-- P2 第 20 批（25 道；html=19 colon=4 prefix=2）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(360435, $q${"A": "A一一->DBMS一一->Windows", "B": "DBMS一一>A一一>Windows", "C": "A一一->Windows一一->DBMS", "D": "Windows——>A——>DBMS"}$q$, NULL, NULL),(360499, $q${"A": "<movie>", "B": "<media>", "C": "<video>", "D": "<mp4>"}$q$, NULL, NULL),(360572, $q${"A": "Z>X>Y", "B": "Z>Y>X", "C": "Y>X>Z", "D": "X>Z>Y"}$q$, NULL, NULL),(360672, $q${"A": "cai&jcc.Pc.edu.jp", "B": "wang@hotmail.com", "C": "ccf.edu.cn", "D": "http://www.sina.com"}$q$, NULL, NULL),(360941, NULL, NULL, $q$量化过程实质上是一个有损压缩编码过程，必然带来信息的损失。（）$q$),(361034, NULL, $q$图像的获取过程:①扫描->②分色->③取样->④量化

（1）扫描:将映像画面划分为 M × N 个网格，每个网格称为 一个取样点，称为素像（素像点）

（2）分色:将彩色图像取样点的颜色分解成 RGB 三个基色
（3）取样:测量每个取样点的每个分量（基色）的亮度值
（4）量化:对取样点每个分量的亮度进行 A/D 转换，使用数字整型量表示$q$, NULL),(361035, NULL, $q$①、黑白图像的每个像素只有 1 个分量（即 1 个位平面），且只用 1 个二进位表示，其取值仅“0”(黑)和“1”(白)两种。

②、灰度图像的每个像素也只有 1 个分量（即 1 个位平面），一般用 8～12 个二进位表示，其取值范围是:0～ -1，可表示 个不同的亮度。$q$, NULL),(361150, $q${"A": "SELECT Sname, Sno FROM Student WHERE Sname JS 智%;", "B": "SELECT Sname, Sno FROM Student WHERE Sname LIKE '_智%;'", "C": "SELECT Sname, Sno FROM Student WHERE Sname LIKE '%智_;", "D": "SELECT Sname, Sno FROM Student WHERE Sname LIKE '_智';"}$q$, NULL, NULL),(361558, $q${"A": "<acronym>", "B": "<applet>", "C": "<basefont>", "D": "<big>", "E": "<center>", "F": "<dir>", "G": "<font>", "H": "<frame>"}$q$, NULL, NULL),(361661, $q${"A": "文字\"图表\"", "B": "文件\"Table1.xls\"", "C": "Word 文档\"doc1.doc\"", "D": "Word文档的当前页"}$q$, NULL, NULL),(361674, $q${"A": "发送端的客户机一>发送端的邮件服务器一>接收端的邮件服务器一>接收端的客户机", "B": "发送端的客户机-->发送端的邮件服务器-->接收端的客户机。", "C": "发送端的客户机一>接收端的邮件服务器一>接收端的客户机", "D": "发送端的客户机一>接收端的客户机"}$q$, NULL, NULL),(361742, $q${"A": "SELECT sno, cno FROM sc WHERE grade=NULL", "B": "SELECT sno, cno FROM sc WHERE grade IS “", "C": "SELECT sno, cno FROM sc WHERE grade IS NULL", "D": "SELECT sno, cno FROM sc WHERE grade= '"}$q$, NULL, NULL),(361776, $q${"A": "在文本编辑排版过程中，它能做到\"所见即所得\"", "B": "它可以编辑制作超文本", "C": "在文本编辑排版过程中，操作发生错误后不能\"回退\"(Undo)", "D": "它不但能进行编辑排版操作，而且能自动生成文本的\"摘要\"（尽管质量不高）"}$q$, NULL, NULL),(361779, $q${"A": "\"PrintScreen\"键", "B": "\"Alt+PrintScreen\"键", "C": "Word中的\"屏幕截图\"功能", "D": "专用截屏工具软件"}$q$, NULL, NULL),(361781, $q${"A": "\"用密码进行加密\"的文档，不知道口令就无法打开", "B": "文档一旦设置了加密密码，就无法取消", "C": "可以通过添加数字签名来确保文档的完整性", "D": "可以授予用户不同的访问权限"}$q$, NULL, NULL),(361801, $q${"A": "char a='a';", "B": "char a='\\n';", "C": "char a='aa';", "D": "char a='\\x2d';"}$q$, NULL, NULL),(361833, NULL, NULL, $q$只能将表中的一个列定义为主键，不能将多个列定义为复合的主键。$q$),(361903, $q${"A": "=SUM(\"1\", 1, \"1900-1-2\", TRUE)", "B": "=IF(1>3,5,10)", "C": "=AVERAGE (10, 2)", "D": "=COUNT(A)*5"}$q$, NULL, NULL),(361948, NULL, $q$防火墙是一种维护网络安全的软件或硬件设备，位于它维护的子网（内网）和它所连接的网络（外网）之间，能防止来自外网的攻击。$q$, NULL),(361957, $q${"A": "![](预测3.images/f90b937daa839e09.jpg) <details> <summary>natural_image</summary> Dark, grainy image with indistinct shapes and no visible text or symbols </details>", "B": "![](预测3.images/26b70502e401b76f.jpg)", "C": "![](预测3.images/4690e3c5c6417fce.jpg) <details> <summary>natural_image</summary> Pure electrical circuit lines without any symbols </details>", "D": "![](预测3.images/5cf721e55bc1131e.jpg)"}$q$, NULL, NULL),(361960, NULL, $q$防火墙是一种维护网络安全的软件或硬件设备，位于它维护的子网（内网）和它所连接的网络（外网）之间，能防止来自外网的攻击。$q$, NULL),(362008, $q${"A": "Windows-->DBMS-->A", "B": "DBMS-->A-->Windows", "C": "A-->Windows-->DBMS", "D": "Windows-->A-->DBMS"}$q$, NULL, NULL),(362172, $q${"A": "将 CPU 时间划分成许多小片，轮流为多个程序服务，这些小片称为\"时间片\"", "B": "由于 CPU 是计算机系统中最宝贵的硬件资源，为了提高 CPU 的利用率，一般采用多任务处理", "C": "正在 CPU 中运行的程序称为前台任务，处于等待状态的任务称为后台任务", "D": "在单 CPU 环境下，多个程序在计算机中同时运行时，意味着它们宏观上同时运行，微观上由 CPU 轮流执行"}$q$, NULL, NULL),(362428, $q${"A": "移动台是移动的通信终端，它是收发无线信号的设备，如:手机、无绳电话等", "B": "移动台就是移动电话交换中心", "C": "移动台就是基站，它们相互分割又彼此有所交叠，形成\"蜂窝式移动通信\"", "D": "在移动通信系统中，移动台之间是直接进行通信的"}$q$, NULL, NULL),(362616, $q${"A": "文字\"图表\"", "B": "文件\"Book1\"", "C": "Word 文档\"doc1\"", "D": "Word 文档当前页"}$q$, NULL, NULL)
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
  IF n <> 19 THEN RAISE EXCEPTION '第 20 批 HTML 更新数应为 19，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 4 THEN RAISE EXCEPTION '第 20 批解析去冒号数应为 4，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 2 THEN RAISE EXCEPTION '第 20 批前缀修复数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 20 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 20 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
