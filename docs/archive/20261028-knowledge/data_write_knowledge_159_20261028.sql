-- 知识点 159 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_159
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_159 as
select * from t_knowledge_point where id in (22271,22514,23535,23618,23649,23668,23701,23731,23742,23743,23798,23826,23827,23828,23903,23904,23905,23927,23928,23989,24004,24005,24007,24008,24012,24023,24064,24073,24606,25047,25056,25057,25069,25079,25109,25110,25328,25595,26324,26325,26326,26327,26329,26330,26331,26332,26333,26334,26335,26336,26338,26340,26346,26347,26491,26511,26528,26545,26552,26554,26555,26604,26607,26609,26836,26837,27595,27656,27683,28360,29724,29783,29792,29825,29826,29827,29828,29829,29830,29833,29849,29850,29851,29852,29855,29863,29868,29870,29871,29872,29873,29874,29918,29922,29976,29988,30246,32060,32392);

update t_knowledge_point set title = $kp$数据管理技术的发展$kp$, content = $kp$计算机数据管理技术的发展可划分为三个阶段：人工管理阶段、文件系统阶段、数据库系统阶段。

文件系统阶段：用户根据应用需要，将数据按其内容、结构和用途组成若干文件并存储在外存中，由操作系统统一管理，操作系统为用户使用文件提供相应的界面。不同用户编制程序，对各自定义的文件进行处理。由于文件系统中数据的组织面向用户程序，因此存在大量数据冗余（多个数据文件中重复出现相同的数据），且数据在文件中的结构很难修改和扩充；数据结构的任一微小改变都会影响到应用程序。文件由各用户独立定义，不能反映现实世界中事物相互之间原本存在的联系。

数据库系统阶段：数据不再仅仅服务于某个程序或用户，而是按一定的结构存储于数据库，作为共享资源，由一个称为数据库管理系统的软件管理，使数据能为尽可能多的应用服务。该阶段以统一管理和共享数据为主要特征，具体工作由数据库管理系统（Data Base Management System，简称 DBMS）实现。$kp$, section = '' where id = 22271;
update t_knowledge_point set title = $kp$查询实例$kp$, content = $kp$数据库（DB）中包含学生登记表 S、课程开设表 C、学生选课成绩表 SC。

学生登记表 S：

| SNO | SNAME | DEPART | SEX | BDATE | HEIGHT |
| --- | --- | --- | --- | --- | --- |
| A041 | 周光明 | 自动控制 | 男 | 1990.8.10 | 1.7 |
| C005 | 张雷 | 计算机 | 男 | 1991.6.30 | 1.75 |
| C008 | 王宁 | 计算机 | 女 | 1990.8.20 | 1.62 |
| M038 | 李霞霞 | 应用数学 | 女 | 1992.10.20 | 1.65 |
| R098 | 钱欣 | 管理工程 | 男 | 1990.5.16 | 1.8 |

学生选课成绩表 SC：

| SNO | CNO | GRADE |
| --- | --- | --- |
| A041 | CC112 | 92 |
| A041 | ME234 | 92.5 |
| A041 | MS211 | 90 |
| C005 | CC112 | 84.5 |
| C005 | CS202 | 82 |
| M038 | ME234 | 85 |
| R098 | CS202 | 75 |
| R098 | MS211 | 70.5 |

① 单表查询：查询所有男学生的情况。

SELECT *
FROM S
WHERE SEX='男'；

查询输出：

| SNO | SNAME | DEPART | SEX | BDATE | HEIGHT |
| --- | --- | --- | --- | --- | --- |
| A041 | 周光明 | 自动控制 | 男 | 1990.8.10 | 1.7 |
| C005 | 张雷 | 计算机 | 男 | 1991.6.30 | 1.75 |
| R098 | 钱欣 | 管理工程 | 男 | 1990.5.16 | 1.8 |

② 连接查询（查询同时涉及两个以上的表）：查询每个男学生及其选修课程的情况，要求列出学生名、系别、选修课程名及成绩。

SELECT SNAME，DEPART，CNAME，GRADE
FROM S，C，SC
WHERE S.SNO=SC.SNO AND SC.CNO=C.CNO AND S.SEX='男'；

查询输出：

| SNAME | DEPART | CNAME | GRADE |
| --- | --- | --- | --- |
| 张雷 | 计算机 | 软件工程 | 84.5 |
| 张雷 | 计算机 | 数据库 | 82 |
| 周光明 | 自动控制 | 软件工程 | 92 |
| 周光明 | 自动控制 | 数学分析 | 92.5 |
| 周光明 | 自动控制 | 人工智能 | 90 |
| 钱欣 | 管理工程 | 数据库 | 75 |
| 钱欣 | 管理工程 | 人工智能 | 70.5 |

网页输出：以表格形式按系别列出男学生的姓名、所选课程及成绩，并统计每人的选课门数和平均成绩。$kp$, section = '' where id = 22514;
update t_knowledge_point set title = $kp$数据库运行和维护的内容$kp$, content = $kp$在保证信息系统正常运行的前提下，为提高系统运行的有效性而对系统的硬件、软件和文档所做的修改和完善，都称为系统维护。

系统维护的内容一般有：纠正性维护、适应性维护、完善性维护。$kp$, section = '' where id = 23535;
update t_knowledge_point set title = $kp$数据库试运行$kp$, content = $kp$在数据库试运行时，主要测试系统的性能指标，分析其是否达到设计目标。$kp$, section = '' where id = 23618;
update t_knowledge_point set title = $kp$SQL 的数据更新$kp$, content = $kp$（1）插入语句（INSERT）

语句格式为：

INSERT INTO <表名>（<列名>，…）
VALUES（<值>，…）

（2）修改语句（UPDATE）

语句格式为：

UPDATE <表名>
SET <列名>=<值>［，<列名>=<值>］…
［WHERE <条件>］$kp$, section = '' where id = 23649;
update t_knowledge_point set title = $kp$删除数据（DELETE）$kp$, content = $kp$SQL 删除语句的格式为：

DELETE FROM <表名>［WHERE <条件>］

该语句的功能是从指定表中删除满足 WHERE 子句条件的记录。如果省略 WHERE 子句，则删除表中所有记录。

注意：仅删除表中记录，表的定义仍在数据字典中。$kp$, section = '' where id = 23668;
update t_knowledge_point set title = $kp$分布式数据库系统$kp$, content = $kp$数据共享和数据集中管理是数据库的主要特征。但面对应用规模扩大、用户地理位置分散的实际情况，如果一个单位的计算机仍采用联网式的集中数据库系统，将会产生很多问题：各个用户结点计算机都要通过网络存取数据，通信开销太大、延迟明显；一旦数据库不能工作，还将导致整个系统瘫痪，系统的可用性和可扩充性难以保证。$kp$, section = '' where id = 23701;
update t_knowledge_point set title = $kp$并行数据库系统$kp$, content = $kp$需求：随着应用领域数据库规模的增长，其运行负荷日益加重，对数据库系统性能的要求也越来越高。

技术：计算机系统通过并行地使用多个 CPU 和磁盘，可提高处理速度和 I/O 速度。并行处理技术很适宜与关系数据库技术相结合：在关系模型中，数据库二维表是元组的集合，数据库操作也是集合操作；许多情况下对集合的操作可分解为一系列对子集的操作，这些子集操作存在很好的并行性。$kp$, section = '' where id = 23731;
update t_knowledge_point set title = $kp$关系数据库$kp$, content = $kp$关系数据模型是以集合论中的关系概念为基础发展起来的数据模型。由于这种模型建立在严格的数学理论基础上，其概念清晰、简洁，能够用同一的结构表示实体集和它们之间的联系，因此当今大多数数据库都支持关系数据模型。$kp$, section = '' where id = 23742;
update t_knowledge_point set title = $kp$关系数据库标准语言 SQL$kp$, content = $kp$数据库语言：数据库管理系统配置的、使用户可以对数据库进行各式各样操作的语言，构成用户和数据库的接口。由于 DBMS 所提供的语言一般局限于对数据库的操作，不同于计算机的程序设计语言，因而称它为数据库语言。关系数据库语言是一种非过程语言。

