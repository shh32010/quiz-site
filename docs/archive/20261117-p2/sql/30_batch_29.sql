-- P2 第 29 批（25 道；html=22 colon=2 prefix=1）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(375641, NULL, $q$B 是类 B 的匿名对象。$q$, NULL),(375699, $q${"A": "SELECT * FROM ORDER WHERE order_price BETWEEN 1000 AND 5000 ORDER BY order_price e ASC", "B": "SELECT * FROM ORDER WHERE order_price BETWEEN 1000 AND 5000 ORDER BY order_price DESC", "C": "SEICT * FROM ORDER WHERE 1000< order_price <5000 ORDER BY order_price ASC", "D": "SELECT * FROM ORDER WHERE 1000< order_price <5000 ORDER BY order_price DESC"}$q$, NULL, NULL),(375707, $q${"A": "用例图是指由参与者（Actor）、用例（Use Case），边界以及它们之间的关系构成的用于描述系统功能的视图。<br/>-", "B": "在构建用例图时，常用的方式是先识别参与者，然后确定用例以及用例之间的关系。", "C": "只有发起或触发用例的人称为参与者。<br/>-", "D": "用例图在高层交流了系统必须处理的业务事件的范围，是描述系统与其他外部系统以及用户之间交互的图形。<br/><br/>我的答案:C 正确答案:C"}$q$, NULL, NULL),(375755, $q${"A": "---<<<incluce>>->", "B": "$\\xrightarrow{\\text{---}}$", "C": "$\\triangle$", "D": "----→"}$q$, NULL, NULL),(375770, $q${"A": "泛化=实现>组合>聚合>依赖>关联", "B": "泛化>实现>组合>聚合>关联>依赖", "C": "泛化=实现>组合>聚合>关联>依赖", "D": "泛化>实现>聚合>组合>关联>依赖"}$q$, NULL, NULL),(375870, $q${"A": "ping 66.21.234.95", "B": "ping 192.168.1.254", "C": "ping 66.21.234.98", "D": "ping 127.0.0.1<br/><br/>| 名称 | Vlan | 网关 | 子网掩码 | 交换机端口 |<br/>| --- | --- | --- | --- | --- |<br/>| PC1~PC6 | Vlan 2 | 192.168.1.254 | 255.255.255.0 | Switch2 (2~7) |<br/>| PC7~PC40 | Vlan 3 | 192.168.2.254 | 255.255.255.0 | Switch2 (8~24)Switch3 (2~24) |<br/>| PC41~PC60 | Vlan 4 | 192.168.3.254 | 255.255.255.0 | Switch4 (2~24) |<br/><br/><br/><br/>This diagram illustrates a network architecture or data flow system involving multiple servers (T0, T3, T7) connected via modules and interfaces, with associated modules labeled as 'mitA1' and 'mitA2'."}$q$, NULL, NULL),(375891, NULL, NULL, $q$由于总线作为公共传输介质被多个连接在上面的节点共享，因此在工作过程中可能出现“冲突”问题。$q$),(375911, NULL, $q$随着技术的进一步成熟，有实力的大公司会同时提供 laaS 与 PaaS，如阿里巴巴、腾讯、华为 、浪潮、中国电信、中国移动等。$q$, NULL),(375984, $q${"A": "右击\"我的电脑\"，从菜单选择", "B": "左击驱动器名，从菜单选择", "C": "单击\"开始\"按钮，从\"程序\"菜单选择", "D": "右击\"开始\"按钮，从菜单选择"}$q$, NULL, NULL),(375985, $q${"A": "在\"资源管理器\"窗口中，单击\"文件\"菜单中的\"新建\"子菜单中的\"文件夹\"命令", "B": "在 Word 程序窗口中，单击\"文件\"菜单中的\"新建\"命令", "C": "右击资源管理器的\"文件夹内容\"窗口的任意空白处，选择快捷菜单中的\"新建\"子菜单中的\"文件夹\"命令", "D": "在\"我的电脑\"的某驱动器或用户文件夹窗口中，单击\"文件\"菜单中的\"新建\"子菜单中的\"文件夹\"命令"}$q$, NULL, NULL),(376133, $q${"A": "用户账户的头像不能随便设置", "B": "创建好的新的账户有默认头像的。", "C": "在创建一个新的用户账户时，系统提供设置头像的选项。", "D": "创建好的账户，是没有头像的，可以通过【设置】 -> 【账户】 -> 【你的账户】 -> 【浏览】按钮进行设置。"}$q$, NULL, NULL),(376175, $q${"A": "通过双击桌面上应用程序快捷图标，可启动该应用程序", "B": "在\"资源管理器\"中，双击应用程序名即可运行该应用程序", "C": "只需选中该应用程序图标，然后右击即可启动该应用程序", "D": "从\"开始\"中打开\"所有程序\"菜单，选择应用程序项，即可运行该应用程序"}$q$, NULL, NULL),(376180, $q${"A": "在创建一个新的用户账户时，系统并未提供设置头像的选项，因此需要在创建好账户以后再设置账户的头像", "B": "用户账户的名称不能完全由句点或空格组成，而且不能包含以下任何一个字符:\\/“[]:|<>+=；,?*@", "C": "修改用户账户的名称可由任何用户完成", "D": "用户可以将标准用户更改为管理员用户，也可以将管理员用户更改为标准用户，但前提是系统中必须至少有两个管理员用户，才能将其中一个更改为标准用户。"}$q$, NULL, NULL),(376250, $q${"A": "按<Capslock>键", "B": "按<Ctrl>+圆点符", "C": "按<Shift>+空格键", "D": "按<Ctrl>+空格键"}$q$, NULL, NULL),(376591, $q${"A": "ssh", "B": "用户名", "C": "&", "D": "IP"}$q$, NULL, NULL),(376808, $q${"A": "cp f1.txt | f2.txt", "B": "cat f1.txt | f2.txt", "C": "cat f1.txt > f2.txt", "D": "copy f1.txt | f2.txt"}$q$, NULL, NULL),(376840, $q${"A": "ls *.txt", "B": "ls -d .txt", "C": "find -name \"*.txt\"", "D": "find.\"txt\""}$q$, NULL, NULL),(376906, $q${"A": "<Capslock>键与<Alt>+<Del>键组合可以实现计算机热启动", "B": "当<CapsLock>指示灯亮着的时候，按主键盘的数字键，可输入其上部的特殊字符", "C": "当<CapsLock>指示灯亮着的时候，按字母键，可输入大写字母", "D": "<CapsLock>键的功能可由用户自定义"}$q$, NULL, NULL),(376910, $q${"A": "Excel->WPS->Photoshop->Word2000", "B": "SPSS->Firework->Foxmail->Word2000", "C": "SPSS->Foxmail->Photoshop->Word2000", "D": "Photoshop->Word2000->SPSS->FOxmail"}$q$, NULL, NULL),(376923, $q${"A": "按<Capslock>键", "B": "按<Ctrl>+圆点符", "C": "按<Shift>+空格键", "D": "按<Ctrl>+空格键"}$q$, NULL, NULL),(376975, $q${"A": "cd @John", "B": "cd #John", "C": "cd &John", "D": "cd ~John"}$q$, NULL, NULL),(376999, $q${"A": "<a>;", "B": "<o>;", "C": "<I>;", "D": "A"}$q$, NULL, NULL),(377020, $q${"A": "<O>", "B": "<o>", "C": "<i>", "D": "a"}$q$, NULL, NULL),(377088, $q${"A": "cp f1.txt | f2.txt", "B": "cat f1.txt | f2.txt", "C": "cat f1.txt > f2.txt", "D": "copy f1.txt | f2.txt"}$q$, NULL, NULL),(377168, $q${"A": "IPV6INIT=\"no\"", "B": "IPV6INIT=\"yes\"", "C": "ipv6INIT=\"yes\"", "D": "ipv6init=\"yes\""}$q$, NULL, NULL)
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
  IF n <> 22 THEN RAISE EXCEPTION '第 29 批 HTML 更新数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 2 THEN RAISE EXCEPTION '第 29 批解析去冒号数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 1 THEN RAISE EXCEPTION '第 29 批前缀修复数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 29 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 29 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
