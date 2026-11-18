-- P2 第 18 批（25 道；html=22 colon=3 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(357386, NULL, $q$关系模型,用二维表结构表示实体集及实体集之间联系的数据模型。关系模型是目前在数据库管理系统中使用最为广泛的数据模型之一。$q$, NULL),(357391, NULL, $q$QR Code 是由日本于 1994 年 9 月研制的一种矩阵式二维条码。$q$, NULL),(357491, $q${"A": "“文件”菜单中的打印命令", "B": "同时按住<Alt>和(Print Screen)键", "C": "工具栏上的打印按钮", "D": "将光标移至指定页再按工具栏上的打印按钮"}$q$, NULL, NULL),(357502, $q${"A": "<Alt>+<PrintScreen>", "B": "<Ctrl> + <Pirntscreen>", "C": "<Ctrl +<Pirntscreen>", "D": "<Pirnt Screen>"}$q$, NULL, NULL),(357540, $q${"A": "<Esc>", "B": "<Shift>", "C": "<Ctrl>", "D": "<Alt>"}$q$, NULL, NULL),(357541, $q${"A": "<Alt>", "B": "<Ins>", "C": "<Ctrl>", "D": "<Shift>"}$q$, NULL, NULL),(357561, $q${"A": "[ ]", "B": "（）", "C": "\" \"", "D": "<>"}$q$, NULL, NULL),(357565, $q${"A": "\"", "B": "(", "C": "'", "D": "="}$q$, NULL, NULL),(357650, $q${"A": "2/5", "B": "=2/5", "C": "=\"2/5\"", "D": "\"2/5\""}$q$, NULL, NULL),(357657, $q${"A": "=\"3,7.5\"", "B": "3,7.5", "C": "=3,7.5", "D": "=Sheet1!B1+7.5"}$q$, NULL, NULL),(357658, $q${"A": "56<57", "B": "=56<57", "C": "TRUE", "D": "FALSE"}$q$, NULL, NULL),(357668, $q${"A": "<ALT>+<ENTER>", "B": "<ESC>", "C": "<ESC>+<ALT>", "D": "<CTRL>+A"}$q$, NULL, NULL),(357683, $q${"A": "只能利用自动版式建立含组织结构图的幻灯片", "B": "可以通过插入菜单的\"图片\"命令插入组织结构图", "C": "可以向组织结构图中输入文本", "D": "可以编辑组织结构图"}$q$, NULL, NULL),(357688, $q${"A": "可以首先放映演示文稿，进行相应的演示操作，同时记录幻灯片之间切换的时间间隔", "B": "要使用排练计时，请选择\"幻灯片放映\"菜单中的\"排练计时\"命令", "C": "系统以窗口方式播放", "D": "如果对当前幻灯片的播放时间不满意，可以单击\"重复\"按钮"}$q$, NULL, NULL),(357703, $q${"A": "<footer>", "B": "<head>", "C": "<body>", "D": "<html>"}$q$, NULL, NULL),(357728, $q${"A": "(101001) 2", "B": "(101001)<br/><br/>BCD", "C": "(52) 8", "D": "233H"}$q$, NULL, NULL),(357783, $q${"A": "全球定位系统", "B": "\"格洛纳斯\"系统", "C": "\"伽利略\"系统", "D": "\"北斗\"系统"}$q$, NULL, NULL),(357835, $q${"A": "= IF(B2≥60,\"及格\",\"不及格\")", "B": "= IF(B2 >= 60, 及格, 不及格)", "C": "= IF(B2 < 60, 不及格, 及格)", "D": "= IF(B2 < 60,\"不及格\",\"及格\")"}$q$, NULL, NULL),(357840, $q${"A": "| 平均成绩 |<br/>| --- |<br/>| >60,<75 |", "B": "| 平均成绩 | 平均成绩 |<br/>| --- | --- |<br/>| >60 | <75 |", "C": "| 平均成绩 |<br/>| --- |<br/>| >60 |<br/>| <75 |", "D": "| 平均成绩 | 平均成绩 |<br/>| --- | --- |<br/>| >60 | |<br/>| | <75 |"}$q$, NULL, NULL),(357855, NULL, $q$磁道的编号从 0 开始,0 磁道位于磁盘的最外圈,磁盘的表面由外向里分成许多同心圆,每个圆称为一个磁道,盘片上一般都有几千个磁道,数据就存储在这些磁道上。 则选项 A、B、C 正确,选项 D 错误。$q$, NULL),(358021, $q${"A": "项目符号可以是英文字母", "B": "项目符号可以改变格式", "C": "#、&不可以定义为项目符号", "D": "项目符号可以自动顺序生成"}$q$, NULL, NULL),(358180, $q${"A": "$\\langle Alt\\rangle+s$", "B": "$\\langle Shift\\rangle+s$", "C": "<Ctrl>+s", "D": "<Ctrl>+<Shift>+s"}$q$, NULL, NULL),(358213, $q${"A": "$\\langle ESC\\rangle$", "B": "<ALT>", "C": "<SHIFT>", "D": "<CTRL>"}$q$, NULL, NULL),(358216, $q${"A": "$$ +～", "B": "$\\langle CTRL\\rangle+V$", "C": "<CTRL>+B", "D": "$$ +X"}$q$, NULL, NULL),(358222, $q${"A": "$\\langle ESC\\rangle$", "B": "<ALT>", "C": "<SHIFT>", "D": "$$ +A"}$q$, NULL, NULL)
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
  IF n <> 22 THEN RAISE EXCEPTION '第 18 批 HTML 更新数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 3 THEN RAISE EXCEPTION '第 18 批解析去冒号数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 18 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 18 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 18 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
