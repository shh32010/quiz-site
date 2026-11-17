-- P0-C 第 3 批（25 道：18 写入 + 7 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(340736, NULL, NULL, 'manual'),(340904, NULL, NULL, 'manual'),(340920, $q$算法的时间复杂度衡量算法执行过程中所需基本运算次数 T(n) 随问题规模 n 增长的趋势，与程序长度、指令条数无关；选项 A 描述的是空间复杂度。故选 C。$q$, NULL, 'keep'),(340983, $q$Cache 与主存之间的地址映像由硬件地址变换机构自动完成，对程序员透明；程序员按逻辑地址编程，操作系统也不介入每一次映射，调度与协议完成均非正确说法。故选 A。$q$, NULL, 'keep'),(340990, $q$程序调试在测试发现错误之后进行，任务是定位、诊断错误的性质与原因并加以改正；尽可能多地发现程序中的错误是软件测试的目标，调试也无法保证改正所有错误。故选 A。$q$, NULL, 'keep'),(340993, $q$数据流程图 DFD 用于结构化分析阶段，描述系统中数据的流动与加工，属于需求分析工具；PAD 图、程序流程图与总体结构图都是设计阶段描述软件结构与处理过程的工具。故选 C。$q$, NULL, 'keep'),(341037, $q$柱面数等于单个盘面上的磁道数，与盘片数和每面扇区数无关；每面有 2000 个磁道，故柱面数为 2000。3 个盘片、2 个面和 256 个扇区均为干扰信息。故选 D。$q$, NULL, 'keep'),(341040, $q$该描述是选择排序的定义：每趟从未排序序列中挑出最小或最大元素，放到已排序序列的一端。插入排序是把元素逐个插入有序区，希尔排序是分组插入，归并排序是两两有序表合并。故选 D。$q$, NULL, 'keep'),(341070, $q$顺序表按物理位置相邻可随机存取，取第 i 个元素及其前趋元素都是 O(1)；单链表取第 i 个元素需从头扫描为 O(n)，双链表、单向循环链表找前趋或定位同样要遍历。因此顺序表最省时间。故选 D。$q$, NULL, 'keep'),(341078, $q$循环队列用容量为 m 的数组并牺牲一个单元区分队空与队满时，队满条件是尾指针加一取模后等于头指针，即 (rear+1)%m==front；rear%m==front 等价于 front==rear，是队空判据。故选 D。$q$, NULL, 'keep'),(341461, $q$系统软件包括操作系统、语言处理程序和数据库管理系统等，负责管理硬件并为应用软件提供运行环境，Linux 是典型操作系统，属系统软件。Word、Excel 属应用软件，C 语言源程序只是文本代码，并非可运行软件。故选 C。$q$, NULL, 'keep'),(343279, $q$中继器工作在物理层，只能连接物理层协议相同的缆段；集线器各端口同处一个冲突域，故 A、B 正确；三层交换机具备路由功能，可视为带路由的二层交换机，D 也正确。不同 VLAN 间必须经三层设备转发，二层交换机上不能直接通信，C 错误。故选 C。$q$, NULL, 'keep'),(343373, $q$计算机网络按覆盖的地理范围划分为广域网、城域网和局域网，WAN 范围最广、LAN 最小。接入计算机的数量、类型以及拓扑结构属于其他分类维度，不能作为 WAN、MAN、LAN 的划分依据。故选 D。$q$, NULL, 'keep'),(343376, $q$计算机网络由通信子网和资源子网组成：通信子网负责数据传输与转发，资源子网由主机、终端及软件、数据等资源构成。选项 C 因录入错字显示为资源了网，实为资源子网，仍是唯一正确术语，其余三项均非标准概念。故选 C。$q$, NULL, 'keep'),(343386, NULL, NULL, 'manual'),(343444, $q$题干强调微博、微信、博客等产生海量数据，需要磁带库、磁盘阵列这类大容量存储设备支撑，体现大数据数据量大的特征。数据种类繁多指类型多样，处理速度快指实时性，价值密度低指有效信息占比小，均与存储设备无关。故选 A。$q$, NULL, 'keep'),(343447, NULL, NULL, 'manual'),(343572, $q$计算机网络是计算机技术与通信技术相结合的产物：计算机提供数据处理能力，通信技术解决数据传输与交换，二者结合才形成网络。网络技术是计算机网络自身的下位概念，人工智能技术与管理技术也不是其直接来源。故选 B。$q$, NULL, 'keep'),(343698, NULL, NULL, 'manual'),(343742, $q$中继器工作在物理层，作用是把衰减、失真的信号接收后经整形放大再发送，从而延长传输距离。它不识别帧结构，不能连接以太网与令牌环网，不能隔离网段间信息，也不能过滤错误和重复比特，这些都是网桥、路由器等设备的功能。故选 A。$q$, NULL, 'keep'),(344110, NULL, NULL, 'manual'),(344112, $q$WLAN 是有线局域网的延伸和补充，主要解决布线困难场合的接入问题，并非要取代有线局域网，故 B 错误。Wi-Fi 由无线以太网相容联盟提出，属短程无线传输技术；WLAN 利用射频传输数据，二者在教材语境下均归入 IEEE 802.11 系列。故选 B。$q$, 'B', 'change_answer'),(344120, $q$互联网+是互联网与实体经济的深度融合，依托移动互联网、云计算、大数据、物联网等推动传统产业在线化、数据化，其本质是创新驱动而非两者简单相加，故 C 错误。选项 A、B、D 的表述均符合互联网+的内涵。故选 C。$q$, NULL, 'keep'),(344125, NULL, NULL, 'manual'),(344128, $q$城域网的英文为 Metropolitan Area Network，缩写 MAN，覆盖一个城市范围。LAN 为局域网，WAN 为广域网，RAN 一般指无线接入网，均不符合城域网缩写的要求。故选 A。$q$, NULL, 'keep')
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
  IF n <> 18 THEN RAISE EXCEPTION '第 3 批写入数应为 18，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 7 THEN RAISE EXCEPTION '第 3 批人工数应为 7，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
