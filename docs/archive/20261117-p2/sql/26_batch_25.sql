-- P2 第 25 批（25 道；html=22 colon=3 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(369719, $q${"A": "选择\"图形登录方式\" 设定系统开始运行级为 4", "B": "选择\"文本登录方式\" 设定系统开始运行级为 3", "C": "选择\"文本登录方式\" 设定系统开始运行级为 5", "D": "选择\"图形登录方式\" 设定系统开始运行级为3"}$q$, NULL, NULL),(369794, $q${"A": "逻辑设计->概念结构设计->物理设计", "B": "物理设计->概念结构设计->逻辑设计", "C": "逻辑设计->物理设计->概念结构设计", "D": "概念结构设计->逻辑设计—>物理设计"}$q$, NULL, NULL),(369911, $q${"A": "物理数据库指长期存放在外存上的可共享的相关数据的集合", "B": "数据库中存放的\"元数据\"是关于数据之间联系的描述", "C": "数据库系统支持环境不包括操作系统", "D": "用户使用 SQL 实现对数据库的基本操作"}$q$, NULL, NULL),(370217, $q${"A": "从 S 表中删除成绩小于 90 的行。", "B": "生成一张学号为\"20001\"的含有“学生名”，“院系名称”的学生情况表。", "C": "将行(\"10003\"，“李 宁”，05，“文学院”)插入到表 S 中。", "D": "将表 S 中学号为\"20001\"的学生成绩更改为 95。"}$q$, NULL, NULL),(370273, $q${"A": "比特是组成数字信息的最小单位", "B": "比特只有“0”和\"1\"两个符号", "C": "比特既可以表示数值和文字，也可以表示图像或声音", "D": "比特\"1\"大于比特“0”"}$q$, NULL, NULL),(370435, NULL, $q$$q$, NULL),(370437, NULL, $q$$q$, NULL),(370462, $q${"A": "\"Setup.app\"和\"Install.apk\"", "B": "\"Setup.exe\"和\"Install.apk\"", "C": "\"Setup.exe\"和\"Install.exe\"", "D": "\"Setup.app\"和\"Install.exe\""}$q$, NULL, NULL),(371378, NULL, $q$在一个函数的函数体内，不能再定义另一个函数，即不能嵌套定义。$q$, NULL),(371936, $q${"A": "p->next==NULL", "B": "p->next==h", "C": "p->next->next==h", "D": "p->data=-1"}$q$, NULL, NULL),(372292, $q${"A": "p=p->next;", "B": "p=p->next->next;", "C": "p->next=p;", "D": "p->next=p->next->next;"}$q$, NULL, NULL),(372556, $q${"A": "p=p->next;", "B": "p=p->next->next;", "C": "p->next=p;", "D": "p->next=p->next->next;"}$q$, NULL, NULL),(372599, $q${"A": "SELECT sno,sname,math FROM stu where math BETWEEN 80 AND 90;", "B": "SELECT sno,sname,math FROM stu where math in (80,89);", "C": "SELECT sno,sname,math FROM stu where math>=80 && math<=90;", "D": "SELECT sno,sname,math FROM stu where math>=80 AND math<=90;"}$q$, NULL, NULL),(373121, $q${"A": "NOT", "B": "NULL", "C": "NOT NULL", "D": "\" \""}$q$, NULL, NULL),(373122, $q${"A": "UPDATE S Age", "B": "DELETE Age from S", "C": "ALTER TABLE S DELETE 'Age'", "D": "ALTER TABLE S DROP Age"}$q$, NULL, NULL),(373172, $q${"A": "create table user{ name char(20),sex char(4),age int not null };", "B": "create table user 'name char(20),sex char(4),age int not null';", "C": "create table user(name char(20),sex char(4),age int not null);", "D": "create table user[name char(20),sex char(4),age int not null];"}$q$, NULL, NULL),(373173, $q${"A": "insert into film values(345,'流浪地球 2',135);", "B": "insert into film(film_id.title) values(345,'流浪地球 2',135);", "C": "insert into film(film_id, title, length, rental_rate) values(345, '流浪地球 2', 135);", "D": "insert into film(film_id, title, length) values(345,'流浪地球 2',135);"}$q$, NULL, NULL),(373183, $q${"A": "SELECT customer_id, SUM(total_amount),<br/><br/>COUNT(order_id) FROM orders<br/><br/>GROUP BY customer_id<br/><br/>HAVING SUM(total_amount) > 1000;", "C": "SELECT customer_id, SUM(total_amount)<br/><br/>AS total_spent, COUNT(order_id) AS order_count<br/><br/>FROM orders<br/><br/>GROUP BY customer_id<br/><br/>WHERE total_spent > 1000;", "B": "SELECT customer_id, SUM(total_amount) AS<br/><br/>total_spent, COUNT(order_id) AS order_count<br/><br/>FROM orders<br/><br/>WHERE total_amount > 1000<br/><br/>GROUP BY customer_id;", "D": "SELECT customer_id, COUNT(order_id)<br/><br/>AS order_count, SUM(total_amount) AS total_spent<br/><br/>FROM orders<br/><br/>GROUP BY customer_id<br/><br/>HAVING order_count> 1000;"}$q$, NULL, NULL),(373249, $q${"A": "NOT", "B": "NULL", "C": "NOT NULL", "D": "\"\""}$q$, NULL, NULL),(373250, $q${"A": "UPDATE S Age", "C": "ALTER TABLE S DELETE 'Age'", "B": "DELETE Age from S", "D": "ALTER TABLE S DROP Age"}$q$, NULL, NULL),(373257, $q${"A": "DROP FEOM 借书证 WHERE 借书证号=\"1001\"", "B": "DROP FEOM 借书证 FOR 借书证号=\"1001\"", "C": "DELETE FEOM 借书证 WHERE 借书证号=\"1001\"", "D": "DELETE FEOM 借书证 FOR 借书证号=\"1001\""}$q$, NULL, NULL),(373260, $q${"A": "DELETE FROM 图书 FOR 图书编号=\"A\"", "B": "DELETE FROM 图书 WHERE 图书编号=\"A%\"", "C": "DELETE FROM 图书 FOR 图书编号=\"A*\"", "D": "DELETE FROM 图书 WHERE 图书编号 LIKE \"A%\""}$q$, NULL, NULL),(373291, $q${"A": "=SOME", "B": "<>SOME", "C": "=ALL", "D": "<>ALL"}$q$, NULL, NULL),(373299, $q${"A": "仓库号=\"wh1\" AND 仓库号=\"wh2\"", "B": "仓库号!=\"wh1\" OR 仓库号! = \"wh2\"", "C": "仓库号=\"wh1\" OR 仓库号=\"wh2\"", "D": "仓库号!=\"wh1\" AND 仓库号!=\"wh2\""}$q$, NULL, NULL),(373342, $q${"A": "update student age=15 where name=张三'；", "B": "update student age='15' where name=张三", "C": "update student set age=15 where name=\"张三\";", "D": "update student set name='张三' where age=15;"}$q$, NULL, NULL)
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
  IF n <> 22 THEN RAISE EXCEPTION '第 25 批 HTML 更新数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 3 THEN RAISE EXCEPTION '第 25 批解析去冒号数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 25 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 25 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 25 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
