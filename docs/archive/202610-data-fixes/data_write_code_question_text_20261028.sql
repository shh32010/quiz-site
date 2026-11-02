-- 非 S1 代码类题目文本清洗（2026-10-28）
-- 仅改 stem/option_json/analysis；correct、question_type、score 不变；金标题未包含。
-- 备份表：t_question_backup_20261028_code_text
begin;
create table if not exists t_question_backup_20261028_code_text as select * from t_question where id in (334862,336280,344696,350259,350266,350278,350284,351789,351794,352457,360227,361743,364688,365466,366249,366256,366284,366434,366557,366558,366819,366820,367316,367451,367671,367837,367984,368296,368699,371848,373181,373248,373346,373376,373419,373420,373477,373669,373670,373739,373743,373780,373800,373905,373913,373954,373996,374297,374346,374347,374348,374352,374353,374356,374365,374366,374433,374434,374464,374465,374508,374515,374542,374543,374547,374590,374630,374645,374676,375097,375338,375875,375882,377181,377213,379035,379688,379691,379693,379720,379724,379999,380185,381970,381972,382027,384475,385512,385928,386127,389074,389235,389335,389661,390353,390471);

update t_question set stem = $qt$下列 SELECT 语句用于查询表中 email 列为空值的行,哪个是正确的?$qt$, option_json = $qt${"A":"SELECT ename,sal,email from emp where email = 0;","B":"SELECT ename,sal,email from emp where email =' :","C":"SELECT ename,sal,email from emp where email is null:","D":"SELECT ename,sal,email from emp where email is not null:"}$qt$, analysis = $qt$空值判断用 IS NULL：SELECT * FROM 表名 WHERE email IS NULL。$qt$ where id = 334862 and not is_golden;
update t_question set stem = $qt$(10 分)【单选题】在语句 SELECT * FROM student WHERE s_name LIKE '%晓%' 中

WHERE 关键字表示的含义是$qt$, option_json = $qt${"A":"条件","B":"在哪里","C":"模糊查询","D":"逻辑查询\n\nlibe.模糊\n\nCourt >3"}$qt$, analysis = $qt$A：WHERE表示条件。$qt$ where id = 336280 and not is_golden;
update t_question set stem = $qt$题30图为某网络工作模式图，该模式下结点间可以相互直接通信，该模式为

This diagram illustrates a network or data exchange process where multiple servers connect to multiple computer servers via directional links.

题30图$qt$, option_json = $qt${"A": "C/S模式", "B": "P2P模式", "C": "B/S模式", "D": "LAN模式"}$qt$, analysis = $qt$结点间可相互直接通信（无中心服务器）属 P2P 模式，故选 B。$qt$ where id = 344696 and not is_golden;
update t_question set stem = $qt$数据库的数据是动态变化的，在程序执行过程中需插入数据，若执行以下 SQL 语句创建一个表 st:

CREATE TABLE st

(no char(6) primary key,

co char(3) NOT NULL,

sc int,

mo char (20)

)

当向st表插入如下行时，（ ）行可以被插入。$qt$, option_json = $qt${"A":"('202001', '001', 78, 重庆)","B":"( '202004', NULL, 98,\" )","C":"(NULL, '003',88, '上海')","D":"( '202002' , '002' , NULL, NULL)"}$qt$, analysis = $qt$主键 no 不可空、co 不可为空：B 的 co 为 NULL、C 的 no 为 NULL 均违反，D 各行合法，故选 D。$qt$ where id = 350259 and not is_golden;
update t_question set stem = $qt$数据库的数据是动态变化的，在程序执行过程中需插入数据，若执行以下 SQL 语句创建一个表 st:

CREATE TABLE st

(no char(6) primary key,

co char(3) NOT NULL,

sc int,

mo char(20)

)

当向 st 表插入如下行时，( )行可以被插入。D$qt$, option_json = $qt${"A":"('202001', '001', '78, 重庆)","B":"('202004', NULL, 98,\")","C":"(NULL, '003', '88, '上海')","D":"('202002','002',NULL,NULL)"}$qt$, analysis = $qt$主键 no 不可空、co 不可为空：D 各行合法（B、C 含 NULL 违反约束），故选 D。$qt$ where id = 350266 and not is_golden;
update t_question set stem = $qt$(1 分)【单选题】设有学生表 student(sno,sname,sage,smajor)，要从 student 表中检索 sname 字段值第二个字是"红"的所有学生信息，下列 WHERE 表达式正确的是$qt$, option_json = $qt${"A":"sname LIKE '_红%'","B":"sname LIKE '_红_'","C":"sname LIKE '%红%'","D":"sname LIKE '%红_'"}$qt$, analysis = $qt$A：第二字为"红"应写成LIKE '_红%'。$qt$ where id = 350278 and not is_golden;
update t_question set stem = $qt$(1 分)【单选题】设有学生表 student(sno,sname,sage,smajor)，要从 student 表中检索 sname 字段值第二个字是"红"的所有学生信息，下列 WHERE 表达式正确的是$qt$, option_json = $qt${"A":"sname LIKE '_红%'","B":"sname LIKE '_红_'","C":"sname LIKE '%红%'","D":"sname LIKE '%红_'\n\nV一位"}$qt$, analysis = $qt$A："_红%"：下划线匹配单字符，故第二个字为红。$qt$ where id = 350284 and not is_golden;
update t_question set stem = $qt$设有如下关系表 S(NO, NAME, SEX, AGE, CLASS), 主关键字是 NO, 其中 NO 为学号, NAME 为姓名, SEX 为性别, AGE 为年龄, CLASS 为班号。查询年龄超过 20 的女生学号和姓名, 要求列名显示为中文, 下列语句正确的是 ( C )。$qt$, option_json = $qt${"A":"SELECT NO,NAME FROM S WHERE AGE>20 AND SEX='女'","B":"SELECT NO=学号,NAME=姓名 FROM S WHERE AGE>20 AND SEX='女'","C":"SELECT '学号'=NO, '姓名'=NAME FROM S WHERE AGE>20 AND SEX='女'","D":"SELECT 学号 AS NO, 姓名 AS NAME FROM S WHERE AGE>20 AND SEX='女'"}$qt$, analysis = $qt$把列名显示为中文应使用别名赋值：“'学号'=NO, '姓名'=NAME”（SQL Server 语法），故选 C。$qt$ where id = 351789 and not is_golden;
update t_question set stem = $qt$设有如下关系表 S(NO, NAME, SEX, BIRTH, CLASS), 主关键字是 NO, 其中 NO 为学号, NAME 为姓名, SEX 为性别, BIRTH 为出生日期, CLASS 为班号。查询每位学生的姓名和年龄, 下列语句正确的是 ( A )。$qt$, option_json = $qt${"A":"SELECT NAME AS '姓名',DATEDIFF(YY,BIRTH,GETDATE()) AS '年龄' FROM S","B":"SELECT '姓名' = NAME', '年龄' = GETDATE() - BIRTH FROM S","C":"SELECT NAME = '姓名', YEAR(GETDATE())-YEAR(BIRTH) = '年龄' FROM S","D":"SELECT NAME AS 姓名,DATEDIFF(BIRTH,GETDATE()) AS 年龄 FROM S"}$qt$, analysis = $qt$正确写法：NAME AS '姓名'、DATEDIFF(YY,BIRTH,GETDATE()) AS '年龄'（显示为中文列名），故选 A。$qt$ where id = 351794 and not is_golden;
update t_question set stem = $qt$有下列3个关系模式:

