-- 知识点 39 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_39
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_39 as
select * from t_knowledge_point where id in (21878,21880,21887,21888,21889,21890,21895,22111,22112,22115,22138,22143,22150,22166,22207,22241,24123,24984,25202,25206,25331,25575,25769,26144,26694,27013,27063,27065,27169,27170,27171,27254,28017,28018,28041,28103,28240,28241,28343,28390,28596,28618,28634,28716,28719,28720,28761,28768,28779,28794,28797,28800,28802,28807,28838,28839,28853,28874,28875,28876,28882,28901,28917,28964,29342,30118);

update t_knowledge_point set title = $kp$WSDL、SOAP 与相关基础知识$kp$, content = $kp$WSDL 用来定义 Web Service 的接口标准；SOAP 提供了标准的 RPC（远程过程调用）方法来调用 Web Service。

蓝牙是一种支持设备短距离通信（一般 10 m 之内）的无线电技术，能在移动电话、PDA、无线耳机、笔记本电脑、相关外设等众多设备之间进行无线信息交换。蓝牙的标准是 IEEE 802.15（IEEE 802.15.1），工作在 2.4 GHz 频带，带宽为 1 Mb/s。

射频识别技术由电子标签（射频标签）和阅读器组成。电子标签附着在需要标识的物品上，阅读器通过获取标签信息来识别目标物品。

智能家居作为一个家庭有机的生态系统，主要包括 7 大子系统，它们均以物联网为基础。

程序直接控制方式（程序查询）：CPU 向 I/O 模块发出读写指令，从状态寄存器中读取 I/O 设备的状态，若为忙碌状态就继续轮询检查；若已就绪，则把数据读入 CPU 寄存器，再由 CPU 写入存储器（内存），写完后再执行下一条指令。该方式完全由软件实现，CPU 参与度非常高。

十进制小数转换为 R 进制数时，可能无法用有限位数精确表示。

补码运算能将减法化为加法完成，使运算器中不必配置减法电路，节省硬件电路，简化计算机或运算器的设计。计算机系统中数值一律用补码表示和存储：使用补码可以将符号位和数值域统一处理，加法和减法也能统一处理；补码与原码相互转换的运算过程相同，不需要额外的硬件电路。$kp$, section = '' where id = 21878;
update t_knowledge_point set title = $kp$Zigbee 网络拓扑及相关基础知识$kp$, content = $kp$Zigbee 支持星型、树型、网状三种网络拓扑结构。

全面感知（识别与通信特征）：利用无线射频识别（RFID）、传感器、定位器和二维码等手段，随时随地对物体进行信息采集和获取；感知包括传感器的信息采集、协同处理、智能组网，甚至信息服务，以达到控制、指挥的目的。

智能合约是由事件驱动、具有约束力、获得多方承认、运行在可信共享的区块链之上，并能在满足条件时自动处理资产的程序。

Flash ROM 是非易失性存储器，断电后信息不会丢失，高电压可写、低电压可读。或非型（NOR）Flash 可用作内存储器（例如存储 BIOS 程序的 Flash 存储器）；与非型（NAND）Flash 可用于数码相机存储卡、固态硬盘、U 盘、智能手机的机身存储等。

Fortran 用于数值计算；VBA 用于编写程序以扩展 Office 的功能；VBScript 可嵌入 HTML 文档以扩展网页的功能；Java 用于网络编程；C# 用于编写安卓智能手机的 App；Object-C 是 iPhone 和 iPad 的编程语言；Lisp 与 PROLOG 主要用于人工智能；Ada 用于飞行器控制；MATLAB 是面向向量和矩阵运算的数值计算语言。

乐谱在计算机中既不用简谱也不用五线谱表示，而是使用一种叫作 MIDI 的音乐描述语言。MIDI 是计算机和数字乐器使用的音乐描述语言，它不仅规定了乐谱的二进制数字表示方法，还规定了演奏控制器、音源、计算机等相互连接的通信规程。MIDI 规定：乐谱中的音符及其定时、速度、音色等采用 MIDI 消息描述，每个 MIDI 消息描述一个音乐事件，一首乐曲所对应的全部 MIDI 消息组成一个 MIDI 文件。

128 位 = 16 字节（128 ÷ 8）。

只有部分安全软件是免费、开源的，绝大部分并不开源。$kp$, section = '' where id = 21880;
update t_knowledge_point set title = $kp$处理器、微处理器与并行处理$kp$, content = $kp$处理器：能高速地进行算术运算和逻辑运算，负责对输入信息进行各种处理的部件。

微处理器：简称 μP 或 MP，通常指使用单片大规模集成电路制成的、具有运算和控制功能的处理器。

并行处理和多处理器系统：使用多个 CPU（中央处理器，2、4、8 个或更多）实现超高速计算的技术称为“并行处理”，采用这种技术的计算机系统称为“多处理器系统”。$kp$, section = '' where id = 21887;
update t_knowledge_point set title = $kp$CPU 的定义与作用$kp$, content = $kp$CPU（中央处理器）是计算机的核心部件，是 PC 中不可缺少的组成部分，担负着运行系统软件和应用软件的任务。$kp$, section = '' where id = 21888;
update t_knowledge_point set title = $kp$CPU 的结构与主要部件$kp$, content = $kp$中央处理器主要由三个部分组成：

