-- 知识点 270 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_270
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_270 as
select * from t_knowledge_point where id in (27754,27957,27997,28591,28592,30429,30679,30733,31417,31421,31601,31614,31622,31632,31656,31674,31676,31677,31683,31685,31688,31691,31692,31693,31695,31696,31697,31701,31702,31738,31740,31787,31792,31793,31849,31906,32335,32336,32338,32340,32343,32344,32352,32362,32368,32374,32375,32376,32378,32379,32381,32383,32384,32393,32400,32459,32461,32462,32472,32474,32475,32480,32481,32484);

update t_knowledge_point set title = $kp$数据独立性$kp$, content = $kp$数据独立性包括逻辑独立性和物理独立性，用于保证数据的一致性。$kp$, section = '' where id = 27754;
update t_knowledge_point set title = $kp$数据库设计的三个结构层次$kp$, content = $kp$数据库设计分为概念结构、逻辑结构和物理结构三个层次。$kp$, section = '' where id = 27957;
update t_knowledge_point set title = $kp$系统设计中的概念模型、逻辑模型与存储模型$kp$, content = $kp$系统设计的过程如图 6-10 所示，依次由概念模型得到逻辑模型，再得到存储模型。$kp$, section = '' where id = 27997;
update t_knowledge_point set title = $kp$关系与二维表$kp$, content = $kp$关系：一个关系对应一张二维表。一个二维表不一定能称为关系。$kp$, section = '' where id = 28591;
update t_knowledge_point set title = $kp$外模式/模式映像与逻辑独立性$kp$, content = $kp$外模式与模式之间的映像，保证了数据的逻辑独立性。$kp$, section = '' where id = 28592;
update t_knowledge_point set title = $kp$产品与顾客的 E-R 图及关系模式$kp$, content = $kp$产品与顾客通过“购买”形成 m:n 联系：产品实体的属性为产品编号、产品名称、规格、单价；顾客实体的属性为顾客编号、姓名、地址。

转换为关系模式：
产品（产品编号，产品名称，规格，单价）
顾客（顾客编号，姓名，地址）
购买（产品编号，顾客编号，采购日期，采购数量）$kp$, section = '' where id = 30429;
update t_knowledge_point set title = $kp$E-R 图的绘制与向关系模式的转换$kp$, content = $kp$概念模型用 E-R 图（实体-联系图）表示：矩形表示实体（如学生、课程、教师），椭圆表示属性（如学号、姓名、性别），菱形表示实体之间的联系（如讲授、选课）。

绘制 E-R 图的步骤：
1. 确定实体；
2. 确定实体的属性；
3. 确定主键；
4. 确定实体之间的联系（讲授、选课）；
5. 确定联系的类型（1:1、1:n、m:n）。

通过 E-R 图分析并转换为关系模式（二维表）：
1. E-R 图中的矩形（实体）各自转换为一个关系模式；
2. 菱形（联系）中只有 m:n 联系需要单独转换为一个关系模式，其余联系不单独生成二维表；
3. 1:n 联系需将 1 方的主键放入 n 方作为外键。$kp$, section = '' where id = 30679;
update t_knowledge_point set title = $kp$数据库、DBMS 与 SQL 语言基础$kp$, content = $kp$数据库（Database）是长期保存在计算机存储设备上、按照一定规则组织起来、可以被各种用户或应用共享的数据集合。

数据库管理系统（DataBase Management System，DBMS）是操作和管理数据库的大型软件，用于建立、使用和维护数据库，并对数据库进行统一管理和控制，以保证数据库的安全性和完整性；用户通过 DBMS 访问数据库中的数据。

MySQL 即 DBMS，负责管理真实的数据库；数据库中存放数据集合，包括表、视图等；表以二维行列存储数据，行（row）在 SQL 中称为一条记录（实体），列（column）称为字段。在 Java 访问数据库编程中，用 Java 变量与字段对应。

SQL（Structured Query Language，结构化查询语言）：各数据库厂商都支持 ISO 的 SQL 标准（相当于“普通话”），并在标准基础上做了自己的扩展（相当于“方言”）。