学生S(学号 S# ，姓名SN，性别SS，年龄SA)

课程 C(课程号 C#, 课程名 CN)

学生选课 SC(学号 S#, 课程号 C#, 成绩 G)

若用 SELECT 语句查找选修课程名为 “信息技术” 课程、年龄小于 22 岁的男学生姓名，必须进行关系____的连接。$qt$, option_json = $qt${"A": "S, C, SC", "B": "SC", "C": "SC，C", "D": "S, C"}$qt$, analysis = $qt$查找课程名与性别需连接 S、SC、C 三个关系，故选 A。$qt$ where id = 352457 and not is_golden;
update t_question set stem = $qt$设有关系 R = (A, B, C)。与 SQL 语句 “SELECT A FROM R WHERE B = 17” 等价的关系代数表达式是 ____。$qt$, option_json = $qt${"A":"\\Pi A (R)","B":"\\sigma_{B=17} (R)","C":"\\Pi_A (\\sigma_{B=17} (R))","D":"\\sigma_{b=17} (\\Pi_A (R))"}$qt$, analysis = $qt$SELECT对投影、WHERE对选择。$qt$ where id = 360227 and not is_golden;
update t_question set stem = $qt$在关系数据库中，SQL 提供的 SELECT 查询语句基本形式为:SELECT A_{1} ， A_{2} ，…， A_{n} FROM R_{1} ， R_{2} ，…， R_{m} [WHERE F] 其中 SELECT、FROM 和 WHERE 子句分别对应于二维表的操作。$qt$, option_json = $qt${"A": "连接操作，选择操作，投影操作", "B": "投影操作，连接操作，选择操作", "C": "选择操作，投影操作，连接操作", "D": "投影操作，选择操作，连接操作"}$qt$, analysis = $qt$SELECT、FROM、WHERE 分别对应投影、连接、选择操作，故选 B。$qt$ where id = 361743 and not is_golden;
update t_question set stem = $qt$若有语句:int a = 10；if (a < 100) printf("杭州智狐科技！");以下有关程序设计语言成分描述错误的是（）$qt$, option_json = $qt${"A":"a<b 是运算成分","B":"if 是控制成分","C":"printfprint(\"杭州智狐科技！\"); 是传输成分","D":"int 是传输成分"}$qt$, analysis = $qt$int 是数据成分，'传输成分'错误。$qt$ where id = 364688 and not is_golden;
update t_question set stem = $qt$(1 分)【单选题】如果对关系 R=(A,B,C)执行以下语句 SELECT DISTINCT A FROM R WHERE B=17，则该语句对关系 R 进行了$qt$, option_json = $qt${"A":"选择和连接","B":"选择和投影","C":"连接和投影","D":"交和选择\n\n行\n\n1"}$qt$, analysis = $qt$WHERE 为选择、DISTINCT A 为投影。$qt$ where id = 365466 and not is_golden;
update t_question set stem = $qt$查询男生、女生人数

SELECT s_sex,____(s_sex) AS 个数

FROM student

GROUP BY s_sex$qt$, analysis = $qt$有学生信息表 student，求年龄在 20～22 岁之间(含 20 岁和 22 岁)的学生姓名和年龄的 SQL 语句是:

SELECT sname,age FROM student WHERE age BETWEEN 20 AND 22。

本题重点考的是 BETWEEN AND的使用。

如果填 > = 20 AND age < = 22 也对的。$qt$ where id = 366249 and not is_golden;
update t_question set stem = $qt$t_stuscore 表是课程分数表，结构如下:

create table t stuscore(stuid int, coursename varchar(100), score number);

其中，stuid 为学生编码，coursename 为科目名称，score 为分数。

如何查询各科目分数的最大是 （ ）$qt$, option_json = $qt${"A":"select coursename, max(score) from t_stuscore order by coursename;","B":"select coursename, max(score) from t_stuscore groub by stuid;","C":"select coursename, max(score) from t_stuscore group by coursename;","D":"select coursename, max(score) from t_stuscore;\n\n作者:张志加"}$qt$, analysis = $qt$各科目最高分：SELECT coursename, MAX(score) FROM t_stuscore GROUP BY coursename。$qt$ where id = 366256 and not is_golden;
update t_question set stem = $qt$如果对关系 R=(A,B,C)执行以下语句 SELECT DISTINCT A FROM R WHERE B=17，则该语句对关系 R 进行了$qt$, option_json = $qt${"A":"选择和连接","B":"选择和投影","C":"连接和投影","D":"交和选择\n\ny\nz\n\n行"}$qt$, analysis = $qt$选择+投影。$qt$ where id = 366284 and not is_golden;
update t_question set stem = $qt$使用 nmcli 命令可看下图连接信息。

[zhangzhihu@zhangzhihu network-scripts]____

名称 UUID

类型 设备

ens33 1a5eda7a-8e5c-4720-b059-1567cd025837 802-3-ethernet ens33

virbr0 f0c60ea8-d0c8-4794-bc3e-cbd02d32f104 bridge virbr0

dhcp cf606c51-49f0-4bd7-9f16-398e4e869078 802-3-ethernet --

static 16f69b6e-9e28-44e9-a482-fc6714ab1938 802-3-ethernet --

[zhangzhihu@zhangzhihu network-scripts]\$qt$, analysis = $qt$查看连接：nmcli connection show。$qt$ where id = 366434 and not is_golden;
update t_question set stem = $qt$设有如下关系表 S(NO, NAME, SEX, AGE, CLASS), 主关键字是 NO, 其中 NO 为学号, NAME 为姓名, SEX 为性别, AGE 为年龄, CLASS 为班号。插入 “95031” 班学号为 30、姓名为 “郑和” 的学生记录, 下列语句正确的是 ____。$qt$, option_json = $qt${"A":"INSERT INTO S VALUES(30,'郑和','95031')","B":"INSERT INTO S(NO,NAME,SEX,AGE,CLASS) VALUES(30,'郑和','95031')","C":"INSERT INTO S(NO,NAME,CLASS) VALUES(30,'郑和','95031')","D":"INSERT INTO S(NO,NAME,SEX,AGE,CLASS) VALUES(30,'郑和','NULL','NULL','95031')"}$qt$, analysis = $qt$插入部分列时列名与值一一对应即可：INSERT INTO S(NO,NAME,CLASS) VALUES(30,'郑和','95031')，故选 C。$qt$ where id = 366557 and not is_golden;
update t_question set stem = $qt$设有如下关系表 S(NO, NAME, SEX, AGE, CLASS), 主关键字是 NO, 其中 NO 为学号, NAME 为姓名, SEX 为性别, AGE 为年龄, CLASS 为班号。删除 “95031” 班的男生记录, 下列语句正确的是 ____。$qt$, option_json = $qt${"A":"DELETE FROM S WHERE SEX='男' XOR CLASS='95031'","B":"DELETE FROM S WHERE SEX='男' NOT CLASS='95031'","C":"DELETE FROM S WHERE SEX='男' OR CLASS='95031'","D":"DELETE FROM S WHERE SEX='男' AND CLASS='95031'"}$qt$, analysis = $qt$删除“95031”班的男生两条条件同时满足用 AND，故选 D。$qt$ where id = 366558 and not is_golden;
update t_question set stem = $qt$(1 分)【单选题】要消除查询结果集中的重复值，可在 SELECT 语句中使用关键字$qt$, option_json = $qt${"A":"UNION","B":"DISTINCT","C":"LIMIT","D":"REMOVE\n\ndistinct name, sex男孔三七"}$qt$, analysis = $qt$要消除查询结果集中的重复值，可在 SELECT 语句中使用 DISTINCT，故选 B。$qt$ where id = 366819 and not is_golden;
update t_question set stem = $qt$(1 分)【单选题】在使用 INSERT INTO 插入记录时，对于 AUTO_INCREMENT 列，若需要使其自动增长，下面填充方式中错误的是 Irdlue

是
no
home
vddup.
xuul
→
auto increment

>0
但1.$qt$, option_json = $qt${"A": "填充 NULL 值", "B": "不显式地填充值", "C": "填充数字 0", "D": "填充数字 1"}$qt$, analysis = $qt$同 366817。$qt$ where id = 366820 and not is_golden;
update t_question set stem = $qt$在 Windows 10 上，运行了某安装程序之后显示如下操作界面，说明该软件在本计算机上____安装。可以进行修改、修复和____。

Source Insight 4.0 - Installer
Program Maintenance
Modify, repair, or remove the program.
○ Modify
Change which program features are installed. This option displays the Custom Selection dialog in which you can change the way features are installed.
○ Repair
Repair installation errors in the program. This option fixes missing or corrupt files, shortcuts, and registry entries.
○ Remove
Remove Source Insight 4.0 from your computer.
InstallShield
 Cancel$qt$, analysis = $qt$操作界面显示 Modify、Repair、Remove，说明该软件已在本计算机上安装，可以进行修改、修复和卸载，故填 已、卸载。$qt$ where id = 367316 and not is_golden;
update t_question set stem = $qt$关于 select 语句下列说法正确的是（）$qt$, option_json = $qt${"A":"select (name) from table person: 所有记录的 name 字段的值","B":"select(name) from person where age=12 or name=\"aa\"; or 或者","C":"select (name) from table person where age=12; 查找 age=12 的记录的那个字段的值","D":"select(name, age) from person where age=12 and name=\"aa\"; and 并且"}$qt$, analysis = $qt$select 写法（BD）。$qt$ where id = 367451 and not is_golden;
update t_question set stem = $qt$SELECT SUM (SAL) FROM EMP GROUP BY DEPTNO;功能是（）$qt$, option_json = $qt${"A":"求每个部门中的工资","B":"求每个部门中工资的大小","C":"求每个部门中工资的总和","D":"求每个部门中工资的个数\n\n我的答案:C 正确答案:C\n\n答案解析:\n\n先按DEPTNO分组,求各部门工资的总和。"}$qt$, analysis = $qt$先按DEPTNO分组,求各部门工资的总和。$qt$ where id = 367671 and not is_golden;
update t_question set stem = $qt$查找雇员平均工资大于3000的部门的最高薪水和最低薪水:

SELECT dept AS '部门', MAX(salary) AS '最高薪水', MIN(salary) AS '最低薪水'

FROM tb staff

GROUP BY dept

____>3000$qt$, analysis = $qt$按部门分组后筛选平均工资大于 3000，应加 HAVING AVG(salary)>3000，故填 Having Avg(Salary)>3000。$qt$ where id = 367837 and not is_golden;
update t_question set stem = $qt$文件test的访问权限为rw-r--r--,现要增加所有用户的执行权限和同组用户的写权限,则命令chmod 764 test可以实现。$qt$, analysis = $qt$chmod a+x,g+w test

chmod 775 test

755 = rwxrwxr-x 增加所有用户的执行权限和同组用户的写权限应该是 775。$qt$ where id = 367984 and not is_golden;
update t_question set stem = $qt$在Linux操作系统中，命令“chmod ugo+r file.txt”的作用是()。$qt$, option_json = $qt${"A": "修改文件file1.txt权限为所有者可读", "B": "修改文件file1.txt权限为所有用户可读", "C": "修改文件file1.txt权限为所有者不可读", "D": "修改文件file1.txt权限为所有用户不可读"}$qt$, analysis = $qt$chmod ugo+r file.txt 的作用是修改文件权限为所有用户可读，故选 B。$qt$ where id = 368296 and not is_golden;
update t_question set stem = $qt$在Linux(CentOS7)操作系统中，TCP/IP网络可通过若干文本文件及命令进行配置。

在 Linux(CentOS 7) 操作系统下，可通过命令 (1) 获得如下图所示的网络配置参数。

ens33: flags=4163-dP, BROADCAST, RUNNING, MULTICAST> mtu 1500
 inet 192.168.177.132 netmask 255.255.255.0 broadcast 192.168.177.255
 inet6 fe80::1:95:440a:46c7:3b16 prefixlen 64 scopeid 0x20-dink>
 ether 00:0c:29: bd:35:7a txqueuelen 1000 (Ethernet)
 RX packets 45 bytes 4494 (4.3 KIB)
 RX errors 0 dropped 0 overruns 0 frame 0
 TX packets 76 bytes 8642 (8.4 KIB)
 TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0
to: flags=43-dP, LOOPBACK, RUNNING> mtu 65536
 inet 127.0,0.1 netmask 255.0,0.0
 inet6 :1 prefixlen 128 scopeid 0x10-host>
 loop txqueuelen 1 (Local Loopback)
 RX packets 72 bytes 5696 (5.5 KIB)
 RX errors 0 dropped 0 overruns 0 frame 0
 TX packets 72 bytes 5696 (5.5 KIB)
 TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0
virbro: flags=4099-dP, BROADCAST, MULTICAST> mtu 1500
 inet 192.168.122.1 netmask 255.255.255.0 broadcast 192.168.122.255
 ether 52:54:00: bf:7e:8a txqueuelen 1000 (Ethernet)
 RX packets 0 bytes 0 (0.0 B)
 RX errors 0 dropped 0 overruns 0 frame 0
 TX packets 0 bytes 0 (0.0 B)
 TX errors 0 dropped 0 overruns 0 carrier 0 collisions 0
[zhangzhihuem zZh ]

在 Linux(CentOS 7)操作系统下，可通过命令 (2) 显示路由信息。若主机所在网络的网关 IP 地址为 192.168.177.2,则可使用命令 (3). add default (4) 192.168.177:2 添加网关为默认路由。

在 Linux(CentOS 7)系统中，DNS 查询文件内容如下所示，该文件的默认存储位置为 (5)，当用户做 DNS 查询时，首选 DNS 服务器的 IP 地址为 (6)。

serach domain.test.cn

nameserver 210.34.0.14

nameserver 210.34.0.15

nameserver 210.34.0.16

nameserver 210.34.0.17

seal

文件 (7) 用于存储网络配置信息，请根据图上内容填写下面的空缺信息，完成主机的配置。

| TYPE=Ethernet | IPV6_ADDR_GEN_MODE=stable-privacy |
| --- | --- |
| PROXY_METHOD=none | NAME=ens33 |
| BROWSER_ONLY=no | UUID=1a5eda7a-8e5c-4720-b059-1567cd025837 |
| BOOTPROTO="static" | DEVICE=ens33 |
| DEFROUTE=yes , | ONBOOT=yes |
| IPV4_FAILURE_FATAL=no | IPADDR=(8) |
| IPV6INIT=yes | NETMASK=(9) |
| IPV6_AUTOCONF=yes | (10)=192.168.177.2 |
| IPV6_DEFROUTE=yes | DNS1=8.8.8.8 |
| IPV6_FAILURE_FATAL=no | PREFIX=24 |

| (1) (单选题) 备选答案: A.netconf | B.ifconf | C.netconfig | D.ifconfig |
| --- | --- | --- | --- |
| (2) (单选题) 备选答案: A.net -nr | B.route | C.ifconfig | D.netconfig |
| (3) (单选题) 备选答案: A.route | B.netstat | C.ifconf | D.ifconfig |
| (4) (单选题) 备选答案: A. gateway | B.gw | C.gate | D.g |

| (5)(单选题)备选答案: | A./etc/inet.conf | B./etc/resolv.conf | C./etc/inetd.conf | D./etc/net.conf |
| --- | --- | --- | --- | --- |
| (6)(单选题)备选答案: | A.210.34.0.14 | B.210.34.0.15 | C.210.34.0.16 | D.210.34.0.17 |$qt$, analysis = $qt$(1) ifconfig；(2) netstat -nr；(3) route；(4) gw；(5) /etc/resolv.conf；(6) 210.34.0.14；(7) ifcfg-ens33。$qt$ where id = 368699 and not is_golden;
update t_question set stem = $qt$设职工表 tb_employee，包含字段 eno（职工号）、ename（姓名）、age（年龄）、salary（工资）和 dept（所在部门），要查询工资在 4000-5000 之间（包含 4000、5000）的职工号和姓名，正确的 WHERE 条件表达式是（）$qt$, option_json = $qt${"A":"salary<=4000 AND salary >=5000","B":"4000 = < salary <= 5000","C":"salary BETWEEN 4000 AND 5000","D":"salary IN (4000,5000)"}$qt$, analysis = $qt$工资在 4000~5000 之间：salary BETWEEN 4000 AND 5000，故选 C。$qt$ where id = 371848 and not is_golden;
update t_question set stem = $qt$在 windows 10 上，Windows Update 保持系统更新以提高安全性和性能。通过（）检查和安装更新。$qt$, option_json = $qt${"A":"“设置”>“更新和安全”>“Windows Update”","B":"“设置”>“设备”>“Windows Update”","C":"“设置”>“网络和 Internet”>“Windows Update”","D":"“设置”>“应用”>“Windows Update”"}$qt$, analysis = $qt$在 windows 10 上，Windows Update 保持系统更新以提高安全性和性能。通过“设置”>“更新和安全”>“Windows Update”检查和安装更新。$qt$ where id = 373181 and not is_golden;
update t_question set stem = $qt$若有一个病人表 R（住院号，姓名，

“住院号”唯一标识R表的每一个元组，

“性别”只能为M或F；

“家庭住址”包括省、市、街道、邮编。

以下是创建表 R 的 SQL 语句:

CREATE TABLE R ( ,

住院号 CHAR(8)

姓名 CHAR (25)

性别 CHAR(1)

科室号 CHAR(4) ，

家庭住址 ADDR, //ADDR 为用户定义的类

);$qt$, option_json = $qt${"A":"NOT NULL, PRIMARY KEY","B":"PRIMARY KEY, CHECK('M', 'F')","C":"FOREIGN KEY （科室号），IN（'M', 'F')","D":"PRIMARY KEY, CHECK (性别 IN ('M', 'F'))"}$qt$, analysis = $qt$住院号主键、性别取值限制：PRIMARY KEY 与 CHECK (性别 IN ('M','F'))，故选 D。$qt$ where id = 373248 and not is_golden;
update t_question set stem = $qt$若有一个病人表 R（住院号，姓名，“住院号”唯一标识 R 表的每一个元组，

“性别”只能为M或F;

“家庭住址”包括省、市、街道、邮编。

以下是创建表 R 的 SQL 语句:

CREATE TABLE R ( )

住院号 CHAR(8)____

姓名 CHAR (25)

性别 CHAR(1)

科室号 CHAR(4) ，

家庭住址 ADDR, //ADDR 为用户定义的类

);$qt$, option_json = $qt${"A":"NOT NULL, PRIMARY KEY","B":"PRIMARY KEY, CHECK('M', 'F')","C":"FOREIGN KEY (科室号), IN ('M', 'F')","D":"PRIMARY KEY, CHECK (性别 IN ('M', 'F'))"}$qt$, analysis = $qt$住院号主键、性别取值限制：PRIMARY KEY, CHECK (性别 IN ('M','F'))，故选 D。$qt$ where id = 373346 and not is_golden;
update t_question set stem = $qt$如果学生表 st 是使用以下 MySQL 语句创建的:

CREATE TABLE st (sno CHAR(4) not null,sn CHAR(8),sex CHAR(2),age INT);

下面的 SQL 语句中可以正确执行的是____$qt$, option_json = $qt${"A":"INSERT INTO st(sno,sex,age) VALUES ('s9','男',17);","B":"INSERT INTO st(sn,sex,age) VALUES(\"李安齐\",\"男\",20)","C":"INSERT INTO st(sex,age)VALUES(\"男\",20);","D":"INSERT INTO st(sno,sn)VALUES(\"s9\",\"安齐\",16);"}$qt$, analysis = $qt$sno 为 NOT NULL 必须赋值：INSERT INTO st(sno,sex,age) VALUES ('s9','男',17);，故选 A。$qt$ where id = 373376 and not is_golden;
update t_question set stem = $qt$如下图标所示, 可得知 MySQL____已被安装, 提示可能升级到____。(写版本号即可)

MySQL Installer
MySQL Installer
Upgrading Community
Select Products To Upgrade
Using this wizard you will be able to update your installed products.
Upgradable Products
Product Architecture Installed Upgrade To
MySQL Server X86 7.19 7.28
Available Upgrades
Version Published Changes
 Cancel$qt$, analysis = $qt$已安装 5.7.19，可升级到 5.7.28。$qt$ where id = 373419 and not is_golden;
update t_question set stem = $qt$目前需将 5.7 的版本删除，需要点击“____”。

MySQL Server 5.7 Setup
Change, repair, or remove Installation
Select the operation you wish to perform.
Change
Lets you change the way features are installed.
Repair
Repairs errors in the most recent installation by fixing missing and corrupt files,
shortcuts, and registry entries.
Remove
Removes MySQL Server 5.7 from your computer.
Back Next Cancel$qt$, analysis = $qt$Remove（移除）。$qt$ where id = 373420 and not is_golden;
update t_question set stem = $qt$在MySQL中，有Products（产品）表，包含字段Pname（产品名称）、Price（价格）。若要得到最贵产品的产品名称和产品价格，使用的查询语句SELECT Pname, Price FROM Products WHERE Price = (SELECT MAX (Price) FROM Products)。$qt$, analysis = $qt$价格最高的价格只有一个，但是同一个价格的商品会存在多个了。

所以子查询先把最高价格查出来，然后使用WHERE价格 = 这个价格就行。

SELECT Pname.Price

FROM Products

WHERE Price = (SELECT MAX (Price) FROM Products)$qt$ where id = 373477 and not is_golden;
update t_question set stem = $qt$在MySQL中，查询所有手机号码以“888”结尾，姓“王”的员工姓名和电话。

SELECT姓名，电话

FROM 员工

WHRER 姓名 ____ AND 电话 ____$qt$, option_json = $qt${"A":"LIKE '王_; LIKE '%888'","B":"LIKE '王'; LIKE '____888'","C":"LIKE '王%'; LIKE '%888'","D":"LIKE '王%'; LIKE '____888'"}$qt$, analysis = $qt$姓王 LIKE '王%'、尾 888 LIKE '%888'。$qt$ where id = 373669 and not is_golden;
update t_question set stem = $qt$若有一个病人表R（住院号，姓名，性别，科室号，病房，家庭住址），

“住院号”唯一标识R表的每一个元组，

“性别”只能为M或F

“家庭住址”包括省、市、街道、邮编。

以下是创建表R的SQL语句:

CREATE TABLE R (

住院号 CHAR(8) ____

姓名 CHAR (25)

性别 CHAR(1) ____

科室号CHAR(4），

家庭住址 ADDR, //ADDR 为用户定义的类

);$qt$, option_json = $qt${"A":"NOT NULL,PRIMARY KEY","B":"PRIMARY KEY, CHECK('M', 'F')","C":"FOREIGN KEY (科室号), IN ('M', 'F')","D":"PRIMARY KEY, CHECK (性别 IN ('M', 'F'))\n\n房，家庭住址），"}$qt$, analysis = $qt$住院号主键、性别取值限制：PRIMARY KEY, CHECK (性别 IN ('M','F'))，故选 D。$qt$ where id = 373670 and not is_golden;
update t_question set stem = $qt$以下语句错误的是（）

;

SELECT rank, AVG(salary) FROM people HAVING AVG(salary) > 1000 GROUP BY

rank;$qt$, option_json = $qt${"A":"SELECT rank, AVG(salary) FROM people GROUP BY rank HAVING AVG(salary) > 1000","B":"SELECT rank, AVG(salary) FROM people HAVING AVG(salary) > 1000 GROUP BY rank;","C":"SELECT AVG(salary) FROM people GROUP BY rank HAVING AVG(salary) > 1000;","D":"SELECT rank, AVG(salary) FROM people GROUP BY rank WHERE AVG(salary) > 1000;"}$qt$, analysis = $qt$错误语句：HAVING 无 GROUP、WHERE 后聚合（BD）。$qt$ where id = 373739 and not is_golden;
update t_question set stem = $qt$语句select * from products where prod_name like '%se%'结果集包括( )$qt$, option_json = $qt${"A":"检索products表中prod_name字段以'se'结尾的数据","B":"检索products表中prod_name字段以'se'开关的数据","C":"检索products表中prod_name字段包含'se'的数据","D":"检索products表中prod_name字段不包含'se'的数据"}$qt$, analysis = $qt$like '%se%'：结尾/开头/包含（ABC）。$qt$ where id = 373743 and not is_golden;
update t_question set stem = $qt$语句 select * from products where prod_name like '%se%'结果集包括( )$qt$, option_json = $qt${"A":"检索 products 表中 prod_name 字段以'se'结尾的数据","B":"检索 products 表中 prod_name 字段以'se'开关的数据","C":"检索 products 表中 prod_name 字段包含 'se' 的数据","D":"检索 products 表中 prod_name 字段不包含'se'的数据"}$qt$, analysis = $qt$like（ABC）。$qt$ where id = 373780 and not is_golden;
update t_question set stem = $qt$数据库查询是数据库的核心操作，SQL 语言提供了 SELECT 查询语句，它的基本形式为:

SELECT A_{1}, A_{2}, ·s, A_{n}

FROM R_{1}, R_{2}, ·s, R_{n} 
WHERE F

下述有关上述 SQL-SELECT 查询语句的描述，正确的是（）。$qt$, option_json = $qt${"A":"A_{1}, A_{2}, ·s, A_{n} 指出查询结果表的列名，相应于投影运算","B":"R_{1}, R_{2}, ·s, R_{n} 指出基本表或视图，相应于连接运算","C":"F为条件表达式，相应于选择运算的条件","D":"SELECT A_{1}, A_{2}, ·s, A_{n} FROM R_{1}, R_{2}, ·s, R_{n} 不能省略，但 WHERE F 可以省略"}$qt$, analysis = $qt$同 373795：ABCD。$qt$ where id = 373800 and not is_golden;
update t_question set stem = $qt$(13 分)【单选题】数据查询语句 SELECT 由多个子句构成，（）子句能够将查询结果按

照指定字段的值进行分组$qt$, option_json = $qt${"A":"ORDER BY","B":"LIMIT","C":"GROUP BY","D":"DISTINCT\n\nswhere."}$qt$, analysis = $qt$GROUP BY 分组。$qt$ where id = 373905 and not is_golden;
update t_question set stem = $qt$(1 分)【单选题】在使用 SQL 语句删除数据时，如果 delete 语句后面没有 where 条件值，那么将删除指定数据表中的（）数据。$qt$, option_json = $qt${"A":"部分","B":"全部","C":"指定一条数据","D":"以上皆可\n\nordorby ∵ as²\n子句 limit ∅√5"}$qt$, analysis = $qt$无 WHERE 删全部。$qt$ where id = 373913 and not is_golden;
update t_question set stem = $qt$(2 分)【单选题】给出如下语句的功能:CREATE VIEW test.V_test AS SELECT * FROM test.students WHERE age<19；$qt$, option_json = $qt${"A":"在 test 表上建立一个名为 V_test 的视图 图\n\nCherte vleov V-les L= vse test; As","B":"在 students 表上建立一个查询，存储在名为 test 的表中","C":"在 test 数据库的 students 表上建立一个名为 V_test 的视图","D":"在 test 表上建立一个名为 students 的视图"}$qt$, analysis = $qt$在 test 库 students 表建 V_test 视图。$qt$ where id = 373954 and not is_golden;
update t_question set stem = $qt$某信用卡客户管理系统中，客户模式为:

Credit_in（C_no 客户号，C_name 客户姓名，limit 信用额度，Credit_balance 累计消费额），若查询剩余额度大于 4500 的客户姓名以及累计消费额，其 SQL 语句应为:

Select C_name ,Credit_balance

From credit_in

Where$qt$, option_json = $qt${"A":"limit>4500","B":"Credit_balance > 4500","C":"limit - Credit_balance > 4500","D":"Credit_balance - limit > 4500"}$qt$, analysis = $qt$剩余额度=信用额度−累计消费额：limit - Credit_balance > 4500，故选 C。$qt$ where id = 373996 and not is_golden;
update t_question set stem = $qt$若用如下的 SQL 语句创建了一个表 SC: ( )

CREATE TABLE SC (S# CHAR (6) NOT NULL, C# CHAR (3) NOT NULL, SCORE INTEGER, NOTE CHAR (20)); 向 SC 表插入如下行时，（）行可以被插入。$qt$, option_json = $qt${"A":"(NULL,' 103', 80,' 选修')","B":"(' 200823', ' 101', NULL, NULL)","C":"(' 201132', NULL, 86,' ')","D":"(' 201009', ' 111', 60, 必修)"}$qt$, analysis = $qt$S#、C# 为 NOT NULL，其余列可空：('200823','101',NULL,NULL) 可插入，故选 B。$qt$ where id = 374297 and not is_golden;
update t_question set stem = $qt$查询部门人数大于2的部门员工平均工资的SQL语句如下:

SELECT ____

FROM 工资表

GROUBY BY 部门$qt$, option_json = $qt${"A":"部门，AVG(应发工资) AS 平均工资；WHERE COUNT(姓名)>2","B":"姓名，AVG(应发工资)AS平均工资；HAVINGCOUNT(姓名)>2","C":"部门，AVG(应发工资) AS 平均工资；HAVING COUNT(姓名)>2","D":"姓名，AVG(应发工资) AS 平均工资；WHERE COUNT(姓名)>2"}$qt$, analysis = $qt$SELECT 部门

FROM 工资表

ORDER BY 部门

HAVING COUNT(姓名)>2;$qt$ where id = 374346 and not is_golden;
update t_question set stem = $qt$将设计部门的基本工资增加 20% 的 SQL 语句如下:

UPDATE 工资表$qt$, option_json = $qt${"A":"SET 基本工资 = 基本工资 * 1.2 HAVING 部门 = 设计部门","B":"SET 基本工资 = 基本工资 * '1.2' WHERE 部门 = 设计部门","C":"SET 基本工资 = 基本工资 * '1.2' HAVING 部门 = 设计部门","D":"SET 基本工资 = 基本工资 * 1.2 WHERE 部门 = '设计部门'"}$qt$, analysis = $qt$UPDATE 工资表

SET 基本工资 = 基本工资 * 1.2

WHERE 部门 = '设计部门';$qt$ where id = 374347 and not is_golden;
update t_question set stem = $qt$查询部门人数大于2的部门员工平均工资的SQL语句如下:

SELECT ____

FROM 工资表

GROUBY BY 部门$qt$, option_json = $qt${"A":"部门，AVG(应发工资) AS 平均工资；WHERE COUNT(姓名)>2","B":"姓名，AVG(应发工资) AS 平均工资；HAVING COUNT(姓名)>2","C":"部门，AVG(应发工资) AS 平均工资；HAVING COUNT(姓名)>2","D":"姓名，AVG(应发工资)AS平均工资；WHERECOUNT(姓名)>2"}$qt$, analysis = $qt$SELECT 部门

FROM 工资表

ORDER BY 部门

HAVING COUNT(姓名)>2;$qt$ where id = 374348 and not is_golden;
update t_question set stem = $qt$在MySQL中，查询所有手机号码以“888”结尾，姓“王”的员工姓名和电话。

SELECT姓名，电话

FROM 员工

WHRER 姓名 ____ AND 电话 ____$qt$, option_json = $qt${"A":"LIKE '王_; LIKE \"%888\"","B":"LIKE '王'; LIKE '____888'","C":"LIKE '王%'; LIKE '%888'","D":"LIKE '王%'; LIKE '____888'"}$qt$, analysis = $qt$LIKE 匹配中 是一个任意字符，%是多个。 本题中姓“王”，名字可以有多个的，所以使用‘王%’ 电话话，记住不一定是手机号（中国大陆的话），也可以是非中国区，或者是座机哦， 所以直接%888'就$qt$ where id = 374352 and not is_golden;
update t_question set stem = $qt$若有一个病人表R（住院号，姓名，性别，科室号，病房，家庭住址），

“住院号”唯一标识R表的每一个元组，

“性别”只能为M或F

“家庭住址”包括省、市、街道、邮编。

以下是创建表R的SQL语句:

CREATE TABLE R (

住院号 CHAR(8) ____,

姓名CHAR(25)

性别 CHAR(1) ____

科室号 CHAR(4),

家庭住址 ADDR, //ADDR 为用户定义的类

);$qt$, option_json = $qt${"A":"NOT NULL, PRIMARY KEY","B":"PRIMARY KEY, CHECK('M','F')","C":"FOREIGN KEY (科室号), IN ('M', 'F')","D":"PRIMARY KEY, CHECK (性别 IN ('M', 'F'))"}$qt$, analysis = $qt$住院号是主键，PRIMARY KEY “性别”只能为M或F，需要列检查约束CHECK（性别 IN ('M','F'））$qt$ where id = 374353 and not is_golden;
update t_question set stem = $qt$若有一个病人表R（住院号，姓名，性别，科室号，病房，家庭住址），

“住院号”唯一标识R表的每一个元组，

“性别”只能为M或F

“家庭住址”包括省、市、街道、邮编。

以下是创建表R的SQL语句:

CREATE TABLE R (

住院号 CHAR(8) ____

姓名CHAR(25)

性别 CHAR(1) ____

科室号CHAR(4），

家庭住址 ADDR, //ADDR 为用户定义的类

);$qt$, option_json = $qt${"A":"NOT NULL,PRIMARY KEY","B":"PRIMARY KEY, CHECK('M', 'F')","C":"FOREIGN KEY (科室号), IN ('M','F')","D":"PRIMARY KEY, CHECK (性别 IN ('M', 'F') )"}$qt$, analysis = $qt$住院号主键、性别限 M/F：PRIMARY KEY, CHECK (性别 IN ('M','F'))（选项 D），故选 D。$qt$ where id = 374356 and not is_golden;
update t_question set stem = $qt$查询部门人数大于 2 的部门员工平均工资的 SQL 语句如下:

SELECT ____FROM 工资表 GROUBY BY 部门 __;$qt$, option_json = $qt${"A":"部门，AVG(应发工资) AS 平均工资；WHERE COUNT(姓名)>2","B":"姓名，AVG(应发工资) AS 平均工资；HAVING COUNT(姓名)>2","C":"部门，AVG(应发工资) AS 平均工资；HAVING COUNT(姓名)>2","D":"姓名，AVG(应发工资) AS 平均工资；WHERE COUNT(姓名)>2"}$qt$, analysis = $qt$查询部门人数大于 2 的部门平均工资：SELECT 部门, AVG(应发工资) AS 平均工资 … GROUP BY 部门 HAVING COUNT(姓名)>2（选项 C），故选 C。$qt$ where id = 374365 and not is_golden;
update t_question set stem = $qt$将设计部门的基本工资增加 20% 的SQL语句如下:

UPDATE 工资表____ ____;$qt$, option_json = $qt${"A":"SET 基本工资 = 基本工资 * 1.2 HAVING 部门=设计部门","B":"SET 基本工资 = 基本工资 * '1.2' WHERE 部门=设计部门","C":"SET 基本工资 = 基本工资 * '1.2' HAVING 部门=设计部门","D":"SET 基本工资 = 基本工资 * 1.2 WHERE 部门=\"设计部门\""}$qt$, analysis = $qt$UPDATE 工资表

SET 基本工资 = 基本工资 * 1.2

WHERE 部门 = '设计部门';$qt$ where id = 374366 and not is_golden;
update t_question set stem = $qt$设有如下创建tb_room表的语句:

CREATE TABLE tb_room(

rno CHAR(10) NOT NULL,

rtype CHAR(20) NOT NULL,

rprice INT NULL,

rmemo CHAR(50) NULL);

rmemo CHAR(50) NOLE),
以下语句中，能够正确实现将编号（rno）为 r100 的房间价格（rprice）由 150 元改为 180 元的是（）。$qt$, option_json = $qt${"A":"UPDATE tb room CHANGE rprice=180 WHERE rno='r100';","B":"UPDATE tb room SET rprice=180 WHERE rprice=150;","C":"UPDATE tb room SET rprice=180 WHERE rno='r100';","D":"UPDATE tb room SET rprice='180' WHERE rprice ='150';"}$qt$, analysis = $qt$UPDATE tb_room SET rprice=180 WHERE rno=…。$qt$ where id = 374433 and not is_golden;
update t_question set stem = $qt$若用如下的 SQL 语句创建一个表 SC:

CREATE TABLE SC(

SNO CHAR(6) NOT NULL,

CNO CHAR(3) NOT NULL

SCORE INTEGER,

NOTE CHAR(20);

如果要向 SC 表插入一行记录，其 INSERT 语句为（）。$qt$, option_json = $qt${"A":"INSERT INTO SC VALUES('200823','101',NULL,NULL);","B":"INSERT INTO SC VALUES('201009','111',60,必修);","C":"INSERT INTO SC VALUES(NULL,'103',80,'选修');","D":"INSERT INTO SC VALUES('201132',NULL,86;);"}$qt$, analysis = $qt$（AI 补答）INSERT INTO SC VALUES('200823','101',NULL,NULL); 与表结构四列匹配，故选 A。$qt$ where id = 374434 and not is_golden;
update t_question set stem = $qt$yum 命令中（）是检查可用更新的所有软件包。$qt$, option_json = $qt${"A":"yum check-update","B":"yum update","C":"yum upgrade","D":"yum update <packages>"}$qt$, analysis = $qt$yum check-update 检查可用更新。$qt$ where id = 374464 and not is_golden;
update t_question set stem = $qt$yum 命令中（）是下载更新系统已安装的所有软件包。$qt$, option_json = $qt${"A":"yum check-update","B":"yum update","C":"yum upgrade","D":"yum update <packages> 今令中（）是大规模的版本升级。"}$qt$, analysis = $qt$yum update 更新已安装软件包。$qt$ where id = 374465 and not is_golden;
update t_question set stem = $qt$将设计部门的基本工资增加 20% 的 SQL 语句如下:

UPDATE 工资表____ ____;$qt$, option_json = $qt${"A":"SET 基本工资 = 基本工资 * 1.2\n\nHAVING 部门=设计部门","B":"SET 基本工资 = 基本工资 *'1.2'\n\nWHERE 部门=设计部门","C":"SET 基本工资 = 基本工资 * '1.2'\n\nHAVING 部门=设计部门","D":"SET 基本工资 = 基本工资 * 1.2\n\nWHERE 部门='设计部门'"}$qt$, analysis = $qt$UPDATE 工资表

SET 基本工资 = 基本工资 * 1.2

WHERE 部门 = '设计部门';$qt$ where id = 374508 and not is_golden;
update t_question set stem = $qt$在 MySQL 中, 有一个 product(产品) 表, 包含字段: pname(产品名称), 要从此表中筛选出产品名称为 “智狐” 或者 “知乎” 的记录, 下列语句正确的是()

A SELECT * FROM product ON pname='智狐' OR pname='知乎'

B SELECT * FROM product ON pname='智狐' AND pname='知乎'

C SELECT * FROM product WHERE pname='智狐' OR pname='知乎'$qt$, option_json = $qt${"A":"SELECT * FROM product ON pname='智狐' OR pname='知乎'","B":"SELECT * FROM product ON pname='智狐' AND pname='知乎'","C":"SELECT * FROM product WHERE pname='智狐' OR pname='知乎'","D":"SELECT * FROM product WHERE pname='智狐' AND pname='知乎'"}$qt$, analysis = $qt$筛选产品名称为“智狐”或“知乎”的记录用 WHERE … OR …（选项 C），故选 C。$qt$ where id = 374515 and not is_golden;
update t_question set stem = $qt$现有书目表book，数据见下表。现在执行SQL语句:

UPDATE book SET title= REPLACE(REPLACE(title,'j','a'),'servlet','csharp');

bookid title

1 jsp&servlet
2 jsp
3 Professionalservlet
4 asp

执行结果是( )$qt$, option_json = $qt${"A":"更新了3条记录","B":"更新了2条记录","C":"更新了1条记录\n•","D":"更新了0条记录\n\n我的答案:C 正确答案:A"}$qt$, analysis = $qt$执行这条语句之后， 内容会是: bookid title 1 asp&csharp 2 asp 3 Professionalcsharp 4 asp 所以id是1，2，3的就会被更新。 REPLACE函数是字符$qt$ where id = 374542 and not is_golden;
update t_question set stem = $qt$学生成绩表grade中有字段score(float),现在要把所有在55分至60(包含两个边界值)之间的分数提高5分,以下SQL语句正确的是()

• A. UPDATE grade SET score=score+5
• B. UPDATE grade SET score=score+5 WHERE score>=55 OR score =60

答案解析:

UPDATE grade SET score=score+5 WHERE score BETWEEN 55 AND 60

55分至60(包含两个边界值):

score BETWEEN 55 AND 60

或

score >=55 AND score '阳光卡') 的含义。$qt$, option_json = $qt${"A":"UPDATE grade SET score=score+5 •","B":"UPDATE grade SET score=score+5 WHERE score>=55 OR score <=60 •","C":"UPDATE grade SET score=score+5 WHERE score BETWEEN 55 AND 60 •","D":"UPDATE grade SET score=score+5 WHERE score <=55 AND score >=60 答案解析: UPDATE grade SET score=score+5 WHERE score BETWEEN 55 AND 60 55分至60(包含两个边界值): score BETWEEN 55 AND 60 或 score >=55 AND score <= 60"}$qt$, analysis = $qt$付款方式 NOT IN ('信用卡') 表示 付款方式不是信用卡 OR表示或者 信用卡<>‘阳光卡’表示 信用卡不是阳光卡 MySQL中的 NOT MySQL 支持使用 NOT 对 IN、BETWEEN$qt$ where id = 374543 and not is_golden;
update t_question set stem = $qt$在 mysql 中, 查询姓名第二个字是羊的 正确表达式为()

A SELECT * FROM student WHERE NAME LIKE "_羊%";$qt$, option_json = $qt${"A":"SELECT * FROM student WHERE NAME LIKE \"_羊%\";","B":"SELECT * FROM student WHERE NAME LIKE \"%化%\";","C":"SELECT * FROM student WHERE NAME LIKE \"_2 羊%\";","D":"SELECT * FROM student WHERE NAME LIKE \"羊羊_\";"}$qt$, analysis = $qt$第二个字是羊：LIKE '_羊%'。$qt$ where id = 374547 and not is_golden;
update t_question set stem = $qt$设有如下创建tb_room表的语句:

CREATE TABLE tb_room(

rno CHAR(10) NOT NULL,
rtype CHAR(20) NOT NULL,
rprice INT NULL,
rmemo CHAR(50) NULL);

以下语句中，能够正确实现将编号（rno）为 r100 的房间价格（rprice）由 150 元改为 180 元的是（）。$qt$, option_json = $qt${"A":"UPDATE tb_room CHANGE rprice=180 WHERE rno='r100';","B":"UPDATE tb_room SET rprice=180-WHERE-rprice=150;","C":"UPDATE tb_room SET rprice=180 WHERE rno='r100';","D":"UPDATE tb_room SET rprice='180' WHERE rprice='150';"}$qt$, analysis = $qt$UPDATE tb_room SET rprice=180 WHERE rno=…。$qt$ where id = 374590 and not is_golden;
update t_question set stem = $qt$14. 执行如下创建表的 SQL 语句时出现错误。需要修改的命令行是（）。

CREATE TABLE tb_test(
Sno CHAR(10) AUTO_INCREMENT,
Sname VARCHAR(20) NOT NULL,
Sex CHAR(1),
Scome DATE,
PRIMARY KEY(Sno)$qt$, option_json = $qt${"A":"第 2 行、第 4 行和第 6 行","B":"第 2 行和第 7 行","C":"第 4 行和第 7 行","D":"第 4 行、第 5 行和第 7 行\n\n) ENGINE=InnoDB);\n15 部门表 tb_dept 的定义如下:\n\nCREATE TABLE tb_dept(\n deptno CHAR(2) primary key,\n dname CHAR(20) not null,\n manager CHAR(12),\n telephone CHAR(15)\n\n); 16、对于 tb_room 客房信息表:\n\nCREATE TABLE tb_room(\n rno CHAR(10) NOT NULL,\n rtype CHAR(20) NOT NULL,\n rprice INT NULL,\n rmemo CHAR(50) NULL\n\n);其中各字段含义是:客房类型编号 rno、客房类型 rtype、单价 rprice 及说明 rmemo。"}$qt$, analysis = $qt$外键关键字是[FOREIGN KEY](https://zhida.zhihu.com/search?content_id=180828543&content_type=Article&match_order=1&q=FOREIGN+KEY&zhida_source=entity)。$qt$ where id = 374630 and not is_golden;
update t_question set stem = $qt$设有如下关系表 S(NO, NAME, SEX, AGE, CLASS), 主关键字是 NO, 其中 NO 为学号, NAME 为姓名, SEX 为性别, AGE 为年龄, CLASS 为班号。将学号为 10 的学生姓名改为 “王华”, 下列语句正确的是 ( B )。$qt$, option_json = $qt${"A":"UPDATE FROM S SET NO=10 WHERE NAME='王华'","B":"UPDATE S SET NAME='王华' WHERE NO=10","C":"UPDATE FROM S SET NAME='王华' WHERE NO=10","D":"UPDATE S SET NO=10 WHERE NAME='王华'"}$qt$, analysis = $qt$将学号为 10 的学生姓名改为王华：UPDATE S SET NAME='王华' WHERE NO=10（选项 B），故选 B。$qt$ where id = 374645 and not is_golden;
update t_question set stem = $qt$有关系 S (Sno, SNAME, SAGE), C (Cno, CNAME), SC (Sno, Cno, GRADE)。其中 Sno 是学生号，SNAME 是学生姓名，SAGE 是学生年龄，C# 是课程号，CNAME 是课程名称。要查询选修 “ACCESS” 课的年龄不小于 20 的全体学生姓名的 SQL 语句是 SELECT SNAME FROM S, C, SC WHERE 子句。这里的 WHERE 子句的内容是$qt$, option_json = $qt${"A":"S. Sno = SC. sno and C. Cno = SC. Cno and SAGE>=20 and CNAME='ACCESS'","B":"S. Sno = SC. sno and C. Cno = SC. Cno and SAGE in>=20 and CNAME in 'ACCESS'","C":"SAGE in>=20 and CNAME in 'ACCESS'","D":"SAGE>=20 and CNAME=' ACCESS'"}$qt$, analysis = $qt$（AI 补答）WHERE 条件：S.Sno=SC.sno and C.Cno=SC.Cno and SAGE>=20 and CNAME='ACCESS'，故选 A。$qt$ where id = 374676 and not is_golden;
update t_question set stem = $qt$精化Use Case图。解决Use Case 间的重复不冲突问题，简化Use Case中的对话序列。Use Case图可以有丌同的局次，高局系统的Use Case可以分解为若干个下属子系统中的子Use Case，

在ATM自劣叏款机的工作模型中（用户通过输入正确的用户资料，从银行叏钱的过程），下面丌是参不者的是（）。

（A）用户 （B）ATM叏款机 （C）ATM叏款机管理员 （D）叏款

巩固练习

• 下面丌是用例间主要关系的是（）。

（A）扩展 （B）包含 （C）依赖 （D）泛化

• 对亍一个电子商务网站而言，（）丌是合适的用例。

（A）用户登录（B）预定商品（C）邮寄商品 （D）结账

巩固练习

• 用例中的主要关系有 。
• 用例图的组成要素是

• 建立对象模型是面向对象的开发方法的基本任务，是软件系统开发的基础，也是一个最需要倾注精力和时间的技术活动。
• 对象类与对象的图形表示法是面向对象分析方法的核心技术之它能表达面向对象模型的主要概念。
• UML的对象类图（Class Diagram）与对象图（Object Diagram）具有强大的表达能力，能够有效地对现实世界的业务领域和计算机系统建立可视化的对象模型。
• UML对象类图与对象图表达的是对象模型的静态结构方面。
UML的对象类图与对象图中的一部分图形元素是基本的，如类、对象、关联等，对于任何面向对象模型都是必不可少的；另一部分高级概念及其图形表达方法则不一定都会用到。

在面向对象编程中，类是对现实世界中一组具有相同特征的物体的抽象。
对象类是对象的集合，这些对象具有共同的结构特征、行为特征、联系和诧义。
对象类的图标（Icon）用实线矩形框表示，矩形框中含有若干分隔框，分别包含类的名字、属性、操作、约束以及其他成分等。
操作框中包含对象类的操作。操作实现类的服务功能，它可以被本类的对象请求执行，从而収生某种行为。

| 类名 |
| --- |
| 属性 |
| 操作 |
| ... |

| 学生 |
| --- |
| 姓名 |
| 年龄 |
| 性别 |
| 注册 |
| 选课 |

类的属性（Attribute）是类的命名的性质，属性在类图标的属性分隔框中用文字串说明。
属性有在本对象类中唯一的属性名或标识符。
冒号“:”后跟属性值的数据类型。
可视性（Visibility）用以下可视性标记表示: + （公共），# （保护），– （私用）
可视性也可以用以下关键字表示:public（公共）、protected（保护）、private（私用）。
若可视性标记为“+”或“public”，则为公共属性，可以被外部对象访问。若可视性标记为“#”或“protected”，则为保护属性，可以被本类或子类的对象访问。若可视性标记为“–”或“private”，则为私用属性，不可以被外部对象访问，只能为本类的对象使用。可视性可以缺省，表示该属性不可视。

属性

可视性 属性名 [多重性]:类型 = 初始值

操作（Operation）是对象类的行为特征或动态特征。
一个类可以有多个操作，也可以没有一个操作。没有一个操作的类常用于表达接口或数据表。
参数列表是可选项目，即一个操作可以有参数，也可以没有参数。
操作的可视性的表示方法和含义与属性中相同。

操作可视性 操作名 （参数列表）:返回列表 （性质）

在类图中包含几种模型元素，分别是:类（Class）、接口（Interface）以及类乊间的关系。

接口是一种特殊的类，具有类的结构但丌可被实例化，只可以被实现（继承）。在UML中，接口使用一个带有名称的小圆圈来迚行表示。
在接口中包含一系列操作但是丌包含属性，并且它没有对外界可见的关联。

Worker
+work1() : void
+work2() : void
+work3() : void

UML类图中，有几种关系:

泛化（Generalization）, 实现（Realization），关联（Association)，聚合（Aggregation），组合(Composition)，依赖(Dependency)。

 subgraph Species["UML Category"]
 end

 subgraph Interactions["Interaction Connections"]
 end

 subgraph Connections["Connection"]
 end

【泛化关系】:是一种继承关系，表示一般不特殊的关系，它指定了子类如何特化父类的所有特征和行为。

例如:老虎是劢物的一种，即有老虎的特性也有劢物的共性。

• 【箭头指向】:带三角箭头的实线，箭头指向父类

【实现关系】:是一种类不接口的关系，表示类是接口所有特征和行为的实现.
• 【箭头指向】:带三角箭头的虚线，箭头指向接口。

【关联关系】:是一种拥有的关系，它使一个类知道另一个类的属性和方法；如:老师不学生，丈夫不妻子关联可以是双向的，也可以是单向的。

双向的关联可以有两个箭头或者没有箭头，单向的关联有一个箭头。

【代码体现】:成员发量

【箭头及指向】:带普通箭头的实心线，指向被拥有者

老师不学生是双向关联，老师有多名学生，学生也可能有多名老师。

但学生不某课程间的关系为单向关联，一名学生可能要上多门课程，课程是个抽象的东西他丌拥有学生。

在系统中可能会存在一些类的属性对象类型为其本身，这种特殊的关联称为自关联。
比如:这是一个特殊的管理者，在类成员的位置上声明了自己本身，这就是自关联。

多重性关联关系，表示一个类的对象不另一个类的对象连接的个数。在UML中多重性关联关系可以直接在关联直线上增加一个数字表示不乊对应的另一个类的对象的个数。

| --- | --- |
| 1..1 | 表示另一个类的一个对象只与一个该类对象有关系。 |
| 0..* | 表示另一个类的一个对象与零个或多个该类对象有关系。 |
| 1..* | 表示另一个类的一个对象与一个或多个该类对象有关系 |
| 0..1 | 表示另一个类的一个对象没有或只与一个该类对象有关系。 |
| m..n | 表示另一个类的一个对象与最少m、最多n个该类对象有关系(m<=n)。 |

Student
0..*
Teacher
-students: Student[]

【聚合关系】:是整体不部分的关系，且部分可以离开整体而单独存在。

如车和轮胎是整体和部分的关系，轮胎离开车仍然可以存在。

聚合关系是关联关系的一种，是强的关联关系；关联和聚合在诧法上无法区分，必须考察具体的逻辑关系。

【代码体现】:成员发量

【箭头及指向】:带空心菱形的实心线，菱形指向整体

【组合关系】:是整体不部分的关系，但部分丌能离开整体而单独存在。如公司和部门是整体和部分的关系，没有公司就丌存在部门。组合关系是关联关系的一种，是比聚合关系还要强的关系，它要求普通的聚合关系中代表整体的对象负责代表部分的对象的生命周期。

【代码体现】:成员发量

【箭头及指向】:带实心菱形的实线，菱形指向整体【依赖关系】:是一种使用的关系，即一个类的实现需要另一个类的协劣，所以要尽量丌使用双向的互相依赖.

【代码表现】:尿部发量、方法的参数或者对静态方法的调用

【箭头及指向】:带箭头的虚线，指向被使用者

(a)依赖
(0..*
客户$qt$, analysis = $qt$取款（选项 D）——用户、ATM 取款机、管理员是参与者，取款不是参与者（是行为）。$qt$ where id = 375097 and not is_golden;
update t_question set stem = $qt$(1 分)【单选题】在 SELECT 语句中，可以使用下列（）子句，将结果集中的数据行根

据选择列的值进行逻辑分组，以便能汇总表内容的子集，即实现对每个组的聚合计算 观对每个组的聚合计算。$qt$, option_json = $qt${"A":"LIMIT","B":"GROUP BY","C":"WHERE","D":"ORDER BY\n\n见对每个组的聚合计算t（)，s"}$qt$, analysis = $qt$按选择列的值进行逻辑分组、实现各组聚合计算使用 GROUP BY 子句，故选 B。$qt$ where id = 375338 and not is_golden;
update t_question set stem = $qt$张三退学，更新相关表人数减一

人数减少

UPDATE class SET ____

删除学生

WHERE classid = (SELECT classid FROM student where \name = '张三');

DELETE FROM student WHERE \name = '张三';$qt$, analysis = $qt$UPDATE class SET 人数=人数-1 WHERE classid=(SELECT classid FROM student WHERE name='张三');（填 人数=人数-1）$qt$ where id = 375875 and not is_golden;
update t_question set stem = $qt$张三退学，更新相关表人数减-

人数减少

UPDATE class SET ____

WHERE classid = (SELECT classid FROM student where \name = '张三');

删除学生

DELETE FROM student WHERE \name = '张三';$qt$, analysis = $qt$UPDATE class SET 人数=人数-1 WHERE classid=(SELECT classid FROM student WHERE name='张三');（填 人数=人数-1）$qt$ where id = 375882 and not is_golden;
update t_question set stem = $qt$在修改 YUM 仓库配置文件（CentOS-Bas.reop）时，使用非 vi 命令处理启用 baseurl 配置行数据命令是（）$qt$, option_json = $qt${"A":"sed -i \"s/^#baseurl/baseurl/g\" CentOS-Base.repo","B":"set -i \"s/^#baseurl/baseurl/g\" CentOS-Base.repo","C":"sed -i \"s/^mirrorlist/#mirorlist/g\" CentOS-Base.repo","D":"set -i \"s/^mirrorlist/#mirrorlist/g\" CentOS-Base.repo"}$qt$, analysis = $qt$配置仓库镜像站点步骤： （1）指到[YUM仓库配置文件](https://zhida.zhihu.com/search?content_id=181407199&content_type=Article&match_order=1&q=YUM%E4%BB%93%E5%BA%93%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6&zhida_source=entity)目录(/etc/yum.repos.d/)： cd /etc/yum.repos.d/ (2）备份原始base配置文件（CentOS-Base.repo文件）： cp CentOS-Base.repo CentOS-Base.repo.orig （3）注释mirlist 配置行： sed -i "s/^mirrorlist/#mirorlist/g" CentOS-Base.repo （4）启用baseurl配置行： sed -i "s/^#baseurl/baseurl/g" CentOS-Base.repo （5）修改镜像站的URL： sed -i "s/[http://mirror.centos.org/mirrors.sohu.com/g](https://link.zhihu.com/?target=http%3A//mirror.centos.org/mirrors.sohu.com/$qt$ where id = 377181 and not is_golden;
update t_question set stem = $qt$执行chmod 644 mm.txt 后的权限是（）$qt$, option_json = $qt${"A":"drw-r-r-","B":"-rw-r-r-","C":"lrwxr-r-","D":"rwxr-rw-"}$qt$, analysis = $qt$chmod 644 = -rw-r-r-。$qt$ where id = 377213 and not is_golden;
update t_question set stem = $qt$某信用卡客户管理系统中，客户模式为:credit-in（C-no 客户号，C-name客户姓名，limit 信用额度，Credit-balance 累计消费额），若查询累计消费额大于 4500 的客户姓名以及剩余消费额，其 SQL 语句应为:Select C-name，limit，Credit-balance From credit-in Where_$qt$, option_json = $qt${"A":"limit>4500","B":"Credit-balance>4500","C":"limit-Credit-balance>4500","D":"Credit-balance-"}$qt$, analysis = $qt$查询累计消费额大于 4500：WHERE Credit-balance>4500（选项 B），故选 B。$qt$ where id = 379035 and not is_golden;
update t_question set stem = $qt$若用如下的 SQL 语句创建一个表 SC:
CREATE TABLE SC(
SNO CHAR(6) NOT NULL,
CNO CHAR(3) NOT NULL
SCORE INTEGER,
NOTE CHAR(20);$qt$, option_json = $qt${"A":"INSERT INTO SC VALUES('200823','101',NULL,NULL);","B":"INSERT INTO SC VALUES('201009','111',60,必修);","C":"INSERT INTO SC VALUES(NULL,'103',80,'选修');","D":"INSERT INTO SC VALUES('201132',NULL,86;);"}$qt$, analysis = $qt$（AI 补答）SC 表四列，A 值与列数匹配且非空列均有值，故选 A。$qt$ where id = 379688 and not is_golden;
update t_question set stem = $qt$17 UPDATE user SET name = '吴劳凡' WHERE id = 1 该代码执行的是哪项操作？( )$qt$, option_json = $qt${"A":"添加姓名叫吴劳凡的记录\n返回姓名叫吴劳凡的记录","B":"删除姓名叫吴劳凡的记录","D":"把 id 为 1 记录的姓名更新为吴劳凡"}$qt$, analysis = $qt$UPDATE 把 id=1 的名字改为吴劳凡。$qt$ where id = 379691 and not is_golden;
update t_question set stem = $qt$用户表 user 包含字段 name char(25)、sex char(2)、age int not null，现插入一条数据:“张强,男,25”，以下正确的写法是()
A INSERT INTO user VALUES(张强,男,25); B INSERT INTO user VALUES('张强',男',25);$qt$, option_json = $qt${"A":"INSERT INTO user VALUES(张强,男， 25);","B":"INSERT INTO user VALUES('张强','男'， 25);","C":"INSERT user VALUES ('张强,男'， 25);","D":"INSERT INTO user('张强','男'， 25);"}$qt$, analysis = $qt$（AI 补答）MySQL 中 INSERT INTO 的 INTO 可省略，C 格式正确，故选 C。$qt$ where id = 379693 and not is_golden;
update t_question set stem = $qt$查找学生表 student 中姓名的第二个字为“t”的学生学号 sno 和姓名 sname，下面 SQL 语句正确的是（）。
A SELECT sno, sname FROM student WHERE
sname='t%';
B SELECT sno, sname FROM student WHERE sname
LIKE '_t%';$qt$, option_json = $qt${"A":"SELECT sno, sname FROM student WHERE\n\nsname='t%';","B":"SELECT sno, sname FROM student WHERE sname\n\nLIKE '_t%';","C":"SELECT sno, sname FROM student WHERE sname\n\n'%t_;","D":"SELECT sno, sname FROM student WHERE sname LIKE '%t';"}$qt$, analysis = $qt$（AI 补答）通配符 _ 匹配单个字符，'_t%' 表示第二字为 t，故选 B。$qt$ where id = 379720 and not is_golden;
update t_question set stem = $qt$从学生表(student)中的姓名(sname)字段查找姓“刘”的学生。可以使用如下代码:select * from student where( )。$qt$, option_json = $qt${"A":"sname='刘*'","B":"sname='%刘%'","C":"sname like‘刘%’","D":"sname like‘刘*’"}$qt$, analysis = $qt$sname like '刘%'。$qt$ where id = 379724 and not is_golden;
update t_question set stem = $qt$t_stuscore 表是课程分数表，结构如下:
create table t_stuscore(
stuid int,
coursename varchar(100),
score number
);其中，stuid 为学生编码，coursename 为科目名称，score 为分数。
由于化学科目题目难度较大，老师决定将此科目成绩每人加 5 分;正确的 MySQL 是（）$qt$, option_json = $qt${"A":"update t_stuscore set score=score+5;","B":"update t_stuscore set score=score+5 where coursename='化学';","C":"update t stuscore set score=score-5 where coursename='化学';","D":"update t stuscore set score=5 where coursename='化学';"}$qt$, analysis = $qt$score=score+5。$qt$ where id = 379999 and not is_golden;
update t_question set stem = $qt$设有学生关系 Student(学号, 姓名, 系名, 课程号, 成绩), 则查询至少选修了四门课程的学生学号、姓名及平均成绩的 SELECT 语句为:
SELECT 学号，姓名，AVG(成绩) AS 平均成绩 FROM Student GROUP BY ____ HAVING ____ ，（）$qt$, option_json = $qt${"A":"课程号；COUNT(课程号)>3","D":"学号；COUNT(课程号)>3","B":"课程号；COUNT(DISTINCT 学号)>3","C":"学号；COUNT(DISTINCT 学号)>3"}$qt$, analysis = $qt$GROUP BY 学号 HAVING COUNT(课程号)>3。$qt$ where id = 380185 and not is_golden;
update t_question set stem = $qt$设职工表 tb_employee，包含字段 eno（职工号）、ename（姓名）、age（年龄）、salary（工资）和dept(所在部门)，要查询工资是4000 和 5000 的职工号和姓名，正确的 WHERE 条件表达式是（）。$qt$, option_json = $qt${"A":"salary BETWEEN 4000 AND 5000","B":"salary <=4000 AND salary >=5000","C":"4000 =< salary <=5000","D":"salary IN (4000,5000)"}$qt$, analysis = $qt$本题中需要表示是 4000 和 5000 的，不是区间。所以使用 IN 最适合。$qt$ where id = 381970 and not is_golden;
update t_question set stem = $qt$设有如下查询语句:
SELECT sno FROM tb_student WHERE sname REGEXP '^张|王';
该语句所表达的查询要求是（）。$qt$, option_json = $qt${"A":"检索所有姓名(sname)中不包含'张'、同时不包含'王'的学生信息","B":"检索姓名(sname）第一个字符是'张'或'王'的学生信息","C":"检索所有姓名(sname）中同时包含'张'、‘王'的学生信息","D":"检索最后一个字符是'张'或'王'的学生信息"}$qt$, analysis = $qt$本题中 REGEXP 是正则表达式关键字，这里^ 指首个位置，|指后面可以是|间隔的任意一个。所以查询是查询姓名第一个字符是’张’或‘王’的学生信息。$qt$ where id = 381972 and not is_golden;
update t_question set stem = $qt$如有以下视图，插入操作正确的是（）
ViEW test_view (id,uid,username, userage, usersex) AS SELECT t_user. id\,t_user_info.uid\,t_user.\name\,t_user info,age, t user info,sex FROM t_user, t_user_info WHERE t_user.id = t user info uid:$qt$, option_json = $qt${"A":"INSERT INTO test_view VALUES (11.'子'):","B":"INSERT INTO test_view(uid,userage,usersex) VALUES (11.21.'男'):","C":"INSERT INTO test_view VALUES (11,21.'男'):","D":"INSERT INTO test_view VALUES (NULL, NULL. NULL.'男'):"}$qt$, analysis = $qt$通过视图插入数据，与操作基本表相似。本题中选项 A,C,D 缺省指定字段，VALUES后面给的要和定义中保持一致。选项 B 正确。$qt$ where id = 382027 and not is_golden;
update t_question set stem = $qt$在MySQL数据库中,成功定义了一个视图V1。 CREATE VIEW V1 AS SELECT sno, sname, math FROM student where math>80 with check option; 下列语句无效的是（ ）$qt$, option_json = $qt${"A":"INSERT INTO V1 VALUES(3,'白羊叔',80);","B":"INSERT INTO V1 VALUES(3,'白羊叔',88);","C":"UPDATE V1 SET MATH = 89 WHERE Sho =2;","D":"DELETE FROM V1 WHERE sno =3;"}$qt$, analysis = $qt$WITH CHECK OPTION 视图中插入 math=80 的记录不满足 math>80，语句无效（选项 A），故选 A。$qt$ where id = 384475 and not is_golden;
update t_question set stem = $qt$分析以下SQL语句:

SELECT DISTINCT 产品.产品名称，产品.单价

FROM 产品

WHERE 产品.单价>=(SELECT AVG(单价) FROM 产品)

ORDER BY 产品.单价 DESC

下面说法正确的是( )$qt$, option_json = $qt${"A":"“SELECT AVG(单价)FROM产品”是子查询","B":"“ORDER BY 产品.单价 DESC”是指按单价从低到高顺序排列","C":"查询结果显示的是单价大于平均价格的记录","D":"此查询显示的字段只有“产品名称”\n\n:A : A\n\n答案解析:\n\n选项A 正确。\n\n选项B 错误。DESC是降序（从高到低）\n\n选项C 错误。 >= 是大于或等于\n\n选项D 错误。此查询显示的字段只有“产品名称”和“单价”。"}$qt$, analysis = $qt$选项A 正确。

选项B 错误。DESC是降序（从高到低）

选项C 错误。 >= 是大于或等于

选项D 错误。此查询显示的字段只有“产品名称”和“单价”。$qt$ where id = 385512 and not is_golden;
update t_question set stem = $qt$有关系S（S＃，SNAME，SAGE），C（C＃，CNAME），SC（S＃，C＃，GRADE）。其中S＃是学生号，SNAME是学生姓名，SAGE是学生年龄， C＃是课程号，CNAME是课程名称。要查询选修“ACCESS”课的年龄不小于20的全体学生姓名的SQL语句是SELECT SNAME FROM S，C，SC WHERE子句。这里的WHERE子句的内容是（）。$qt$, option_json = $qt${"A":"SAGE>=20 and CNAME=’ ACCESS’","B":"S.S# = SC.S# and C.C# = SC.C# and SAGE in>=20 and CNAME in ‘ACCESS’","C":"SAGE in>=20 and CNAME in ‘ACCESS’","D":"S.S# = SC.S# and C.C# = SC.C# and SAGE>=20 and CNAME=‘ACCESS’\n\n答案：D"}$qt$, analysis = $qt$三表连接并加条件：S.S#=SC.S# and C.C#=SC.C# and SAGE>=20 and CNAME='ACCESS'（选项 D），故选 D。$qt$ where id = 385928 and not is_golden;
update t_question set stem = $qt$选课表 class 包含学生信息 sid 和课程信息 cid 等属性列,以下语句能够返回至少选修三门课的 sid 是( )。

class

| sname | sid | cid | cname | score |
| --- | --- | --- | --- | --- |$qt$, option_json = $qt${"A":"SELECT sid FROM class WHERE count(cid)>=3","B":"SELECT sid FROM class WHERE max(cid)>=3;","C":"SELECT sid FROM class GROUP BY sid HAVING COUNT(sid)>=3","D":"SELECT sid FROM class GROUP BY cid HAVING COUNT(cid)>=3;"}$qt$, analysis = $qt$GROUP BY sid HAVING COUNT(cid)>=3。$qt$ where id = 386127 and not is_golden;
update t_question set stem = $qt$SQL 查询语句的形式为“Select A from R where F”，其中 A、R、F 分别对应于 ____。$qt$, option_json = $qt${"A": "列名或列表达式、基本表或视图、条件表达式", "B": "视图属性、基本表、表的存储文件", "C": "列名或条件表达式、基本表、关系表达式", "D": "属性序列、表的存储文件、条件表达式"}$qt$, analysis = $qt$SQL语言提供了SELECT语句进行数据库查询。SELECT查询语句简单的形式为:

SELECT A1,A2,…,An

(指出查询结果表的列名,相应于投影操作)

FROM  R1, R2, ·s, Rm

(指出基本表或视图,相应于连接操作)

[WHERE F]

(F 为条件表达式, 相应于选择操作的条件)

因此，本题选A。$qt$ where id = 389074 and not is_golden;
update t_question set stem = $qt$已知关系模式: 学生表(学号, 姓名, 性别, 出生年月), 其中“学号”为主键, 若要查询所有女生的学号与姓名, 则 SQL 语句为: ____ 学号, 姓名 FROM 学生表 WHERE 性别 = “女”。$qt$, analysis = $qt$SELECT 查询语句简单的形式为:

SELECT A1,A2,…,An

(指出查询结果表的列名,相应于投影操作)

FROM R1,R2,... ,Rm

(指出基本表或视图,相应于连接操作)

[WHERE F]

(F 为条件表达式, 相应于选择操作的条件)

因此，本题填“SELECT”。$qt$ where id = 389235 and not is_golden;
update t_question set stem = $qt$已知关系模式:学生表(学号,姓名,性别,出生年月),其中“学号”为主键,若要查询所有女生的学号与姓名,则 SQL 语句为______学号,姓名 FROM 学生表 WHERE 性别=“女”。$qt$, analysis = $qt$SELECT 查询语句简单的形式为:

SELECT A1,A2,…,An

(指出查询结果表的列名,相应于投影操作)

FROM R1,R2,... ,Rm

(指出基本表或视图,相应于连接操作)

[WHERE F]

(F 为条件表达式, 相应于选择操作的条件)

因此，本题填“SELECT”。$qt$ where id = 389335 and not is_golden;
update t_question set stem = $qt$SQL 查询语句形式为“Select A from R where F”，其中 F 对应于基本表或视图。$qt$, analysis = $qt$SQL 语言提供了 SELECT 语句进行数据库查询。SELECT 查询语句简单的形式为:

SELECT A1,A2,…,An

(指出查询结果表的列名,相应于投影操作)

FROM R1,R2,... ,Rm

(指出基本表或视图,相应于连接操作)

[WHERE F]

(F 为条件表达式, 相应于选择操作的条件)

因此，本题“错误”。$qt$ where id = 389661 and not is_golden;
update t_question set stem = $qt$下列 C 语言程序的输出结果是（ ）```txt
# include < stdio . h >
void fun ( int a , int b )
{
    a=3;
    b=4;
}
int main ( void )
{
    int x =1, y =2;
    fun ( x , y );
    printf ("% d , d ", x , y );
    return 0;
}$qt$, option_json = $qt${"A":"3,4","B":"1,2","C":"3,2","D":"1,4\n```"}$qt$, analysis = $qt$值传递：fun 内修改形参不影响实参，输出 1,2（选项 B），故选 B。$qt$ where id = 390353 and not is_golden;
update t_question set stem = $qt$在 C 语言中, 设有数组声明 char str[5]={'m','n','\0','t','\0'}; 则执行语句 printf("%s",str); 的结果是$qt$, option_json = $qt${"A":"mn t","B":"'mn'","C":"mn","D":"mn\\0t"}$qt$, analysis = $qt$char str[5]={'m','n','\0','t','\0'}：输出遇 '\0' 结束为 mn（选项 C），故选 C。$qt$ where id = 390471 and not is_golden;

do $$
begin
  if (select count(*) from t_question where id in (334862,336280,344696,350259,350266,350278,350284,351789,351794,352457,360227,361743,364688,365466,366249,366256,366284,366434,366557,366558,366819,366820,367316,367451,367671,367837,367984,368296,368699,371848,373181,373248,373346,373376,373419,373420,373477,373669,373670,373739,373743,373780,373800,373905,373913,373954,373996,374297,374346,374347,374348,374352,374353,374356,374365,374366,374433,374434,374464,374465,374508,374515,374542,374543,374547,374590,374630,374645,374676,375097,375338,375875,375882,377181,377213,379035,379688,379691,379693,379720,379724,379999,380185,381970,381972,382027,384475,385512,385928,386127,389074,389235,389335,389661,390353,390471) and not deleted and not is_golden) <> 96 then
    raise exception 'C 题目清洗条目数异常';
  end if;
end $$;
commit;
