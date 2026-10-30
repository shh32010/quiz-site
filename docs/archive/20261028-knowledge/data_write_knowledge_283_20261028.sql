-- 知识点 283 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_283
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_283 as
select * from t_knowledge_point where id in (30684,30695,30700,30701,30702,30711,30721,30724,30725,30740,31459,31470,31675,31678,31681,31684,31686,31687,31689,31694,31700,31703,31786,32342,32365,32370,32382,32445,32446,32447,32448,32449,32450,32451,32452,32453,32454,32455,32456,32457,32458,32467,32479,32483,32486);

update t_knowledge_point set title = $kp$创建索引的语法$kp$, content = $kp$在已有的表上创建索引：

```sql
CREATE INDEX 索引名 ON 表名 (列名[长度]);
```

通过修改表结构添加索引：

```sql
ALTER TABLE 表名 ADD INDEX 索引名 (列名);
```$kp$, section = '' where id = 30684;
update t_knowledge_point set title = $kp$视图可以进行更新操作$kp$, content = $kp$视图可以进行更新操作，包括插入、删除和修改。

由于视图是一个虚表，不实际存储数据，所以对视图的更新最终会转换为对基本表的更新。$kp$, section = '' where id = 30695;
update t_knowledge_point set title = $kp$用视图检索基本表中的数据$kp$, content = $kp$通过视图查询可以省略连表操作。

```sql
SELECT cname AS '分类名称', AVG(price) AS '平均价格'
FROM products_category_view
GROUP BY cname;
```$kp$, section = '' where id = 30700;
update t_knowledge_point set title = $kp$索引的类型$kp$, content = $kp$| 索引名称 | 说明 |
| --- | --- |
| 主键索引（PRIMARY KEY） | 唯一性索引，每个表只能有一个主键，用于标识数据表中的每一条记录 |
| 唯一索引（UNIQUE） | 索引列的所有值都只能出现一次，必须唯一 |
| 普通索引（INDEX） | 最常见的索引，作用是加快对数据的访问速度 |

在数据库表中对字段建立索引可以大大提高查询速度。$kp$, section = '' where id = 30701;
update t_knowledge_point set title = $kp$字段控制查询与排序（DISTINCT、ORDER BY）$kp$, content = $kp$查询 emp 表中不重复的薪水档次：

```sql
SELECT DISTINCT sal FROM emp;
```

查询每个员工的薪水与奖金之和。由于部分员工的奖金为 NULL，直接相加结果为 NULL，需用 IFNULL 处理，并给结果起别名 total：

```sql
SELECT *, sal + IFNULL(comm, 0) AS total FROM emp;
```

排序使用 ORDER BY，ASC 为升序（默认值），DESC 为降序。多列排序时依次比较：

```sql
SELECT * FROM emp ORDER BY sal DESC, empno;
```

即 sal 按降序排序，sal 相同时 empno 按升序排序。$kp$, section = '' where id = 30702;
update t_knowledge_point set title = $kp$索引相关选择题（原文损坏）$kp$, content = $kp$题干与选项 OCR 损坏，无法还原原题。可辨识的选项为 LIKE、AGAINST、MATCH、REGEXP，均属 MySQL 的匹配与全文检索关键字。$kp$, section = '' where id = 30711;
update t_knowledge_point set title = $kp$什么是视图$kp$, content = $kp$1. 视图是一种虚拟表。
2. 视图建立在已有表的基础上，这些被依赖的表称为基表。
3. 视图具有表的基本结构，但其内容实际存储在基表中。
4. 视图主要用于查询操作。

视图建立在表的基础上：表存储数据库中的数据，视图只做数据的展示。

通过视图一般不能改变表中数据（视图中数据多为基表列经计算得到，不允许更新）。

删除视图，表不受影响；删除表，视图不再起作用。$kp$, section = '' where id = 30721;
update t_knowledge_point set title = $kp$建表时直接添加主键索引$kp$, content = $kp$```sql
CREATE TABLE 表名 (
  字段名 类型 PRIMARY KEY  -- 主键是唯一性索引，不能为 NULL，不能重复
);
```$kp$, section = '' where id = 30724;
update t_knowledge_point set title = $kp$创建视图$kp$, content = $kp$```sql
CREATE VIEW 视图名 [(column_list)] AS SELECT 语句;
```