| 主要部件 | 功能 |
| --- | --- |
| 运算器 | 对数据进行各种算术运算和逻辑运算。运算器由 2 个处理整数的算术逻辑运算部件（ALU）和 1 个处理实数的浮点运算器组成，它们可以同时进行整数和实数运算。 |
| 控制器 | 取指令，解释指令的含义，产生控制其他部件的操作控制信号，记录内部状态。 |
| 寄存器组 | 临时存放参加运算的数据和得到的中间结果，由几十个寄存器组成。 |

为了加快指令处理速度，CPU 在执行当前指令的同时，可以用指令预取部件提前从主存或快存中取出一些准备执行的指令。CPU 采取“流水线”式的工作方式和结构，实现了“超标量结构”。$kp$, section = '' where id = 21889;
update t_knowledge_point set title = $kp$CPU 各组成部分的功能$kp$, content = $kp$CPU 主要由三个部分组成：

| 主要部件 | 功能 |
| --- | --- |
| 运算器 | 对数据进行各种算术运算和逻辑运算，也称为算术逻辑部件（ALU）。为加快运算速度，运算器中的 ALU 可能有多个，有的负责整数运算，有的负责实数（浮点数）运算，有的还能进行特殊运算处理。 |
| 控制器 | CPU 的指挥中心，协调机器各部件工作。它有一个指令计数器，用来存放 CPU 正在执行的指令的地址，CPU 按该地址从内存读取要执行的指令；多数情况下指令顺序执行，所以每执行一条指令后它就加 1（因而称为指令计数器或程序计数器）。控制器中还有一个指令寄存器，用来保存当前正在执行的指令，通过译码器解释该指令的含义，控制运算器的操作，记录 CPU 的内部状态等。 |
| 寄存器组 | 由十几个甚至几十个寄存器组成，速度很快，用来临时存放参加运算的数据和运算得到的中间（或最后）结果。需要运算器处理的数据总是预先从内存传送到寄存器；运算结果不再需要继续参加运算时，就从寄存器保存到内存。 |$kp$, section = '' where id = 21890;
update t_knowledge_point set title = $kp$江苏省专转本计算机大类新旧考试大纲对比$kp$, content = $kp$1. 新大纲课程 A1 计算机硬件；旧大纲课程 A（二）计算机硬件。
2. 新大纲课程 A1.1 计算机基本原理；旧大纲课程 A1 计算机基本原理。
3. 新大纲 A1.1.1 计算机发展及分类、软件概述、硬件概述（了解）；旧大纲 A（1）计算机发展及分类、软件概述、硬件概述（了解）。
4. 新大纲 A1.1.2 常见的输入设备和输出设备、中央处理器（了解）；旧大纲 A（2）常见的输入设备、常见的输出设备、中央处理器概述、奔腾处理器特点（了解）。
5. 新大纲 A1.1.3 计算机内存储器、外存储器概述，系统总线，I/O 总线（了解）；旧大纲 A（3）计算机分类，内存储器、外存储器概述，系统总线，I/O 总线（理解）。
6. 新大纲 A1.1.4 微处理器发展、字长、处理速度、指令与指令系统（了解）；旧大纲 A（4）微处理器发展、字长、处理速度、指令与指令系统、客户机与服务器概述（理解）。
7. 新大纲 A1.2 集成电路；旧大纲 A2 微电子技术。
8. 新大纲 A1.2.1 集成电路概念（了解）；旧大纲 A（1）集成电路的概念、集成电路发展与分类、IC 卡（了解）。
9. 新大纲 A1.2.2 集成电路发展与分类、IC 卡（了解）；旧大纲 A（2）集成电路制造封装形式、Moore 定律（熟悉）。
10. 新大纲 A1.3 PC 机组成；旧大纲 A2 PC 机组成。
11. 新大纲 A1.3.1 主板、芯片组、BIOS、内存储器概述，I/O 总线和 I/O 接口（了解）；旧大纲 A（1）内容相同（了解）。
12. 新大纲 A1.3.2 BIOS 组成及运行过程，内存储器 RAM 和 ROM 各种类型（了解）；旧大纲 A（2）内容相同（理解）。
13. 新大纲 A1.3.3 DDR SDRAM 各项参数、数据传输率计算、内存条封装形式（了解）；旧大纲 A（3）当前流行的 SDRAM、DDR SDRAM、RDRAM 各项参数、数据传输率计算、内存条封装形式（理解）。
14. 新大纲 A1.3.4 I/O 总线、I/O 操作方式、常用的几类 I/O 设备接口、I/O 总线带宽计算（了解）；旧大纲 A（4）内容相同（理解）。
15. 新大纲 A1.4 常用输入设备；旧大纲 A3 常用输入设备。
16. 新大纲 A1.4.1 键盘、鼠标、笔输入设备、扫描仪、数字摄像头概述（了解）；旧大纲 A（1）键盘、鼠标、笔输入设备、扫描仪、数码相机概述（了解）。
17. 新大纲 A1.4.2 键盘、鼠标的分类、工作原理、基本操作、采用的接口类型（了解）；旧大纲 A（2）内容相同（了解）。
18. 新大纲 A1.5 常用输出设备；旧大纲 A4 常用输出设备。
19. 新大纲 A1.5.1 常用输出设备的工作原理、主要分类、特点（了解）；旧大纲 A（1）内容相同（了解）。
20. 新大纲 A1.5.2 常用输出设备的主要性能参数、采用的接口类型（了解）；旧大纲 A（2）内容相同（理解）。
21. 新大纲 A1.6 外存储器；旧大纲 A5 外存储器。
22. 新大纲 A1.6.1 常用几类外存储器的工作原理、组成、分类情况、接口类型（了解）；旧大纲 A（1）内容相同（了解）。
23. 新大纲 A1.6.2 存储器存储结构、各项性能参数设置、数据分布、容量计算（了解）；旧大纲 A（2）内容相同（理解）。
24. 新大纲 A1.7 信息在计算机中的表示；旧大纲 A4 数字技术基础。
25. 新大纲 A1.7.1 信息表示单位、常用进制数、BCD 编码、传输速率单位（掌握）；旧大纲 A（1）内容相同（了解）。
26. 新大纲 A1.7.2 整数编码表示，8 位原码、补码和反码表示，实数编码表示，机器数、真值、数据溢出（掌握）；旧大纲 A（2）整数编码表示，原码、补码、反码，实数编码表示，机器数、真值、数据溢出。
27. 新大纲 A1.7.3 比特位逻辑运算，二、八、十、十六进制数之间的转换，进制数的运算，原码、反码与补码之间的转换，原码和补码表示数的范围（掌握）；旧大纲 A（3）内容相同（掌握）。
28. 新大纲 A2 计算机软件；旧大纲 A（三）计算机软件。
29. 新大纲 A2.1 软件基本概念；旧大纲 A1 软件基本概念。$kp$, section = '' where id = 21895;
update t_knowledge_point set title = $kp$CPU 的任务$kp$, content = $kp$CPU 的主要任务是执行指令，按指令的规定对数据进行操作。

