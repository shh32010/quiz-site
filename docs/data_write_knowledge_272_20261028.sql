-- 知识点 272 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_272
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_272 as
select * from t_knowledge_point where id in (30682,30685,30686,30687,30688,30689,30690,30691,30703,30717,30720,30723,30726,30728,30745,30746,30833,30834,31471,31602,31658,31673,31680,31690,31744,31745,31785,31820,31821,31822,31823,31824,31887,31903,31904,31908,31909,31910,31911,31912,31913,31914,31916,31917,31918,32372,32373,32385,32387,32388,32389,32390,32391,32396,32399,32401,32402,32403,32404,32405,32406,32407,32408,32409,32410,32411,32412,32413,32414,32415,32416,32417,32418,32419,32420,32421,32429,32469,32473,32476);

update t_knowledge_point set title = $kp$为学生表添加班级名称字段$kp$, content = $kp$ALTER TABLE t_student ADD classname VARCHAR(50);

语法：alter table 表名 add 列名 类型(长度) [约束];

作用：修改表，添加列。$kp$, section = '' where id = 30682;
update t_knowledge_point set title = $kp$创建与配置数据库$kp$, content = $kp$创建数据库：

create database 数据库名;

查看 MySQL 服务器中的所有数据库：

show databases;

查看某个数据库的定义信息：

show create database 数据库名;

删除数据库：

drop database 数据库名;

切换数据库：

use 数据库名;

查看正在使用的数据库：

select database();$kp$, section = '' where id = 30685;
update t_knowledge_point set title = $kp$常用数据类型与创建表$kp$, content = $kp$MySQL 中常用的数据类型：

| 类型 | 描述 |
| --- | --- |
| int | 整型 |
| double | 浮点型 |
| varchar | 字符串型 |
| date | 日期类型，格式为 yyyy-MM-dd，只有年月日，没有时分秒 |

创建表：

create table 表名(
  字段名 类型(长度) [约束],
  字段名 类型(长度) [约束],
  ...
);

常用类型：varchar(n) 字符串、int 整型、double 浮点、date 日期、timestamp 时间戳。

常用约束：

- primary key 主键：被修饰字段的数据不能重复、不能为 null。
- not null 非空约束。
- unique 唯一约束。
- default 默认约束。$kp$, section = '' where id = 30686;
update t_knowledge_point set title = $kp$查看表结构$kp$, content = $kp$查看表结构：

desc 表名;

修改表结构使用 alter table 语句，可添加列、修改列、删除列和修改表名。$kp$, section = '' where id = 30687;
update t_knowledge_point set title = $kp$删除表和数据库$kp$, content = $kp$删除数据库：

drop database 数据库名;

删除数据库中的表：

drop table 表名;$kp$, section = '' where id = 30688;
update t_knowledge_point set title = $kp$创建数据库、表及增删改语句$kp$, content = $kp$a. 创建数据库：

CREATE DATABASE studentsdb;

b. 修改数据库默认字符集：

ALTER DATABASE studentsdb DEFAULT CHARACTER SET gbk COLLATE gbk_bin;

c. 使用数据库并建表：

USE studentsdb;

CREATE TABLE student_info(
  学号 char(4) NOT NULL PRIMARY KEY,
  姓名 char(8) NOT NULL,
  性别 char(2),
  出生日期 date,
  家庭住址 varchar(50)
);

CREATE TABLE curriculum(
  课程编号 char(4) NOT NULL PRIMARY KEY,
  课程名称 varchar(50),
  学分 int
);

CREATE TABLE grade(
  学号 char(4),
  课程编号 char(4),
  分数 int,
  PRIMARY KEY (学号, 课程编号)
);

d. 插入数据：

INSERT INTO student_info VALUES('1001','李祺','男','1995-8-9','南京市秦淮区户部街8号');

e. 修改数据：

UPDATE student_info SET 性别='女' WHERE 姓名='李祺';

f. 删除数据：

DELETE FROM curriculum WHERE 课程编号='c1001';

g. 为 grade 表添加外键：

alter table grade add constraint fk_s_g foreign key (学号) references student_info(学号);

alter table grade add constraint fk_c_g foreign key (课程编号) references curriculum(课程编号);$kp$, section = '' where id = 30689;
update t_knowledge_point set title = $kp$基于查询语句创建视图$kp$, content = $kp$CREATE VIEW products_category_view
AS SELECT * FROM products p LEFT JOIN category c ON p.category_id = c.cid;$kp$, section = '' where id = 30690;
update t_knowledge_point set title = $kp$将学生表班级名称改为 int 类型$kp$, content = $kp$ALTER TABLE t_student MODIFY classname int;

语法：alter table 表名 modify 列名 类型(长度) [约束];

作用：修改列的类型、长度及约束。$kp$, section = '' where id = 30691;
update t_knowledge_point set title = $kp$将学生表 t_student 改名为 t_students$kp$, content = $kp$RENAME TABLE t_student TO t_students;

语法：rename table 表名 to 新表名;

查看数据库中的所有表：show tables;

删除数据库中的表：drop table 表名;（例如 drop table t_student;）$kp$, section = '' where id = 30703;
update t_knowledge_point set title = $kp$MySQL 数据类型与常用增删改查语句$kp$, content = $kp$## MySQL 常用数据类型

char：固定长度字符串类型，如 char(10) 存 'abc'

varchar：可变长度字符串类型，如 varchar(10) 存 'abc'

text：字符串类型

blob：字节类型

date：日期类型，格式为 yyyy-MM-dd

time：时间类型，格式为 hh:mm:ss

timestamp：时间戳类型 yyyy-MM-dd hh:mm:ss，会自动赋值

datetime：日期时间类型 yyyy-MM-dd hh:mm:ss

