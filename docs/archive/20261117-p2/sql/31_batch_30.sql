-- P2 第 30 批（25 道；html=14 colon=0 prefix=11）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(377221, $q${"A": "设置用户的口令 -", "B": "显示用户的口令", "C": "显示当前目录的绝对路径<br/>•", "D": "查看当前目录的文件<br/><br/>我的答案:C 正确答案:C"}$q$, NULL, NULL),(377243, $q${"A": "启动 ISO 镜像文件，<br/><br/>选择安装\"Install Cent OS 7\"", "B": "语言、日期和时间、位置等信息选择", "C": "安全策略的选择", "D": "下载杀毒软件"}$q$, NULL, NULL),(377303, $q${"A": "yum install <packages>", "B": "yum install", "C": "yum setup <packages>", "D": "yum setup"}$q$, NULL, NULL),(377304, $q${"A": "yum delete <packages>", "B": "yum delete", "C": "yum remove <packages>", "D": "yum remove"}$q$, NULL, NULL),(377344, $q${"A": "\\$", "B": "#", "C": "%", "D": ">"}$q$, NULL, NULL),(377354, $q${"A": "按<Capslock>键", "B": "按<Ctrl>+圆点符", "C": "按<Shift>+空格键", "D": "按<Ctrl>+空格键"}$q$, NULL, NULL),(377457, $q${"A": "文字\"图表\"", "B": "Word 文档\"doc1\"", "C": "文件\"Book1\"", "D": "Word 文档当前页"}$q$, NULL, NULL),(377487, $q${"A": "<Ctrl>+<Esc>", "B": "<Alt>+<Tab>", "C": "<Ctrl>+<F6>", "D": "<Shift>+<Esc>"}$q$, NULL, NULL),(377493, $q${"A": "<Ctrl>+<Shift>", "B": "<Ctrl>+空格", "C": "<Alt>+F 功能键", "D": "<Shift>+F 功能键"}$q$, NULL, NULL),(377495, $q${"A": "\"文档\"", "B": "\"设置\"", "C": "\"运行\"", "D": "\"程序\""}$q$, NULL, NULL),(377496, $q${"A": "\"程序\"", "B": "\"启动\"", "C": "\"附件\"", "D": "\"游戏\""}$q$, NULL, NULL),(377497, $q${"A": "<ESC>", "B": "<ALT>", "C": "<ENTER>", "D": "<BACKSPACE>"}$q$, NULL, NULL),(377502, $q${"A": "<Alt>+<F4>", "B": "<Ctrl>+<F4>", "C": "<Shift>+<F4>", "D": "<Ctrl>+<Alt>+<F1>"}$q$, NULL, NULL),(377531, $q${"A": "<Tab>", "B": "空格", "C": "<shift>", "D": "<Esc>"}$q$, NULL, NULL),(377971, NULL, NULL, $q$在 PowerPoint 的窗口中，无法改变各个预留文本框的大小。$q$),(377972, NULL, NULL, $q$要想打开 PowerPoint，只能从[开始]菜单选择程序，然后点击 Microsoft PowerPoint。$q$),(377973, NULL, NULL, $q$PowerPoint 中除了用内容提示向导来创建新的幻灯片，就没有其它的方法了。$q$),(377974, NULL, NULL, $q$PowerPoint 中，文本框的大小和位置是确定的。$q$),(377975, NULL, NULL, $q$PowerPoint 中，当本次复制文本的操作成功之后，上一次复制的内容自动丢失。$q$),(377976, NULL, NULL, $q$PowerPoint 中，设置文本的字体时，文字的效果选项可以选也可以直接跳过。$q$),(377977, NULL, NULL, $q$PowerPoint 中，应用设计模板设计的演示文稿无法进行修改。$q$),(377978, NULL, NULL, $q$PowerPoint 中，如果插入图片误将不需要的图片插入进去，可以按撤销键补救。$q$),(377979, NULL, NULL, $q$幻灯片中不能设置页眉/页脚。$q$),(377980, NULL, NULL, $q$关闭幻灯片可以从“文件”菜单中关闭。$q$),(377981, NULL, NULL, $q$幻灯片中对象的效果可以自定义。$q$)
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
  IF n <> 14 THEN RAISE EXCEPTION '第 30 批 HTML 更新数应为 14，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 30 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 11 THEN RAISE EXCEPTION '第 30 批前缀修复数应为 11，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 30 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 30 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
