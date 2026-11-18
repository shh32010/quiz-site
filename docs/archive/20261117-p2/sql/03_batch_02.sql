-- P2 第 2 批（25 道；html=0 colon=0 prefix=25）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(335161, NULL, NULL, $q$集成电路可按包含的晶体管元件的数目分类，其中大规模集成电路的英文缩写是VLSI。$q$),(335162, NULL, NULL, $q$集成电路是计算机的硬件核心。它的特点是体积小，重量轻，可靠性高，但功耗很大。$q$),(335163, NULL, NULL, $q$早期的电子技术以真空电子管为基础元件。$q$),(335164, NULL, NULL, $q$目前，PC机中的CPU、芯片组、图形处理芯片等都是集成度超过百万甚至千万晶体管的超大规模和极大规模集成电路。$q$),(335166, NULL, NULL, $q$目前市场上有些PC机的主板已经集成了许多扩充卡（如声卡、以太网卡、显示卡）的功能，因此不再需要插接相应的扩充卡。$q$),(335167, NULL, NULL, $q$在PC机中硬盘与主存之间的数据传输必须经由CPU才能进行。$q$),(335168, NULL, NULL, $q$计算机外部设备的驱动程序都是 BIOS 的一个组成部分。$q$),(335170, NULL, NULL, $q$PC机有许多I/O接口，它们用于连接不同种类的I/O设备，一种I/O接口只能连接同一种设备。$q$),(335171, NULL, NULL, $q$PC机中几乎所有部件和设备都以主板为基础进行安装和互相连接，主板的稳定性影响着整个计算机系统的稳定性。$q$),(335172, NULL, NULL, $q$PC机可以连接多种I/O设备，不同的I/0设备往往需要使用不同的I/O接口，同一种I/O接口只能连接同一种设备。$q$),(335173, NULL, NULL, $q$为了方便地更换和扩充I/0设备，计算机系统中的I/0设备一般都是通过I/0接口(I/0控制器)与主机连接的。$q$),(335174, NULL, NULL, $q$半导体存储器芯片可以分为DRAM和SRAM两种，其中SRAM芯片的电路简单，集成度高，成本较低，一般用于构成主存储器。$q$),(335176, NULL, NULL, $q$在计算机的各种输入设备中，只有通过键盘才能输入汉字。$q$),(335177, NULL, NULL, $q$要通过口述的方式向计算机输入汉字，需要配备声卡、麦克风等设备和安装相应的软件。$q$),(335178, NULL, NULL, $q$触摸屏兼有鼠标和键盘的功能，甚至还用于手写汉字输入，深受用户欢迎。目前已经在许多移动信息设备（手机、平板电脑等）上得到使用。$q$),(335179, NULL, NULL, $q$键盘上的F1～F12控制键的功能是固定不变的。$q$),(335180, NULL, NULL, $q$光学分辨率是扫描仪的主要性能指标，它反映了扫描仪扫描图像的清晰程度，用每英寸的取样点数目dpi来表示。$q$),(335182, NULL, NULL, $q$计算机常用的输入设备为键盘、鼠标，笔记本电脑常使用轨迹球、指点杆和触摸板等替代鼠标。$q$),(335183, NULL, NULL, $q$计算机显示系统通常由两部分组成：监视器和显示控制器，显示控制器在PC机中又称为显示卡。$q$),(335184, NULL, NULL, $q$显示器、音箱、绘图仪、扫描仪等均属于输出设备。$q$),(335185, NULL, NULL, $q$要想从计算机打印出一彩色图片，目前选用彩色喷墨打印机最合适。$q$),(335186, NULL, NULL, $q$针式打印机和喷墨打印机属于击打式打印机，激光打印机属于非击打式打印机。$q$),(335188, NULL, NULL, $q$CD-RW光盘采用在盘上压制凹坑的办法记录信息。$q$),(335189, NULL, NULL, $q$对二进位信息进行逻辑运算是按位独立进行的，位与位之间不发生关系。$q$),(335190, NULL, NULL, $q$在计算机中任何正数的原码、反码和补码的形式可以不同。$q$)
;
UPDATE t_question q
SET option_json = coalesce(e.option_new, q.option_json),
    analysis = coalesce(e.analysis_new, q.analysis),
    stem = coalesce(e.stem_new, q.stem)
FROM p2_expected e
WHERE q.id = e.id AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.option_new IS NOT NULL AND q.option_json = e.option_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批 HTML 更新数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 25 THEN RAISE EXCEPTION '第 2 批前缀修复数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
