-- 知识点 42 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_42
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_42 as
select * from t_knowledge_point where id in (21813,21846,21848,21858,21859,21861,21921,21926,21947,21986,21987,21991,22009,22017,22070,22128,22147,22148,22151,22152,22164,22167,22206,22212,22485,26695,27175,27176,27177,27178,27198,27200,27201,27202,27214,27219,27221,27240,27256,27273,27276,27292,27293,28019,28028,28030,28031,28048,28083,28084,28085,28090,28235,28236,28247,28255,28262,28268,28388,28474,28475,28489,28491,28494,28621,28653,28656,28658,28677,28718,28729,28733,28734,28753,28757,28770,28780,28821,28842,28857,28861);

update t_knowledge_point set title = $kp$内存储器与辅助存储器的比较$kp$, content = $kp$| | 内存储器（简称内存或主存） | 辅助存储器（俗称外存，简称辅存） |
| --- | --- | --- |
| 存取速度 | 很快 | 相对较慢 |
| 存储容量 | 相对较小（因单位成本较高） | 很大（因单位成本较低） |
| 性质 | 按字节编址和访问，断电后信息消失 | 按数据块编址和访问，断电后信息保持 |
| 用途 | 存放已经启动运行的程序和需要立即处理的数据 | 长期存放计算机系统中几乎所有的信息 |
| 与 CPU 的关系 | CPU 所处理的指令及数据直接从内存中取出 | 程序及相关数据必须先送入内存后才能被 CPU 使用 |$kp$, section = '' where id = 21813;
update t_knowledge_point set title = $kp$按层次划分总线$kp$, content = $kp$总线分为内部总线、系统总线和外部总线。内部总线指微机内部各外围芯片与处理器之间的总线，用于芯片一级的互连。系统总线指连接 CPU、存储器和各种 I/O 模块等主要部件的总线，用于插件板一级的互连；由于这三个部件互连时的作用不同，系统总线又包括 CPU 总线、存储器总线和 I/O 总线。外部总线则是微机和外部设备之间的总线。$kp$, section = '' where id = 21846;
update t_knowledge_point set title = $kp$总线的参数与带宽计算$kp$, content = $kp$总线的参数：数据通路宽度、总线工作频率、每秒传输次数。

总线带宽（最高传输速率）＝（数据通路宽度/8）×总线工作频率×每秒传输次数。

总线的类型：

- CPU 总线（前端总线 FSB）
- 存储器总线
- I/O 总线（目前使用的是 PCI 和 PCI-E 两种），对应主板上的两种扩充插槽：PCI 插槽、PCI-E 插槽。$kp$, section = '' where id = 21848;
update t_knowledge_point set title = $kp$辅助存储器的特点$kp$, content = $kp$1. 存取速度慢、容量相对大、价格相对低。
2. 不直接与 CPU 相连接，CPU 不能直接访问，其中存储的程序及相关数据必须先送入内存，才能被 CPU 使用。$kp$, section = '' where id = 21858;
update t_knowledge_point set title = $kp$总线的概念$kp$, content = $kp$总线的英文名字是 bus，它指的是计算机各部件之间传输信息的一组公用信号线。采用总线结构便于部件和设备的扩充，使用统一的总线标准，不同设备间互连将更容易实现。$kp$, section = '' where id = 21859;
update t_knowledge_point set title = $kp$存储器的概念$kp$, content = $kp$存储器是存储程序和数据（包括原始数据、中间运算结果与最终结果等）的部件。计算机包括两大存储体系，分别是内存储器和外存储器，它们各有不同的特点和功能。$kp$, section = '' where id = 21861;
update t_knowledge_point set title = $kp$按传输信号划分总线$kp$, content = $kp$不管是何种层次的总线，都传输三类信号：数据信号、地址信号、控制信号，相应地都具备数据总线、地址总线和控制总线。$kp$, section = '' where id = 21921;
update t_knowledge_point set title = $kp$内存与外存的功能比较$kp$, content = $kp$内存储器（简称内存或主存）：
① 存取速度快、容量相对小、价格相对高，一般使用 DRAM 芯片组成，速度大约比 CPU 慢 10 倍。
② 直接与 CPU 相连接，CPU 可直接访问。
③ 易失性，用于临时存放 CPU 正在运行的程序、正被处理的数据以及产生的结果数据。
④ 存储介质为半导体芯片。

