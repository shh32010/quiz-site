-- P0-C 第 5 批（25 道：25 写入 + 0 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(346541, $q$BMP 在 Windows 下得到广泛支持，TIF 常用于扫描仪与桌面印刷，GIF 支持动画和隔行渐进显示，B、C、D 均正确。JPG 为有损压缩，适合照片；GIF 适合图标、线条图和动画。笼统地说 JPG 比 GIF 更适合网页并不成立。故选 A。$q$, NULL, 'keep'),(346730, $q$由 5×8=28（十六进制）可知该进制为 16；16+17 即 0x16+0x17=0x2D，对应十进制 45，A、B、D 均不符合。故选 C。$q$, NULL, 'keep'),(346920, $q$BMP 在 Windows 环境得到广泛支持，TIF 广泛用于扫描仪和桌面印刷，GIF 支持动画与隔行渐进显示，B、C、D 均正确。JPG 采用有损压缩，适合照片；GIF 适合图标线条图与动画。笼统地说 JPG 更适合网页并不成立。故选 A。$q$, NULL, 'keep'),(349527, $q$一位八进制数对应三位二进制数，因此 8 位二进制需要 ceil(8/3)=3 位八进制才能完整表示，例如 11111111B=377Q。1 位、2 位八进制最多只能表示 3 位、6 位二进制，不够用；4 位则超出需要。故选 C。$q$, NULL, 'keep'),(349592, $q$信息技术按扩展人体器官功能分类：雷达、卫星遥感、传感测量等属于扩展感觉器官功能的感测（获取）与识别技术，用于延伸感知范围、精度和灵敏度。通信扩展神经系统，显示控制扩展效应器官，计算存储扩展大脑。故选 A。$q$, NULL, 'keep'),(349696, $q$GSM 蜂窝系统由网络子系统 NSS、无线基站子系统 BSS、操作维护子系统 OSS 和移动台 MS 四大子系统构成。RNC、BSC、BTS 都是无线接入侧的设备，其中 BSC 与 BTS 属于 BSS 的内部组成，不能与 BSS 并列。BSS 负责无线收发与无线资源管理，连接 NSS 与移动台。故选 B。$q$, NULL, 'keep'),(349713, $q$智能机器人获取外界信息依赖感知能力，即通过视觉、听觉、触觉等传感器采集环境与自身状态数据，为后续决策提供输入。思维、行为、学习能力分别负责推理决策、执行动作与经验积累，都以感知信息为前提，本身并不直接产生信息。故选 C。$q$, NULL, 'keep'),(349742, $q$八进制一位对应二进制三位，12 位二进制整数按每 3 位一组恰好分成 4 组，故需 4 位八进制数表示，例如 111111111111 即 7777。若只取 1 至 3 位，无法容纳 12 位二进制的信息量，会丢失高位数据。故选 D。$q$, NULL, 'keep'),(349743, $q$按位或的规则是有 1 得 1、全 0 才得 0。将 01001101 与 00111101 逐位相或，自高位到低位得 01111101。A 项位数少一位且首位错位，B、D 与逐位运算结果不符，多是把按位或与按位与、异或混为一谈。故选 C。$q$, NULL, 'keep'),(349790, $q$广播是电台向大量听众单向传播，属于点到面、单向的信息系统，听众不能即时回传信息，因此 C 中双向的说法错误。电话是点对点双向交互系统，网络聊天也是双向交互，因特网则是跨越全球的多功能信息系统。故选 C。$q$, NULL, 'keep'),(349807, $q$微软于 2008 年 10 月发布云计算操作系统 Windows Azure，即后来更名的 Microsoft Azure。Google App Engine 属谷歌，蓝云是 IBM 的产品，EC2 是亚马逊的弹性计算云服务，三者均非微软推出。故选 C。$q$, NULL, 'keep'),(349814, $q$人类智能通常概括为感知、思维、学习与行为四个方面：能感知客观世界的信息，能通过思维对知识加工处理，能学习积累并适应环境变化，能对外界刺激作出反应并传递信息。B 项与此四点完整对应。故选 B。$q$, NULL, 'keep'),(349952, $q$数据库是按一定数据模型组织、长期存储且相互关联的结构化数据集合，具有冗余小、独立性高、可共享等特点。DBF 只是某种数据库软件的文件格式，关系是数据库采用的逻辑模型而非数据库本身，一组文件也未体现结构化组织。故选 C。$q$, NULL, 'keep'),(350130, $q$Prolog 是面向逻辑推理与符号处理的逻辑编程语言，广泛用于专家系统、自然语言处理等人工智能领域。VB 与 Pascal 属通用编程语言，Logo 主要面向初学者教学与海龟绘图，虽有 AI 研究背景，但通常不列为人工智能语言。故选 D。$q$, NULL, 'keep'),(350181, $q$按提供方式和信息内容划分，移动业务分为公众信息类、个人信息类、电子商务类等。移动互联网门户面向广大用户统一提供新闻、搜索、导航等公共内容，属于面向大众的信息服务，而非个人定制或交易支付类业务。故选 A。$q$, NULL, 'keep'),(350235, $q$1956 年夏，麦卡锡、明斯基、香农等人于达特茅斯学院召开研讨会，首次正式提出人工智能这一术语，学界以此作为该学科诞生的标志。1955 年只是会议提案与筹备之年，1957 年出现感知机，1965 年已有专家系统雏形。故选 C。$q$, NULL, 'keep'),(350326, $q$设该进制基数为 r，3×3=9 写作 r 进制的 12，即 r+2=9，解得 r=7，为七进制。十进制的 5+6=11，换算成七进制为 1×7+4，即 14。B 项 11 是十进制结果，A 项 10 相当于十进制 7。故选 C。$q$, NULL, 'keep'),(350400, $q$传统医院信息系统多依托院内局域网的有线传输，而医疗物联网大量使用可穿戴设备、体征监测仪与定位标签，需随时随地上传数据，故以无线传输为主，如 Wi-Fi、蓝牙、ZigBee 及移动网络。有线传输受布线和移动性限制。故选 C。$q$, NULL, 'keep'),(350798, $q$设该进制基数为 r，3×3=9 记作 12，即 r+2=9，解得 r=7，为七进制。十进制 5+6=11，写成七进制为 1×7+4，即 14。A 项 10 对应十进制 7，B 项 11 是十进制写法，D 项 21 无运算依据。故选 C。$q$, NULL, 'keep'),(351043, $q$异或运算两位相同得 0、不同得 1，x 与自身每一位都相同，按位异或结果必为全 0。x 与 x 相与或相或仍等于 x 本身，非 0 值不变；按位取反得到的是 x 的反码，对非全 1 的数也不为零。故选 D。$q$, NULL, 'keep'),(351046, $q$二进制 10000 即十进制 16，00101 即 5，相减得 11，写成四位二进制为 1011，题干选项补齐前导零即 01011。干扰项 1101 对应十进制 13，是把减法误作加法或漏算借位的结果。故选 A。$q$, NULL, 'keep'),(351064, $q$两数按位相加：01010101 为 85，10010010 为 146，和为 231，在 8 位内表示为 11100111，最高位虽有进位但未超出字长。11101011 是漏算某一位进位得到的典型错误结果。故选 C。$q$, NULL, 'keep'),(351067, $q$入侵检测系统的标准流程为信息收集、数据分析、响应三步：先采集网络与主机数据，再由检测引擎分析判定是否遭受攻击，最后告警处置。数据处理、统计只是分析前的中间环节，不能与响应并列。故选 A。$q$, NULL, 'keep'),(351095, $q$该流程为信息收集、数据分析、响应：收集到数据后必须由检测引擎进行分析比对以判定是否入侵，再进入响应环节。数据统计只是分析的一种手段，信息追踪不属标准三步之列。故选 D。$q$, NULL, 'keep'),(351110, $q$位（bit）才是信息存储的最小单位，字节是存储容量的基本单位，故 D 错。汉字编码与 ASCII 编码方式确不相同，A 对；冯·诺依曼机中指令与数据同存于存储单元，B 对；外存信息须先调入内存才能被 CPU 访问，C 对。故选 D。$q$, NULL, 'keep')
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
  IF n <> 25 THEN RAISE EXCEPTION '第 5 批写入数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批人工数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
