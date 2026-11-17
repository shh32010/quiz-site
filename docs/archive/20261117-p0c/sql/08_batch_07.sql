-- P0-C 第 7 批（25 道：22 写入 + 3 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(353047, $q$题干中末端传感器采集农田信息，用于种植、防灾与科学种植决策，核心场景是农业生产，属于大数据在农业领域的典型应用；养殖针对畜禽水产，科学过于宽泛，农生并非规范领域名。故选 A。$q$, NULL, 'keep'),(353117, $q$HTML5 并非对 HTML4 的简单升级，而是包含语义标签、多媒体、离线缓存等大量新特性；当时并非所有主流浏览器都完整支持，其目标也不限于移动端，而离线缓存机制确为 HTML5 新增。故选 C。$q$, NULL, 'keep'),(353287, $q$移动通信技术代际中 4G 之后是 5G，5G 已商用并具备高速率、低时延、大连接特点，属于目前最新的移动通信技术；蓝牙 4.0 与 WIFI 是短距无线接入，不属于移动通信代际。故选 B。$q$, NULL, 'keep'),(353288, NULL, NULL, 'manual'),(353299, $q$题干强调移动技术在政府工作中的应用，并通过手机、PDA、无线网络、蓝牙、RFID 等为公众提供服务，这正是移动电子政务的定义；移动支付、移动金融侧重交易，移动通信指网络本身。故选 C。$q$, NULL, 'keep'),(353340, $q$大数据按结构通常分为结构化、半结构化和非结构化三类；锚点（Anchor）是网页超链接定位术语，与大数据结构分类无关，是明显干扰项。故选 D。$q$, NULL, 'keep'),(353398, $q$题干描述用户通过手机等无线终端，经 3G、4G、5G 或 WLAN 等较高速率移动网络接入互联网，这正是移动互联网的定义；移动通信网、移动电话网仅指网络设施，范围更窄。故选 D。$q$, NULL, 'keep'),(353399, $q$移动互联网具有便携性、交互性和多样性等特征，局限性指受终端与无线网络条件制约的不足，不属于其特征，题干要求选不包括的选项。故选 A。$q$, NULL, 'keep'),(353893, $q$云计算的五个基本特征为按需自服务、泛在接入、资源池化、快速弹性与可计量服务；固定服务与云的按需、弹性理念相矛盾，明显不属于其基本特征。故选 D。$q$, NULL, 'keep'),(353914, $q$题干描述虚拟化平台直接运行在硬件之上、虚拟机运行于其上并由平台提供指令集与设备接口，这正是虚拟化技术的典型架构，与分布式计算、分布式网络及存储无关。故选 B。$q$, NULL, 'keep'),(353919, $q$云计算常见部署模型为公有云、私有云和混合云（另有社区云）：公有云面向公众，私有云供单一组织专用，混合云为二者组合；生态云并非标准部署模型，是生造干扰项。故选 D。$q$, NULL, 'keep'),(353927, $q$智慧城市建设常以云计算的 IaaS、PaaS、SaaS 三层服务作为支撑，三者均为常见服务模式；DaaS（数据即服务）并非该类题目所列智慧城市建设内容的组成，属于干扰项。故选 D。$q$, NULL, 'keep'),(354061, $q$云计算通过互联网提供的是动态、易扩展、虚拟化的资源与服务，而非静态、难扩展且实体化的资源，D 项与云的核心特性相反；A、B、C 三项均符合云计算定义。故选 D。$q$, NULL, 'keep'),(354064, NULL, NULL, 'manual'),(354096, $q$VLAN、VPN、VEPA 分别通过划分逻辑网络、加密隧道和虚拟端口聚合实现网络虚拟化；SAN 是存储区域网络，属于存储虚拟化范畴，不属于网络虚拟化概念。故选 D。$q$, NULL, 'keep'),(354110, $q$题干所列的 PC、PAD、手机都是常见的用户终端，可以随时通过互联网访问云服务；路由器属于网络层的转发设备，用于组建网络和转发数据包，本身并不作为用户直接访问云服务的终端。故选 D。$q$, NULL, 'keep'),(354167, $q$泛在接入是指用户可以借助 PC、平板、手机等多种终端，随时随地上网使用云服务；路由器负责网络互联，是上网时负责数据转发的设备，不属于用户使用的云服务访问终端。故选 D。$q$, NULL, 'keep'),(354253, $q$云计算通过互联网提供动态、易扩展且虚拟化的资源，而 D 项说静态难扩展、实体化资源，与云计算的弹性、虚拟化特征完全相反，因此属于错误说法；A 项是服务交付模式的定义，B、C 两项符合按需和泛在的特点。故选 D。$q$, NULL, 'keep'),(354572, $q$题干的关键在于快速给出实时分析结果，强调数据产生后能迅速处理并反馈，这与大数据处理速度快的特征相对应；每秒产生百万级数据只是在描述数据量大的背景，落脚点仍是实时分析。故选 C。$q$, NULL, 'keep'),(354574, $q$题干强调真正有用的信息在总数据中占比很低，也就是从海量数据中挖掘价值的难度大，这正是大数据价值密度低的含义；数据量大、种类繁多、处理速度快三个特征都无法解释有用信息密度低这一现象。故选 D。$q$, NULL, 'keep'),(354742, $q$IDC 对大数据给出的定义是：为更经济地从高频率、大容量、不同结构和类型的数据中提取价值而设计的新一代架构和技术，突出规模大、类型多、速度快、价值密度低等特征，与题干表述完全吻合；数据仓库和云计算都是相关但不相同的概念。故选 C。$q$, NULL, 'keep'),(354800, $q$题干的落脚点是快速、实时地给出分析结果，对应的是大数据处理速度快这一特征；每秒产生百万级数据只是在交代数据量大的背景，数据种类繁多、价值密度低都与实时性无关。故选 C。$q$, NULL, 'keep'),(354809, $q$大数据处理的基本流程通常包括数据采集、数据预处理（归整、清洗）、数据存储、分析与挖掘以及结果展现，其中并不包含数据还原这一环节，D 项是凭空设置的干扰项。故选 D。$q$, NULL, 'keep'),(355155, NULL, NULL, 'manual'),(355275, $q$人工智能的目标是让机器模拟、延伸和扩展人的智能，从而把部分脑力劳动机械化；而具有完全智能、和人脑一样考虑问题、完全代替人都夸大了当前能力，也不符合学科定义。故选 D。$q$, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0c_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0c_expected e
WHERE q.id = e.id AND e.action = 'manual' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 22 THEN RAISE EXCEPTION '第 7 批写入数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 3 THEN RAISE EXCEPTION '第 7 批人工数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 7 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