工作过程：存储器存放数据和指令，中央处理器从存储器取出指令和数据，执行指令、处理数据，再把处理结果送回存储器保存。$kp$, section = '' where id = 22111;
update t_knowledge_point set title = $kp$CPU 的结构和任务$kp$, content = $kp$CPU 主要由运算器、控制器和寄存器组 3 个部分组成。

CPU 的任务：取指令并完成指令所规定的操作。$kp$, section = '' where id = 22112;
update t_knowledge_point set title = $kp$SQL 单表条件查询$kp$, content = $kp$查询语句的三个空依次为 SELECT、WHERE、AND。完整语句：

SELECT Sname
FROM Student
WHERE Sdept = '计算机系' AND Sage < 20;$kp$, section = '' where id = 22115;
update t_knowledge_point set title = $kp$CPU 的兼容性$kp$, content = $kp$不同公司生产的 CPU 产品一般互不兼容：

- Intel 公司：奔腾、赛扬、酷睿、灵动等；
- AMD 公司：毒龙、闪龙、炫龙等；
- IBM 公司：Power5、Power6、Power7 等；
- SUN 公司：Ultra SPARC 处理器；
- 英国 ARM 公司：ARM 处理器。

互不兼容：A 计算机的程序不能在 B 上直接运行，B 计算机的程序也不能在 A 上直接运行。

同一公司同一系列的 CPU 具有向下兼容性：使用新型号 CPU 的计算机 A 的程序不能在使用老型号 CPU 的计算机 B 上运行，B 计算机的程序却能在 A 计算机上运行。

平板电脑和智能手机与 PC 不兼容。$kp$, section = '' where id = 22138;
update t_knowledge_point set title = $kp$处理器与中央处理器的区别$kp$, content = $kp$现代计算机中一般包含多个（微）处理器，它们各有不同的分工和任务：用于执行系统软件和应用软件的处理器称为 CPU，CPU 是计算机必不可少的核心组成部件。

完成其他功能的处理器举例：

- 显卡包含的绘图处理器 GPU（用于加速图形绘制）；
- 声卡包含的 DSP（用于数字声音信号的处理）。

CPU 和 CPU 芯片是两个概念：

- CPU 是逻辑上的概念，强调的是功能；
- CPU 芯片是 IC 产品的概念，1 个 CPU 芯片可包含 1 个、2 个或更多个 CPU（称为内核），还可以包含 cache、存储控制器，甚至 GPU 等。

需根据上下文加以区别。$kp$, section = '' where id = 22143;
update t_knowledge_point set title = $kp$冯·诺依曼计算机的结构与原理$kp$, content = $kp$结构：输入设备把信息送入运算器和控制器（中央处理器），处理结果经输出设备输出；存储器存放程序和数据，与中央处理器之间传送指令和数据。

基本原理：