SQL（Structured Query Language）：一种基于关系代数和关系演算之间的语言。非过程语言有别于过程语言，即对用户而言只要说明“做什么”、指出需要何类数据，至于“如何做”才能获得这些数据，则不必要求用户说明，而由系统来实现。$kp$, section = '' where id = 23743;
update t_knowledge_point set title = $kp$数据库访问$kp$, content = $kp$① 什么是“数据库访问”：用户向数据库系统（DBS）发出查询命令（SQL），DBS 返回查询结果。

② 如何进行“数据库访问”：通过 DBMS，使用数据库语言（SQL）。

例：查询“男学生选课成绩表”

SELECT SNAME，DEPART，CNAME，GRADE
FROM S，C，SC
WHERE S.SEX='男' ……

③ “数据库访问”的方式：

使用“SQL 命令”：直接访问数据库；
使用“SQL 程序”：C/S 模式的数据库访问；
使用“SQL 表单”：C/S 模式的数据库访问。$kp$, section = '' where id = 23798;
update t_knowledge_point set title = $kp$SQL 的数据查询$kp$, content = $kp$数据库查询是数据库的核心操作，SQL 语言提供了 SELECT 语句进行数据库查询。

SELECT 查询语句的简单形式为：

SELECT A1，A2，…，An（指出目标表的列名或列表达式序列，做投影操作）
FROM R1，R2，…，Rm（指出基本表或视图序列，做连接操作）
［WHERE F］（F 为条件表达式）
［GROUP BY 列名序列］（结果表分组）
［ORDER BY 列名［排序方向］…］（结果表排序）

ASC 为升序，DESC 为降序。$kp$, section = '' where id = 23826;
update t_knowledge_point set title = $kp$SQL 视图示例$kp$, content = $kp$数据库（DB）中有学生登记表 S、学生选课成绩表 SC、课程开设表 C，视图可由这些基本表导出。

例如，建立管理工程系学生视图 ME_S 的语句为：

CREATE VIEW ME_S AS
SELECT SNO，SNAME，SEX，BDATE，HEIGHT
FROM S
WHERE DEPART='管理工程'；

该视图的内容为管理工程系学生的学号、姓名、性别、出生日期和身高，如 R098 钱欣、男、1990.5.16、1.8。

视图定义后，用户就可以像对基本表操作一样对视图进行查询。例如在管理工程系学生视图中找年龄大于 25 岁的学生，其 SQL 语句为：

SELECT SNAME，2008-YEAR(BDATE)
FROM ME_S
WHERE 2008-YEAR(BDATE)>25；$kp$, section = '' where id = 23827;
update t_knowledge_point set title = $kp$SQL 语言的功能$kp$, content = $kp$SQL 语言功能分为四部分：

数据定义（DDL）：CREATE、ALTER；
数据查询（DQL）：SELECT；
数据操纵（DML）：INSERT、UPDATE、DELETE；
数据控制（DCL）：GRANT、REVOKE。

数据库运行管理包括安全、完整、并发、恢复。$kp$, section = '' where id = 23828;
update t_knowledge_point set title = $kp$信息系统中的数据库访问（一）$kp$, content = $kp$① 什么是“数据库访问”：用户发出查询命令（SQL），由数据库系统（DBS）执行并返回查询结果。

② 如何进行“数据库访问”：通过 DBMS，使用数据库语言（SQL）。

例：查询“男学生选课成绩表”

SELECT SNAME，DEPART，CNAME，GRADE
FROM S，C，SC
WHERE S.SEX='男' ……$kp$, section = '' where id = 23903;
update t_knowledge_point set title = $kp$信息系统中的数据库访问（二）$kp$, content = $kp$使用“SQL 命令”直接访问数据库：用户向 DBMS 发出查询 SQL 命令，DBMS 在学生登记表、学生选课成绩表、课程开设表等数据的基础上返回查询结果。

男学生选课成绩查询结果示例：

| 姓名 | 系别 | 选课名 | 成绩 |
| --- | --- | --- | --- |
| 张雷 | 计算机 | 软件工程 | 84.5 |
| 张雷 | 计算机 | 数据库 | 82 |
| 周光明 | 自动控制 | 软件工程 | 92 |
| 周光明 | 自动控制 | 数学分析 | 92.5 |
| 周光明 | 自动控制 | 人工智能 | 90 |
| 钱欣 | 管理工程 | 数据库 | 75 |
| 钱欣 | 管理工程 | 人工智能 | 70.5 |$kp$, section = '' where id = 23904;
update t_knowledge_point set title = $kp$信息系统中的数据库访问（三）$kp$, content = $kp$信息系统提供相应的图形用户界面（菜单、按钮、窗口和对话框等），用户按需输入。例如教务管理系统中的学生选课成绩分类统计，可按系别、学期、性别分类统计。

这需要软件开发人员将实现上述功能的语句（即命令）编制成应用程序，存入程序文件；在用户访问数据库时，系统调用并运行该程序。

查询结果的展示方面，向用户提供包括更多信息的可视界面。例如列出每个男生的选课成绩，要求系统自动统计选课门数、计算每人平均成绩，并按照用户设计的表格格式显示。$kp$, section = '' where id = 23905;
update t_knowledge_point set title = $kp$关系数据库语言 SQL 查询实例$kp$, content = $kp$以学生登记表 S、课程开设表 C、学生选课成绩表 SC 为例：

① 单表查询，查询所有男学生的情况：SELECT * FROM S WHERE SEX='男'。

② 连接查询（查询同时涉及两个以上的表），查询每个男学生及其选修课程的情况：SELECT SNAME，DEPART，CNAME，GRADE FROM S，C，SC WHERE S.SNO=SC.SNO AND SC.CNO=C.CNO AND S.SEX='男'。

③ 网页输出：将查询结果以表格形式在网页上显示。$kp$, section = '' where id = 23927;
update t_knowledge_point set title = $kp$关系数据库语言 SQL 的特点$kp$, content = $kp$① 是一种“非过程语言”，也是“结构化语言”；
② 体现关系模型在结构、完整性和操作方面的特征；
③ 有命令和嵌入程序两种使用方式；
④ 功能齐全，简洁易学，使用方便；
⑤ 为主流 DBMS 产品（如 ORACLE、Sybase、DB2、SQL Server 等）所支持。$kp$, section = '' where id = 23928;
update t_knowledge_point set title = $kp$分布式数据库的应用需求$kp$, content = $kp$① 数据库要为多用户（分散远程）服务，用户与数据库不在同一台计算机上，必须通过网络访问数据库。
② 相关查询的二维表存储在多台计算机的多个不同数据库中，要求用“SQL 命令”访问不同的数据库。$kp$, section = '' where id = 23989;
update t_knowledge_point set title = $kp$数据分布方式$kp$, content = $kp$划分式：数据按其用途和来源分布在各个结点上，彼此之间没有任何重复。

全重复式：每个结点拥有全部数据的一个复本。

部分重复式：根据需要，有些数据只部分存放在某一结点上，有些数据重复分布到多个结点上。$kp$, section = '' where id = 24004;
update t_knowledge_point set title = $kp$数据分布问题$kp$, content = $kp$数据分布需要解决的主要问题：

保持多复本一致性；
保持分布一致性；
全局查询的处理；
分布事务的管理。$kp$, section = '' where id = 24005;
update t_knowledge_point set title = $kp$数据库体系结构的发展$kp$, content = $kp$DBS 运行在计算机系统之上，其体系结构与计算机体系结构密切相关，因此 DBS 的系统结构也随着硬件和软件支撑环境的变化而不断演变。

