-- P2 第 4 批（25 道；html=22 colon=1 prefix=2）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(336363, $q${"A": "虚拟存储器技术的指导思想是\"以时间换取空间\"", "B": "虚拟存储器可以解决内存容量不够使用的问题", "C": "虚拟存储器可以把硬盘当作内存使用，提高硬盘的存取速度", "D": "虚拟存储器对多任务处理提供了有力的支持"}$q$, NULL, NULL),(336478, $q${"A": "利用\"USB集线器\"，一个USB接口能连接多个设备", "B": "3.0版的USB接口数据传输速度要比2.0版快得多", "C": "USB属于一种串行接口", "D": "主机不能通过USB连接器引脚向外设供电"}$q$, NULL, NULL),(336650, $q${"A": "选择该文件后用鼠标单击目的文件夹", "B": "选择该文件后用鼠标拖动该文件到目的文件夹", "C": "按下<Ctrl>键并保持，再用鼠标拖动该文件到目的文件夹", "D": "按下<Alt>键并保持，再用鼠标拖动该文件到目的文件夹"}$q$, NULL, NULL),(336740, $q${"A": "速度快, 价格高, 容量大, 寿命长.", "B": "…快, …高, …小, …长", "C": "…快 …高, …小, …短.", "D": "…快 …低 …小, …短<br/>", "E": "…慢 …低, …小, …短"}$q$, NULL, NULL),(336776, $q${"A": "SELECT * FROM 客户-WHERE 公司名称 NOT LIKE '公司%'", "B": "SELECT * FROM 客户 WHERE 公司名称 LIKE '公司'", "C": "SELECT * FROM 客户 WHERE 公司名称 NOT IN '%公司'", "D": "SELECT * FROM 客户 WHERE 公司名称 NOT LIKE '%公司'"}$q$, NULL, NULL),(336852, $q${"A": "浮点数由\"指数\"和\"尾数\"两部分组成，前者也称为\"阶码\"", "B": "目前被广泛采用的浮点数表示的工业标准由 ISO 制定", "C": "由于字长的限制，许多实数用浮点数表示时都是近似的,有一定的误差", "D": "浮点数的四则运算有时有误差, 运算结果并不都与理论计算结果一致"}$q$, NULL, NULL),(336885, $q${"A": "Select * from customer where customer_id=10;", "B": "Select * from customer Where LEFT(last_name,4)='SMIT';", "C": "Select * from customer where customer_name LIKE 'SMIT%';", "D": "Select * from customer where customer_id =4 OR customer_id =7 OR customer_id =10;"}$q$, NULL, NULL),(336894, $q${"A": "SELECT XM, SA FROM STUD FOR SA<20", "B": "SELECT XM, SA FROM STUD WHERE SA<20", "C": "SELECT XM, SA ON STUD FOR SA<20", "D": "SELECT XM, SA ON STUD WHERE SA<20"}$q$, NULL, NULL),(337116, $q${"A": "USB 接口有多种规格，3.0 版的数据传输速度要比 2.0 版快得多。", "B": "利用\"USB 集线器”，一个 USB 接口能连接多个设备。", "C": "USB 属于一种串行接口。", "D": "主机不能通过 USB 连接器引脚向外设供电。"}$q$, NULL, NULL),(337147, $q${"A": "(F3)键", "B": "<Home>键", "C": "(Shift)键", "D": "<Insert>键"}$q$, NULL, NULL),(337402, $q${"A": "主存>寄存器>辅助存储器>cache 存储器", "B": "寄存器>主存>辅助存储器>cache 存储器", "C": "寄存器>cache 存储器>主存>辅助存储器", "D": "cache 存储器>寄存器>主存>辅助存储器"}$q$, NULL, NULL),(337451, $q${"A": "将 a 与 0x000F 进行\"逻辑与\"运算，然后判断运算结果是否等于 0", "B": "将 a 与 0x000F 进行\"逻辑或\"运算，然后判断运算结果是否等于 F", "C": "将 a 与 0x000F 进行\"逻辑异或\"运算，然后判断运算结果是否等于 0", "D": "将 a 与 0x000F 进行\"逻辑与\"运算, 然后判断运算结果是否等于 F"}$q$, NULL, NULL),(337504, $q${"A": "将 a 与 0x000F 进行\"逻辑与\"运算，然后判断运算结果是否等于 0", "B": "将 a 与 0x000F 进行\"逻辑或\"运算，然后判断运算结果是否等于 F", "C": "将 a 与 0x000F 进行\"逻辑异或\"运算，然后判断运算结果是否等于 0", "D": "将 a 与 0x000F 进行\"逻辑与\"运算，然后判断运算结果是否等于 F"}$q$, NULL, NULL),(337559, $q${"A": "芯片组提供了多种 I/O 接口的控制电路", "B": "芯片组已标准化，同一芯片组可用于多种不同类型和不同性能的 CPU", "C": "Intel 推出了\"PCH 单芯片\"设计", "D": "芯片组由超大规模集成电路组成"}$q$, NULL, NULL),(337671, $q${"A": "外存中的数据是直接传送给CPU处理的", "B": "一台计算机内只能有一个 CPU", "C": "多数输出设备的功能是将计算机中用\"0\"和\"1\"表示的信息转换成人可直接识别和感知的形式", "D": "1/0 设备是用来连接 CPU、内存、外存和各种输入输出设施并协调它们工作的一个控制部件"}$q$, NULL, NULL),(337724, $q${"A": "一台计算机内只有一个微处理器", "B": "多数输出设备能将计算机中用 “0” 和 \"1\" 表示的信息转换成人可识别和感知的形式，如文字、图形、声音等", "C": "外存储器中的数据是直接传送给 CPU 处理的", "D": "I/O 控制器都做成扩充卡的形式插在 PCI 扩充槽内"}$q$, NULL, NULL),(337774, $q${"A": "将 a 与 0x000F 进行\"逻辑与\"运算，然后判断运算结果是否等于 0", "B": "将 a 与 0x000F 进行\"逻辑或\"运算，然后判断运算结果是否等于 F", "C": "将 a 与 0x000F 进行\"逻辑异或\"运算，然后判断运算结果是否等于 0", "D": "将 a 与 0x000F 进行\"逻辑与\"运算，然后判断运算结果是否等于 F"}$q$, NULL, NULL),(337961, $q${"A": "RAM>CACHE>硬盘>软盘", "B": "CACHE>RAM>硬盘>软盘", "C": "CACHE>硬盘>RAM>软盘", "D": "RAM>硬盘>CACHE>软盘"}$q$, NULL, NULL),(337993, $q${"A": "选择该文件后用鼠标单击目的文件夹", "B": "选择该文件后用鼠标拖动该文件到目的文件夹", "C": "按下<Ctrl>键并保持，再用鼠标拖动该文件到目的文件夹", "D": "按下<Alt>并保持，再用鼠标拖动该文件到目的文件夹"}$q$, NULL, NULL),(338009, $q${"A": "单击鼠标右键", "B": "双击鼠标左键", "C": "鼠标的拖曳", "D": "<Ctrl>+<Shift>+组合键"}$q$, NULL, NULL),(338019, $q${"A": "<ALT>", "B": "<ESC>", "C": "<CTRL>", "D": "<ENTER>"}$q$, NULL, NULL),(338299, $q${"A": "QU->front==QU->rear", "B": "QU->front!=QU->rear", "C": "QU->front== (QU->rear+1)% MaxSize", "D": "QU->front!=(QU->rear+1)%MaxSize"}$q$, NULL, NULL),(338404, NULL, $q$计算机网络的协议可以采用分层的方法进行设计和开发,使用该方法可以将庞大而复杂的问题转化为若干较小的局部问题,从而使问题易于处理。比如 TCP/IP 分为四层，不同层处理不同事情。$q$, NULL),(338943, NULL, NULL, $q$操作系统和应用软件中，更靠近计算机硬件的是操作系统。$q$),(338944, NULL, NULL, $q$计算机软件必须依附一定的硬件和软件环境，否则它可能无法正常运行。$q$)
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
  IF n <> 22 THEN RAISE EXCEPTION '第 4 批 HTML 更新数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 1 THEN RAISE EXCEPTION '第 4 批解析去冒号数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 2 THEN RAISE EXCEPTION '第 4 批前缀修复数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
