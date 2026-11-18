-- P2 第 1 批（25 道；html=2 colon=5 prefix=18）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(334371, NULL, $q$本题的关键点在于图中右上角对于控制线和数据线的注释,计算机硬件系统主要包含五大硬件对象:运算器、控制器、存储器、输入设备和输出设备,★标识的部件连接的控制线相对较多,即可判断为控制器,而◆标识的部件连接的数据线较多,即可判断为存储器,故答案为存储器和控制器。同学们在最后填入答案时一定要注意细心,不要因为粗心填错顺序。$q$, NULL),(334375, NULL, $q$摩尔定律（Moore）:单块集成电路的集成度平均每 18 月至 24 个月翻一番。摩尔定律并不可能永远成立。$q$, NULL),(334396, NULL, $q$对一台显示器而言，分辨率越高时，其扫描率将会不变是因为分辨率和显示器的屏幕像素量有关、和扫描频率无关。$q$, NULL),(334684, NULL, $q$总线用于连接 CPU、内存、外存和各种 I/O 设备并在它们之间传输信息的一组共享的传输线及其控制电路。$q$, NULL),(334848, $q${"A": "SELECT CNO FROM S;", "B": "SELECT SNAME, DEPT FROM S, SC WHERE GRADE >80 AND S. SNO = SC. SNO;", "C": "SELECT FROM S WHERE SNO IN (SELECT SNO FROM SC WHERE GRADE=90);", "D": "SELECT CNO, COUNT (*) FROM SC WHERE COUNT (*) > 50"}$q$, NULL, NULL),(334864, $q${"A": "select * from emp where ename in 'S%'; B. select * from emp where ename='S%';", "C": "select * from emp where ename like 'S%'; D. select * from emp where ename like 'S_;"}$q$, NULL, NULL),(335073, NULL, $q$大数据需要云计算技术的支持，大数据必然无法用单台的计算机进行处理，必须采用分布式计算架构。$q$, NULL),(335140, NULL, NULL, $q$虚拟存储器其实就是外存储器。$q$),(335142, NULL, NULL, $q$一台计算机有且只有一个处理器。$q$),(335143, NULL, NULL, $q$微型计算机属于第4代计算机。$q$),(335144, NULL, NULL, $q$计算机硬件指的是计算机系统中所有实际物理装置和文档资料。$q$),(335146, NULL, NULL, $q$计算机中往往有多个处理器，其中承担系统软件和应用软件运行任务的处理器，称为"中央处理器"。$q$),(335147, NULL, NULL, $q$在PC机中，微处理器和中央处理器是完全等同的概念。$q$),(335148, NULL, NULL, $q$智能手机、数码相机、MP3播放器等产品中一般都含有嵌入式计算机。$q$),(335149, NULL, NULL, $q$如果两台计算机采用相同型号的Pentium4微处理器作为CPU，那么这两台计算机完成同一任务的时间一定相同。$q$),(335150, NULL, NULL, $q$CPU工作时，它所执行的指令和处理的数据都直接从磁盘或光盘中取出，处理结果也直接存入磁盘。$q$),(335151, NULL, NULL, $q$CPU前端总线是CPU与内存之间传输信息的干道，它的传输速度直接影响着系统的性能。$q$),(335152, NULL, NULL, $q$CPU中的寄存器可用于永久保存数据的运算结果。$q$),(335153, NULL, NULL, $q$计算机的字长越长，意味着其运算速度越快，但并不代表它有更大的寻址空间。$q$),(335154, NULL, NULL, $q$不同结构的计算机，它们的指令系统却总是一样的。$q$),(335155, NULL, NULL, $q$不同厂家生产的计算机一定互相不兼容。$q$),(335157, NULL, NULL, $q$制造集成电路都需要使用半导体材料，硅是微电子产业中常用的半导体材料。$q$),(335158, NULL, NULL, $q$集成电路根据它所包含的晶体管数目可以分为小规模、中规模、大规模、超大规模和极大规模集成电路，现在PC机中使用的微处理器属于大规模集成电路。$q$),(335159, NULL, NULL, $q$集成电路的工作速度与芯片的尺寸有关。芯片越大，其工作速度就越快。$q$),(335160, NULL, NULL, $q$集成电路按用途可以分为通用集成电路和专用集成电路，存储器芯片属于通用集成电路。$q$)
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
  IF n <> 2 THEN RAISE EXCEPTION '第 1 批 HTML 更新数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 5 THEN RAISE EXCEPTION '第 1 批解析去冒号数应为 5，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 18 THEN RAISE EXCEPTION '第 1 批前缀修复数应为 18，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
