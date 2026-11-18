-- P2 第 31 批（25 道；html=23 colon=0 prefix=2）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(377983, NULL, NULL, $q$当演示文稿按自动放映方式播放时，按 Esc 键可以终止播放。$q$),(377984, NULL, NULL, $q$如果不进行设置，系统放映幻灯片时默认全部播放。$q$),(378136, $q${"A": "选择\"本地用户和组”，右侧右击要删除的帐户选择\"删除", "B": "选择\"本地用户和组\"，右侧右击要删除的帐户选择\"删除数据和帐户\"", "C": "选择\"本地用户和组\"，右侧右击要删除的帐户选择\"删除帐户\"", "D": "选择\"本地用户和组”，右侧右击要删除的帐户选择\"清除帐户\""}$q$, NULL, NULL),(378234, $q${"A": "<Alt>+s", "B": "<Shift>+s", "C": "<Ctrl>+s", "D": "<Ctrl>+<Shift>+s"}$q$, NULL, NULL),(378252, $q${"A": "双击", "B": "单击", "C": "<SHIFT>+单击", "D": "<ALT>+单击"}$q$, NULL, NULL),(378253, $q${"A": "<ESC>", "B": "<ALT>", "C": "<SHIFT>", "D": "<CTRL>+A"}$q$, NULL, NULL),(378254, $q${"A": "<CTRL>+A", "B": "<CTRL>+V", "C": "<CTRL>+B", "D": "<CTRL>+X"}$q$, NULL, NULL),(378255, $q${"A": "<ALT>+<ENTER>", "B": "<ESC>", "C": "<ESC>+<ALT>", "D": "<CTRL>+A"}$q$, NULL, NULL),(378257, $q${"A": "<ESC>", "B": "<ALT>", "C": "<SHIFT>", "D": "<CTRL>"}$q$, NULL, NULL),(378260, $q${"A": "<ESC>", "B": "<ALT>", "C": "<SHIFT>", "D": "<CTRL>"}$q$, NULL, NULL),(378270, $q${"A": "<CTRL>+~", "B": "<CTRL>+V", "C": "<CTRL>+B", "D": "<CTRL>+X"}$q$, NULL, NULL),(378408, $q${"A": "HTML 格式", "B": "Microsoft Excel 工作簿", "C": "Microsoft Excel 5.0/95 工作簿", "D": "Microsoft Excel 97&95 工作簿"}$q$, NULL, NULL),(378414, $q${"A": "执行\"文件→关闭\"菜单命令", "B": "执行\"文件→退出\"菜单命令", "C": "单击标题栏左端 Excel 窗口的控制菜单按钮，选择\"关闭\"命令", "D": "按快捷键[Alt]+[F4]"}$q$, NULL, NULL),(378448, $q${"A": "执行\"插入→文件\"菜单命令，在对话框的\"文件名\"输入框中选择需要打开的工作簿，单击[确定]按钮", "B": "执行\"插入→文件\"菜单命令，在对话框的\"文件名\"输入框中选择需要打开的工作簿，单击[取消]按钮", "C": "执行\"文件→打开\"菜单命令，在\"打开\"对话框的\"文件名\"输入框中选择需要打开的工作簿，单击[取消]按钮", "D": "执行\"文件→打开\"菜单命令，在\"打开\"对话框的\"文件名\"输入框中选择需要打开的工作簿，单击[打开]按钮"}$q$, NULL, NULL),(378449, $q${"A": "新建一个工作簿窗口，原来显示的工作簿被关闭", "B": "新建一个工作簿窗口，原来显示的工作簿仍处于打开状态且仍为当前工作簿", "C": "新建一个工作簿窗口并成为当前工作簿，原来显示的工作簿仍处于打开状态", "D": "新建一个工作簿窗口且与原来的工作窗口以\"水平并排方式\"排列在窗口工作区中"}$q$, NULL, NULL),(378451, $q${"A": "左单击\"文件\"菜单，选重命名", "B": "左单击\"编辑\"菜单，选重命名", "C": "左单击\"格式\"，选\"工作表\"，选重命名", "D": "A、B、C 均错"}$q$, NULL, NULL),(378452, $q${"A": "执行\"插入→名称→指定\"菜单命令，在其对话框", "B": "执行\"插入→名称→定义\"菜单命令，在其对话框", "C": "双击选中的工作表标签，在\"工作表\"名称框中", "D": "单击选中的工作表标签，在\"重新命名工作表\"对话框"}$q$, NULL, NULL),(378455, $q${"A": "执行\"编辑→剪切\"菜单命令，再执行\"编辑→粘贴\"菜单命令", "B": "执行\"编辑→复制\"菜单命令，再执行\"编辑→粘贴\"菜单命令", "C": "执行\"编辑→移动或复制工作表\"菜单命令，在其对话框中选定移动位置后，单击\"建立副本\"复选框，再单击[确定]按钮", "D": "执行\"编辑→移动或复制工作表\"菜单命令，在其对话框中选定移动位置后，单击[确定]按钮"}$q$, NULL, NULL),(378457, $q${"A": "执行\"编辑→复制→选择性粘贴\"菜单命令，在其对话框中选定粘贴内容后单击[确定]按钮", "B": "执行\"编辑→移动或复制工作表\"菜单命令，在对话框中选定复制位置后，单击\"建立副本\"复选框，再单击[确定]按钮", "C": "执行\"编辑→移动或复制工作表\"菜单命令，在对话框中选定复制位置后，再单击[确定]按钮", "D": "执行\"编辑→复制→粘贴\"菜单命令"}$q$, NULL, NULL),(378459, $q${"A": "选中当前工作表中的任意单元格，从\"编辑\"菜单中选\"删除工作表\"菜单项", "B": "右击任意单元格，从弹出菜单中选\"删除\"", "C": "选中当前整个工作表，再单击工具栏中的\"剪切\"按钮", "D": "选中任意单元格，再从\"编辑\"菜单中选\"删除\""}$q$, NULL, NULL),(378464, $q${"A": "选定该行；执行\"编辑\"菜单中的\"删除\"命令", "B": "选定该行；执行\"编辑\"菜单中的\"剪切\"命令", "C": "选定该行；执行\"编辑\"菜单中的\"清除\"命令", "D": "选定该行；执行键盘中的\"Delete\"命令"}$q$, NULL, NULL),(378465, $q${"A": "选定该列；执行\"编辑\"菜单中的\"删除\"命令", "B": "选定该列；执行\"编辑\"菜单中的\"剪切\"命令", "C": "选定该列；执行\"编辑\"菜单中的\"清除\"命令", "D": "选定该列；执行键盘中的\"Delete\"命令"}$q$, NULL, NULL),(378466, $q${"A": "单击列标以选中某一列，再右击该列的任意单元格，选\"删除\"", "B": "右击工作表标签条，选\"删除\"", "C": "右击任意单元格，从弹出菜单中选\"删除\"，再选\"整列\"", "D": "选中任意单元格，从\"编辑\"菜单中选\"删除\"，再选\"整列\""}$q$, NULL, NULL),(378468, $q${"A": "插入空单元格，在\"插入\"菜单上，单击\"单元格\"命令，在随后出现的对话框中，单击\"活动单元格右移\"或\"活动单元格下移\"选项", "B": "插入行在\"插入\"菜单上，单击\"行\"命令", "C": "插入列在\"插入\"菜单上，单击\"列\"命令", "D": "删除行或列，先选中要删除的行或列，按 DEL 键"}$q$, NULL, NULL),(378498, $q${"A": "=\"20，12\"", "B": "=20，12", "C": "20，12", "D": "=SHEET2!A1+12"}$q$, NULL, NULL)
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
  IF n <> 23 THEN RAISE EXCEPTION '第 31 批 HTML 更新数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 31 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 2 THEN RAISE EXCEPTION '第 31 批前缀修复数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 31 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 31 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
