-- 知识点 48 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_48
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_48 as
select * from t_knowledge_point where id in (21843,21844,21851,21885,21896,21948,22021,22116,22146,22246,23488,25201,25335,25336,25376,26701,27012,27232,27233,27234,27235,28035,28036,28037,28038,28039,28040,28238,28245,28248,28282,28476,28477,28478,28479,28480,28481,28641,28671,28672,28702,28725,28726,28727,28771,28810,28812,28816,28845,28846,28847,28848,28850,28868,28889,28908,28916,32712);

update t_knowledge_point set title = $kp$主板概述$kp$, content = $kp$主板的作用是安装所有的电子器件、电路与连接件，并为 CPU、内存条、显卡、各类扩充卡和 I/O 接口提供插座与连接。主板上装有 CPU 插座、芯片组、显示卡插槽（PCI-E x16）、扩充卡插槽（PCI、PCI-E x1）、内存条插槽、光驱及硬盘连接器、电源连接器、CMOS 存储器与 BIOS 等部件。ROM BIOS 中存放最基础的软件——基本输入/输出系统（BIOS）；CMOS 存储器存放硬件配置信息和系统基本参数（日期、时间、口令等）。$kp$, section = '' where id = 21843;
update t_knowledge_point set title = $kp$主板部件$kp$, content = $kp$主板上的部件包括：CPU 插座、芯片组、第 2 级高速缓存（有些已做在 CPU 中）、内存储器插座（SIMM 或 DIMM）、总线插槽、BIOS ROM 芯片、CMOS 芯片、时钟、电池、I/O 控制器、I/O 端口、扩充卡等。为了便于不同 PC 机主板的互换，主板的物理尺寸已经标准化，目前使用得比较多的是 ATX 规格的主板。$kp$, section = '' where id = 21844;
update t_knowledge_point set title = $kp$芯片组的功能$kp$, content = $kp$芯片组是 PC 机各组成部分相互连接和通信的枢纽，存储器控制、I/O 控制功能几乎都集成在芯片组内，它既实现了 PC 机总线的功能，又提供了各种 I/O 接口及相关的控制。芯片组集中了主板上几乎所有的控制功能，是构成主板电路的核心。CPU 类型不同，通常需要使用不同的芯片组；CPU 的系统时钟及各种与其同步的时钟均由芯片组提供。芯片组决定了主板上所能安装的内存的最大容量、速度及可使用的内存条的类型。$kp$, section = '' where id = 21851;
update t_knowledge_point set title = $kp$计算机的物理组成$kp$, content = $kp$① 从外观上看：机箱、显示器、键盘、鼠标、打印机等。② 机箱内包含：主板、硬盘、软驱、光驱、电源、风扇等。③ 主板上包含：CPU 插槽、CPU、内存条插槽、内存、总线、PCI 插槽、AGP 插槽、I/O 控制器、BIOS 芯片、CMOS 芯片等。$kp$, section = '' where id = 21885;
update t_knowledge_point set title = $kp$内存储器$kp$, content = $kp$内存储器由称为存储器芯片的半导体集成电路组成。半导体存储器芯片按照是否能随机地进行读写，分为只读存储器（ROM）和随机存取存储器（RAM）两大类。PC 机中用户实际可用的内存容量通常指 RAM 的容量。$kp$, section = '' where id = 21896;
update t_knowledge_point set title = $kp$芯片组的组成$kp$, content = $kp$通常在主板上可以找到 2 个芯片，即南桥芯片和北桥芯片。靠近 CPU 的那个芯片叫北桥芯片，平时所说的 815、845、865、915、945 等就是指北桥芯片的名称。北桥芯片是主板上最重要的芯片，主要负责与 CPU、内存、显卡进行通信，可以看成是 CPU、内存、显卡之间的桥梁。主板上另外一个就是南桥芯片，负责连接硬盘、USB 接口、PCI 接口等其他接口。南桥芯片和北桥芯片之间也有通道进行数据通信。$kp$, section = '' where id = 21948;
update t_knowledge_point set title = $kp$I/O 控制器$kp$, content = $kp$I/O 控制器是一组电子线路，每个 I/O 设备都有自己的专用控制器。有些设备（如键盘、鼠标、打印机等）的 I/O 控制器比较简单，已经集成在主板的芯片组中；有些设备（如显示器、网络设备等）的 I/O 控制器比较复杂，就制作成扩充卡，插在主板的 PCI 或 ISA 扩充槽中。$kp$, section = '' where id = 22021;
update t_knowledge_point set title = $kp$PCI 和 PCI-E 扩充卡插槽$kp$, content = $kp$显卡插槽（PCI-E x16）：16 个串行传输通道，最高传输速率 5GB/s。PCI 插槽：工作频率 33MHz，数据线 32 位，传输速率 133MB/s。PCI-E x1 插槽：1 个串行传输通道，最高传输速率 250MB/s。主板后侧还提供各种 I/O 插口。$kp$, section = '' where id = 22116;
update t_knowledge_point set title = $kp$芯片组与 BIOS 的补充说明$kp$, content = $kp$芯片组与 CPU 芯片同步发展，有什么样功能和速度的 CPU，就有什么样的芯片组与之配套。由于集成电路集成度越来越高，为降低系统成本，芯片组中集成了越来越多的功能，包括网卡、显卡、声卡等功能。由于 CPU 芯片越来越复杂、功能越来越强大（如 Core i3/i5/i7），有些已将北桥芯片的存储器控制器和图形控制器功能集成在 CPU 芯片之中，因此主板上北桥芯片已经消失，只需一块南桥芯片即可。