- VIEW：表示视图。
- column_list：可选参数，表示属性清单，指定视图中各个属性的名称；默认与 SELECT 语句中查询的属性相同。
- AS：表示视图要执行的操作。
- SELECT 语句：向视图提供数据内容。$kp$, section = '' where id = 30725;
update t_knowledge_point set title = $kp$视图的作用与限制$kp$, content = $kp$视图向用户隐藏了与表无关的复杂连接操作；对视图的更新操作有一定限制；视图不能建索引。$kp$, section = '' where id = 30740;
update t_knowledge_point set title = $kp$视图的基本概念与作用$kp$, content = $kp$视图基本概念：

- 视图是虚拟的表。
- 视图存储的是查询语句，调用时返回相应的结果集。
- 视图既可以创建在基本表上，也可以创建在已有视图上。

视图的作用：

1. 提高重用性，就像一个函数。
2. 对数据库重构时不影响程序运行。
3. 提高安全性能，可以对不同用户设定不同的视图。
4. 让数据更加清晰，想要什么样的数据就创建什么样的视图。$kp$, section = '' where id = 31459;
update t_knowledge_point set title = $kp$建表时创建各类索引$kp$, content = $kp$```sql
CREATE TABLE projectfile (
  id INT AUTO_INCREMENT COMMENT '附件 id',
  fileuploadercode VARCHAR(128) COMMENT '附件上传者 code',
  projectid INT COMMENT '项目 id；此列受 project 表中的 id 列约束',
  filename VARCHAR(512) COMMENT '附件名',
  PRIMARY KEY (id),                                              -- 主键索引
  FOREIGN KEY (projectid) REFERENCES project (id),
  UNIQUE INDEX (projectid),                                      -- 唯一索引
  INDEX (fileuploadercode),                                      -- 普通索引
  FULLTEXT INDEX (fileuploadercode, filename) WITH PARSER ngram   -- 全文索引
) ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT '项目附件表';
```

注意：在全文索引中，n-gram 就是一段文字里连续的 n 个字的序列。$kp$, section = '' where id = 31470;
update t_knowledge_point set title = $kp$普通视图可键入、编辑并设置文本格式$kp$, content = $kp$在普通视图下可以键入、编辑和设置文本格式。普通视图能显示文本格式，但简化了页面布局，以便快速进行文字的键入和编辑。$kp$, section = '' where id = 31675;
update t_knowledge_point set title = $kp$SQL 由索引、视图、基本表组成$kp$, content = $kp$SQL 由索引、视图、基本表组成，也就是说 SQL 语言可以定义视图、基本表和索引。$kp$, section = '' where id = 31678;
update t_knowledge_point set title = $kp$建立视图（CREATE VIEW）$kp$, content = $kp$建立视图使用 CREATE VIEW 语句。$kp$, section = '' where id = 31681;
update t_knowledge_point set title = $kp$页面视图的用途$kp$, content = $kp$页面视图用于编辑页眉和页脚、调整页边距、设置分栏效果，可用于编辑和打印。只有在页面视图中才能看到水平标尺和垂直标尺。$kp$, section = '' where id = 31684;
update t_knowledge_point set title = $kp$普通视图不显示浮动图片$kp$, content = $kp$在普通视图中不显示浮动的图片，即未设置为“嵌入型”环绕方式的图片在视图中看不到。$kp$, section = '' where id = 31686;
update t_knowledge_point set title = $kp$普通视图中不显示分页符$kp$, content = $kp$在普通视图中不显示分页符。$kp$, section = '' where id = 31687;
update t_knowledge_point set title = $kp$大纲视图$kp$, content = $kp$大纲视图用缩进文档标题的形式表示标题在文档结构中的级别。在大纲视图中，能通过拖动标题来移动、复制和重新组织文本；还可以折叠文档查看主要标题，或展开文档查看所有标题以至正文。$kp$, section = '' where id = 31689;
update t_knowledge_point set title = $kp$Web 版式视图$kp$, content = $kp$Web 版式视图模拟文档在浏览器中的显示效果，可以显示背景颜色。$kp$, section = '' where id = 31694;
update t_knowledge_point set title = $kp$Word 视图$kp$, content = $kp$视图就是查看文档的方式。同一个文档可以在不同的视图下查看，虽然显示方式不同，但文档内容不变。Word 提供五种视图：普通视图（草稿）、页面视图、大纲视图、Web 版式视图和阅读视图。