## 基本操作（以表 employee 为例）

显示当前数据库中所有表：SHOW TABLES;

查看表的字段信息：DESC employee;

在表中插入一个 image 列，此列为字节类型（插入列时必须指定列的类型）：

ALTER TABLE employee ADD image BLOB;

修改 job 列，使其长度为 60：

ALTER TABLE employee MODIFY job VARCHAR(60);

删除 image 列（一次只能删一列）：

ALTER TABLE employee DROP image;

表名改为 user：

RENAME TABLE employee TO user;

查看表格的创建细节：

SHOW CREATE TABLE employee;

修改表的字符集为 gbk：

ALTER TABLE employee CONVERT TO CHARACTER SET gbk;

列名 name 修改为 username：

ALTER TABLE employee CHANGE name username VARCHAR(100);

删除表：

DROP TABLE employee;

## DML（INSERT、DELETE、UPDATE）

DML 是对表中的数据进行增、删、改的操作。

插入一条记录的语法：

INSERT INTO 表名(字段1,字段2,...) VALUES(值1,值2,...);

插入操作中要注意：字段和值要一一对应，字段相当于 Java 中的形参，值相当于实参；值的数量可以少于字段数，但不能多。插入空值使用 null。插入字符串和日期需要使用单引号括起来。

示例：

CREATE TABLE emp(
  id INT,
  NAME VARCHAR(100),
  gender VARCHAR(10),
  birthday DATE,
  salary FLOAT(10,2),
  entry_date DATE,
  RESUME TEXT
);

INSERT INTO emp(id,NAME,gender,birthday,salary,entry_date,RESUME) VALUES(1,'zhangsan','female','1990-5-10',10000,'2015-5-5','good girl');

INSERT INTO emp(id,NAME,gender,birthday,salary,entry_date,RESUME) VALUES(2,'lisi','male','1995-5-10',10000,'2015-5-5','good boy');

INSERT INTO emp(id,NAME,gender,birthday,salary,entry_date,RESUME) VALUES(3,'wangwu','male','1995-5-10',10000,'2015-5-5','good boy');

SELECT * FROM emp;

批量插入：

INSERT INTO emp VALUES
(4,'zs','m','2015-09-01',10000,'2015-09-01',NULL),
(5,'li','m','2015-09-01',10000,'2015-09-01',NULL),
(6,'ww','m','2015-09-01',10000,'2015-09-01',NULL);

更新语法：

UPDATE 表名 SET 列名1=列值1,列名2=列值2,... WHERE 列名=列值;

将所有员工薪水修改为 5000 元：UPDATE emp SET salary=5000;

将姓名为 'zs' 的员工薪水修改为 3000 元：UPDATE emp SET salary=3000 WHERE name='zs';

将姓名为 'aaa' 的员工薪水修改为 4000 元、job 改为 ccc：UPDATE emp SET salary=4000,job='ccc' WHERE name='aaa';

将 wu 的薪水在原有基础上增加 1000 元（MySQL 中没有 += 运算符）：UPDATE emp SET salary=salary+1000 WHERE name='wu';

删除语法：DELETE FROM 表名 （WHERE 列名=值）;

删除表中名称为 'zs' 的记录：DELETE FROM emp WHERE name='zs';

删除表中所有记录：DELETE FROM emp;

使用 TRUNCATE 彻底删除表中记录（不常用，太危险）：TRUNCATE TABLE emp;

TRUNCATE 与 DELETE 的不同在于：TRUNCATE 是 DROP 掉数据表后重新创建新表，执行速度快，但删除的数据无法恢复；DELETE 只删除表中数据，表结构还在，数据可以找回。

## DQL（SELECT）

执行 DQL 语句不会改变数据，而是让数据库把结果集发送给客户端，查询返回的结果集是一张虚拟表。

基本语法：

SELECT selection_list /*要查询的列名称*/
FROM table_list /*要查询的表名称*/
WHERE condition /*行条件*/
GROUP BY grouping_columns /*对结果分组*/
HAVING condition /*分组后的行条件*/
ORDER BY sorting_columns /*对结果排序*/
LIMIT offset_start, row_count /*结果限定*/

基础查询，查询所有列：

SELECT * FROM emp;

查询指定列：

SELECT empno,ename FROM emp;

条件查询在 WHERE 子句中可以使用如下运算符及关键字：

=、!=、<>、<、<=、>、>=

BETWEEN…AND、IN(set)、IS NULL、IS NOT NULL、AND、OR、NOT

说明：<> 与 != 作用完全相同，只是 <> 出现得更早；BETWEEN…AND 还可以查日期的范围；IN 中的参数为查询范围，各值之间用逗号隔开；IS NULL 用于判断空值，与之相对的是 IS NOT NULL。$kp$, section = '' where id = 30717;
update t_knowledge_point set title = $kp$添加主键索引与唯一索引$kp$, content = $kp$修改表结构添加主键索引：

ALTER TABLE 表名 ADD PRIMARY KEY(列名);

创建表时直接添加唯一索引：

CREATE TABLE 表名(
  列名 类型(长度),
  UNIQUE [索引名称] (列名)
);

在已有表上用 create 语句创建索引：

create unique index 索引名 on 表名(列名(长度));$kp$, section = '' where id = 30720;
update t_knowledge_point set title = $kp$数据库与表的常用操作语句$kp$, content = $kp$创建数据库：create database 数据库名;

删除数据库：drop database 数据库名;

创建表：

create table grade (
  sno char(4) primary key,
  sname varchar(2),
  sage tinyint(1),
  grade tinyint(1)
);

修改列定义：alter table t1 change a b integer;

修改表名：alter table a rename to b;

复制表：create table 新表 as select * from 被复制表;

删除表：drop table t1;（表结构和数据一起删除）