BIOS（Basic Input/Output System）中文名为“基本输入/输出系统”，是存放在主板上只读存储器（ROM）芯片中的一组机器语言程序。其功能是：诊断计算机故障；启动计算机工作；在启动阶段控制基本外设的输入输出操作（键盘、鼠标、磁盘读写、屏幕显示等）。BIOS 芯片即保存 BIOS 的只读存储器（ROM）芯片。$kp$, section = '' where id = 22146;
update t_knowledge_point set title = $kp$芯片组是各组成部分连接和通信的枢纽$kp$, content = $kp$北桥芯片：① 存储器控制功能；② 连接 CPU、存储器、显卡、南桥芯片的枢纽。

南桥芯片：① 多种 I/O 设备的控制功能；② I/O 总线（PCI 总线）功能；③ 提供各种 I/O 接口。$kp$, section = '' where id = 22246;
update t_knowledge_point set title = $kp$微电子技术的基本概念$kp$, content = $kp$微电子技术是以集成电路（IC）为核心的电子技术，是在电子电路和系统的超小型化和微型化过程中逐渐形成和发展起来的。微电子技术是信息技术领域中的关键技术，是发展电子信息产业和各项高技术的基础。$kp$, section = '' where id = 23488;
update t_knowledge_point set title = $kp$总线与 I/O 接口$kp$, content = $kp$总线是用于 CPU、主存、辅存和各种 I/O 设备之间传输信息并协调它们工作的一种部件，包含传输线和控制电路。

按连接对象分类：处理器总线（CPU 总线、前端总线）连接 CPU 与主存；I/O 总线（主板总线）连接主存与 I/O 设备或主存与外存；存储总线用于 CPU 与主存（含高速缓存）之间传输数据。

每类总线都包含地址线 AB、数据线 DB、控制线 CB。数据总线的宽度影响传输速率，地址线的宽度影响可寻址的内存容量，CPU 数据线的宽度影响 CPU 与内存之间的传输速率。$kp$, section = '' where id = 25201;
update t_knowledge_point set title = $kp$主板：芯片组与实物结构$kp$, content = $kp$芯片组包括北桥芯片（存储控制中心）和南桥芯片（I/O 控制中心），北桥芯片与南桥芯片之间有连接通道。主板实物上可标注的部件有：PCI-E 插槽、PCI 插槽、CMOS 电池、南桥芯片、SATA 接口、IDE 接口、软驱接口、外部设备接口、北桥芯片、CPU 插槽、内存插槽、电源接口，以及显卡、内存条等插接件。$kp$, section = '' where id = 25335;
update t_knowledge_point set title = $kp$主板：总线与接口$kp$, content = $kp$I/O 总线包括数据信号、地址信号、控制信号。I/O 总线类型有 PCI-E、PCI-E x16 等。

I/O 接口分串行和并行两类。串行接口：USB 2.0/3.0/3.1，支持即插即用和热拔插，可扩充 127 个设备，提供 +5V 电源，4 线；IEEE-1394，6 线，可扩充 63 个设备，支持即插即用和热拔插；SATA 用于连接硬盘；PS/2 用于连接键盘、鼠标。并行接口：IDE，用于连接硬盘、光驱。$kp$, section = '' where id = 25336;
update t_knowledge_point set title = $kp$内存寻址范围与地址线位数的计算$kp$, content = $kp$内存的寻址范围取决于地址线位数 n，即受地址位数的限制，可寻址空间为 2 的 n 次方字节。计算公式：末地址 − 初地址 + 1 = 存储空间，单位为 B（字节）。

