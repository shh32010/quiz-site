-- P0-C 第 2 批（25 道：24 写入 + 1 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(337618, $q$CPU 与内存条通过相应插座或插槽安装在主板上，A 正确；芯片组承担存储控制与 I/O 控制等主要功能，B 正确；主板尺寸标准化便于机箱安装与更换，C 正确。硬盘驱动器属外设，固定在机箱硬盘位上经数据线连接，并不装在主板上。故选 D。$q$, NULL, 'keep'),(337678, $q$CPU 内部的寄存器组用于临时存放参加运算的操作数、地址及运算中间结果，速度极快但容量小；控制器负责指挥协调各部件，整数 ALU 完成运算，ROM 存放固化程序和数据。故选 B。$q$, NULL, 'keep'),(337739, $q$CPU 由运算器、控制器、寄存器组等构成，其中算术逻辑部件即运算器，负责加法等算术运算和逻辑运算；控制器负责取指、译码并发出控制信号，总线负责信息传输，寄存器只作暂存。故选 D。$q$, NULL, 'keep'),(337779, $q$酷睿 i7 采用 QPI 点对点总线，其前端总线的数据线共 64 条，可并行传送 64 位数据，与 CPU 字长及内存数据宽度相匹配；16 位、32 位是早期总线的数据线宽度，36 条常指地址线数目。故选 D。$q$, NULL, 'keep'),(337832, NULL, NULL, 'manual'),(338296, $q$Cache 与主存的地址映射由硬件自动完成，访问时由地址变换机构实时转换，程序员和操作系统都不参与。B、C、D 把该职责归于软件或人工调度，其中 B 最具迷惑性。故选 A。$q$, NULL, 'keep'),(338938, $q$A 项概括分配回收、共享保护与虚存扩充；B 项描述页式管理；C 项指出 Win10 虚拟内存即磁盘页面文件 pagefile.sys，均正确。D 项称采用 FIFO 调度有误，Windows 实际用请求调页和类 LRU 策略。故选 D。$q$, NULL, 'keep'),(339789, $q$编译阶段做词法、语法和语义检查，括号不匹配属于语法错误，可当场发现。死循环、无穷递归是逻辑错误，0 作除数一般要到运行时才报错，编译器无法静态判定。D 项最典型。故选 D。$q$, NULL, 'keep'),(339825, $q$面向对象用对象、类等现实世界概念抽象思考问题，把问题域自然映射到解域。B 项强调算法而轻视概念，方向相反；A 项只说模拟事物联系，未抓住抽象建模核心。C 项表述最完整。故选 C。$q$, NULL, 'keep'),(339852, $q$A 项错，软件算法对处理速度影响很大；B 项错，大数据价值密度低，单条数据价值通常不大；C 项错，数据还有半结构化和非结构化形式。D 项指出安全既要防损坏也要防入侵窃取。故选 D。$q$, NULL, 'keep'),(340404, $q$软件是程序、数据及相关文档的完整集合，程序只是软件的一部分，二者不能等同。A 项混为一谈，B 项按编写者区分不成立，C 项按语言区分也不成立。D 项准确说明包含关系。故选 D。$q$, NULL, 'keep'),(340410, $q$用高级语言编写的程序称为源程序，需经编译或解释才能执行；编译后生成目标程序，链接后得到可执行程序。浮动程序是地址未定位的程序。B 项符合定义。故选 B。$q$, NULL, 'keep'),(340415, $q$CorelDraw、Photoshop、AutoCAD 都是常用绘图或图形设计软件；PowerPoint 是演示文稿软件，主要用途不是绘图。A 项与其余三项性质不同。故选 A。$q$, NULL, 'keep'),(340417, $q$DES、AES 和 Rijndael 都是对称密码算法，其中 Rijndael 是 AES 采用的算法，加解密使用同一密钥。RSA 基于大整数分解难题，用公钥和私钥，属于非对称算法。故选 C。$q$, NULL, 'keep'),(340418, $q$CorelDraw、Photoshop、AutoCAD 都是常用绘图或图形设计软件；Animate CC 主要用于二维动画制作，核心是动画而非绘图。A 项与其余三项性质不同。故选 A。$q$, NULL, 'keep'),(340422, $q$逐项验证：A 项 5 出栈后栈顶为 4，不能先出 3；C 项 3 出栈后栈顶为 2，不能先出 1；D 项 1、5、4、6 出栈后栈顶为 3，不能先出 2。B 项可按 3、2、5、6、4、1 实现。故选 B。$q$, NULL, 'keep'),(340450, $q$前序首元素 A 为根，中序 CBAEDF 中 A 左侧 CB 为左子树、右侧 EDF 为右子树。左子树根 B、左孩子 C；右子树根 D，左孩子 E、右孩子 F。后序按左右根得 CBEFDA。故选 A。$q$, NULL, 'keep'),(340471, $q$设进制为 b，按位值展开得 (b²+3b+1)-(4b+5)=5b+3，整理得 b²-6b-7=0，解得 b=7。验证：131₇=71，45₇=33，71-33=38，而 53₇=38，等式成立。故选 B。$q$, NULL, 'keep'),(340482, $q$系统漏洞指操作系统在逻辑设计上的缺陷或编写时产生的错误，可能被攻击者利用危及安全。系统垃圾是冗余文件，插件是功能扩展组件，木马病毒是恶意程序，均非设计缺陷。故选 A。$q$, NULL, 'keep'),(340490, $q$空间复杂度指算法运行所需的存储空间，包括程序本身、输入输出数据和辅助空间，通常关注随规模增长的辅助空间。B 项表述含混，C 项指编译期空间，D 项指指令条数。故选 A。$q$, NULL, 'keep'),(340511, $q$自然连接 R⋈S 先在公共属性 B 上做等值匹配，再去掉重复的属性列；按题意应得到 (a1,b1,3,2)、(a1,b2,5,4)、(a1,b2,5,3)、(a2,b3,9,6)，正好是 T。选择只筛行、投影只筛列，等值连接会保留两个 B 列。题面 R 第二行 B 值疑为录入错误，但结果仍指向自然连接。故选 D。$q$, NULL, 'keep'),(340581, $q$把题干 16 个是子结点理解为 16 个叶子结点。由二叉树性质 n0=n2+1 得 n2=15，又总结点数 48=n0+n1+n2，故度为 1 的结点数 n1=48-16-15=17。此处子结点应为叶结点，属录入之误。故选 D。$q$, NULL, 'keep'),(340657, $q$关键字写错、遗漏标点符号、括号不匹配都会在编译的词法或语法分析阶段被查出，属于编译错误；除数为 0 只有程序运行、执行到该表达式时才暴露，属运行时错误，编译阶段无法发现。故选 D。$q$, NULL, 'keep'),(340675, $q$30 个终端用户同时共用一台主机，系统按时间片轮流为各终端服务，追求交互响应及时，这正是分时操作系统的典型特征；分布式强调多机协同，实时强调截止期限响应，嵌入式面向专用设备。故选 D。$q$, NULL, 'keep'),(340704, $q$顺序表支持按下标随机访问，取第 i 个元素及其前趋元素均为 O(1)；单链表定位第 i 个元素需从头遍历，为 O(n)，双链表虽易找前趋但定位仍需遍历，单向循环亦然。因此顺序存储最节省时间。故选 D。$q$, NULL, 'keep')
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
  IF n <> 24 THEN RAISE EXCEPTION '第 2 批写入数应为 24，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '第 2 批人工数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