外存储器（简称外存或辅存）：
① 存取速度慢、容量相对大、价格相对低。
② 不直接与 CPU 相连接，CPU 不能直接访问，其中存储的程序及相关数据必须先送入内存，才能被 CPU 使用。
③ 非易失性，用于长期存放各类信息。
④ 存储介质为磁盘、光盘、磁带等。$kp$, section = '' where id = 21926;
update t_knowledge_point set title = $kp$系统总线的性能指标$kp$, content = $kp$① 总线的带宽：单位时间内总线上可传送的数据量。
② 总线的位宽：总线能同时传送的数据位数。
③ 总线的工作频率：工作频率越高，总线工作速度越快，总线带宽越宽。
④ 总线带宽（MB/s）＝总线位宽/8×总线工作频率。$kp$, section = '' where id = 21947;
update t_knowledge_point set title = $kp$按总线标准划分总线$kp$, content = $kp$内部总线制定的标准有 I2C 总线、SPI 总线、SCI 总线。

系统总线制定的标准有 ISA 总线、EISA 总线、PCI 总线、Compact PCI 总线，目前微机中流行的系统总线标准是 PCI 总线。ISA 总线的位宽是 16 位，PCI 总线的位宽有 32 位和 64 位两种。

外部总线制定的标准有 RS-232-C 总线、IEEE-488 总线、USB 总线。$kp$, section = '' where id = 21986;
update t_knowledge_point set title = $kp$按能否连接多个设备划分总线$kp$, content = $kp$总线式：可连接多个设备，被多个设备共享。
独占式：只能连接 1 个设备。$kp$, section = '' where id = 21987;
update t_knowledge_point set title = $kp$存储器的功能与分类$kp$, content = $kp$功能：储存以二进位形式表示的程序和数据。

分类：内存储器、辅助存储器。$kp$, section = '' where id = 21991;
update t_knowledge_point set title = $kp$虚拟存储器$kp$, content = $kp$如果一个作业的部分内容装入主存便可开始启动运行，其余部分暂时留在磁盘上，需要时再装入主存，这样就可以有效地利用主存空间。从用户角度看，该系统所具有的主存容量将比实际主存容量大得多，这样的存储器称为虚拟存储器。虚拟存储器是为了扩大主存容量而采用的一种设计方法，其容量由计算机的地址结构决定，实现虚拟存储器既需要硬件，也需要软件。$kp$, section = '' where id = 22009;
update t_knowledge_point set title = $kp$Cache 的作用与组成$kp$, content = $kp$Cache（高速缓冲存储器）是一种特殊的存储器子系统，其中复制了频繁使用的数据以利于快速访问。Cache 的出现基于两种原因：一是 CPU 的速度和性能提高很快，而主存速度较低且价格高；二是程序执行的局部性特点。因此，用速度较快而容量有限的 SRAM 构成 Cache，目的在于尽可能发挥 CPU 的高速性能。$kp$, section = '' where id = 22017;
update t_knowledge_point set title = $kp$单总线、双总线与三总线结构$kp$, content = $kp$1. 单总线结构
将 CPU、主存、I/O 设备（通过 I/O 接口）都挂在一组总线上，允许 I/O 设备之间、I/O 设备与主存之间直接交换信息。CPU 与主存、CPU 与外设之间可以直接进行信息交换，而无须经过中间设备的干预。
注意：单总线并不是指只有一根信号线，系统总线按传送信息的不同可细分为地址总线、数据总线和控制总线。
优点：结构简单，成本低，易于接入新的设备。
缺点：带宽低、负载重，多个部件只能争用唯一的总线，且不支持并发传送操作。