仅清空表内容：delete from t1; 或 truncate table t1;

显示表结构：desc 表名;

显示所有表：show tables;$kp$, section = '' where id = 30723;
update t_knowledge_point set title = $kp$表的增删改查基本语句$kp$, content = $kp$删除列：alter table t1 drop column a;

添加列：alter table t1 add column sno char(6) null;

删除一行：delete from t1 where 条件;

添加一行：insert into grade (sno, sname, sage, grade) values ('1900', 'jack', 26, 99);

修改数据：update grade set dept = '计数' where sname = '三毛';

查询整张表内容：select * from t1;

为查询列指定别名：select sname as '姓名' from grade where score >= 70;$kp$, section = '' where id = 30726;
update t_knowledge_point set title = $kp$域完整性$kp$, content = $kp$域完整性是针对某一具体关系数据库的约束条件，它保证表中某些列不能输入无效的值。域完整性指列的值域的完整性，如数据类型、格式、值域范围、是否允许空值等。

域完整性约束：数据类型、非空约束（NOT NULL）、默认约束（DEFAULT）、检查约束（CHECK，MySQL 不支持）。$kp$, section = '' where id = 30728;
update t_knowledge_point set title = $kp$非空约束 NOT NULL$kp$, content = $kp$约束添加在一个字段的定义中，限定该字段不能为 null。$kp$, section = '' where id = 30745;
update t_knowledge_point set title = $kp$默认值约束 DEFAULT$kp$, content = $kp$约束添加在一个字段的定义中，约定该字段的默认填充值为 DEFAULT 后的内容。插入数据时，如果想使用默认值，值处填写 DEFAULT，否则填写具体的值。

可以在创建表时直接给字段添加默认值，也可以在创建表后添加：

ALTER TABLE user ADD COLUMN gender CHAR(3) DEFAULT '男';$kp$, section = '' where id = 30746;
update t_knowledge_point set title = $kp$将班级名称字段改为 classid int$kp$, content = $kp$ALTER TABLE t_student CHANGE classname classid int;

语法：alter table 表名 change 旧列名 新列名 类型(长度) [约束];

作用：修改列名，同时可修改类型和约束。$kp$, section = '' where id = 30833;
update t_knowledge_point set title = $kp$删除学生表中的 classid 列$kp$, content = $kp$ALTER TABLE t_student DROP classid;

语法：alter table 表名 drop 列名;

作用：修改表，删除列。$kp$, section = '' where id = 30834;
update t_knowledge_point set title = $kp$用 ALTER TABLE 和 CREATE INDEX 创建索引$kp$, content = $kp$一、ALTER TABLE 创建索引

① 创建普通索引：

ALTER TABLE table_name ADD INDEX index_name (column_list);

实例：ALTER TABLE t_temp ADD INDEX idxName(name);

② 创建 UNIQUE 索引：

ALTER TABLE table_name ADD UNIQUE (column_list);

实例：ALTER TABLE t_temp ADD UNIQUE (id);

二、CREATE INDEX 创建索引

① 创建普通索引：

CREATE INDEX index_name ON table_name (column_list);

实例：CREATE INDEX idxStuName ON t_temp(name);

② 创建 UNIQUE 索引：

CREATE UNIQUE INDEX index_name ON table_name (column_list);

实例：CREATE UNIQUE INDEX idxID ON t_temp(id);

③ 创建全文索引：

CREATE FULLTEXT INDEX index_name ON table_name (column_list) WITH PARSER ngram;

实例：CREATE FULLTEXT INDEX ngram_idx ON articles(title) WITH PARSER ngram;$kp$, section = '' where id = 31471;
update t_knowledge_point set title = $kp$SQL 的特点$kp$, content = $kp$SQL 之所以能够为用户和业界所接受并成为国际标准，是因为它是一个综合的、功能极强同时又简洁易学的语言。SQL 集数据查询（data query）、数据操纵（data manipulation）、数据定义（data definition）和数据控制（data control）功能于一体，其主要特点包括以下几部分。$kp$, section = '' where id = 31602;
update t_knowledge_point set title = $kp$创建二维表$kp$, content = $kp$创建二维表使用 CREATE TABLE 语句。$kp$, section = '' where id = 31658;
update t_knowledge_point set title = $kp$引用完整性约束（外键）$kp$, content = $kp$外键值可以重复，也可以为 NULL（未设置 NOT NULL 时）；非空的外键值必须在被参照表的主键中存在。$kp$, section = '' where id = 31673;
update t_knowledge_point set title = $kp$DDL 数据定义语言（CREATE）$kp$, content = $kp$DDL 数据定义语言。

① 关键字：CREATE。
② 功能：建立基本表或者视图。$kp$, section = '' where id = 31680;
update t_knowledge_point set title = $kp$大纲视图中的文本组织$kp$, content = $kp$在大纲视图中通过拖动标题来移动、复制和重新组织文本。$kp$, section = '' where id = 31690;
update t_knowledge_point set title = $kp$引用完整性：外键可以为空$kp$, content = $kp$外键可以为空；外键取值受到约束，非空值必须等于被参照表中某个主键值。$kp$, section = '' where id = 31744;
update t_knowledge_point set title = $kp$DDL 的关键字与功能$kp$, content = $kp$DDL 数据定义语言

