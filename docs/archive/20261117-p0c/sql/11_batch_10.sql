-- P0-C 第 10 批（25 道：12 写入 + 13 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(373805, NULL, NULL, 'manual'),(373857, NULL, NULL, 'manual'),(374543, NULL, NULL, 'manual'),(374630, NULL, NULL, 'manual'),(375314, NULL, NULL, 'manual'),(375469, $q$关联多重性的合法写法只有 1、0..1、1..*、0..*、* 等，星号不能单独出现在两端。*…* 两端皆为星号，不构成合法多重性表达式，其余三项虽书写不规范但含义成立。故选 A。$q$, NULL, 'keep'),(375627, NULL, NULL, 'manual'),(375712, $q$中继器工作在物理层，可连接物理层协议相同的网段；接在集线器上的所有节点同处一个冲突域；三层交换机确为带路由功能的二层交换机。不同 VLAN 成员必须经三层设备转发，不能直接通信。故选 C。$q$, NULL, 'keep'),(375834, $q$接口与接口之间是同类型继承，用泛化关系表示。实现关系用于类实现接口，关联表示结构连接，依赖表示临时使用，三者都不描述接口之间的继承。故选 A。$q$, NULL, 'keep'),(377166, $q$CentOS 7 的网卡配置文件放在 /etc/sysconfig/network-scripts/ 下，命名形如 ifcfg-ens33，与网卡名对应。resolv.conf 是 DNS 配置，ifcfg-ipv6 与 ifcfg 都不是标准网卡配置文件名。故选 B。$q$, NULL, 'keep'),(377269, NULL, NULL, 'manual'),(378208, $q$逻辑或运算中任一操作数为 1 结果即为 1。1.OR.1 的结果是 1，而不是 2，D 项把逻辑或误当算术加法；其余三项均符合或运算真值表。故选 D。$q$, NULL, 'keep'),(378954, NULL, NULL, 'manual'),(379225, $q$查询表中全部记录用 SELECT * FROM 表名。A 项 COUNT(*) 只统计记录条数，B 项 COUNT 后缺参数，C 项缺少选择列，都无法返回整行数据。故选 D。$q$, NULL, 'keep'),(379254, NULL, NULL, 'manual'),(379702, NULL, NULL, 'manual'),(379716, $q$左外连接保留左表全部记录，右表无匹配时以 NULL 填充，SQL 标准关键字为 LEFT JOIN（即 LEFT OUTER JOIN）。JOIN 为内连接，RIGHT JOIN 为右外连接方向相反，CROSS JOIN 为笛卡尔积。故选 D。$q$, NULL, 'keep'),(379793, NULL, NULL, 'manual'),(380103, $q$MySQL 创建数据库的语法为 CREATE DATABASE IF NOT EXISTS 库名，含义是库不存在则创建、已存在则直接使用且不报错。if exists 只判断存在，if not exist、if exist 拼写不完整，均为干扰项。故选 A。$q$, NULL, 'keep'),(380214, NULL, NULL, 'manual'),(380290, NULL, NULL, 'manual'),(380993, $q$医疗物联网终端多为可穿戴设备、体征传感器和移动监护设备，需要随患者移动，难以布线，故以 Wi-Fi、蓝牙、ZigBee、5G 等无线传输为主；有线传输只是固定设备的补充。故选 C。$q$, NULL, 'keep'),(381030, $q$HTML5 新增了离线缓存（Application Cache）、本地存储、音视频等机制，C 正确。它是重大修订而非简单升级；各浏览器支持程度不一，所有主流浏览器过于绝对；其设计面向跨平台，并非仅针对移动端。故选 C。$q$, NULL, 'keep'),(381140, $q$可视化的基本特征通常概括为易懂性、全面性、专业性和交互性，强调把数据直观、完整、专业地呈现出来；必然性与可视化表达无关，不属于其基本特征。故选 C。$q$, NULL, 'keep'),(381435, $q$NoSQL 数据库的基本功能仍是数据管理，即对海量非结构化、半结构化数据进行存储、查询和更新；它反而弱化结构约束，结构管理不是目标，实时性能展示与数据分享也不属于数据库基本功能。故选 A。$q$, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0c_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0c_expected e
WHERE q.id = e.id AND e.action = 'manual' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 12 THEN RAISE EXCEPTION '第 10 批写入数应为 12，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 13 THEN RAISE EXCEPTION '第 10 批人工数应为 13，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 10 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
