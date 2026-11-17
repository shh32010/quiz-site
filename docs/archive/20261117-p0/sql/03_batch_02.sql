-- P0-211 第 2 批（25 道：23 写入 + 2 标 uncertain/manual）
BEGIN;
CREATE TEMP TABLE p0_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0_expected (id, analysis, correct, stem, action) VALUES
(337035, $q$13=1×9+1×3+1，按三进制表示为 111；而 101₃=10，110₃=12，112₃=14，均不等于十进制 13。故选 C。$q$, NULL, NULL, 'keep'),(337037, $q$计算机内部采用二进制，是因为具有两个稳定状态的电子器件（如开关的通与断）容易制造、工作可靠，且运算规则简单。代表这两种状态的器件对应数字 2，故选 B。$q$, NULL, NULL, 'keep'),(337038, $q$逻辑加就是逻辑或运算，只要有一个操作数为 1，结果就为 1，常用符号“∨”表示；逻辑乘则用“∧”表示，两者不可混淆。故选 A。$q$, NULL, NULL, 'keep'),(337043, $q$8 位补码中正数的符号位为 0，其余 7 位还须放 3 个“1”，要使数值最大应将 1 尽量放在高位，即 0111 1000，等于十进制 120。故选 A。$q$, NULL, NULL, 'keep'),(337044, $q$无符号二进制加法按位逢二进一：11001010+00001001=11010011，即 202+9=211。B 项数值与正确结果不符，属于干扰项。故选 C。$q$, NULL, NULL, 'keep'),(337046, $q$逻辑加即按位“或”运算，只要对应位有一个为 1，结果位就为 1，逐位计算得 11001010∨00001001=11001011，不必考虑进位。故选 D。$q$, NULL, NULL, 'keep'),(337047, $q$逻辑乘即按位“与”运算，只有对应位同为 1 时结果位才为 1，其余为 0，逐位计算得 00001000。它与算术加法、乘法都不同。故选 A。$q$, NULL, NULL, 'keep'),(337053, NULL, NULL, NULL, 'uncertain'),(337054, $q$先写出 +43 的 8 位原码 00101011，按位取反得 11010100，末位加 1 得 11010101，这就是 -43 的补码。故选 B。$q$, NULL, NULL, 'keep'),(337076, $q$不同厂商、不同型号的 PC 机软硬件并不完全兼容，说“所有 PC 都相互兼容、软件一定可运行”过于绝对；C 项描述 PowerPC 与 Pentium 的差异符合事实。故选 B。$q$, NULL, NULL, 'keep'),(337092, $q$系统时钟由主板上的时钟发生器（时钟芯片）产生，芯片组主要负责 CPU、内存与外部设备之间的连接与控制；A、B、D 的描述均符合芯片组的实际作用。故选 C。$q$, NULL, NULL, 'keep'),(337100, $q$磁盘格式化后每条磁道划分的扇区数相同，所以各同心圆存储的数据量相等；内圈只是周长较小、记录密度更高，并不影响容量。故选 C。$q$, NULL, NULL, 'keep'),(337175, $q$规格化要求尾数最高有效位与数符不同：C 项数符为 1、尾数首位为 0，符合负数规格化形式；A、B、D 的尾数首位与数符相同，均非规格化数。故选 C。$q$, NULL, NULL, 'keep'),(337196, $q$由 2×3=10 可知该数制为六进制（2×3=6，记作 10）。3×5=15，换成六进制是 2×6+3，即 23，若按十进制理解就会误选 A。故选 D。$q$, NULL, NULL, 'keep'),(337206, $q$红、绿、蓝三基色各用 8 位二进制表示，一个像素共 24 位，可组合出约 1677 万种颜色，故称真彩色；8 位只有 256 色。故选 C。$q$, NULL, NULL, 'keep'),(337460, $q$公交 IC 卡靠射频信号与读卡器交换信息，与身份证一样属于非接触式 IC 卡；B、D 的分类和 C 中 SIM 卡的表述均正确。故选 A。$q$, NULL, NULL, 'keep'),(337664, NULL, NULL, NULL, 'manual'),(337784, $q$硬盘的主要性能指标有容量、平均存取时间、数据传输速率、缓存容量和接口类型等，“磁头精度”不属于衡量硬盘性能的指标。故选 A。$q$, NULL, NULL, 'keep'),(337869, $q$ROM 断电后内容不丢失，属非易失性存储器，所以“BIOS 存放在 ROM 中，是易失性的”自相矛盾；CMOS 靠电池供电保存参数，确属易失性。故选 A。$q$, NULL, NULL, 'keep'),(338063, $q$完全虚拟化由虚拟机监视器模拟出完整硬件环境，客户操作系统无需任何修改即可运行；半虚拟化则要改造客户机内核，二者区别正在于此。故选 A。$q$, NULL, NULL, 'keep'),(339539, $q$题干给出的正是线性结构的定义，线性表、堆栈、队列都满足除首尾外每个元素只有一个直接前驱和一个直接后继；树是一对多的非线性结构。故选 A、B、C。$q$, NULL, NULL, 'keep'),(339600, $q$文件管理针对的是外存中的文件，并非对内存的管理；分时技术是把 CPU 时间划分成时间片轮流分配给各任务，D 说法正确。C 表述有误，故选 C。$q$, NULL, NULL, 'keep'),(339607, $q$队列只能在队尾插入、在队头删除，特点是先进先出；C、D 把线性与非线性结构说反，A 的“线性的存储结构”提法也不准确。故选 B。$q$, NULL, NULL, 'keep'),(339614, $q$区块链的安全主要靠密码学算法：哈希保证数据不可篡改，数字签名保证身份与交易可信，共识算法解决的是账本一致性，只是其中的配套机制。故选 B。$q$, NULL, NULL, 'keep'),(339829, $q$需求规格说明书是需求分析完成后的成果，用来在用户与开发人员之间交流，并作为开发、测试和验收的依据，而不是辅助做需求分析的工具。故选 D。$q$, NULL, NULL, 'keep')
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
  IF n <> 23 THEN RAISE EXCEPTION '第 2 批写入数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0 b ON b.id = q.id
   WHERE e.action IN ('uncertain', 'manual')
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 2 THEN RAISE EXCEPTION '第 2 批 uncertain/manual 数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