① 关键字：CREATE
② 功能：建立基本表、视图、索引。$kp$, section = '' where id = 31745;
update t_knowledge_point set title = $kp$外键的定义$kp$, content = $kp$如果表 A 的主关键字是表 B 中的字段，则该字段称为表 B 的外键，表 A 称为主表，表 B 称为从表。$kp$, section = '' where id = 31785;
update t_knowledge_point set title = $kp$TINYINT 类型$kp$, content = $kp$TINYINT（很小的整数）：1 字节；有符号范围 -128~127，无符号范围 0~255。$kp$, section = '' where id = 31820;
update t_knowledge_point set title = $kp$SMALLINT 类型$kp$, content = $kp$SMALLINT（小的整数）：2 字节；有符号范围 -32768~32767，无符号范围 0~65535。$kp$, section = '' where id = 31821;
update t_knowledge_point set title = $kp$MEDIUMINT 类型$kp$, content = $kp$MEDIUMINT（中等的整数）：3 字节；有符号范围 -8388608~8388607，无符号范围 0~16777215。$kp$, section = '' where id = 31822;
update t_knowledge_point set title = $kp$INT 与 INTEGER 类型$kp$, content = $kp$INT 或 INTEGER（标准或普通大小的整数）：4 字节；有符号范围 -2147483648~2147483647，无符号范围 0~4294967295。$kp$, section = '' where id = 31823;
update t_knowledge_point set title = $kp$BIGINT 类型$kp$, content = $kp$BIGINT（大整数）：8 字节；有符号范围 -9223372036854775808~9223372036854775807，无符号范围 0~18446744073709551615。$kp$, section = '' where id = 31824;
update t_knowledge_point set title = $kp$列的数据类型$kp$, content = $kp$每个表列都有相应的数据类型，它限制（或容许）该列中存储的数据。

示例表结构：

| 名 | 类型 | 长度 |
| --- | --- | --- |
| id | int | 11 |
| name | varchar | 255 |
| sex | varchar | 255 |
| age | int | 11 |
| bdate | datetime | 0 |$kp$, section = '' where id = 31887;
update t_knowledge_point set title = $kp$一次删除多列$kp$, content = $kp$删除多列时不可以省略 COLUMN：

ALTER TABLE 表名
  DROP COLUMN 列名1,
  DROP COLUMN 列名2,
  ...
  DROP COLUMN 列名n;$kp$, section = '' where id = 31903;
update t_knowledge_point set title = $kp$添加外键约束的语法$kp$, content = $kp$语法：

ALTER TABLE 表名 ADD [CONSTRAINT 约束名] FOREIGN KEY(外键属性名) REFERENCES 主表名(属性名);$kp$, section = '' where id = 31904;
update t_knowledge_point set title = $kp$修改表名的语法$kp$, content = $kp$语法：

ALTER TABLE 原表名 RENAME TO|AS 新表名;

RENAME TABLE 原表名 TO 新表名;$kp$, section = '' where id = 31908;
update t_knowledge_point set title = $kp$在表首添加列$kp$, content = $kp$语法：ALTER TABLE 表名 ADD [COLUMN] 列名 数据类型 FIRST;

实例：在 tb_students 表中添加 id 列，类型是 CHAR(11)。

ALTER TABLE tb_students ADD COLUMN id CHAR(11) FIRST;$kp$, section = '' where id = 31909;
update t_knowledge_point set title = $kp$在指定列之后添加列$kp$, content = $kp$语法：ALTER TABLE 表名 ADD [COLUMN] 列名 数据类型 AFTER 已有列名;

实例：在 tb_students 表中添加 age 列，类型是 INT(11)，位置在 name 之后。

ALTER TABLE tb_students ADD COLUMN age INT(11) AFTER name;$kp$, section = '' where id = 31910;
update t_knowledge_point set title = $kp$修改列的列名和类型$kp$, content = $kp$语法：ALTER TABLE 表名 CHANGE 原列名 新列名 新数据类型;

实例：将学生表 tb_students 中的 sex 列改名为 sSex，类型为 CHAR(2)，允许为 NULL，默认值为 '男'。

ALTER TABLE tb_students CHANGE sex sSex CHAR(2) NULL DEFAULT '男';$kp$, section = '' where id = 31911;
update t_knowledge_point set title = $kp$修改列的类型长度$kp$, content = $kp$语法：ALTER TABLE 表名 MODIFY [COLUMN] 字段名 数据类型(修改后的长度);

实例：将学生表 tb_students 中的 sID 列类型修改为 CHAR(11)。

ALTER TABLE tb_students MODIFY COLUMN sID char(11);$kp$, section = '' where id = 31912;
update t_knowledge_point set title = $kp$修改列位置$kp$, content = $kp$语法：ALTER TABLE 表名 MODIFY 列名 数据类型 FIRST | AFTER 已有列名;

实例：

将 tb_students 表中 id 字段移到第一个列位置。

ALTER TABLE tb_students MODIFY id INT(11) FIRST;

将 tb_students 表中 sex 字段修改到 phone 列之后。

ALTER TABLE tb_students MODIFY sex VARCHAR(30) AFTER phone;$kp$, section = '' where id = 31913;
update t_knowledge_point set title = $kp$删除列$kp$, content = $kp$删除一列时可以省写 COLUMN。

ALTER TABLE 表名 DROP [COLUMN] 列名;$kp$, section = '' where id = 31914;
update t_knowledge_point set title = $kp$添加候选键（唯一）约束$kp$, content = $kp$语法：ALTER TABLE 表名 ADD [CONSTRAINT 约束名] UNIQUE KEY(字段名);$kp$, section = '' where id = 31916;
update t_knowledge_point set title = $kp$删除候选键约束的实例$kp$, content = $kp$实例：删除班级表 tb_class 的字段 className 上定义的候选键约束。

如果没有给候选键命名，DROP INDEX 子句后面写定义候选键的字段名：

ALTER TABLE tb_class DROP INDEX className;

如果使用 CONSTRAINT 子句给候选键命名，DROP INDEX 子句后面写约束名：

ALTER TABLE tb_class DROP INDEX UQ_class;$kp$, section = '' where id = 31917;
update t_knowledge_point set title = $kp$使用 ALTER TABLE 创建索引$kp$, content = $kp$修改表结构时创建索引：

