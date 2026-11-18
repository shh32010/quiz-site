-- 填空第 4 批（25 道：20 keep + 1 change + 4 unresolved）
BEGIN;
CREATE TEMP TABLE fill_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO fill_expected (id, analysis, correct, action) VALUES
(361943, $q$255.255.255.192 中最后一个字节 192=11000000，网络位共 8×3+2=26 位，故可写为 /26，其二进制形式为 11111111.11111111.11111111.11000000。$q$, NULL, 'keep'),(363075, $q$GNU 是英文短语 GNU's Not Unix 的递归缩写，意思即“GNU 不是 UNIX”，属于自由软件基金会项目的命名由来。$q$, 'GNU''s Not Unix', 'change_answer'),(363211, $q$电子邮件由邮件客户端与邮件服务器协同完成收发，采用客户机/服务器模式，即题干中的 C/S 模式。$q$, NULL, 'keep'),(363237, $q$ASCII 是 American Standard Code for Information Interchange 的缩写，中文译为美国信息交换标准代码。$q$, NULL, 'keep'),(363256, $q$评价图像压缩编码通常考察三个方面：压缩比（压缩程度）、重建图像的质量、压缩算法的复杂程度；题干已列出②③，第一项即压缩比。$q$, NULL, 'keep'),(363920, $q$设该进制为 r，则“20”对应十进制 2r，由 4×6=24 得 2r=24，故 r=12。5×7=35=2×12+11，在十二进制中写作 2B。$q$, NULL, 'keep'),(364412, $q$模拟电视机要接收数字电视信号，需外接机顶盒完成信号转换，空后已有“盒”字，故填“机顶”。$q$, NULL, 'keep'),(364455, NULL, NULL, 'unresolved'),(366945, $q$该描述强调用户可共享、可随意拷贝修改源代码并允许销售和自由传播，这正是自由软件的定义。$q$, NULL, 'keep'),(367204, $q$目前广泛使用的移动存储器主要是闪存盘（U盘）和移动硬盘两类。$q$, NULL, 'keep'),(367839, $q$Windows 的“程序和功能”列表中选中程序后，可单击“卸载”“更改”或“修复”来删除或修改程序，空处对应删除操作。$q$, NULL, 'keep'),(368523, NULL, NULL, 'unresolved'),(369474, $q$图像占 200×150=30000 个像素，屏幕为 800×600=480000 个像素，占比 30000/480000=1/16，即 6.25%。$q$, NULL, 'keep'),(369975, NULL, NULL, 'unresolved'),(370940, $q$SOA 的典型定义是一种粗粒度、松耦合的服务架构，服务之间通过简单、精确定义的接口通信，不涉及底层编程接口和通信模型。$q$, NULL, 'keep'),(375976, $q$先单击选中一个文件，再按住 Ctrl 键逐个单击另外 4 个文件属于追加选择，共选中 1+4=5 个文件。$q$, NULL, 'keep'),(379235, $q$Linux 采用设备文件方式管理硬件，所有设备文件集中存放在根目录下的 /dev 目录中。$q$, NULL, 'keep'),(384522, NULL, NULL, 'unresolved'),(388617, $q$优盘、扫描仪、数码相机等外设普遍采用 USB（通用串行总线）接口与计算机连接，支持热插拔。$q$, NULL, 'keep'),(389011, $q$尼克劳斯·沃思的著名论断是“计算机科学就是研究算法的学问”，强调算法是计算机科学的核心。$q$, NULL, 'keep'),(389233, $q$分组交换机的基本工作模式是存储转发：先完整接收分组并检查，再根据转发表将其转发到相应端口。$q$, NULL, 'keep'),(389343, $q$选中 A1(4)、A2(7) 后拖动填充柄，Excel 按等差序列（步长 3）填充，A3 为 10、A4 为 13。$q$, NULL, 'keep'),(389345, $q$PowerPoint 2003 中设置换页效果需执行“幻灯片放映”菜单下的“幻灯片切换”命令，在任务窗格中选择切换效果。$q$, NULL, 'keep'),(389433, $q$验证码用于区分人和机器程序，可防止批量注册和反复尝试密码等自动化攻击。$q$, NULL, 'keep'),(389438, $q$并运算结果最少为两关系中较大者 15 个元组（S 完全被 R 包含），最多为两者之和 15+10=25 个元组（无重复）。$q$, NULL, 'keep')
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
  IF n <> 21 THEN RAISE EXCEPTION '第 4 批写入数应为 21，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 4 THEN RAISE EXCEPTION '第 4 批保留数应为 4，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '第 4 批改答案数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN fill_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
