-- 判断题第 5 批（25 道：21 keep + 1 change + 3 unresolved）
BEGIN;
CREATE TEMP TABLE judge_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO judge_expected (id, analysis, correct, stem, action) VALUES
(356933, $q$B超探头是超声换能器，能把电信号转换为超声波并接收回波转回电信号，本质上就是一种传感器。$q$, NULL, NULL, 'keep'),(356935, $q$微信小程序使用 WXML、WXSS 和 JavaScript 组成自有框架开发，不能直接用 HTML5 页面开发小程序。$q$, NULL, NULL, 'keep'),(358445, $q$千兆和万兆以太网通常以交换机为中心连接各站点，逻辑上构成星型拓扑结构。$q$, NULL, NULL, 'keep'),(359524, $q$2016年8月我国发射的世界首颗量子科学实验卫星名为“墨子号”，不是“量子号”，题干卫星名称有误。$q$, NULL, NULL, 'keep'),(359846, $q$Excel 中合并单元格后仍可被公式引用，引用结果取合并区域左上角单元格的值，因此“不可以引用”说法错误。$q$, NULL, NULL, 'keep'),(359973, $q$UCS/Unicode 是国际统一字符编码，与 GB2312-80、GBK、GB18030 等国标编码属于不同编码体系，不能认为彼此都兼容。$q$, NULL, NULL, 'keep'),(360941, $q$量化把连续幅值映射为有限个离散值，无法完全还原原始信号，属于有损压缩编码，必然造成信息损失。$q$, NULL, NULL, 'keep'),(361003, $q$软件厂商的许可协议通常包含免责条款，一般不对软件的正确性、精确性、可靠性和通用性作出承诺。$q$, NULL, NULL, 'keep'),(361016, $q$多任务处理依靠处理器管理，把CPU时间划分为时间片轮流分配给多个程序执行，正是题干所述原理。$q$, NULL, NULL, 'keep'),(361326, NULL, NULL, NULL, 'unresolved'),(362764, $q$分组交换机是带多个端口的专用通信设备，采用存储转发方式工作，每个端口设置缓冲区暂存等待发送的数据包，说法正确。$q$, NULL, NULL, 'keep'),(363378, NULL, NULL, NULL, 'unresolved'),(363698, $q$传输前在通信双方之间建立固定物理链路是电路交换的特点；分组交换采用存储转发、逐段占用链路，无需预先建立专用物理链路。$q$, NULL, NULL, 'keep'),(364570, $q$Windows 文件名禁用的字符包括斜杠、冒号、星号、问号、双引号、尖括号和竖线，分号不在禁用之列，因此“;.TXT”可以作为文件名。$q$, NULL, NULL, 'keep'),(365406, $q$优盘虽为即插即用设备，但操作系统仍需通过驱动程序才能识别并进行数据读写，Windows 通常会自动安装该驱动，自动安装同样属于安装，故说法成立。$q$, NULL, NULL, 'keep'),(365711, $q$图像数字化的一般步骤为扫描（划分网格得到取样点）、分色（仅彩色图像需要）、取样（测量各分量亮度值）和量化（A/D 转换），题干描述与之一致。$q$, NULL, NULL, 'keep'),(365712, $q$E-R 模型中实体集之间的联系按语义分为一对一、一对多和多对多三类，表述正确。$q$, NULL, NULL, 'keep'),(366479, $q$题干代码中的路径 e:/img/kaka.jpg 是绝对路径（OCR 把 e:/ 误识成 6 /），不是相对路径；相对路径才会随网页所在位置变化。因此题干把绝对路径说成相对路径，说法错误，选 B。$q$, 'B', $q$某个网页中有 HTML 代码段:<img src="e:/img/kaka.jpg">功能是插入一张图片，其中对图片文件的引用采用了相对路径，网站中采用这种方法很容易引起文件路径错误，导致图片显示失败。$q$, 'change_answer'),(366480, NULL, NULL, NULL, 'unresolved'),(366725, $q$Windows 10 任务栏默认固定有“文件资源管理器”的文件夹图标，点击即可启动文件资源管理器，说法正确。$q$, NULL, NULL, 'keep'),(373592, $q$MySQL 中 USE 数据库名 的作用就是把当前工作数据库切换为指定数据库，实现数据库之间的跳转。$q$, NULL, NULL, 'keep'),(375158, $q$用例图描述系统功能与外部参与者的交互，主要用于需求分析阶段，而不是设计阶段，故整句判断为错。$q$, NULL, NULL, 'keep'),(375187, $q$班级一端的多重性表示一个学生能对应的班级数量，题意限定每个学生只能属于一个班级，所以班级端应为 1；1..* 应标在学生一端。$q$, NULL, NULL, 'keep'),(376701, $q$生成 .tar.gz 应使用 z 选项（gzip），而题中命令用 j 选项得到的是 .tar.bz2；命令本身也应为 tar zcvf /root/file.tar.gz /etc/passwd。$q$, NULL, NULL, 'keep'),(376747, $q$fdisk -l 列出的是磁盘及分区信息，未挂载的分区也会显示；查看已挂载的存储设备应使用 df -h 或 mount 命令。$q$, NULL, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    stem = coalesce(e.stem, q.stem),
    qc_grade = 'good',
    answer_check = 'match'
FROM judge_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM judge_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.stem IS NULL OR q.stem = e.stem);
  IF n <> 22 THEN RAISE EXCEPTION '第 5 批写入数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 3 THEN RAISE EXCEPTION '第 5 批保留数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '第 5 批改答案数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN judge_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