1. 计算机的工作由程序控制，程序是一个指令序列，指令是能被计算机理解和执行的操作命令；
2. 程序（指令）和数据均以二进制编码表示，均存放在存储器中；
3. 存储器中存放的指令和数据按地址进行存取；
4. 指令由 CPU 一条一条顺序执行。$kp$, section = '' where id = 22150;
update t_knowledge_point set title = $kp$存储程序控制原理$kp$, content = $kp$将问题的解算步骤编制成程序，程序连同它所处理的数据都用二进制表示，并预先存放在存储器中。程序运行时，CPU 从内存中一条一条地取出指令和相应的数据，按指令操作码的规定对数据进行运算处理，直到程序执行完毕。

① 任务启动时，执行该任务的程序和数据从外存成批传送到内存；
② CPU 从内存中逐条读取该程序的指令及相关的数据；
③ CPU 逐条执行指令，按指令要求完成对数据的运算和处理；
④ 将指令的运算处理结果送回内存保存；
⑤ 任务完成后，将处理得到的全部结果成批传送到外存以长久保存。$kp$, section = '' where id = 22166;
update t_knowledge_point set title = $kp$CPU 组成的判断题解析$kp$, content = $kp$CPU 由运算器、控制器和寄存器组构成，寄存器可以存放临时的指令、数据以及中间结果等，选项 A 正确。

CPU 是 PC 的核心部件，负责运行系统软件和应用软件的任务，选项 B 正确。

并不是所有 PC 的 CPU 都具有相同的指令系统，选项 C 错误。

PC 中至少有一个 CPU 芯片，可以是单核心或多核心（由多个 CPU 内核集成到一块 CPU 芯片上），选项 D 正确。$kp$, section = '' where id = 22207;
update t_knowledge_point set title = $kp$处理器的定义与特点$kp$, content = $kp$能高速执行指令，完成二进制数据的算术或逻辑运算和数据传送等操作的部件称为处理器（processor）。其特点是：由数字电路组成，结构非常复杂；所有电路都制作在大规模集成电路芯片上（仅几个平方厘米），称为“微处理器”（microprocessor），如 Intel 4004、Intel 8080 等芯片。$kp$, section = '' where id = 22241;
update t_knowledge_point set title = $kp$传感器$kp$, content = $kp$传感器（sensor/transducer）是一种检测装置，能自动检测设备自身和周边环境的信息；它是一种换能器，能将检测到的信息变换成电信号供计算机处理。$kp$, section = '' where id = 24123;
update t_knowledge_point set title = $kp$环境光感应器$kp$, content = $kp$环境光感应器感知设备使用环境的光线明暗，自动调整屏幕的显示亮度，可以延长电池工作时间，对保护眼睛也有利。$kp$, section = '' where id = 24984;
update t_knowledge_point set title = $kp$中央处理器的特点$kp$, content = $kp$- 一台计算机往往有多个处理器，其中承担系统软件和应用软件运行任务的中央处理器（CPU）必不可少。
- CPU 可以直接访问寄存器、Cache、内存、VRAM、BIOS；不同的 CPU 配用不同的芯片组。
- 负责对输入信息进行各种处理（计算、排序、分类、检索）的部件是处理器，如微处理器 CPU、DSP。
- 处理器能高速执行指令，完成二进制数据的算术运算、逻辑运算和数据传送操作。
- 处理器由数字电路组成。
- 计算机可以包含单个或几十个、甚至几百几千个 CPU 内核。CPU 芯片是物理上可见的实体，CPU 强调的是逻辑上的功能模块；多核指 1 个 CPU 芯片内有多个 CPU 内核。
- 使用多个 CPU 实现高速处理的技术称为并行处理，采用这种技术的系统称为多处理器系统。
- CPU 的根本任务是执行指令，按指令的要求完成对数据的基本运算和处理。
- 同一公司同一系列的 CPU 具有向下兼容性（高版本支持低版本），低版本未必支持高版本。
- Core i7、i5、i3 内核结构相同，内核数量、缓冲容量和 CPU 性能不同。$kp$, section = '' where id = 25202;
update t_knowledge_point set title = $kp$CPU 的内部组成$kp$, content = $kp$1. 寄存器组（GPR）

- 由几十个到几百个寄存器组成；
- 速度很快，是 CPU 内部最快的存储部件；
- 用来暂时存放参与运算的数据和运算得到的中间或最后结果；
- 需要运算器处理的数据预先从内存传送到寄存器，运算结果不再参加运算时从寄存器送到内存。

2. 运算器

- 也称算术逻辑部件（ALU）；
- 用来对二进制数据进行加、减、乘、除以及与、或、非等算术、逻辑运算；
- 参加运算的数据来自寄存器，运算结果也送到寄存器保存；
- 运算器中 ALU 可以有多个，有的负责整数运算，有的负责实数（浮点数）运算，还有的做特殊运算处理；
- 状态寄存器用于保存算术、逻辑运算的结果状态，属于运算器。

3. 控制器

- CPU 的指挥中心，基本功能是协调各部件工作；
- 指令计数器（程序计数器）：存放 CPU 正在执行的指令的内存地址，CPU 按该地址从内存读取要执行的指令；指令顺序执行，每执行一条指令后指令计数器加 1；
- 指令寄存器：保存当前正在执行的指令；
- 指令译码器：分析指令的含义（分析指令操作码以确定要执行什么操作），控制运算器的操作，记录 CPU 的内部状态。$kp$, section = '' where id = 25206;
update t_knowledge_point set title = $kp$CPU 的核心、定义与组成$kp$, content = $kp$核心思想：冯·诺依曼的存储程序控制。

