-- P0-C 第 9 批（25 道：19 写入 + 6 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(358216, $q$Excel 中按 Ctrl 键加重音符键（`）可在单元格显示公式与显示运算结果之间切换，选项中写作～的即指该键。Ctrl+V 粘贴、Ctrl+B 加粗、Ctrl+X 剪切均不具此功能，可排除。故选 A。$q$, NULL, 'keep'),(358273, $q$第 1 字节 11111110 最高位为 1，说明阶码为负；尾数首字节 11010000 最高位亦为 1，说明尾数为负。两者同负，C 项仅阶码判断正确、误判尾数符号，为关键干扰项。故选 B。$q$, NULL, 'keep'),(359683, $q$分辨率 1024×768 指屏幕横向有 1024 个像素点、纵向有 768 个像素点，即横向点数×纵向点数。A、B 两项把点误作字符，C 项把横纵顺序颠倒，均属常见干扰。故选 D。$q$, NULL, 'keep'),(359912, $q$Windows XP 允许用户同时运行多个程序，具备多任务能力，但同一时刻只支持一个用户登录使用，故属单用户多任务系统。C 项多用户多任务是服务器版系统的特点，为关键干扰项。故选 B。$q$, NULL, 'keep'),(360039, $q$Word 2003 中艺术字属于绘图对象，可通过绘图工具栏的插入艺术字按钮插入。自选图形用于绘制图形，对象命令用于嵌入外部对象，均不能生成艺术字。故选 A。$q$, NULL, 'keep'),(360618, $q$防火墙可由硬件、软件或软硬件结合实现，用于隔离内外网并按规则过滤进出数据包。B 项把建筑材料当作防火墙，C 项否认其对外访问控制功能，D 项把拦截报警等同于已遭攻击，均错误。故选 A。$q$, NULL, 'keep'),(361022, $q$机内码由区位码两字节各加 A0H 得到：区码 49D+160=209D=D1H，位码 07D+160=167D=A7H，拼得 D1A7H。B 项 B187H 只在位码上加 A0H，属换算不全的关键干扰项。故选 A。$q$, NULL, 'keep'),(361023, $q$32×32 点阵每个字形需 32×32÷8=128 字节。GB2312-80 共收录 7445 个图形符号和汉字，故总存储空间为 7445×128B；6763 只是其中的汉字数，D 项 56B 更不足一个字形所需。故选 A。$q$, NULL, 'keep'),(361080, $q$首字节 11111110 最高位为 1，阶码为负；尾数首字节 11010000 最高位亦为 1，尾数为负。题干表示数应为表示尾数之误，不影响判断。C 项只判对阶码，是关键干扰项。故选 B。$q$, NULL, 'keep'),(361815, $q$八进制转义 \101 等于十进制 65，恰为大写字母 A 的 ASCII 码值，故该字符常量为字符 A。B 项 a 的码值是 97，C 项 e 为 101，D 项八进制转义本身合法，均可排除。故选 A。$q$, NULL, 'keep'),(361863, NULL, NULL, 'manual'),(361948, NULL, NULL, 'manual'),(362419, $q$10 位无符号二进制数的最大值为 1111111111，等于十进制 1023。转八进制时从右往左每三位一组：1 111 111 111 对应 1 7 7 7，即 1777。1023 是十进制写法，1024 是 2 的 10 次方。故选 B。$q$, NULL, 'keep'),(362483, $q$CPU 和内存条通过插座安装在主板上，芯片组集成存储控制与 I/O 控制功能，主板物理尺寸有标准规范，A、B、C 均正确。光驱安装在机箱的驱动器支架上，经数据线与电源线连到主板接口，并非直接装在主板上。故选 D。$q$, NULL, 'keep'),(363566, $q$计算机能按人的意图自动工作，最直接的原因是存储程序控制：程序和数据一起存入存储器，控制器按地址顺序自动取指执行。二进制只是数据表示方式，高速电子元件保证运算速度，程序设计语言是编写程序的工具。故选 D。$q$, NULL, 'keep'),(364696, NULL, NULL, 'manual'),(365320, NULL, NULL, 'manual'),(367587, $q$Excel 2003 中直接拖动选定区域边框只是移动到本工作表其他位置；若要移到同一工作簿的其他工作表，需在拖动时按住 Alt 键。Esc 用于取消操作，Ctrl 配合拖动是复制，Enter 与拖动无关。故选 A。$q$, NULL, 'keep'),(368295, $q$Windows 10 中 Administrator 与 Guest 是系统内置账户，默认都处于禁用状态，可在计算机管理→本地用户和组→用户中启用，因此 A、B、D 均正确。Guest 默认空密码，登录一般无需输入密码，C 说法错误。故选 C。$q$, NULL, 'keep'),(368359, NULL, NULL, 'manual'),(369211, NULL, NULL, 'manual'),(369729, $q$最大的 10 位无符号二进制整数是 1111111111，即十进制 1023。按每三位一组转八进制：1 111 111 111 对应 1 7 7 7，结果为 1777。1023 是十进制写法，1024 是 2 的 10 次方，都不是答案。故选 B。$q$, NULL, 'keep'),(370353, $q$自然语言理解的目标包括理解人讲的话、对自然语言信息进行分析概括或编辑、机器翻译等。欣赏音乐属于音频与音乐感知范畴，不是自然语言处理要完成的任务，其余三项均属其应用目标。故选 C。$q$, NULL, 'keep'),(373287, $q$T-SQL 的 SELECT 语句中，SELECT 子句指定查询的列，FROM 子句指定数据来源表，二者是查询最基本、通常必不可少的子句；INTO、GROUP BY 等都可以省略。按教材标准答案应选 SELECT 与 FROM。故选 B。$q$, NULL, 'keep'),(373342, $q$UPDATE 语句的标准写法是 UPDATE 表名 SET 列=值 WHERE 条件。A、B 都缺少 SET 关键字，D 修改的是 name 列而不是 age 列，均不符合要求；C 中 set age=15 where name=张三 语法完整、条件正确。故选 C。$q$, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0c_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0c_expected e
WHERE q.id = e.id AND e.action = 'manual' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 19 THEN RAISE EXCEPTION '第 9 批写入数应为 19，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 6 THEN RAISE EXCEPTION '第 9 批人工数应为 6，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 9 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