题型一：已知末地址和初始地址（默认 0），求访问空间和地址线根数。例如末地址为 FFFH、初始地址为 0H：FFFH − 0H + 1 = 1000H = 2 的 12 次方 B = 4KB，地址线为 12 根。

题型二：已知访问空间和初始地址，求末地址。例如访问空间为 1KB、初始地址为 0H：末地址 = 2 的 10 次方 B − 1 = 3FFH。

题型三：已知访问空间和末地址，求初始地址。例如访问空间为 1KB、末地址为 4FFH：初地址 = 4FFH − 2 的 10 次方 B + 1 = 500H − 400H = 100H。$kp$, section = '' where id = 25376;
update t_knowledge_point set title = $kp$主板、芯片组、BIOS、内存储器与 I/O 概述$kp$, content = $kp$1）主板：也叫母板，安装在计算机主机箱内，是计算机最基本也是最重要的部件之一。主板制造质量的高低决定了硬件系统的稳定性；主板与 CPU 关系密切，每一次 CPU 的重大升级必然导致主板的换代。主板是计算机硬件系统的核心，也是主机箱内面积最大的一块印刷电路板，主要功能是传输各种电子信号，部分芯片也负责初步处理一些外围数据。
2）芯片组：是一组共同工作的集成电路芯片，负责将微处理器和机器的其他部分相连接，是决定主板级别的重要部件。
3）BIOS：是一组固化到主板 ROM 芯片上的程序，保存着计算机最重要的基本输入输出程序、开机后自检程序和系统自启动程序，并可从 CMOS 中读写系统设置的具体信息。
4）内存储器：又称内存，通常也泛称为主存储器，是相对于外存而言的，是计算机中的重要部件，也是与 CPU 进行沟通的桥梁。
5）I/O 总线：指缆线和连接器系统，用来传输 I/O 路径技术指定的数据和控制信号，另外还包括总线终结电阻或电路，用以减弱电缆上的信号反射干扰。主机和 I/O 设备之间通过总线连接，这个总线一般被称为 I/O 总线。
6）I/O 接口：是主机与被控对象进行信息交换的纽带，主机通过 I/O 接口与外部设备进行数据交换。$kp$, section = '' where id = 26701;
update t_knowledge_point set title = $kp$驱动程序的自动安装$kp$, content = $kp$新增加一个即插即用型的硬件后，Windows XP 会自动检测到该硬件；如果 Windows XP 附带该硬件的驱动程序，则会自动安装驱动程序；如果没有，则会提示用户安装该硬件自带的驱动程序。$kp$, section = '' where id = 27012;
update t_knowledge_point set title = $kp$芯片组是主板电路的核心$kp$, content = $kp$芯片组集中了主板上几乎所有的控制功能，是主板电路的核心，决定主板的级别和档次。$kp$, section = '' where id = 27232;
update t_knowledge_point set title = $kp$芯片组的组成：北桥与南桥$kp$, content = $kp$芯片组由南桥芯片和北桥芯片组成。① 北桥芯片（存储控制中心）：用于高速连接 CPU、内存条、显卡，并与南桥芯片互连。② 南桥芯片（I/O 控制中心）：主要与 PCI 总线槽、USB 接口、硬盘接口、音频解码器、BIOS 和 CMOS 存储器等连接，并借助 Super I/O 芯片提供对鼠标键盘、串行口、并行口等的控制。$kp$, section = '' where id = 27233;
update t_knowledge_point set title = $kp$芯片组是各部件连接通信的枢纽$kp$, content = $kp$芯片组是 PC 各组成部分相互连接通信的枢纽，实现了系统总线的功能。$kp$, section = '' where id = 27234;
update t_knowledge_point set title = $kp$芯片组决定可安装 CPU 的类型与主频$kp$, content = $kp$芯片组决定主板能安装的 CPU 的类型、主频。$kp$, section = '' where id = 27235;
update t_knowledge_point set title = $kp$芯片组由南北桥组成$kp$, content = $kp$芯片组由南桥芯片和北桥芯片组成。$kp$, section = '' where id = 28035;
update t_knowledge_point set title = $kp$北桥芯片（存储控制中心）$kp$, content = $kp$北桥芯片是存储控制中心，用于高速连接 CPU、内存条、显卡，并与南桥芯片互连。$kp$, section = '' where id = 28036;
update t_knowledge_point set title = $kp$南桥芯片（I/O 控制中心）$kp$, content = $kp$南桥芯片是 I/O 控制中心，主要与 PCI 总线槽、USB 接口、硬盘接口、音频解码器、BIOS 和 CMOS 存储器等连接，并借助 Super I/O 芯片提供对鼠标键盘、串行口、并行口等的控制。$kp$, section = '' where id = 28037;
update t_knowledge_point set title = $kp$芯片组实现系统总线的功能$kp$, content = $kp$芯片组是 PC 机各组成部分相互连接通信的枢纽，实现了系统总线的功能。$kp$, section = '' where id = 28038;
update t_knowledge_point set title = $kp$芯片组决定主存的容量、速度与内存条类型$kp$, content = $kp$芯片组决定主板能安装的主存的最大容量、速度和可使用的内存条的类型。$kp$, section = '' where id = 28039;
update t_knowledge_point set title = $kp$I/O 控制器多已集成在南桥芯片中$kp$, content = $kp$现在很多 I/O 控制器都不是以扩展卡的形式出现，南桥芯片中已经集成了 I/O 控制器的功能。$kp$, section = '' where id = 28040;
update t_knowledge_point set title = $kp$总线的两个分类：CPU 总线与 I/O 总线$kp$, content = $kp$总线按连接对象可分为 CPU 总线和 I/O 总线两类。$kp$, section = '' where id = 28238;
update t_knowledge_point set title = $kp$芯片组决定 CPU 类型和主频$kp$, content = $kp$芯片组决定主板能安装的 CPU 的类型和 CPU 的主频。$kp$, section = '' where id = 28245;
update t_knowledge_point set title = $kp$总线与主板、芯片组的对应关系$kp$, content = $kp$总线在实际的硬件上对应的是主板，也可以理解成芯片组实现了总线的功能。总线虽然不太好理解，但在转本考试中考核的内容非常集中，弄清楚总线的组成和总线的分类即可。$kp$, section = '' where id = 28248;
update t_knowledge_point set title = $kp$芯片组的重要性与主板的作用$kp$, content = $kp$芯片组的重要性可以概括为：芯片组决定了 CPU、内存、显卡的一切。主板就像一个建筑的平台和地基，在主板上连接了计算机的各大组成部件和关键的集成电路。多数设备通过主板提供的各种接口实现可插拔更换，包括 CPU、内存条、显卡、硬盘等；主板上还有一些焊死的集成电路，比如 BIOS 和 CMOS 芯片。$kp$, section = '' where id = 28282;
update t_knowledge_point set title = $kp$内存与外存的数据交换及芯片组的组成$kp$, content = $kp$内存可以与外存直接交换数据。芯片组一般由北桥芯片和南桥芯片组成。$kp$, section = '' where id = 28476;
update t_knowledge_point set title = $kp$主板的核心是芯片组$kp$, content = $kp$主板的核心是芯片组。$kp$, section = '' where id = 28477;
update t_knowledge_point set title = $kp$主板是总线在硬件上的体现$kp$, content = $kp$主板是总线在硬件上的体现。$kp$, section = '' where id = 28478;
update t_knowledge_point set title = $kp$芯片组决定 CPU 的类型$kp$, content = $kp$芯片组由南桥芯片和北桥芯片组成。芯片组决定了 CPU 的类型，不同的芯片组对应不同类型的 CPU。$kp$, section = '' where id = 28479;
update t_knowledge_point set title = $kp$芯片组决定 CPU、显卡与内存的规格$kp$, content = $kp$芯片组决定了 CPU 的一切、显卡的一切、内存的一切。$kp$, section = '' where id = 28480;
update t_knowledge_point set title = $kp$内存条类型由芯片组决定，BIOS 芯片是 ROM$kp$, content = $kp$主板上所能安装的内存条类型由芯片组决定。BIOS 芯片指的是主板上的一块 ROM 存储器，断电后信息不会丢失。$kp$, section = '' where id = 28481;
update t_knowledge_point set title = $kp$主板对系统稳定性的意义$kp$, content = $kp$PC 机中所有部件和设备都以主板为基础进行安装和互相连接，主板的稳定性影响着整个计算机系统的稳定性。$kp$, section = '' where id = 28641;
update t_knowledge_point set title = $kp$主板上的四类插座$kp$, content = $kp$CPU 插座；内存条插座，现在使用 DIMM；显卡插座，早期使用 AGP，现在使用 PCI-E x16；外围控制卡插座，包括 PCI、PCI-E（250MB/s）。$kp$, section = '' where id = 28671;
update t_knowledge_point set title = $kp$主板的四个主要芯片$kp$, content = $kp$主板上有4个主要芯片，它们决定了主板的档次与级别；芯片组应与CPU、内存条的速度和功能相匹配（门当户对）。

