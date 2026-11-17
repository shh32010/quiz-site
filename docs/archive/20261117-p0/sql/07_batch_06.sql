-- P0-211 第 6 批（25 道：24 写入 + 1 标 uncertain/manual）
BEGIN;
CREATE TEMP TABLE p0_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0_expected (id, analysis, correct, stem, action) VALUES
(354598, $q$NoSQL 没有统一的数据模式，也无需预先定义表结构，A、B 错误；通用性更强的是关系型数据库，NoSQL 优势在于分布式部署与海量数据检索，D 亦错。故选 C。$q$, NULL, NULL, 'keep'),(354612, $q$ETL 从各类数据源抽取数据，经转换清洗后加载到目标库，是数据采集环节的主要技术；清洗只是其中一步，存储与分析环节另有专门技术。故选 A。$q$, NULL, NULL, 'keep'),(354701, $q$大数据具有数据量大、类型多、处理速度快、价值密度低而商业价值高等特征，A、B、C 分别对应数据体量、处理速度与价值，均属其主要特征，故应全选。故选 D。$q$, NULL, NULL, 'keep'),(354732, $q$在大数据技术体系中，数据分析与挖掘处于价值链高端，是当前的前沿技术方向；数据处理、数据结构属于基础环节，数据定义也并非独立技术。故选 B。$q$, NULL, NULL, 'keep'),(354758, NULL, NULL, NULL, 'uncertain'),(354814, $q$NoSQL 没有统一的数据模式，无需预先定义表结构，A、B 均错误；关系型数据库通用性更强，NoSQL 的优势在分布式部署与大数据检索，D 混入“通用性”故错。故选 C。$q$, NULL, NULL, 'keep'),(354854, $q$大数据治理主要围绕数据安全、成本控制与信息生命周期管理展开；“针对大用户”属于面向特定用户群的应用策略，不属于治理范畴。故选 C。$q$, NULL, NULL, 'keep'),(354861, $q$大数据的取舍与数据是否易于提取、数字化程度高低、存储器是否廉价等条件相关；家庭信息属于个人生活信息，与数据取舍的技术条件无关。故选 B。$q$, NULL, NULL, 'keep'),(354866, $q$大数据的价值通过数据共享与交叉复用实现，即一数多用：同一份数据在不同业务场景中反复使用，从而获取最大的数据价值。故选 D。$q$, NULL, NULL, 'keep'),(354875, $q$NoSQL 没有统一的理论支撑，也不需要预先定义严格的数据模式，因此难以像关系数据库那样实现完整性约束，其维护也并不更简单。故选 C。$q$, NULL, NULL, 'keep'),(355435, $q$按体系结构划分，专家系统有集中式与分布式之分，分布式专家系统属于新型专家系统；多媒体、军事等则是按应用领域划分的传统类型。故选 D。$q$, NULL, NULL, 'keep'),(355959, $q$区块链上的交易信息是公开透明、可追溯的，主要靠哈希与数字签名保证不可篡改，并非“高度加密”存储；其余三项描述均正确。故选 C。$q$, NULL, NULL, 'keep'),(356126, $q$比特币以及以太币、狗狗币、莱特币等两千余种去中心化数字货币，都属于区块链的数字货币应用，这是区块链最早也最成熟的落地场景。故选 A。$q$, NULL, NULL, 'keep'),(356130, $q$区块链基于 P2P 对等网络组织节点，技术构成包括密码学、共识算法与分布式数据库，并不采用 C/S 客户机/服务器网络结构。故选 A。$q$, NULL, NULL, 'keep'),(356134, $q$区块链账本具有可以无限增加、加密存储、按时间有序链接三个特点，同时它是去中心化的分布式账本，“中心化”与其本质相矛盾。故选 D。$q$, NULL, NULL, 'keep'),(356145, $q$以太坊的概念由维塔利克·布特林于 2013 年提出，白皮书同年发布，教材以其提出年份作为诞生年，比 2009 年诞生的比特币晚了四年。故选 C。$q$, NULL, NULL, 'keep'),(356147, $q$教材以以太坊白皮书发布的 2013 年作为其诞生年份；2009 年是比特币诞生的年份，2016 年则已是以太坊发展成熟之后。故选 C。$q$, NULL, NULL, 'keep'),(356190, $q$以太币、狗狗币、莱特币等两千余种去中心化数字货币都是在比特币基础上衍生出来的，属于区块链的数字货币应用。故选 A。$q$, NULL, NULL, 'keep'),(357189, $q$Excel 可直接打开 xls 工作簿，也能直接导入 HTML 网页和 txt 文本文件；DOC 属于 Word 文档格式，Excel 无法直接打开。故选 BCD。$q$, NULL, NULL, 'keep'),(357307, $q$在 Word 中未选中任何文本时，段落格式命令只作用于插入点所在的那一个段落，文档中其他段落不受影响，也不会作用于整篇文档。故选 C。$q$, NULL, NULL, 'keep'),(357600, $q$“新建窗口”只是为同一篇文档再开一个视图，两个窗口显示的内容完全相同；它们仍属于同一个文档，可以依次关闭，不会互相联动。故选 C。$q$, NULL, NULL, 'keep'),(357670, $q$PowerPoint 新建幻灯片时可从“幻灯片版式”任务窗格中选用题源教材所列的 28 种版式，涵盖标题、文本、对象及其组合。故选 C。$q$, NULL, NULL, 'keep'),(357677, $q$更换幻灯片布局要在“幻灯片版式”对话框中选择目标版式，把“项目清单”改为“对象”同样如此；配色方案与背景只改外观，不改变布局。故选 A。$q$, NULL, NULL, 'keep'),(358051, $q$磁盘访问时间由寻道时间、旋转等待时间和数据传输时间三部分构成；磁头移动其实就是寻道过程，不单独算作一种访问时间。故选 C。$q$, NULL, NULL, 'keep'),(359012, $q$访问控制的任务正是为不同用户或用户类规定对文件、信息资源的不同操作权限；加密强度再高也不能保证数据不被窃取，数字签名已具法律效力。故选 B。$q$, NULL, NULL, 'keep')
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
  IF n <> 24 THEN RAISE EXCEPTION '第 6 批写入数应为 24，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0 b ON b.id = q.id
   WHERE e.action IN ('uncertain', 'manual')
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 1 THEN RAISE EXCEPTION '第 6 批 uncertain/manual 数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 6 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