2. 双总线结构
一条是主存总线，用于 CPU、主存和通道之间进行数据传送；另一条是 I/O 总线，用于多个外部设备与通道之间进行数据传送。
优点：将低速的 I/O 设备从单总线上分离出来，实现存储总线和 I/O 总线分离。
缺点：需要增加通道等硬件设备。

3. 三总线结构
在计算机系统各部件之间采用 3 条各自独立的总线构成信息通路，分别为主存总线、I/O 总线和直接内存访问 DMA 总线。
主存总线用于 CPU 和内存之间传送地址、数据和控制信息；I/O 总线用于 CPU 和各类外设之间通信；DMA 总线用于内存和高速外设之间直接传送数据。
优点：提高了 I/O 设备的性能，使其更快地响应命令，提高系统吞吐量。
缺点：系统工作效率较低。$kp$, section = '' where id = 22070;
update t_knowledge_point set title = $kp$主存储器的功能与原理$kp$, content = $kp$主存是 CPU 可直接访问的存储器，用于存放供 CPU 处理的指令和数据。

特点：
- 以字节为单位进行连续编址，每个存储单元为 1 个字节（8 个二进位）。
- 存储容量：主存储器中所包含的存储单元的总数（单位 MB 或 GB）。
- 存取时间：从 CPU 送出内存单元的地址码开始，到主存读出数据并送到 CPU（或把 CPU 数据写入主存）所需要的时间，单位 ns，1 ns = 10⁻⁹ s。$kp$, section = '' where id = 22128;
update t_knowledge_point set title = $kp$总线的定义$kp$, content = $kp$总线是用于在 CPU、内存、外存和各种输入输出设备之间传输信息的一个共享的信息传输通路及其控制部件。$kp$, section = '' where id = 22147;
update t_knowledge_point set title = $kp$内存与外存的关系及比较$kp$, content = $kp$数据流动过程：
① 任务启动时，执行该任务的程序和数据将从辅存成批传送到内存；
② CPU 从内存中逐条读取该程序的指令及相关数据；
③ CPU 逐条执行指令，按指令要求完成对数据的运算和处理；
④ 将指令的运算处理结果送回内存保存；
⑤ 任务完成后，将处理得到的全部结果成批传送到辅存以长久保存。

辅助存储器（俗称外存，简称辅存）：存取速度慢，成本低，容量很大；按数据块编址和存取；不与 CPU 直接连接，运行程序时外存中的程序及相关数据必须先传送到内存，然后才能被 CPU 使用；属于非易失性存储器，用于长久存放系统中几乎所有的信息。

内存储器（简称内存或主存）：存取速度快，成本高，容量相对较小；按字节编址和存取；直接与 CPU 连接，CPU 可以对内存中的指令及数据进行读、写操作；大多属于易失性存储器，用于临时存放正在运行的程序和数据。$kp$, section = '' where id = 22148;
update t_knowledge_point set title = $kp$按连接对象划分总线$kp$, content = $kp$CPU 总线（或前端总线）：用于连接 CPU 和内存储器的总线。

I/O 总线：连接内存和 I/O 设备（包括外存）的总线。$kp$, section = '' where id = 22151;
update t_knowledge_point set title = $kp$总线的功能$kp$, content = $kp$用于连接 CPU、内存、辅存（外存）和各种 I/O 设备，并在它们之间传输信息的一组共享传输线及其控制电路。$kp$, section = '' where id = 22152;
update t_knowledge_point set title = $kp$存储器与 CPU 速度差距的影响$kp$, content = $kp$DRAM、硬盘与 CPU 之间的速度差距愈来愈大。由于 CPU 工作速度很快，内存速度比较慢（差 1～2 个数量级），从内存取数或向内存写数时，CPU 往往需要等待。$kp$, section = '' where id = 22164;
update t_knowledge_point set title = $kp$计算机存储器的层次结构$kp$, content = $kp$速度越快，成本越高。为了获得好的性能价格比，计算机中各种存储器组成一个层状的塔式结构，取长补短，协调工作。

