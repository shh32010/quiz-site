-- 知识点 277 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_277
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_277 as
select * from t_knowledge_point where id in (30261,30265,30282,30290,30406,30417,30675,30677,30681,30693,30694,30696,30697,30698,30699,30706,30712,30713,30715,30716,30718,30722,30727,30730,30735,30736,30737,30738,30739,30741,30743,30744,31050,31302,31432,31433,31655,31679,31682,31699,31739,31781,31782,31825,31865,31866,31870,31871,31872,31905,32337,32339,32341,32363,32364,32366,32367,32369,32371,32377,32380,32386,32394,32395,32422,32423,32424,32425,32426,32427,32428,32430,32431,32432,32435,32436,32437,32438,32439,32440,32441,32442,32443,32464,32477,32478,32482,32485);

update t_knowledge_point set title = $kp$按入职时间取倒数第三名员工（LIMIT 与子查询）$kp$, content = $kp$题目：查询 employees 表中入职时间排名倒数第三的员工信息。

（1）不考虑同一天有多人入职，可直接按 hire_date 降序取第三条：

SELECT * FROM employees
ORDER BY hire_date DESC
LIMIT 2,1;

（2）同一天可能有多人入职时，先对 hire_date 去重取倒数第三个日期，再按该日期查人：

SELECT * FROM employees
WHERE hire_date = (
  SELECT DISTINCT hire_date FROM employees
  ORDER BY hire_date DESC
  LIMIT 2,1
);

等价写法（偏移量写法）：

SELECT * FROM employees
WHERE hire_date = (
  SELECT DISTINCT hire_date FROM employees
  ORDER BY hire_date DESC
  LIMIT 1 OFFSET 2
);$kp$, section = '' where id = 30261;
update t_knowledge_point set title = $kp$salaries 与 dept_manager 等值连接查询$kp$, content = $kp$题目：查询各个部门当前领导的薪水详情及其部门编号 dept_no，结果按 salaries.emp_no 升序排序，dept_no 列放在最后一列。

SELECT A.emp_no, salary, from_date, A.to_date, dept_no
FROM salaries AS A, dept_manager AS B
WHERE A.emp_no = B.emp_no
ORDER BY A.emp_no;$kp$, section = '' where id = 30265;
update t_knowledge_point set title = $kp$查询薪水记录超过 15 次的员工号与次数$kp$, content = $kp$题目：查找 salaries 表中薪水记录超过 15 次的员工号 emp_no 及其对应的记录次数 t。

输出示例：

+--------+----+
| emp_no | t  |
+--------+----+
| 10001  | 16 |
+--------+----+$kp$, section = '' where id = 30282;
update t_knowledge_point set title = $kp$查询各部门当前领导的薪水详情$kp$, content = $kp$题目：查找各个部门当前领导的薪水详情以及对应部门编号 dept_no，结果按 salaries.emp_no 升序排序，dept_no 列放在最后一列。

输出示例：

+--------+--------+------------+------------+---------+
| emp_no | salary | from_date  | to_date    | dept_no |
+--------+--------+------------+------------+---------+
| 10001  | 88958  | 2002-06-22 | 9999-01-01 | d001    |
| 10003  | 43311  | 2001-12-01 | 9999-01-01 | d002    |
+--------+--------+------------+------------+---------+$kp$, section = '' where id = 30290;
update t_knowledge_point set title = $kp$查询入职时间倒数第三的员工信息$kp$, content = $kp$题目：查找 employees 表中入职时间排名倒数第三的员工所有信息。

输出示例：

+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
| 10001  | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |
+--------+------------+------------+-----------+--------+------------+$kp$, section = '' where id = 30406;
update t_knowledge_point set title = $kp$入职时间倒数第三查询的两种情形$kp$, content = $kp$情形一：不考虑同一天有多人入职，按 hire_date 降序后直接取第 3 条（LIMIT 2,1）。

情形二：入职时间相同的员工可能不止一人，需先对 hire_date 去重取倒数第三个日期，再用子查询按该日期匹配员工。$kp$, section = '' where id = 30417;
update t_knowledge_point set title = $kp$自然连接、分组排序与常用聚合函数$kp$, content = $kp$自然连接：

SELECT * FROM grade, address WHERE grade.sno = address.sno;

等价于：

SELECT * FROM grade JOIN address ON grade.sno = address.sno;

分组：GROUP BY 按列分组，旧版 MySQL 会对分组列隐式升序排序。

排序：ORDER BY 待排字段 ASC|DESC，ASC 升序（缺省），DESC 降序。

SELECT sname, score FROM grade WHERE score > 90 ORDER BY score ASC;

常用聚合函数：

| 函数 | 作用 | 示例 |
| --- | --- | --- |
| COUNT | 求组中记录数，返回整数 | COUNT(*) |
| MAX | 求最大值 | MAX(score) |
| MIN | 求最小值 | MIN(score) |
| SUM | 返回表达式中所有值的和 | SUM(score) |
| AVG | 求组中值的平均值 | AVG(score) |$kp$, section = '' where id = 30675;
update t_knowledge_point set title = $kp$UNION 联合查询与 COUNT 计数$kp$, content = $kp$36. 答案：SELECT
解析：使用 UNION 关键字可以把多个 SELECT 语句的结果组合到一个结果集中，这种查询称为并（UNION）运算或联合查询。合并时，多个 SELECT 子句中对应的字段数和数据类型必须相同。

37. 答案：NULL
解析：MySQL 中 COUNT(*) 返回选择集合中所有行的数目，包含值为 NULL 的行。

38. 答案：异步消息$kp$, section = '' where id = 30677;
update t_knowledge_point set title = $kp$HAVING 筛选分组结果$kp$, content = $kp$SELECT emp_no, COUNT(emp_no) AS t
FROM salaries
GROUP BY emp_no
HAVING COUNT(emp_no) > 15;

或使用列别名（MySQL 允许）：

SELECT emp_no, COUNT(emp_no) AS t
FROM salaries
GROUP BY emp_no
HAVING t > 15;$kp$, section = '' where id = 30681;
update t_knowledge_point set title = $kp$数据的插入与删除（INSERT、DELETE、TRUNCATE）$kp$, content = $kp$插入表记录：INSERT

语法：

-- 向表中插入某些字段
INSERT INTO 表 (字段1, 字段2, 字段3, ...) VALUES (值1, 值2, 值3, ...);

-- 向表中插入所有字段，字段顺序为建表时的顺序
INSERT INTO 表 VALUES (值1, 值2, 值3, ...);

注意：

- 值与字段必须对应，个数相同、类型相同；
- 值的大小必须在字段长度范围内；
- 除数值类型外，其他类型的值必须用引号引起（建议单引号）；
- 插入空值可以不写该字段，或插入 NULL；
- 注意每一列的约束（主键、唯一、非空、默认值）。

删除记录：DELETE（表结构保留）

语法：

DELETE FROM 表名 [WHERE 条件];

或

TRUNCATE TABLE 表名;