页面视图用于查看打印时文档的外观，可调整页边距、处理分栏和图形对象。$kp$, section = '' where id = 31700;
update t_knowledge_point set title = $kp$大纲视图与母版视图$kp$, content = $kp$大纲视图分为三个窗格：大纲窗格、编辑区、备注区。大纲窗格不能显示图表、图像等内容。

母版视图包括幻灯片母版、讲义母版、备注母版，没有大纲母版。$kp$, section = '' where id = 31703;
update t_knowledge_point set title = $kp$普通视图（草稿）$kp$, content = $kp$普通视图是显示文本格式设置并简化页面布局的视图，便于进行大多数文本编辑和格式设置。在普通视图中不显示页边距、页眉和页脚。$kp$, section = '' where id = 31786;
update t_knowledge_point set title = $kp$视图的特点与定义方式$kp$, content = $kp$1. 视图可由基本表或其他视图导出。
2. 视图是虚表，在数据字典中只保留其逻辑定义，并不存储数据。
3. 视图是提高数据库系统安全性的措施之一。
4. 建立视图的基本形式：CREATE VIEW <视图名>。$kp$, section = '' where id = 32342;
update t_knowledge_point set title = $kp$SQL 数据库的三级体系结构$kp$, content = $kp$最上面一级是“局部模式”，用视图表达（旧称用户模式、子模式或外模式）。局部模式是面向用户使用的二维表模式，用视图实现，即用户查询数据库时主要查询视图，很少查询基本表。

什么是视图：视图是一条 SQL 的 SELECT 查询语句，是从基本表或其他视图中导出的表，因此是“虚表”，仅是一条 SELECT 语句（其执行结果是一张表），并不真正存储数据，可保证数据的安全性。

关于视图的几点：

1. 是 DBMS 提供的、由用户模式观察数据库中数据的重要机制。
2. 可由基本表或其他视图导出。
3. 与基本表不同，只是虚表，不存储数据，也不对应数据库中的文件；基本表才对应存储在数据库中的文件。
4. 可以像对基本表一样对视图进行查询。

这样做的目的是使用户只能看到自己应该看到的部分数据，其他数据不让用户看到或使用，这就是“局部”的含义。

中间一级是“全局模式”，用基本表表达（旧称逻辑模式）。全局模式是应用整体性的二维表模式，包含并存储全部数据，用基本表表达。

最下面一级是“存储模式”，对应存储文件（旧称内模式）。即基本表在硬盘等外存上以文件方式存储表结构及表中数据的格式。$kp$, section = '' where id = 32365;
update t_knowledge_point set title = $kp$建立视图（虚表）的 SQL$kp$, content = $kp$视图对应的就是一条 SELECT 语句，不存储真正的数据；使用到视图的地方，实际上是用该 SELECT 语句代替。

```sql
CREATE VIEW SCORE90
AS
SELECT 姓名, 课程名
FROM 学生, 课程, 选课
WHERE 学生.学号 = 选课.学号 AND 课程.课程号 = 选课.课程号 AND 成绩 >= 90;
```

含义：创建一个名为 SCORE90 的视图（虚表），用上面的 SELECT 语句定义。该语句的执行结果是 90 分及以上学生的姓名与课程名，这张结果表并不真正存在，只是查询的执行结果。$kp$, section = '' where id = 32370;
update t_knowledge_point set title = $kp$视图与基本表的关系$kp$, content = $kp$视图和基本表一样都是关系；视图是从基本表或其他视图导出的表；视图并不直接对应存储在数据库中的文件，实际上是一个虚表。$kp$, section = '' where id = 32382;
update t_knowledge_point set title = $kp$创建视图的语法$kp$, content = $kp$语法：CREATE VIEW 视图名 AS (对视图进行查询)；

