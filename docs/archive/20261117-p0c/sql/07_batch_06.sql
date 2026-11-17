-- P0-C 第 6 批（25 道：20 写入 + 5 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(351268, $q$一名员工可对应多台计算机，而每台计算机只能对应一名员工，员工端为一、计算机端为多，故员工与计算机之间是一对多联系。若两端都能对应多个才是多对多，本题计算机端唯一，可排除。故选 B。$q$, NULL, 'keep'),(351269, $q$A 中 1210 含数字 2，不符合二进制数符规则；B 中 1101 作为 BCD 码取值大于 9，非法；D 中 8 超出八进制 0 至 7 的范围。C 符合十六进制表示规则，F 为数符、H 为后缀。故选 C。$q$, NULL, 'keep'),(351320, $q$大写 A 的 ASCII 码为 41H 即十进制 65，小写 d 比 A 大 35，故为十进制 100，即十六进制 64H。44H 是误以 A 为基准只加 3 得到的干扰项，64D 的十进制数值同样不符。故选 D。$q$, NULL, 'keep'),(351366, $q$按内码规则，最高位为 1 的字节是汉字首字节并连占两字节。C2、C7 各引导一个汉字，其余 5A、47、6D、43、46、30 共 6 个字节最高位为 0，为西文字符。合计 6 个西文、2 个汉字。故选 C。$q$, NULL, 'keep'),(351399, $q$设该进制为 b，则（1×b+5）×4=6b+6，即 4b+20=6b+6，解得 b=7。验证 15₇×4=12×4=48=66₇ 成立。于是 21₇ 减 13₇ 等于 15 减 10 得 5，5 在七进制中合法。故选 B。$q$, NULL, 'keep'),(351413, $q$设进制为 b，5×8=40=2b+8，解得 b=16，十六进制中 28 即 40，验证成立。8+9=17，写成十六进制为 11。干扰项 13、12 是按十进制或误取其他进制换算的结果。故选 C。$q$, NULL, 'keep'),(351435, NULL, NULL, 'manual'),(351437, $q$设该进制为 b，（1×b+5）×4=6b+6，解得 b=7。验证 15₇ 为 12，12×4=48，48 写作七进制正是 66。21₇ 减 13₇ 为 15 减 10 等于 5，且 5 在七进制中合法。故选 B。$q$, NULL, 'keep'),(351476, $q$关系模式的规范写法为 R(A1,A2,…,An)，属性名之间用逗号分隔并整体加圆括号。A 项用乘号连接、B 项多套括号、C 项用顿号分隔，均不符合表示规范，只有 D 项用逗号分隔属性。故选 D。$q$, NULL, 'keep'),(351575, $q$Web1.0 以只读浏览为主，Web2.0 强调用户参与和内容生产，由读向写的转变是网络应用模式层面的演进，并非运行机制、具体应用或工具本身的变化。故选 B。$q$, NULL, 'keep'),(351615, $q$以太坊用默克尔前缀树（MPT）保存账户状态，并把状态根哈希写入区块头，因此可通过它校验和查询状态；MerkleTree 只是一个笼统称谓，PoW 只是共识机制，阶段协议与此无关。故选 B。$q$, NULL, 'keep'),(351653, NULL, NULL, 'manual'),(351654, $q$物流是供应链流程的组成部分，其要义是以高效率、高效益完成商品及相关信息从原产地到消费地的双向流动与存储，并进行计划、实施与控制，属于供应链管理视角的定义。故选 D。$q$, NULL, 'keep'),(351684, $q$统一换算为十进制：八进制 110 等于 72，十六进制 4A 等于 74，二进制 01001 等于 9，十进制 71 保持不变；四者中 74 最大，因此十六进制 4A 最大。故选 C。$q$, NULL, 'keep'),(351831, $q$物联网十大应用范畴一般包括智能电网、医疗健康、物流、交通、家居、农业、环保、安防、工业以及金融与服务业，智能通信并不在其中，它属于通信网络本身而非应用范畴。故选 C。$q$, NULL, 'keep'),(352004, $q$m 的 ASCII 码为 6DH，即十进制 109；q 在 m 之后第 4 个字母，因此加 4 得 113，即十六进制 71H；70H 对应 p，72H 对应 r，均不符合。故选 B。$q$, NULL, 'keep'),(352065, NULL, NULL, 'manual'),(352304, NULL, NULL, 'manual'),(352402, NULL, NULL, 'manual'),(352520, $q$工业互联网三大体系中，网络是基础、平台是核心、安全是保障；平台汇聚数据与模型，支撑工业 APP 开发与应用，因此被称为核心，而 APP 只是应用载体。故选 C。$q$, NULL, 'keep'),(352829, $q$物联网是在互联网基础上延伸和扩展的网络，把连接对象由人扩展到物；其基础仍是互联网而非局域网，且物与物、物与人的通信属于物联网而非互联网。故选 B。$q$, NULL, 'keep'),(352830, $q$该定义出自国际电信联盟（ITU）2005 年《ITU 互联网报告 2005：物联网》，即把各类信息传感设备与互联网结合、实现智能化识别和管理的网络；IT 并非标准组织，UDP 是协议，DD 无此说法。故选 A。$q$, NULL, 'keep'),(352953, $q$信息才是数据的内涵与解释，数据是信息的载体，B 项把二者关系说反了；A、C、D 均符合数据、信息与知识的通行表述，知识更接近行动、与决策相关。故选 B。$q$, NULL, 'keep'),(353030, $q$射频识别可远距离、非接触、批量识读多个对象，并具抗污染、可重复使用等优势；但其标签与读写器价格明显高于条形码，谈不上成本最低，低成本恰是条码的优点。故选 D。$q$, NULL, 'keep'),(353046, $q$制造业的采购、生产、库存、销售等环节都靠以供应链为核心的物流活动串联，物联网在物流中的应用可提升可视化与效率，因而对每个企业都有直接影响。故选 B。$q$, NULL, 'keep')
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
  IF n <> 20 THEN RAISE EXCEPTION '第 6 批写入数应为 20，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 5 THEN RAISE EXCEPTION '第 6 批人工数应为 5，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 6 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
