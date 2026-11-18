-- P2 第 16 批（25 道；html=8 colon=17 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(354166, NULL, $q$在云计算环境下，资源不再是分散的硬件，而是让 CPU、内存、磁盘、I/O 等硬件变成可以动态管理的"资源池"。$q$, NULL),(354342, NULL, $q$MapReduce 技术

（1）MapReduce 是 Hadoop 核心技术之一。
（2）MapReduce 框架的核心步骤主要分两部分:Map 和 Reduce。$q$, NULL),(354343, NULL, $q$Hadoop 是用于处理（运算分析）海量数据的技术平台，且是采用分布式集群的方式。$q$, NULL),(354350, NULL, $q$深度学习是目前人工智能领域中主要使用的技术，属于机器学习的相关技术。$q$, NULL),(354352, NULL, $q$微软公司演示的一个全自动的同声传译系统，其中完成了语音识别、英中翻译以及中文语音合成，其中的关键技术（基础）是深度学习。$q$, NULL),(354419, NULL, $q$数据挖掘常用算法:预测建模、聚类分析、关联分析、异常检测。$q$, NULL),(354430, NULL, $q$深度学习常用算法有:反向传播，前馈神经网络，卷积神经网络，循环神经网络，递归神经网络，自动编码器等。$q$, NULL),(354437, $q${"A": "MapReduce 的编程模型包含 Map 和 Reduce 两个函数处理过程。", "B": "对于 map 和 reduce 每个过程都由不同的计算机进行并行计算处理。", "C": "Map 的输出结果是一组 <key,value> 对，这是经过 Map 操作后所产生的中间结果。", "D": "Reduce 的工作是对相同 key 的 value 值进行归并处理。"}$q$, NULL, NULL),(354478, $q${"A": "传统营销模式比基于大数据的营销模式投入更小", "B": "传统营销模式比基于大数据的营销模式针对性更强", "C": "传统营销模式比基于大数据的营销模式转化率低", "D": "基于大数据的营销模式比传统营销模式实时性更强<br/>", "E": "基于大数据的营销模式比传统营销模式精准性更强"}$q$, NULL, NULL),(354479, $q${"A": "大数据具有体量大、结构单一、时效性强的特征", "B": "处理大数据需采用新型计算架构和智能算法等新技术", "C": "大数据的应用注重相关分析而不是因果分析", "D": "大数据的应用注重因果分析而不是相关分析<br/>", "E": "大数据的目的在于发现新的知识与洞察并进行科学决策"}$q$, NULL, NULL),(354565, NULL, $q$分布式计算是将应用分解成许多小的部分，分配给多台计算机进行处理。这样可以节约整体计算时间，大大提高计算效率。$q$, NULL),(354566, NULL, $q$常见的云计算部署模型有:公有云、私有云、社区云、混合云。$q$, NULL),(354567, NULL, $q$公有云是一种对公众开放的云服务，由云服务提供商建设与运营，为最终用户提供各种 IT 资源，可以支持大量用户的并发请求.$q$, NULL),(354571, NULL, $q$关系数据库、非关系数据库、数据仓库、分布式文件系统等存储。$q$, NULL),(354573, NULL, $q$大数据存储是指对规模巨大的数据进行分析。$q$, NULL),(354618, NULL, $q$以太坊是一个开放的有智能合约功能的公共区块链平台，通过其专用加密货币以太币（Ether，简称“ETH”）提供以太虚拟机（Ethereum Virtual Machine，EVM）来处理去中心化合约应用。$q$, NULL),(354667, $q${"A": "分布式云存错技术", "B": "高性能并行计算", "C": "多源数据清洗及数据整合技木", "D": "分布式文件系统及分布式并行数据库<br/>", "E": "以上都有"}$q$, NULL, NULL),(354691, $q${"A": "分布式云存错技术", "B": "高性能并行计算", "C": "多源数据清洗及数据整合技木", "D": "分布式文件系统及分布式并行数据库<br/>", "E": "以上都有"}$q$, NULL, NULL),(354795, NULL, $q$分布式计算是将应用分解成许多小的部分，分配给多台计算机进行处理。这样可以节约整体计算时间，大大提高计算效率。$q$, NULL),(354801, NULL, $q$大数据存储是指对规模巨大的数据进行分析。$q$, NULL),(354858, $q${"A": "key", "B": "value", "C": "<key, value>", "D": "Hash"}$q$, NULL, NULL),(355125, $q${"A": "计算机视觉是指用摄影机和电脑代替人眼对目标进行识别、跟踪和测量的机器视觉", "B": "计算机视觉研究相关的理论和技术，试图建立能够从图像或者多维数据中获取'信息'的人工智能系统", "C": "计算机视觉是利用人类交流所使用的自然语言与机器进行交互通讯的技术", "D": "主要任务就是通过对采集的图片或视频进行处理以获得相应场景的三维信息，就像人类和许多其他类生物每天所做的那样"}$q$, NULL, NULL),(355144, $q${"A": "计算机视觉是一门研究如何使机器\"看\"的科学", "B": "是指用摄影机和电脑代替人眼对目标进行识别、跟踪和测量等机器视觉", "C": "计算机视觉是一门综合性的学科", "D": "语音识别属于计算机视觉的典型应用"}$q$, NULL, NULL),(355155, NULL, $q$区块链 2.0 以以太坊技术为主，标志主要是 EVM 和智能合约。$q$, NULL),(355239, NULL, $q$深度学习是学习样本数据的内在规律和表示层次，这些学习过程中获得的信息对诸如文字，图像和声音等数据的解释有很大的帮助。$q$, NULL)
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
  IF n <> 8 THEN RAISE EXCEPTION '第 16 批 HTML 更新数应为 8，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 17 THEN RAISE EXCEPTION '第 16 批解析去冒号数应为 17，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 16 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 16 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 16 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