SQL 的分类：
- DDL 数据定义语言：定义数据库对象（库、表、列等），包括创建、修改、删除表；
- DML 数据操作语言：对表中数据进行插入、更新、删除；
- DCL 数据控制语言：定义访问权限和安全级别；
- DQL 数据查询语言：查询记录（数据），只有 SELECT 语句。

SQL 语句以英文分号结尾。

DDL 常用关键字：CREATE、ALTER、DROP。

DDL 操作数据库：
CREATE DATABASE 数据库名; -- 创建数据库
CREATE DATABASE 数据库名 CHARACTER SET gbk; -- 创建数据库并设置为 gbk 编码
CREATE DATABASE 数据库名 CHARACTER SET gbk COLLATE gbk_chinese_ci; -- 创建使用 gbk 字符集并带校对规则的数据库
SHOW DATABASES; -- 查看当前数据库服务器中的所有数据库
SHOW CREATE DATABASE 数据库名; -- 查看创建数据库时的定义信息
DROP DATABASE 数据库名; -- 删除指定数据库
ALTER DATABASE 数据库名 CHARACTER SET utf8; -- 将数据库的字符集改为 utf8
USE 数据库名; -- 使用数据库
SELECT DATABASE(); -- 查看当前选中的数据库

DDL 操作数据表：
CREATE TABLE 表名(
  字段1 字段类型,
  字段2 字段类型,
  ...
  字段n 字段类型
);

常用数据类型：int 为整型；double 为浮点型，如 double(5,2) 表示最多 5 位、其中必须有 2 位小数，即最大值为 999.99。$kp$, section = '' where id = 30733;
update t_knowledge_point set title = $kp$MySQL 命令行登录与版本查看$kp$, content = $kp$使用命令行登录 MySQL 前，需把 mysql 的安装路径加入环境变量。

在命令提示符中执行 mysql -u root -p，按提示输入密码后即进入 MySQL 监视器（mysql> 提示符），命令以分号或 \g 结束；输入 exit 退出。

mysql -v 与 mysql --version 用于查看客户端版本，如 mysql Ver 14.14 Distrib 5.7.19, for Win32 (AMD64)。若不加 -u 指定用户，客户端会以 ODBC 用户匿名连接，从而报 ERROR 1045 (28000): Access denied for user 'ODBC'@'localhost' (using password: NO)。$kp$, section = '' where id = 31417;
update t_knowledge_point set title = $kp$查看数据库字符集编码$kp$, content = $kp$执行 SHOW VARIABLES LIKE '%char%'; 可查看数据库的字符集相关变量。

结果中可见 character_set_client、character_set_connection、character_set_database、character_set_filesystem、character_set_results、character_set_server、character_set_system 以及 character_sets_dir 等项。示例中客户端与连接为 gbk，数据库与服务器为 latin1，系统为 utf8。$kp$, section = '' where id = 31421;
update t_knowledge_point set title = $kp$连接运算：θ 连接、等值连接与自然连接$kp$, content = $kp$连接也称为 θ 连接，是从两个关系的笛卡儿积中选取属性间满足一定条件的元组，记作 R⋈(AθB)S。其中 A、B 分别为 R 和 S 上列数相等且可比的属性组，θ 是比较运算符；连接运算从 R 与 S 的笛卡儿积 R×S 中，选取 R 在 A 属性组上的值与 S 在 B 属性组上的值满足比较关系的元组。

等值连接（equijoin）：θ 为“=”的连接，从 R 与 S 的广义笛卡儿积中选取 A、B 属性值相等的元组，记作 R⋈(A=B)S。

自然连接（natural join）：一种特殊的等值连接，要求两个关系中进行比较的分量必须是同名的属性组，并且在结果中把重复的属性列去掉；若 R 与 S 具有相同的属性组 B，则自然连接记作 R⋈S。

一般的连接操作从行的角度进行运算；自然连接还需取消重复列，因此同时从行和列的角度进行运算。

例 2.8：设关系 R、S 如下，其后依次为非等值连接（R.C < S.E）、等值连接和自然连接的结果。

