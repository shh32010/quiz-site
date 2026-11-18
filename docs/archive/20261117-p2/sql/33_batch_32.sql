-- P2 第 32 批（25 道；html=23 colon=2 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(378502, $q${"A": "3/6", "B": "\"3/6\"", "C": "=\"3/6\"", "D": "=3/6"}$q$, NULL, NULL),(378503, $q${"A": "=\"160/20\"", "B": "=160/20", "C": "160/20", "D": "\"160/20\""}$q$, NULL, NULL),(378504, $q${"A": "分数 1/9 的值", "B": "0.111111", "C": "字符串\"=1/9\"", "D": "字符串\"B3\""}$q$, NULL, NULL),(378505, $q${"A": "\"", "B": "'", "C": "#", "D": "@"}$q$, NULL, NULL),(378506, $q${"A": "\"（双引号）", "B": "'（单引号）", "C": "\"\"（两个双引号）", "D": "''（两个单引号）"}$q$, NULL, NULL),(378507, $q${"A": "选中 B6 单元格使之成为活动单元格，直接输入 00105589", "B": "单击 B6 单元格→在公式编辑区中直接输入 00105589", "C": "单击 B6 单元格→按 CTRL+1（此为数字 1）→弹出\"单元格格式\"对话框→选\"数字\"→选\"分类\"中的\"文本\"→单击\"确定\"→直接输入 00105589", "D": "单击 B6 单元格→按 CTRL+1（此为数字 1）→弹出\"单元格格式\"对话框→选\"数字\"→选\"分类\"中的\"常规\"→单击\"确定\"→直接输入 00105589"}$q$, NULL, NULL),(378564, $q${"A": "直接键入数据至单元格内", "B": "利用\"记录单\"输入数据", "C": "插入对象", "D": "数据透视表"}$q$, NULL, NULL),(378581, $q${"A": "删除单元格后不能撤销，清除后可以撤销", "B": "删除单元格后会改变其他单元格的位置，而清除不会", "C": "清除是只清除单元格中的内容和格式等，而删除将连同单元格本身一起删除", "D": "清除单元格是按<Del>键，删除单元格是选择菜单“编辑→删除”<br/><br/>", "E": "单元格中包含有公式时不能清除，但可以删除"}$q$, NULL, NULL),(378796, $q${"A": "cd @John", "B": "cd #John", "C": "cd &John", "D": "cd ~John"}$q$, NULL, NULL),(379091, $q${"A": "$", "B": "#", "C": "%", "D": ">"}$q$, NULL, NULL),(379132, $q${"A": "kill", "B": "\"Ctrl+c\"组合键", "C": "shutdown", "D": "halt"}$q$, NULL, NULL),(379171, $q${"A": "回收站中的\"还原\"，命令，只能将文件回复到原来的位置", "B": "使用 Delte 键删除硬盘文件时，文件必定放入回收站", "C": "回收站大小是固定的，用户不能更改", "D": "回收站的内容可以复制或移动到硬盘的任意位置"}$q$, NULL, NULL),(379689, $q${"A": "INSERT INTO SC VALUES('200823','101',NULL,NULL);", "B": "INSERT INTO SC VALUES('201009','111',60,必修);", "C": "INSERT INTO SC VALUES(NULL,'103',80,'选修');", "D": "INSERT INTO SC VALUES('201132',NULL,86;);"}$q$, NULL, NULL),(379716, $q${"A": "JOIN", "B": "CROSS JOIN<br/>作者:肖", "D": "LEFT JOIN<br/>LEFT JOIN", "C": "RIGHT JOIN<br/>中执行语句:SELECT 'c'+'d'; 以下正确"}$q$, NULL, NULL),(379752, $q${"A": "select * from property where name = 土, 水,", "B": "select * from property where name like %土, 水%", "C": "select * from property where name in (土, 水);", "D": "select * from property where name limit ('土水');"}$q$, NULL, NULL),(379760, $q${"A": "|", "B": "!", "C": "||", "D": "&&"}$q$, NULL, NULL),(379791, $q${"A": "'2020-10-21'", "B": "'2020-21-10'", "C": "'10-21-2020'", "D": "'21-10-2020'"}$q$, NULL, NULL),(379793, $q${"A": "SELECT 学号, AVG(成绩) AS 平均成绩 FROM Student GROUP BY 课程号 HAVING COUNT(课程号)", "B": "SELECT 学号, AVG(成绩) AS 平均成绩 FROM Student GROUP BY 学号 HAVING COUNT(课程号) > 3", "C": "SELECT 学号, AVG(成绩) AS 平均成绩 FROM Student GROUP BY 课程号 HAVING COUNT(DISTING)", "D": "SELECT 学号, AVG(成绩) AS 平均成绩 FROM STUDENT (DISTINCT). 是无姿 DEPTNO 是部门号; SELECT COUNT(SAL) FROM EMPLOYEES GROUP."}$q$, NULL, NULL),(380064, $q${"A": "商品名称 is null", "B": "商品名称 = null", "C": "商品名称 <> null", "D": "商品名称 is not null"}$q$, NULL, NULL),(380104, $q${"A": "INSERT INTO Employee(Name, Gender, Age, Rank) INTO('张志虎', '男', 33, '0001')", "B": "INSERT INTO Employee values(“张志虎”(男)“0001。)", "C": "INSERT INTO Employee(Name, Gender, Age) values('张志虎'; 男',33,\"0001')", "D": "INSERT INTO Employee(Name,Gender,Age,Rank) values('张志虎', 男', 33 '0001')"}$q$, NULL, NULL),(380136, NULL, $q$q! 不保存退出。$q$, NULL),(380210, $q${"A": "SELECT Sname, Sno FROM Student WHERE Sname JS '智%',", "B": "SELECT Sname, Sno FROM Student WHERE Sname LIKE '_智%';", "C": "SELECT Sname, Sno FROM Student WHERE Sname LIKE '%智_;", "D": "SELECT Sname, Sno FROM Student WHERE-Sname LIKE '_智_;"}$q$, NULL, NULL),(380238, $q${"A": "SELECT SRO , shame FROM student WHERE sname=\"_天%\";", "B": "SELECT Sno, sname FROM student WHERE same LIKE \"_天%\" ;", "C": "SELECT sno, shame FROM student WHERE sname=\"%天\";", "D": "SELECT sno, shame FROM student WHERE sname LIKE \"_天_\" ;"}$q$, NULL, NULL),(380258, NULL, $q$q! 强制退出不保存。$q$, NULL),(380290, $q${"A": "update student age=15 where name=张三'；", "B": "update student age='15' where name=张三'.", "C": "update student set age=15 where name='张'", "D": "update student set name='张三' where age=15;"}$q$, NULL, NULL)
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
  IF n <> 23 THEN RAISE EXCEPTION '第 32 批 HTML 更新数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 2 THEN RAISE EXCEPTION '第 32 批解析去冒号数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 32 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 32 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 32 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
