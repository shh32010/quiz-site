-- P2 第 13 批（25 道；html=10 colon=14 prefix=1）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(348225, NULL, $q$软件生命周期（三个时期八个阶段）:定义期（可行性分析、需求分析）、开发期（概要设计、详细设计、编码、测试）、维护期（运行与维护、退役）。$q$, NULL),(348226, NULL, $q$从信源信号调整之后进行传输的过程是调制（D/A），从载波上提取信号的过程是解调(A/D)。$q$, NULL),(348230, NULL, $q$关系数据库中关系使用二维表表示。行是记录（或元组），列是属性（或字段）$q$, NULL),(348456, NULL, NULL, $q$十进制整数转换为二进制整数与十进制小数转换为二进制小数采用同样的方法。$q$),(348737, NULL, $q$关系数据库中关系使用二维表表示。行是记录（或元组），列是属性（或字段）$q$, NULL),(348943, NULL, $q$关系完整性约束:

(1)实体完整性:是否为空值，主码等
(2)参照完整性:主外键约束删除增加等
(3)用户定义的完整性:取值范围、属性值函数关系等$q$, NULL),(349164, $q${"A": "通知", "B": "感知", "C": "认知", "D": "预知<br/><br/>", "E": "相知"}$q$, NULL, NULL),(349176, $q${"A": "规模较大", "B": "规模较小", "C": "增速很快", "D": "增速缓慢<br/><br/>", "E": "多产业交叉融合"}$q$, NULL, NULL),(349178, $q${"A": "挖掘数据的潜在价值", "B": "实现数据重组的创新价值", "C": "利用数据可扩展性拓宽业务领域", "D": "优化存储设备，降低设备成本<br/>", "E": "提高社会效益，优化社会管理"}$q$, NULL, NULL),(349181, $q${"A": "数学与统计知识", "B": "计算机相关知识", "C": "马克思主义哲学知识", "D": "市场运营管理知识<br/>", "E": "在特定业务领域的知识"}$q$, NULL, NULL),(349248, $q${"A": "存储域", "B": "计算域", "C": "交换域", "D": "管理域<br/><br/>", "E": "核心域"}$q$, NULL, NULL),(349359, NULL, $q$Hadoop 的核心组件包括:HDFS、MapReduce、Yarn。①、HDFS:hadoop 分布式文件系统海量数据的存储(集群服务)；②、MapReduce:分布式运算框架（编程框架）；③、Yarn:资源调度管理集群。GFS 是谷歌文件系统$q$, NULL),(349450, $q${"A": "政府间的电子政务", "B": "政府对企业的电子政务", "C": "政府对公民的电子政务", "D": "电子政务流程<br/>", "E": "电子政务功能"}$q$, NULL, NULL),(349451, $q${"A": "专题地理信息系统", "B": "区域地理信息系统", "C": "地理信息系统工具", "D": "地理信息系统软件<br/>", "E": "地理信息系统制图"}$q$, NULL, NULL),(349745, $q${"A": "存储(记忆)1个比特需要使用具有两种稳定状态的器件", "B": "比特的取值只有\"0\"和\"1\"", "C": "比特既可以表示数值、文字也可以表示图像、声音", "D": "比特既没有颜色也没有重量,但有大小"}$q$, NULL, NULL),(349767, NULL, $q$(1)ADSL 的数据传输速率是根据线路的情况自动调整的,它以尽力而为的方式进行数据传输。

(2)像 ISDN 一样,ADSL 可以与普通电话共存于一条电话线上,可同时接听、拨打电话并进行数据传输,两者互不影响。ADSL 利用普通电话线作为传输介质,通过一种自适应的数字信号调制解调技术,能在电话线上得到 3 个可以同时工作的信息通道。$q$, NULL),(349796, NULL, $q$三层结构类型的物联网:感知层、网络层、应用层。$q$, NULL),(349813, NULL, $q$人工神经网络是一种模拟人脑神经网络的机器学习技术，它由输入层、输出层和中间层（也称为隐蔽层）组成。$q$, NULL),(349815, NULL, $q$输入层用于数据输入，只负责传输数据， 不做计算。$q$, NULL),(350065, NULL, $q$供应链的核心就是物品的仓储和运输，即物流活动与之有紧密联系。$q$, NULL),(350070, NULL, $q$三层结构类型的物联网:感知层、网络层、应用层。$q$, NULL),(350091, $q${"A": "软件即服务", "B": "平台即服务", "C": "基础设施即服务", "D": "基于管理服务<br/>"}$q$, NULL, NULL),(350230, NULL, $q$深度学习是学习样本数据的内在规律和表示层次，这些学习过程中获得的信息对诸如文字，图像和声音等数据的解释有很大的帮助。$q$, NULL),(350234, NULL, $q$输入层用于数据输入，只负责传输数据， 不做计算。$q$, NULL),(350426, $q${"A": "HTML5标准还在制定中", "B": "HTML5兼容以前HTML4下浏览器", "C": "<canvas>标签替代Flash"}$q$, NULL, NULL)
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
  IF n <> 10 THEN RAISE EXCEPTION '第 13 批 HTML 更新数应为 10，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 14 THEN RAISE EXCEPTION '第 13 批解析去冒号数应为 14，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 1 THEN RAISE EXCEPTION '第 13 批前缀修复数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 13 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 13 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
