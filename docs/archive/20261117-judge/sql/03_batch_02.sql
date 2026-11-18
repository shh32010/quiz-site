-- 判断题第 2 批（25 道：23 keep + 0 change + 2 unresolved）
BEGIN;
CREATE TEMP TABLE judge_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO judge_expected (id, analysis, correct, stem, action) VALUES
(342952, $q$该表述准确概括了Web1.0单向获取信息与Web2.0注重用户交互、用户兼具消费者和制造者双重身份的特点。$q$, NULL, NULL, 'keep'),(342953, $q$HTML5规范由W3C于2014年10月正式发布定稿，HTML是万维网上最核心的超文本标记语言，该表述正确。$q$, NULL, NULL, 'keep'),(342954, $q$“以分享为特征的实时网络，用户拥有自己的数据并能在不同网站上使用”描述的是Web3.0，而不是Web1.0；Web1.0是单向获取信息的门户时代。$q$, NULL, NULL, 'keep'),(345641, $q$电容式键盘无触点、无磨损、寿命长、手感好，但击键声音小而非声音大，“击键声音大”通常不是其优点。$q$, NULL, NULL, 'keep'),(345642, $q$数码相机通过CCD或CMOS成像芯片将光信号转换为电信号，再经A/D转换得到数字图像，描述正确。$q$, NULL, NULL, 'keep'),(345647, $q$DSP 即数字信号处理器，声卡中用它完成数字音频的编码、解码、MIDI 声音合成及音频编辑等处理。题干所述与其典型用途一致，故正确。$q$, NULL, NULL, 'keep'),(345669, $q$标准 ASCII 虽采用 7 位编码，但在计算机中每个字符仍按 1 个字节（8 位）存放，8 个 ASCII 字符应占 8 个字节，而不是 7 个字节。$q$, NULL, NULL, 'keep'),(345728, $q$RGB、CMYK 等颜色模型只是描述颜色的方式不同，彼此之间可以通过公式相互转换（如 RGB 与 CMYK 互转），所以“不能相互转换”的说法错误。$q$, NULL, NULL, 'keep'),(345745, NULL, NULL, NULL, 'unresolved'),(345760, $q$10Gb/s 是比特速率，换算成字节速率约为 1.25GB/s，而不是 5GB/s；括号内的换算数值有误，整句表述不成立。$q$, NULL, NULL, 'keep'),(345790, $q$Modem（调制解调器）的功能是完成数字信号与模拟信号之间的调制和解调，使计算机能通过电话线传输数据；“上网的同时能打电话”不是 Modem 的功能。$q$, NULL, NULL, 'keep'),(345792, $q$常用颜色模型（RGB、CMYK、HSI 等）之间可以相互转换，题干“不能相互转换”的说法错误。$q$, NULL, NULL, 'keep'),(345795, $q$MPEG 音频标准（如 MPEG-1 Audio）正是针对 20Hz～20kHz 全频带数字音频的压缩编码制定的，可用于全频带音频压缩。$q$, NULL, NULL, 'keep'),(348227, $q$计算机网络就是利用通信设备和网络软件把多台具有独立功能的计算机连接起来，实现数据通信、资源共享和互操作的系统，题干表述正确。$q$, NULL, NULL, 'keep'),(348232, $q$计算机信息系统以提供信息服务为主要目的，具有数据密集、人机交互的特点，属于典型的计算机应用系统，定义正确。$q$, NULL, NULL, 'keep'),(348233, $q$信息系统中的数据会因更新、清理、故障等原因被删除或失效，并非永久保存、永不删除。$q$, NULL, NULL, 'keep'),(348239, $q$云计算是以数据和处理能力为中心的密集型计算模式，融合了多项信息通信技术，是传统技术融合发展的产物。$q$, NULL, NULL, 'keep'),(348240, $q$NoSQL 是非关系型数据库，主要面向非结构化、半结构化数据，并不是关系型数据库。$q$, NULL, NULL, 'keep'),(348295, $q$RFID 卡可存储患者身份与诊疗信息，读卡即可调阅，避免反复自述和重复录入，减少信息差错与人为操作失误。$q$, NULL, NULL, 'keep'),(348298, $q$B 超探头是换能器，能将电信号与超声波相互转换，本质上就是一种传感器。$q$, NULL, NULL, 'keep'),(348320, $q$通常认为麦肯锡公司最早提出大数据概念，其在 2011 年的研究报告中系统阐述了大数据。$q$, NULL, NULL, 'keep'),(348322, $q$大数据除体量大外，还具有类型多样、处理速度快、价值密度低等特征，不能仅以数据体量衡量。$q$, NULL, NULL, 'keep'),(348349, $q$数据库既面临内部人员攻击的风险，也面临外部恶意篡改数据的风险，需要访问控制和安全防护。$q$, NULL, NULL, 'keep'),(348544, $q$人类智能的进化是自然选择与长期社会实践活动的结果，并非由机器智能导致。$q$, NULL, NULL, 'keep'),(348737, NULL, NULL, NULL, 'unresolved')
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
  IF n <> 23 THEN RAISE EXCEPTION '第 2 批写入数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 2 THEN RAISE EXCEPTION '第 2 批保留数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN judge_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
