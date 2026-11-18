-- 多选第 3 批（25 道：19 keep + 1 change + 5 unresolved）
BEGIN;
CREATE TEMP TABLE multi_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO multi_expected (id, analysis, correct, action) VALUES
(353218, $q$支付宝支付、花呗、微信支付、京东支付都依托移动终端提供支付、消费信贷等金融服务，均属于移动互联网金融应用。$q$, NULL, 'keep'),(353219, $q$移动电子政务的第三阶段以移动互联网为支撑，3G、4G、5G 以及无线网技术都可以作为其实现手段。$q$, NULL, 'keep'),(353713, $q$分布式存储具备标准化、支持容灾与备份、支持分级存储、弹性扩展等特点，四个选项都符合。$q$, NULL, 'keep'),(353720, $q$云计算的三大服务模式是 IaaS、PaaS、SaaS；FaaS 是后来细分出的无服务器计算形态，不属于这三类。$q$, NULL, 'keep'),(353826, $q$云计算的核心思想是让 IT 走向简单化、平台化和服务化；专化与云计算通用、共享的理念相违背。$q$, NULL, 'keep'),(353830, $q$服务器虚拟化按 hypervisor 的部署位置可分为原生虚拟化和寄宿虚拟化，此外还有混合虚拟化；再生虚拟化不是公认的分类。$q$, NULL, 'keep'),(353831, $q$虚拟化技术的典型特点是分区、隔离、封装和硬件独立，四项都正确。$q$, NULL, 'keep'),(354427, $q$大数据作为数据集合包含数据量大、构成复杂、变化很快、蕴含大价值四层含义，即常说的 4V 特征。$q$, NULL, 'keep'),(355159, $q$智能音箱、智能管家、家庭智能康复机器人和讯飞翻译机都需要用语音识别理解用户指令，并用语音合成输出语音，四项都使用了这两种技术。$q$, NULL, 'keep'),(355195, $q$文语转换包括文本分析、韵律处理和语音合成三个环节；语音识别是把语音转成文字的反向过程，不属于语音合成。$q$, NULL, 'keep'),(355824, $q$区块链采用分布式数据存储，A 正确；数据经哈希和共识机制保证难以篡改且可以追溯，B 正确；比特币是区块链的典型应用，D 正确。区块链的数据签名采用非对称加密，C 错误。$q$, NULL, 'keep'),(357100, $q$按性能和用途划分，计算机可分为巨型计算机、大型计算机、个人计算机（微型机）、工作站等，四项均属于常见分类，故全选。$q$, NULL, 'keep'),(357105, $q$数据的逻辑结构通常分为集合结构、线性结构、树形结构和网状（图状）结构四种，四项均正确。$q$, NULL, 'keep'),(357108, NULL, NULL, 'unresolved'),(357109, $q$progress（进度条）和 meter（度量条）是 HTML5 新增元素，range 是新增的滑动条输入类型，日期和时间（date/time 等）也是新增输入类型，四项均正确。$q$, NULL, 'keep'),(357245, $q$.ppt 是演示文稿格式，.pot 是演示文稿模板格式，.htm 是保存为网页的格式，三者都能由演示文稿保存得到；.doc 是 Word 文档格式，与演示文稿无关。$q$, NULL, 'keep'),(359342, $q$第一代移动通信采用模拟技术，属于蜂窝式模拟移动通信系统，B 正确；手机是移动通信中最具代表性的应用，C 正确；IMT-2000 的目标包括全球漫游、适应多种环境和提供高质量多媒体服务，D 正确。GPRS 属于 2.5G，不是第三代移动通信系统，A 错误。$q$, NULL, 'keep'),(359648, $q$区位码 2710 的区号、位号分别加上 20H 得到国标码 3B2A H，国标码再加 80H 得到机内码 BBAA H，A、B 正确。C、D 的数值与换算结果不符。$q$, NULL, 'keep'),(361558, $q$HTML5 已删除 acronym、applet、basefont、big、center、dir、font、frame 等过时或纯表现性标签，八个选项均在删除之列。$q$, 'A,B,C,D,E,F,G,H', 'change_answer'),(361843, NULL, NULL, 'unresolved'),(366946, $q$操作系统由内核及配套的外围软件组成，Windows 10 使用 NT 内核，iOS 基于 Darwin 内核，CentOS 7 使用 Linux 内核，四项描述均正确。$q$, NULL, 'keep'),(367653, $q$计算机硬件五大部件是运算器、控制器、存储器、输入设备和输出设备，处理器集成了运算器与控制器，故 A、C、D、E 正确；内存只是存储器的一部分，不能与存储器并列作为独立一大件，故不选 B。$q$, NULL, 'keep'),(368213, NULL, NULL, 'unresolved'),(375914, NULL, NULL, 'unresolved'),(378787, NULL, NULL, 'unresolved')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM multi_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM multi_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 20 THEN RAISE EXCEPTION '第 3 批写入数应为 20，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_multi b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 5 THEN RAISE EXCEPTION '第 3 批保留数应为 5，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_multi b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '第 3 批改答案数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN multi_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