工作过程：
1）CPU 运行时，需要的操作数大部分来自寄存器。
2）如需从存储器中取数或存数，先访问 cache，若在则取自 cache。
3）若操作数不在 cache，则访问 RAM，若在 RAM 中则取自 RAM。
4）若操作数不在 RAM，则访问硬盘，操作数从硬盘读出后送入 RAM，再送入 cache。$kp$, section = '' where id = 22167;
update t_knowledge_point set title = $kp$Cache 与主存的编址关系$kp$, content = $kp$Cache 的地址空间和主存的地址空间是映射关系，cache 和主存不统一编址，cache 的地址空间也不是主存的一部分。Cache 是介于 CPU 和主存储器之间的高速小容量存储器，因此它不属于主存的一部分。

选项 A 描述正确。使用 Cache 改善系统性能的依据是程序的局部性原理。

选项 B 描述不正确。cache 的地址与内存地址是两码事，不统一编址，也没有从属关系。

选项 C 描述正确。Cache 是介于 CPU 和主存之间的小容量存储器，存取速度比主存快，接近 CPU，能高速地向 CPU 提供指令和数据，提高程序的执行速度。Cache 技术是为了解决 CPU 和主存之间速度不匹配而采用的一项重要技术。

选项 D 描述正确。Cache 是主存的缓冲存储器，由高速 SRAM 组成，所有控制逻辑全部由硬件实现，对程序员而言是透明的。随着半导体器件集成度的不断提高，当前有些 CPU 已内置 Cache，并且出现了两级以上的多级 Cache 系统。$kp$, section = '' where id = 22206;
update t_knowledge_point set title = $kp$高速缓存 Cache 的作用$kp$, content = $kp$cache 是一种小容量高速缓冲存储器，由 SRAM 组成。cache 直接制作在 CPU 芯片内，速度几乎与 CPU 一样快。程序运行时，CPU 使用的一部分数据或指令会预先成批复制到 cache 中，cache 的内容是主存储器中部分内容的映像。当 CPU 需要从内存读写数据或指令时，先检查 cache 中有没有，若有则直接从 cache 中读取，而不用访问主存储器。$kp$, section = '' where id = 22212;
update t_knowledge_point set title = $kp$提高 Cache 命中率的方法$kp$, content = $kp$增大 cache 容量；采用多级 cache 技术（2 级或 3 级等）；cache 中采用快速的查找算法，判定是否命中；不能命中时，采用有效的算法将读入的内容替换 cache 中暂时不使用的内容；编译器优化目标程序；程序员编写 cache-friendly 的程序。$kp$, section = '' where id = 22485;
update t_knowledge_point set title = $kp$内存储器、外存储器与系统总线概述$kp$, content = $kp$1）内存储器：计算机的内存储器是指 ROM 和 RAM，它是外存与 CPU 进行沟通的桥梁，计算机中所有程序的运行都在内存中进行。内存性能的强弱影响计算机整体发挥的水平。内存也称内存储器和主存储器，用于暂时存放 CPU 中的运算数据以及与硬盘等外部存储器交换的数据。

2）外存储器：指除计算机内存及 CPU 缓存以外的储存器，此类储存器一般断电后仍然能保存数据。