定义：承担系统软件和应用软件运行任务的处理器。

组成：

- 运算器：算术运算（加、减、乘、除）与逻辑运算（与、或、非）；
- 控制器：指令计数器存放正在执行指令的地址，每执行一条指令加 1；指令寄存器保存当前正在执行的指令；
- 寄存器组：暂存待处理的数据；
- 指令系统。

CPU 通过 CPU 总线与其他部件连接。$kp$, section = '' where id = 25331;
update t_knowledge_point set title = $kp$报文交换的缺点$kp$, content = $kp$报文交换的缺点：

① 只适用于数字信号。
② 报文长度没有限制，每个中间结点都要完整地接收传来的整个报文；当输出线路不空闲时，还可能要存储几个完整报文等待转发，要求网络中每个结点有较大的缓冲区。为了降低成本、减少结点的缓冲存储器容量，有时要把等待转发的报文存在磁盘上，进一步增加了传送时延。$kp$, section = '' where id = 25575;
update t_knowledge_point set title = $kp$SQL 条件查询$kp$, content = $kp$语法：SELECT * FROM 表名 [[AS] 别名] WHERE 复合条件表达式；

实例：

SELECT * FROM t_student AS S WHERE S.ID = 'SZ1000001';

SELECT * FROM t_student WHERE ID = 'SZ1000001';$kp$, section = '' where id = 25769;
update t_knowledge_point set title = $kp$自动编码器$kp$, content = $kp$自动编码器是一种前馈神经网络，其目标是在输出端重建输入信号。$kp$, section = '' where id = 26144;
update t_knowledge_point set title = $kp$常见的输入设备、输出设备与中央处理器$kp$, content = $kp$1）输入设备：键盘、鼠标、触摸屏、麦克风、传感器、摄像头、扫描仪、条形码阅读器、光学字符阅读器、手写笔、数码相机、光笔、手写输入板、游戏杆、语音输入装置等。

2）输出设备：显示器、打印机、绘图仪、声音输出设备（音箱或耳机）、视频投影仪、影像输出系统、语音输出系统、磁记录设备等。

3）中央处理器：对输入信息进行处理（计算、分类、转换、识别、检索等）。常见的处理器系列有 ARM、x86/Atom、MIPS、PowerPC，以及实时性（Real Time）DSP 架构。$kp$, section = '' where id = 26694;
update t_knowledge_point set title = $kp$硬件驱动程序的手动安装$kp$, content = $kp$手动安装一般有三种情况：

- 使用安装程序。有些硬件如扫描仪、数码相机、手写板等都有厂商提供的安装程序，名称通常是 setup.exe 或 Install.exe。先把硬件连接到计算机上，再运行安装程序，按窗口提示的步骤操作即可。
- 使用安装向导。在“控制面板”窗口中有计算机的设备列表，如打印机、调制解调器、显示适配器等，双击这些设备的图标，打开的窗口中都包含该设备的安装向导，按提示进行安装。
- 使用“控制面板”中的“添加硬件”向导安装驱动程序。双击“添加硬件”图标，打开“添加硬件向导”对话框，具体设置过程因硬件不同而略有差异，按提示安装即可。$kp$, section = '' where id = 27013;
update t_knowledge_point set title = $kp$CPU 是 PC 最核心的部件$kp$, content = $kp$CPU 是 PC 最核心的部件。$kp$, section = '' where id = 27063;
update t_knowledge_point set title = $kp$电路的高、低电平与二进制$kp$, content = $kp$电路的高电平状态或低电平状态在 CPU 中用来表示二进制的 1 和 0。$kp$, section = '' where id = 27065;
update t_knowledge_point set title = $kp$运算器（ALU）$kp$, content = $kp$运算器（ALU）对数据进行算术运算和逻辑运算。$kp$, section = '' where id = 27169;
update t_knowledge_point set title = $kp$控制器（CU）的功能$kp$, content = $kp$控制器（CU，控制单元）取指令并保存，解释指令的功能，由此产生控制各部件工作的信号，执行指令。

① 指令计数器：用来存放 CPU 正在执行的指令的地址（不是用来计算执行指令的条数）。
② 指令寄存器：用来保存当前正在执行的指令。$kp$, section = '' where id = 27170;
update t_knowledge_point set title = $kp$寄存器组与多核、多处理器系统$kp$, content = $kp$寄存器组（GPR）临时存放在 ALU 中运算的数据和运算结果。

多核：一个 CPU 芯片里面有多个 CPU（内核）。

并行处理和多处理器系统：采用多个 CPU 实现超高计算的技术称为“并行处理”，采用这种技术的计算机系统称为“多处理器系统”。“多处理器系统”特指有多个 CPU 的计算机系统。$kp$, section = '' where id = 27171;
update t_knowledge_point set title = $kp$查询男学生及其选修课程$kp$, content = $kp$查询每个男学生及其选修课程的情况，列出学生名、系别、选修课程名及成绩：