实例：创建 v_student1 视图后可直接查询。

```sql
SELECT * FROM v_student1;
```$kp$, section = '' where id = 32445;
update t_knowledge_point set title = $kp$查看视图定义（SHOW CREATE VIEW）$kp$, content = $kp$语法：SHOW CREATE VIEW 视图名；

实例：

```sql
SHOW CREATE VIEW v_student1;
```$kp$, section = '' where id = 32446;
update t_knowledge_point set title = $kp$删除视图（DROP VIEW）$kp$, content = $kp$语法：DROP VIEW [IF EXISTS] 视图名1 [, 视图名2 …];

实例：删除 v_student2 视图。

```sql
DROP VIEW v_student2;
```$kp$, section = '' where id = 32447;
update t_knowledge_point set title = $kp$通过视图查询数据$kp$, content = $kp$使用视图与使用基本表类似，可以进行简单查询、联合查询（UNION）、连接查询，也可以排序、分组等；视图不能进行索引操作。

```sql
SELECT * FROM v_student1;
```$kp$, section = '' where id = 32448;
update t_knowledge_point set title = $kp$不可更新视图的情形$kp$, content = $kp$视图中包含下列任何一种结构时，该视图不可更新：

- 聚合函数
- DISTINCT 关键字
- GROUP BY 子句
- ORDER BY 子句
- HAVING 子句
- UNION 运算符
- 位于选择列表中的子查询
- FROM 子句中包含多个表
- SELECT 语句中引用了不可更新视图
- WHERE 子句中的子查询引用了 FROM 子句中的表$kp$, section = '' where id = 32449;
update t_knowledge_point set title = $kp$WITH CHECK OPTION 子句$kp$, content = $kp$WITH CHECK OPTION 子句会在更新数据时检查数据是否符合视图定义中 WHERE 子句的条件，并且只能和可更新视图一起使用。$kp$, section = '' where id = 32450;
update t_knowledge_point set title = $kp$通过视图插入数据（INSERT）$kp$, content = $kp$语法：INSERT INTO 视图名 (列) VALUES(值);

实例：向 v_temp1 视图插入一条记录。

```sql
INSERT INTO v_temp1(name, age) VALUES('吴越', 19);
```$kp$, section = '' where id = 32451;
update t_knowledge_point set title = $kp$通过视图修改数据（UPDATE）$kp$, content = $kp$语法：UPDATE 视图名 SET 属性名 = 新值 [WHERE 条件];

实例：将 v_temp1 视图中吴越的年龄加 1。

```sql
UPDATE v_temp1 SET age = age + 1 WHERE name = '吴越';
```$kp$, section = '' where id = 32452;
update t_knowledge_point set title = $kp$通过视图删除数据（DELETE）$kp$, content = $kp$语法：DELETE FROM 视图名 [WHERE 条件];

实例：删除 v_temp1 视图中姓名为吴越的记录。

```sql
DELETE FROM v_temp1 WHERE name = '吴越';
```$kp$, section = '' where id = 32453;
update t_knowledge_point set title = $kp$CREATE INDEX 创建索引$kp$, content = $kp$① 创建普通索引

```sql
CREATE INDEX index_name ON table_name (column_list);
```

实例：

```sql
CREATE INDEX idxStuName ON t_temp(name);
```

② 创建 UNIQUE 索引

```sql
CREATE UNIQUE INDEX index_name ON table_name (column_list);
```

实例：

```sql
CREATE UNIQUE INDEX idxID ON t_temp(id);
```

说明：创建主键时会自动为主键添加索引，且该索引为唯一性索引，即主键一定是唯一性索引；但一张表中可以有多个唯一性索引，所以唯一性索引不一定是主键。创建唯一索引的目的不是提高访问速度，而是避免数据出现重复。唯一索引可以有多个，但索引列的值必须唯一，允许有空值。如果能确定某列只包含彼此各不相同的值，建索引时应使用 UNIQUE 关键字将其定义为唯一索引。

