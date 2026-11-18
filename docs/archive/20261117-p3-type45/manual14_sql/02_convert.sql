-- 25 道人工复核中 14 道转换（多为 type4/5 -> type1）
BEGIN;
CREATE TEMP TABLE manual14_map (id integer PRIMARY KEY, new_options text NOT NULL, new_correct text NOT NULL, new_stem text) ON COMMIT DROP;
INSERT INTO manual14_map (id,new_options,new_correct,new_stem) VALUES
(338116, $q${"A": "模块说明书", "B": "软件规格说明书", "C": "项目开发计划", "D": "合同文档"}$q$, 'B', $q$需求分析是由分析员了解用户的要求，认真细致地调研、分析，最终应建立目标系统的逻辑模型并写出____$q$),(338302, $q${"A": "设计该算法所需的工作量", "B": "执行该算法所需要的时间", "C": "算法中指令的条数", "D": "执行该算法时所需要的基本运算次数"}$q$, 'D', NULL),(341916, $q${"A": "粗同轴电缆", "B": "多模光纤", "C": "单模光纤", "D": "5类双绞线"}$q$, 'B', $q$在构建分布式中型企业局域网时，当建筑物之间的距离小于 500m 时，可采用 1000BASE 可采用的传输介质是（）$q$),(342251, $q${"A": "总线型", "B": "星型", "C": "树型", "D": "环型"}$q$, 'A', $q$在（）拓扑结构的局域网中，任何一个结点发生故障都不会导致整个网络崩溃。$q$),(364977, $q${"A": "-10\n0x8f\n-011", "B": "0abc\n-017\n0xc", "C": "0010\n-0x11\n0xf1", "D": "0a12\n-0x123\n-0xa"}$q$, 'C', $q$下面四个选项中,均是正确的八进制或十六进制数的选项是______。$q$),(364978, $q${"A": "0.0\n0f\n8.9e\n'&'", "B": "\"a\"\n3.9e-2.5\n1e1\n'\"'", "C": "'3'\n011\n0xFF00\n0a", "D": "+001\n0xabcd\n2e2\n50."}$q$, 'D', $q$下面四个选项中,均是正确的数值常量或字符常量的选项是______。$q$),(365839, $q${"A": "并发复合状态", "B": "历史状态", "C": "顺序复合状态", "D": "中间状态"}$q$, 'A', NULL),(367047, $q${"A": "PCI 总线插槽", "B": "I/O 接口", "C": "USB 接口", "D": "DIMM 插槽"}$q$, 'A', NULL),(367057, $q${"A": "Windows 操作系统", "B": "鼠标器硬件本身", "C": "鼠标器的驱动程序", "D": "正在运行的软件"}$q$, 'D', NULL),(367349, $q${"A": "select * from emp where hiredate>='19820101';", "B": "select * from emp where hiredate>=to_char('19820101','YYYYMMDD');", "C": "select * from emp where to_date(hiredate:\"YYYYMMDD\")>='19820101';", "D": "select * from emp where to char(hiredate,'YYYYMMDD') >= '19820101';"}$q$, 'A', NULL),(369423, $q${"A": "一段文字", "B": "一幅位图", "C": "一段声音", "D": "以上的混合"}$q$, 'B', $q$在 Word 应用程序中，进行文档编辑时，按下<Print Screen>键，剪贴板中保存的是显示在屏幕上的（）$q$),(369782, $q${"A": "R 和 S 的元组个数相同", "B": "R 和 S 模式结构相同", "C": "R 和 S 的属性个数相同", "D": "R 和 S 的元组数相同且属性个数相同"}$q$, 'B', NULL),(369953, $q${"A": "不可以重复", "B": "可以重复三次", "C": "可以重复", "D": "只有在 Word 中可重复"}$q$, 'C', $q$Windows 的剪贴板提供了在不同窗口或应用程序之间进行信息拷贝的功能，而剪贴板中的信息可____利用。$q$),(370736, $q${"A": "十进制代码", "B": "操作码和操作数地址", "C": "英文字母和数字", "D": "运算符和操作数构成的表达式"}$q$, 'B', NULL)
;
UPDATE t_question q
SET question_type=1,
    option_json=e.new_options,
    correct=e.new_correct,
    blank_count=1,
    stem=coalesce(e.new_stem,q.stem)
FROM manual14_map e
WHERE q.id=e.id AND NOT q.is_golden;
DELETE FROM practice_answer WHERE question_id IN (338116,338302,341916,342251,364977,364978,365839,367047,367057,367349,369423,369782,369953,370736);
DELETE FROM wrong_question WHERE question_id IN (338116,338302,341916,342251,364977,364978,365839,367047,367057,367349,369423,369782,369953,370736);
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN manual14_map e ON e.id=q.id
   WHERE q.question_type=1 AND q.correct=e.new_correct AND q.option_json=e.new_options AND q.blank_count=1
     AND (e.new_stem IS NULL OR q.stem=e.new_stem);
  IF n<>14 THEN RAISE EXCEPTION '转换数应为 14，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type=1;
  IF n<>23979 THEN RAISE EXCEPTION 'type1 应为 23979，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type=4;
  IF n<>8179 THEN RAISE EXCEPTION 'type4 应为 8179，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type=5;
  IF n<>1547 THEN RAISE EXCEPTION 'type5 应为 1547，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted;
  IF n<>44462 THEN RAISE EXCEPTION '活跃应为 44462，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n<>200 THEN RAISE EXCEPTION '金标应为 200，实际 %', n; END IF;
  SELECT count(*) INTO n FROM practice_answer WHERE question_id IN (338116,338302,341916,342251,364977,364978,365839,367047,367057,367349,369423,369782,369953,370736);
  IF n<>0 THEN RAISE EXCEPTION '仍有作答 %', n; END IF;
  SELECT count(*) INTO n FROM wrong_question WHERE question_id IN (338116,338302,341916,342251,364977,364978,365839,367047,367057,367349,369423,369782,369953,370736);
  IF n<>0 THEN RAISE EXCEPTION '仍有错题 %', n; END IF;
END $$;
COMMIT;