关系 R：
| A | B | C |
| --- | --- | --- |
| a1 | b1 | 5 |
| a1 | b2 | 6 |
| a2 | b3 | 8 |
| a2 | b4 | 12 |

关系 S：
| B | E |
| --- | --- |
| b1 | 3 |
| b2 | 7 |
| b3 | 10 |
| b3 | 2 |
| b5 | 2 |

自然连接 R⋈S：
| A | B | C | E |
| --- | --- | --- | --- |
| a1 | b1 | 5 | 3 |
| a1 | b2 | 6 | 7 |
| a2 | b3 | 8 | 10 |
| a2 | b3 | 8 | 2 |

等值连接 R⋈(R.B=S.B)S：
| A | R.B | C | S.B | E |
| --- | --- | --- | --- | --- |
| a1 | b1 | 5 | b1 | 3 |
| a1 | b2 | 6 | b2 | 7 |
| a2 | b3 | 8 | b3 | 10 |
| a2 | b3 | 8 | b3 | 2 |

非等值连接（R.C < S.E）：
| A | R.B | C | S.B | E |
| --- | --- | --- | --- | --- |
| a1 | b1 | 5 | b2 | 7 |
| a1 | b1 | 5 | b3 | 10 |
| a1 | b2 | 6 | b2 | 7 |
| a1 | b2 | 6 | b3 | 10 |
| a2 | b3 | 8 | b3 | 10 |$kp$, section = '' where id = 31601;
update t_knowledge_point set title = $kp$网络爬虫的概念与常用工具$kp$, content = $kp$网络爬虫是一种按照一定规则自动抓取万维网信息的程序或脚本，不常用的名称还有蚂蚁、自动索引、模拟程序或蠕虫。

简单来说，爬虫是模拟人类请求网站行为的程序：自动请求网页、把数据抓取下来，再按一定规则提取有价值的数据。

爬虫分为“善意爬虫”和“恶意爬虫”：谷歌、百度等搜索引擎每天抓取海量网站以满足用户需要，用户和网站都能接受，属于善意爬虫；抢票软件、非 VIP 下载等不仅增加网站承受的压力，还可能导致资源隐私泄露，属于恶意爬虫。

常用工具：requests 能满足大部分测试与抓取需求，工程化进阶用 Scrapy；动态网页优先查找 API 接口，有简单加密可尝试破解，实在困难则用 Splash 渲染；解析器使用 Scrapy 的 Selector；数据存储快速测试用 MongoDB，业务使用 MySQL。$kp$, section = '' where id = 31614;
update t_knowledge_point set title = $kp$控制面板的启动与两种视图$kp$, content = $kp$“控制面板”提供分类视图与经典视图两种视图：分类视图按任务分类组织，每一类下再划分功能模块；经典视图将所有管理任务全部显示在一个窗口中。两种视图可利用左窗格中的切换选项相互切换。

单击【开始】按钮选择“控制面板”命令，或打开“我的电脑”窗口并在左侧窗格单击“控制面板”超链接，即可打开经典视图的“控制面板”窗口。$kp$, section = '' where id = 31622;
update t_knowledge_point set title = $kp$计算器$kp$, content = $kp$用户可以用“计算器”的标准视图执行简单的计算，也可以用科学型视图执行高级的科学计算和统计计算。$kp$, section = '' where id = 31632;
update t_knowledge_point set title = $kp$E-R 图的基本符号与联系类型$kp$, content = $kp$概念模型的建立方法是“实体-联系”方法，即 E-R 图。

在 E-R 图中，矩形表示实体，椭圆表示属性，菱形表示表与表之间的联系。

E-R 概念模型中存在一对一、一对多、多对多三种联系。$kp$, section = '' where id = 31656;
update t_knowledge_point set title = $kp$DBMS 的统一管理与数据控制$kp$, content = $kp$统一的管理和数据控制：DBMS 具有数据的安全性管理、完整性管理、并发控制、故障恢复功能。$kp$, section = '' where id = 31674;
update t_knowledge_point set title = $kp$软件按知识产权分类$kp$, content = $kp$按知识产权分类：