① 集中式数据库系统。早期的 DBMS 以分时操作系统作为运行环境，采用集中式的数据库系统结构，把数据库建立在本单位的主计算机上，且不与其他计算机系统进行数据交互。在这种系统中，不但数据是集中的，数据的管理也是集中的。$kp$, section = '' where id = 24007;
update t_knowledge_point set title = $kp$数据库基础$kp$, content = $kp$在人工方式管理的企业中，业务人员根据业务工作的需要设计各种形式的票据、账簿和报表，如企业的合同、发票、入库单、出库单等，它们是企业存储、传输数据的载体，也是人工系统组织、管理企业数据的途径。建立信息系统后，企业的各类数据存放在计算机中，并通过专门的软件进行存取。

在企业数据的输入、存储和按一定要求加工输出的数据处理过程中，必须解决如何按用户要求组织数据的逻辑存储结构、如何将逻辑存储结构转换成计算机物理存储结构，以及如何根据需要准确、迅速地存取数据等问题，这些都是数据库技术研究的主要内容。$kp$, section = '' where id = 24008;
update t_knowledge_point set title = $kp$数据库系统设计概要$kp$, content = $kp$信息系统设计最重要的核心技术是软件工程和基于数据库系统（DBS）的设计技术。

DBS 设计的输入包括应用部门的信息需求、应用部门的处理需求以及计算机环境（硬件、操作系统、DBMS 等），输出为各类数据模式和应用程序。$kp$, section = '' where id = 24012;
update t_knowledge_point set title = $kp$新应用领域的需求$kp$, content = $kp$新的数据库应用领域的特点：大量数据、复杂结构、历史数据管理与重用。

新的数据库应用领域的需求：存储和处理复杂对象，其内部结构复杂，很难用普通的关系结构来表示，相互之间的联系也是复杂多样的语义；支持复杂的数据类型，如抽象数据类型、半结构数据类型、时间和版本数据类型、用户自定义类型等。$kp$, section = '' where id = 24023;
update t_knowledge_point set title = $kp$本章考点与难点$kp$, content = $kp$第 1 章考察的是数据库和信息系统及其开发的基础知识。由于转本考生对数据库的实际操作较少，普遍对数据库的概念难以理解，因此对数据库基本概念的理解是本章的难点。

本章考点大约 10 分，考点和题型固定。考纲中关于通信技术基础的题目结合实际放在《计算机应用基础》的第四章计算机网络部分。

重点把握关系数据库的约束条件、关系运算、SQL 常见语句等。另外，计算机信息系统的分类、信息系统的开发和应用是近三年的热点，关于软件生命周期和结构化生命周期法是转本考试的趋势题，考生需熟悉转本考试正确的理论范围并加以理解，掌握典型考题。$kp$, section = '' where id = 24064;
update t_knowledge_point set title = $kp$系统实施$kp$, content = $kp$系统实施的任务：实现系统设计阶段提出的数据逻辑结构、存储结构和软件结构，按实施方案完成一个可实际运行的信息系统，交付用户使用。

具体工作：

① 按系统逻辑结构和物理结构，用关系 DBMS 的 SQL 语言编制源代码，调试产生目标模式，并将数据载入数据库；
② 功能程序设计，按软件结构设计提出的模块要求进行程序编码、编译、联接以及测试的工作。$kp$, section = '' where id = 24073;
update t_knowledge_point set title = $kp$插入语句（INSERT）$kp$, content = $kp$插入语句可将一个记录插入到指定的表中。语句格式为：

INSERT INTO <表名>（<列名>，…）
VALUES（<值>，…）$kp$, section = '' where id = 24606;
update t_knowledge_point set title = $kp$SQL 数据定义$kp$, content = $kp$SQL 提供数据定义语言（DDL），它包括定义基本表、修改基本表、删除基本表、建立和删除索引、建立和删除视图等。

定义基本表的 SQL 语句表示为：

CREATE TABLE <表名>
（<列名> <数据类型>［完整性约束条件］，……）

其中［ ］表示可含有该子句，也可为空，视实际定义要求而定；<表名> 是所要定义的基本表名字。$kp$, section = '' where id = 25047;
update t_knowledge_point set title = $kp$SQL 的数据查询语句$kp$, content = $kp$数据库查询是数据库的核心操作，SQL 语言提供了 SELECT 语句进行数据库查询。

SELECT 查询语句的简单形式为：

SELECT A1，A2，…，An（指出目标表的列名或列表达式序列）
FROM R1，R2，…，Rm（指出基本表或视图序列）
［WHERE F］（F 为条件表达式）
［GROUP BY 列名序列］（结果表分组）
［ORDER BY 列名［排序方向］…］（结果表排序）$kp$, section = '' where id = 25056;
update t_knowledge_point set title = $kp$修改语句（UPDATE）$kp$, content = $kp$修改语句可对指定表中已有数据进行修改。语句格式如下：

UPDATE <表名>
SET <列名>=<值>［，<列名>=<值>］…
［WHERE <条件>］$kp$, section = '' where id = 25057;
update t_knowledge_point set title = $kp$数据库控制$kp$, content = $kp$数据库控制：使数据库中的数据安全可靠、正确有效，以保证整个数据库系统的正常运转。

数据库的安全性控制。安全性是指保护数据库以防止不合法的使用所造成的数据泄露、修改和破坏。

数据库的备份与恢复。

数据库的完整性控制。在数据库中，数据的正确性、合理性及相容性（一致性）称为数据的完整性。

数据库的并发控制。数据库管理系统（DBMS）运行的基本工作单位是事务，它相当于操作系统中的进程。一个事务由应用程序中的一组操作序列组成，包括一系列的数据库操作语言。实际上，事务可以看作是一个原子，是一个不可分割的操作序列，事务中包括的所有操作要么都执行，要么都不执行。$kp$, section = '' where id = 25069;
update t_knowledge_point set title = $kp$SQL 的视图$kp$, content = $kp$视图是 DBMS 所提供的一种以用户模式观察数据库中数据的重要机制。视图可由基本表或其他视图导出，视图只是一个虚表。

SQL 语言用 CREATE VIEW 语句建立视图，其一般格式为：

CREATE VIEW <视图名>［（<列名>，…）］AS <子查询>

视图定义后，用户就可以像对基本表操作一样对视图进行查询。$kp$, section = '' where id = 25079;
update t_knowledge_point set title = $kp$SQL 视图的定义$kp$, content = $kp$① 视图是 DBMS 提供的一种由用户观察数据库中数据的重要机制。
② 视图可由基本表或其他视图导出。
③ 视图只是一个虚表，而不作为一个表实际存储数据。

SQL 用 CREATE VIEW 语句建立视图，其格式为：

CREATE VIEW <视图名>［（<列名>，…）］AS <子查询>$kp$, section = '' where id = 25109;
update t_knowledge_point set title = $kp$SQL 视图的定义$kp$, content = $kp$① 视图是 DBMS 提供的一种由用户观察数据库中数据的重要机制。
② 视图可由基本表或其他视图导出。
③ 视图只是一个虚表，而不作为一个表实际存储数据。

SQL 用 CREATE VIEW 语句建立视图，其格式为：

CREATE VIEW <视图名>［（<列名>，…）］AS <子查询>$kp$, section = '' where id = 25110;
update t_knowledge_point set title = $kp$SQL 语言知识梳理$kp$, content = $kp$一、SQL 的组成

SQL 是一种关系数据库语言，即关系数据库操作语言。

DDL（数据定义语言）：CREATE 等，包括修改基本表、删除基本表、建立索引、删除索引、建立视图、删除视图（必考）。
DCL（数据控制语言）：COMMIT、LOCK。
DML（数据操纵语言）：SELECT、INSERT、UPDATE、DELETE，即查询、插入、更新（修改/删除）。