两者区别：DELETE 逐条删除，不清空 auto_increment 计数；TRUNCATE 相当于删除表后重建，auto_increment 归零，重新开始。$kp$, section = '' where id = 30693;
update t_knowledge_point set title = $kp$无法还原的乱码片段$kp$, content = $kp$该条目为 OCR 乱码，仅残留 Replace、Update、路由选择、SSID 等零散词语，无法还原为有效知识点。$kp$, section = '' where id = 30694;
update t_knowledge_point set title = $kp$SQL 的高度非过程化特点$kp$, content = $kp$SQL 语言进行数据操作时，用户不需要了解存取路径，系统自动完成存取路径的选择以及 SQL 的操作过程，因此 SQL 的特点是高度非过程化。$kp$, section = '' where id = 30696;
update t_knowledge_point set title = $kp$dept_manager 部门领导表数据示例$kp$, content = $kp$各部门领导表 dept_manager 简况如下：

mysql> SELECT * FROM dept_manager;
+---------+--------+------------+
| dept_no | emp_no | to_date    |
+---------+--------+------------+
| d001    | 10001  | 9999-01-01 |
| d002    | 10003  | 9999-01-01 |
+---------+--------+------------+$kp$, section = '' where id = 30697;
update t_knowledge_point set title = $kp$模糊查询（LIKE 与通配符）$kp$, content = $kp$模糊查询使用通配符补全不确定的字符。通配符有两个：下划线 _ 表示任意一个字符，百分号 % 表示任意多个字符。使用模糊查询需要用到关键字 LIKE。

例：查找以 s 开头、后两位任意、第四位为 0、后面任意长度的学生姓名：

SELECT * FROM emp WHERE sname LIKE 's__0%';$kp$, section = '' where id = 30698;
update t_knowledge_point set title = $kp$事务的隔离性与持久性$kp$, content = $kp$（3）隔离性（Isolation）

事务之间相互独立，不会互相影响。例如点餐全过程（电话订购、做饭、送餐、结算）为一个事务，不同人的点餐操作相互独立。如果饭菜已卖完，后续点餐事务会因无餐可点而回滚。

（4）持久性（Durability）

事务提交后的结果在断网、服务器故障等情况下依然能够保存下来。

附：相关试题

38. 答案：C。将 E-R 图转换为关系模式时，实体和联系都可以表示为关系。

39. 答案：C。机器学习是模拟人类智能的一种有力工具，利用已有的经验数据得出模型（规律），再用模型判断或预测未知数据。

40. 答案：B。图像识别是利用计算机对图像进行处理、分析和理解，以识别不同模式的目标和对象的技术。$kp$, section = '' where id = 30699;
update t_knowledge_point set title = $kp$分组查询（GROUP BY 与 HAVING）$kp$, content = $kp$按部门查询每个部门的工资和，就需要按部门分组，子句为 GROUP BY。

查询每个部门的编号、人数以及工资和：

SELECT deptno, COUNT(*) num, SUM(sal) total FROM emp GROUP BY deptno;

HAVING 用于分组后对数据进行过滤，区别于 WHERE。

查询工资总和大于 9000 的部门编号及工资和：

SELECT deptno, SUM(sal) FROM emp GROUP BY deptno HAVING SUM(sal) > 9000;

HAVING 从分组结果中筛选，本例筛掉了 deptno 10。$kp$, section = '' where id = 30706;
update t_knowledge_point set title = $kp$排序（ORDER BY）与外连接、分组要点$kp$, content = $kp$排序：升序 ASC（缺省），降序 DESC；关键字 ORDER BY 待排字段 [ASC|DESC]。

5. 答案：C
解析：RIGHT OUTER JOIN 是右外连接，主表是后面的 orders 表，其中有 6 条记录，所以结果最多 6 条。

6. 答案：B
解析：按类别统计，分组（GROUP BY）字段是 type；平均价格用 AVG。

7. 答案：A
解析：无线对等网仅需要无线网卡即可。$kp$, section = '' where id = 30712;
update t_knowledge_point set title = $kp$NOT 对 IN、BETWEEN、EXISTS 取反$kp$, content = $kp$MySQL 支持使用 NOT 对 IN、BETWEEN 和 EXISTS 子句取反，这与多数其他 DBMS 允许使用 NOT 对各种条件取反有很大的差别。$kp$, section = '' where id = 30713;
update t_knowledge_point set title = $kp$WHERE 与 HAVING 的区别及视图$kp$, content = $kp$WHERE 在 FROM 之后选择行，HAVING 在 GROUP BY 之后选择行。

查找会员订单数在 2 笔以上且每笔订购册数都在 5 本以上的会员：

SELECT 会员号 FROM S
WHERE 订购册数 > 5
GROUP BY 会员号
HAVING COUNT(*) > 2;

统计每个学号的选课门数：

SELECT sno, sname, COUNT(cno) FROM S GROUP BY sno HAVING COUNT(cno) >= 2;

按身份证号统计平均订购册数：

SELECT 身份证号, AVG(订购册数) AS 平均订购册数
FROM S GROUP BY 身份证号 HAVING AVG(订购册数) > 0;

模糊检索：

SELECT * FROM grade WHERE sname LIKE '毛%';  -- 以“毛”开头
SELECT * FROM grade WHERE sname LIKE '%毛';  -- 以“毛”结尾

创建视图：

CREATE VIEW 视图名 (列名列表) AS SELECT 语句;

WITH CHECK OPTION 用于限制通过视图修改的数据必须满足视图定义中的条件。$kp$, section = '' where id = 30715;
update t_knowledge_point set title = $kp$外键约束与表间关系$kp$, content = $kp$INSERT INTO user
VALUES (5, '高七', '012', 'gaoqi@outlook.com', '2000-5-1', DEFAULT);

插入值与默认值不同时的处理。

引用完整性（参照完整性）——外键约束

关键字：FOREIGN KEY。外键用于在两个表之间建立连接，可以是一列或多列，一个表可以有一个或多个外键。外键对应参照完整性：外键值为空时不做检查；不为空时，每个外键值必须等于另一个表中主键的某个值。

外键是表中的一个字段，可以不是本表的主键，但必须对应另一张表的主键。外键的主要作用是保证数据引用完整性：定义外键后，不允许删除另一表中具有关联关系的行，从而保持数据的一致性和完整性。

主表（父表）：相关联字段中主键所在的表。
从表（子表）：相关联字段中外键所在的表。

语法：

[CONSTRAINT 约束名] FOREIGN KEY (字段名1 [, 字段名2, ...]) REFERENCES 主表 (主键列1 [, 主键列2, ...])

外键约束示例：

CREATE TABLE connStudent(
  sid INT PRIMARY KEY,
  sname VARCHAR(20),
  sbirthday DATE
);

CREATE TABLE connScore(
  id INT,
  sid INT,
  sscore DOUBLE,
  CONSTRAINT fk_connScore_connStudent FOREIGN KEY (sid) REFERENCES connStudent(sid)
);

第二种添加外键的方式：

ALTER TABLE connScore
ADD CONSTRAINT fk_connStudent_connScore FOREIGN KEY (sid) REFERENCES connStudent(sid);

表与表的关系

表间关系有三种：一对一、一对多（多对一）、多对多。确定关系时需分清主表和从表：依赖性更强的是从表，必须存在的是主表，外键设在从表中。

一对多：一个部门可以有多个员工，一个员工只能属于一个部门；一个客户对应多个联系人，一个联系人只能属于某一个客户。
建表原则：在多的一方创建外键，指向一的一方的主键。

