-- P2 第 33 批（25 道；html=21 colon=4 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(380974, $q${"A": "SELECT XM, SA FROM STUD FORSA<20", "B": "SELECT XM, SA FROM STUD WHERE NOTSA>=20", "C": "SELECT XM, SA ON STUD FOR SA", "D": "$^{20}$ SELECT XM, SA ON STUD WHERESA<20"}$q$, NULL, NULL),(380997, NULL, $q$供应链的核心就是物品的仓储和运输，即物流活动与之有紧密联系。$q$, NULL),(381033, $q${"A": "HTML5 标准还在制定中", "B": "HTML5 兼容以前 HTML4 下浏览器", "C": "<canvas>标签替代 Flash"}$q$, NULL, NULL),(381052, NULL, $q$1PB=1024TB

| GB(吉字节) | 1GB=1024MB |
| --- | --- |
| TB(太字节) | 1TB=1024GB |
| PB(拍字节) | 1PB=1024TB |
| ER(艾字节) | 1EB=1024PB |$q$, NULL),(381132, NULL, $q$大数据技术，是指指伴随着大数据的采集、存储、分析和应用的相关技术，是一系列使用非传统的工具来对海量的结构化、半结构化和非结构化数据进行处理，从而获得分析和预测结果的一系列数据处理和分析技术。$q$, NULL),(381138, $q${"A": "人类的生活正在被大数据预测深刻改变", "B": "预测性分析是大数据最核心的功能", "C": "分析从\"面向已经发生的过去\"转向\"面向即将发生的未来\"是大数据与传统数据的最大区别", "D": "大数据预测则是基于大数据和预测模型去预测过去某件事情的概率"}$q$, NULL, NULL),(381197, $q${"A": "<Ctrl> + 拖动", "B": "<Shift> + 拖动", "C": "直接拖动", "D": "<Alt> + 拖动"}$q$, NULL, NULL),(381926, $q${"A": "INSERT INTO user VALUES(张强,男， 25);", "B": "INSERT INTO user VALUES('张强','男'， 25);", "C": "INSERT user VALUES ('张强,男'， 25);", "D": "INSERT INTO user('张强','男'， 25);"}$q$, NULL, NULL),(381949, $q${"A": "SELECT sno, sname FROM student WHERE sname='_t%';", "B": "SELECT sno, sname FROM student WHERE sname LIKE '_t%';", "C": "SELECT sno, sname FROM student WHERE sname = '%t_‘;", "D": "SELECT sno, sname FROM student WHERE sname LIKE '%t_"}$q$, NULL, NULL),(381998, $q${"A": "SELECT 学号, AVG(成绩) AS 平均成绩 FROM Student GROUP BY 学号 HAVING COUNT(课程号)>3", "B": "SELECT 学号. AVG(成绩) AS 平均成绩 FROM Student GROUP BY 课程号 HAVING COUNT(课程号)>3", "C": "SELECT 学号. AVG(成绩) AS 平均成绩 FROM Student GROUP BY 学号 HAVING COUNT(课程号)>4", "D": "SELECT 学号, AVG(成绩) AS 平均成绩 FROM Student GROUP BY 课程号 HAVING COUNT(DISTINCT 学号)>3"}$q$, NULL, NULL),(382241, $q${"A": "搜索框输入“Windows 功能“之后，左键单击”启用或关闭 Windows 功能\"右键右单击“开始", "B": "石键石单击“开始菜单“后选择“应用和功能“，之后右则选择”程序和功能“，之后选择”启用或关闭Windows 功能", "C": "右键单击“开始菜单“后选择”设置“，之后查找设置框输入”Windows功能“，之后在查找结果中选择”启用或关闭 Windows 功能", "D": "左键单击“开始菜单”选择“启用或关闭 Windows 功能"}$q$, NULL, NULL),(382392, $q${"A": "移动至<编辑…>之后按回车，显示的界面中进行设置创建", "B": "移动到<添加>之后按回车，显示的界面进行设置创建", "C": "直接点击<添加>，显示的新连接界面进行设置创建", "D": "直接点击<编辑…>，显示的界面中进行设置创建"}$q$, NULL, NULL),(382446, $q${"A": "SELECT productid FROM orders WHERE count(productid)>5", "B": "SELECT productid FROM orders WHERE count(productid) ≥ -6", "C": "SELECT productid FROM orders WHERE having count(productid)>5 GROUP BY productid", "D": "SELECT productid FROM orders GROUP BY productid HAVING count(productid)>=5"}$q$, NULL, NULL),(382455, $q${"A": "DELETE user where id>5", "B": "DELETE FROM user set id>5", "C": "DELETE FROM user where id>5", "D": "DELETE user set id>5"}$q$, NULL, NULL),(382480, NULL, $q$q! 不保存退出。$q$, NULL),(382637, $q${"A": "<Ctrl>+<Shift>", "B": "<Shift>+<空格>", "C": "<Alt>+<Del>", "D": "<Ctrl>+<空格>"}$q$, NULL, NULL),(382647, $q${"A": "<Ctrl>+<Esc>", "B": "<Alt>+<Tab>", "C": "<Ctrl>+<F6>", "D": "<Shift>+<Esc>"}$q$, NULL, NULL),(382656, $q${"A": "按<Capslock>键", "B": "按<Ctrl>+圆点符", "C": "按<Shift>+空格键", "D": "按<Ctrl>+空格键"}$q$, NULL, NULL),(382659, $q${"A": "\"程序\"", "B": "\"启动\"", "C": "\"附件\"", "D": "\"游戏\""}$q$, NULL, NULL),(382660, $q${"A": "<ESC>", "B": "<ALT>", "C": "<ENTER>", "D": "<BACKSPACE>"}$q$, NULL, NULL),(382661, $q${"A": "<Alt>+<F4>", "B": "<Ctrl>+<F4>", "C": "<Shift>+<F4>", "D": "<Ctrl>+<Alt>+<F1>"}$q$, NULL, NULL),(382770, $q${"A": "RAM>CACHE>硬盘>软盘", "B": "CACHE>RAM>硬盘>软盘", "C": "CACHE>硬盘>RAM>软盘", "D": "RAM>硬盘>CACHE>软盘"}$q$, NULL, NULL),(382830, $q${"A": "Windows—>DBMS—>A", "B": "DBMS—>A—>Windows", "C": "A-->Windows-->DBMS", "D": "Windows—>A—>DBMS"}$q$, NULL, NULL),(383394, $q${"A": "目的演示文稿处于\"大纲\"视图下，源演示文稿处于\"幻灯片浏览\"视图下", "B": "源演示文稿和目的演示文稿都处于\"幻灯片浏览\"或\"大纲\"视图下", "C": "源演示文稿处于\"大纲\"视图下，目的演示文稿处于\"幻灯片浏览\"视图下", "D": "源演示文稿处于\"幻灯片\"视图下，目的演示文稿处于\"幻灯片浏览\"视图下"}$q$, NULL, NULL),(383395, $q${"A": "使用\"幻灯片浏览\"视图", "B": "使用\"大纲\"视图", "C": "使用\"幻灯片\"视图", "D": "使用\"备注页\"视图"}$q$, NULL, NULL)
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
  IF n <> 21 THEN RAISE EXCEPTION '第 33 批 HTML 更新数应为 21，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 4 THEN RAISE EXCEPTION '第 33 批解析去冒号数应为 4，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 33 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 33 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 33 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