3）系统总线：总线是连接各个部件的信息传输线，是各个部件共享的传输介质。总线结构的计算机举例：单总线结构框图、面向 CPU 的双总线结构框图、以存储器为中心的双总线结构框图。$kp$, section = '' where id = 26695;
update t_knowledge_point set title = $kp$Cache 的容量、级数与作用$kp$, content = $kp$Cache 的容量越大、级数越多，效果越显著。一般由 SRAM 芯片组成，存取速度快于主存、慢于 CPU。Cache 缓解了 CPU 和内存之间速度不匹配的问题。$kp$, section = '' where id = 27175;
update t_knowledge_point set title = $kp$Cache 的透明性$kp$, content = $kp$透明性指 Cache 不能由程序或程序员访问，不与主存统一编址。$kp$, section = '' where id = 27176;
update t_knowledge_point set title = $kp$Cache 的命中率$kp$, content = $kp$命中率指 CPU 需要的指令或数据在 Cache 中直接找到的概率。$kp$, section = '' where id = 27177;
update t_knowledge_point set title = $kp$Cache 数据的调入与局部性原理$kp$, content = $kp$Cache 中的数据是主存中部分内容的映射，数据调入 Cache 由硬件自动完成，无须人为干预，这里利用了程序的局部性原理来完成数据的拷贝。$kp$, section = '' where id = 27178;
update t_knowledge_point set title = $kp$内存的特点$kp$, content = $kp$内存存取速度快、容量小、成本高，大都是易失性存储器。$kp$, section = '' where id = 27198;
update t_knowledge_point set title = $kp$内存与外存存放内容的区别$kp$, content = $kp$内存中存放的是正在执行的程序和数据；外存中存放的是文件。$kp$, section = '' where id = 27200;
update t_knowledge_point set title = $kp$内存与外存的数据交换关系$kp$, content = $kp$内存中存放的是正在执行的程序和数据；外存不能直接和 CPU 交换数据；内存可以和 CPU 直接交换数据，内存也可以和外存直接交换数据。$kp$, section = '' where id = 27201;
update t_knowledge_point set title = $kp$内存容量与半导体芯片的分类$kp$, content = $kp$内存容量的大小不会影响 CPU 的速度，但属于计算机的性能指标之一。