ALTER TABLE table_name ADD [UNIQUE | FULLTEXT | SPATIAL] [INDEX | KEY] [index_name] (col_name[length,...]) [ASC | DESC];

① 创建普通索引

语法：ALTER TABLE table_name ADD INDEX index_name (column_list);

实例：ALTER TABLE t_temp ADD INDEX idxName(name);

② 创建 UNIQUE 索引

语法：ALTER TABLE table_name ADD UNIQUE (column_list);

实例：ALTER TABLE t_temp ADD UNIQUE (id);$kp$, section = '' where id = 31918;
update t_knowledge_point set title = $kp$创建二维表使用什么 SQL 语句$kp$, content = $kp$使用 CREATE TABLE 语句。CREATE 意为创建，TABLE 意为表格。

示例：CREATE TABLE 学生 (……);

含义：创建一个二维表，表名为学生，表中包含若干属性。

补充：关系模式 R(A1,…,An) 只说明了关系的结构（即语法），并非每个符合语法的元组都是 R 的元组，因为属性值及属性之间的关系在语义上受到约束；加在数据库上的语义条件称为完整性约束。$kp$, section = '' where id = 32372;
update t_knowledge_point set title = $kp$用户定义的完整性约束$kp$, content = $kp$用户自己规定的约束。

示例：选课关系用二维表表示为：

| 学号 | 课程号 | 成绩 |
| --- | --- | --- |
| A001 | C001 | 90 |
| A001 | C002 | 70 |
| A002 | C001 | 85 |

用户在该表上定义约束：成绩属性的值必须在 0 到 100 之间。$kp$, section = '' where id = 32373;
update t_knowledge_point set title = $kp$创建表、修改表、删除表的语句$kp$, content = $kp$创建表：CREATE TABLE 表名;

修改表：ALTER TABLE 表名;

删除表：DROP TABLE 表名;$kp$, section = '' where id = 32385;
update t_knowledge_point set title = $kp$常见的几种约束$kp$, content = $kp$常见的约束有：主键约束、外键约束、检查约束、唯一约束、默认约束。

约束在 CREATE TABLE 或 ALTER TABLE 时添加。$kp$, section = '' where id = 32387;
update t_knowledge_point set title = $kp$主键约束$kp$, content = $kp$PRIMARY KEY(主键字段) 保证实体完整性。一个表只能有一个主键，但一个主键可以包含多个字段；主键字段不能为空。$kp$, section = '' where id = 32388;
update t_knowledge_point set title = $kp$唯一约束$kp$, content = $kp$UNIQUE(约束字段) 保证实体完整性。一个表可以有多个唯一约束，一个唯一约束可以包含多个字段。$kp$, section = '' where id = 32389;
update t_knowledge_point set title = $kp$外键约束$kp$, content = $kp$FOREIGN KEY(外键字段) REFERENCES 主键表(主键字段) 保证引用完整性。一个表可以有多个外键。$kp$, section = '' where id = 32390;
update t_knowledge_point set title = $kp$默认值约束$kp$, content = $kp$DEFAULT 默认值的表达式或 NULL FOR 字段名，保证域完整性。一个表可以有多个默认值约束，但一个字段只有一个默认值。$kp$, section = '' where id = 32391;
update t_knowledge_point set title = $kp$常量定义 const 示例$kp$, content = $kp$const unsigned short U_COUNT = 100U;
const int SUM = 9999;
const long L_INDEX = 999999L;
const unsigned long UL_INDEX = 999999UL;$kp$, section = '' where id = 32396;
update t_knowledge_point set title = $kp$表中记录的条数与查询优化$kp$, content = $kp$一个表中可以有 0 或多条记录。数据量越大，查询速度越慢，可以通过合理使用索引、选择合适的数据类型等方式优化查询速度。$kp$, section = '' where id = 32399;
update t_knowledge_point set title = $kp$创建数据库示例$kp$, content = $kp$示例：

CREATE DATABASE myDB;

执行结果：Query OK, 1 row affected。

创建后可在数据库列表中看到 information_schema、mysql、performance_schema、schooldb、sys 等系统数据库和用户数据库。$kp$, section = '' where id = 32401;
update t_knowledge_point set title = $kp$命令行创建数据库应指定字符集$kp$, content = $kp$如果是 cmd 命令行创建数据库，最好指定字符集，否则后面建表时若有中文默认值容易报错。例如：

sex VARCHAR(2) DEFAULT '男'

运行报错：ERROR 1067 (42000): Invalid default value for 'sex'，此时需要修改字符集配置信息。$kp$, section = '' where id = 32402;
update t_knowledge_point set title = $kp$MySQL 创建数据库常用字符集编码$kp$, content = $kp$创建数据库时常用字符集编码，图中列出的均为各字符集对应的默认排序规则。查看字符集编码的方法见“查看字符集编码”一节。$kp$, section = '' where id = 32403;
update t_knowledge_point set title = $kp$查看创建数据库的语句及编码$kp$, content = $kp$SHOW CREATE DATABASE test;

执行结果：

| Database | Create Database |
| --- | --- |
| test | CREATE DATABASE test /*!40100 DEFAULT CHARACTER SET utf8 */ |

1 row in set (0.00 sec)$kp$, section = '' where id = 32404;
update t_knowledge_point set title = $kp$查看数据库编码$kp$, content = $kp$SHOW VARIABLES LIKE '%char%';

执行结果示例：

| Variable_name | Value |
| --- | --- |
| character_set_client | gbk |
| character_set_connection | gbk |
| character_set_database | latin1 |
| character_set_filesystem | binary |
| character_set_results | gbk |
| character_set_server | latin1 |
| character_set_system | utf8 |$kp$, section = '' where id = 32405;
update t_knowledge_point set title = $kp$查看所有数据库的实例$kp$, content = $kp$在系统 CMD 命令行界面执行：

