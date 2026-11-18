-- P2 第 23 批（25 道；html=24 colon=0 prefix=1）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(366270, $q${"A": "select deptno,avg(sal) a from emp where sal >2000 group by deptno;", "B": "select deptno,avg(sal) a from emp having a>2000 group by deptno;", "C": "select deptno,avg(sal) a from emp group by deptno where a>2000;", "D": "select deptno,avg(sal) from emp group by deptno having avg(sal)>2000;"}$q$, NULL, NULL),(366278, $q${"A": "delete from tb_001 value id='2'；", "B": "delete into tb_001 where id='2'；", "C": "delete from tb_001 where id='2'；", "D": "update from tb_001 where id='2'；"}$q$, NULL, NULL),(366293, $q${"A": "SELECT C_ID,SUM(OrderAmount) FROM Orders GROUP BY C_ID HAVING SUM(OrderAmount)>3000", "B": "SELECT C_ID,SUM(OrderAmount) FROM Orders WHERE SUM (OrderAmount)>3000 GROUP BY C_ID", "C": "SELECT C_ID,SUM(OrderAmount) FROM Orders WHERE SUM (OrderAmount)>3000", "D": "SELECT C_ID,SUM(OrderAmount) FROM Orders GROUP BY C_ID WHERE SUM(OrderAmount)>3000"}$q$, NULL, NULL),(366400, $q${"A": "搜索框输入“Windows 功能”之后，左键单击\"启用或关闭 Windows 功能\"", "B": "右键右单击“开始菜单”后选择“应用和功能”，之后右则选择“程序和功能”，之后选择“启用或关闭 Windows 功能”", "C": "右键单击“开始菜单”后选择“设置”，之后查找设置框输入“Windows 功能”，之后在查找结果中选择“启用或关闭 Windows 功能”", "D": "左键单击“开始菜单”选择“启用或关闭 Windows 功能”"}$q$, NULL, NULL),(366780, $q${"A": "选择\"本地用户和组”，右侧右击要删除的帐户选择\"删除\"", "B": "选择\"本地用户和组”，右侧右击要删除的帐户选择\"删除数据和帐户\"", "C": "选择\"本地用户和组\"，右侧右击要删除的帐户选择\"删除帐户\"", "D": "选择\"本地用户和组\"，右侧右击要删除的帐户选择\"清除帐户\""}$q$, NULL, NULL),(366799, $q${"A": "SELECT price FROI bookWHERE book name='计算机*'", "B": "SELECT price FROI book WHERE book_name LIKE \\计算机*\\", "C": "SELECT price FROI book WHERE book_name LIKE 计算机%", "D": "SELEcT price FROI book wHERE book nane LIkE '计算机'"}$q$, NULL, NULL),(366929, $q${"A": "ADD INTO S VALUES（'张祺'，'化学'，'80'）", "B": "INSERT INTO S VALUES（'张祺'，'化学'，'80'）", "C": "ADD INTO S VALUES（'张祺，'化学'，80）", "D": "INSERT INTO S VALUES（'张祺'，'化学'，80）"}$q$, NULL, NULL),(366957, $q${"A": "ALTER TABLE tb_emp ADD COLUMN birth YEAR(4).", "B": "ALTER TABLE tb_emp ALTER COLUMN age'birth YEAR(4);", "C": "ALTER TABLE tb_emp CHANGE COLUMN age birth YEAR(4);", "D": "ALTER TABLE tb_emp MODIFY COLUMN age birth YEAR(4)"}$q$, NULL, NULL),(367031, $q${"A": "USB 接口有两种规格，2.0 版的数据传输速度要比 1.1 版快得多。", "B": "利用\"USB 集线器”，一个 USB 接口能连接多个设备。", "C": "USB 属于一种串行接口。", "D": "主机不能通过 USB 连接器引脚向外设供电。"}$q$, NULL, NULL),(367156, $q${"A": "将 CPU 时间划分成许多小片，轮流为多个程序服务，这些小片称为\"时间片\"", "B": "由于 CPU 是计算机系统中最宝贵的硬件资源，为了提高 CPU 的利用率，一般采用多任 务处理", "C": "正在 CPU 中运行的程序称为前台任务，处于等待状态的任务称为后台任务", "D": "在单 CPU 环境下，多个程序在计算机中同时运行时，意味着它们宏观上同时运行，微观上由 CPU 轮流执行"}$q$, NULL, NULL),(367213, $q${"A": "2.0 版的 USB 接口数据传输速度要比 1.1 版快得多", "B": "利用\"USB 集线器\"，一个 USB 接口能连接多个设备", "C": "USB 属于一种串行接口", "D": "主机不能通过 USB 连接器引脚向外设供电"}$q$, NULL, NULL),(367287, $q${"A": "使用鼠标单击任务栏上的语言指示器", "B": "按<Ctrl>+<Space>键", "C": "使用鼠标双击\"控制面板\"窗口中的输入法图标", "D": "按<Ctrl>+<Shift>(或<Alt>+<Shift>)"}$q$, NULL, NULL),(367288, $q${"A": "用鼠标左键单击\"开始\"按钮，在系统菜单中单击\"运行\"命令项", "B": "用鼠标左键单击\"开始\"按钮，在系统菜单中单击\"查找\"命令项", "C": "利用\"资源管理器\"中的相关命令", "D": "用鼠标右键单击\"我的电脑\"图标，在快捷菜单中单击“查找”命令项"}$q$, NULL, NULL),(367290, $q${"A": "用鼠标右键单击\"任务栏\"空白处，然后在弹出的快捷菜单中选取要排列的方式", "B": "先打开\"资源管理器\"窗口，选择其中的\"查看\"菜单下的\"排列图标\"项", "C": "先打开\"我的电脑\"窗口，选择其中的\"查看\"菜单下的\"排列图标\"项", "D": "用鼠标右键单击桌面空白处，然后在弹出的快捷菜单中选取要排列的方式"}$q$, NULL, NULL),(367348, $q${"A": "select * from 表名 where 姓名 = '张'", "B": "select * from 表名 where 姓名 like '张%'", "C": "select * from 表名 where 姓名 = '%张%'", "D": "select * from 表名 where 姓名 like '张'"}$q$, NULL, NULL),(367349, $q${"A": "select * from emp where hiredate>='19820101';", "B": "select * from emp where hiredate>=to_char('19820101','YYYYMMDD');", "C": "select * from emp where to_date(hiredate:\"YYYYMMDD\")>='19820101';", "D": "select * from emp where to char(hiredate,'YYYYMMDD') >= '19820101';"}$q$, NULL, NULL),(367350, $q${"A": "select * from emp where ename in 'S%';", "B": "select * from emp where ename='S%';", "C": "select * from emp where ename like 'S%';", "D": "select * from emp where ename like 'S_;"}$q$, NULL, NULL),(367352, $q${"A": "SELECT * FROM EMP WHERE COMM=\";", "B": "SELECT * FROM EMP WHERE COMM=NULL;", "C": "SELECT * FROM EMP WHERE NVL(COMM)=0;", "D": "SELECT * FROM EMP WHERE COMM IS NULL;"}$q$, NULL, NULL),(367425, NULL, NULL, $q$演示文稿只能用于放映幻灯片，无法输出到打印机中。$q$),(367450, $q${"A": "SELECT rank, AVG(salary) FROM people GROUP BY rank HAVING AVG(salary) > 1000", "B": "SELECT rank, AVG(salary) FROM people HAVING AVG(salary) > 1000 GROUP BY rank;", "C": "SELECT AVG(salary) FROM people GROUP BY rank HAVING AVG(salary) > 1000;", "D": "SELECT rank, AVG(salary) FROM people GROUP BY rank WHERE AVG(salary) > 1000;"}$q$, NULL, NULL),(367456, $q${"A": "CREATE VIEW V1<br/><br/>AS<br/>SELECT sno,sname FROM student;", "C": "CREATE VIEW V3(major,scount)<br/><br/>AS<br/><br/>SELECT smajor,COUNT(*) FROM student GROUP BY smajor;", "B": "CREATE VIEW V2(major)<br/><br/>AS<br/>SELECT DISTINCT(smajor) FROM student;", "D": "CREATE VIEW V4(sname,sage)<br/><br/>AS<br/>SELECT sname,age+5 FROM student where sno='101';"}$q$, NULL, NULL),(367463, $q${"A": "select 性别,AVG(工资) as \"平均工资\" from 工资表 where 性别=\"男\" OR 性别=\"女\"", "B": "select 性别,AVG(工资) as \"平均工资\" from 工资表 sort by 性别", "C": "select 性别,AVG(工资) as \"平均工资\" from 工资表 having by 性别", "D": "select 性别,AVG(工资) as \"平均工资\" from 工资表 group by 性别"}$q$, NULL, NULL),(367494, $q${"A": "2.0 版的 USB 接口数据传输速度要比 1.1 版快得多", "B": "利用\"USB 集线器”，一个 USB 接口能连接多个设备", "C": "USB 属于一种串行接口", "D": "主机不能通过 USB 连接器引脚向外设供电"}$q$, NULL, NULL),(367583, $q${"A": "单击鼠标右键", "B": "双击鼠标左键", "C": "鼠标的拖曵", "D": "<Ctrl>+<Shift>+组合键"}$q$, NULL, NULL),(367587, $q${"A": "<ALT>", "B": "<ESC>", "C": "<CTRL>", "D": "<ENTER>"}$q$, NULL, NULL)
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
  IF n <> 24 THEN RAISE EXCEPTION '第 23 批 HTML 更新数应为 24，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 23 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 1 THEN RAISE EXCEPTION '第 23 批前缀修复数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 23 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 23 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
