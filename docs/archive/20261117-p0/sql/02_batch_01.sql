-- P0-211 第 1 批（25 道：24 写入 + 1 标 uncertain/manual）
BEGIN;
CREATE TEMP TABLE p0_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0_expected (id, analysis, correct, stem, action) VALUES
(334586, $q$X99 是 Intel 芯片组的型号，在主板上承担南桥（PCH）的角色，负责汇集 SATA、USB 等低速外设接口，并与 CPU 交换数据；BIOS、CMOS 芯片容量小，不会使用这种编号。故选 D。$q$, NULL, NULL, 'keep'),(334597, $q$设备管理程序统一管理各种输入输出设备、处理用户和应用程序的 I/O 请求，并通过驱动程序屏蔽设备细节；而各种 I/O 硬件接口由设备控制器等硬件提供，并不是它的职责。故选 D。$q$, NULL, NULL, 'keep'),(335205, $q$在同一磁盘内，用鼠标左键拖动文件是移动；从 U 盘拖到硬盘属于跨盘操作，用左键拖动默认执行复制，按住 Ctrl 拖动同样强制复制；只有用右键拖动后选择“移动到当前位置”才能完成移动。故选 B。$q$, NULL, NULL, 'keep'),(335428, $q$CPU 只能直接访问内存储器（主存），硬盘、光盘、软盘都属于辅助存储器，其中的程序和数据必须先调入内存，才能被 CPU 读取和执行。故选 D。$q$, NULL, NULL, 'keep'),(335432, $q$显卡、声卡、网卡都是 I/O 控制器，A 正确；它们除独立插卡外还可集成在主板上，接口并不相同，显卡一般也不集成到南桥芯片。因此 B、C、D 三项均错误，故选 BCD。$q$, NULL, NULL, 'keep'),(335569, $q$酷睿 i3/i5/i7 均为 64 位微处理器，i5 含有多个内核；Intel 主流芯片有奔腾、酷睿、赛扬和凌动四大系列，凌动多用于上网本和移动终端，四项均正确。故四项全选。$q$, NULL, NULL, 'keep'),(335738, $q$Moore 定律指单块集成电路的集成度平均每 18~24 个月翻一番，材料以硅为主，也可用砷化镓等；PC 微处理器均属于超大规模和极大规模 IC。D 项把两者的主从关系说反了，微电子技术以 IC 为核心。故选 ABC。$q$, NULL, NULL, 'keep'),(335780, $q$单块 IC 的集成度平均每 18~24 个月翻一番，半导体材料主要是硅，也可能是砷化镓等化合物半导体，PC 微处理器都是超大规模和极大规模集成电路，A、B、C 正确；D 项主从关系颠倒。故选 ABC。$q$, NULL, NULL, 'keep'),(335781, $q$辅助存储器即外存，硬盘、光盘和 TF（Micro SD）卡都用于长期保存数据，属于辅助存储器；主存是 CPU 可直接访问的内存储器，不属于辅助存储器。故选 ABD。$q$, NULL, NULL, 'keep'),(335874, $q$酷睿系列 CPU 采用 64 位前端总线，数据线共 64 条，一次可并行传送 8 字节；16 条、32 条、36 条均不符合该前端总线的规格。故选 D。$q$, NULL, NULL, 'keep'),(336081, $q$Moore 定律指出单块 IC 的集成度平均每 18~24 个月翻一番，而不是每半年；A、C、D 关于集成度、制造工序和射频 IC 卡的叙述均正确，因此错误的是 B。故选 B。$q$, NULL, NULL, 'keep'),(336150, $q$按用途（功能）划分，集成电路可分为通用集成电路和专用集成电路；按晶体管数目则分为小规模、中规模、大规模和超大规模等。题干空格应填用途，故选 D。$q$, NULL, NULL, 'keep'),(336203, NULL, NULL, NULL, 'uncertain'),(336240, $q$CMOS 是易失性存储器，靠主板电池供电保存系统配置参数，断电后数据会丢失；加电自检由 BIOS 完成，BIOS 程序存放在 ROM 中。故选 D。$q$, NULL, NULL, 'keep'),(336315, $q$连接各类 I/O 设备控制器与 CPU 或存储器、用于交换信息的一组公用信号线及相关控制电路称为 I/O 总线；CPU 总线、前端总线连接的对象与它不同，存储器总线专连主存。故选 B。$q$, NULL, NULL, 'keep'),(336354, $q$厂家标称辅助存储器容量时按十进制计算，1KB 等于 1000B；而计算机内部按二进制计算，1KB=2¹⁰B=1024B，两者采用的计算方式不同。故选 C。$q$, NULL, NULL, 'keep'),(336358, $q$微处理器内部有寄存器组，可暂存数据，因此具有数据存储功能，B 项错误；微处理器以单片集成电路制成，PC 主流为酷睿系列，智能手机多用 ARM 架构。故选 B。$q$, NULL, NULL, 'keep'),(336424, $q$CMOS 是易失性存储器，靠电池供电保存硬件配置参数，其内容不是 BIOS 程序，故 A 项错误；B、C、D 的叙述均符合 CMOS 的特点，故选 A。$q$, NULL, NULL, 'keep'),(336440, $q$存储器容量按 2 的幂次进位，1MB=2²⁰B，约等于 10⁶ 字节；而 2¹⁰B 是 1KB，2³⁰B 是 1GB，2⁴⁰B 是 1TB，均不符合。故选 B。$q$, NULL, NULL, 'keep'),(336655, $q$回收站占用的空间由用户按逻辑硬盘分别设置，硬盘空间不足时系统不会自动占用回收站的空间；回收站中的信息可以还原，也可以彻底清除。故选 C。$q$, NULL, NULL, 'keep'),(336659, $q$“显示比例”只改变屏幕显示的大小，不改变文档的实际排版，作用范围是整个文档；即使事先选定文字，也不会只缩放选中部分或弹出范围选择框。故选 C。$q$, NULL, NULL, 'keep'),(336672, $q$内部数据传输率反映磁头与缓存之间的读写速度，综合体现了转速、盘片密度等因素，最能代表硬盘的整体性能；转速和缓存容量只是单项指标。故选 A。$q$, NULL, NULL, 'keep'),(336712, $q$CMOS 芯片存放系统配置参数，需要主板电池供电，主机断电后其中数据会丢失；它不是只读存储器，功能也与存放 BIOS 程序的 ROM 不同。故选 D。$q$, NULL, NULL, 'keep'),(336926, $q$光纤传输的是光信号，不受电磁干扰和电磁感应的影响，抗干扰能力最强；微波、双绞线和同轴电缆都会不同程度地受到电磁干扰。故选 D。$q$, NULL, NULL, 'keep'),(336927, $q$CMOS 中只保存硬件配置参数，不含基本输入输出设备的驱动程序；BIOS 存放在 ROM 中、属于非易失性，是 PC 最基础的软件且包含 CMOS 设置程序。故选 C。$q$, NULL, NULL, 'keep')
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
  IF n <> 24 THEN RAISE EXCEPTION '第 1 批写入数应为 24，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0 b ON b.id = q.id
   WHERE e.action IN ('uncertain', 'manual')
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 1 THEN RAISE EXCEPTION '第 1 批 uncertain/manual 数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
