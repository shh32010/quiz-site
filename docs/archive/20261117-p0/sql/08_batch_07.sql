-- P0-211 第 7 批（25 道：22 写入 + 3 标 uncertain/manual）
BEGIN;
CREATE TEMP TABLE p0_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0_expected (id, analysis, correct, stem, action) VALUES
(359687, $q$当前 PC 机硬盘普遍采用 SATA 串行接口与主板连接；SCSI 多用于服务器，IDE 属早期并口，PS/2 则是键盘鼠标接口。故选 B。$q$, NULL, NULL, 'keep'),(359769, $q$访问控制要为不同用户规定对信息资源的操作权限，且各类权限的设定必须互不冲突；高强度加密同样不能保证数据不被窃取，硬件加密也未必更好。故选 B。$q$, NULL, NULL, 'keep'),(361424, $q$常见的存储架构按连接方式分为 DAS 直连式存储和 SAN 存储区域网络；GFS 与 HDFS 属于分布式文件系统，不是存储架构。故选 BD。$q$, NULL, NULL, 'keep'),(361632, $q$共享式以太网采用 CSMA/CD 介质访问控制方法，各站点争用同一信道；交换式以太网由交换机按端口转发、实现独享带宽，差异在介质访问控制方法。故选 C。$q$, NULL, NULL, 'keep'),(361712, $q$Windows 和 iOS 在系统内部均以 UTF-16 表示字符信息（Windows 常用 UTF-16LE）；UTF-8 多用于网络传输和文件存储，GB18030 主要面向中文环境。故选 D。$q$, NULL, NULL, 'keep'),(361767, $q$Word 状态栏显示插入点位置、插入/改写状态和显示比例等信息，当前编辑的文件名则显示在窗口标题栏上，不在状态栏中。故选 D。$q$, NULL, NULL, 'keep'),(361873, $q$备注母版实际包含页眉区、页脚区、日期区、幻灯片缩图、数字区和备注文本区，共6个设置，并非只有5个；A、B、D叙述均符合备注母版特点，故选C。$q$, NULL, NULL, 'keep'),(361878, $q$PowerPoint早期版本的5种视图为幻灯片、大纲、幻灯片浏览、备注和幻灯片放映，题干所缺正是大纲视图；普通视图是后来改版才出现的名称，故选B。$q$, NULL, NULL, 'keep'),(361980, $q$把星号看作乘号，原式=7×64+4×8+4=448+32+4=484；而484=256+128+64+32+4，写成二进制即111100100，故选B。$q$, NULL, NULL, 'keep'),(362066, $q$CMOS是易失性存储器，靠电池供电保存硬件配置参数，BIOS程序则固化在ROM中，A把二者混为一谈；B、C、D叙述均正确，故选A。$q$, NULL, NULL, 'keep'),(362427, $q$卫星通信、对流层散射通信和地面接力通信都依靠微波传播，均属于微波远距离通信；光纤通信则用光波在光纤中传输，与微波无关，故选C。$q$, NULL, NULL, 'keep'),(362853, $q$数据库系统只能减少冗余，不会避免一切冗余，A错；一致性指数据逻辑上的相容而非类型一致，D错；C说管理更多数据也非其本质特征；利用冗余数据（备份、日志）恢复故障才是正确叙述，故选B。$q$, NULL, NULL, 'keep'),(363435, NULL, NULL, NULL, 'uncertain'),(363729, $q$美国国防部高级研究计划局ARPA组建的ARPANET是世界上第一个广域网；选项D的APRA只是字母顺序颠倒的拼写干扰项，故选C。$q$, NULL, NULL, 'keep'),(363735, NULL, NULL, NULL, 'manual'),(363897, $q$回收站中的对象既可还原到原位置，也可直接删除或清空，A说法错误；删除后窗口中不再存在，C错；回收站对象不能随意复制、移动，D错；B的彻底删除说法正确，故选ACD。$q$, NULL, NULL, 'keep'),(364972, NULL, NULL, NULL, 'uncertain'),(366988, $q$②说明可用多个CPU提高处理速度，③指出CPU只处理0和1表示的二进制信息，二者正确；①“CPU只能有一个”与④“所有CPU都只是不足4平方厘米的芯片”都过于绝对，故选B。$q$, NULL, NULL, 'keep'),(368205, $q$Excel的基本功能是制作电子表格、绘制图表和管理数据，B的绘制表格也属制表范畴；文字处理是Word的专长，不是Excel的基本功能，故选C。$q$, NULL, NULL, 'keep'),(368470, $q$南京与上海两城市的计算机网络互连，跨越较大地域范围，属于广域网；城域网只覆盖同一城市内部，局域网覆盖范围更小，故选B。$q$, NULL, NULL, 'keep'),(369131, $q$接口状态与线路协议同时为down，说明物理链路未建立，最常见原因是电缆未连接；若只是未设置时钟频率，接口会显示up而协议为down，故选B。$q$, NULL, NULL, 'keep'),(369174, $q$Apache通常以root身份启动，随后派生的子进程默认切换到nobody用户运行，以降低被攻击后的权限风险；root仅用于绑定端口等启动操作，故选D。$q$, NULL, NULL, 'keep'),(369916, $q$卫星通信、地面接力通信和对流层散射通信都依靠微波传播，均属于微波远距离通信；光纤通信则利用光波在光纤中传输，与微波无关，故选C。$q$, NULL, NULL, 'keep'),(369917, $q$数据库系统只能减少冗余而不能避免一切冗余，A错；一致性指数据逻辑相容而非类型一致，D错；使用冗余数据（备份、日志）进行故障恢复正是正确说法，故选B。$q$, NULL, NULL, 'keep'),(370170, $q$‘a’与‘A’的ASCII码相差32，故‘A’=97-32=65；‘F’是‘A’之后的第5个字母，65+5=70，不要按顺序数错成68或71，故选C。$q$, NULL, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    stem = coalesce(e.stem, q.stem),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0_expected e
WHERE q.id = e.id AND e.action IN ('uncertain', 'manual') AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.stem IS NULL OR q.stem = e.stem);
  IF n <> 22 THEN RAISE EXCEPTION '第 7 批写入数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0 b ON b.id = q.id
   WHERE e.action IN ('uncertain', 'manual')
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 3 THEN RAISE EXCEPTION '第 7 批 uncertain/manual 数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 7 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
