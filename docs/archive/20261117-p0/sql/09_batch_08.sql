-- P0-211 第 8 批（25 道：20 写入 + 5 标 uncertain/manual）
BEGIN;
CREATE TEMP TABLE p0_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0_expected (id, analysis, correct, stem, action) VALUES
(370199, $q$信息系统共同的发展趋势是系统集成化、信息多媒体化、功能智能化和结构分布化四项；⑤“信息结构的统一化”并非公认趋势，属干扰项，故选B。$q$, NULL, NULL, 'keep'),(370356, NULL, NULL, NULL, 'manual'),(371326, $q$引号中的‘123’与‘456’是字符串常量，加号执行的是连接运算，结果为‘123456’；若当作数值相加才会得到579，故选C。$q$, NULL, NULL, 'keep'),(371881, $q$数据类型规定了数据的取值范围、可施行的运算以及在内存中占用的存储单元和存储方式；数组元素必须同类型，指针变量存放的是地址而非数值，故选A。$q$, NULL, NULL, 'keep'),(372116, $q$字面量中的“\\”先转义为一个反斜杠字符，其后的xfds是4个普通字符，合计5个字符，再加字符串结束符，共占6字节，不要误按\xfd转义算成3字节，故选D。$q$, NULL, NULL, 'keep'),(372701, $q$若两个结点的同一个指针域取值相同，说明同一结点被两个前驱指向，存在多个前件，故一定是非线性结构；有两个指针域的双向链表仍是线性结构，故选B。$q$, NULL, NULL, 'keep'),(373825, $q$显式插入22500后，自增序列已推进到22500，再插入0（或NULL）时由AUTO_INCREMENT自动取22501；0只是占位符不会被真正存入，故选B。$q$, NULL, NULL, 'keep'),(373979, $q$主外键关系中，外键建在子表一侧，用于引用主表的主键，所以表B中存在外键；主表A中存放的是主键，A项表述把外键说成在表A，故选B。$q$, NULL, NULL, 'keep'),(374135, $q$PowerPoint 2003 的 5 种视图是幻灯片、大纲、幻灯片浏览、备注页和幻灯片放映视图，题干已列出其中四种，所缺的正是大纲视图；普通视图是后续版本整合后的提法。故选 B。$q$, NULL, NULL, 'keep'),(374186, $q$在 SQL 的 LIKE 匹配中，百分号 % 代表任意长度的字符串，既可以表示 0 个字符，也可以表示 1 个或多个字符，因此 A、B、C 三种说法都成立，“以上都可以”也成立。故选 D。$q$, NULL, $q$SQL 语言允许使用通配符进行字符串匹配的操作，其中‘%’可以表示（ ）。$q$, 'keep'),(376086, $q$Windows 10 安装后，系统内置的 Administrator 管理员账户和 Guest 来宾账户默认都处于禁用状态，需要手动启用；Admin、User 并不是系统内置的账户名。故选 B。$q$, NULL, NULL, 'keep'),(376692, NULL, NULL, NULL, 'manual'),(377027, NULL, NULL, NULL, 'manual'),(377087, $q$接在 IDE0 接口上的从盘设备名是 hdb，扩展分区中的逻辑分区从 5 开始编号，因此第 2 个逻辑分区是 hdb6；hdb2 属于主分区的编号范围。故选 C。$q$, NULL, NULL, 'keep'),(377091, $q$rpm -F（即 --freshen）只升级系统中已经安装过的软件包，未安装的包会被跳过；-U 不管软件包是否安装都会安装或升级，-e 用于卸载，-q 用于查询。故选 B。$q$, NULL, NULL, 'keep'),(378279, $q$图表中的数据系列是根据数据表中的数据生成的，删除图表中的柱形只是去掉图表上的显示，不会改动源数据表，因此数据表中对应的数据保持不变。故选 A。$q$, NULL, NULL, 'keep'),(378409, $q$Excel 工作簿是保存的基本单位，一个工作簿内的多个工作表都存放在同一个 .xls 文件中，不会按工作表拆成多个文件。故选 A。$q$, NULL, NULL, 'keep'),(378421, $q$Excel 2003 新建工作簿时默认包含 3 个工作表，但工作表允许删除，工作簿中至少要保留 1 个工作表才能正常保存和使用。故选 A。$q$, NULL, NULL, 'keep'),(378429, NULL, NULL, NULL, 'uncertain'),(378498, $q$以等号开头的内容会被 Excel 当作公式解析，而“=20，12”中的逗号不构成合法运算，公式无法成立，因此不能输入；其余三项分别为文本、文本和合法公式。故选 B。$q$, NULL, NULL, 'keep'),(378504, $q$单元格中显示的是按格式舍入后的 0.111111，其他公式引用 B3 时取用的是单元格中存储的完整数值，即 1/9 的精确值，与显示出的文本无关。故选 A。$q$, NULL, NULL, 'keep'),(378755, $q$私有地址中 C 类地址的范围是 192.168.0.0～192.168.255.255；10.0.0.0 网段属于 A 类私有地址，172.16～172.31 网段属于 B 类私有地址，D 只是其中一个 C 类网段。故选 C。$q$, NULL, NULL, 'keep'),(379090, $q$RedHat 系列 Linux 的主机名保存在 /etc/sysconfig/network 文件中的 HOSTNAME 项里；/etc/hosts 只用于主机名与 IP 地址的静态映射，不保存主机名配置。故选 C。$q$, NULL, NULL, 'keep'),(379513, NULL, NULL, NULL, 'uncertain'),(379693, $q$插入数据时，字符型字段的值必须用单引号括起来，数值 25 则不加引号，并且列顺序要与值一一对应；A 缺少引号，C、D 的写法也不合法。故选 B。$q$, NULL, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    stem = coalesce(e.stem, q.stem),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0_expected e
WHERE q.id = e.id AND e.action IN ('uncertain', 'manual') AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.stem IS NULL OR q.stem = e.stem);
  IF n <> 20 THEN RAISE EXCEPTION '第 8 批写入数应为 20，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0 b ON b.id = q.id
   WHERE e.action IN ('uncertain', 'manual')
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 5 THEN RAISE EXCEPTION '第 8 批 uncertain/manual 数应为 5，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 8 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