1. 商品软件：先购买后使用，受到版权和许可证保护。
2. 共享软件（试用软件）：具有版权，可免费使用一段时间，允许拷贝和散发，但不允许修改；过了试用期如还想继续使用，必须交注册费成为注册用户。
3. 自由软件（开放源代码软件）：用户可共享，允许随意拷贝、修改其源代码，允许销售和自由传播；对源代码的任何修改必须向全体用户公示，允许此后的用户有进一步拷贝和修改的自由。常见的自由软件有 Linux、TCP/IP 协议、MySQL、PostgreSQL、Apache。
4. 免费软件：不等于自由软件，只是免费使用，用户没有版权，只有使用权。$kp$, section = '' where id = 31676;
update t_knowledge_point set title = $kp$SQL 语言的特点$kp$, content = $kp$SQL 是非过程语言，限于对数据库的操作，可嵌入宿主语言使用。$kp$, section = '' where id = 31677;
update t_knowledge_point set title = $kp$Word 的视图类型$kp$, content = $kp$视图就是查看文档的方式。同一个文档可以在不同的视图下查看，虽然显示方式不同，但文档的内容不变。Word 提供五种视图：普通视图（草稿）、页面视图、大纲视图、Web 版式视图和阅读视图。

页面视图用于查看打印时文档的外观，可调整页边距、处理分栏和图形对象。$kp$, section = '' where id = 31683;
update t_knowledge_point set title = $kp$页面视图中的背景颜色$kp$, content = $kp$只有在页面视图中才能同时看到背景颜色。$kp$, section = '' where id = 31685;
update t_knowledge_point set title = $kp$普通视图中的水平标尺$kp$, content = $kp$在普通视图中可以看到水平标尺。$kp$, section = '' where id = 31688;
update t_knowledge_point set title = $kp$大纲视图的折叠与展开$kp$, content = $kp$在大纲视图中通过折叠文档来查看主要标题，或者展开文档以查看所有标题以至正文。$kp$, section = '' where id = 31691;
update t_knowledge_point set title = $kp$大纲视图与阅读视图$kp$, content = $kp$在大纲视图中不显示页边距、页眉、页脚、图片和背景，也不显示标尺。

阅读视图全屏显示，用于在计算机屏幕上阅读文档；Word 使用计算机的分辨率设置缩放文本，以获得最佳可读性。$kp$, section = '' where id = 31692;
update t_knowledge_point set title = $kp$阅读版式视图的显示方式$kp$, content = $kp$阅读版式视图显示文档的方式与文档打印时格式化的方式不同。$kp$, section = '' where id = 31693;
update t_knowledge_point set title = $kp$段落标记与行距$kp$, content = $kp$默认行距为单倍行距；删除段落标记会把相邻段落合并为一段，段落间距随之改变。$kp$, section = '' where id = 31695;
update t_knowledge_point set title = $kp$分栏效果的显示视图$kp$, content = $kp$分栏的效果只有在页面视图下才能看到；普通视图下只能看到分栏操作，看不到分栏效果。$kp$, section = '' where id = 31696;
update t_knowledge_point set title = $kp$脚注与尾注的显示视图$kp$, content = $kp$脚注和尾注只有在页面视图下才能看到。$kp$, section = '' where id = 31697;
update t_knowledge_point set title = $kp$数据完整性的含义$kp$, content = $kp$保证数据完整性：保护数据不被非法修改，使数据在传输前后保持完全相同。$kp$, section = '' where id = 31701;
update t_knowledge_point set title = $kp$PowerPoint 的视图与声音效果$kp$, content = $kp$可为幻灯片添加声音效果，声音效果可以设置为反复循环。

PowerPoint 的普通视图分为导航缩略图、编辑区、备注窗格三个窗格，是编辑幻灯片的主要视图；浏览视图（幻灯片浏览视图）用于整体查看和调整幻灯片。$kp$, section = '' where id = 31702;
update t_knowledge_point set title = $kp$学生与课程的 m:n 联系转换为关系模式$kp$, content = $kp$学生和课程是多对多的联系（m:n）。转换为关系模式时，学生、课程分别对应一个关系模式；该 m:n 联系单独转换为一个关系模式，其主键由学生主键与课程主键组合而成，并可加入联系自身的属性。$kp$, section = '' where id = 31738;
update t_knowledge_point set title = $kp$系统设计：概念、逻辑与物理结构设计$kp$, content = $kp$系统设计包括概念结构设计、逻辑结构设计、物理结构设计。