多对多：一个学生可以选择多门课程，一门课程可以被多个学生选择；一个订单可以包含多个商品，一个商品可以出现在多个订单中；一个用户可以有多个角色，一个角色可以对应多个用户。
建表原则：创建中间表，中间表至少有两个字段分别作为外键指向双方的主键。

一对一：一般建一张表。
建表原则：唯一外键对应或主键对应（不常用，且可合并）。

一对一实际上是把数据表“垂直切分”，即 A 表的一条记录对应 B 表的一条记录。例如 Employee（员工表，含 EmployeeId、姓名、性别、年龄、电话、地址等）与 User（用户表，含 UserId 关联 EmployeeId、用户名、密码、角色等）：User 的记录只在登录时用到，合并为一张表会使大量字段与主键只是间接关联，违背“确保每列都和主键列直接关联”的范式要求。若表中字段过多、很多字段只在少数情况下使用，也可考虑一对一设计。

优点：便于管理，可提高查询速度；减轻 CPU 与 IO 负担，提高存取效率；符合数据库设计的三大范式；符合关系数据库的特性。
缺点：增加复杂程度，程序中读写难度加大。$kp$, section = '' where id = 30716;
update t_knowledge_point set title = $kp$多表连接与内连接$kp$, content = $kp$SELECT * FROM emp, dept WHERE emp.deptno = dept.deptno;

该查询会把两张表符合条件的记录全部查出。由于两表存在同名列（如 deptno），且通常不需要查询所有列，可以把 * 换成需要的字段，格式为 表名.字段名。

表名过长时可以起别名，格式为 表1名 [AS] 表1别名, 表2名 [AS] 表2别名, ...，引用列时使用别名：

SELECT e.ename, e.sal, e.comm, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

内连接

上面的语句就是内连接，但不是 SQL 标准写法。标准写法为：

SELECT e.ename, e.sal, e.comm, d.dname
FROM emp e INNER JOIN dept d ON e.deptno = d.deptno;

这里的 INNER 关键字可以省略，只写 JOIN 即为内连接。

内连接的特点：查询结果必须满足连接（过滤）条件。$kp$, section = '' where id = 30718;
update t_knowledge_point set title = $kp$子查询综合练习（选修课程查询）$kp$, content = $kp$（1）查询选修了“计算机基础”的学生的学号和姓名：

SELECT sno, sname
FROM Student
WHERE sno IN (
  SELECT sno FROM Sc
  WHERE cno IN (
    SELECT cno FROM Course WHERE cname = '计算机基础'
  )
);

（2）查询姓名中带有“星”的同学所选修的课程名称：

SELECT cname
FROM Course
WHERE cno IN (
  SELECT cno FROM Sc
  WHERE sno IN (
    SELECT sno FROM Student WHERE sname LIKE '%星%'
  )
);

（3）查询选修了 5 门课程的学生学号和姓名：

SELECT sno, sname
FROM Student
WHERE sno IN (
  SELECT sno FROM Sc
  GROUP BY sno HAVING COUNT(*) = 5
);$kp$, section = '' where id = 30722;
update t_knowledge_point set title = $kp$合并结果集（UNION 与 UNION ALL）$kp$, content = $kp$合并结果集是把两个或多个列类型、列数对应的表拼接查询，关键字为 UNION、UNION ALL。

-- 为什么要拆表：一对多关系（如一个学生有多条成绩）放在一张表中会产生大量冗余，拆表并建立表间关系可以减少冗余。

CREATE DATABASE day02;
USE day02;
SELECT DATABASE();

CREATE TABLE a(
  name VARCHAR(20),
  score INT
);
CREATE TABLE b(
  name VARCHAR(20),
  score INT
);
INSERT INTO a VALUES ('a',10),('b',20),('c',30);
INSERT INTO b VALUES ('a',10),('b',20),('d',40);

-- 合并结果集并去重
SELECT * FROM a
UNION
SELECT * FROM b;

-- 只合并不去重
SELECT * FROM a
UNION ALL
SELECT * FROM b;

注意：被合并的表的列名可以不同，但列数和类型必须相同。$kp$, section = '' where id = 30727;
update t_knowledge_point set title = $kp$外连接、自然连接与子查询$kp$, content = $kp$外连接

外连接分为左连接和右连接，两者只是参照的表不同：左连接以左表为基准，右连接以右表为基准。两表条件都满足时，外连接的结果与内连接相同；只满足左表条件时，左连接会查出该记录、右表部分用 NULL 填充，右连接则查不出这条记录；只满足右表条件时情形相反。

例：emp 表中“张三”的部门编号为 50，而 dept 表中没有 50 号部门，所以“张三”不满足 e.deptno = d.deptno。在左连接中 emp 是左表，左表记录都会查出，“张三”也会出现，对应的右表部分显示 NULL：

SELECT * FROM emp e LEFT OUTER JOIN dept d ON e.deptno = d.deptno;

左表中没有 40 号部门，所以 deptno = 40 的记录不会被查出。使用右连接：

SELECT * FROM emp e RIGHT OUTER JOIN dept d ON e.deptno = d.deptno;

右表中没有 50 号部门，所以 deptno = 50 的记录不会被查出。

连接查询心得

连接不限于两张表，也可以是三张、四张甚至 N 张表。通常连接查询不需要完整笛卡尔积，而只要其中一部分，因此需要用条件去除不需要的记录，这些条件大多是主外键关系。两张表的连接查询一定有一个主外键关系，三张表的连接查询一定有两个主外键关系。

自然连接

自然连接无需给出主外键等式，它会自动以两表中名称和类型完全一致的列作为连接条件：

SELECT * FROM emp NATURAL JOIN dept;
SELECT * FROM emp NATURAL LEFT JOIN dept;
SELECT * FROM emp NATURAL RIGHT JOIN dept;

子查询

一个 SELECT 语句中包含另一个完整的 SELECT 语句，即嵌套查询。一条语句中出现两个或两个以上 SELECT 就是子查询语句。

1. 子查询出现的位置：WHERE 后，作为查询条件的一部分；FROM 后，作为表（派生表）。

2. 子查询出现在 WHERE 后作为条件时，还可以使用关键字 ANY、ALL。

3. 子查询结果集的形式：单行单列（用于条件）、单行多列（用于条件）、多行单列（用于条件）、多行多列（用于表）。

示例表：

CREATE TABLE emp(
  empno INT,
  ename VARCHAR(50),
  job VARCHAR(50),
  mgr INT,
  hiredate DATE,
  sal DECIMAL(7,2),
  comm DECIMAL(7,2),
  deptno INT
);

CREATE TABLE dept(
  deptno INT,
  dname VARCHAR(14),
  loc VARCHAR(13)
);