SELECT SNAME, DEPART, CNAME, GRADE
FROM S, C, SC
WHERE S.SNO = SC.SNO AND SC.CNO = C.CNO AND S.SEX = '男';$kp$, section = '' where id = 27254;
update t_knowledge_point set title = $kp$控制器与指令计数器$kp$, content = $kp$控制器（CU，控制单元）取指令并保存，解释指令的功能，由此产生控制各部件工作的信号，执行指令。

① 指令计数器：用来存放 CPU 正在执行的指令的地址（不是用来计算执行指令的条数）。
② 指令寄存器：用来保存当前正在执行的指令。$kp$, section = '' where id = 28017;
update t_knowledge_point set title = $kp$寄存器组、多核与并行处理$kp$, content = $kp$寄存器组（GPR）临时存放在 ALU 中运算的数据和运算结果。

多核指的是一个 CPU 芯片里面有多个 CPU（内核）。

采用多个 CPU 实现超高计算的技术称为“并行处理”，采用这种技术的计算机系统称为“多处理器系统”。“多处理器系统”特指有多个 CPU 的计算机系统。$kp$, section = '' where id = 28018;
update t_knowledge_point set title = $kp$CPU 系统时钟的来源$kp$, content = $kp$CPU 运行时的系统时钟及各种与其同步的时钟由主板上的时钟发生器提供，而不是由 CPU 内部控制器提供。$kp$, section = '' where id = 28041;
update t_knowledge_point set title = $kp$数据的逻辑结构$kp$, content = $kp$常见的逻辑结构：

① 集合结构：数据元素同属于一个集合；
② 线性结构：数据元素按先后次序连接；
③ 树形结构：分支、层次，像树，数据元素之间存在一对多的关系；
④ 网状结构：数据元素之间有各种复杂的连接，存在多对多的关系。

数据的存储结构是数据的逻辑结构在计算机存储器中的实现。$kp$, section = '' where id = 28103;
update t_knowledge_point set title = $kp$控制器的作用及内部寄存器$kp$, content = $kp$控制器（控制单元，CU）取指令并保存，解释指令的功能，由此产生控制各部件工作的信号，执行指令。

① 指令计数器：用来存放 CPU 正在执行的指令的地址（不是用来计算执行指令的条数）。
② 指令寄存器：用来保存当前正在执行的指令的内容。$kp$, section = '' where id = 28240;
update t_knowledge_point set title = $kp$寄存器组（GPR）的作用$kp$, content = $kp$寄存器组（GPR）临时存放在 ALU 中运算的数据和运算结果（中间结果或最终结果）。

CPU 组成中最重要的是运算器和控制器，即使不说寄存器组也是正确的；寄存器的速度很快，是 CPU 内部最快的存储部件。$kp$, section = '' where id = 28241;
update t_knowledge_point set title = $kp$计算机感染病毒的途径$kp$, content = $kp$计算机感染病毒的途径：电子邮件的附件、下载受病毒感染的程序。$kp$, section = '' where id = 28343;
update t_knowledge_point set title = $kp$指令计数器的作用$kp$, content = $kp$CPU 中的指令计数器（程序计数器）用来存放 CPU 正在执行的指令的地址，而不是用来统计已执行指令的条数。$kp$, section = '' where id = 28390;
update t_knowledge_point set title = $kp$二进制使逻辑运算与算术运算统一$kp$, content = $kp$二进制只有 0 和 1 两个数码，能够实现逻辑运算和数学运算的统一。$kp$, section = '' where id = 28596;
update t_knowledge_point set title = $kp$Web1.0 与 Web2.0 的区别$kp$, content = $kp$| 项目 | Web 1.0 | Web 2.0 |
| --- | --- | --- |
| 页面风格 | 结构复杂，页面繁冗 | 页面简洁，风格流畅 |
| 个性化程度 | 垂直化、大众化 | 个性化突出，强调自我品牌 |
| 用户体验 | 低参与度，被动接受 | 高参与度，互动接受 |
| 通讯程度 | 信息闭塞，知识程度低 | 信息灵通，知识程度高 |
| 感性程度 | 追求物质性价值 | 追求精神性价值 |
| 功能性 | 实用，追求功能性利益 | 体验，追求情感性利益 |$kp$, section = '' where id = 28618;
update t_knowledge_point set title = $kp$CPU 取指取数并完成运算处理的过程$kp$, content = $kp$计算机工作时，CPU 从内存取出指令和数据，按机器指令的规定对数据进行运算处理，直到程序完成为止。$kp$, section = '' where id = 28634;
update t_knowledge_point set title = $kp$CPU 是承担软件运行任务的微处理器$kp$, content = $kp$大多数计算机中只包含一个 CPU，CPU 是专门承担系统软件和应用软件运行任务的微处理器。$kp$, section = '' where id = 28716;
update t_knowledge_point set title = $kp$存储程序与程序控制原理$kp$, content = $kp$到目前为止，计算机系统的工作原理是“存储程序与程序控制”理论，由匈牙利数学家冯·诺依曼提出。$kp$, section = '' where id = 28719;
update t_knowledge_point set title = $kp$CPU 由寄存器、运算器和控制器组成$kp$, content = $kp$CPU 主要由三个部分组成：寄存器（几十个，临时存储中间数据或结果）；运算器（即 ALU，可做算术和逻辑运算）；控制器（CPU 的大脑，用来解释指令的含义、控制运算器的操作、记录内部状态）。$kp$, section = '' where id = 28720;
update t_knowledge_point set title = $kp$并发是多个程序轮流获得时间片执行的机制$kp$, content = $kp$“并发”是指一个 CPU 执行多个程序时，这些程序轮流得到 CPU 的时间片而获得执行的机制。$kp$, section = '' where id = 28761;
update t_knowledge_point set title = $kp$CPU 的一级缓存与二级缓存$kp$, content = $kp$L1 cache 为一级缓存，L2 cache 为二级缓存。

