-- P2 第 6 批（25 道；html=6 colon=1 prefix=18）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(338975, NULL, NULL, $q$从循环链表的某一结点出发，只能找到它的后继结点，不能找到它的前驱结点。$q$),(338976, NULL, NULL, $q$树形结构和图形结构都是非线性结构。$q$),(338977, NULL, NULL, $q$为解决软件危机，人们提出了用工程方法开发软件的思想。$q$),(338978, NULL, NULL, $q$需求分析属于软件生命周期中的软件开发期。$q$),(338979, NULL, NULL, $q$软件测试的目的是为了无一遗漏地找出所有的错误。$q$),(338980, NULL, NULL, $q$随着软件复杂性的不断提高，软件的维护难度越来越大。$q$),(338981, NULL, NULL, $q$用户购买软件后，就获得了它的版权，可以随意进行软件拷贝和分发。$q$),(338982, NULL, NULL, $q$自由软件不允许随意拷贝、修改其源代码，但允许自行销售。$q$),(338983, NULL, NULL, $q$所谓系统软件，就是购置计算机时计算机供应商提供的全部软件。$q$),(338984, NULL, NULL, $q$Office软件是通用的应用软件，它可以不依赖操作系统而独立运行。$q$),(338985, NULL, NULL, $q$操作系统中的图形用户界面通过多个窗口分别显示正在运行的程序的状态。$q$),(338986, NULL, NULL, $q$计算机自举完成后，操作系统的所有程序常驻内存。$q$),(338987, NULL, NULL, $q$Windows操作系统可以在任何计算机上运行。$q$),(338988, NULL, NULL, $q$实时操作系统的主要特点是允许多个用户同时联机使用计算机。$q$),(338989, NULL, NULL, $q$程序设计语言中，数据的类型主要是用来说明数据的性质和需占用多少存储单元。$q$),(338990, NULL, NULL, $q$程序语言中的条件选择结构可以直接描述重复的计算过程。$q$),(338991, NULL, NULL, $q$一般将用高级语言编写的程序称为源程序，这种程序不能直接在计算机中运行，需要有相应的语言处理程序翻译成机器语言程序才能执行。$q$),(338992, NULL, NULL, $q$编译程序是一种把高级语言程序翻译成机器语言程序的翻译程序。$q$),(339272, NULL, $q$除了机器语言可以直接在计算机上执行外,其他程序设计语言编写的源程序都必须经过翻译（编译或解释）方可被计算机所执行。选项 A 有误。软件危机出现的原因是;用户需求不明确、缺乏正确的理论指导、软件规模越来越大、软件复杂度越来越高。选项 B 有误。$q$, NULL),(339398, $q${"A": "DOS", "B": "Windows", "C": "Linux", "D": "Word<br/><br/>", "E": "Photoshop"}$q$, NULL, NULL),(339403, $q${"A": "软件需求增长得不到满足", "B": "软件生产成本高,价格昂贵", "C": "软件生产进度无法控制", "D": "软件需求定义不准确, 易偏离用户需求<br/><br/>", "E": "软件可维护性强"}$q$, NULL, NULL),(339406, $q${"A": "DOS", "B": "Windows", "C": "Linux", "D": "Word<br/><br/>", "E": "Photoshop"}$q$, NULL, NULL),(339459, $q${"A": "软件测试的目的是发现错误并改正错误", "B": "对被调试的程序进行\"错误定位\"是程序调试的必要步骤", "C": "程序调试通常也称为 Debug", "D": "软件测试应严格执行测试计划，排除测试的随意性"}$q$, NULL, NULL),(339635, $q${"A": "自由软件有利于软件共享和技术创新，它的出现成就了 TCP/IP 协议软件、Linux 操作系统等软件精品的产生", "B": "共享软件一般是以\"先使用后付费\"的方式销售的享有版权的软件，付费前通常有使用时间限制、功能限制等", "C": "目前所有的杀毒软件、防火墙软件、浏览器软件、压缩解压软件、手机 APP 等均为免费软件", "D": "Microsoft Office 软件是商品软件，用户应该付费获取和使用该软件"}$q$, NULL, NULL),(339672, $q${"A": "软件就是为方便使用计算机和提高使用效率而组织的程序以及有关文档", "B": "所谓\"裸机\", 其实就是没有安装软件的计算机", "C": "FoxPro，Oracle属于数据库管理系统，从某种意义上讲也是编程语言", "D": "通常，软件安装的越多，计算机的性能就越先进"}$q$, NULL, NULL)
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
  IF n <> 6 THEN RAISE EXCEPTION '第 6 批 HTML 更新数应为 6，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 1 THEN RAISE EXCEPTION '第 6 批解析去冒号数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 18 THEN RAISE EXCEPTION '第 6 批前缀修复数应为 18，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 6 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 6 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