半导体芯片分为随机存储器 RAM 和只读存储器 ROM。$kp$, section = '' where id = 27202;
update t_knowledge_point set title = $kp$存储管理与虚拟存储器$kp$, content = $kp$存储管理负责管理内存，虚拟存储器＝物理内存＋硬盘上的虚拟内存。$kp$, section = '' where id = 27214;
update t_knowledge_point set title = $kp$虚拟存储器的组成$kp$, content = $kp$虚拟存储器＝物理内存＋硬盘上的虚拟内存。$kp$, section = '' where id = 27219;
update t_knowledge_point set title = $kp$Windows 中虚拟内存的设置$kp$, content = $kp$在 Windows 中，用户可设置虚拟内存位于哪个硬盘逻辑盘上及其容量。$kp$, section = '' where id = 27221;
update t_knowledge_point set title = $kp$前端总线的作用$kp$, content = $kp$前端总线用于连接内存和 CPU，也用于连接显卡和内存。$kp$, section = '' where id = 27240;
update t_knowledge_point set title = $kp$剪贴板与回收站$kp$, content = $kp$剪贴板是内存中的一块区域；回收站是硬盘上存放被删除文件的一块空间。$kp$, section = '' where id = 27256;
update t_knowledge_point set title = $kp$剪贴板与回收站的区别$kp$, content = $kp$剪贴板是内存中的一块可读可写区域；回收站是硬盘上存放被删除文件的一块空间。$kp$, section = '' where id = 27273;
update t_knowledge_point set title = $kp$主机的组成$kp$, content = $kp$主机由 CPU、内存储器和总线组成。$kp$, section = '' where id = 27276;
update t_knowledge_point set title = $kp$地址线数目与可访问内存容量的换算$kp$, content = $kp$若计算机的地址总线宽度为 n，则 CPU 能够访问的存储空间为 2^n B。$kp$, section = '' where id = 27292;
update t_knowledge_point set title = $kp$由首地址和末地址求内存容量$kp$, content = $kp$内存存储容量（B）= 末地址 − 首地址 + 1，地址一般用十六进制数表示。$kp$, section = '' where id = 27293;
update t_knowledge_point set title = $kp$存取存储器中的数据$kp$, content = $kp$存取存储器中的数据。$kp$, section = '' where id = 28019;
update t_knowledge_point set title = $kp$Cache 容量与级数对效果的影响$kp$, content = $kp$Cache 的容量越大、级数越多，效果越显著。$kp$, section = '' where id = 28028;
update t_knowledge_point set title = $kp$Cache 的透明性$kp$, content = $kp$Cache 的透明性指 Cache 不能由程序或程序员访问，且不与主存统一编址。$kp$, section = '' where id = 28030;
update t_knowledge_point set title = $kp$Cache 的命中率$kp$, content = $kp$Cache 的命中率指 CPU 需要的指令或数据在 Cache 中直接找到的概率。$kp$, section = '' where id = 28031;
update t_knowledge_point set title = $kp$总线的组成$kp$, content = $kp$总线由地址总线、数据总线和控制总线组成。$kp$, section = '' where id = 28048;
update t_knowledge_point set title = $kp$外存的特点$kp$, content = $kp$外存存取速度慢、容量大、成本低，断电后信息不会消失。$kp$, section = '' where id = 28083;
update t_knowledge_point set title = $kp$内存与外存的存储介质$kp$, content = $kp$内存都由半导体芯片构成。外存的存储介质有磁表面存储器（硬盘）和半导体芯片（U 盘）。$kp$, section = '' where id = 28084;
update t_knowledge_point set title = $kp$内存、外存与 CPU 的数据交换$kp$, content = $kp$外存不能直接和 CPU 交换数据；内存可以和 CPU 直接交换数据，也可以和外存直接交换数据。$kp$, section = '' where id = 28085;
update t_knowledge_point set title = $kp$CPU 内部 Cache 的芯片类型$kp$, content = $kp$目前 CPU 内部的 Cache 采用 SRAM 芯片。$kp$, section = '' where id = 28090;
update t_knowledge_point set title = $kp$总线的三类组成$kp$, content = $kp$总线按功能分为三类：数据总线、地址总线和控制总线。$kp$, section = '' where id = 28235;
update t_knowledge_point set title = $kp$PCI 与 PCI-E 总线标准$kp$, content = $kp$PCI 总线标准发展到现在，已有更高级的 PCI-E 标准。$kp$, section = '' where id = 28236;
update t_knowledge_point set title = $kp$总线的种类$kp$, content = $kp$总线包括 CPU 前端总线、I/O 总线等，其中 I/O 总线是考查重点。$kp$, section = '' where id = 28247;
update t_knowledge_point set title = $kp$内存的特点$kp$, content = $kp$① 内存运行速度快，大部分内存断电后内容会消失，存储容量小。
② 内存直接和 CPU 交换数据。
③ 内存都由半导体芯片构成，但半导体存储芯片不一定是内存。$kp$, section = '' where id = 28255;
update t_knowledge_point set title = $kp$存储管理与虚拟存储器$kp$, content = $kp$存储管理强调的是对内存的管理。内存不够大时，操作系统提供虚拟存储器来扩充可用空间。$kp$, section = '' where id = 28262;
update t_knowledge_point set title = $kp$I/O 总线的作用$kp$, content = $kp$I/O 总线用于连接 I/O 设备和主机（内存）。$kp$, section = '' where id = 28268;
update t_knowledge_point set title = $kp$内存与外存的构成材料$kp$, content = $kp$内存都由半导体芯片构成；外存的存储介质有磁表面存储器（硬盘）和半导体芯片（U 盘）。$kp$, section = '' where id = 28388;
update t_knowledge_point set title = $kp$外存不能直接与 CPU 交换数据$kp$, content = $kp$外存不能直接和 CPU 交换数据。$kp$, section = '' where id = 28474;
update t_knowledge_point set title = $kp$内存可直接与 CPU 交换数据$kp$, content = $kp$内存可以和 CPU 直接交换数据。$kp$, section = '' where id = 28475;
update t_knowledge_point set title = $kp$CPU 中 Cache 的芯片类型$kp$, content = $kp$CPU 的 Cache 一般由 SRAM 芯片组成。$kp$, section = '' where id = 28489;
update t_knowledge_point set title = $kp$Cache 不与主存统一编址$kp$, content = $kp$CPU 的 Cache 不与主存统一编址。$kp$, section = '' where id = 28491;
update t_knowledge_point set title = $kp$地址总线宽度决定可访问内存容量$kp$, content = $kp$CPU 地址总线的位数（根数、宽度）决定了 CPU 可访问的内存容量大小。$kp$, section = '' where id = 28494;
update t_knowledge_point set title = $kp$高速缓存的容量与结构$kp$, content = $kp$程序运行过程中，高速缓存有利于减少 CPU 访问内存的次数。通常 Cache 容量越大、级数越多，其效用越显著。$kp$, section = '' where id = 28621;
update t_knowledge_point set title = $kp$操作系统的存放位置$kp$, content = $kp$安装了操作系统的计算机，操作系统安装在硬盘（外存）上，而不是存放在内存中。$kp$, section = '' where id = 28653;
update t_knowledge_point set title = $kp$数据量大时的存储层次$kp$, content = $kp$数据量大时，数据一般存放在辅助存储器（外存）中，内存中设置缓冲区，只暂存当前要处理的一小部分数据。$kp$, section = '' where id = 28656;
update t_knowledge_point set title = $kp$总线按信号分类$kp$, content = $kp$总线按传输的信号分为数据总线、地址总线和控制总线：数据总线传输数据信号，其宽度决定数据传输速度（带宽）；地址总线传输地址信号，其宽度决定可寻址的容量；控制总线传输控制信号。$kp$, section = '' where id = 28658;
update t_knowledge_point set title = $kp$高速缓存的特点与作用$kp$, content = $kp$高速缓存（Cache）不编址，不是主存地址的延伸。