缓存集成在 CPU 内部，CPU 可以直接访问缓存。一级缓存的速度和 CPU 速度一样，二级缓存速度是 CPU 速度的一半，主要与内存交换数据。一级缓存大小一般只有几十 KB，二级缓存一般是几百 KB 到几 MB。

CPU 访问缓存使用的是命中率，缓存越大，命中率越高，但并不表示 CPU 性能越好。$kp$, section = '' where id = 28768;
update t_knowledge_point set title = $kp$I/O 控制器与常见输入输出设备接口$kp$, content = $kp$I/O 控制器（input 和 output）负责输入输出控制。

常见输入设备：鼠标、键盘、扫描仪、数码相机、摄像头。

常见输出设备：显示器、打印机、绘图仪。

常用接口：串行口 COM（9 针）；并行口 LPT1（接打印机）；VGA 口（接显示器）；PS/2 口（接鼠标、键盘）；USB 高速通用串行接口，可接鼠标、键盘、外置光驱、U 盘、打印机等，有 1.1 和 2.0 两种类型，1.1 全速速率为 12Mb/s（约 1.5MB/s）。$kp$, section = '' where id = 28779;
update t_knowledge_point set title = $kp$查询指定列的全部记录$kp$, content = $kp$语法：SELECT 属性名 1 [AS] 别名 1，属性名 2 [AS] 别名 2，…… FROM 表名 [[AS] 别名];

实例：

SELECT sName AS 姓名, sAge 年龄
FROM t_student;$kp$, section = '' where id = 28794;
update t_knowledge_point set title = $kp$多表连接查询实例$kp$, content = $kp$实例：

SELECT A.id AS ID, A.name AS Name, A.age AS Age, B.name AS Grade
FROM t_students AS A, t_grade AS B
WHERE A.class = B.id;

或

SELECT A.id AS ID, A.name AS Name, A.age AS Age, B.name AS Grade
FROM t_students AS A
INNER JOIN t_grade AS B
ON A.class = B.id;$kp$, section = '' where id = 28797;
update t_knowledge_point set title = $kp$ANY 关键字子查询$kp$, content = $kp$语法关键字：ANY。

实例：

SELECT age
FROM tb1
WHERE age > ANY (SELECT age FROM tb2);

同类还有 ALL 关键字的子查询。$kp$, section = '' where id = 28800;
update t_knowledge_point set title = $kp$相关子查询的执行过程$kp$, content = $kp$执行过程：

① 首先执行外查询 SELECT * FROM A，然后从外查询的数据中取出一条数据传给内查询。
② 内查询执行 SELECT * FROM B，外查询传入的数据与内查询获得的数据根据 WHERE 后面的条件做匹配，如果存在数据满足 A.ID = B.ID 则返回 TRUE，如果一条都不满足则返回 FALSE。
③ 内查询返回 TRUE，则外查询的这行数据保留；反之返回 FALSE 则外查询的这行数据不显示。外查询的所有数据逐行查询匹配。$kp$, section = '' where id = 28802;
update t_knowledge_point set title = $kp$总线拓扑结构的缺点$kp$, content = $kp$总线拓扑结构的缺点：① 故障检测需要在网上的各个站点上进行；② 在扩展总线的干线长度时，需重新配置中继器、剪裁电缆、调整终端器等；③ 总线上的站点需要介质访问控制功能，这就增加了站点的硬件和软件费用。$kp$, section = '' where id = 28807;
update t_knowledge_point set title = $kp$二进制的物理实现简单$kp$, content = $kp$二进制的物理实现简单，这是计算机采用二进制的原因之一。$kp$, section = '' where id = 28838;
update t_knowledge_point set title = $kp$运算器及其数量对 CPU 性能的影响$kp$, content = $kp$运算器（ALU）对数据进行算术、逻辑运算。为了加快运算速度，运算器中的 ALU 可能有多个，ALU 越多 CPU 的性能越好。$kp$, section = '' where id = 28839;
update t_knowledge_point set title = $kp$基本设备指键盘、鼠标、显示器和硬盘$kp$, content = $kp$基本设备指的是键盘、鼠标、显示器、硬盘；打印机、扫描仪不属于基本设备。$kp$, section = '' where id = 28853;
update t_knowledge_point set title = $kp$操作系统的主要功能$kp$, content = $kp$操作系统的主要功能包括：多任务与处理器管理、存储管理、文件管理（对外存的管理）、设备管理、安全管理、通信管理。$kp$, section = '' where id = 28874;
update t_knowledge_point set title = $kp$CPU 调度程序按时间片轮转分配 CPU 时间$kp$, content = $kp$CPU 调度程序负责将 CPU 的时间分配给各个程序，采用的是“时间片”轮转策略。$kp$, section = '' where id = 28875;
update t_knowledge_point set title = $kp$不同程序获得 CPU 使用权的优先级有区别$kp$, content = $kp$不同程序的重要性不完全一样，它们获得 CPU 使用权的优先级也有区别。$kp$, section = '' where id = 28876;
update t_knowledge_point set title = $kp$关系的连接运算$kp$, content = $kp$连接（join）：两个关系通过相同的属性连接成一个新的关系，连接属于二元操作。

