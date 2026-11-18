-- 多选第 1 批（25 道：23 keep + 1 change + 1 unresolved）
BEGIN;
CREATE TEMP TABLE multi_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO multi_expected (id, analysis, correct, action) VALUES
(335461, $q$扫描仪采集图像、麦克风采集声音、扫码枪读取条码、鼠标完成定位与点击，四者都把外部信息送入主机，均属于常用输入设备。$q$, NULL, 'keep'),(335474, $q$USB 确有 Type-A、Type-B、Type-C 等规格，可连接键盘、鼠标、打印机等多种外设，也可通过转接器兼容串行、并行等传统接口设备；USB 3.0 虽比 2.0 增加引脚，但向下兼容，D 的“互不兼容”说法错误。$q$, NULL, 'keep'),(335489, $q$打印机与主机之间的接口常见有并行口和 USB 口，SCSI 与 IEEE1394 也曾用于连接打印机，四项都可作为打印机接口。$q$, 'A,B,C,D', 'change_answer'),(335495, $q$硬盘按柱面、磁头、扇区三级定位，即由柱面号、磁头号和扇区号共同确定数据所在位置；盘面号不是标准寻址参数。$q$, NULL, 'keep'),(335496, $q$硬盘容量按 CHS 结构计算，公式为：容量 = 柱面数 × 磁头数 × 每道扇区数 × 每扇区字节数，所以柱面数、扇区数和磁头数都直接决定容量。盘面数不是独立参数：每个可用盘面配有一个读写磁头，其数量已由磁头数体现，再计入盘面数会重复计算。故 A、B、C 正确，D 不选。$q$, NULL, 'keep'),(335500, $q$机器语言由二进制指令构成，可被 CPU 直接执行，但面向具体硬件、难读难改，如今已不再直接用其编写程序，四项均正确。$q$, NULL, 'keep'),(335516, $q$扫描分辨率决定图像细节，色彩位数决定色彩还原能力，与主机的接口影响传输方式，均是扫描仪的性能指标；重量不属于性能指标。$q$, NULL, 'keep'),(335635, $q$USB 有 Type-A、Type-B、Type-C 等规格，可接多种外设，并可通过转接器连接串行、并行等传统接口设备；USB 3.0 向下兼容 2.0，D 的“互不兼容”错误。$q$, NULL, 'keep'),(339241, $q$前序为 1,2,3,4、后序为 4,3,2,1 时，1 为根：全右链得中序 1,2,3,4，全左链得 4,3,2,1，左子树的 2 带右链 3、4 得 2,3,4,1，三种均成立；而 3,2,4,1 对应的树后序为 3,4,2,1，不成立。$q$, NULL, 'keep'),(339248, $q$由前序 1,2,3,4 和后序 4,3,2,1 可知根为 1：全右链中序为 1,2,3,4，全左链中序为 4,3,2,1，左子树按 2 为根、3 为右子、4 为右孙时中序为 2,3,4,1；3,2,4,1 无法由该前、后序得出。$q$, NULL, 'keep'),(339273, $q$程序设计语言由语法、语义、语用三个基本要素构成：语法规定程序的结构形式，语义规定各语言成分的含义，语用规定语言的使用场合与效果。词汇只是构词材料，不属于独立的基本要素，故不选D。$q$, NULL, 'keep'),(339274, $q$程序设计语言由数据成分、运算成分、控制成分和传输成分四种成分组成，四者共同构成完整的程序描述能力，故四项全选。$q$, NULL, 'keep'),(339275, $q$翻译程序就是把一种语言写的程序翻译成另一种语言程序的程序，编译程序和解释程序都属语言处理程序，归为系统软件。C语言须先编译成目标代码再执行，属编译型语言；Java源程序编译为字节码后由JVM解释执行，通常归为解释型语言，故C错、D对。$q$, NULL, 'keep'),(339277, $q$算法必须具备有穷性、确定性、可行性以及零个或多个输入、一个或多个输出，四个选项分别对应它的基本条件，全部正确。$q$, NULL, 'keep'),(339279, $q$评价算法既要看结果是否正确，也要看执行所需的时间与空间开销，还要考虑可读性（可理解性）等，四项都是评价算法时应考虑的因素。$q$, NULL, 'keep'),(339280, $q$时间复杂度衡量算法执行所需的基本运算量，空间复杂度衡量所需的存储空间，二者共同构成对算法效率的度量。时间复杂度和空间复杂度是相互独立的指标，不存在必然联系，故D错。$q$, NULL, 'keep'),(339297, $q$Android、iOS、Windows Phone 和 HarmonyOS 都是为手机、平板等移动终端设计的操作系统，四项均符合题意。$q$, NULL, 'keep'),(339303, $q$固化在BIOS中的程序包括加电自检程序、系统自举程序、CMOS设置程序和基本外围设备驱动程序四个部分，四项全选。$q$, NULL, 'keep'),(339476, $q$软件生命周期通常划分为定义期（问题定义、可行性研究、需求分析）、开发期（设计、编码、测试）和维护期三个阶段。使用期并不是软件生命周期的独立阶段，其内容包含在维护期中，故不选C。$q$, NULL, 'keep'),(339591, NULL, NULL, 'unresolved'),(342922, $q$按拓扑结构划分，局域网可分为总线型、星型、树型和环型等，四个选项均属于按拓扑划分的局域网类型。$q$, NULL, 'keep'),(342928, $q$发送电子邮件使用SMTP协议，接收邮件使用POP3协议；ISP是网络服务提供商，FTP用于文件传输，二者不属于电子邮件收发协议。$q$, NULL, 'keep'),(342929, $q$SMTP、HTTP、FTP都属于TCP/IP体系中的应用层协议，而TCP是传输层协议。$q$, NULL, 'keep'),(342935, $q$密钥用于加密和解密过程；DES和AES都是对称加密算法，RSA是非对称加密算法，因此C错误，A、B、D正确。$q$, NULL, 'keep'),(342938, $q$信道是信号传输的通路，由传输介质构成，双绞线和光纤都是典型的传输介质；集线器和路由器属于网络连接设备，不构成信道本身。因此选 A、D。$q$, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM multi_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM multi_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 24 THEN RAISE EXCEPTION '第 1 批写入数应为 24，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_multi b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '第 1 批保留数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_multi b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '第 1 批改答案数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN multi_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