北桥芯片：存储控制中心，控制CPU、内存条和显卡。

南桥芯片：I/O控制中心，控制除北桥所控设备之外的所有设备。

BIOS ROM：基本输入/输出系统，是存放于Flash ROM（闪烁存储器）中的机器语言程序。

CMOS RAM：存放系统配置参数的可读写存储器。$kp$, section = '' where id = 28672;
update t_knowledge_point set title = $kp$内置式与外置式MODEM的连接方式$kp$, content = $kp$计算机通过内置式MODEM上网时，内置式MODEM就是一块扩充卡，直接插入主板的PCI插槽中。计算机通过外置式MODEM上网时，常见接口有串行口和USB接口。$kp$, section = '' where id = 28702;
update t_knowledge_point set title = $kp$主板上的主要部件$kp$, content = $kp$主板上的部件主要有：CPU插座、芯片组、存储器插槽、PCI总线插槽、BIOS、CMOS、电池等。$kp$, section = '' where id = 28725;
update t_knowledge_point set title = $kp$芯片组的组成与作用$kp$, content = $kp$芯片组一般由2块VLSI组成：一块是存储控制器（MCH，俗称北桥芯片），另一块是I/O控制器（ICH，俗称南桥芯片）。芯片组性能的优劣，决定了主板性能的好坏与级别的高低。$kp$, section = '' where id = 28726;
update t_knowledge_point set title = $kp$芯片组决定内存与CPU的类型和速度$kp$, content = $kp$芯片组提供了CPU的系统时钟，决定着计算机系统中内存的最大容量、速度及内存条的类型，也决定了主板上所用CPU的类型、速度和总线频率。$kp$, section = '' where id = 28727;
update t_knowledge_point set title = $kp$内存容量及其影响因素$kp$, content = $kp$容量以MB为单位，指所有存储单元的总数。

