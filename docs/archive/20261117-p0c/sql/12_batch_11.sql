-- P0-C 第 11 批（25 道：21 写入 + 4 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(381974, NULL, NULL, 'manual'),(384095, $q$逻辑或运算只要有一个操作数为 1，结果即为 1，因此 1 OR 1 仍等于 1，不会等于 2；A、B、C 均符合或运算真值表，只有 D 违反布尔代数基本规则。故选 D。$q$, NULL, 'keep'),(385515, NULL, NULL, 'manual'),(388574, $q$Caps Lock 键用于切换字母大小写，指示灯亮时按字母键直接输入大写字母。热启动需 Ctrl+Alt+Del 组合；数字键上部的特殊字符需配合 Shift 输入；D 所述大小写状态相反。故选 C。$q$, NULL, 'keep'),(388579, $q$对软盘写保护后只能读取不能写入，病毒无法写入介质，因而在使用过程中不会被感染；杀病毒软件只能查杀已知病毒，防病毒卡监控的是运行环境，都不能确保介质本身不感染病毒。故选 A。$q$, NULL, 'keep'),(388587, NULL, NULL, 'manual'),(388600, $q$Word 中段落格式保存在段末的段落标记中。删除两段之间的段落标记后，前段文字并入后段，合并后的段落沿用保留下来的后一段落标记所带的格式，即采用后一段落的格式，前段的字符格式仍逐字保留。故选 B。$q$, 'B', 'change_answer'),(388853, $q$主板为 CPU 提供插座而非集成 CPU 本身，板上通常有芯片组、DIMM 内存插槽、ROM BIOS、PCI-E x16 显卡插槽和连接硬盘光驱的 SATA 接口，这些说法均正确；把 CPU 视为主板组成部件不准确。故选 A。$q$, NULL, 'keep'),(388862, $q$标识符命名数据、数组为同类型元素的有序集合、指针存放数据对象地址均正确；高级语言允许程序员用结构体、类等自行定义新数据类型，故不能自己定义新数据类型错误。故选 D。$q$, NULL, 'keep'),(388865, $q$ADSL 即非对称数字用户线，利用普通电话铜线，下行速率远高于上行，符合题干下载远大于上传的描述；ATM 为异步传输模式，ISDN 为综合数字业务网，X.25 为分组交换网，均不强调上下行不对称。故选 A。$q$, NULL, 'keep'),(388951, $q$速度由高到低应为 Cache、RAM、硬盘、光盘：Cache 集成在 CPU 附近速度最快，RAM 次之，硬盘为外存，光盘读取最慢。A、C、D 均把 RAM 排在 Cache 之前或把光盘与硬盘次序颠倒。故选 B。$q$, NULL, 'keep'),(388966, $q$防火墙工作在网络边界，能强化安全策略并记录网络活动，但无法查杀主机内已存在的病毒，查杀病毒是防病毒软件的任务；防火墙确实不能防范 IP 地址欺骗，故 D 正确。故选 B。$q$, NULL, 'keep'),(389095, $q$PowerPoint 2003 打印时可输出幻灯片、讲义、备注页和大纲，幻灯片中的文字、图片以及母版上设置的日期都能随页面打印出来；放映时间只是排练计时信息，不属于可打印内容。故选 A。$q$, NULL, 'keep'),(389271, $q$控制器是 CPU 的组成部件，负责取指令、译码并发出控制信号，协调运算器、存储器与 I/O 设备工作；算术逻辑运算由运算器完成，存储数据由存储器承担。故选 D。$q$, NULL, 'keep'),(389276, $q$I/O 控制器（即 I/O 接口）负责对 I/O 设备运行进行全程控制，完成 CPU 与设备间的速度匹配、格式转换和状态管理；CPU 只负责启动和善后，总线仅提供传输通道。故选 B。$q$, NULL, 'keep'),(389291, $q$202.1.1.0 属于 C 类地址，主机号全为 0，是网络地址，不能分配给主机；128.0.0.255 按 B 类默认掩码主机号为 0.255，并非全 0 或全 1，可分配；10.0.0.255、192.1.1.1 也合法。故选 D。$q$, NULL, 'keep'),(389368, $q$远距离传输需把数字信号搭载到高频载波上，发送端调制、接收端解调，合称调制解调；多路复用是共用信道提高利用率，分组交换与路由选择属于数据交换和转发技术。故选 B。$q$, NULL, 'keep'),(389399, NULL, NULL, 'manual'),(389472, $q$题干描述的是 I/O 总线：它为各类 I/O 设备控制器与 CPU、存储器之间提供公用信号线和控制电路；CPU 总线指 CPU 与芯片组的连接，存储器总线面向内存，前端总线属于 CPU 总线。故选 B。$q$, NULL, 'keep'),(389486, $q$操作系统启动后装入主存的是内核以及设备管理、文件管理、网络通信等系统程序；编译程序属于语言处理程序，只在编译源程序时临时调入，不会随系统启动常驻内存。故选 C。$q$, NULL, 'keep'),(389488, $q$网卡的功能是收发数据，按传输介质分为有线与无线两类，也可集成于主板或芯片组中。每块网卡出厂时写入的是全球唯一的 MAC 地址，IP 地址由网络分配设置，而且会变化，并非网卡固有标识。D 项把 MAC 地址说成 IP 地址，混淆了概念。故选 D。$q$, NULL, 'keep'),(389494, $q$口令安全要求是长度足够、输入时防止他人偷看、存放和传送时加密。用生日、电话号码等个人信息作口令，容易被熟悉的人猜到，也容易被穷举攻击试出，属于典型弱口令做法。A、C、D 均为可取的良好习惯。故选 B。$q$, NULL, 'keep'),(389497, $q$MIDI 记录的是音高、音色、力度和时序等乐谱信息，只能表示乐曲，不能表示歌曲中的人声与歌词，因此 A 项错误。B 项说 MIDI 音质与高保真波形声音有差距、C 项说 MIDI 更易于编辑、D 项说 MIDI 数据量少得多，都符合 MIDI 特点。故选 A。$q$, NULL, 'keep'),(389503, $q$result 是在 student 的 Sno、Sname 基础上，按 Sno 相等接入 sc 的 Cno、Grade，并且 sc 中 002 的两条记录都被保留，这符合两表按公共属性 Sno 进行的连接（自然连接）。并、差、交要求属性结构相同，此处不适用。故选 D。$q$, NULL, 'keep'),(389507, $q$在 Word 2003 中自动生成目录，需先给标题设置大纲级别或标题样式，再执行插入菜单中的引用→索引和目录，在对话框中选择目录选项卡生成。对象用于嵌入 OLE 对象，域属于更底层的操作。故选 A。$q$, NULL, 'keep')
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
  IF n <> 21 THEN RAISE EXCEPTION '第 11 批写入数应为 21，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 4 THEN RAISE EXCEPTION '第 11 批人工数应为 4，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 11 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
