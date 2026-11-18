-- P2 第 21 批（25 道；html=19 colon=0 prefix=6）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(362630, $q${"A": "Windows-->DBMS-->A", "B": "DBMS-->A-->Windows", "C": "A-->Windows-->DBMS", "D": "Windows-->A-->DBMS"}$q$, NULL, NULL),(362636, $q${"A": "将 CPU 时间划分成许多小片，轮流为多个程序服务，这些小片称为\"时间片\"", "B": "由于 CPU 是计算机系统中最宝贵的硬件资源，为了提高 CPU 的利用率，一般采用多任务处理", "C": "正在 CPU 中运行的程序称为前台任务，处于等待状态的任务称为后台任务", "D": "在单 CPU 环境下，多个程序在计算机中同时运行时，意味着它们宏观上同时运行，微观上由 CPU 轮流执行"}$q$, NULL, NULL),(362787, $q${"A": "简单文本由一连串用于表达正文内容的字符的编码组成，它几乎不包含任何其他的格式信息和结构信息", "B": "为了使文本能以整齐、美观的形式展现给用户，人们还需要对文本进行排版", "C": "Windows 操作系统中的\"帮助\"文件(.hlp 文件)是一种丰富格式文本", "D": "使用微软公司的 Word 软件生成的 DOC 文件，与使用记事本生成的 TXT 文件一样，都属于简单文本文件"}$q$, NULL, NULL),(362861, $q${"A": "维护——> 设计——>  分析——>  实施——>  规划", "B": "维护——>  实施 ——> 设计——>  分析  ——>规划", "C": "规划 ——>分析 ——>设计 ——>实施 ——>维护", "D": "规划 —— >实施——>  设计 ——>分析——>  维护"}$q$, NULL, NULL),(362862, $q${"A": "15", "B": ">15", "C": "<=15", "D": "10"}$q$, NULL, NULL),(362900, $q${"A": "选择该文件后用鼠标单击目的文件夹", "B": "选择该文件后用鼠标拖动该文件到目的文件夹", "C": "按下<Ctrl>键并保持，再用鼠标拖动该文件到目的文件夹", "D": "按下<Alt>键并保持，再用鼠标拖动该文件到目的文件夹"}$q$, NULL, NULL),(363477, $q${"A": "软件测试的目的是发现错误并改正错误", "B": "对被调试的程序进行“错误定位\"是程序调试的必要步骤", "C": "程序调试通常也称为Debug", "D": "软件测试应严格执行测试计划，排除测试的随意性"}$q$, NULL, NULL),(363587, $q${"A": "超文本(Hypertext)技术", "B": "统一资源定位器(Uniform Resource Locators，UR'L)", "C": "超媒体( Hypermedia)技术", "D": "超文本标记语言HTML"}$q$, NULL, NULL),(363621, $q${"A": "F2", "B": "F4 '", "C": "F10", "D": "F11"}$q$, NULL, NULL),(363634, $q${"A": "192. 168.0.0", "B": "255.0.0.0", "C": "192. 168.0.1", "D": "'255. 255. 255.0 ."}$q$, NULL, NULL),(364110, $q${"A": "计算机病毒只传染给可执行文件", "B": "计算机病毒是后缀名为\"exe\"的文件", "C": "计算机病毒只会通过后缀名为\"exe\"的文件传播", "D": "所有的计算机病毒都是人为制造出来的"}$q$, NULL, NULL),(364465, $q${"A": "计算机病毒只传染给可执行文件", "B": "计算机病毒是后缀名为\"exe\"的文件", "C": "计算机病毒只会通过后缀名为\"exe\"的文件传播", "D": "所有的计算机病毒都是人为制造出来的"}$q$, NULL, NULL),(364540, $q${"A": "QU->front==QU->rear", "B": "QU->front!=QU->rear", "C": "QU->front==(QU->rear+1)%MaxSize", "D": "QU->front!=(QU->rear+1)%MaxSize<br/><br/>:A : C<br/><br/>答案解析:"}$q$, NULL, NULL),(364559, $q${"A": "=COUNT(C 1 :C10, “>80”)", "B": "=COUNT(C1:C10, >80)", "C": "=COUNTIF(C1:C10, “>80”)", "D": "=COUNTIF(C1:C10, >80)"}$q$, NULL, NULL),(364599, $q${"A": "默认情况下，按“CTRL 十空格键”组合键可实现在某一种汉字输入法与英文输入法之间的切换", "B": "按\"ALT+PrSc 组合键可以将当前整个屏幕以图像的形式复制到剪贴板", "C": "利用\"剪切\"操作不能删除文件和文件夹", "D": "用户可以设置回收站的大小，且可以为多个逻辑硬盘分别设置回收站"}$q$, NULL, NULL),(364609, $q${"A": "DOS", "B": "Windows", "C": "Linux", "D": "Word<br/><br/>", "E": "Photoshop"}$q$, NULL, NULL),(364683, $q${"A": "$O(n)<O(\\log n)<O(n^{2})<O(1)$", "B": "O(n)<O(logn)<O(1)<O(n^2)", "C": "O(1)<O(logn)<O(1)<O(n^2)", "D": "O(1)<O(logn)<O(n)<O(n^2)"}$q$, NULL, NULL),(365049, $q${"A": ")由于do-while循环中循环体语句只能是一条可执行语句，所以循环体内不能使用复合语句。", "B": ")do-while循环由do开始,用while结束，在while(表达式)后面不能写分号。", "C": ")在do-while循环体中，一定要有能使while后面表达式的值变为零(\"假\")的操作。", "D": ")do-while循环中，根据情况可以省略while。"}$q$, NULL, NULL),(365057, $q${"A": ")for(y=0,x=1;x>++y;x=i++) i=x;", "B": ")for(;;x++=i);", "C": ")while(1){x++;}", "D": ")for(i=10;;i--) sum+=i;"}$q$, NULL, NULL),(365134, NULL, NULL, $q$MySQL数据库管理系统只能在Windows操作系统下运行。$q$),(365135, NULL, NULL, $q$对于字符串型数据，空字符串’’就是NULL，对于数值型数据0就是NULL。$q$),(365136, NULL, NULL, $q$LTRIM、RTRIM、TRIM函数既能去除半角空格，又能去除全角空格。$q$),(365137, NULL, NULL, $q$NULL和Null都代表空值。$q$),(365138, NULL, NULL, $q$关系型数据库管理系统简称为RDBMS。$q$),(365139, NULL, NULL, $q$用union上下连接的各个select都可以带有自己的order by子句。$q$)
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
  IF n <> 19 THEN RAISE EXCEPTION '第 21 批 HTML 更新数应为 19，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 21 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 6 THEN RAISE EXCEPTION '第 21 批前缀修复数应为 6，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 21 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 21 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
