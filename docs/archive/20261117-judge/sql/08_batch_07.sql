-- 判断题第 7 批（25 道：25 keep + 0 change + 0 unresolved）
BEGIN;
CREATE TEMP TABLE judge_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO judge_expected (id, analysis, correct, stem, action) VALUES
(389350, $q$用户实际可用的内存容量指 RAM 的容量，ROM 中固化的是 BIOS 等系统程序，用户不能随意读写和使用，不计入可用内存。$q$, NULL, NULL, 'keep'),(389351, $q$软件是逻辑产品，质量难以度量，厂商通常只授予使用权而不对正确性、精确性、可靠性和通用性作承诺，用户需自行承担使用风险。$q$, NULL, NULL, 'keep'),(389352, $q$计算机中数据必须以一定形式表示和存储，数据表示直接影响算法设计和实现，算法与数据结构密切相关，二者不可分割。$q$, NULL, NULL, 'keep'),(389355, $q$数据安全不仅包括传输过程，还包括存储、处理和访问控制等环节，仅保证传输安全不能确保整体数据安全。$q$, NULL, NULL, 'keep'),(389358, $q$WHERE 子句按条件筛选行，执行的是选择操作；投影操作对应 SELECT 子句中选取列。$q$, NULL, NULL, 'keep'),(389359, $q$Windows 的文件关联是按扩展名建立的，设置 .DAT 与某程序关联后，双击任何 .DAT 文件都会用该程序打开。$q$, NULL, NULL, 'keep'),(389360, $q$滚动条滑块长度与可显示内容占全部内容的比例大致对应，滑块越短说明内容越多、可视部分占比越小。$q$, NULL, NULL, 'keep'),(389362, $q$Word 2003 的“页码格式”对话框中可设置起始页码，页码可以从任意数值开始，不限于 1。$q$, NULL, NULL, 'keep'),(389363, $q$Excel 2003 支持为单元格区域定义名称，在名称框中输入名称并回车即可快速选中对应区域。$q$, NULL, NULL, 'keep'),(389364, $q$填充柄填充时若内容匹配自定义序列，Excel 会按该序列循环递增填充，而不是简单复制。$q$, NULL, NULL, 'keep'),(389365, $q$PowerPoint 2003 可通过“文件→另存为”选择网页格式，把演示文稿保存为 HTML 网页，并非无法保存。$q$, NULL, NULL, 'keep'),(389447, $q$按教材对通信技术的分类，卫星导航定位属于卫星通信的典型应用，北斗导航系统借助卫星完成定位与导航，因此该说法成立。$q$, NULL, NULL, 'keep'),(389450, $q$用户实际可用的内存容量指可读写的 RAM 容量，ROM 中的内容用户一般不能直接使用，不能把两者相加。$q$, NULL, NULL, 'keep'),(389453, $q$现在大多数操作系统都具备网络通信功能，Linux、UNIX、Windows XP 等网络操作系统还提供授权日志、计费、安全等网络管理功能，说法正确。$q$, NULL, NULL, 'keep'),(389455, $q$Wi-Fi 采用 IEEE 802.11 系列协议，公共场合的无线局域网覆盖正是其典型应用，说法正确。$q$, NULL, NULL, 'keep'),(389462, $q$Word 2003 中字符间距改变的是字符之间的间隔，而保持字符高度不变、按比例改变宽度的是字符缩放，两者不是一回事。$q$, NULL, NULL, 'keep'),(389463, $q$在 Excel 2003 中为单元格定义名称后，原来的默认名称（如 A1）仍然有效，可在公式和地址中继续使用。$q$, NULL, NULL, 'keep'),(389464, $q$填充柄可依据自定义序列填充文本，只要该序列已存在，拖动填充时内容会按序列自动变化。$q$, NULL, NULL, 'keep'),(389547, $q$正整数的原码、反码、补码相同；负整数的补码需除符号位外取反加 1，与原码不同，说法正确。$q$, NULL, NULL, 'keep'),(389552, $q$升级版本可以修正错误、扩充功能并适应不断变化的环境，从而延长软件的生命周期，说法正确。$q$, NULL, NULL, 'keep'),(389554, $q$分组交换网以存储转发为基本工作方式，结点先把分组完整接收并暂存，再根据转发表选择合适链路转发出去。$q$, NULL, NULL, 'keep'),(389555, $q$优盘写保护开关会阻止对盘片的写入操作，病毒无法把自身写入该盘，从而有效保护优盘不被病毒感染。该说法成立。$q$, NULL, NULL, 'keep'),(389651, $q$固态硬盘由闪存等半导体存储芯片构成，无机械部件，属于外存储器，可用来替代笔记本电脑中的传统机械硬盘。$q$, NULL, NULL, 'keep'),(389655, $q$因特网采用的是分组交换方式，而不是电路交换。电路交换需要建立专用通路，适合语音等连续通信，不是因特网的工作方式。$q$, NULL, NULL, 'keep'),(389657, $q$UCS/Unicode 是国际通用的字符编码标准，并非我国制定。我国制定的汉字编码标准是 GB2312、GBK、GB18030 等。$q$, NULL, NULL, 'keep')
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
  IF n <> 25 THEN RAISE EXCEPTION '第 7 批写入数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 0 THEN RAISE EXCEPTION '第 7 批保留数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 7 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN judge_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 7 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