关系 R：

| 学号 | 准考证号 | 姓名 | 性别 |
| --- | --- | --- | --- |
| 1006 | 1314300106 | 胡晓明 | 男 |
| 1007 | 1314300107 | 刘荣 | 女 |
| 1008 | 1314300108 | 李素雅 | 女 |
| 1009 | 1314300109 | 赵海涛 | 男 |
| 1010 | 1314300110 | 陶文慧 | 女 |

关系 S：

| 学号 | 出生日期 | 入学成绩 |
| --- | --- | --- |
| 1006 | 1983-4-6 | 521 |
| 1007 | 1983-10-31 | 471 |
| 1008 | 1983-7-8 | 478 |
| 1009 | 1984-9-20 | 623 |
| 1010 | 1983-7-30 | 599 |

连接结果：

| 学号 | 准考证号 | 姓名 | 性别 | 出生日期 | 入学成绩 |
| --- | --- | --- | --- | --- | --- |
| 1006 | 1314300106 | 胡晓明 | 男 | 1983-4-6 | 521 |
| 1007 | 1314300107 | 刘荣 | 女 | 1983-10-31 | 471 |
| 1008 | 1314300108 | 李素雅 | 女 | 1983-7-8 | 478 |
| 1009 | 1314300109 | 赵海涛 | 男 | 1984-9-20 | 623 |
| 1010 | 1314300110 | 陶文慧 | 女 | 1983-7-30 | 599 |$kp$, section = '' where id = 28882;
update t_knowledge_point set title = $kp$衡量计算机性能的中央处理器$kp$, content = $kp$衡量一台计算机的好坏主要看中央处理器 CPU，一台计算机可以有多个中央处理器。

CPU 的组成：运算器（算术运算与逻辑运算）、控制器（译码、取指、记录指令）、寄存器（速度最快，Cache 次之）。

决定硬件性能的因素：晶体管数量（关键）、处理器架构、硬件指令集、工作频率（主频）。$kp$, section = '' where id = 28901;
update t_knowledge_point set title = $kp$时间片轮转与虚拟内存$kp$, content = $kp$CPU 管理：时间片轮转使多个任务同时工作。其意义是把 CPU 的工作时间分成若干个时间片，分别执行各个任务。

虚拟内存就是把硬盘上暂时不用的空间当作内存使用。虚拟存储系统能够为用户提供一个容量很大的虚拟空间，其大小受到外存容量和 CPU 地址表示范围的限制。操作系统中，虚拟存储器容量大于实际内存。虚拟内存的大小可以由用户自己设定。

虚拟存储器采用的页面调度算法：随机算法、先进先出算法、近期最少使用算法和最优算法。$kp$, section = '' where id = 28917;
update t_knowledge_point set title = $kp$数据结构的研究内容$kp$, content = $kp$内容包括：

1）数据的逻辑结构：用于抽象地反映数据元素之间的约束关系，而不考虑其在计算机中的存储方式。
2）数据的物理存储结构：数据的逻辑结构在计算机存储器上的实现。
3）数据的运算。$kp$, section = '' where id = 28964;
update t_knowledge_point set title = $kp$局域网常用的拓扑结构$kp$, content = $kp$局域网中常用的拓扑结构：① 总线型结构；② 环形结构；③ 星形结构。$kp$, section = '' where id = 29342;
update t_knowledge_point set title = $kp$冯·诺依曼计算机的结构与原理$kp$, content = $kp$结构 = 输入 + 处理 + 输出。

原理：存储程序控制原理。

真正实现存储程序控制原理的计算机是 EDSAC（1949 年），并非冯·诺依曼设计。$kp$, section = '' where id = 30118;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21878,21880,21887,21888,21889,21890,21895,22111,22112,22115,22138,22143,22150,22166,22207,22241,24123,24984,25202,25206,25331,25575,25769,26144,26694,27013,27063,27065,27169,27170,27171,27254,28017,28018,28041,28103,28240,28241,28343,28390,28596,28618,28634,28716,28719,28720,28761,28768,28779,28794,28797,28800,28802,28807,28838,28839,28853,28874,28875,28876,28882,28901,28917,28964,29342,30118) and not deleted) <> 66 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