③ 创建全文索引

```sql
CREATE FULLTEXT INDEX index_name ON table_name (column_list) WITH PARSER ngram;
```

实例：

```sql
CREATE FULLTEXT INDEX ngram_idx ON articles(title) WITH PARSER ngram;
```$kp$, section = '' where id = 32454;
update t_knowledge_point set title = $kp$布尔模式全文检索（BOOLEAN MODE）$kp$, content = $kp$BOOLEAN MODE 中，+ 表示必须包含，- 表示必须不包含。$kp$, section = '' where id = 32455;
update t_knowledge_point set title = $kp$删除索引（ALTER TABLE DROP INDEX）$kp$, content = $kp$```sql
ALTER TABLE 表名 DROP INDEX 索引名;
```$kp$, section = '' where id = 32456;
update t_knowledge_point set title = $kp$适合建索引的字段$kp$, content = $kp$经常作为查询条件、排序、分组或连接条件的字段适合建索引。索引建立在列上，不能直接对 COUNT()、MAX() 等统计结果建索引。$kp$, section = '' where id = 32457;
update t_knowledge_point set title = $kp$数据重复且分布均匀的字段不适合建索引$kp$, content = $kp$数据重复且分布比较均匀的字段不适合建索引（唯一性太差的字段不适合建索引），例如性别、真假值。$kp$, section = '' where id = 32458;
update t_knowledge_point set title = $kp$BOOLEAN MODE 中 + 与 - 的含义$kp$, content = $kp$BOOLEAN MODE：+ 表示必须包含该词，- 表示必须不包含该词。$kp$, section = '' where id = 32467;
update t_knowledge_point set title = $kp$通过视图更新数据与索引的创建和使用$kp$, content = $kp$通过视图可以向基本表插入、修改和删除数据，但受视图可更新性的限制。

通过视图插入数据

使用 INSERT 语句通过视图向基本表插入数据。

【例】创建视图 jsj_book，视图中包含计算机类图书的信息，并向 jsj_book 视图中插入一条记录：('TP.0837','计算机','Office应用实例','张瑜海','人民邮电出版社','2010-10-21',34.5,NULL,NULL,NULL)。

首先创建视图 jsj_book：

CREATE VIEW jsj_book
AS
SELECT * FROM Book WHERE 图书类别 = '计算机'
WITH CHECK OPTION;

接下来插入记录：

INSERT INTO jsj_book VALUES(
'TP.0837', '计算机', 'Office应用实例', '张瑜海',
'人民邮电出版社', '2010-10-21', 34.5, NULL, NULL, NULL);

通过视图插入数据的限制：视图所依赖的基本表有多个时，不能向该视图插入数据，因为这将会影响多个基本表；插入的数据项应该包含基本表中所有不能为空的列；创建视图时使用了 WITH CHECK OPTION，插入的记录必须满足 WHERE 子句指定的条件。

通过视图修改数据

使用 UPDATE 语句可以通过视图修改基本表的数据。

【例】将 jsj_book 视图中所有单价降低 5%。

UPDATE jsj_book
SET 单价 = 单价 * (1 - 0.05);

该语句实际上是将 jsj_book 视图所依赖的基本表 Book 中所有计算机类图书的单价也都降低了 5%。

若一个视图依赖于多个基本表，则一次修改该视图只能变动一个基本表的数据。

【例】将 jsj_sell 视图中图书编号为 TP.2525 的书名改为“PHP网站制作”，订单号为 5 的订购册数改为 100。

改书名：

UPDATE jsj_sell SET 书名 = 'PHP网站制作' WHERE 图书编号 = 'TP.2525';

改订购册数：

UPDATE jsj_sell SET 订购册数 = 100 WHERE 订单号 = 5;

通过视图删除数据

使用 DELETE 语句可以通过视图删除基本表的数据。

【例】删除 jsj_book 中“中国青年出版社”的记录。

DELETE FROM jsj_book WHERE 出版社 = '中国青年出版社';

