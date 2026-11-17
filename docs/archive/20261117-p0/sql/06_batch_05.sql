-- P0-211 第 5 批（25 道：23 写入 + 2 标 uncertain/manual）
BEGIN;
CREATE TEMP TABLE p0_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0_expected (id, analysis, correct, stem, action) VALUES
(349552, $q$原式=3×512+7×64+4×8+5=2021，按权展开为 1024+512+256+128+64+32+4+1，二进制即 11111100101。故选 B。$q$, NULL, NULL, 'keep'),(349594, $q$模式/内模式映像在存储结构改变时只需调整映像而保持模式不变，从而实现数据物理独立性；外模式/模式映像对应数据的逻辑独立性。故选 A。$q$, NULL, NULL, 'keep'),(349744, $q$由 6×3=18=2r+4 可解得该进制 r=7；再把十进制 4×5=20 写成七进制，即 2×7+6=26。故选 D。$q$, NULL, NULL, 'keep'),(349959, $q$多路复用的作用是在同一条信道上并行传输多路信号，提高信道利用率，并不能延长信号的传输距离，因此 C 的说法错误；B 中的“必须”虽显绝对，但远距离传输通常需借助调制解调，本题取 C。故选 C。$q$, NULL, NULL, 'keep'),(350090, $q$云管理平台的核心职能是为业务系统提供灵活的部署、运行与管理环境，并统一管理底层虚拟资源。D 称“不涉及虚拟资源的管理”与事实相反，B、C 的表述也不准确。故选 A。$q$, NULL, NULL, 'keep'),(350143, NULL, NULL, NULL, 'uncertain'),(350599, $q$GSM 系统中 MSC 与 VLR 之间的接口规范为 B 接口，用于传递 MS 使用业务等信息；E 接口是 MSC 之间的接口，A 接口连接 MSC 与基站子系统，均为干扰项。故选 D。$q$, NULL, NULL, 'keep'),(350672, $q$智慧城市涵盖智慧政务、智慧交通、智慧医疗、智慧公共安全等众多领域，四个选项都是其典型应用，任选其中一项都不完整，应选涵盖全部内容的选项。故选 E。$q$, NULL, NULL, 'keep'),(350778, $q$百度、华为、京东均已公开推出区块链产品或平台，如百度超级链、华为 BCS、京东智臻链；滴滴以出行服务为主，未公布区块链业务。故选 B。$q$, NULL, NULL, 'keep'),(352126, $q$选择操作按条件从一张二维表中筛选元组，只需一个操作对象；连接操作要把两张表按公共属性拼接成新表，需要两个操作对象，故前者、后者分别为 1 和 2。故选 A。$q$, NULL, NULL, 'keep'),(352692, $q$射频识别系统由电子标签、阅读器和软件三部分组成：标签标识物品，阅读器读取信息，软件负责数据处理与应用；服务属于运营范畴，不是其技术组成。故选 ABC。$q$, NULL, NULL, 'keep'),(352922, $q$互联网汇聚了海量用户行为、交易与内容数据，规模大、类型多、增长快，是当前社会中最突出的大数据环境；物联网的数据规模与丰富程度尚不及互联网。故选 A。$q$, NULL, NULL, 'keep'),(352993, $q$射频识别通过电子标签对物品进行唯一标识并自动采集信息，属于物联网产业链的标识环节；感知环节主要由各类传感器承担，二者最容易混淆。故选 A。$q$, NULL, NULL, 'keep'),(353098, $q$网络仿真的意义在于结果可信度高、前期投资成本低、使用范围广，可替代部分真实组网试验；但仿真计算需要时间，实时性弱，不属于其应用意义。故选 D。$q$, NULL, NULL, 'keep'),(353119, $q$展示型 H5 多以模板和可视化工具制作，动画简单、上手较快，并非“制作难度并不低、需要专业人员开发”；B、C、D 对各类 H5 特点的描述均正确。故选 A。$q$, NULL, NULL, 'keep'),(353120, $q$HTML5 页面无须下载安装、即点即玩，可跨浏览器与终端运行而不受平台限制；“多平台协作”指多个平台之间的协同工作，并非 HTML5 自身功能。故选 D。$q$, NULL, NULL, 'keep'),(353899, $q$完全虚拟化借助二进制翻译或指令模拟，使未经修改的客户操作系统能直接在虚拟服务器上运行；半虚拟化则需修改客户机内核以配合超级调用。故选 A。$q$, NULL, NULL, 'keep'),(353937, NULL, NULL, NULL, 'uncertain'),(354119, $q$云存储通过集群应用、网格技术或分布式文件系统，将网络中大量“不同类型”的存储设备集合起来协同工作，B 写成“同类型”故错，其余三项描述正确。故选 B。$q$, NULL, NULL, 'keep'),(354180, $q$云计算服务可按使用时间、存储容量、请求次数、流量等多种维度计量，“都是根据使用时间计量”表述绝对，B 错误；计量是计费的基础，配额用尽会阻止后续请求。故选 B。$q$, NULL, NULL, 'keep'),(354193, $q$各方需求是云计算产生的推动力，而虚拟化、分布式计算等技术达到可以实现的程度，才使其规模化落地成为必然，故应填“技术”；经济、社会只是背景条件。故选 D。$q$, NULL, NULL, 'keep'),(354228, $q$把开发环境或运行平台作为一种服务提供给用户的是平台即服务（PaaS），对应选项“基于平台服务”；SaaS 提供的是可直接使用的应用软件。故选 B。$q$, NULL, NULL, 'keep'),(354235, $q$Xen 虚拟化产品交付中心围绕服务器虚拟化、应用虚拟化、桌面虚拟化三条产品线组织，“数据中心搭建支持”属于配套实施服务，不在产品线之列。故选 D。$q$, NULL, NULL, 'keep'),(354258, $q$对 IT 企业而言，云计算促使其从一次性销售软硬件产品转向按需提供云服务、持续获取服务收入；B 描述的是用户侧由自建 IT 资源转向租用的变化。故选 A。$q$, NULL, NULL, 'keep'),(354570, $q$存储容量按 2 的 10 次方逐级进位，1KB 为 2 的 10 次方字节，1MB、1GB、1TB 依次类推，故 1PB 等于 2 的 10 次方 TB，约合 1024TB，即选项 D。故选 D。$q$, NULL, NULL, 'keep')
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
  IF n <> 23 THEN RAISE EXCEPTION '第 5 批写入数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0 b ON b.id = q.id
   WHERE e.action IN ('uncertain', 'manual')
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 2 THEN RAISE EXCEPTION '第 5 批 uncertain/manual 数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