mysql> show databases;

| Database |
| --- |
| information_schema |
| gb1231db |
| mysql |
| performance_schema |
| schooldb |
| sys |
| test |
| utf8dbtest |

8 rows in set (0.00 sec)

在 Navicat 软件的命令行界面中执行同一语句，结果相同。$kp$, section = '' where id = 32406;
update t_knowledge_point set title = $kp$VARCHAR 类型$kp$, content = $kp$VARCHAR 为可变长度字符串类型，可以设置最大长度，适合用在长度可变的属性。

VARCHAR(M)：可变长的字符数据类型，用于保存以文本格式存储的信息。M 表示最大列长度，范围是 0~65535。$kp$, section = '' where id = 32407;
update t_knowledge_point set title = $kp$MySQL 日期和时间类型$kp$, content = $kp$| 数据类型 | 字节数 | 取值范围 | 日期格式 | 零值 |
| --- | --- | --- | --- | --- |
| YEAR | 1 | 1901~2155 | YYYY | 0000 |
| DATE | 4 | 1000-01-01~9999-12-31 | YYYY-MM-DD | 0000-00-00 |
| TIME | 3 | -838:59:59~838:59:59 | HH:MM:SS | 00:00:00 |
| DATETIME | 8 | 1000-01-01 00:00:00~9999-12-31 23:59:59 | YYYY-MM-DD HH:MM:SS | 0000-00-00 00:00:00 |
| TIMESTAMP | 4 | 1970-01-01 00:00:01~2038-01-19 03:14:07 | YYYY-MM-DD HH:MM:SS | 0000-00-00 00:00:00 |

DATETIME：日期和时间的组合，支持的范围是 1000-01-01 00:00:00 至 9999-12-31 23:59:59。MySQL 以 YYYY-MM-DD HH:MM:SS 格式显示 DATETIME 值，但允许使用字符串或数字为其赋值。

TIMESTAMP：MySQL 5.7 中默认取值范围为 1970-01-01 00:00:01 UTC 至 2038-01-19 03:14:07 UTC，精确到秒，约 22 亿个数值，因此内部用 4 个字节的整型存放。

YEAR[2|4]：两位或四位格式的年，默认四位格式。四位格式允许值为 1901~2155 和 0000；两位格式允许值为 70~69（即 0~99），表示 1970 年~2069 年。

| 输入的数据 | 数据库存储的值 |
| --- | --- |
| 0 或 00 或 000 或 0000 | 2000 |
| 1~69 | 2001~2069 |
| 70~99 | 1970~1999 |
| 1901~2155 | 1901~2155 |
| 其他 | 报错：1264 - Out of range value for column 'year' at row 1 |$kp$, section = '' where id = 32408;
update t_knowledge_point set title = $kp$默认值示例$kp$, content = $kp$sSex varchar(255) NOT NULL DEFAULT '男' COMMENT '性别'$kp$, section = '' where id = 32409;
update t_knowledge_point set title = $kp$自动增长 AUTO_INCREMENT$kp$, content = $kp$在 MySQL 中，设置为 AUTO_INCREMENT 的列默认初始值为 1。当向该列插入 NULL 值或数字 0 时，该列的值会被设置为当前表中该列的最大值加 1（默认每次加 1 递增）。每个表只能定义一个 AUTO_INCREMENT 列，并且必须在该列上定义主键约束（PRIMARY KEY）或唯一键约束（UNIQUE）。$kp$, section = '' where id = 32410;
update t_knowledge_point set title = $kp$创建表及查看表结构实例$kp$, content = $kp$CREATE TABLE t_department(
  sPart INT(11) NOT NULL COMMENT '编号',
  sPartName VARCHAR(255) NOT NULL COMMENT '院系名称',
  PRIMARY KEY (sPart)
);

CREATE TABLE t_students(
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  sNo INT(11) NOT NULL COMMENT '学号',
  sName VARCHAR(255) NOT NULL COMMENT '姓名',
  sSex VARCHAR(255) NOT NULL DEFAULT '男' COMMENT '性别',
  sDate DATETIME NOT NULL COMMENT '出生日期',
  sMask VARCHAR(255) DEFAULT NULL COMMENT '备注',
  sPartNo INT(11) NOT NULL COMMENT '院系',
  PRIMARY KEY (id),
  FOREIGN KEY (sPartNo) REFERENCES t_department(sPart)
);

查看表与表结构：

- SHOW TABLES [{FROM | IN} db_name]; 查看指定数据库中所有数据表的名称。
- DESCRIBE/DESC 表名，或 SHOW COLUMNS {FROM | IN} 表名 [{FROM | IN} db_name]; 查看表的基本结构，包括字段名、数据类型、是否允许为空、是否为主键、是否有默认值。
- SHOW CREATE TABLE 表名; 查看创建表时的 CREATE TABLE 语句，同时可看到存储引擎和字符编码。$kp$, section = '' where id = 32411;
update t_knowledge_point set title = $kp$修改表名与添加新属性$kp$, content = $kp$修改表名实例：

ALTER TABLE t_students RENAME TO t_students1;

添加新属性：

ALTER TABLE 表名 ADD [COLUMN] 新字段名 数据类型 [约束条件] [FIRST | AFTER 已有字段名];

- [约束条件]：用于指定字段取值不为空、字段的默认值、主键以及候选键约束。
- [FIRST | AFTER 已有字段名]：FIRST 表示将新字段添加到指定已有字段的前面，AFTER 表示添加到其后面；若省略这两个参数，新字段默认添加到数据表的最后一列。$kp$, section = '' where id = 32412;
update t_knowledge_point set title = $kp$添加新属性（默认添加到最后一列）$kp$, content = $kp$语法：ALTER TABLE 表名 ADD [COLUMN] 列名 数据类型;