二、SQL 的特点

由索引、视图、基本表组成；非过程性语言；接近英语的语言；主流 DBMS 软件均以支持 SQL 的方式提供给用户使用；SQL 语句可嵌入程序设计语言（如 C、C++）或动态网页脚本语言（如 ASP）。

三、SQL 视图

视图对应用户模式（外模式）。特点：视图和基本表都是关系；是 DBMS 为用户观察数据库中的数据所提供的一种重要机制；从一个或多个基本表或其他表导出；创建语句为 CREATE VIEW。

四、SQL 的数据查询

SELECT 查询语句的特点：一次查询的结果是若干行记录。

形式：
SELECT A1，A2，…，An（指出查询结果的列）；
FROM R1，R2，…，Rm（指出查询的表）；
WHERE F（可省略，F 为条件表达式，相当于筛选操作）。

SELECT 对应投影运算，对列操作；FROM 对应连接运算，为二元运算；WHERE 对应选择运算，对行按条件筛选。

五、SQL 的更新语句

插入语句：INSERT；
修改语句：UPDATE，省略 WHERE 子句则修改表中的所有记录；
删除语句：DELETE，省略 WHERE 子句则删除表中所有记录。

六、SQL 语句示例

1) 显示输出学生表的姓名：SELECT 学号，姓名 FROM 学生；
2) 显示输出学生表的所有内容：SELECT * FROM 学生；
3) 查询输出学生表中男生的学号、姓名、性别：SELECT 学号，姓名，性别 FROM 学生 WHERE 性别='男'；
4) 查询输出学生表的学号、姓名、性别，并按学号降序排序：SELECT 学号，姓名，性别 FROM 学生 ORDER BY 学号 DESC；
5) 创建二维表：CREATE TABLE；
6) 创建视图：CREATE VIEW；
7) 插入语句：INSERT 可将一个记录插入到指定的表中；
8) 更改语句：UPDATE 对指定表中已有数据进行修改；
9) 删除语句：如果省略 WHERE 子句，则删除表中所有元组，只保留表的结构，如 DELETE FROM C 删除 C 表中所有元组。$kp$, section = '' where id = 25328;
update t_knowledge_point set title = $kp$关系数据库系统概述$kp$, content = $kp$1、数据：数据（data）是事实或观察的结果，是对客观事物的逻辑归纳，是用于表示客观事物的未经加工的原始素材。

2、数据模型：数据模型是数据库中非常核心的内容。一般来讲，数据模型是严格定义的一组概念的集合，这些概念精确地描述了系统的静态特征（数据结构）、动态特征（数据操作）和完整性约束条件，这就是数据模型的三要素。因此数据模型通常由数据结构、数据操作和完整性约束三要素构成。

外模式、模式和内模式是数据库系统的三级模式结构。

数据模型的种类：数据模型是信息模型在数据世界中的表示形式，通常可将数据模型分为三类：

（1）层次模型：一种用树形结构描述实体及其之间关系的数据模型。
（2）网状模型：一个结点可以同时拥有多个双亲结点和子结点关系的数据模型。
（3）关系模型：采用二维表格结构表达实体类型及实体间联系的数据模型，其基本假定是所有数据都表示为数学上的关系。
（4）面向对象模型：一种新兴的数据模型，采用面向对象的方法来设计数据库。面向对象的数据库以对象为单位存储数据，每个对象包含对象的属性和方法，具有类和继承等特点。$kp$, section = '' where id = 25595;
update t_knowledge_point set title = $kp$关系数据库语言 SQL$kp$, content = $kp$结构化查询语言（Structured Query Language，SQL）是关系数据库的标准语言，也是一个通用的、功能极强的关系数据库语言。其功能不仅仅是查询，还包括数据库模式创建、数据库数据的插入与修改、数据库安全性、完整性定义与控制等一系列功能。$kp$, section = '' where id = 26324;
update t_knowledge_point set title = $kp$SQL 的产生与发展$kp$, content = $kp$SQL 是在 1974 年由 Boyce 和 Chamberlin 提出的，最初叫 Sequel，并在 IBM 公司研制的关系数据库管理系统原型 System R 上实现。由于 SQL 简单易学、功能丰富，深受用户及计算机工业界欢迎，因此被各数据库厂商采用。经各公司的不断修改、扩充和完善，SQL 得到业界的认可。1986 年 10 月，美国国家标准局（American National Standard Institute，ANSI）的数据库委员会 X3H2 批准 SQL 作为关系数据库语言的美国标准，同年公布了 SQL 标准文本（简称 SQL-86）。1987 年，国际标准化组织（International Organization for Standardization，ISO）也通过了这一标准。

SQL 标准自公布以来随数据库技术的发展而不断发展、不断丰富。2008 年、2011 年又对 SQL2003 做了一些修改和补充。SQL 标准的内容越来越丰富，也越来越复杂：SQL99 合计超过 1700 页；SQL-86 和 SQL-89 都是单个文档；SQL-92 和 SQL99 已经扩展为一系列开放的部分，例如 SQL-92 除 SQL 基本部分外还增加了 SQL 调用接口、SQL 永久存储模块，而 SQL99 则进一步扩展为框架、SQL 基础部分、SQL 调用接口、SQL 永久存储模块、SQL 宿主语言绑定、SQL 外部数据的管理和 SQL 对象语言绑定等多个部分。

目前，没有一个数据库系统能够支持 SQL 标准的所有概念和特性。大部分数据库系统能支持 SQL-92 标准中的大部分功能以及 SQL99、SQL2003 中的部分新概念。同时，许多软件厂商对 SQL 基本命令集还进行了不同程度的扩充和修改，使其可以支持标准以外的一些功能特性。$kp$, section = '' where id = 26325;
update t_knowledge_point set title = $kp$综合统一$kp$, content = $kp$数据库系统的主要功能是通过数据库支持的数据语言来实现的。

非关系模型（层次模型、网状模型）的数据语言一般都分为：①模式数据定义语言（Schema Data Definition Language，模式 DDL）；②外模式数据定义语言（Subschema Data Definition Language，外模式 DDL 或子模式 DDL）；③数据存储有关的描述语言（Data Storage Description Language，DSDL）；④数据操纵语言（Data Manipulation Language，DML）。它们分别用于定义模式、外模式、内模式和进行数据的存取与处置。当用户数据库投入运行后，如果需要修改模式，必须停止现有数据库的运行，转储数据，修改模式并编译后再重装数据库，十分麻烦。

SQL 集数据定义语言、数据操纵语言、数据控制语言的功能于一体，语言风格统一，可以独立完成数据库生命周期中的全部活动，包括以下一系列操作要求：

- 定义和修改、删除关系模式，定义和删除视图，插入数据，建立数据库。
- 对数据库中的数据进行查询和更新。
- 数据库重构和维护。
- 数据库安全性、完整性控制，以及事务控制。
- 嵌入式 SQL 和动态 SQL 定义。

这就为数据库应用系统的开发提供了良好的环境。特别是用户在数据库系统投入运行后还可根据需要随时地、逐步地修改模式，并不影响数据库的运行，从而使系统具有良好的可扩展性。

