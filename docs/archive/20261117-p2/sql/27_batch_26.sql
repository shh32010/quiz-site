-- P2 第 26 批（25 道；html=2 colon=0 prefix=23）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(373352, $q${"A": "SELECT productid FROM orders WHERE COUNT(productid)>1", "B": "SELECT productid FROM orders WHERE MAX(productid)>1", "C": "SELECT productid FROM orders WHERE HAVING COUNT(productid)>1 GROUP BY productid", "D": "SEICT productid FROM orders GROUP BY productid HAVING<br/>COUNT(productid)>1"}$q$, NULL, NULL),(373382, $q${"A": "学号 LIKE '2004%'", "B": "学号 = '2004%'", "C": "学号 LIKE '2004*'", "D": "学号 = '2004*'"}$q$, NULL, NULL),(373449, NULL, NULL, $q$当一个表中所有行都被delete语句删除后，该表也同时被删除了。$q$),(373499, NULL, NULL, $q$主键被强制定义成NOT NULL和UNIQUE。$q$),(373500, NULL, NULL, $q$select语句的过滤条件既可以放在where子句中，也可以放在from子句中。$q$),(373501, NULL, NULL, $q$逻辑值的“真”和“假”可以用逻辑常量TRUE和FALSE表示。$q$),(373502, NULL, NULL, $q$如果在排序和分组的对象上建立了索引，可以极大地提高速度。$q$),(373503, NULL, NULL, $q$建立索引的目的在于加快查询速度以及约束输入的数据。$q$),(373504, NULL, NULL, $q$UPDATE语句可以有WHERE子句和LIMIT子句。$q$),(373506, NULL, NULL, $q$所创建的数据库和表的名字，都可以使用中文。$q$),(373507, NULL, NULL, $q$SELECT语句的ORDER BY子句定义的排序表达式所参照的列甚至可以不出现在

输出列表中。$q$),(373508, NULL, NULL, $q$在C/S模式中，客户端不能和服务器端安装在同一台机器上。$q$),(373509, NULL, NULL, $q$UPDATE语句修改的是表中数据行中的数据，也可以修改表的结构。$q$),(373510, NULL, NULL, $q$create table 语句中有定义主键的选项。$q$),(373511, NULL, NULL, $q$结构化查询语言只涉及查询数据的语句，并不包括修改和删除数据的语句。$q$),(373512, NULL, NULL, $q$一句delete语句能删除多行。$q$),(373513, NULL, NULL, $q$字符串“2008-8-15”和整数都可以代表2008年8月15日。$q$),(373514, NULL, NULL, $q$INSERT语句所插入的数据行数据可以来自另外一个SELECT语句的结果集。$q$),(373515, NULL, NULL, $q$所有TIMESTAMP列在插入NULL值时，自动填充为当前日期和时间。$q$),(373516, NULL, NULL, $q$带有GROUP BY子句的SELECT语句，结果集中每一个组只用一行数据来表示。$q$),(373517, NULL, NULL, $q$UNION中ALL关键字的作用是在结果集中所有行全部列出，不管是否有重复行。$q$),(373518, NULL, NULL, $q$为了让MySQL较好地支持中文，在安装MySQL时，应该将数据库服务器的缺省

字符集设定为gb2312。$q$),(373521, NULL, NULL, $q$PowerPoint 中，创建表格的过程中插入操作错误，可以点击工具栏上的“撤销”按钮来撤销。$q$),(373522, NULL, NULL, $q$PowerPoint 中，普通视图的左窗口显示的是文稿的大纲。$q$),(373570, NULL, NULL, $q$字符串“2008-8-15”和整数20080815都可以代表2008年8月15日。$q$)
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
  IF n <> 2 THEN RAISE EXCEPTION '第 26 批 HTML 更新数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 26 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 23 THEN RAISE EXCEPTION '第 26 批前缀修复数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 26 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 26 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
