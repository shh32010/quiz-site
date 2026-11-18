-- P2 第 17 批（25 道；html=2 colon=23 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(355276, NULL, $q$循环神经网络是一类以序列数据为输入，在序列的演进方向进行递归且所有节点（循环单元）按链式连接的递归神经网络。$q$, NULL),(355277, NULL, $q$自然语言处理( Natural Language Processing, NLP)是计算机科学领域与人工智能领域中的一个重要方向。它研究能实现人与计算机之间用自然语言进行有效通信的各种理论和方法。$q$, NULL),(355279, NULL, $q$自然语言处理( Natural Language Processing, NLP)是计算机科学领域与人工智能领域中的一个重要方向。它研究能实现人与计算机之间用自然语言进行有效通信的各种理论和方法。$q$, NULL),(355303, NULL, $q$自动控制并不是人工智能应用，而自动驾驶是人工智能方面的应用。$q$, NULL),(355311, NULL, $q$用计算机模拟人工智能不属于当今的人工智能发展方向。$q$, NULL),(355318, NULL, $q$区块链的特性:网络分散（去中心化）、安全性、可追溯性、共识机制、不变化、高可用性等。$q$, NULL),(355386, NULL, $q$输入层用于数据输入，只负责传输数据， 不做计算。$q$, NULL),(355397, NULL, $q$深度学习是学习样本数据的内在规律和表示层次，这些学习过程中获得的信息对诸如文字，图像和声音等数据的解释有很大的帮助。$q$, NULL),(355405, NULL, $q$自然语言处理( Natural Language Processing, NLP)是计算机科学领域与人工智能领域中的一个重要方向。它研究能实现人与计算机之间用自然语言进行有效通信的各种理论和方法。$q$, NULL),(355411, NULL, $q$自然语言处理( Natural Language Processing, NLP)是计算机科学领域与人工智能领域中的一个重要方向。它研究能实现人与计算机之间用自然语言进行有效通信的各种理论和方法。$q$, NULL),(355557, NULL, $q$自然语言处理( Natural Language Processing, NLP)是计算机科学领域与人工智能领域中的一个重要方向。它研究能实现人与计算机之间用自然语言进行有效通信的各种理论和方法。$q$, NULL),(355582, NULL, $q$深度学习是学习样本数据的内在规律和表示层次，这些学习过程中获得的信息对诸如文字，图像和声音等数据的解释有很大的帮助。$q$, NULL),(355877, $q${"A": "可信任", "B": "\"去中心化\"的分布式", "C": "可追溯", "D": "可以被篡改"}$q$, NULL, NULL),(355941, NULL, $q$有时候以太坊采用五层架构实现，从下到上分别是数据层、 网络层、共识层、激励层、智能合约层。$q$, NULL),(355966, NULL, $q$区块链在资产证券化发行方面的应用属于业务协同类。$q$, NULL),(355967, NULL, $q$联盟链:系统半开放，仅限联盟成员参与（R3 联盟:国际银行和金融机构组成、原本链:横跨全球五大洲部署节点）$q$, NULL),(355969, NULL, $q$区块链去中心化，降低了交易双方（对手）的信用风险。$q$, NULL),(356072, NULL, $q$其中，账本是最核心的结构，记录应用信息，应用则通过发起交易来向账本中记录数据。$q$, NULL),(356178, NULL, $q$区块主要由区块头、交易列表和叔区块头三部分组成；$q$, NULL),(356331, NULL, $q$数据模型:数据模型是信息模型在数据世界中的表示形式。可将数据模型分为三类:

（1）层次模型:一种用树形结构描述实体及其之间关系的数据模型。
（2）网状模型:一个结点可以同时拥有多个双亲结点和子节点关系的数据模型。
（3）关系模型:采用二维表格结构表达实体类型及实体间联系的数据模型，它的基本假定是所有数据都表示为数学上的关系。

关系数据库系统是支持关系模型的数据库系统。目前大多数据库系统都是基于关系数据模型（SQL 技术类数据库:Visual FoxPro、SQL Server 、MySQL、Access、SQL Server 等）$q$, NULL),(356344, NULL, $q$NoSQL 技术功能:

①、数据管理:提供查询窗口和命令窗口功能。
②、结构管理:提供库、文档和索引等对象管理功能。
③、实时性能展示:提供核心性能指标的实时展示。$q$, NULL),(356347, NULL, $q$人工智能的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。$q$, NULL),(356793, NULL, $q$大数据和人工智能虽然关注点并不相同，但是却有密切的联系，一方面人工智能需要大量的数据作为“思考”和“决策”的基础，另一方面大数据也需要人工智能技术进行数据价值化操作，比如机器学习就是数据分析的常用方式。$q$, NULL),(357108, NULL, $q$主要有以下技术:分布式计算、虚拟化技术（核心）、分布式存储技术、超大规模资源管理技术、云计算平台管理技术、信息安全技术、绿色节能技术。$q$, NULL),(357237, $q${"A": "sum(A2, 1)", "B": "sum(\"A2\", 1)", "C": "sum(A1, A2)", "D": "A1+A2"}$q$, NULL, NULL)
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
  IF n <> 2 THEN RAISE EXCEPTION '第 17 批 HTML 更新数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 23 THEN RAISE EXCEPTION '第 17 批解析去冒号数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 17 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 17 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 17 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