另外，在关系模型中实体和实体间的联系均用关系表示，这种数据结构的单一性带来了数据操作符的统一性，查找、插入、删除、更新等每一种操作都只需一种操作符，从而克服了非关系系统由于信息表示方式的多样性带来的操作复杂性。例如，在 DBTG 网状数据库系统中，需要两种插入操作符：STORE 用来把记录存入数据库，CONNECT 用来把记录插入系值（系值是网状数据库中记录之间的一种联系方式）以建立数据之间的联系。$kp$, section = '' where id = 26326;
update t_knowledge_point set title = $kp$高度非过程化$kp$, content = $kp$非关系数据模型的数据操纵语言是“面向过程”的语言，用“过程化”语言完成某项请求必须指定存取路径。而用 SQL 进行数据操作时，只要提出“做什么”，而无须指明“怎么做”，因此无须了解存取路径。存取路径的选择以及 SQL 的操作过程由系统自动完成。这不但大大减轻了用户负担，而且有利于提高数据独立性。$kp$, section = '' where id = 26327;
update t_knowledge_point set title = $kp$以同一种语法结构提供多种使用方式$kp$, content = $kp$SQL 既是独立的语言，又是嵌入式语言。作为独立的语言，它能够独立地用于联机交互的使用方式，用户可以在终端键盘上直接键入 SQL 命令对数据库进行操作；作为嵌入式语言，SQL 语句能够嵌入到高级语言（例如 C、C++、Java）程序中，供程序员设计程序时使用。而在两种不同的使用方式下，SQL 的语法结构基本上是一致的。这种以统一的语法结构提供多种不同使用方式的做法，提供了极大的灵活性与方便性。$kp$, section = '' where id = 26329;
update t_knowledge_point set title = $kp$语言简洁，易学易用$kp$, content = $kp$SQL 功能极强，由于设计巧妙，语言十分简洁，完成核心功能只用了 9 个动词。SQL 接近英语口语，因此易于学习和使用。$kp$, section = '' where id = 26330;
update t_knowledge_point set title = $kp$数据库系统及应用新技术$kp$, content = $kp$自从计算机问世以来，就有了处理数据、管理数据的需求，由此，计算机技术新的研究分支——数据库技术应运而生。随着计算机应用领域的不断扩展和多媒体技术的发展，数据库已经是计算机科学技术中发展最快、应用最广泛的重要分支之一。目前，数据库技术已经相当成熟，被广泛应用于各行各业中，成为现代信息技术的主要组成部分，是现代计算机信息系统和计算机应用的基础和核心。

各种学科与数据库技术的有机结合，使数据库领域中新内容、新应用、新技术层出不穷，形成了各种各样的数据库系统：面向对象数据库系统、分布式数据库系统、知识数据库系统、模糊数据库系统、并行数据库系统、多媒体数据库系统等；数据库系统被应用到特定领域后，又出现了工程数据库、演绎数据库、时态数据库、统计数据库、空间数据库、科学数据库、文献数据库等。它们继承了传统数据库的成果和技术，加以发展优化，从而形成新的数据库，可视为“进化”的数据库。可以说新一代数据库技术的研究与发展呈现了百花齐放的局面。数据库新技术主要包括：面向对象数据库、分布式数据库、数据仓库、数据挖掘、联机分析处理等。$kp$, section = '' where id = 26331;
update t_knowledge_point set title = $kp$面向对象数据库技术$kp$, content = $kp$面向对象是一种认识方法学，也是一种新的程序设计方法学。把面向对象的方法和数据库技术结合起来，可以使数据库系统的分析、设计最大程度地与人们对客观世界的认识相一致。面向对象数据库系统是为了满足新的数据库应用需要而产生的新一代数据库系统。其优点为：

（1）易维护：可读性高且维护成本低；
（2）质量高：在设计时可重用现有的、在以前项目的领域中已被测试过的类，使系统满足业务需求并具有较高的质量；
（3）效率高：在软件开发时，根据设计的需要对现实世界的事物进行抽象，产生类，使用这样的方法解决问题接近于日常生活和自然的思考方式，势必提高软件开发的效率和质量；
（4）易扩展：由于继承、封装、多态的特性，自然设计出高内聚、低耦合的系统结构，使得系统更灵活、更容易扩展，而且成本较低。

面向对象数据库研究的另一个进展是在现有关系数据库中加入许多纯面向对象数据库的功能。在商业应用中对关系模型的面向对象扩展着重于性能优化、处理各种环境下对象物理表示的优化，以及增加 SQL 模型以赋予面向对象特征。如 Versant、UNISQL、O2 等，它们均具有关系数据库的基本功能，采用类似于 SQL 的语言，用户很容易掌握。$kp$, section = '' where id = 26332;
update t_knowledge_point set title = $kp$分布式数据库技术$kp$, content = $kp$分布式数据库是指数据物理上被存放在网络的多个节点上，逻辑上是一个整体。其拥有 3 种模式：存储模式、逻辑模式、用户模式。典型特点包括自主性、异质性和分布性。$kp$, section = '' where id = 26333;
update t_knowledge_point set title = $kp$分布式数据库的三性$kp$, content = $kp$①自主性：单个 DBMS 的本地运算不因多数据库系统中其他 DBMS 的加入而受影响；单个 DBMS 处理查询和优化查询的方式不受访问多数据库的全局查询执行的影响；系统已执行的操作在单个 DBMS 加入或者离开多数据库联盟时不会受到伤害。
②异质性：硬件的异质性；网络协议的差异性；数据管理器的多样性。
③分布性：数据分布、控制分布、管理分布。$kp$, section = '' where id = 26334;
update t_knowledge_point set title = $kp$分布式数据库的特点$kp$, content = $kp$①在分布式数据库系统里不强调集中控制概念，它具有一个以全局数据库管理员为基础的分层控制结构，但是每个局部数据库管理员都具有高度的自主权。

②在分布式数据库系统中数据独立性概念也同样重要，然而增加了一个新的概念，就是分布式透明性。所谓分布式透明性就是在编写程序时好像数据没有被分布一样，因此把数据进行转移不会影响程序的正确性，但程序的执行速度会有所降低。

③与集中式数据库系统不同，数据冗余在分布式系统中被看作是所需要的特性，其原因在于：首先，如果在需要的节点复制数据，则可以提高局部的应用性；其次，当某节点发生故障时，可以操作其他节点上的复制数据，因此这可以增加系统的有效性。当然，在分布式系统中对最佳冗余度的评价是很复杂的。$kp$, section = '' where id = 26335;
update t_knowledge_point set title = $kp$分布式数据库迅速发展的原因$kp$, content = $kp$①它可以解决组织机构分散而数据需要相互联系的问题。比如银行系统，总行与各分行处于不同的城市或城市中的各个地区，在业务上它们需要处理各自的数据，也需要彼此之间的交换和处理，这就需要分布式的系统。
②如果一个组织机构需要增加新的相对自主的组织单位来扩充机构，则分布式数据库系统可以在对当前机构影响最小的情况下进行扩充。
③均衡负载的需要。数据的分解采用使局部应用达到最大的方式，这使得各处理机之间的相互干扰降到最低；负载在各处理机之间分担，可以避免临界瓶颈。
④当现有机构中已存在几个数据库系统，而且实现全局应用的必要性增加时，就可以由这些数据库自下而上构成分布式数据库系统。
⑤相等规模的分布式数据库系统在出现故障的几率上不会比集中式数据库系统低，但由于其故障的影响仅限于局部数据应用，因此就整个系统来讲它的可靠性是比较高的。$kp$, section = '' where id = 26336;
update t_knowledge_point set title = $kp$数据仓库的定义$kp$, content = $kp$数据仓库是决策支持系统（DSS）和联机分析应用数据源的结构化数据环境。数据仓库研究和解决从数据库中获取信息的问题。数据仓库的特征在于面向主题、集成性、稳定性和时变性。$kp$, section = '' where id = 26338;
update t_knowledge_point set title = $kp$从数据库到数据仓库$kp$, content = $kp$企业的数据处理大致分为两类：一类是操作型处理，也称为联机事务处理，它是针对具体业务在数据库联机的日常操作，通常对少数记录进行查询、修改；另一类是分析型处理，一般针对某些主题的历史数据进行分析，支持管理决策。

