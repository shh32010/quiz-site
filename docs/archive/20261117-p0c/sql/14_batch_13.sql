-- P0-C 第 13 批（13 道：10 写入 + 3 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(389873, $q$静态图像压缩标准是 JPEG，由 ISO/IEC 与 ITU-T 联合制定，适用于连续色调静止图像的压缩；AVI、MOV 均为视频文件格式，MPEG 是动态图像（视频）压缩标准，故不能选。故选 B。$q$, NULL, 'keep'),(389953, $q$彩色打印机用青、品红、黄、黑四种油墨叠印成色，对应 CMYK 颜色模型；RGB 是显示器等发光设备的加色模型，HSB 面向人眼感知，YUV 多用于电视信号传输。故选 A。$q$, NULL, 'keep'),(390001, $q$按异或规则逐位运算：高四位 1⊕0、0⊕1、0⊕0、1⊕0 得 1101，低四位 0⊕1、1⊕1、1⊕0、1⊕0 得 1011，结果为 11011011。C、D 仅七位，属残缺干扰项。故选 B。$q$, NULL, 'keep'),(390018, $q$编译程序把高级语言源程序整体翻译成目标程序，再经连接生成可执行文件；解释程序逐句解释执行、不产生目标程序，连接程序只拼接目标模块，装入程序负责载入内存。故选 B。$q$, NULL, 'keep'),(390024, $q$计算机病毒具有破坏性、传染性、潜伏性、隐蔽性和可触发性等特征；健壮性指系统在异常输入或故障下仍能正常运行的能力，属于软件质量指标，不是病毒特征。故选 B。$q$, NULL, 'keep'),(390026, $q$网络信息安全的基本要素是保密性、完整性、可用性，并可扩展可控性与不可否认性；传播性描述病毒或信息的扩散，不属于安全要素，其余三项均为标准要素。故选 D。$q$, NULL, 'keep'),(390084, $q$多层票据套打需要足够击打力穿透复写层，针式打印机靠打印针撞击色带逐层复写，最适合；喷墨、激光为单页非击打式，3D 打印不能输出票据。故选 B。$q$, NULL, 'keep'),(390100, NULL, NULL, 'manual'),(390102, $q$B 类 IP 地址第一字节范围为 128～191。61.177.7.1 属 A 类，129.248.1.253 属 B 类，193.1.109.1 属 C 类，229.1.189.1 属 D 类组播地址。故选 B。$q$, NULL, 'keep'),(390118, NULL, NULL, 'manual'),(390177, $q$软件作为智力劳动成果受著作权法等知识产权保护。版权通常归开发者或单位，购买软件只取得使用权而非版权；共享软件可免费试用，但不得随意修改、销售。故选 B。$q$, NULL, 'keep'),(390280, NULL, NULL, 'manual'),(390314, $q$公有区块链各节点保存完整账本，区块包含的交易信息公开完整，A 正确；区块链数据篡改难度大而非较小，可追溯性主要来自链式结构与时间戳而非去中心化，D 项表述残缺不通。故选 A。$q$, NULL, 'keep')
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
  IF n <> 10 THEN RAISE EXCEPTION '第 13 批写入数应为 10，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 3 THEN RAISE EXCEPTION '第 13 批人工数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 13 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
