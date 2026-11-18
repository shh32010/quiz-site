-- P2 第 3 批（25 道；html=12 colon=4 prefix=9）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(335191, NULL, NULL, $q$带符号的整数，其符号位一般在最低位。$q$),(335192, NULL, NULL, $q$所有的十进制数都可精确转换为二进制数。$q$),(335193, NULL, NULL, $q$反映计算机存储容量的基本单位是字节。$q$),(335194, NULL, NULL, $q$在八进制数中，每一位数的最大值为7。$q$),(335195, NULL, NULL, $q$计算机中的浮点数用阶码和尾数表示。$q$),(335196, NULL, NULL, $q$计算机中的所有信息都是以ASCII码的形式存储在机器内部的。$q$),(335197, NULL, NULL, $q$进位计数涉及到两个基本问题：基数与各数位的位权。$q$),(335198, NULL, NULL, $q$在计算机内部，一切信息的存储、处理和传输均采用二进制的形式。$q$),(335199, NULL, NULL, $q$十进制数58转换成二进制数是111010。$q$),(335205, $q${"A": "用鼠标左键拖动后，再选择\"移动到当前位置\"", "B": "用鼠标右键拖动后，再选择\"移动到当前位置\"", "C": "按住 Ctrl 键，再用鼠标左键拖动", "D": "按住 Alt 键，再鼠标右键拖动"}$q$, NULL, NULL),(335317, NULL, $q$主频为 2GHz 的 CPU 运算速度不能判定是 1GHz 的 CPU 运算速度的 2 倍。$q$, NULL),(335506, NULL, $q$数据清洗的内容:一致性检查、无效值和缺失值的处理。$q$, NULL),(335545, $q${"A": "虚拟存储器对多任务处理提供了有力的支持", "B": "虚拟存储器技术的指导思想是\"以时间换取空间\"", "C": "虚拟存储器是由物理内存和硬盘上的高速缓存联合组成的", "D": "虚拟存储器可以解决内存容量不够使用的问题"}$q$, NULL, NULL),(335561, $q${"A": "虚拟存储器可以解决内存容量不够使用的问题", "B": "虚拟存储器可以把硬盘当作内存使用，提高硬盘的存取速度", "C": "虚拟存储器对多任务处理提供了有力的支持", "D": "虚拟存储器技术的指导思想是\"以时间换取空间\""}$q$, NULL, NULL),(335724, NULL, $q$计算机硬件五大部件 :运算器、控制器、存储器、输入设备和输出设备。

外部设备:输入设备和输出设备，外存。鼠标、扫描仪属于输入设备。CPU 是核心部件，由控制器、运算器及寄存器组构成。电源是通用设备，不属于计算机外设。$q$, NULL),(335821, $q${"A": "虚拟内存是硬盘上的一块区域", "B": "虚拟内存的大小可以由用户修改", "C": "用户可以根据需要，选择不使用虚拟内存", "D": "虚拟内存对应一个名为\"pagefile.sys\"的文件，用户可修改其文件名"}$q$, NULL, NULL),(335992, NULL, $q$此接口为图形设备接口，用于接入输出设备中显示器所用。和 HDMI 和 AVG 都是用于接显示器所用。$q$, NULL),(336026, $q${"A": "主存>寄存器>辅助存储器>cache 存储器", "B": "寄存器>主存>辅助存储器>cache 存储器", "C": "寄存器>cache 存储器>主存>辅助存储器", "D": "cache 存储器>寄存器>主存>辅助存储器"}$q$, NULL, NULL),(336063, $q${"A": "Select SNO,SNAME From Student-", "B": "Select SNO,SNAME From Student Where Sex=\"男\"", "C": "Select * From Student Where Sex=\"男\"", "D": "Select * From Student"}$q$, NULL, NULL),(336220, $q${"A": "芯片组提供了多种 I/O 接口的控制电路", "B": "芯片组已标准化，同一芯片组可用于多种不同类型和不同性能的 CPU", "C": "Intel 推出了\"PCH 单芯片\"设计", "D": "芯片组由超大规模集成电路组成"}$q$, NULL, NULL),(336266, $q${"A": "select * into tb_001 where name like '%明日%'；", "B": "insert * from tb_001 where name like '%明日%'；", "C": "select * into tb_001 where name order like '%明日%'；", "D": "select * from tb_001 where name like '%明日%'；"}$q$, NULL, NULL),(336270, $q${"A": "SELECT * FROM 图书 WHERE 图书名称 LIKE '中国%'", "B": "SELECT * FROM 图书 WHERE 图书名称 LIKE '%中国%'", "C": "SELECT * FROM 图书 WHERE 图书名称 LIKE '%中国'", "D": "SELECT * FROM 图书 WHERE 图书名称 LIKE '_中国%'"}$q$, NULL, NULL),(336275, $q${"A": "SELECT sno，sname FROM student WHERE sname='_t%'；", "B": "SELECT sno，sname FROM student WHERE sname LIKE '_t%'；", "C": "SELECT sno，sname FROM student WHERE $\\mathrm{sname}= \\% \\mathrm{t}_{-}$", "D": "SELECT sno，sname FROM student WHERE sname LIKE '%t_'；"}$q$, NULL, NULL),(336277, $q${"A": "select * from tb_book where books like '%PHP%'；", "B": "select books from tb_book where like '%PHP%'；", "C": "select * from books where '%PHP%'；", "D": "select books from tb_book where '%PHP%'；"}$q$, NULL, NULL),(336344, $q${"A": "SELECT XM, SA FROM STUD FOR SA<20", "B": "SELECT XM, SA FROM STUD WHERE SA<20", "C": "SELECT XM, SA ON STUD FOR SA<20", "D": "SELECT XM, SA ON STUD WHERE SA<20"}$q$, NULL, NULL)
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
  IF n <> 12 THEN RAISE EXCEPTION '第 3 批 HTML 更新数应为 12，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 4 THEN RAISE EXCEPTION '第 3 批解析去冒号数应为 4，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 9 THEN RAISE EXCEPTION '第 3 批前缀修复数应为 9，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
