-- 填空第 2 批（25 道：18 keep + 0 change + 7 unresolved）
BEGIN;
CREATE TEMP TABLE fill_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO fill_expected (id, analysis, correct, action) VALUES
(341599, $q$TCP/IP 体系结构分为应用层、传输层、网络互联（网际）层和网络接口层四层，题干所缺的一层即传输层。$q$, NULL, 'keep'),(341603, $q$计算机病毒的典型特征是破坏性、隐蔽性、传染性、潜伏性和可触发性（激发性），按题干列举顺序缺失的两项正是传染性与可触发性。$q$, NULL, 'keep'),(341607, NULL, NULL, 'unresolved'),(341615, $q$不同业务在移动性、安全性、时延、可靠性和计费上要求各异，5G 通过网络切片将物理网络划分为相互逻辑独立的虚拟子网络，引号处应填网络切片。$q$, NULL, 'keep'),(341618, $q$该句是对移动互联网应用领域分类中娱乐类应用的界定，即移动互联网向娱乐行业渗透形成的移动娱乐。$q$, NULL, 'keep'),(341626, $q$题干描述把服务器、存储、网络、计算能力等硬件资源封装成服务，按用户实际使用量计费，这正是基础设施即服务的定义。$q$, NULL, 'keep'),(341857, NULL, NULL, 'unresolved'),(345134, $q$MPEG-1 Audio Layer 3 的缩写即 MP3，它采用有损压缩，是使用最广泛的数字音频格式之一。$q$, NULL, 'keep'),(345196, $q$PowerPoint 的动作设置提供“单击鼠标”和“鼠标移过”两种触发事件，鼠标移过指指针经过对象时自动执行预设动作。$q$, NULL, 'keep'),(345318, $q$数码相机成像芯片主要有 CMOS 和 CCD 两类；芯片中像素数量越多，能记录的细节越多，拍摄的图像分辨率（清晰度）就越高。$q$, NULL, 'keep'),(347207, NULL, NULL, 'unresolved'),(347215, NULL, NULL, 'unresolved'),(347229, NULL, NULL, 'unresolved'),(347230, $q$SQL 的 BETWEEN…AND… 用于选取闭区间内的值，包含两端，因此 20～22 岁（含 20 和 22）写作 BETWEEN 20 AND 22。$q$, NULL, 'keep'),(347342, $q$专家系统以符号表示的知识为处理对象，核心处理过程是依据已有知识进行推理，从而得出结论或建议。$q$, NULL, 'keep'),(347447, NULL, NULL, 'unresolved'),(347608, $q$模拟视觉理解、直觉思维、悟性等人类感性思维，所借助的重要信息处理机制是人工神经网络。$q$, NULL, 'keep'),(347938, $q$计算机内部所有信息都以二进制数码形式表示，其基本单位是比特(bit)。$q$, NULL, 'keep'),(352573, $q$物联网的体系结构通常划分为感知层、网络层和应用层三个层次。$q$, NULL, 'keep'),(352575, $q$RFID 系统一般由电子标签和阅读器（读写器）两部分组成，故两个空依次填标签和阅读器。$q$, NULL, 'keep'),(352582, $q$农业物联网通过各种传感器实时采集农田环境和作物信息，并及时反馈给农户。$q$, NULL, 'keep'),(352583, $q$“又称移动电子政务”直接点明该概念，即移动政务，借助手机、PDA、无线网络等技术为公众提供政府服务。$q$, NULL, 'keep'),(353137, $q$毫米波穿透和绕射能力弱，在高楼林立的城区通过部署微基站（小基站）补盲覆盖，解决传输困难问题。$q$, NULL, 'keep'),(353141, $q$互联网金融是传统金融行业与移动互联网相结合而形成的新兴领域。$q$, NULL, 'keep'),(353148, NULL, NULL, 'unresolved')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM fill_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM fill_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 18 THEN RAISE EXCEPTION '第 2 批写入数应为 18，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 7 THEN RAISE EXCEPTION '第 2 批保留数应为 7，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN fill_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
