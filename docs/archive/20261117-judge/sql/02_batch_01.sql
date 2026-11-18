-- 判断题第 1 批（25 道：23 keep + 0 change + 2 unresolved）
BEGIN;
CREATE TEMP TABLE judge_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO judge_expected (id, analysis, correct, stem, action) VALUES
(334998, $q$CPU 内的寄存器用于暂存当前执行的指令和数据，容量小、速度快且断电后内容丢失，不能长期存放数据，故说法错误。$q$, NULL, NULL, 'keep'),(335035, $q$集成电路卡（IC 卡）正是将集成电路芯片封装在塑料卡基片内，使其能够存储、处理和传递数据，符合其定义。$q$, NULL, NULL, 'keep'),(335036, $q$CPU 卡又称智能卡，卡内集成 CPU、程序存储器和数据存储器，并内置操作系统，可独立处理数据，说法正确。$q$, NULL, NULL, 'keep'),(335067, $q$硬盘的缓存（磁盘缓冲区）通常由 DRAM 芯片构成，用于缓解硬盘与主机之间的速度差异，说法正确。$q$, NULL, NULL, 'keep'),(335272, NULL, NULL, NULL, 'unresolved'),(335277, NULL, NULL, NULL, 'unresolved'),(335334, $q$CPU 卡又称智能卡，卡内集成 CPU、程序存储器和数据存储器，并内置操作系统，可独立处理数据，说法正确。$q$, NULL, NULL, 'keep'),(335341, $q$Android 硬件抽象层（HAL）位于操作系统与硬件之间，向上提供统一接口、屏蔽硬件平台细节，有利于保护厂商知识产权并实现硬件无关性，说法正确。$q$, NULL, NULL, 'keep'),(335504, $q$Android 硬件抽象层（HAL）位于操作系统与硬件之间，向上提供统一接口、屏蔽硬件平台细节，有利于保护厂商知识产权并实现硬件无关性，说法正确。$q$, NULL, NULL, 'keep'),(338844, $q$高级程序设计语言（如 FORTRAN、COBOL）出现于第二代计算机时期，并非随第四代计算机的发展才出现，故说法错误。$q$, NULL, NULL, 'keep'),(338845, $q$高级语言源程序是面向人的符号化文本，CPU 只能执行机器指令，因此必须经过编译或解释翻译成机器语言程序后才能运行。$q$, NULL, NULL, 'keep'),(338846, $q$程序设计语言由数据成分、运算成分、控制成分和传输成分构成，变量、数组、记录等属于数据成分，用于描述数据及其类型，不属于控制成分。控制成分指顺序、选择、循环等控制结构。$q$, NULL, NULL, 'keep'),(338853, $q$栈是限定仅在表的一端进行插入和删除操作的线性表，该端称为栈顶，另一端称为栈底，符合后进先出的特点，题干描述正确。$q$, NULL, NULL, 'keep'),(338860, $q$白盒测试又称结构测试或逻辑驱动测试，把程序视为透明的盒子，测试者依据程序的内部结构、逻辑路径和处理过程设计测试用例。$q$, NULL, NULL, 'keep'),(338861, $q$详细设计在概要设计确定模块划分之后进行，主要任务是为每个模块设计实现算法、所需的局部数据结构以及模块内部的处理细节，并给出清晰的描述。$q$, NULL, NULL, 'keep'),(338872, $q$学习通是在线教学平台，师生在时空上分离，通过网络完成课程学习、作业与互动，属于远程教育（在线学习）模式下的学习方式。$q$, NULL, NULL, 'keep'),(339065, $q$流程图描述的是算法的处理逻辑和步骤，高级语言普遍支持顺序、选择、循环等基本控制结构，因此任何能用流程图描述的算法都可以用任一种高级语言编写成程序。$q$, NULL, NULL, 'keep'),(342423, $q$网卡、集线器、交换机、调制解调器和路由器都是计算机网络中用于连接线路、延伸网络或实现网络互连的常用设备，题干列举符合网络互联设备的常见范围。$q$, NULL, NULL, 'keep'),(342424, $q$网络协议的三要素是语法、语义和时序（同步/定时），不是语用。语法规定数据与控制信息的格式，语义规定含义与应答，时序规定事件顺序与速度匹配。$q$, NULL, NULL, 'keep'),(342428, $q$以太网采用分组交换，把数据封装成长度有限的数据块进行传输，其数据链路层的分组称为帧，以太网帧以 MAC 地址寻址，故称 MAC 帧。$q$, NULL, NULL, 'keep'),(342432, $q$防火墙可以基于IP地址设置访问控制规则，禁止校外特定IP直接访问校内网站，这是防火墙的基本过滤功能。$q$, NULL, NULL, 'keep'),(342642, $q$广域网与局域网的主要区别是覆盖的地理范围不同，而不是接入主机数量是否有限制；局域网同样可以接入大量主机。$q$, NULL, NULL, 'keep'),(342682, $q$Windows 10将网络分为域、专用和公用等位置类型，并针对每种类型分别应用防火墙配置文件，可分别启用或关闭，灵活性较高。$q$, NULL, NULL, 'keep'),(342699, $q$按是否具有排版格式，数字文本应分为普通文本（纯文本）和格式化文本（丰富格式文本）；线性文本与超文本是按文本的组织方式划分的。$q$, NULL, NULL, 'keep'),(342800, $q$Web1.0以门户网站为代表，用户主要通过浏览器单向获取信息；Web2.0强调用户交互，用户既是内容消费者也是内容生产者。$q$, NULL, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    stem = coalesce(e.stem, q.stem),
    qc_grade = 'good',
    answer_check = 'match'
FROM judge_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM judge_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.stem IS NULL OR q.stem = e.stem);
  IF n <> 23 THEN RAISE EXCEPTION '第 1 批写入数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 2 THEN RAISE EXCEPTION '第 1 批保留数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN judge_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