数据库已经在信息技术领域有了广泛的应用，社会生活的各个部门几乎都有各种各样的数据库保存着与我们生活息息相关的各种数据。作为数据库的一个分支，数据仓库概念的提出，相对于数据库从时间上就近得多。美国著名信息工程专家 William H. Inmon 博士在 20 世纪 90 年代初提出了数据仓库概念的一个表述，认为：“一个数据仓库通常是一个面向主题的、集成的、随时间变化的、但信息本身相对稳定的数据集合，它用于对管理决策过程的支持。”$kp$, section = '' where id = 26340;
update t_knowledge_point set title = $kp$联机分析处理的作用$kp$, content = $kp$联机分析处理是共享多维信息的、针对特定问题的联机数据访问和分析的快速软件技术。它通过对信息的多种可能的观察形式进行快速、稳定一致和交互性的存取，允许管理决策人员对数据进行深入观察。决策数据是多维数据，多维数据就是决策的主要内容。OLAP 专门设计用于支持复杂的分析操作，侧重对决策人员和高层管理人员的决策支持，可以根据分析人员的要求快速、灵活地进行大数据量的复杂查询处理，并且以一种直观而易懂的形式将查询结果提供给决策人员，以便他们准确掌握企业（公司）的经营状况，了解对象的需求，制定正确的方案。$kp$, section = '' where id = 26346;
update t_knowledge_point set title = $kp$联机分析处理的主要特点$kp$, content = $kp$直接仿照用户的多角度思考模式，预先为用户组建多维的数据模型，在这里，维指的是用户的分析角度。例如对销售数据的分析，时间周期是一个维度，产品类别、分销渠道、地理分布、客户群类也分别是一个维度。一旦多维数据模型建立完成，用户可以快速地从各个分析角度获取数据，也能动态地在各个角度之间切换或者进行多角度综合分析，具有极大的分析灵活性。这也是联机分析处理被广泛关注的根本原因，它从设计理念和真正实现上都与旧有的管理信息系统有着本质的区别。$kp$, section = '' where id = 26347;
update t_knowledge_point set title = $kp$NoSQL 与 BigTable$kp$, content = $kp$在云计算环境下，大部分应用不需要支持完整的 SQL 语义，而只需要 Key-Value 形式或略复杂的查询语义。在这样的背景下，进一步简化的各种 NoSQL 数据库成为云计算中结构化数据存储的重要技术。

Google 的 BigTable 是一个典型的分布式结构化数据存储系统。在表中，数据是以“列族”为单位组织的，列族用一个单一的键值作为索引，通过这个键值，数据和对数据的操作都可以被分布到多个节点上进行。$kp$, section = '' where id = 26491;
update t_knowledge_point set title = $kp$BigTable 分布式大规模数据库管理系统$kp$, content = $kp$构建于上述两项基础之上的第三个云计算平台就是 Google 关于将数据库系统扩展到分布式平台上的 BigTable 系统。很多应用程序对于数据的组织还是非常有规则的。一般来说，数据库对于处理格式化的数据还是非常方便的，但是由于关系数据库很强的一致性要求，很难将其扩展到很大的规模。为了处理 Google 内部大量的格式化以及半格式化数据，Google 构建了弱一致性要求的分布式大规模数据库系统 BigTable。$kp$, section = '' where id = 26511;
update t_knowledge_point set title = $kp$Variety（多样性）$kp$, content = $kp$传统的数据库中的数据基本上都是结构化数据。不同于传统的数据库，现代企业特别是互联网企业所采集和分析的数据还包括网站日志数据、社交媒体中的文本数据、GPS（全球定位系统）所产生的位置信息、实时生成的传感器数据，甚至还有图片和视频，数据的种类和几年前相比已经有了大幅度的增加。其中，近年来爆发式增长的一些数据，如互联网上的文本数据、位置信息、传感器数据、视频等，用企业中主流的关系型数据库是很难存储的，它们都属于非结构化数据。当然，在这些种类的数据中，也有一些是过去就一直存在并保存下来的。

然而，和过去不同的是，这些大数据并非只是存储起来就够了，人们还需要对其进行分析，并从中获得有用的信息。以美国企业为代表的众多企业正在致力于这方面的研究。

监控摄像机的视频数据正是其中之一。近年来，超市、便利店等零售企业几乎都配备了监控摄像机，目的是防止盗窃和帮助抓捕盗窃嫌犯，但最近也出现了使用监控摄像机的视频数据来分析顾客购买行为的案例。例如，美国大型折扣店家庭美元商店（Family Dollar Stores）以及高级文具制造商万宝龙（Montblanc），都开始尝试利用监控摄像头对顾客在店内的行为进行分析。以万宝龙为例，他们过去都是凭经验和直觉来决定商品陈列的布局，但通过分析监控摄像机的数据，将最想卖出去的商品移动到最容易吸引顾客目光的位置，使得销售额提高了 20%。

此外，美国移动运营商 T-Mobile 也在其全美 1000 家店中安装了带视频分析功能的监控摄像机，可以统计来店人数，还可以追踪顾客在店内的行动路线、在展台前停留的时间，甚至是试用了哪一款手机、试用了多长时间等，T-Mobile 根据这些数据对顾客在店内的购买行为进行分析。$kp$, section = '' where id = 26528;
update t_knowledge_point set title = $kp$语义引擎$kp$, content = $kp$非结构化数据的多元化给数据分析带来新的挑战，我们需要一套工具系统地去分析、提炼数据。语义引擎的设计需要有足够的人工智能作为支撑，以便从数据中主动地提取信息。$kp$, section = '' where id = 26545;
update t_knowledge_point set title = $kp$决策树方法$kp$, content = $kp$决策树是一种常用于预测模型的算法，它通过将大量数据有目的地分类，从中找到一些有价值的、潜在的信息。它的主要优点是描述简单、分类速度快，特别适合大规模的数据处理。$kp$, section = '' where id = 26552;
update t_knowledge_point set title = $kp$覆盖正例排斥反例方法$kp$, content = $kp$它是利用覆盖所有正例、排斥所有反例的思想来寻找规则。首先在正例集合中任选一个种子，到反例集合中逐个比较：与字段取值构成的选择子相容则舍去，相反则保留。按此思想循环所有正例种子，将得到正例的规则（选择子的合取式）。$kp$, section = '' where id = 26554;
update t_knowledge_point set title = $kp$统计分析方法$kp$, content = $kp$在数据库字段项之间存在两种关系：函数关系和相关关系。对它们的分析可采用统计学方法，即利用统计学原理对数据库中的信息进行分析，可进行常用统计、回归分析、相关分析、差异分析等。$kp$, section = '' where id = 26555;
update t_knowledge_point set title = $kp$数据挖掘的概念$kp$, content = $kp$数据挖掘（Data Mining）是指从大量的数据中通过算法搜索隐藏于其中信息的过程。数据挖掘通常与计算机科学有关，并通过统计、在线分析处理、情报检索、机器学习、专家系统（依靠过去的经验法则）和模式识别等诸多方法来实现上述目标。

数据挖掘的任务是从数据集中发现模式，可以发现的模式有很多种，按功能可以分为两大类：预测性（Predictive）模式和描述性（Descriptive）模式。在应用中往往根据模式的实际作用细分为：分类、估值、预测、相关性分析、序列、时间序列、描述和可视化等。

数据挖掘的数据类型可以是结构化的、半结构化的，甚至是异构型的；发现知识的方法可以是数学的、非数学的，也可以是归纳的；最终被发现的知识可以用于信息管理、查询优化、决策支持及数据自身的维护等。

数据挖掘的对象可以是任何类型的数据源，可以是关系数据库这类包含结构化数据的数据源，也可以是数据仓库、文本、多媒体数据、空间数据、时序数据、Web 数据这类包含半结构化数据甚至异构性数据的数据源。

数据挖掘过程模型的步骤主要包括：定义问题、建立数据挖掘库、分析数据、准备数据、建立模型、评价模型和实施。

