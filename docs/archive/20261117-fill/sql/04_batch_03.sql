-- 填空第 3 批（25 道：18 keep + 1 change + 6 unresolved）
BEGIN;
CREATE TEMP TABLE fill_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO fill_expected (id, analysis, correct, action) VALUES
(353153, $q$毫米波绕射与穿透能力差，高楼密集环境下覆盖困难，通常通过密集部署微基站（小基站）来补充覆盖。$q$, NULL, 'keep'),(353445, $q$题干已给出“快速实现资源弹性扩缩、规模随业务负载动态变化”，这正是云计算弹性的含义。$q$, NULL, 'keep'),(353448, $q$虚拟化技术的典型特点概括为分区、隔离、封装和硬件独立四项，题干已列出前三项，故该空应填硬件独立。$q$, '硬件独立', 'change_answer'),(353450, $q$微软的云计算操作系统是 Windows Azure（后更名为 Microsoft Azure），属于公有云平台。$q$, NULL, 'keep'),(353451, $q$混合云部署时，非核心应用放在公有云以利用其弹性与成本优势，核心程序及敏感数据保留在私有云以保证安全可控。$q$, NULL, 'keep'),(353452, NULL, NULL, 'unresolved'),(353456, $q$公有云通过互联网向用户按需提供存储、计算等资源，用户可按需使用不同的云资源，与题干描述相符。$q$, NULL, 'keep'),(353459, NULL, NULL, 'unresolved'),(354275, $q$Hadoop 是用于处理海量数据的分布式技术平台，以集群方式完成数据的存储与运算分析，符合题干定义。$q$, NULL, 'keep'),(354276, $q$MapReduce 框架的核心步骤分为 Map（映射）和 Reduce（归约）两个部分。$q$, NULL, 'keep'),(354277, $q$题干描述的是自动检测、隔离故障节点并由新节点接管计算任务，以保证作业完成和数据可靠，这正是 MapReduce 的容错机制。$q$, NULL, 'keep'),(354851, NULL, NULL, 'unresolved'),(354964, $q$神经网络以神经元为基本计算单元，它接收前一层传来的输入，进行加权求和并经激活函数处理后输出。$q$, NULL, 'keep'),(354973, NULL, NULL, 'unresolved'),(356269, $q$现代计算机采用存储程序控制原理，即程序和数据一起存入存储器并由计算机自动按序执行；该思想由冯·诺依曼提出。题干括号内已给出对应提示。$q$, NULL, 'keep'),(356273, NULL, NULL, 'unresolved'),(356333, $q$每位教师只能属于一个部门，而一个部门可有多名教师，因此部门与教师之间是一对多联系；教师表中的部门编号引用部门表的主键部门编号，是外部关键字。$q$, NULL, 'keep'),(356334, $q$按入学年份=2017 选择，得到王红和李小两行，共 2 个元组；对“专业”和“入学年份”投影后，两行经济学 2018 因取值相同被合并，结果为统计学 2017、经济学 2018、会计学 2017，共 3 个元组。$q$, NULL, 'keep'),(356343, $q$用友新一代云 ERP 以云端多租户方式直接向用户提供应用软件，用户无需自行安装和维护，属于软件即服务（SaaS）模式。$q$, NULL, 'keep'),(356346, $q$按使用场景划分，网络爬虫通常分为面向全网的通用爬虫和面向特定主题或站点的聚焦爬虫两类。$q$, NULL, 'keep'),(356595, $q$B4 为相对引用，向下填充一行变为 B5；B$4、B$5、B$6 的行号被 $ 锁定不变，分母的三行合计保持不变。若原编辑栏公式带有括号（很可能在识别时丢失），则结果为 B5/(B$4+B$5+B$6)，两种写法体现的填充规律一致。$q$, NULL, 'keep'),(359095, $q$宽高比 16:10、水平分辨率 1280，则垂直分辨率为 1280×10/16=800；65536=2^16 种颜色即每像素 16 位。未压缩大小=1280×800×16 bit=16384000 bit=2048000 B≈2048 kB。$q$, NULL, 'keep'),(361043, $q$安防监控依靠摄像头等设备实时获取现场图像和信号，核心作用是采集（获取）信息，因此属于信息采集系统。$q$, NULL, 'keep'),(361054, $q$物联网体系结构分为感知层、网络层和应用层；北斗导航负责位置等原始数据的获取，处于最底层的感知层。$q$, NULL, 'keep'),(361394, NULL, NULL, 'unresolved')
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
  IF n <> 19 THEN RAISE EXCEPTION '第 3 批写入数应为 19，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 6 THEN RAISE EXCEPTION '第 3 批保留数应为 6，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '第 3 批改答案数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN fill_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