1. 概念结构设计：采用 E-R 图作为概念结构设计的工具。
2. 逻辑结构设计：将 E-R 图转化为逻辑关系结构，即二维表。
3. 物理结构设计：设计最合适的存储结构和存储路径。$kp$, section = '' where id = 31740;
update t_knowledge_point set title = $kp$选择运算$kp$, content = $kp$选择是一元运算，记作 σF(R)：从关系 R 中选择满足条件 F 的元组组成一个新关系，即 σF(R) = {t | t ∈ R 且 F(t) 为真}。

选择是从行的角度进行的操作。$kp$, section = '' where id = 31787;
update t_knowledge_point set title = $kp$数据库系统的产生与特征$kp$, content = $kp$20 世纪 60 年代以来，逐步开发了以统一管理和共享数据为主要特征的数据库系统（DBS），由 DBMS 统一管理数据并提供应用服务。$kp$, section = '' where id = 31792;
update t_knowledge_point set title = $kp$传统的关系集合操作$kp$, content = $kp$传统的关系集合操作有：并操作、差操作、交操作（以上三种均为二元操作）和广义笛卡儿积。$kp$, section = '' where id = 31793;
update t_knowledge_point set title = $kp$差运算$kp$, content = $kp$差操作记为 R − S，其结果由属于 R 但不属于 S 的元组组成。差不满足交换律。$kp$, section = '' where id = 31849;
update t_knowledge_point set title = $kp$系统设计的三个阶段$kp$, content = $kp$系统设计：概念结构设计、逻辑结构设计、物理结构设计。

1. 概念结构设计：采用 E-R 图作为概念结构设计的工具。
2. 逻辑结构设计：将 E-R 图转化为逻辑关系结构，即二维表。
3. 物理结构设计：设计最合适的存储结构和存储路径。$kp$, section = '' where id = 31906;
update t_knowledge_point set title = $kp$Android 应用框架层$kp$, content = $kp$应用框架层包括活动管理、窗口管理、内容提供、视图系统、通告管理、包管理、电话管理、资源管理、位置管理、传感器管理以及 Google Talk 服务等。$kp$, section = '' where id = 32335;
update t_knowledge_point set title = $kp$数据的完整性（防篡改）$kp$, content = $kp$保证数据完整性（完整性）：保护数据不被非法修改，使数据在传输前后保持完全相同，防止篡改。$kp$, section = '' where id = 32336;
update t_knowledge_point set title = $kp$NoSQL 的特点$kp$, content = $kp$NoSQL 是一种非关系型数据库管理系统，不需要固定的架构（模式），可以避免 join 连接，并且易于扩展。$kp$, section = '' where id = 32338;
update t_knowledge_point set title = $kp$存储模式（内模式）与 SQL 的非过程性$kp$, content = $kp$存储模式（内模式）：数据在数据库中的内部表示，即对数据的物理结构和存储方式的描述。

综述：应用系统的全局关系模式对应于基本表，其存储结构对应于存储文件；面向用户的局部关系模式对应于视图或部分基本表。

SQL 包含对数据库的全部操作，用 SQL 语言可实现数据库应用过程中的全部活动。使用 SQL 只需指出需要哪类数据（做什么），不必指出获得这些数据的步骤（如何做）。$kp$, section = '' where id = 32340;
update t_knowledge_point set title = $kp$关键词检索与全文检索$kp$, content = $kp$网页检索（搜索引擎）：

关键词检索：精度高，但查全率不高；
全文检索：精度不高，查全率高。