对依赖于多个基本表的视图，不能使用 DELETE 语句。例如，不能通过对 jsj_sell 视图执行 DELETE 语句而删除与之相关的基本表 Book 及 Sell 表的数据。

修改视图定义

使用 ALTER VIEW 语句可以对已有视图的定义进行修改。语法格式：

ALTER VIEW 视图名 [(列名列表)]
AS select语句
[WITH [CASCADED | LOCAL] CHECK OPTION]

【例】将 jsj_book 视图修改为只包含计算机类图书的图书编号、书名和单价。

ALTER VIEW jsj_book
AS
SELECT 图书编号, 书名, 单价 FROM Book
WHERE 图书类别 = '计算机';

删除视图

语法格式：DROP VIEW [IF EXISTS] 视图名1 [, 视图名2] ...。使用 DROP VIEW 一次可删除多个视图，例如 DROP VIEW jsj_book, jsj_sell; 即一次删除视图 jsj_book 和 jsj_sell。

索引及其应用

索引是一种提高查找速度的机制。索引用来快速地寻找那些具有特定值的记录：如果没有索引，执行查询时 MySQL 必须从第一个记录开始扫描整个表的所有记录，直至找到符合要求的记录；表里面的记录数量越多，这个操作的代价就越高。

索引提供指针以指向存储在表中指定列的数据值，然后根据指定的排序次序排列这些指针。数据库使用索引的方式与使用书的目录很相似：通过搜索索引找到特定的值，然后跟随指针到达包含该值的行。如果作为搜索条件的列上已经创建了索引，MySQL 无需扫描任何记录即可迅速得到目标记录所在的位置。如果表有 1000 个记录，通过索引查找记录至少要比顺序扫描记录快 100 倍。

索引如何加快查找

没有索引文件时，若要找位于第 10000 条的学号“20070201”的记录，计算机要在表中查找 10000 次。有索引文件时（相当于二分法查找），计算机先在索引文件中找到学号为“20070201”的记录，得到相应的记录号，再到学生表中直接读取相关记录。索引文件记录号对应关系为：20060101 对应 1，20060102 对应 3，20060203 对应 2，20070201 对应 10000，2080999 对应 5000。

索引的分类

1. 普通索引（INDEX）：最基本的索引类型，没有唯一性之类的限制，创建普通索引的关键字是 INDEX。
2. 唯一性索引（UNIQUE）：和普通索引基本相同，但索引列的所有值都只能出现一次，即必须是唯一的，创建唯一性索引的关键字是 UNIQUE。
3. 主键（PRIMARY KEY）：一种唯一性索引，必须指定为 PRIMARY KEY；主键一般在创建表的时候指定，也可以通过修改表的方式加入，但每个表只能有一个主键。
4. 全文索引（FULLTEXT）：MySQL 支持全文检索和全文索引，全文索引的索引类型为 FULLTEXT；全文索引只能在 VARCHAR 或 TEXT 类型的列上创建，并且只能在 MyISAM 表中创建。

创建索引

1）使用 CREATE INDEX 语句可以在一个已有表上创建索引，一个表可以创建多个索引。语法格式：

CREATE [UNIQUE | FULLTEXT] INDEX 索引名
ON 表名(列名[(长度)] [ASC | DESC], ...)

说明：索引名在一个表中必须唯一；长度表示使用列的前多少个字符创建索引，使用列的一部分创建索引可以使索引文件大大减小，从而节省磁盘空间，BLOB 或 TEXT 列必须用前缀索引；UNIQUE 表示创建的是唯一性索引，FULLTEXT 表示创建全文索引；CREATE INDEX 语句并不能创建主键。

【例】根据 Book 表的书名列上的前 6 个字符建立一个升序索引 name_book：

CREATE INDEX name_book
ON Book(书名(6) ASC);

可以在一个索引的定义中包含多个列，中间用逗号隔开，但是它们要属于同一个表，这样的索引叫做复合索引。

【例】在 Sell 表的用户号列和图书编号列上建立一个复合索引 user_bh_sell：

CREATE INDEX user_bh_sell
ON Sell(用户号, 图书编号);