INSERT INTO emp VALUES(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO emp VALUES(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO emp VALUES(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30);
INSERT INTO emp VALUES(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20);
INSERT INTO emp VALUES(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
INSERT INTO emp VALUES(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30);
INSERT INTO emp VALUES(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10);
INSERT INTO emp VALUES(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20);
INSERT INTO emp VALUES(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO emp VALUES(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO emp VALUES(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20);
INSERT INTO emp VALUES(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30);
INSERT INTO emp VALUES(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20);
INSERT INTO emp VALUES(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);

INSERT INTO dept VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES(20,'RESEARCH','DALLAS');
INSERT INTO dept VALUES(30,'SALES','CHICAGO');
INSERT INTO dept VALUES(40,'OPERATIONS','BOSTON');

-- 查询 JONES 的工资
SELECT sal FROM emp WHERE ename = 'JONES';

-- 查询工资高于 JONES 的员工
SELECT * FROM emp WHERE sal > (SELECT sal FROM emp WHERE ename = 'JONES');

-- 查询与 SCOTT 同职位（job）的员工
SELECT * FROM emp WHERE job IN (SELECT job FROM emp WHERE ename = 'SCOTT');

-- 工资高于 30 号部门所有员工的员工信息
SELECT * FROM emp WHERE sal > (SELECT MAX(sal) FROM emp WHERE deptno = 30);

-- 等价写法
SELECT * FROM emp WHERE sal > ALL (SELECT sal FROM emp WHERE deptno = 30);

-- 工作和工资与 MARTIN 完全相同的员工信息
SELECT * FROM emp WHERE (job, sal) IN (SELECT job, sal FROM emp WHERE ename = 'MARTIN');

-- 有 2 个以上直接下属的员工信息
SELECT * FROM emp WHERE empno IN (SELECT mgr FROM emp GROUP BY mgr HAVING COUNT(mgr) >= 2);

-- 查询员工编号 7788 的姓名、工资、部门名称、部门地址
SELECT e.ename, e.sal, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.empno = 7788;

-- 查询各部门工资最高的员工信息
SELECT e1.* FROM emp e1,
  (SELECT deptno, MAX(sal) maxSal FROM emp GROUP BY deptno) e2
WHERE e1.sal = e2.maxSal AND e1.deptno = e2.deptno;

MySQL 中的函数

常用函数有四类：

1. 字符串函数：处理字符串；
2. 数值函数：处理数字；
3. 日期和时间函数：处理日期和时间；
4. 系统信息函数：获取系统信息。$kp$, section = '' where id = 30730;
update t_knowledge_point set title = $kp$更新表记录（UPDATE）$kp$, content = $kp$用于把满足条件记录的指定列修改为指定值。

语法：

-- 更新所有记录的指定字段
UPDATE 表名 SET 字段名 = 值, 字段名 = 值, ...;

-- 更新满足条件记录的指定字段
UPDATE 表名 SET 字段名 = 值, 字段名 = 值, ... WHERE 条件;

注意：

- 列名的类型与修改的值要一致；
- 修改值不能超过最大长度；
- 除数值类型外，其他类型的值必须用引号引起。$kp$, section = '' where id = 30735;
update t_knowledge_point set title = $kp$价格区间查询与聚合函数示例$kp$, content = $kp$查询商品价格在 800 到 2000 之间的所有商品：

SELECT * FROM d_product WHERE price BETWEEN 800 AND 2000;

-- 统计一共有几种价格
SELECT COUNT(DISTINCT price) FROM d_product;

-- 统计价格的和值
SELECT SUM(price) FROM d_product;

-- 获取价格最大的商品的价格
SELECT MAX(price) FROM d_product;

-- 获取价格最小的商品的价格
SELECT MIN(price) FROM d_product;

-- 获取所有商品的平均价格
SELECT AVG(price) FROM d_product;$kp$, section = '' where id = 30736;
update t_knowledge_point set title = $kp$左连接查询商品及其分类信息$kp$, content = $kp$SELECT * FROM products p
LEFT JOIN category c ON p.category_id = c.cid;$kp$, section = '' where id = 30737;
update t_knowledge_point set title = $kp$自然连接的使用条件$kp$, content = $kp$MySQL 中的自然连接（NATURAL JOIN）只有在两张表的连接字段名相同时才可以使用，否则返回的是笛卡尔积的结果集。$kp$, section = '' where id = 30738;
update t_knowledge_point set title = $kp$HAVING 的分组过滤作用$kp$, content = $kp$在 MySQL 中，HAVING 短语对分组的结果进行过滤，仅输出满足条件的组。$kp$, section = '' where id = 30739;
update t_knowledge_point set title = $kp$简单查询（SELECT 基础用法）$kp$, content = $kp$查询所有的商品：

SELECT * FROM d_product;

查询商品名和商品价格：

SELECT pname, price FROM d_product;

查询价格大于等于 3000 的商品名和商品价格：

SELECT pname, price FROM d_product WHERE price >= 3000;

查询结果是表达式（运算查询），如将所有商品价格打九折显示：

SELECT pname, price * 0.9 AS newPrice FROM d_product;$kp$, section = '' where id = 30741;
update t_knowledge_point set title = $kp$聚合函数、LIMIT、查询执行顺序与完整性约束$kp$, content = $kp$聚合函数

聚合函数用于纵向运算。

- COUNT()：统计指定列不为 NULL 的记录行数；
- MAX()：计算指定列的最大值，字符串类型按字典序比较；
- MIN()：计算指定列的最小值，字符串类型按字典序比较；
- SUM()：计算指定列的数值和，非数值类型结果为 0；
- AVG()：计算指定列的平均值，非数值类型结果为 0。

MySQL 方言 LIMIT

LIMIT 用于限定查询结果的起始行和总行数，起始行索引从 0 开始。从第 0 行开始查询 5 行：

SELECT * FROM emp LIMIT 0, 5;

应用：LIMIT 结合程序控制可实现分页查询，把起始页和每页条数作为变量。

查询语句的书写顺序与执行顺序

书写顺序：SELECT - FROM - WHERE - GROUP BY - HAVING - ORDER BY - LIMIT
执行顺序：FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY - LIMIT

数据的完整性

作用：保证用户输入并保存到数据库中的数据是正确的。
实现方法：建表时添加约束（也可用 ALTER 语句添加）。
分类：实体完整性、域完整性、引用完整性。

实体完整性

实体即表中的一行记录。主键的值不能为空或部分为空，这一约束称为实体完整性：要求每个表的主键字段不能为空或重复，即每一行数据都有唯一标识（主关键字）。

分类：主键约束（PRIMARY KEY）、唯一约束（UNIQUE）、自动增长列（AUTO_INCREMENT）。
一个列可以有多个约束，约束之间用空格隔开。

PRIMARY KEY 主键约束：数据唯一且不能为 NULL；一个表只能有一个主键约束，联合主键也算一个。

格式：[CONSTRAINT 约束名] PRIMARY KEY (字段名)

方式一：

CREATE TABLE student(
  sid INT PRIMARY KEY,
  sname VARCHAR(20)
);

方式二：可创建联合主键——所有主键列都相同才视为数据不唯一：

CREATE TABLE student1(
  sid INT,
  sname VARCHAR(20),
  PRIMARY KEY (sid)
);

CREATE TABLE student1_1(
  sid INT,
  sname VARCHAR(20),
  score DOUBLE,
  PRIMARY KEY (sid, score)
);

方式三：给已存在的表添加主键，也可添加联合主键：

CREATE TABLE student2(
  sid INT,
  classid INT,
  sname VARCHAR(20)
);
ALTER TABLE student2 ADD CONSTRAINT PRIMARY KEY (sid);

CREATE TABLE student2_1(
  sid INT,
  classid INT,
  sname VARCHAR(20)
);
ALTER TABLE student2_1 ADD PRIMARY KEY (sid, classid);
-- CONSTRAINT 关键字可以省略

UNIQUE 唯一约束：数据唯一，允许为 NULL。MySQL 中唯一约束可以有多个 NULL，Oracle 中只能有一个 NULL，否则报错。

创建唯一约束：

CREATE TABLE student3(
  sid INT,
  sname VARCHAR(20) UNIQUE
);

CREATE TABLE student3_1(
  sid INT,
  sname VARCHAR(20) UNIQUE,
  sage VARCHAR(5) UNIQUE
);

CREATE TABLE student3_2(
  sid INT,
  sname VARCHAR(20),
  sage VARCHAR(5)
);
ALTER TABLE student3_2 ADD UNIQUE (sname);

删除唯一约束：

ALTER TABLE student3_2 DROP INDEX sname;

AUTO_INCREMENT 自动增长列

SQL Server 用 IDENTITY，Oracle 用 SEQUENCE。自动增长约束只用于整数类型的键。若未把自动增长列定义为键，会报错：

Incorrect table definition; there can be only one auto column and it must be defined as a key

CREATE TABLE student4(
  sid INT UNIQUE AUTO_INCREMENT,
  sname VARCHAR(20)
);

CREATE TABLE student4_1(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  sname VARCHAR(20)
);

插入时只需填 sname，sid 会自动增长。注意：删除记录后编号不会回退，仍按已用过的最大值继续递增。$kp$, section = '' where id = 30743;
update t_knowledge_point set title = $kp$连接查询与笛卡尔积$kp$, content = $kp$连接查询就是求多个表的乘积，例如 t1 连接 t2，查询结果行数为 t1 行数 × t2 行数。

连接查询会产生笛卡尔积：设 A = {a, b}，B = {0, 1, 2}，则 A × B = {(a,0), (a,1), (a,2), (b,0), (b,1), (b,2)}，可推广到多个集合。

虽然可以用条件过滤掉无用数据，但表越大，笛卡尔积产生的无用数据越多，查询越慢。通常使用主外键作为条件去除无用信息。$kp$, section = '' where id = 30744;
update t_knowledge_point set title = $kp$WHERE 子句中使用正则表达式（REGEXP）$kp$, content = $kp$在 SELECT 语句的 WHERE 子句中使用正则表达式过滤数据，关键字是 REGEXP（等价于 RLIKE）。

同段文字中还混有 Linux 命令题：su 用于将普通用户切换为超级用户。$kp$, section = '' where id = 31050;
update t_knowledge_point set title = $kp$建表与分组查询综合解析$kp$, content = $kp$CREATE TABLE WORKS(
  Eno CHAR(10),
  Cno CHAR(4),
  Salary INT CHECK (Salary >= 2500),
  PRIMARY KEY (Eno, Cno)
);

SELECT W.Cno, C.Cname
FROM COMPANY AS C, WORKS AS W
WHERE C.Cno = W.Cno
GROUP BY W.Cno, C.Cname
HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM WORKS GROUP BY Cno);

排序可以只按 Cno 进行。$kp$, section = '' where id = 31302;
update t_knowledge_point set title = $kp$SQL 数据操纵语言（DML）概览$kp$, content = $kp$SQL 数据操纵语言包含四类操作：

- SELECT 查询（检索）：查询一张或多张表的数据；
- INSERT 插入（增加）：向表内插入记录；
- UPDATE 更新（修改）：更新字段值；
- DELETE 删除：删除一条或多条记录，只清数据，表结构还在。

注意与 DROP TABLE 的区别：DROP TABLE 删除数据及表结构。$kp$, section = '' where id = 31432;
update t_knowledge_point set title = $kp$插入记录与插入查询结果$kp$, content = $kp$（1）插入一条记录

语法：

INSERT INTO 表名 (属性名列表) VALUES (属性值1, 属性值2, 属性值3, ...);

实例：

INSERT INTO 学生表 (id, name, sex, bdate)
VALUES ('S02021', '张志虎', '男', '1990-9-30');

（2）插入查询结果

语法：

INSERT INTO 表名 (属性名列表) SELECT 子句;

实例：

INSERT INTO t_temp (name, age)
SELECT name, age FROM t_students WHERE age >= 19;$kp$, section = '' where id = 31433;
update t_knowledge_point set title = $kp$按学号降序查询学生信息$kp$, content = $kp$SELECT 学号, 姓名, 性别 FROM 学生 ORDER BY 学号 DESC;$kp$, section = '' where id = 31655;
update t_knowledge_point set title = $kp$SQL 覆盖数据定义、查询、操纵与控制$kp$, content = $kp$SQL 包括所有对数据的操作，用 SQL 语言可实现数据定义、数据查询、数据操纵和数据控制。$kp$, section = '' where id = 31679;
update t_knowledge_point set title = $kp$SQL 的更新操作（INSERT、UPDATE、DELETE）$kp$, content = $kp$SQL 更新包括插入、更改和删除。

① 插入语句（把一个记录插入到指定的表中）：INSERT。
② 更改语句（对指定表中已有数据进行修改）：UPDATE。
③ 删除语句：DELETE。

如果省略 WHERE 子句，则删除表中所有元组：

DELETE FROM C;  -- 删除 C 表中的所有元组$kp$, section = '' where id = 31682;
update t_knowledge_point set title = $kp$COUNTA 函数统计非空单元格$kp$, content = $kp$COUNTA(区域)：统计指定区域内非空单元格的个数（Excel 函数）。$kp$, section = '' where id = 31699;
update t_knowledge_point set title = $kp$UPDATE 与 DELETE 语句$kp$, content = $kp$UPDATE 用于对指定表中已有的数据进行修改。

DELETE 语句：如果省略 WHERE 子句，则删除表中所有元组，只保留表的结构。

DELETE FROM C —— 删除 C 表中的所有元组。$kp$, section = '' where id = 31739;
update t_knowledge_point set title = $kp$查询学生表的全部内容$kp$, content = $kp$显示输出学生表的所有内容：

SELECT * FROM 学生;$kp$, section = '' where id = 31781;
update t_knowledge_point set title = $kp$查询学生表的学号、姓名和性别$kp$, content = $kp$查询输出学生表的学号、姓名和性别，并按学号降序排列：

SELECT 学号, 姓名, 性别 FROM 学生 ORDER BY 学号 DESC;$kp$, section = '' where id = 31782;
update t_knowledge_point set title = $kp$IN 运算符$kp$, content = $kp$IN 可以用 OR 连接的等值比较来等价替换。例如 Age IN (18, 21) 等价于 Age = 18 OR Age = 21。$kp$, section = '' where id = 31825;
update t_knowledge_point set title = $kp$DELETE 删除表中全部元组$kp$, content = $kp$DELETE FROM 学生 的含义：从学生表中删除所有的元组，即变成一张空表。注意表结构还在，只是数据全部删除。$kp$, section = '' where id = 31865;
update t_knowledge_point set title = $kp$带 WHERE 的 DELETE 与更新操作$kp$, content = $kp$DELETE FROM 学生 WHERE 性别='男' 的含义：从学生表中删除所有性别是“男”的元组，即删除部分元组，学生表的结构不受任何影响。

更新操作：一元操作，修改一张表中一个或多个元组的一个或多个属性值。表的结构（即属性）不变，元组的个数也不变，只是表中部分值发生变化。$kp$, section = '' where id = 31866;
update t_knowledge_point set title = $kp$清空表记录$kp$, content = $kp$清空表记录（删除全部记录）。

语法：DELETE FROM 表名；
实例：DELETE FROM tb1;$kp$, section = '' where id = 31870;
update t_knowledge_point set title = $kp$删除满足条件的记录$kp$, content = $kp$语法：DELETE FROM 表名 WHERE 复合条件表达式；
实例：DELETE FROM tb1 WHERE sex='男';$kp$, section = '' where id = 31871;
update t_knowledge_point set title = $kp$按年龄排序查询$kp$, content = $kp$按年龄降序：SELECT * FROM tb_students ORDER BY age DESC;
按年龄升序：SELECT * FROM tb_students ORDER BY age;$kp$, section = '' where id = 31872;
update t_knowledge_point set title = $kp$GROUP BY 语法$kp$, content = $kp$语法：GROUP BY 属性名1[, 属性名2, 属性名3……] [HAVING 条件]$kp$, section = '' where id = 31905;
update t_knowledge_point set title = $kp$统计每个院系的学生人数$kp$, content = $kp$在 student 表中统计每个院系各有几个学生。该操作属于单表查询，使用 GROUP BY 按院系 department 分组：

SELECT department AS "院系", COUNT(id) AS "人数"
FROM student
GROUP BY department;$kp$, section = '' where id = 32337;
update t_knowledge_point set title = $kp$SQL 的功能与三级体系结构$kp$, content = $kp$SQL 功能：
1) 数据查询。
2) 数据操作（操纵）：对数据库中的数据进行查询、插入、修改和删除等操作。
3) 数据定义（DDL）。
4) 数据控制。
5) 数据管理。

