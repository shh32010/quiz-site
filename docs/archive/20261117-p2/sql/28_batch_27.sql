-- P2 第 27 批（25 道；html=25 colon=0 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(373711, $q${"A": "select * from orders where ordername is not null;", "B": "select * from orders where ordername<>null;", "C": "select * from orders where ordername is null;", "D": "select * from orders where ordername not is null;"}$q$, NULL, NULL),(373714, $q${"A": "!=", "B": "<>", "C": "==", "D": ">="}$q$, NULL, NULL),(373748, $q${"A": "select (name) from table person: 所有记录的name字段的值", "B": "select (name) from person where age=12 or name=\"aa\"; or 或者", "C": "select (name) from table person where age=12; 查找age=12的记录的那个<br/><br/>字段的值", "D": "select (name，age) from person where age=12 and name=\"aa\"; and 并且"}$q$, NULL, NULL),(373765, $q${"A": "db1/student", "B": "db1.student", "C": "db1_student", "D": "db1&student"}$q$, NULL, NULL),(373771, $q${"A": "&&", "B": "||", "C": "NOT", "D": "AND"}$q$, NULL, NULL),(373828, $q${"A": "SELECT 学号,COUNT(*) FROM 成绩 WHERE 分数 > 90 GROUP BY 学号 HAVING COUNT(*) > 3;", "B": "SELECT 学号,COUNT(学号) FROM 成绩 WHERE 分数 > 90 AND COUNT(学号 ) >3;", "C": "SELECT 学号,COUNT(*) FROM 成绩 GROUP BY 学号 HAVING COUNT(*) > 3 AND 分数 > 90;", "D": "SELECT 学号,OUNT(*) FROM 成绩 WHERE 分数 > 90 AND COUNT(*) > 3 GROUP BY 学号;"}$q$, NULL, NULL),(373831, $q${"A": "update student age=15 where name=$张三$。", "B": "update student age='15' where name: 张三", "C": "update student set age=15 where name=张三", "D": "update student set name='张三' where age=15;<br/><br/>c<br/>double fun(int x, y);<br/>double fun(int x, int y)"}$q$, NULL, NULL),(373880, $q${"A": "SELECT pid FROM tb_order WHERE count(pid)>3；", "B": "SELECT pid FROM tb_order WHERE max(pid)>=3；", "C": "SELECT pid FROM tb_order GROUP BY pid HAVING COUNT(pid)>3；", "D": "SELECT pid FROM tb_order GROUP BY pid HAVING COUNT( id)>=3； (pid)>="}$q$, NULL, NULL),(373884, $q${"A": "|", "B": "!", "C": "||", "D": "&&"}$q$, NULL, NULL),(373887, $q${"A": "IN", "B": "LIKE", "C": "=", "D": ">"}$q$, NULL, NULL),(373892, $q${"A": "SELECT 学号，COUNT(*) FROM 成绩 WHERE 分数>90 GROUP BY 学号 HAVING COUNT(*)>3；", "B": "SELECT 学号，COUNT(学号) FROM 成绩 WHERE 分数>90 AND COUNT(学号)>3；", "C": "SELECT 学号，COUNT(*) FROM 成绩 GROUP BY 学号 HAVING COUNT(*)>3 AND 分数>90；", "D": "SELECT 学号，COUNT(*) FROM 成绩 WHERE 分数>90 AND COUNT(*)>3 GROUP BY 学号；"}$q$, NULL, NULL),(373896, $q${"A": "SELECT 学号， AVG(成绩) AS 平均成绩 FROM student GROUP BY 学号 HAVING COUNT(课程号)>3；", "B": "SELECT 学号， AVG(成绩) AS 平均成绩 FROM student GROUP BY 课程号 HAVING COUNT(课程号)>3；", "C": "SELECT 学号， AVG(成绩) AS 平均成绩 FROM student GROUP BY 学号 HAVING COUNT(课程号)>4；", "D": "SELECT 学号， AVG(成绩) AS 平均成绩 FROM student GROUP BY 课程号 HAVING COUNT(DISTINCT 学号)>3；"}$q$, NULL, NULL),(373908, $q${"A": "IN", "B": "LIKE", "C": "=", "D": "><br/><br/>subquery 0 return s more then I now<br/><br/>Spleat name from redder whee id =(selc iol fomrert Yecoa NOLL/1个"}$q$, NULL, NULL),(373977, $q${"A": "SHOW ENGINES；和SHOW VARIABLES LIKE \"have%\"；", "B": "SHOW VARIABLES；和SHOW VARIABLES LIKE \"have%\"；", "C": "SHOW ENGINES；和SHOW ENGINES LIKE \"have%\"；", "D": "SHOW ENGINES；和SHOW VARIABLES from \"have%\"；"}$q$, NULL, NULL),(374037, $q${"A": "delete from emp where name='dony';", "B": "Delete * from emp where name='dony';", "C": "Drop from emp where name='dony';", "D": "Drop * from emp where name='dony';"}$q$, NULL, NULL),(374073, $q${"A": "SELECT MAX(成绩) FROM A GROUP BY学科 HAVING MAX(成绩)>80;", "B": "SELECT学科 FROM A GROUP BY学科 HAVING成绩>80;", "C": "SELECT学科 FROM A GROUP BY学科 HAVING MAX(成绩)>80;", "D": "SELECT学科 FROM A GROUP BY学科 WHERE MAX(成绩)>80;"}$q$, NULL, NULL),(374084, $q${"A": "从 S 表中删除成绩小于 90 的行。", "B": "生成一张院系代号为“02”的且成绩在 90 分以上的含有“学生名”，“成绩”的成绩情况表。", "C": "在 D 表中先插入行(“05”，“外文院”)，然后再将行(“10003\"，“李宁”，05，90)插入到表 S 中。", "D": "将表 S 中学号为\"20001\"的学生成绩更改为 120。"}$q$, NULL, NULL),(374085, $q${"A": "从 S 表中删除成绩小于 90 的行。", "B": "生成一张各院系学生人数及平均成绩的统计表。", "C": "将行(\"20001\"，“张 霞”，02，99)插入到表 S 中。", "D": "将表 S 中学号为\"10001\"的学生成绩更改为 92。"}$q$, NULL, NULL),(374102, $q${"A": "依次查看各记录“工资”字段的值", "B": "按 Ctrl+A 组合键，在弹出的对话框的“工资”栏输入:工资>1280，再单击“确定”按钮", "C": "在记录单对话框中连续单击“下一条”按钮", "D": "在记录单对话框中单击“条件”按钮，在“工资”栏输入:工资>1280，再单击“确定”按钮"}$q$, NULL, NULL),(374313, $q${"A": "SELECT MAX(成绩) FROM A GROUP BY 学科 HAVING MAX(成绩)>80;", "B": "SELECT 学科 FROM A GROUP BY 学科 HAVING 成绩>80;", "C": "SELECT 学科 FROM A GROUP BY 学科 HAVING MAX(成绩)>80;", "D": "SELECT 学科 FROM A GROUP BY 学科 WHERE MAX(成绩)>80;"}$q$, NULL, NULL),(374342, $q${"A": "CREATE VIEW AS SELECT * FROM STUDY", "B": "CREATE VIEW view_s AS SELECT * FROM STU WHERE 性别='男'", "C": "CREATE view_s SELECT * FROM STU WHERE 性别='男'", "D": "CREATE view_s AS SELECT * FROM STU"}$q$, NULL, NULL),(374358, $q${"A": "NOT", "B": "NULL", "C": "NOT NULL", "D": "\"\""}$q$, NULL, NULL),(374359, $q${"A": "UPDATE S Age", "B": "DELETE Age from S", "C": "ALTER TABLE S DELETE 'Age'", "D": "ALTER TABLE S DROP Age"}$q$, NULL, NULL),(374363, $q${"A": "SELECT studentName, sex, birthday FROM tb_student WHERE birthday >= '2000-01-01' AND birthday <= '2000-12-31';", "B": "SELECT studentName, sex, birthday FROM tb_student WHERE birthday IN ('2000-01-01', '2000-12-31');", "C": "SELECT studentName, sex, birthday FROM tb_student WHERE birthday BETWEEN 2000-01-01 AND 2000-12-31;", "D": "SELECT studentName, sex, birthday FROM tb_student WHERE birthday > '2000-01-01'"}$q$, NULL, NULL),(374368, $q${"A": "SELECT COUNT(cid), cid FROM orders", "B": "SEICT COUNT(cid), cid FROM orders HAVING COUNT(cid)>0", "C": "SELECT COUNT(cid), cid FROM orders ORDER BY cid", "D": "SEICT COUNT(cid), cid FROM orders GROUP BY cid"}$q$, NULL, NULL)
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
  IF n <> 25 THEN RAISE EXCEPTION '第 27 批 HTML 更新数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 27 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 27 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 27 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 27 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
