-- 多选第 2 批（25 道：20 keep + 0 change + 5 unresolved）
BEGIN;
CREATE TEMP TABLE multi_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO multi_expected (id, analysis, correct, action) VALUES
(342939, $q$电子政务是政府机构运用网络与计算机技术开展政务，可提高政府、企业与公众之间的办事效率，并可用无线技术支持移动办公；网上购物属于电子商务而非电子政务。$q$, NULL, 'keep'),(342957, $q$神箭手云爬虫、八爪鱼、GooSeeker（集搜客）和WebMagic都是常见的网页爬虫工具或框架，四项均正确。$q$, NULL, 'keep'),(343074, NULL, NULL, 'unresolved'),(343080, $q$PowerPoint中的超链接可指向本文档的另一张幻灯片、其他演示文稿中的幻灯片、Word等文件以及Internet网址，四项都支持。$q$, NULL, 'keep'),(343116, $q$云计算资源池通常划分为计算资源池、存储资源池和网络资源池，安全一般以安全服务形式提供，不属于基本的资源池划分。$q$, NULL, 'keep'),(343155, $q$题目问的是错误叙述。病毒可通过电子邮件和光盘传播，也能自我复制，并会破坏数据、文件乃至硬件，因此 A 正确；B“只破坏系统软件”、C“无法通过光盘传播”、D“不能自我复制”三句均与事实相反，属于错误叙述。$q$, NULL, 'keep'),(345375, NULL, NULL, 'unresolved'),(345858, $q$扫描仪的主要性能指标包括分辨率、扫描幅面、色彩位数（灰度级）、扫描速度与接口等，A、C、D 均属其中；B 辐射与环保主要是显示器的选购指标，不是扫描仪的主要性能指标。$q$, NULL, 'keep'),(345865, $q$数字视频的图像扫描方式分为隔行扫描和逐行扫描两种，A、B 正确；C 全文扫描是文字检索的概念，D 段页扫描属于存储管理术语，均与图像扫描方式无关。$q$, NULL, 'keep'),(345867, NULL, NULL, 'unresolved'),(345868, $q$数字摄像头、智能手机、数码相机、数码摄像机都能直接拍摄并输出数字视频信号，均可作为数字视频的获取设备，四项全选。$q$, NULL, 'keep'),(345937, $q$超文本采用非线性的网状结构，C 说“线形结构”错误；超文本是一种信息组织技术，并非数据库技术，B 错误。A 说法成立（超文本概念早于多媒体技术），D 正是超媒体的定义，二者不错误。$q$, NULL, 'keep'),(345961, $q$PowerPoint 中对象动画分为进入、强调、退出（另有动作路径）几类，A、B、D 正确；C 幻灯片切换作用于整张幻灯片之间的过渡，不是为对象添加的动画效果。$q$, NULL, 'keep'),(345992, $q$数字音频获取依次为取样、量化、编码：A 说明取样的作用，B 说明量化的含义，C 描述编码（组织二进制代码并压缩），均正确；D 描述的是彩色图像扫描时测量各基色亮度值，属于图像数字化，不是音频获取过程。$q$, NULL, 'keep'),(345995, $q$数字摄像头、智能手机、数码相机都能直接记录数字视频，属于获取设备；D 的 .jpg 是静止图像文件格式，不是设备。$q$, NULL, 'keep'),(345998, $q$QR码由定位图形（定位标识）与数据/纠错区构成，并具有信息量大、纠错能力强等特点，A、B、C正确；二维码容量有限，无法存储视频内容，D错误。$q$, NULL, 'keep'),(346038, NULL, NULL, 'unresolved'),(348941, $q$通信系统模型由信源、信道、信宿三个基本要素组成，A、B、C正确；信息是被传输的内容，不属于模型的三要素，D错误。$q$, NULL, 'keep'),(348942, $q$UTP即无屏蔽双绞线，同轴电缆分为基带和宽带两类，光纤利用光波携带信息传输，A、B、C正确；光纤长距离传输仍需中继器，并非无中继器通信技术，D错误。$q$, NULL, 'keep'),(348943, NULL, NULL, 'unresolved'),(348947, $q$EPC即电子产品代码，利用全球统一标识系统给每个实体对象唯一编码，其体系包括EPC编码、EPC标签、实体标记语言等，并构造了全球物品信息实时共享的实物互联网，四项均正确。$q$, NULL, 'keep'),(348956, $q$物理独立性指应用程序与数据的物理存储相互独立，数据独立性由数据库管理系统的二级映像保证，并能简化程序编制、减少维护修改，B、C、D正确；逻辑独立性指应用程序与数据库逻辑结构相互独立，而非与ER模型独立，A错误。$q$, NULL, 'keep'),(352712, $q$按供电方式，RFID标签分为有源标签和无源标签（另有半有源标签），A、B正确；只读与可读写是按读写方式划分的类别，C、D错误。$q$, NULL, 'keep'),(352713, $q$电子标签进入电磁场后接收读写器发出的射频信号，无源标签靠空间中产生的电磁场获取能量，再把标签信息发送出去，由读写器读取并解码，四项均正确。$q$, NULL, 'keep'),(353217, $q$移动互联网金融涵盖移动支付、金融理财、金融电子商务以及基于大数据的信用评级等业务，四项均属于其业务范畴。$q$, NULL, 'keep')
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
  IF n <> 20 THEN RAISE EXCEPTION '第 2 批写入数应为 20，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_multi b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 5 THEN RAISE EXCEPTION '第 2 批保留数应为 5，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_multi b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN multi_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