搜索引擎都遵循 robot 协议。$kp$, section = '' where id = 32343;
update t_knowledge_point set title = $kp$设立日志文件的目的$kp$, content = $kp$设立日志文件的目的是：进行事务故障恢复；进行系统故障恢复；协助后备副本进行介质故障恢复。$kp$, section = '' where id = 32344;
update t_knowledge_point set title = $kp$编辑栏的显示与隐藏$kp$, content = $kp$编辑栏如何显示与隐藏：方法一，视图菜单 → 编辑栏；方法二，工具菜单 → 选项 → 视图，选中或不选中“编辑栏”。$kp$, section = '' where id = 32352;
update t_knowledge_point set title = $kp$SQL 是用户与 DBMS 之间的语言$kp$, content = $kp$用户、程序员或 DBA 通过向 DBMS 发送 SQL 命令，让 DBMS 执行 SQL，由 DBMS 访问数据库中的数据，再将结果返回给用户，即所有操作都必须通过 DBMS 完成。因此，SQL 是用户与 DBMS 之间的语言。$kp$, section = '' where id = 32362;
update t_knowledge_point set title = $kp$SQL 中“结构化”的含义$kp$, content = $kp$SQL 语言是“结构化查询语言”，其中“结构化”指用多层嵌套的方式来构造程序，即用多个简单的查询嵌套构成复杂的查询，从而扩充 SQL 的查询能力。$kp$, section = '' where id = 32368;
update t_knowledge_point set title = $kp$数据库控制与数据库保护$kp$, content = $kp$1）数据库的破坏来自四个方面：系统故障、多用户并发访问数据库时造成数据的不一致、人为破坏、输入数据本身是错误的（或更新时造成数据错误）。

2）通过四个方面来实现数据库控制（即数据库保护）：安全性控制、备份与恢复、完整性控制、并发控制。

3）安全性控制：保护数据以防止不合法的使用。主要技术：①用户标识与口令；②访问控制（SQL 中的 GRANT 授权语句、REVOKE 取消授权语句用于访问授权）；③审计；④数据加密；⑤视图的保护。

4）备份与恢复：实现技术是转储和日志。数据库恢复的基本机制就是“冗余”，通过备份来重复存储数据库中的数据。

5）完整性控制：数据库中的数据应该始终保持正确的状态。输入的是垃圾，输出的必然是垃圾。完整性与准确性、正确性、有效性是一个含义，目的是提高并保证数据库中数据的质量。前面讨论的完整性约束，就是完整性控制的措施之一。

6）并发控制：多用户同时共享访问同一个数据库会发生冲突。操作的基本单位是“事务”，一个事务由若干条 SQL 语句组成。规则是：要么一个事务中所有的 SQL 都正确做完，要么一条也不做，不会出现只做了一部分 SQL 语句的情况，这由 DBMS 自动保证。DBMS 通过“封锁”和“串行化”技术对事务的执行次序进行合理调度。$kp$, section = '' where id = 32374;
update t_knowledge_point set title = $kp$搜索引擎的两种信息查询服务方式$kp$, content = $kp$搜索引擎向用户提供两种信息查询服务方式：“目录服务”和“关键字检索”。$kp$, section = '' where id = 32375;
update t_knowledge_point set title = $kp$搜索引擎是 Web 信息检索系统$kp$, content = $kp$搜索引擎实际上就是一种 Web 信息检索系统，目前广泛使用的有 Google、百度、天网、Yahoo、Infoseek、新浪等。$kp$, section = '' where id = 32376;
update t_knowledge_point set title = $kp$关系数据模型的三类完整性规则$kp$, content = $kp$关系数据模型有三类完整性规则：“实体完整性”（主键不能为空值或重值）；“引用完整性”（在关系中不允许引用不存在的实体元组）；“用户自定义完整性约束”（由应用环境对数据的需求而决定）。$kp$, section = '' where id = 32378;
update t_knowledge_point set title = $kp$SQL 是非过程语言$kp$, content = $kp$关系数据库语言 SQL 是一种“非过程”语言；一些主流 DBMS 软件（如 Oracle、Sybase、DB2、SQL Server、Access、VFP）均以命令调用的方式提供了用户使用 SQL 的接口。$kp$, section = '' where id = 32379;
update t_knowledge_point set title = $kp$SQL 数据库的三级体系结构$kp$, content = $kp$SQL 数据库具有三级体系结构：视图（对应用户模式）；基本表（对应逻辑模式）；存储文件（对应存储模式）。$kp$, section = '' where id = 32381;
update t_knowledge_point set title = $kp$系统设计阶段的三级结构设计$kp$, content = $kp$“系统设计”阶段包括：概念结构设计（E-R 图）；逻辑结构设计（即关系模式设计）；物理结构设计（包含存储结构设计和程序结构设计）。$kp$, section = '' where id = 32383;
update t_knowledge_point set title = $kp$Word 的文件打开与各种视图的特点$kp$, content = $kp$打开文件：Ctrl+O。