2）使用 ALTER TABLE 语句修改表，其中也包括向表中添加索引。语法格式：

ALTER TABLE 表名
ADD INDEX [索引名] (列名, ...)      /* 添加索引 */
ADD PRIMARY KEY (列名, ...)         /* 添加主键 */
ADD UNIQUE [索引名] (列名, ...)     /* 添加唯一性索引 */
ADD FULLTEXT [索引名] (列名, ...)   /* 添加全文索引 */

【例】在 Book 表的书名列上创建一个普通索引：

ALTER TABLE Book
ADD INDEX (书名);

【例】假设 Book 表中主键未设定，为 Book 表创建以图书编号为主键索引、以出版社和出版时间为复合索引，以加速表的检索速度：

ALTER TABLE Book
ADD PRIMARY KEY(图书编号),
ADD INDEX(出版社, 出版时间);

这个例子中既包括 PRIMARY KEY，也包括复合索引，说明 MySQL 可以同时创建多个索引。使用 PRIMARY KEY 的列必须具有 NOT NULL 属性。查看表中已创建的索引可以使用 SHOW INDEX 语句，例如 SHOW INDEX FROM book;。

3）创建表时创建索引，即在创建表的 CREATE TABLE 语句中包含索引的定义。语法格式：CREATE TABLE 表名 (列名, ..., [索引项])。其中索引项语法格式为：

PRIMARY KEY (列名, ...)                  /* 主键 */
{INDEX | KEY} [索引名] (列名, ...)       /* 索引 */
UNIQUE [INDEX] [索引名] (列名, ...)      /* 唯一性索引 */
[FULLTEXT] [INDEX] [索引名] (列名, ...)  /* 全文索引 */

说明：KEY 通常是 INDEX 的同义词。在定义列选项的时候，也可以将某列定义为 PRIMARY KEY，但当主键是由多个列组成的多列索引时，定义列时无法定义此主键，必须在语句最后加上 PRIMARY KEY (列名, ...) 子句。

【例】创建 sell_copy 表，设置用户号和图书编号为联合主键，并在订购册数列上创建索引：

CREATE TABLE sell_copy (
  用户号 CHAR(18) NOT NULL,
  图书编号 CHAR(20) NOT NULL,
  订购册数 INT(5),
  订购时间 DATETIME,
  PRIMARY KEY(用户号, 图书编号),
  INDEX(订购册数)
);$kp$, section = '' where id = 32479;
update t_knowledge_point set title = $kp$视图的定义与特点$kp$, content = $kp$视图是由基本表或其他视图导出的虚表，在数据字典中只保留其逻辑定义，并不存储数据；视图是提高数据库系统安全性的措施之一。建立视图的基本语句为 CREATE VIEW 视图名 AS 子查询。$kp$, section = '' where id = 32483;
update t_knowledge_point set title = $kp$Word 视图的种类与显示特点$kp$, content = $kp$视图主要涉及对窗口内容的修改：与 Word 标题栏有关的选项都在“视图”菜单中，滚动条（特殊）在“工具→选项”中设置。

视图界面：
1）页面视图：可以分页（用于打印），能看到 Word 文档中所有内容，“所见即所得”。【2006 填空、2009 选择、2012 填空】
2）普通视图：用于文字输入，看不到页边距，有分页符（用于文字录入）。
3）大纲视图：用于缩进。
4）Web 版式视图：应用于网络（考填空题）。

使用软键盘（右击出现）可以输入不同的语言，例如俄文、日文、韩文；如果不需要可以单击 Esc。【2011、2013】

只能看到背景的是 Web 版式视图和页面视图；只能看到水平标尺的是大纲视图和普通视图；只能看到分页符和分行符的是普通视图。$kp$, section = '' where id = 32486;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30684,30695,30700,30701,30702,30711,30721,30724,30725,30740,31459,31470,31675,31678,31681,31684,31686,31687,31689,31694,31700,31703,31786,32342,32365,32370,32382,32445,32446,32447,32448,32449,32450,32451,32452,32453,32454,32455,32456,32457,32458,32467,32479,32483,32486) and not deleted) <> 45 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
