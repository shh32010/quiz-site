-- 填空第 1 批（25 道：22 keep + 0 change + 3 unresolved）
BEGIN;
CREATE TEMP TABLE fill_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO fill_expected (id, analysis, correct, action) VALUES
(334394, $q$题干直接问“鼠标器”的简称，鼠标器简称鼠标，属于计算机输入设备的常识表述。$q$, NULL, 'keep'),(334397, $q$鼠标与主机的常见接口按题干顺序为 PS/2 接口与 USB 接口，二者是教材中并列介绍的两种主流有线接口。$q$, NULL, 'keep'),(334398, $q$票据打印需要多层套打，依靠打印针击打色带和复写纸实现，因此使用的是针式打印机。$q$, NULL, 'keep'),(334404, $q$题干要求写英文简称，且给出 150MB/s～600MB/s 的串行传输速率，符合 SATA（串行 ATA）硬盘接口的特征。$q$, NULL, 'keep'),(334406, $q$传统硬盘扇区容量为 512 字节，大容量（超过 2TB）硬盘采用 4KB 扇区，题干以两种容量作对比。$q$, NULL, 'keep'),(334407, $q$容量大、兼容性好、即插即用、体积小、安全可靠是闪存盘（U 盘）作为移动存储设备的典型优点。$q$, NULL, 'keep'),(334408, $q$硬盘按存储介质可分为机械硬盘、固态硬盘和移动硬盘，空格处与前后的并列关系明确。$q$, NULL, 'keep'),(334409, $q$硬盘性能指标通常包括平均寻道时间、平均等待时间、转速和数据传输速率，按题干已有项的排列顺序填入前两项即可。$q$, NULL, 'keep'),(334414, $q$Windows 10 任务管理器的“性能”选项卡以曲线图和百分比形式显示 CPU、内存、磁盘和网络的使用情况。$q$, NULL, 'keep'),(334576, $q$打印机按工作原理常分为针式、喷墨和激光三类，题干已列出前两类，第三类为激光打印机。题干前半句文字有残缺，但空线处所指内容唯一。$q$, NULL, 'keep'),(334648, $q$存储容量=磁头数×每面磁道数×每道扇区数×扇区容量=4×2048×1024×512字节=4GB。题干中“每个磁盘有1024个扇区”应理解为每个磁道1024个扇区。$q$, NULL, 'keep'),(338075, $q$程序设计语言由数据成分、运算成分、控制成分和传输成分四部分组成，空缺处为运算成分。$q$, NULL, 'keep'),(338076, $q$程序设计语言按级别由低到高划分为机器语言、汇编语言和高级语言三个层次。$q$, NULL, 'keep'),(338083, $q$黑盒测试又称功能测试或数据驱动测试，只关注输入输出而不考虑程序内部结构。$q$, NULL, 'keep'),(338084, $q$白盒测试的常用方法包括逻辑覆盖（语句覆盖、判定覆盖、条件覆盖等）和基本路径测试。$q$, NULL, 'keep'),(338085, $q$需求分析阶段的核心产物是软件需求规格说明书（SRS），用于明确系统应实现的功能与约束。$q$, NULL, 'keep'),(338087, $q$从需求和业务角度出发、按面向对象思想对业务建模，属于面向对象分析（OOA）。$q$, NULL, 'keep'),(338088, $q$UML（统一建模语言）是面向对象分析与设计中最常用的标准建模工具。$q$, NULL, 'keep'),(338097, $q$题干给出的是大数据的典型定义，即常规软件工具无法在合理时间内捕捉、管理和处理的数据集合。$q$, NULL, 'keep'),(338099, $q$用样本数据训练出模型并用于新对象判断或预测，是机器学习算法的典型过程。$q$, NULL, 'keep'),(338291, $q$题干中“买前免费试用”“可拷贝散发但不可修改后散发”是共享软件（shareware）的典型授权方式，区别于自由软件和公有领域软件。$q$, NULL, 'keep'),(338325, NULL, NULL, 'unresolved'),(338329, NULL, NULL, 'unresolved'),(338331, NULL, NULL, 'unresolved'),(341588, $q$三网融合指电信网、广播电视网（有线电视网）和计算机网（互联网）的相互融合，题干已给出电信网和计算机网，剩余一网为广播电视网。$q$, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM fill_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM fill_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 22 THEN RAISE EXCEPTION '第 1 批写入数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 3 THEN RAISE EXCEPTION '第 1 批保留数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN fill_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