注：文件菜单显示的文件记录是最近编辑过的文档，默认显示 4 个，最多可以显示 9 个；窗口菜单显示的文件记录是正在打开的文档。

一、视图

普通视图：只显示水平标尺，不显示页眉、页脚，不显示分栏和首字下沉，手绘图形不显示，可以显示分节符和分页符。

大纲视图：不显示水平和垂直标尺，不显示首字下沉，不显示分栏，不显示手绘图形。

页面视图：所见即所得，是显示效果最好的视图，但速度会慢一些。

Web 版式视图：不显示垂直标尺，不显示分栏，可以显示首字下沉和手绘图形。

二、文本与段落格式

设置字体必须选中文本，设置段落只需将光标定位在段中。$kp$, section = '' where id = 32384;
update t_knowledge_point set title = $kp$事务的原子性$kp$, content = $kp$事务的所有操作必须全部完成，否则事务将被撤销。也就是说，事务是作为一个整体的单位处理的，不可以被分割。$kp$, section = '' where id = 32393;
update t_knowledge_point set title = $kp$一对一、一对多、多对多 E-R 图举例$kp$, content = $kp$一、一对一 E-R 图举例

例 1：两个实体集之间一对一的联系的绘制方法。假设某学院有若干个系，每个系只有一名主任。

主任和系的属性分别如下：

主任——编号，姓名，年龄，学历

系——系编号，系名

主任和系之间是一个“管理”联系，并体现主任的任职时间，如一对一 E-R 图所示。

二、一对多 E-R 图举例

例 2：假设在某仓库管理系统中，有两个实体集：仓库和商品。仓库用来存放商品，且规定一类商品只能存放在一个仓库中，一个仓库可以存放多件商品。

仓库和商品之间是一对多的联系。

仓库——仓库号，地点，面积

商品——商品号，商品名，价格

在“存放”联系中要反映出存放商品的数量，如一对多 E-R 图所示。

三、多对多 E-R 图举例

例 3：假设在某教务管理系统中，一个教师可以上多门课，一门课也可以由多个教师去上，教师和课程之间是多对多的联系。教师和课程可用以下属性来描述：

教师——教师号，教师名，职称

课程——课程号，课程名，班级

在“讲授”联系中应能反映出教师的授课质量，如多对多 E-R 图所示。$kp$, section = '' where id = 32400;
update t_knowledge_point set title = $kp$绝对路径$kp$, content = $kp$绝对路径：如 /usr/local/mysql，从根目录写起的完整路径就是绝对路径。$kp$, section = '' where id = 32459;
update t_knowledge_point set title = $kp$SQL 的组成与特点$kp$, content = $kp$SQL 是结构化查询语言的简称。SQL 由索引、视图、基本表组成。SQL 是非过程语言，可嵌入宿主语言使用。$kp$, section = '' where id = 32461;
update t_knowledge_point set title = $kp$一对一、一对多、多对多 E-R 图举例$kp$, content = $kp$一、一对一 E-R 图举例

例 1：两个实体集之间一对一的联系的绘制方法。假设某学院有若干个系，每个系只有一名主任。

主任和系的属性分别如下：

主任——编号，姓名，年龄，学历

系——系编号，系名

主任和系之间是一个“管理”联系，并体现主任的任职时间，如一对一 E-R 图所示。

二、一对多 E-R 图举例

例 2：假设在某仓库管理系统中，有两个实体集：仓库和商品。仓库用来存放商品，且规定一类商品只能存放在一个仓库中，一个仓库可以存放多件商品。

仓库和商品之间是一对多的联系。

仓库——仓库号，地点，面积

