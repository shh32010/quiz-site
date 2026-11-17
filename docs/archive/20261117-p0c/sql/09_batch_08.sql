-- P0-C 第 8 批（25 道：22 写入 + 3 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(355283, $q$题干给出的正是人工智能的定义：用计算机模拟人的智能行为，构造出能完成原本需要人的智力才能胜任的工作的智能系统；智能助理、智慧生活、管理系统都只是人工智能的具体应用形态。故选 D。$q$, NULL, 'keep'),(355306, $q$小度智能助手以语音交互为核心，先用语音识别把用户说的话转成文字，再用自然语言处理理解意图并生成回答，因此主要依赖自然语言处理；机器视觉、图像识别面向看，大数据处理只是支撑手段。故选 A。$q$, NULL, 'keep'),(355307, $q$题干称该技术研究如何让机器看，并以摄像机、雷达等光电传感器和计算机为核心模拟人类视觉，这正是计算机视觉的定义；自然语言处理处理的是语言，深度学习是一种方法，数据挖掘面向数据规律。故选 A。$q$, NULL, 'keep'),(355317, $q$专家系统、人工神经网络、自然语言处理都属于人工智能的典型研究与应用领域；自动控制属于传统的控制工程分支，虽然可以与智能技术结合，但本身并不被列为人工智能的应用领域。故选 B。$q$, NULL, 'keep'),(355319, $q$说声开灯、夜灯就亮需要先做语音识别，再做语义理解，属于典型的智能语音技术；窗帘拉合、窗户关闭依靠光敏或雨滴传感器触发，智能床铃播放音乐依靠检测声音强度，都没有涉及语音识别。故选 C。$q$, NULL, 'keep'),(355395, $q$人工智能应用领域通常包括专家系统、自然语言理解、机器学习与神经网络、模式识别、智能控制等；自动控制是自动化与工程控制领域的通用技术，只有引入智能算法的智能控制才归入人工智能。故选 B。$q$, NULL, 'keep'),(355406, $q$自然语言理解的目标包括理解人们说出或写出的语言、对自然语言信息进行分析概括与编辑、机器翻译和人机对话等，处理对象都是语言文字。欣赏音乐属于对音频与音乐的感知鉴赏，不涉及语言的理解与生成。故选 C。$q$, NULL, 'keep'),(355412, $q$计算智能、感知智能、认知智能是被普遍采用的三个层次，B 成立；达特茅斯会议标志人工智能诞生，D 成立；A 亦属常见说法。C 把模式识别、机器学习、知识图谱当作新一代人工智能核心技术并不准确，它们只是一般关键技术。故选 C。$q$, NULL, 'keep'),(355556, $q$中央控制系统在智能家居中统一接收各子系统信息并协调调度其运行，处于指挥中枢地位，因此被形象地称为智能家居的大脑；管家多指语音助手或服务平台，保安对应安防子系统。故选 B。$q$, NULL, 'keep'),(355570, $q$题目描述的是采集车流量、车速等交通信息，经智能分析后动态调整各路口红绿灯配时，属于典型的智能交通应用；智能控制侧重设备自动调节，智能安防侧重监控报警，智能物流侧重运输仓储调度。故选 D。$q$, NULL, 'keep'),(355942, $q$区块链将数据分块链式连接、多节点共同记账，任何篡改都会破坏哈希链并被其他节点发现，从而保证区块数据的完整和不可篡改，这正是它作为信任工具的基础；安全、有效、一致虽相关，但非强调的核心。故选 B。$q$, NULL, 'keep'),(357374, $q$V 表示逻辑或，^ 在此表示逻辑与。先算 01010011∨00110110=01110111，再与 01011100 按位相与，得 01010100，与 C 项一致；若把括号内结果取反会得 10001000，即干扰项 B。故选 C。$q$, NULL, 'keep'),(357384, NULL, NULL, 'manual'),(357395, $q$QR 码即快速响应矩阵码，由日本电装公司（Denso Wave）的原昌宏等人于 1994 年研制成功，属矩阵式二维条码；中国、美国、欧洲虽各有条码标准，但 QR Code 的发源地是日本。故选 A。$q$, NULL, 'keep'),(357397, $q$电磁波按波长分段命名：米波、分米波、厘米波分别对应米级、分米级和厘米级波长，而 1~10 毫米即毫米波，其对应频率恰为 30~300GHz，与题干给出的区间完全吻合。故选 C。$q$, NULL, 'keep'),(357478, $q$逻辑与运算按位进行，只有对应位同为 1 结果才为 1。11001010 与 00001001 逐位相与，仅第 5 位两者都是 1，其余位至少有一个为 0，结果为 00001000；D 项 11001011 是逻辑或的结果。故选 A。$q$, NULL, 'keep'),(357692, $q$按位作逻辑与：11001010 与 10001001 仅第 1 位、第 5 位同时为 1，其余位均不全为 1，结果为 10001000；若误作逻辑或会得到 11001011，即 D 项，C 项 00001001 则是照抄第二个运算数。故选 A。$q$, NULL, 'keep'),(357698, $q$机器数把符号位也数值化，通常约定最高位为符号位，0 表示正数、1 表示负数，而不是用 +、- 号或 T、F 表示，C 项的顺序恰好相反。故选 B。$q$, NULL, 'keep'),(357707, $q$常用的基本逻辑运算有三种：逻辑加（或）、逻辑乘（与）和逻辑否定（非）。异或运算可由与、或、非组合而成，属于导出运算，通常不列入基本逻辑运算。故选 D。$q$, NULL, 'keep'),(357763, $q$IPv4 地址由 32 位二进制数组成，按每 8 位为一个字节计算，共 32÷8=4 个字节，通常写成点分十进制形式；16 个字节对应的是 128 位的 IPv6 地址。故选 C。$q$, NULL, 'keep'),(357811, NULL, NULL, 'manual'),(357855, NULL, NULL, 'manual'),(357976, $q$按位逻辑与要求对应位同为 1 时结果才为 1。11001010 与 00001001 只有末位同时为 1，其余位均为 0，故结果为 00001000。B 项 00001001 直接照抄第二个操作数，是未做运算的干扰项。故选 A。$q$, NULL, 'keep'),(358011, $q$题干指明为逻辑与运算，逐位相与时只有末位同时为 1，结果应为 00001000。D 项 11001011 是两数按位逻辑或的结果，属于把与当作或的典型误算，为关键干扰项。故选 A。$q$, NULL, 'keep'),(358128, $q$阶码首字节 11111110 最高位为 1，表示阶码为负；尾数首字节 11010000 最高位也为 1，表示尾数为负。二者皆负，故 B 正确。C 项只判对阶码而误判尾数符号，是本题关键干扰项。故选 B。$q$, NULL, 'keep')
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
  IF n <> 22 THEN RAISE EXCEPTION '第 8 批写入数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 3 THEN RAISE EXCEPTION '第 8 批人工数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 8 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
