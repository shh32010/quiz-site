-- P0-B 第 1 批（25 道：23 写入 + 2 人工）
BEGIN;
CREATE TEMP TABLE p0b_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  qtype smallint,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0b_expected (id, analysis, correct, qtype, action) VALUES
(334900, $q$I/O 接口是插在系统总线与外部设备之间的转换部件，一端挂在总线上，另一端连接输入输出设备；CPU 与内存依靠总线直接相连，并不经过 I/O 接口，A 选项把它误解成接口直接连 CPU。故选 D。$q$, NULL, NULL, 'keep'),(334904, $q$现在显卡普遍采用 PCI-E 接口，AGP 早已被它取代，D 选项把新旧接口的替代关系说反了；GPU 决定显卡档次、GB 级显存、显示控制器可集成进 CPU 或芯片组均正确。故选 D。$q$, NULL, NULL, 'keep'),(334911, $q$程序频繁读写硬盘，说明物理内存容量不足，系统只能不断在硬盘虚拟内存与内存之间换入换出，扩充内存可直接减少这种交换；加 CPU 或换硬盘都不能解决根本问题。故选 C。$q$, NULL, NULL, 'keep'),(335428, $q$CPU 通过地址总线直接寻址的只有内存储器（主存），硬盘、光盘、软盘都属于辅助存储器，其中的程序和数据必须先调入内存，才能被 CPU 读取执行。故选 D。$q$, NULL, 1, 'change_type'),(338134, $q$Windows 桌面属于系统盘的用户目录（如 C:\Users\用户名\Desktop），文档虽然显示在桌面上，实际存放在系统盘 C 盘，与 D、E 盘无关。故填 C。$q$, NULL, NULL, 'keep'),(338179, $q$计算机硬件只能识别由二进制指令构成的机器语言，高级语言程序必须先经编译或解释转换成机器语言（目标代码）后才能直接执行。故填机器语言。$q$, '机器语言', NULL, 'change_answer'),(338209, $q$UNIX 最初用汇编语言编写；1973 年 Thompson 与 Ritchie 改用 C 语言重写，C 语言由此成为编写操作系统的主流语言。故填 C 语言。$q$, 'C语言', NULL, 'change_answer'),(338722, $q$IPv6 支持无状态地址自动配置（SLAAC），C 项称不支持自动配置是错误的；地址空间扩大到 128 位、首部格式更灵活、主流操作系统均已支持，这几项均正确。故选 C。$q$, NULL, NULL, 'keep'),(341728, $q$IPv4 首字节取值 1～126 的属于 A 类地址，120 正落在该区间，故 120.195.128.11 为 A 类地址，默认子网掩码是 255.0.0.0。故填 A。$q$, NULL, NULL, 'keep'),(341764, $q$IPv4 地址按首字节划分类别：1~126 为 A 类，128~191 为 B 类，192~223 为 C 类，224~239 为 D 类。210 落在 192~223 区间，网络号占前三个字节，故该地址属于 C 类地址。故填 C。$q$, NULL, NULL, 'keep'),(342006, $q$A 类地址首字节范围为 1~126，B 类为 128~191，C 类为 192~223，D 类为 224~239。155 位于 128~191 之间，网络号占前两个字节，属于 B 类地址。故填 B。$q$, NULL, NULL, 'keep'),(342040, $q$IP 地址用首字节区分类别：1~126 为 A 类，128~191 为 B 类，192~223 为 C 类。155 在 128~191 区间内，因此它是 B 类地址。故填 B。$q$, NULL, NULL, 'keep'),(342211, NULL, NULL, NULL, 'manual'),(342905, $q$数字签名可用公钥密码体制实现，但并非唯一途径，借助可信第三方的对称密钥方案同样能完成签名，故 A 把话说绝对了，是错误项。B、C、D 均正确：签名不保证机密性，常用算法有 RSA、DSS，且能确认完整性。故选 A。$q$, NULL, 1, 'change_type'),(342969, $q$NAT 借助网络地址转换，让多台主机共用少量公网 IP 上网，是缓解 IPv4 地址紧缺的主要办法。DNS 负责域名解析，RARP 完成 MAC 地址到 IP 的解析，NSLOOKUP 只是查询工具，都不能节省地址。故选 B。$q$, NULL, 1, 'change_type'),(345267, $q$C 类地址首字节范围为 192~223，A 类为 1~126，B 类为 128~191，D 类为 224~239。202 落在 192~223 之间，故该 IP 地址属于 C 类地址。故填 C。$q$, NULL, NULL, 'keep'),(347243, $q$首字节 10000010 的最高两位为 10，是 B 类地址标志；换算成十进制为 128+2=130，落在 128~191 区间，故为 B 类地址。故填 B。$q$, NULL, NULL, 'keep'),(349260, $q$十六进制 F4=15×16+4=244。11110100B 同样等于 244，二者相等；1111100B 为 124，3640Q 换算得 1952，173D 即 173，均不等于 244。故选 A。$q$, NULL, 1, 'change_type'),(349359, NULL, NULL, NULL, 'manual'),(352965, $q$烟雾、燃气和二氧化碳浓度检测依靠气敏传感器，光敏传感器只感知光照强弱，故 C 说法错误。温度、湿度、红外传感器分别对应调温、调湿和人体移动侦测，A、B、D 均正确。故选 C。$q$, NULL, 1, 'change_type'),(353010, $q$温度、湿度、人体移动分别对应温度传感器、湿度传感器和红外传感器，A、B、D 说法均正确。探测燃气泄漏、二氧化碳和烟雾浓度靠的是气敏（气体）传感器，光敏传感器只对光照强弱敏感，测不了气体浓度，C 说法错误。故选 C。$q$, NULL, 1, 'change_type'),(356304, $q$IP 地址类别看首字节：1～126 为 A 类，128～191 为 B 类，192～223 为 C 类。128.195.128.11 的首字节是 128，落在 128～191 区间内，因此属于 B 类地址。故填 B。$q$, NULL, NULL, 'keep'),(356396, $q$IP 地址类别由第一段数值决定：A 类 1～126，B 类 128～191，C 类 192～223，D 类 224～239，E 类 240 以上。该地址首段为 202，处于 192～223 之间，属于 C 类地址。故填 C。$q$, NULL, NULL, 'keep'),(356480, $q$IPv4 地址按首字节划分类别：1～126 为 A 类，128～191 为 B 类，192～223 为 C 类。210.77.88.99 的首字节 210 恰好落在 192～223 区间，其余三段不影响判断，故属于 C 类地址。故填 C。$q$, NULL, NULL, 'keep'),(357799, $q$64 位指 CPU 的字长，即整数寄存器和定点运算器的宽度为 64 位，一次可处理 64 位二进制数。A 说的是内存容量，B 说的是运算速度，C 说的是主频，三者都与字长无关。故选 D。$q$, NULL, 1, 'change_type')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    question_type = coalesce(e.qtype, q.question_type),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0b_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer', 'change_type') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0b_expected e
WHERE q.id = e.id AND e.action = 'manual' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0b_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer', 'change_type')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.qtype IS NULL OR q.question_type = e.qtype);
  IF n <> 23 THEN RAISE EXCEPTION '第 1 批写入数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0b_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0b b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.question_type IS NOT DISTINCT FROM b.question_type;
  IF n <> 2 THEN RAISE EXCEPTION '第 1 批人工数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0b_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
