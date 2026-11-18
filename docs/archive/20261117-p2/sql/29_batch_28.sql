-- P2 第 28 批（25 道；html=24 colon=0 prefix=1）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(374369, $q${"A": "SELECT type FROM titles WHERE type LIKE '%p' GROUP BY type", "B": "SEICT type FROM titles GROUP BY type HAVING type NOT LIKE 'P%'", "C": "SELECT type FROM titles'GROUP BY type HAVING type LIKE 'p%'", "D": "SELECT type FROM titles WHERE type LIKE 'p%' GROUP BY type"}$q$, NULL, NULL),(374373, $q${"A": "UPDATE grade SET score=score+5", "B": "UPDATE grade SET score=score+5 WHERE score>=55 OR score <=60", "C": "UPDATE grade SET score=score+5 WHERE score BETWEEN 55 AND 60", "D": "UPDATE grade SET score=score+5 WHERE score <=55 AND score >=60"}$q$, NULL, NULL),(374376, $q${"A": "SELECT * FROM product ON pname='智狐' OR pname='知乎'", "B": "SELECT * FROM product ON pname='智狐' AND pname='知乎'", "C": "SELECT * FROM product WHERE pname='智狐' OR pname='知乎'", "D": "SELECT * FROM product WHERE pname='智狐' AND pname='知乎'"}$q$, NULL, NULL),(374379, $q${"A": "插入数据正常", "B": "插入 A 列的值为 V", "C": "插入 B 列的值为空值", "D": "插入 C 列的值为 'NULL'"}$q$, NULL, NULL),(374380, $q${"A": "SELECT * FROM student WHERE COUNT(sid)>1", "B": "SELECT a. * FROM student a,student b WHERE a.sname=b.sname", "C": "SELECT * FROM student WHERE COUNT(sid)>1 GROUP BY sName", "D": "SELECT * FROM student GROUP BY sName HAVING COUNT(sid)>1"}$q$, NULL, NULL),(374391, $q${"A": "SELECT 商品名，单价，销售日期，销售数量 FROM 商品 JOIN 销售 WHERE (单价 BETWEEN 10 AND 50) AND 销售数量 >20 ORDER BY 单价 DESC", "B": "SELECT 商品名, 单价, 销售日期, 销售数量 FROM 商品 JOIN 销售 WHERE (单价 BETWEEN 10 AND 50) AND 销售数量 >20 ORDER BY 单价", "C": "SELECT 商品名, 单价, 销售日期, 销售数量 FROM 商品, 销售 WHERE (单价 BETWEEN 10 AND 50) AND 销售数量 $>20$ ON 商品. 商品号=销售. 商品号 ORDER BY 单价", "D": "SELECT 商品名, 单价, 销售日期, 销售数量 FROM 商品, 销售 WHERE (单价 BETWEEN 10 AND 50) AND 销售数量 $>20$ AND 商品. 商品号=销售. 商品号 ORDER BY 单价 DESC"}$q$, NULL, NULL),(374439, $q${"A": "UPDATE product SET level=level+1;", "B": "UPDATE product SET level=level+1 WHERE level<=5;", "C": "UPDATE product SET level+1 where level<5;", "D": "UPDATE product SET level=level+1 WHERE level<5;"}$q$, NULL, NULL),(374474, $q${"A": "SELECT MAX(成绩) FROM A GROUP BY 学科 HAVING MAX(成绩)>80;", "B": "SELECT 学科 FROM A GROUP BY 学科 HAVING 成绩>80:", "C": "SELECT 学科 FROM A GROUP BY 学科 HAVING MAX(成绩)>80;", "D": "SELECT 学科 FROM A GROUP BY 学科 WHERE MAX(成绩)>80;"}$q$, NULL, NULL),(374506, $q${"A": "SELECT studentName, sex, birthday<br/>FROM tb_student<br/>WHERE birthday >= '2000-01-01' AND birthday <= '2000 -12-31';", "B": "SELECT studentName, sex, birthday<br/>FROM tb_student<br/>WHERE birthday IN ('2000-01-01', '2000-12-31');", "C": "SELECT studentName, sex, birthday<br/>FROM tb_student<br/>WHERE birthday BETWEEN 2000-01-01 AND 2000-12-31;", "D": "SELECT studentName, sex, birthday<br/>FROM tb_student<br/>WHERE birthday > '2000-01-01';"}$q$, NULL, NULL),(374509, $q${"A": "SELECT COUNT(cid), cid FROM orders", "B": "SELECT COUNT(cid), cid FROM orders HAVING COUNT(cid)>0", "C": "SELECT COUNT(cid), cid FROM orders ORDER BY cid", "D": "SELECT COUNT(cid), cid FROM orders GROUP BY cid"}$q$, NULL, NULL),(374510, $q${"A": "SELECT type FROM titles WHERE type LIKE '%p' GROUP BY type", "B": "SELECT type FROM titles GROUP BY type HAVING type NOT LIKE 'P%'", "C": "SELECT type FROM titles GROUP BY type HAVING type LIKE 'p%'", "D": "SELECT type FROM titles WHERE type LIKE 'p%' GROUP BY type"}$q$, NULL, NULL),(374513, $q${"A": "UPDATE grade SET score=score+5", "B": "UPDATE grade SET score=score+5 WHERE score>=55 OR score <=60", "C": "UPDATE grade SET score=score+5 WHERE score BETWEEN 55 AND 60", "D": "UPDATE grade SET score=score+5 WHERE score <=55 AND score >=60"}$q$, NULL, NULL),(374517, $q${"A": "插入数据正常", "B": "插入 $A$ 列的值为 $V$", "C": "插入 B 列的值为空值", "D": "插入 C 列的值为'NULL'"}$q$, NULL, NULL),(374531, $q${"A": "WHERE hometown =!'南京';", "B": "WHERE hometown NOT '南京';", "C": "WHERE hometown IS NOT '南京';", "D": "WHERE hometown <> '南京'<br/><br/>答案解析:<br/><br/>!=或 <> 不等于"}$q$, NULL, NULL),(374539, $q${"A": "插入数据正常<br/>-", "B": "插入A列的值为V", "C": "插入B列的值为空值", "D": "插入C列的值为'NULL'<br/><br/>我的答案:C 正确答案:C"}$q$, NULL, NULL),(374540, $q${"A": "SELECT * FROM student WHERE COUNT(sid)>1", "B": "SELECT a. * FROM student a, student b WHERE a. sname = b. sname", "C": "SELECT * FROM student WHERE COUNT(sid)>1 GROUP BY sName", "D": "SELECT * FROM student GROUP BY sName HAVING COUNT(sid)>1<br/><br/>我的答案:D 正确答案:D"}$q$, NULL, NULL),(374597, $q${"A": "UPDATE product SET level=level±1;", "B": "UPDATE product SET level=level+1 WHERE level<=5;", "C": "UPDATE product SET level +1 where level < 5;", "D": "UPDATE product SET level=level+1 WHERE level<5;"}$q$, NULL, NULL),(374598, $q${"A": "CREATE VIEW V1<br/><br/>AS SELECT sno,sname FROM student;", "B": "CREATE VIEW V2(major) AS<br/><br/>SELECT DISTINCT(smajor) FROM student;", "C": "CREATE VIEW V3(major,scount)<br/><br/>AS SELECT smajor,COUNT(*) FROM student GROUP BY smajor;", "D": "CREATE VIEW V4(sname,sage)<br/><br/>AS SELECT sname,age+5 FROM student where sno='101';"}$q$, NULL, NULL),(374622, $q${"A": "yum check-update", "B": "yum update", "C": "yum upgrade", "D": "yum update <packages>"}$q$, NULL, NULL),(374623, $q${"A": "yum check-update", "B": "yum update", "C": "yum upgrade", "D": "yum update <packages>"}$q$, NULL, NULL),(374668, $q${"A": "'123 ton'", "B": "'1,2,3 ton'", "C": "'[123] ton'", "D": "'1|2|3 ton'"}$q$, NULL, NULL),(375167, NULL, NULL, $q$当一个表中所有行都被 delete 语句删除后，该表也同时被删除了。

技能三 UML建模

考查目标

√ 掌握用例图的绘制方法。
√ 掌握类图的绘制方法。
√ 掌握顺序图的绘制方法。

第一章 用例图

统一建模语言 (Unified Modeling Language, UML) 是一种为面向对象系统的产品进行说明、可视化和编制文档的一种标准语言，集百家之所长，是软件建模语言的集大成者。UML 不仅可以用于软件建模，还可以用于其他领域的建模工作。

UML 采用一组图形符号来描述软件模型，这些图形符号具有简单、直观和规范的特点，开发人员学习和掌握起来比较简单。所描述的软件模型，可以直观地理解和阅读，由于具有规范性，所以能够保证模型的准确、一致。UML 系统开发中有三个主要的模型:

● 功能模型:从用户的角度展示系统的功能，包括用例图。
- 对象模型:采用对象，属性，操作，关联等概念展示系统的结构和基础，包括类别图、对象图。
动态模型:展现系统的内部行为。包括序列图，活动图，状态图。

§ 1.1 参与者、用例的基本概念

1.1.1 什么是参与者

参与者在建模过程中处于核心地位，是在系统之外与系统交互的某人或某事物。具有如下含义:$q$),(375412, $q${"A": "右击行号 5 弹出快捷菜单→从中选\"插入\"→单击行号 1 以选中第 1 行→按组合键 Ctrl+X→单击 A5 单元格→按组合键 Ctrl+V", "B": "右击行号 5 弹出快捷菜单→从中选\"插入\"→单击行号 1 以选中第 1 行→按组合键 Ctrl+C→单击 A5 单元格→单击工具栏中\"粘贴\"按钮", "C": "右击行号 5 弹出快捷菜单→从中选\"插入\"→单击行号 1 以选中第 1 行→单击工具栏中\"剪切\"按钮→单击 A5 单元格→单击工具栏中\"粘贴\"按钮", "D": "单击行号 5→单击\"插入\"菜单\"→选\"行\"→单击行号 1 以选中第 1 行→单击菜单栏\"编辑\"→选\"剪切\"菜单项→单击 A5单元格→单击工具栏中\"粘贴\"按钮"}$q$, NULL, NULL),(375469, $q${"A": "*….*", "B": "0….*", "C": "1....*", "D": "0. (1)<br/><br/>1：一个 <br/>1…1：一个 <br/>0..*：零个或多个 <br/>*：零个或多个"}$q$, NULL, NULL),(375627, $q${"B": "泛化>实现>组合>聚合>关联>依赖>", "A": "泛化=实现>组合>聚合>关联>依赖", "D": "泛化>实现>聚合>组合>关联>依赖", "C": "泛化大类 10 类和对象都有属性，它们的差别是:类描述了属性的类型，而对象的属性必须有( )。"}$q$, NULL, NULL)
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
  IF n <> 24 THEN RAISE EXCEPTION '第 28 批 HTML 更新数应为 24，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 28 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 1 THEN RAISE EXCEPTION '第 28 批前缀修复数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 28 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 28 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