存储单元：每个存储单元就是一个字节、一个地址，CPU访问内存就是寻址，内存存储单元的基本单位是字节。

内存容量主要受主板芯片组、内存插槽及CPU地址总线宽度（位数）的影响。

CPU可寻址空间的大小由地址线宽度决定。$kp$, section = '' where id = 28771;
update t_knowledge_point set title = $kp$即插即用设备的安装步骤（STEP 1）$kp$, content = $kp$STEP 1：将硬件设备连接到计算机，系统开始检测所连接的硬件设备，并向PnP（即插即用）系统提供发现信息，以使该硬件设备可操作。$kp$, section = '' where id = 28810;
update t_knowledge_point set title = $kp$即插即用的含义与安装分类$kp$, content = $kp$“即插即用”是指操作系统可以自动检测并安装该硬件设备的驱动程序，之后该硬件设备即可正常使用。安装一般分为两类：USB设备和非USB设备。$kp$, section = '' where id = 28812;
update t_knowledge_point set title = $kp$I/O总线、I/O控制器与I/O接口的关系$kp$, content = $kp$I/O总线连接的是I/O控制器，I/O控制器提供I/O接口，I/O接口连接I/O设备。$kp$, section = '' where id = 28816;
update t_knowledge_point set title = $kp$CPU安装在主板的CPU插槽中$kp$, content = $kp$CPU安装在主板的CPU插槽中，可以更换。$kp$, section = '' where id = 28845;
update t_knowledge_point set title = $kp$芯片组是主板的核心$kp$, content = $kp$主板的核心是芯片组。芯片组集中了主板上几乎所有的控制功能，决定主板的级别和档次。$kp$, section = '' where id = 28846;
update t_knowledge_point set title = $kp$芯片组的组成：北桥与南桥$kp$, content = $kp$芯片组=南桥芯片+北桥芯片。北桥是存储控制中心，南桥是I/O控制中心。