作用：平衡 CPU 与主存之间的速度差异，提高 CPU 的工作效率。

Cache 中的数据是主存数据的映像（副本），数据的地址也一同被复制。

命中率：一般来说，Cache 容量越大，命中率越高；但容量越大，查找效率会下降。$kp$, section = '' where id = 28677;
update t_knowledge_point set title = $kp$计算机中总线的种类$kp$, content = $kp$计算机中的总线主要有处理器总线（即 CPU 前端总线）、存储器总线和 I/O 总线（即主板总线）。每类总线都包含地址线 AB、数据线 DB 和控制线 CB。$kp$, section = '' where id = 28718;
update t_knowledge_point set title = $kp$内存储器按存取速度排序$kp$, content = $kp$内存储器按存取速度由快到慢依次为：寄存器、Cache、主存（RAM 和 ROM）。$kp$, section = '' where id = 28729;
update t_knowledge_point set title = $kp$存放当前运行程序和数据的存储器$kp$, content = $kp$可以存放当前正在 CPU 中运行的程序和处理的数据的存储器有 RAM（主存）、Cache 和寄存器。$kp$, section = '' where id = 28733;
update t_knowledge_point set title = $kp$I/O 总线上的三类信号$kp$, content = $kp$I/O 总线上有三类信号：数据信号、地址信号和控制信号，对应的线路分别称为 DB、AB、CB。$kp$, section = '' where id = 28734;
update t_knowledge_point set title = $kp$Cache 的分级与作用$kp$, content = $kp$Cache 分为 L1 Cache 和 L2 Cache，均位于 CPU 内部（早期 L2 Cache 在主板上）。其作用是匹配 CPU 与内存条的速度差异，提高计算机的执行效率。Cache 中的数据是主存中部分内容的映射，容量越大，被 CPU 访问时的命中率越高。$kp$, section = '' where id = 28753;
update t_knowledge_point set title = $kp$Cache 命中率的含义$kp$, content = $kp$命中率是 Cache 的一个重要性能指标，指 CPU 需要的指令或数据在 Cache 中能直接取到的概率。Cache 容量越大，命中率越高。$kp$, section = '' where id = 28757;
update t_knowledge_point set title = $kp$存储器与内存的分类$kp$, content = $kp$主频 = 外频 × 倍频。

存储器分为内存和外存。内存指内存条；外存包括硬盘、光盘、软盘、U 盘。存储器既可以存储指令，也可以存储数据和程序。