实例：在 tb_students 表中添加 sMask 列，类型为 VARCHAR(255)。

ALTER TABLE tb_students ADD COLUMN sMask VARCHAR(255);$kp$, section = '' where id = 32413;
update t_knowledge_point set title = $kp$修改属性 CHANGE、ALTER、MODIFY 子句$kp$, content = $kp$CHANGE 子句：可同时修改表中指定列的名称和数据类型，支持同时添加多个 CHANGE [COLUMN] 子句，彼此之间用逗号分隔。

ALTER TABLE 表名 CHANGE [COLUMN] 原字段名 新字段名 数据类型 [约束条件];

ALTER 子句：可以修改或删除表中指定列的默认值。

ALTER TABLE 表名 ALTER [COLUMN] 字段名 {SET | DROP} DEFAULT 默认值;

MODIFY 子句：与 CHANGE 子句不同，MODIFY 只修改指定列的数据类型，不改变列名；并且可以通过 FIRST 或 AFTER 关键字修改指定列在表中的位置。

ALTER TABLE 表名 MODIFY [COLUMN] 字段名 数据类型 [约束条件] [FIRST | AFTER 已有字段名];$kp$, section = '' where id = 32414;
update t_knowledge_point set title = $kp$设置、删除列的默认值$kp$, content = $kp$语法：ALTER TABLE 表名 ALTER [COLUMN] 字段名 {SET | DROP} DEFAULT;

实例：

将 tb_students 的字段 className 的默认值修改为“智狐精英班”。

ALTER TABLE tb_students ALTER className SET DEFAULT '智狐精英班';

将 tb_students 的字段 age 的默认值删除。

ALTER TABLE tb_students ALTER age DROP DEFAULT;$kp$, section = '' where id = 32415;
update t_knowledge_point set title = $kp$添加主键约束实例$kp$, content = $kp$实例：给学生表 tb_students 中的 sId 列添加主键约束。

ALTER TABLE tb_students ADD PRIMARY KEY (sId);$kp$, section = '' where id = 32416;
update t_knowledge_point set title = $kp$删除主键约束实例$kp$, content = $kp$实例：删除学生表 tb_students 中的主键约束。

ALTER TABLE tb_students DROP PRIMARY KEY;$kp$, section = '' where id = 32417;
update t_knowledge_point set title = $kp$添加外键约束实例$kp$, content = $kp$实例：在学生表 tb_students 的 class 列上创建外键，参照班级表 tb_class 的 ID 列。

ALTER TABLE tb_students ADD FOREIGN KEY(class) REFERENCES tb_class(ID);

也可先为外键命名：

ALTER TABLE tb_students ADD CONSTRAINT FK_class FOREIGN KEY(class) REFERENCES tb_class(ID);$kp$, section = '' where id = 32418;
update t_knowledge_point set title = $kp$删除外键约束实例$kp$, content = $kp$实例：删除学生表 tb_students 上的 FK_class 外键约束。

ALTER TABLE tb_students DROP FOREIGN KEY FK_class;$kp$, section = '' where id = 32419;
update t_knowledge_point set title = $kp$添加候选键约束实例$kp$, content = $kp$实例：在班级表 tb_class 的 className 字段上定义候选键约束。

ALTER TABLE tb_class ADD CONSTRAINT UQ_class UNIQUE KEY (className);

删除候选键约束时，MySQL 实际删除的是唯一性索引，应使用 DROP INDEX 子句；如果没有给约束命名，MySQL 自动将字段名作为索引名。$kp$, section = '' where id = 32420;
update t_knowledge_point set title = $kp$修改约束的方法与删除表$kp$, content = $kp$完整性约束不能直接修改。若要修改某个约束，实际上是用 ALTER TABLE 语句先删除该约束，然后再增加一个与该约束同名的新约束。

删除表：

DROP TABLE [IF EXISTS] 表1[, 表2]...;

- 可同时删除多个表，表名之间用逗号分隔。
- 不加 IF EXISTS 时，删除不存在的表会提示错误 ERROR 1051 (42S02): Unknown table '表名'；加上 IF EXISTS 后，删除不存在的表时语句仍可顺利执行，但会发出警告。
- 该命令会删除表的描述、完整性约束、索引以及与表相关的权限。$kp$, section = '' where id = 32421;
update t_knowledge_point set title = $kp$表中具有上下级关系的字段$kp$, content = $kp$一个表中具有上司与下属关系的字段，比如员工表中存在一个经理字段，表示员工的上司。这种外键参照本表的主键，属于自参照。$kp$, section = '' where id = 32429;
update t_knowledge_point set title = $kp$删除不存在的数据库时的报错$kp$, content = $kp$执行删除操作时若出现如下提示，说明删除失败，无法删除 drop_database 数据库：

mysql> DROP DATABASE drop_database;
ERROR 1008 (HY000): Can't drop database 'drop_database'; database doesn't exist$kp$, section = '' where id = 32469;
update t_knowledge_point set title = $kp$图书实体的属性与主码$kp$, content = $kp$实体集图书的属性有：图书编号、图书类别、书名、作者、出版社、出版时间、单价、数量、折扣、封面图片。

图书实体集中可用图书编号唯一标识图书，所以主码为图书编号。$kp$, section = '' where id = 32473;
update t_knowledge_point set title = $kp$创建数据库与数据表的方法$kp$, content = $kp$创建数据库可采用图形界面工具方式或命令行方式。

命令行创建数据库：

CREATE DATABASE 数据库名;

数据库名必须符合以下规则：