芯片组是PC机各组成部分相互连接通信的枢纽，实现了系统总线的功能；北桥是高速设备的连接中心，南桥是慢速设备的连接中心。$kp$, section = '' where id = 28847;
update t_knowledge_point set title = $kp$芯片组提供部分I/O接口的控制电路$kp$, content = $kp$芯片组提供部分I/O接口的控制电路，也就是南桥芯片集成了部分I/O控制器。$kp$, section = '' where id = 28848;
update t_knowledge_point set title = $kp$芯片组的重要性与主板的可插拔特性$kp$, content = $kp$芯片组的重要性可概括为：芯片组决定了CPU、内存、显卡的选型与性能发挥。

主板就像一座建筑的平台和地基，其上连接了计算机的各大组成部件和关键集成电路。考试中需把握主板的一个特性：多数设备通过主板提供的各种接口实现可插拔更换，包括CPU、内存条、显卡、硬盘等；主板上也有一些焊死的集成电路，如BIOS和CMOS芯片。$kp$, section = '' where id = 28850;
update t_knowledge_point set title = $kp$内存容量是计算机的性能指标$kp$, content = $kp$内存容量属于计算机的性能指标之一，会影响计算机性能。一般所说的“存储容量是计算机的性能指标”，这里的存储容量指的就是内存容量。$kp$, section = '' where id = 28868;
update t_knowledge_point set title = $kp$主板的组成部件$kp$, content = $kp$主板又称母板，通常安装有CPU插座、CPU调压器、芯片组、第2级高速缓存（有的已做在CPU中）、存储器插槽（SIMM或DIMM）、总线插槽（如PCI-E、AGP）、接口（IDE并口、SATA）、ROM BIOS、时钟/CMOS、电池、超级I/O芯片等。$kp$, section = '' where id = 28889;
update t_knowledge_point set title = $kp$扩展卡与扩展槽的对应关系$kp$, content = $kp$PCI——网卡、声卡等I/O设备卡。

AGP（早期显卡接口）、PCI-E（现在的显卡接口）——显卡（任何显示设备都需要有显卡）。

IDE、SATA（串口）——外存（硬盘、光驱等）。

北桥控制CPU和内存，南桥控制I/O。$kp$, section = '' where id = 28908;
update t_knowledge_point set title = $kp$芯片组与CPU的配套及兼容性$kp$, content = $kp$计算机芯片是构成主板电路的核心。CPU种类不同，通常需要使用不同的芯片组，因此在某一类计算机上可执行的程序代码未必能在其他计算机上运行（兼容性），一般要求向下兼容。$kp$, section = '' where id = 28916;
update t_knowledge_point set title = $kp$硬件设备驱动程序的安装过程$kp$, content = $kp$STEP 1：将硬件设备连接到计算机，系统开始检测所连接的硬件设备，并向 PnP（即插即用）提供发现信息，以使该硬件设备可操作。
STEP 2：PnP 服务通过查询硬件设备的标识符来识别所连接的硬件设备。
STEP 3：PnP 服务在 DriverStore 文件夹中搜索与硬件设备匹配的驱动程序包；若找到则转到 STEP 4，若未找到则转到 STEP 5；若找不到合适的驱动程序包，则自动停止安装过程。
STEP 4：系统在以下位置搜索与硬件设备匹配的驱动程序包——（1）注册表指定位置：HKEY_LOCAL_MACHINE/Software/Microsoft/Windows/CurrentVersion；（2）微软 Windows Update 网站；（3）指定安装介质，如驱动程序安装光盘。
STEP 5：系统检查当前用户是否具有管理员权限，以便可以向 DriverStore 文件夹中添加驱动程序包。
STEP 6：系统检查驱动程序包是否具有有效可信的数字签名。
STEP 7：系统将驱动程序包复制到 DriverStore 文件夹中。
STEP 8：PnP 服务将驱动程序文件从 DriverStore 文件夹复制到设备安装的位置，该位置通常为 %SystemRoot%\System32\drivers。
STEP 9：PnP 服务对注册表进行设置，以便系统可以使用新安装的驱动程序。
STEP 10：PnP 服务启动新安装的驱动程序，此时新的硬件设备就可以正常使用。$kp$, section = '' where id = 32712;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21843,21844,21851,21885,21896,21948,22021,22116,22146,22246,23488,25201,25335,25336,25376,26701,27012,27232,27233,27234,27235,28035,28036,28037,28038,28039,28040,28238,28245,28248,28282,28476,28477,28478,28479,28480,28481,28641,28671,28672,28702,28725,28726,28727,28771,28810,28812,28816,28845,28846,28847,28848,28850,28868,28889,28908,28916,32712) and not deleted) <> 58 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