数据挖掘分为有指导的数据挖掘和无指导的数据挖掘。有指导的数据挖掘是利用可用的数据建立一个模型，这个模型是对一个特定属性的描述；无指导的数据挖掘是在所有的属性中寻找某种关系。具体而言，分类、估值和预测属于有指导的数据挖掘，关联规则和聚类属于无指导的数据挖掘。

①分类。它首先从数据中选出已经分好类的训练集，在该训练集上运用数据挖掘技术建立一个分类模型，再将该模型用于对没有分类的数据进行分类。
②估值。估值与分类类似，但估值最终的输出结果是连续型的数值，估值的量并非预先确定。估值可以作为分类的准备工作。
③预测。它是通过分类或估值来进行，通过分类或估值的训练得出一个模型，如果对于检验样本组而言该模型具有较高的准确率，可将该模型用于对新样本的未知变量进行预测。
④相关性分组或关联规则。其目的是发现哪些事情总是一起发生。
⑤聚类。它是自动寻找并建立分组规则的方法，通过判断样本之间的相似性，把相似样本划分在一个簇中。$kp$, section = '' where id = 26604;
update t_knowledge_point set title = $kp$决策树法$kp$, content = $kp$决策树是根据对目标变量产生效用的不同而建构分类的规则，通过一系列的规则对数据进行分类的过程，其表现形式是类似于树形结构的流程图。最典型的算法是 J. R. Quinlan 于 1986 年提出的 ID3 算法，之后在 ID3 算法的基础上又提出了极其流行的 C4.5 算法。采用决策树法的优点是决策制定的过程是可见的，不需要长时间构造过程，描述简单，易于理解，分类速度快；缺点是很难基于多个变量组合发现规则。决策树法擅长处理非数值型数据，而且特别适合大规模的数据处理。决策树提供了一种展示类似“在什么条件下会得到什么值”这类规则的方法，比如在贷款申请中，要对申请的风险大小做出判断。$kp$, section = '' where id = 26607;
update t_knowledge_point set title = $kp$粗糙集法$kp$, content = $kp$粗糙集法也称粗糙集理论，是由波兰数学家 Z. Pawlak 在 20 世纪 80 年代初提出的，是一种新的处理含糊、不精确、不完备问题的数学工具，可以处理数据约简、数据相关性发现、数据意义的评估等问题。其优点是算法简单，处理过程中可以不需要关于数据的先验知识，可以自动找出问题的内在规律；缺点是难以直接处理连续的属性，须先进行属性的离散化，因此连续属性的离散化问题是制约粗糙集理论实用化的难点。粗糙集理论主要应用于近似推理、数字逻辑分析和化简、建立预测模型等问题。$kp$, section = '' where id = 26609;
update t_knowledge_point set title = $kp$关系数据库语言 SQL$kp$, content = $kp$SQL 集数据查询（Data Query）、数据操纵（Data Manipulation）、数据定义（Data Definition）和数据控制（Data Control）功能于一体。$kp$, section = '' where id = 26836;
update t_knowledge_point set title = $kp$数据库系统及应用新技术$kp$, content = $kp$数据库技术是信息系统的一个核心技术，是一种计算机辅助管理数据的方法，它研究如何组织和存储数据，如何高效地获取和处理数据。$kp$, section = '' where id = 26837;
update t_knowledge_point set title = $kp$使用 SQL 命令直接访问数据库$kp$, content = $kp$使用“SQL 命令”直接访问数据库。$kp$, section = '' where id = 27595;
update t_knowledge_point set title = $kp$DML 数据操作语言$kp$, content = $kp$①关键字：SELECT、UPDATE、INSERT、DELETE。

②功能有：查询和更新（插入、更改、删除）。

③数据库查询是数据库的核心操作。$kp$, section = '' where id = 27656;
update t_knowledge_point set title = $kp$概念结构设计、逻辑结构设计与物理结构设计$kp$, content = $kp$①概念结构设计：将用户需求抽象为概念模型（全局 E-R 图）。
②逻辑结构设计：将全局 E-R 图转换为逻辑结构，也就是全局关系模式。
③物理结构设计：数据库在外存上的存储结构和存取方法，依赖硬件，目标是提高数据库性能和有效利用存储空间。$kp$, section = '' where id = 27683;
update t_knowledge_point set title = $kp$DML 数据操作语言$kp$, content = $kp$关键字：SELECT、UPDATE、INSERT、DELETE。

功能有：查询和更新（插入、更改、删除）。

数据库查询是数据库的核心操作。$kp$, section = '' where id = 28360;
update t_knowledge_point set title = $kp$支持 SQL 的 DBMS 产品$kp$, content = $kp$支持 SQL 的 DBMS 产品：Oracle、Sybase、DB2、SQL Server、Access、VFP。$kp$, section = '' where id = 29724;
update t_knowledge_point set title = $kp$SQL 数据库$kp$, content = $kp$SQL 数据库是指支持 SQL 语言的关系数据库系统。目前主流的关系数据库（RDBMS）都是 SQL 数据库。$kp$, section = '' where id = 29783;
update t_knowledge_point set title = $kp$动态网页访问数据库的技术$kp$, content = $kp$动态网页访问数据库的技术（即应用程序层的技术）包括：CGI（通用网关接口）、ASP、PHP、JSP。$kp$, section = '' where id = 29792;
update t_knowledge_point set title = $kp$数据库查询是数据库的核心操作$kp$, content = $kp$数据库查询是数据库的核心操作。SQL 语言提供了 SELECT 语句对数据库进行查询，它的一次查询结果仍是一个关系。$kp$, section = '' where id = 29825;
update t_knowledge_point set title = $kp$关系数据库操作语句$kp$, content = $kp$关系数据库操作语句有：DDL（数据定义语言，如 Create）；DCL（数据控制语言，如 Commit、Lock）；DML（数据操纵语言，如 Select、Insert、Update、Delete）。$kp$, section = '' where id = 29826;
update t_knowledge_point set title = $kp$数据库设计的任务$kp$, content = $kp$数据库设计的任务是：按照应用单位的需求和计算机支持环境，最终设计出数据模式和应用程序。$kp$, section = '' where id = 29827;
update t_knowledge_point set title = $kp$数据库设计的描述工具$kp$, content = $kp$数据库设计的描述工具：E-R 图、数据字典（DD）、数据流程图（DFD）、程序模块表。$kp$, section = '' where id = 29828;
update t_knowledge_point set title = $kp$数据独立性$kp$, content = $kp$数据独立性是指数据库中的数据与应用程序间的互不依赖性，包括数据物理独立性和数据逻辑独立性两级。$kp$, section = '' where id = 29829;
update t_knowledge_point set title = $kp$数据的物理独立性$kp$, content = $kp$物理存储结构的改变不影响数据库的逻辑结构，从而不会引起应用程序的变化。$kp$, section = '' where id = 29830;
update t_knowledge_point set title = $kp$信息系统开发的核心技术$kp$, content = $kp$大量信息系统开发的工程实践证明：除了“软件工程”技术外，最重要的核心技术是“数据库系统的设计技术”。$kp$, section = '' where id = 29833;
update t_knowledge_point set title = $kp$数据库发展史$kp$, content = $kp$数据管理经历了人工管理、文件系统、数据库管理三个阶段。数据库管理的特点：减少数据冗余，提高数据独立性（物理独立性和逻辑独立性），增强数据的完整性、安全性、并发性与可恢复性。$kp$, section = '' where id = 29849;
update t_knowledge_point set title = $kp$数据库系统的组成$kp$, content = $kp$数据库系统（DBS）由数据库（DB）、操作系统（OS）、数据库管理系统（DBMS）、应用程序（AP）和数据库管理员（DBA）组成。$kp$, section = '' where id = 29850;
update t_knowledge_point set title = $kp$数据库模型与关系模型$kp$, content = $kp$常见的数据库模型有层次模型、网状模型和关系模型，其中关系模型用二维表表示数据。