SQL 数据库的三级体系结构——用户模式（外模式、子模式）：
1) 模式的子集，是数据的局部逻辑结构，也是数据库用户看到的数据视图。
2) 用户可以用 SQL 语言对基本表和视图进行查询。$kp$, section = '' where id = 32339;
update t_knowledge_point set title = $kp$SELECT 语句的基本形式与数据更新$kp$, content = $kp$SQL 语言提供 SELECT 语句进行数据库查询，一次查询的结果可以是多个元组。

基本形式：
SELECT A1, A2, …, An —— 目标表的列名或列表达式序列，相当于投影
FROM R1, R2, …, Rm —— 基本表或视图序列，相当于连接
[WHERE F] —— F 为条件表达式，相当于选择

数据更新包括：
1) 插入语句（INSERT）
2) 修改语句（UPDATE）
3) 删除数据（DELETE）：DELETE FROM 表名 [WHERE 条件]

注意：DELETE 仅删除满足 WHERE 子句条件的记录，表的定义仍在数据字典中。$kp$, section = '' where id = 32341;
update t_knowledge_point set title = $kp$UPDATE 更新全表数据$kp$, content = $kp$UPDATE 学生 SET 性别='男' 的含义：更新学生表，把所有元组的性别属性全部改为“男”。$kp$, section = '' where id = 32363;
update t_knowledge_point set title = $kp$UPDATE 更新指定元组$kp$, content = $kp$UPDATE 学生 SET 性别='男' WHERE 学号='A002' 的含义：更新学生表，将学号是 A002 的元组的性别属性改为“男”。$kp$, section = '' where id = 32364;
update t_knowledge_point set title = $kp$SQL 语言的特点$kp$, content = $kp$① 数据库结构化查询语言。用户使用 SQL 语言与 DBMS 交互，SQL 包含对数据库的所有操作，用 SQL 可实现数据库应用中的全部活动。

