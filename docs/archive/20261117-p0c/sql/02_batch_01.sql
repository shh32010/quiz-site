-- P0-C 第 1 批（25 道：20 写入 + 5 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(335979, NULL, NULL, 'manual'),(335992, NULL, NULL, 'manual'),(335998, $q$截至 2021 年年底，中芯国际实现量产的最先进工艺是 14nm，7nm 当时尚处研发或风险试产阶段，10nm 并非国产量产节点，28nm 更早。因此国产芯片当时能量产的最新技术为 14nm。故选 C。$q$, NULL, 'keep'),(336029, $q$PS/2 是六针圆形接口，早期专门用于连接鼠标和键盘；USB 为扁平矩形接口，PCI 是主板内部总线插槽，网口为 RJ-45 接口。故鼠标使用的六针插口是 PS/2。故选 A。$q$, NULL, 'keep'),(336030, $q$键盘是 PC 机的标准输入设备，承担字符与命令输入，缺少键盘计算机无法正常操作；鼠标、扫描仪和数字化仪虽也属输入设备，但通常视为可选外设。故选 A。$q$, NULL, 'keep'),(336031, $q$盲打定位键是主键盘区的 F 键和 J 键，键上有凸起，而不是 F 和 H，故 D 错误；键盘是常用输入设备、按键多为电容式、无线键盘可用蓝牙或红外连接均正确。故选 D。$q$, NULL, 'keep'),(336032, $q$数码相机用 CCD 或 CMOS 感光成像，不需要胶卷，属于图像输入设备，A、B、C 均正确；其接口除 USB 外还可用 IEEE1394、读卡器或无线方式，只能使用 USB 的说法过于绝对，故 D 错误。故选 D。$q$, NULL, 'keep'),(336034, $q$电容式键盘无触点，击键声音小而不是大，故 D 描述错误；键盘是必不可少的输入设备、盲打定位键为 F 和 J、目前主流键盘多为电容式，均符合教材表述。故选 D。$q$, NULL, 'keep'),(336047, $q$激光打印机先用激光束在感光鼓上扫描形成静电潜像，再吸附碳粉并转印、加热定影到纸上；钢针排列属针式打印机，喷头喷墨属喷墨打印机，半导体加热元件属热敏打印。故选 D。$q$, NULL, 'keep'),(336063, NULL, NULL, 'manual'),(336196, $q$GPU 是图形处理器，负责图形运算与显示输出，不属于输入设备；传感器采集物理量、CCD 感光成像、手机软键盘输入字符，三者均属输入设备。故选 B。$q$, NULL, 'keep'),(336550, $q$设该进制为 b，则 5×8=40=2b+8，解得 b=16，即为十六进制；6×9=54，而 54=3×16+6，写成十六进制是 36。故选 D。$q$, NULL, 'keep'),(336681, $q$键盘属输入设备、打印机属输出设备，二者都是计算机的外部设备，A 正确；显示器只作输出，不会因显示输入字符而变为输入设备，B 错；彩色显示器颜色远不止 7 种，C 错；打印机可打印图形，D 错。故选 A。$q$, NULL, 'keep'),(336683, $q$CPU 通过数据总线一次存取、加工和传送的一组二进制数据称为字；位是二进制最小单位，字节为 8 位，字长是一个字所含的二进制位数，并非数据本身。故选 A。$q$, NULL, 'keep'),(336687, $q$CPU 是微型计算机的运算与控制核心，主板、内存和 I/O 设备都要在 CPU 的指挥协调下工作，因此硬件系统中最核心的部件是 CPU。故选 B。$q$, NULL, 'keep'),(336692, $q$打印机按工作原理分为针式、喷墨、激光等，原理并不相同，故 A 错；各类打印机分辨率悬殊，打印质量差别很大，B 错；打印纸规格多样，不限于 A4，C 错。使用打印机通常需安装厂商提供的打印驱动程序，D 正确。故选 D。$q$, NULL, 'keep'),(336693, $q$CPU 由运算器、控制器、寄存器组等组成。加法等算术运算及逻辑运算由算术逻辑部件（运算器）完成，控制器负责取指、译码并发出控制信号，总线负责传输，寄存器仅暂存数据。故选 C。$q$, NULL, 'keep'),(336698, $q$输入设备用于向计算机输入数据和指令。光笔、键盘、鼠标均属输入设备；绘图仪是把处理结果绘制到图纸上的输出设备，与打印机同类，不属于输入设备。故选 B。$q$, NULL, 'keep'),(336766, $q$TIF、JPEG、GIF 均为常见图像文件格式，分别用于无损位图、有损压缩照片和网络图形；PDF 是可移植文档格式，主要用于排版文档，虽可嵌入图像，但本身不属于图像文件格式。故选 D。$q$, NULL, 'keep'),(336809, $q$虚拟存储技术在主存与辅存之间借助软件和必要硬件，自动完成信息交换、程序再定位和地址转换，使二者构成统一整体，向用户提供远大于实际主存的地址空间；Cache 是高速缓存，DMA 是直接存储器存取，SSD 是存储介质。故选 C。$q$, NULL, 'keep'),(336918, NULL, NULL, 'manual'),(337107, $q$主板是 PC 机各部件的连接平台，CPU 和内存条通过插座或插槽安装其上；芯片组几乎集成全部控制功能；主板物理尺寸已标准化以便互换安装。软盘驱动器属外设，装在机箱驱动器架上并用排线连接，不装在主板上。故选 D。$q$, NULL, 'keep'),(337244, $q$多任务处理让多个任务轮流占用 CPU，提高利用率，A 正确；其实现依靠操作系统分时调度，单核 CPU 同样可支持多任务，并非必须多核硬件，B 错误；Windows、iOS、Android 均支持多任务。故选 B。$q$, NULL, 'keep'),(337366, $q$引入多任务处理是为提高 CPU 利用率，A 正确；多任务靠操作系统分时调度实现，单核 CPU 也能运行多个任务，不需多核硬件支撑，故 B 错误；Windows、iOS、Android 都支持多任务。故选 B。$q$, NULL, 'keep'),(337469, NULL, NULL, 'manual')
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
  IF n <> 20 THEN RAISE EXCEPTION '第 1 批写入数应为 20，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 5 THEN RAISE EXCEPTION '第 1 批人工数应为 5，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