| 学号 | 年龄 | 姓名 | 性别 | 学历 |
| --- | --- | --- | --- | --- |
| 001 | 25 | 张三 | 男 | 大专 |
| 004 | 24 | 赵六 | 男 | 本科 |
| 002 | 21 | 李四 | 女 | 高中 |
| 003 | 22 | 王五 | 男 | 高中 |

概念模型与关系模型的对应关系：实体—记录（行），实体集—关系（表），属性—字段（列），标识符—键码。标识符是能唯一区分实体的属性或属性集。

关系模型的特点：不允许出现相同的属性，不允许出现完全相同的记录，键码不能重复且不能为空（NULL），属性次序和记录次序均可任意交换。

概念模型常用 E-R 图表示，实体间的映射关系有 1:1、1:N、N:1 和 M:N，可据此转换为关系模型。

关系模式建立在模型的基础上，并对模型进行完善，例如：学生（学号，姓名，性别，年龄，学历）、课程（课号，课名，课时，教师）、选课（学号，课号，成绩）。

关系是在完善后的表中填充数据，是表中数据的动态表示。$kp$, section = '' where id = 29851;
update t_knowledge_point set title = $kp$数据管理操作$kp$, content = $kp$数据库除了存储数据外，还对数据进行增、删、改、查等管理操作，并进行数据管理权限的分配。

INSERT INTO 表名 VALUES(值1, 值2, 值3, …);

UPDATE 表名 SET 属性1 = 新值 WHERE 条件;

DELETE FROM 表名 WHERE 条件;$kp$, section = '' where id = 29852;
update t_knowledge_point set title = $kp$学生成绩表实例$kp$, content = $kp$例如数据库中有 A 表，包括学生、学科、成绩三个字段，表结构及数据如下：

| 学生 | 学科 | 成绩 |
| --- | --- | --- |
| 张三 | 语文 | 60 |
| 张三 | 数学 | 100 |
| 李四 | 语文 | 70 |
| 李四 | 数学 | 80 |
| 李四 | 英语 | 80 |$kp$, section = '' where id = 29855;
update t_knowledge_point set title = $kp$用 WHERE 子句筛选记录$kp$, content = $kp$可以通过 WHERE（选择）语句将记录筛选出来。例如在查询编辑器中执行 select * from t_students; 可得到如下结果：

| id | name | sex | age | bdate |
| --- | --- | --- | --- | --- |
| 1 | 张三 | 男 | 20 | 1990-09-30 00:00:00 |
| 2 | 王五 | 男 | 19 | 1991-01-01 00:00:00 |
| 3 | 如花 | 女 | 20 | 1990-08-08 00:00:00 |$kp$, section = '' where id = 29863;
update t_knowledge_point set title = $kp$创建数据库（IF NOT EXISTS）$kp$, content = $kp$CREATE DATABASE IF NOT EXISTS 数据库名; 该语句仅在数据库不存在时才创建，可避免因数据库已存在而报错。$kp$, section = '' where id = 29868;
update t_knowledge_point set title = $kp$CHAR 定长字符类型$kp$, content = $kp$CHAR 长度固定，即每条数据占用等长字节空间，适合存放身份证号码、手机号码等定长数据。CHAR[(M)]：固定长度的字符数据类型，用于保存以文本格式存储的信息，保存时在右侧填充空格以达到指定长度；M 表示列长度，范围为 0～255 个字符。$kp$, section = '' where id = 29870;
update t_knowledge_point set title = $kp$TEXT 变长文本类型$kp$, content = $kp$TEXT 不设置长度，当不知道属性的最大长度时适合使用 TEXT。TINYTEXT：最大长度为 255 个字符的 TEXT 列；TEXT[(M)]：最大长度为 65535 个字符的 TEXT 列。$kp$, section = '' where id = 29871;
update t_knowledge_point set title = $kp$外键约束$kp$, content = $kp$FOREIGN KEY(外键属性名)：多个属性之间用逗号分隔；REFERENCES：引用参照，用于指明所参照的父表及其属性。$kp$, section = '' where id = 29872;
update t_knowledge_point set title = $kp$删除表$kp$, content = $kp$语法：DROP TABLE 表名1, 表名2, 表名3……；

实例：DROP TABLE t_students1, t_students2, t_students3;$kp$, section = '' where id = 29873;
update t_knowledge_point set title = $kp$删除数据库$kp$, content = $kp$语法：DROP DATABASE 数据库名；

实例：DROP DATABASE myDB;

该语句在数据库存在时将其删除。$kp$, section = '' where id = 29874;
update t_knowledge_point set title = $kp$异地备份与灾难恢复$kp$, content = $kp$金融系统将本地数据传输到异地的数据中心进行备份，有利于信息安全和灾难恢复。$kp$, section = '' where id = 29918;
update t_knowledge_point set title = $kp$数据更新$kp$, content = $kp$数据更新包括：1) 插入语句（INSERT）；2) 修改语句（UPDATE）；3) 删除数据（DELETE）。

DELETE FROM 表名 [WHERE 条件]

注意：DELETE 仅删除满足 WHERE 子句条件的记录，表的定义仍保留在数据字典中。$kp$, section = '' where id = 29922;
update t_knowledge_point set title = $kp$区块链的链式账本结构$kp$, content = $kp$区块可以无限增加——每个区块看作账本的一页，增加一个区块就多一页，一页包含一条或多条信息记录。$kp$, section = '' where id = 29976;
update t_knowledge_point set title = $kp$数据查询（SELECT）$kp$, content = $kp$1) SQL 语言提供了 SELECT 语句进行数据库查询，其一次查询的结果可以是多个元组。
2) 基本形式：SELECT A1, A2, …, An（指出目标表的列名或列表达式序列，相当于投影）FROM R1, R2, …, Rm（指出基本表或视图序列，相当于连接）[WHERE F]（F 为条件表达式，相当于选择）。$kp$, section = '' where id = 29988;
update t_knowledge_point set title = $kp$删除数据库（IF EXISTS）$kp$, content = $kp$语法：DROP DATABASE IF EXISTS 数据库名；

实例：DROP DATABASE IF EXISTS tmp_business;$kp$, section = '' where id = 30246;
update t_knowledge_point set title = $kp$SQL 数据更新语句$kp$, content = $kp$数据更新包括插入、更改和删除。

① 插入语句 INSERT：可将一个记录插入到指定的表中。
② 更改语句 UPDATE：对指定表中已有数据进行修改。
③ 删除语句 DELETE：如果省略 WHERE 子句，则删除表中所有元组。

DELETE FROM C  // 删除 C 表中的所有元组。$kp$, section = '' where id = 32060;
update t_knowledge_point set title = $kp$数据库的安全性$kp$, content = $kp$数据库的安全性是指保护数据库以防止不合法的使用所造成的数据泄露、更改或破坏。$kp$, section = '' where id = 32392;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22271,22514,23535,23618,23649,23668,23701,23731,23742,23743,23798,23826,23827,23828,23903,23904,23905,23927,23928,23989,24004,24005,24007,24008,24012,24023,24064,24073,24606,25047,25056,25057,25069,25079,25109,25110,25328,25595,26324,26325,26326,26327,26329,26330,26331,26332,26333,26334,26335,26336,26338,26340,26346,26347,26491,26511,26528,26545,26552,26554,26555,26604,26607,26609,26836,26837,27595,27656,27683,28360,29724,29783,29792,29825,29826,29827,29828,29829,29830,29833,29849,29850,29851,29852,29855,29863,29868,29870,29871,29872,29873,29874,29918,29922,29976,29988,30246,32060,32392) and not deleted) <> 99 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