② SQL 是非过程式语言，只需要给出“做什么”，不需要给出“怎么做”，与 C/C++/Java 等过程式语言不同。

③ SQL 中 DDL 表示数据定义语言，用于定义基本表结构或定义视图；DML 表示数据操纵语言，用于插入、删除、更新、查询。$kp$, section = '' where id = 32366;
update t_knowledge_point set title = $kp$SQL 的执行方式$kp$, content = $kp$用户可以直接在终端上运行 SQL，也可以把 SQL 嵌入 FORTRAN、C/C++ 等语言中，或嵌入 ASP 等动态网页脚本中运行。$kp$, section = '' where id = 32367;
update t_knowledge_point set title = $kp$SELECT 语句的结构与示例$kp$, content = $kp$格式：
SELECT A1, A2, …, An —— 指出要查询出哪些列（哪些属性），对应投影操作。A1…An 是属性名，也可以是表达式，如 SUM(工资)。
FROM R1, R2, …, Rn —— 指出从哪些基本表或视图中查询，对应连接操作。
WHERE F —— F 是条件表达式（如 性别='男'），对应选择操作。

示例①：
SELECT 姓名, 性别
FROM 学生
WHERE 学号='A001'
含义：从学生表中查询学号是 A001 的元组中的姓名和性别。

示例②：
SELECT 姓名, 课程名
FROM 学生, 课程, 选课
WHERE 学生.学号=选课.学号 AND 课程.课程号=选课.课程号 AND 成绩>=90
含义：从学生表、课程表、选课表这三张表中，查询成绩在 90 分及以上的学生姓名与课程名。

这三张表必须有共同的属性：学生.学号=选课.学号 AND 课程.课程号=选课.课程号 就是告诉 SQL，学生表中的学号属性与选课表中的学号属性是同一个属性，这正是连接操作必须要求的。$kp$, section = '' where id = 32369;
update t_knowledge_point set title = $kp$INSERT、DELETE、UPDATE 三种操作$kp$, content = $kp$其它 SQL 操作：INSERT（插入）、DELETE（删除）、UPDATE（更新）。$kp$, section = '' where id = 32371;
update t_knowledge_point set title = $kp$数据库系统操作的基本单位$kp$, content = $kp$数据库系统（DBS）操作的基本单位是“事务”，每个“事务”由若干条有序的 SQL 语句组成。$kp$, section = '' where id = 32377;
update t_knowledge_point set title = $kp$SELECT 语句对应的关系操作$kp$, content = $kp$对于 SQL 查询语句 SELECT 列名 FROM 表名或视图名 WHERE 条件，该语句实现的关系操作从前往后分别是：投影、连接、选择。$kp$, section = '' where id = 32380;
update t_knowledge_point set title = $kp$触发器及其类型和优点$kp$, content = $kp$触发器是由 T-SQL 语句集组成的代码块，在响应某些动作时激活该语句集。触发器有 insert、delete、update 三种。其优点是防止对数据进行不正确、未授权和不一致的改变。$kp$, section = '' where id = 32386;
update t_knowledge_point set title = $kp$事务的提交与回滚$kp$, content = $kp$提交（COMMIT）是提交事务的所有操作，具体说就是将事务中所有对数据库的更新写回到磁盘上的物理数据库中去，事务正常结束。

回滚（ROLLBACK）是使数据库回到事务开始时的状态。具体地说，事务运行过程中发生某种故障、不能继续执行时，系统将事务中对数据库的所有已完成的更新操作全部撤消，使数据库回到事务开始时的状态。$kp$, section = '' where id = 32394;
update t_knowledge_point set title = $kp$五个常用的聚合函数$kp$, content = $kp$最大值 MAX()、最小值 MIN()、统计条目数 COUNT()、求和 SUM()、平均值 AVG()。$kp$, section = '' where id = 32395;
update t_knowledge_point set title = $kp$逻辑运算符与 INSERT 语句$kp$, content = $kp$逻辑运算符：NOT 或 !（逻辑非）、AND 或 &&（逻辑与）、OR 或 ||（逻辑或）、XOR（逻辑异或）。