- 数据库名必须唯一；
- 名称内不能含有“/”“.”等非法字符；
- 最大不能超过 64 字节。

示例：创建名为 Bookstore 的数据库。

CREATE DATABASE Bookstore;
Query OK, 1 row affected

注意：MySQL 中每条 SQL 语句都以“;”作为结束标志。

显示数据库：

SHOW DATABASES;

| Database |
| --- |
| information_schema |
| bookstore |
| gygl1 |
| mysql |
| phpmyadmin |
| test |
| test1 |
| test2 |
| xscj |

9 rows in set (0.00 sec)

打开数据库：

USE 数据库名;

该语句也用于从一个数据库切换到另一个数据库。用 CREATE DATABASE 创建数据库后，该数据库不会自动成为当前数据库，需要用 USE 指定。例如：USE test1;

修改、删除数据库：

ALTER DATABASE 数据库名 [DEFAULT] CHARACTER SET 字符集 [DEFAULT] COLLATE 校对规则;

示例：修改数据库 Pet 的默认字符集为 latin1，校对规则为 latin1_swedish_ci。

ALTER DATABASE Pet
  DEFAULT CHARACTER SET latin1
  DEFAULT COLLATE latin1_swedish_ci;

DROP DATABASE 数据库名;

例如：DROP DATABASE test2;

数据库表结构分析（图书目录表）：

| 图书编号 | 类别 | 书名 | 出版时间 | 单价 | 数量 |
| --- | --- | --- | --- | --- | --- |
| tp.4235 | 计算机 | 跟我学网页设计 | 2009-09-10 | 23.50 | 12 |
| tp.3361 | 计算机 | 网页编程技术 | 2008-10-01 | 54.15 | 23 |
| tp.0731 | 计算机 | 数据库应用技术 | 2007-06-10 | 33.23 | 31 |

book1 表结构分析：

| 字段名 | 字段类型 | 宽度 | 是否为空 | 默认值 | 说明 |
| --- | --- | --- | --- | --- | --- |
| 图书编号 | char | 10 | × | | 主键，采用 10 位字符编号 |
| 类别 | char | 8 | × | 计算机 | 2~4 个汉字 |
| 书名 | varchar | 40 | × | | 不超过 40 个字符 |
| 出版时间 | date | | × | | |
| 单价 | float | 5,2 | √ | | 以元为单位，精确到分 |
| 数量 | int | | √ | | |

MySQL 常用数据类型：

- 字符串类型：char(n)、varchar(n)
- 数值类型：int、float(M,D)
- 时间类型：date、time、datetime
- 大数据类型：blob、text

命令行方式创建数据库表的最基本格式：

CREATE TABLE 表名
(字段名 数据类型 [NOT NULL | NULL], ...);

示例：创建表 book。

CREATE TABLE book(
  图书编号 char(10) NOT NULL,
  类别 varchar(8) NOT NULL DEFAULT '计算机',
  书名 varchar(40) NOT NULL,
  出版时间 date NOT NULL,
  单价 float(5,2) NULL,
  数量 int NULL
);

修改表：ALTER TABLE 用于更改原有表的结构，例如增加或删减列、创建或取消索引、更改列的类型、重命名列或表，还可以更改表的评注和表的类型。

ALTER TABLE 表名
  ADD 列定义;                        /* 添加列 */
ALTER TABLE 表名
  ALTER 列名 {SET DEFAULT 默认值 | DROP DEFAULT};  /* 修改默认值 */
ALTER TABLE 表名
  CHANGE 旧列名 列定义;               /* 对列重命名 */
ALTER TABLE 表名
  DROP 列名;                         /* 删除列 */
ALTER TABLE 表名
  RENAME 新表名;                      /* 重命名该表 */

示例：

- 在表 book 中增加一列“浏览次数”：ALTER TABLE book ADD 浏览次数 int null;
- 删除 book 表中“浏览次数”列：ALTER TABLE book DROP 浏览次数;
- 将 book 表中“出版时间”列改为“出版日期”列：ALTER TABLE book CHANGE 出版时间 出版日期 date not null;

复制表：

CREATE TABLE 新表名 LIKE 参照表名;
CREATE TABLE 新表名 AS (SELECT 语句);

- 使用 LIKE 关键字创建一个与参照表结构相同的新表，但不复制内容，因此新表是空表。
- 使用 AS 关键字可以复制表的内容，但索引和完整性约束不会被复制。

示例：

CREATE TABLE book_copy1 LIKE Book;
CREATE TABLE book_copy2 AS (SELECT * FROM Book);

删除表：

DROP TABLE [IF EXISTS] 表名1[, 表名2]...;

该命令将表的描述、完整性约束、索引以及和表相关的权限全部删除。

示例：

USE XSCJ;
DROP TABLE IF EXISTS test;

数据插入：

INSERT [INTO] 表名[(列名,...)] VALUES ({表达式 | DEFAULT},...),(...),...;

如果要给全部列插入数据，列名可以省略；如果只给部分列插入数据，需要指定这些列，未指出的列根据列默认值或相关属性确定。$kp$, section = '' where id = 32476;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30682,30685,30686,30687,30688,30689,30690,30691,30703,30717,30720,30723,30726,30728,30745,30746,30833,30834,31471,31602,31658,31673,31680,31690,31744,31745,31785,31820,31821,31822,31823,31824,31887,31903,31904,31908,31909,31910,31911,31912,31913,31914,31916,31917,31918,32372,32373,32385,32387,32388,32389,32390,32391,32396,32399,32401,32402,32403,32404,32405,32406,32407,32408,32409,32410,32411,32412,32413,32414,32415,32416,32417,32418,32419,32420,32421,32429,32469,32473,32476) and not deleted) <> 80 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
