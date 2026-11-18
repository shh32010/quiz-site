-- 判断题第 4 批（25 道：23 keep + 1 change + 1 unresolved）
BEGIN;
CREATE TEMP TABLE judge_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO judge_expected (id, analysis, correct, stem, action) VALUES
(354349, $q$MapReduce 是 Hadoop 的核心计算框架之一，其计算过程主要由 Map 和 Reduce 两个阶段组成。$q$, NULL, NULL, 'keep'),(354374, $q$大数据具有体量大、速度快、类型多、价值密度低等特征，不仅是数据体量大，题干说法片面。$q$, NULL, NULL, 'keep'),(354390, $q$“大数”应为“大数据”；大数据体量超出单台计算机的处理能力，通常需要采用分布式计算架构完成存储与计算。$q$, 'A', $q$大数据必然无法用单台的计算机进行处理，需要采用分布式计算架构。$q$, 'change_answer'),(355007, $q$Prolog、Lisp 是经典的人工智能语言，Python、Java 也是当前人工智能开发中的常用语言，列举正确。$q$, NULL, NULL, 'keep'),(355014, $q$输入层节点数由输入数据维度决定、输出层节点数由任务目标维度决定，二者固定；中间层节点数属于可调超参数，可有多种选择。$q$, NULL, NULL, 'keep'),(355015, $q$神经网络层数通常不计输入层（输入层只接收数据不参与计算），由2个计算层（1个隐藏层加输出层）构成的网络即称两层神经网络，说法正确。$q$, NULL, NULL, 'keep'),(355016, $q$按常见划分，含3个及以上计算层（即超过2个计算层）的才算多层神经网络，把门槛定在“超过3个”不准确，故说法错误。$q$, NULL, NULL, 'keep'),(355017, $q$深度学习是机器学习的重要分支，现已成为主流技术，在图像识别、语音、自然语言处理等应用中成果显著，说法正确。$q$, NULL, NULL, 'keep'),(355095, $q$微软2012年演示的全自动同声传译系统完成英文语音识别、英译中机器翻译和中文语音合成，其关键技术正是深度学习，说法正确。$q$, NULL, $q$微软公司演示的一个全自动的同声传译系统，其中完成了语音识别、英中翻译以及中文语音合成，其中的关键技术（基础）是深度学习。$q$, 'keep'),(355097, $q$机器学习是人工智能的分支之一，其核心正是从数据中自动分析归纳规律，并利用规律对未知数据进行预测，表述符合定义。$q$, NULL, NULL, 'keep'),(356010, $q$51%攻击是指掌握超过全网一半算力后篡改账本、实施双重支付等，现实中个人或矿池算力达到该比例并非不可能，因此“不可能实现”的说法错误。$q$, NULL, NULL, 'keep'),(356033, $q$区块链体系结构中，网络层负责节点之间的网络连接和数据传输，区块数据的存储由数据层负责，故说法错误。$q$, NULL, NULL, 'keep'),(356746, $q$Word的图片水印除本地文件外，还可使用剪贴板、剪贴画或联机图片等来源，并非只能来自本地，故说法错误。$q$, NULL, NULL, 'keep'),(356778, $q$线性表是由n个数据元素构成的有限序列，元素位置只取决于自己的序号，元素之间是一对一的线性关系，说法正确。$q$, NULL, NULL, 'keep'),(356780, $q$逻辑结构只描述数据元素之间的逻辑关系，与存储方式无关，面向问题且独立于计算机，说法正确。$q$, NULL, NULL, 'keep'),(356787, $q$我国彩电采用PAL制（题干PAI应为PAL的笔误），PAL制在传输时使用YUV颜色模型，将亮度与色度分离，便于兼容黑白电视并压缩色度带宽。$q$, NULL, NULL, 'keep'),(356788, $q$ERP是企业资源计划系统，以供应链和财务管理为核心，通常集成财务管理、人力资源、生产制造、采购销售等子系统。$q$, NULL, NULL, 'keep'),(356789, $q$闲鱼是面向个人消费者的二手交易平台，属于消费者对消费者（C2C）的电子商务应用，服务对象是消费者。$q$, NULL, NULL, 'keep'),(356794, $q$计费服务（即可度量服务）负责监控用户对云资源的使用量，并依据使用情况计费，是云计算按需付费模式的基础。$q$, NULL, NULL, 'keep'),(356810, $q$题干描述的是对未知标注数据集按内在相似性划分，这正是聚类的定义；分类是针对已有类别标注的数据进行学习并判别，二者不能混同。$q$, NULL, NULL, 'keep'),(356907, NULL, NULL, NULL, 'unresolved'),(356927, $q$非接触式IC卡又称射频卡、感应卡，依靠电磁感应实现无线数据传输，可做成无源卡并实现免接触读写，使用方便快捷。$q$, NULL, NULL, 'keep'),(356928, $q$第二代身份证采用13.56MHz工作频率，属于高频（HF）而非超高频（UHF），因此题干说法错误。$q$, NULL, NULL, 'keep'),(356929, $q$传感器是能感知被测量并按一定规律将其转换为可用信号的器件或装置，一般由敏感元件和转换元件构成，题干表述正确。$q$, NULL, NULL, 'keep'),(356931, $q$Wi-Fi是无线局域网技术，可将计算机、PDA、手机等终端以无线方式互联并接入网络，题干说法正确。$q$, NULL, NULL, 'keep')
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
  IF n <> 24 THEN RAISE EXCEPTION '第 4 批写入数应为 24，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 1 THEN RAISE EXCEPTION '第 4 批保留数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '第 4 批改答案数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN judge_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