INSERT 语句（增加、插入操作）
向表中所有属性列插入值有两种方法：一种是指定所有字段名，另一种是不指定字段名。不指定字段名时，值列表需要为表的每一个字段指定值，并且值的顺序必须和数据表中字段定义时的顺序相同。

(1) 插入一条记录
语法：INSERT [INTO] 表名[（属性名列表）] VALUES(属性值1, 属性值2, 属性值3, ...);
实例：INSERT INTO 学生表 (id, name, sex, bdate) VALUES('S02021', '张志虎', '男', '1990-9-30');
如果 sex 有默认值“男”，可以使用 DEFAULT 修饰符为字段使用默认值：
INSERT INTO 学生表 (id, name, sex, bdate) VALUES('S02021', '张志虎', default, '1990-9-30');
也可以省略该列：INSERT INTO 学生表 (id, name, bdate) VALUES('S02021', '张志虎', '1990-9-30');

(2) 插入多条记录
语法：INSERT [INTO] 表名（属性名列表） VALUES (属性值1, 属性值2, ...), (属性值1, 属性值2, ...);
实例：INSERT INTO 学生表 (id, name, sex, bdate) VALUES ('S02021', '张志虎', '男', '1990-9-30'), ('S02022', '张志龙', '男', '1988-7-8');

(3) 插入查询出来的结果
语法：INSERT [INTO] 表名（属性名列表） SELECT 属性名列表 FROM 表名1 [WHERE 条件];
实例：INSERT INTO t_tepm(name, age) SELECT name, age FROM t_students WHERE age>=19;$kp$, section = '' where id = 32422;
update t_knowledge_point set title = $kp$更新全表中相关属性的值$kp$, content = $kp$语法：UPDATE 表名 SET 属性名1 = 新值[, 属性名2 = 新值, …]；
实例：UPDATE 学生表 SET sGrade='大三';$kp$, section = '' where id = 32423;
update t_knowledge_point set title = $kp$更新满足条件记录的相关属性值$kp$, content = $kp$语法：
UPDATE 表名 SET 属性名1 = 新值[, 属性名2 = 新值, …]
WHERE 属性1 = 值;

实例：
UPDATE 学生表 SET sGrade='大三' WHERE ID='sz00001';$kp$, section = '' where id = 32424;
update t_knowledge_point set title = $kp$SELECT 的基本语法$kp$, content = $kp$方括号 [ ] 表示可选项。

SELECT [ALL | DISTINCT | DISTINCTROW] 列名列表
FROM 表名或视图名 [WHERE 条件]
[GROUP BY 列名 [HAVING 条件]]
[ORDER BY 列名 [ASC | DESC]]
[LIMIT [m,] n];

默认是 ALL，即返回 SELECT 操作中所有匹配的行，包括可能存在的重复行。若指定 DISTINCT 或 DISTINCTROW，则会消除结果集中的重复行；DISTINCT 与 DISTINCTROW 为同义词，且这两个关键字应用于 SELECT 语句中所指定的所有列，故只需指定一次，不需要在每个目标列前都指定。$kp$, section = '' where id = 32425;
update t_knowledge_point set title = $kp$LIMIT 分页查询$kp$, content = $kp$① 参数必须是一个整数常量。
② 如果给定两个参数，第一个参数指定第一个返回记录行的偏移量，第二个参数指定返回记录行的最大数目。
③ 初始记录行的偏移量是 0。

基本语法：SELECT * FROM table LIMIT [offset,] rows | rows OFFSET offset

SELECT * FROM table LIMIT 5,10; —— 检索记录行 6-15
为了检索从某一个偏移量到记录集结束的所有记录行，可以指定第二个参数为 -1：
SELECT * FROM table LIMIT 95,-1; —— 检索记录行 96 到最后（注意新版本不支持该用法）
如果只给定一个参数，它表示返回最大的记录行数目：
SELECT * FROM table LIMIT 5; —— 检索前 5 个记录行，等价于 LIMIT 0,5

OFFSET 用法，下面两种写法都表示取第 2、3、4 条数据：
SELECT * FROM article LIMIT 1,3;
SELECT * FROM article LIMIT 3 OFFSET 1;$kp$, section = '' where id = 32426;
update t_knowledge_point set title = $kp$不等值连接实例$kp$, content = $kp$SELECT A.id AS ID, A.name AS Name, A.age AS Age, B.name AS Grade
FROM t_students AS A, t_grade AS B
WHERE A.class > B.id;

或

SELECT A.id AS ID, A.name AS Name, A.age AS Age, B.name AS Grade
FROM t_students AS A
INNER JOIN t_grade AS B
ON A.class > B.id;$kp$, section = '' where id = 32427;
update t_knowledge_point set title = $kp$自然连接$kp$, content = $kp$自然连接要求两表有相同属性，并会删除结果中重复的属性。

实例：SELECT * FROM t_students NATURAL JOIN t_grade;$kp$, section = '' where id = 32428;
update t_knowledge_point set title = $kp$自连接实例$kp$, content = $kp$SELECT A.name AS 员工名, B.name AS 经理
FROM 员工表 AS A, 员工表 AS B
WHERE A.leader = B.id;$kp$, section = '' where id = 32430;
update t_knowledge_point set title = $kp$左外连接$kp$, content = $kp$语法：A 表名 LEFT [OUTER] JOIN B 表名 ON 条件

实例：
SELECT A.id AS 学号, A.name AS 姓名, A.age AS 年龄, B.name AS 年级
FROM 学生表 AS A
LEFT JOIN 年级表 AS B
ON A.class = B.id;

或

SELECT A.id AS 学号, A.name AS 姓名, A.age AS 年龄, B.name AS 年级
FROM 学生表 AS A
LEFT OUTER JOIN 年级表 AS B
ON A.class = B.id;$kp$, section = '' where id = 32431;
update t_knowledge_point set title = $kp$右外连接$kp$, content = $kp$语法：A 表名 RIGHT [OUTER] JOIN B 表名 ON 条件

实例：
SELECT B.id AS 学号, B.name AS 姓名, B.age AS 年龄, A.name AS 年级
FROM 年级表 AS A
RIGHT JOIN 学生表 AS B
ON B.class = A.id;

或

SELECT B.id AS 学号, B.name AS 姓名, B.age AS 年龄, A.name AS 年级
FROM 年级表 AS A
RIGHT OUTER JOIN 学生表 AS B
ON B.class = A.id;$kp$, section = '' where id = 32432;
update t_knowledge_point set title = $kp$ALL 子查询$kp$, content = $kp$语法关键字：ALL