内存存取速度快于外存，但容量较小、价格高，多为易失性的 DRAM 类存储；外存容量大、可永久保存、价格较低。

ROM 属于只读存储器，可永久存储，断电后信息不丢失：Mask ROM 由厂家一次性写入，写入后不可更改；PROM 可编程一次；EPROM 可编程可擦写；Flash ROM 为闪存，低电压下只读、高电压下可读可写，主要用于制造 BIOS 芯片。

RAM 是随机存储器，属易失性存储器，断电后信息丢失：SRAM 为静态随机存储器，电路结构复杂、集成度低、价格高、速度快，主要用来制造 Cache；DRAM 为动态随机存储器，速度慢、价格低，用于制造内存条，速度一般只有 CPU 的 1/10。

内存条按接口分为：SIMM 单列直插式，30 线或 72 线（金手指数量）；DIMM 双列直插式，168 线和 184 线，主要用于 SDRAM 和 DDR SDRAM；RIMM 双列直插式，184 线，主要用于 RDRAM 内存。

按数据传输方式分为：SDRAM 同步动态随机存储器，168 线，单数据率，只在时钟上升沿传输数据；DDR SDRAM 双数据率，在时钟上升沿和下降沿同时传输数据，传输速率是 SDRAM 的两倍；RDRAM 一般用于高档服务器，成对使用，双通道内存速度是 DDR 的两倍。

内存性能指标主要包括容量、存取速度和价格。$kp$, section = '' where id = 28770;
update t_knowledge_point set title = $kp$存储管理与虚拟内存$kp$, content = $kp$虚拟内存是硬盘中的虚拟空间，其大小受内存容量、硬盘容量和 CPU 寻址能力限制；以页为单位（通常 4KB）编址，采用最近最少使用（LRU）算法，对应的文件为 pagefile.sys。$kp$, section = '' where id = 28780;
update t_knowledge_point set title = $kp$计算机中存储器速度排序$kp$, content = $kp$存储器速度由快到慢依次为：寄存器、Cache 存储器、主存储器（RAM 和 ROM）、外存储器（软盘、硬盘、光盘）、后备存储器（磁带库、光盘库）。$kp$, section = '' where id = 28821;
update t_knowledge_point set title = $kp$Cache 的组成、映射与命中率$kp$, content = $kp$高速缓存的容量越大、级数越多，效果越显著。

① CPU 的 Cache 一般由 SRAM 芯片组成；Cache 存取速度快于主存、慢于 CPU，不与主存统一编址，可被 CPU 访问。
② Cache 中的数据是主存中部分内容的映射。
③ Cache 的替换算法依据局部性访问原理。
④ Cache 命中率指 CPU 在 Cache 中找到所需数据的概率，命中率越高越好。
⑤ Cache 的透明性指其不能由程序或程序员访问。$kp$, section = '' where id = 28842;
update t_knowledge_point set title = $kp$总线的概念$kp$, content = $kp$总线是连接 CPU、内存、外存设备和 I/O 设备，并在它们之间传输信息的一组共享传输线及控制电路。$kp$, section = '' where id = 28857;
update t_knowledge_point set title = $kp$地址总线与数据总线位数决定的能力$kp$, content = $kp$地址总线的位数（根数、宽度）决定了 CPU 的寻址能力，数据总线的位数（根数）决定了 CPU 的数据传输速度。$kp$, section = '' where id = 28861;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21813,21846,21848,21858,21859,21861,21921,21926,21947,21986,21987,21991,22009,22017,22070,22128,22147,22148,22151,22152,22164,22167,22206,22212,22485,26695,27175,27176,27177,27178,27198,27200,27201,27202,27214,27219,27221,27240,27256,27273,27276,27292,27293,28019,28028,28030,28031,28048,28083,28084,28085,28090,28235,28236,28247,28255,28262,28268,28388,28474,28475,28489,28491,28494,28621,28653,28656,28658,28677,28718,28729,28733,28734,28753,28757,28770,28780,28821,28842,28857,28861) and not deleted) <> 81 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