商品——商品号，商品名，价格

在“存放”联系中要反映出存放商品的数量，如一对多 E-R 图所示。

三、多对多 E-R 图举例

例 3：假设在某教务管理系统中，一个教师可以上多门课，一门课也可以由多个教师去上，教师和课程之间是多对多的联系。教师和课程可用以下属性来描述：

教师——教师号，教师名，职称

课程——课程号，课程名，班级

在“讲授”联系中应能反映出教师的授课质量，如多对多 E-R 图所示。$kp$, section = '' where id = 32462;
update t_knowledge_point set title = $kp$会员实体的属性与主码$kp$, content = $kp$实体集“会员”的属性有：身份证号，会员姓名，性别，联系电话，注册时间，密码。

会员实体集中可用身份证号来唯一标识各会员，所以主码为身份证号。$kp$, section = '' where id = 32472;
update t_knowledge_point set title = $kp$图书与会员之间“销售”联系的属性$kp$, content = $kp$确定实体集之间的联系：图书销售给会员时，图书与会员建立关联，联系“销售”的属性有：订购册数，订购时间，是否发货，是否收货，是否结清。

为了更方便标识销售记录，可添加订单号作为该联系的主码。$kp$, section = '' where id = 32474;
update t_knowledge_point set title = $kp$图书销售数据库的 E-R 图与课堂练习$kp$, content = $kp$确定联系关系：因为一个会员可以购买多种图书，一种图书可以销售给多个会员，所以这是一种多对多（m:n）的联系。

根据以上分析可画出网络图书销售数据库的 E-R 图。

课堂练习：学校有若干个学院，每个学院有各自的编号、名称和院长；每个学院有若干名教师和学生，教师有教师号、教师名和职称属性，每个教师可以担任若干门课程，一门课程只能由一位教师讲授，课程有课程号、课程名和学分，并参加多项项目，一个项目有多人合作，且责任轻重有个排名，项目有项目号、名称和负责人；学生有学号、姓名、年龄、性别，每个学生可以同时选修多门课程，选修有分数。请设计此学校教学管理的 E-R 模型。

课堂练习分析：实体集为学院、教师、学生、课程、项目。

数据库和表：数据库可以看成是一个存储数据对象的容器，这些数据对象包括表、视图、触发器、存储过程等，其中表是最基本的数据对象，用以存放数据库的数据。必须首先创建数据库，然后才能创建数据库中的数据对象。MySQL 可以采用两种方式创建、操作数据库和数据对象。$kp$, section = '' where id = 32475;
update t_knowledge_point set title = $kp$用户模式（外模式、子模式）$kp$, content = $kp$1）模式的子集，是数据的局部逻辑结构，也是数据库用户看到的数据视图。

2）用户可以用 SQL 语言对基本表和视图进行查询。$kp$, section = '' where id = 32480;
update t_knowledge_point set title = $kp$SQL 三级结构与应用系统的模式对应关系$kp$, content = $kp$综述：应用系统的全局关系模式对应于基本表，其存储结构对应于存储文件，面向用户的局部关系模式主要对应于视图或部分基本表。

SQL 包括了所有对数据库的操作，用 SQL 语言可实现数据库应用过程中的全部活动。使用 SQL 只需指出需要何类数据（做什么），不必指出获得这些数据的步骤（如何做）。$kp$, section = '' where id = 32481;
update t_knowledge_point set title = $kp$数据库标准语言 SQL$kp$, content = $kp$SQL 是非过程语言，是结构化语言（结构化查询语言），使用方式有嵌入和命令两种。$kp$, section = '' where id = 32484;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (27754,27957,27997,28591,28592,30429,30679,30733,31417,31421,31601,31614,31622,31632,31656,31674,31676,31677,31683,31685,31688,31691,31692,31693,31695,31696,31697,31701,31702,31738,31740,31787,31792,31793,31849,31906,32335,32336,32338,32340,32343,32344,32352,32362,32368,32374,32375,32376,32378,32379,32381,32383,32384,32393,32400,32459,32461,32462,32472,32474,32475,32480,32481,32484) and not deleted) <> 64 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