实例：
SELECT age
FROM tb1
WHERE age > ALL(SELECT age FROM tb2);$kp$, section = '' where id = 32435;
update t_knowledge_point set title = $kp$EXISTS 子查询$kp$, content = $kp$EXISTS 用于检查子查询是否至少会返回一行数据。该子查询实际上并不返回任何数据，而是返回值 TRUE 或 FALSE。EXISTS（包括 NOT EXISTS）子句的返回值是一个布尔值。$kp$, section = '' where id = 32436;
update t_knowledge_point set title = $kp$查询结果的计算实例$kp$, content = $kp$SELECT ST.id, ST.name, ST.age, ST.cs, ST.math, (ST.cs+ST.math) AS sum
FROM tb_students AS ST;$kp$, section = '' where id = 32437;
update t_knowledge_point set title = $kp$HAVING 的使用注意事项$kp$, content = $kp$① HAVING 只能用在 GROUP BY 之后，对分组后的结果进行筛选，即使用 HAVING 的前提条件是分组。
② WHERE 一定在 GROUP BY 之前，即也在 HAVING 之前。
③ WHERE 后的条件表达式里不允许使用聚合函数（COUNT()、SUM()、AVG()、MAX()、MIN()），而 HAVING 可以。$kp$, section = '' where id = 32438;
update t_knowledge_point set title = $kp$HAVING 与 WHERE 的区别$kp$, content = $kp$① HAVING 子句用于筛选组，而 WHERE 子句用于筛选记录。
② HAVING 子句中可以使用聚合函数，而 WHERE 子句中不能使用聚合函数。
③ HAVING 子句中不能出现既不被 GROUP BY 子句包含、又不被聚合函数包含的字段，而 WHERE 子句中可以出现任意的字段。
④ HAVING 子句总是和 GROUP BY 子句配合使用，而 WHERE 子句可以不用任何子句的配合。
⑤ 在使用 WHERE 子句或 HAVING 子句都能查询出相同结果时，WHERE 子句放在 GROUP BY 子句之前，而 HAVING 子句放在 GROUP BY 子句之后。$kp$, section = '' where id = 32439;
update t_knowledge_point set title = $kp$分组统计实例$kp$, content = $kp$-- 按性别分组统计人数
SELECT sex, COUNT(sex) AS counts
FROM tb_students
GROUP BY sex;

-- 统计人数超过 100 的性别
SELECT sex, COUNT(sex) AS counts
FROM tb_students
GROUP BY sex
HAVING COUNT(sex) > 100;$kp$, section = '' where id = 32440;
update t_knowledge_point set title = $kp$COUNT 函数统计行数$kp$, content = $kp$COUNT 属于常用聚合函数，用于返回某属性（字段）统计的行数。

```sql
SELECT sex AS 性别, COUNT(sex) AS 人数
FROM 学生表
WHERE sex='男';
```$kp$, section = '' where id = 32441;
update t_knowledge_point set title = $kp$AVG 函数求平均值$kp$, content = $kp$AVG 属于常用聚合函数，用于返回某属性（字段）的平均值。

```sql
-- 男生的数学成绩平均分
SELECT AVG(math) AS 平均成绩
FROM 学生表
WHERE sex='男';
```$kp$, section = '' where id = 32442;
update t_knowledge_point set title = $kp$MAX 函数求最大值$kp$, content = $kp$MAX 属于常用聚合函数，用于返回某属性（字段）的最大值。

```sql
-- 查询年龄最大的学生信息
SELECT * FROM 学生表
WHERE age IN (SELECT MAX(age) FROM 学生表);
```$kp$, section = '' where id = 32443;
update t_knowledge_point set title = $kp$UNION 联合查询的使用注意事项$kp$, content = $kp$UNION 用于合并多条 SELECT 语句的结果，使用时需注意：

① UNION 语句必须由两条或两条以上的 SELECT 语句组成，各 SELECT 语句之间用关键字 UNION 分隔。

② UNION 中每个 SELECT 子句必须包含相同的列、表达式或聚合函数，但各列的排列次序不必相同。

③ 每个 SELECT 子句对应目标列的数据类型必须兼容，不必完全相同，但必须是 MySQL 可以隐含转换的类型，例如不同的数值类型或不同的日期类型。

④ 第一个 SELECT 子句中的目标列名称将作为 UNION 结果集的列名称。

⑤ 联合查询中只能使用一条 ORDER BY 子句或 LIMIT 子句，且必须放在最后一条 SELECT 语句之后。若要对整个 UNION 结果排序或限制，应对单个 SELECT 语句加括号，并把 ORDER BY 或 LIMIT 放在最后。例如：

```sql
(SELECT a FROM tbl_name WHERE a=10 AND b=1)
UNION
(SELECT a FROM tbl_name WHERE a=11 AND b=2)
ORDER BY a LIMIT 10;
```

这种 ORDER BY 不能使用带表名的列引用，即 tbl_name.col_name 形式的名称；可以在第一个 SELECT 语句中为列提供别名并在 ORDER BY 中引用别名，或按列位置引用，首选别名，不建议使用列位置。

⑥ 如果需要显示重复的行，应使用 UNION ALL 而不是 UNION。$kp$, section = '' where id = 32464;
update t_knowledge_point set title = $kp$TIMESTAMP 列自动赋值与 INSERT 的 VALUES 子句$kp$, content = $kp$类型为 timestamp 的列由系统自动赋值。

INSERT 命令的 VALUES 子句包含各列需要插入的数据清单，数据的顺序要与列的顺序相对应。$kp$, section = '' where id = 32477;
update t_knowledge_point set title = $kp$VALUES 子句中值的数据类型要求$kp$, content = $kp$VALUES 子句中的值可以是常量、变量或表达式，也可以是空值 NULL，其数据类型要与对应列的数据类型一致。例如列的数据类型为 int 时，插入 'aaa' 就会出错；数据为字符型时要用单引号括起。$kp$, section = '' where id = 32478;
update t_knowledge_point set title = $kp$SELECT 语句的基本形式$kp$, content = $kp$SQL 语言提供 SELECT 语句进行数据库查询，一次查询的结果可以是多个元组。基本形式为：

```sql
SELECT A1, A2, …, An   -- 目标表的列名或列表达式序列，相当于投影
FROM R1, R2, …, Rm     -- 基本表或视图序列，相当于连接
[WHERE F]              -- F 为条件表达式，相当于选择
```$kp$, section = '' where id = 32482;
update t_knowledge_point set title = $kp$SELECT 查询语句与 SQL 的组成$kp$, content = $kp$数据库查询是数据库的核心操作。SELECT 语句的基本形式为 SELECT A FROM R WHERE F，其中 A 为目标列名或列表达式，R 为基本表或视图，F 为条件表达式。

在 SQL 中查找男生涉及两个操作：投影（SELECT 指定列）和选择（WHERE 条件）。SELECT 后若为 *，表示保留原表的全部列，不进行投影。

SQL 的数据更新包括插入（INSERT）、修改（UPDATE）和删除（DELETE）。SQL 由索引、视图、基本表组成。

视图是一个虚表，只存储定义、不存储数据；CREATE 表示建立。$kp$, section = '' where id = 32485;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30261,30265,30282,30290,30406,30417,30675,30677,30681,30693,30694,30696,30697,30698,30699,30706,30712,30713,30715,30716,30718,30722,30727,30730,30735,30736,30737,30738,30739,30741,30743,30744,31050,31302,31432,31433,31655,31679,31682,31699,31739,31781,31782,31825,31865,31866,31870,31871,31872,31905,32337,32339,32341,32363,32364,32366,32367,32369,32371,32377,32380,32386,32394,32395,32422,32423,32424,32425,32426,32427,32428,32430,32431,32432,32435,32436,32437,32438,32439,32440,32441,32442,32443,32464,32477,32478,32482,32485) and not deleted) <> 88 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
