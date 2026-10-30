-- 知识点 51 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_51
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_51 as
select * from t_knowledge_point where id in (21819,21862,21918,21924,21981,21982,21992,22004,22022,22023,22024,22054,22055,22060,22096,22114,22139,22141,22156,22169,22175,23049,24585,25213,25214,25215,25878,26705,27068,27190,27225,27239,27241,27242,27243,27244,27245,27246,27250,27251,27271,27272,28047,28049,28050,28051,28052,28053,28054,28055,28056,28058,28072,28226,28249,28250,28251,28254,28283,28284,28498,28501,28562,28611,28613,28643,28659,28678,28679,28680,28735,28736,28737,28811,28813,28814,28815,28818,28832,28858,28859,28860,28910,28928,30144,30193);

update t_knowledge_point set title = $kp$集成电路的制造$kp$, content = $kp$集成电路是在硅衬底上制作而成的。

制造流程：单晶硅 → 硅抛光片 → 晶圆 → 芯片（晶片）→ 成品测试 → 集成电路。$kp$, section = '' where id = 21819;
update t_knowledge_point set title = $kp$I/O 操作的定义$kp$, content = $kp$将输入设备输入的信息送入主存储器的指定区域，或者将主存储器指定区域的内容送出到输出设备，这一过程称为 I/O 操作。$kp$, section = '' where id = 21862;
update t_knowledge_point set title = $kp$I/O 设备$kp$, content = $kp$输入/输出设备是计算机系统的重要组成部分。没有 I/O 设备，计算机就无法与外界（包括人、环境、其他计算机等）交换信息。$kp$, section = '' where id = 21918;
update t_knowledge_point set title = $kp$I/O 接口的分类$kp$, content = $kp$① 按数据传输方式：串行端口一次只传输 1 位，如 COM1、COM2；并行端口一次传输 8 位或 16 位、32 位，如 LPT1。
② 按数据传输速率：高速、低速。
③ 按能否连接多个设备：总线式可连接多个设备并被多个设备共享，如 USB 接口；独占式只能连接 1 个设备。
④ 按是否符合标准：标准接口即通用接口，如 USB；专用接口，如 VIDEO 视频口。$kp$, section = '' where id = 21924;
update t_knowledge_point set title = $kp$I/O 控制器$kp$, content = $kp$I/O 控制器是一组电子线路。不同设备的 I/O 控制器结构与功能不同，复杂程度相差很大。键盘、鼠标、打印机等设备的 I/O 控制器比较简单，已集成在主板的芯片组中；显示器、网络设备等的 I/O 控制器比较复杂，规格和品种也比较多，通常制作成扩充卡（也叫适配器或控制卡），插在主板的 PCI 或 ISA 扩充槽中。I/O 控制器主要负责控制 I/O 操作的全过程，并与 CPU 进行通信。$kp$, section = '' where id = 21981;
update t_knowledge_point set title = $kp$I/O 操作中的控制部件$kp$, content = $kp$CPU 负责 I/O 操作的启动。
I/O 控制器负责对 I/O 设备进行全程控制。
DMA 电路负责数据传输的控制。
程序中断负责向 CPU 报告 I/O 操作完成的情况，实现 CPU 处理与 I/O 操作之间的同步与通信。$kp$, section = '' where id = 21982;
update t_knowledge_point set title = $kp$常考的 I/O 端口$kp$, content = $kp$鼠标的 I/O 端口标准：RS-232E、PS/2、USB、无线接口。
键盘的 I/O 端口标准：PS/2、USB、无线接口。
显示器的 I/O 端口标准：VGA。
硬盘的 I/O 端口标准：SCSI、IDE（常用）。
传统 I/O 端口的理想替代品：USB 和 IEEE 1394。$kp$, section = '' where id = 21992;
update t_knowledge_point set title = $kp$I/O 操作的过程$kp$, content = $kp$I/O 设备 → I/O 接口 → I/O 控制器 → I/O 总线 → 内存储器。$kp$, section = '' where id = 22004;
update t_knowledge_point set title = $kp$I/O 操作控制部件的分工$kp$, content = $kp$CPU 负责 I/O 操作的启动。
I/O 控制器负责在 I/O 操作期间对 I/O 设备进行全程控制。
DMA（Direct Memory Access，直接存储器存取）负责数据传输的控制。
程序中断负责向 CPU 报告 I/O 操作完成的情况，实现 CPU 处理与 I/O 操作之间的同步与通信。
I/O 操作由许多部件协同完成。$kp$, section = '' where id = 22022;
update t_knowledge_point set title = $kp$USB 接口的特点与传输速率$kp$, content = $kp$① 特点
高速、可连接多个设备、串行传输；使用 4 线连接器，体积小，符合即插即用规范（Plug & Play，即 PnP）；使用“USB 集线器”扩展机器的 USB 接口，最多连接 127 个设备；可通过 USB 接口由主机向外设提供电源（+5V，100～500 mA）；支持热拔插。

② 版本：USB 1.1 版、USB 2.0 版。

③ 传输速率：USB 1.1 为 12 Mb/s；USB 2.0 为 480 Mb/s（60 MB/s）。$kp$, section = '' where id = 22023;
update t_knowledge_point set title = $kp$USB 与 IEEE-1394 接口$kp$, content = $kp$USB 接口：高速串行传输，使用差分信号；使用 4 线连接器，体积小；符合“即插即用”规范（PnP），在操作系统支持下，用户无需手动配置即可插上或拔出 USB 外围设备，计算机会自动识别并配置；支持热拔插，即在计算机运行时（不需要关机）就可以插拔设备；使用“USB 集线器”时一个接口最多连接 127 个设备；可通过 USB 接口由主机向外设提供电源（+5V）。USB 的版本有 1.0 版、1.1 版、2.0 版、3.0 版。

IEEE-1394（又称 i.Link 或 FireWire）接口：主要用于连接需要高速传输大量数据的音频和视频设备，数据传输速率可达 50 MB/s～100 MB/s；采用串行传输；连接器共有 6 线；在一个接口上最多可以连接 63 个设备；与 USB 一样支持即插即用和热拔插。$kp$, section = '' where id = 22024;
update t_knowledge_point set title = $kp$I/O 总线$kp$, content = $kp$总线指的是计算机各部件之间传输信息的一组公用信号线及相关控制电路。

CPU 芯片与北桥芯片相互连接的总线称为 CPU 总线（前端总线）；I/O 设备控制器与 CPU、存储器之间相互交换信息、传输数据的一组公用信号线称为 I/O 总线，也叫主板总线，因为它与主板上扩充槽中的各扩充板卡（I/O 控制器）直接连接。

总线上通常有三类信号：数据信号、地址信号和控制信号，负责传输这些信号的线路分别称为数据总线、地址总线和控制总线；协调与管理总线操作的是总线控制器（在芯片组内）。

目前 PCI-E 是 PC 机 I/O 总线的一种新标准，它采用高速串行传输，以点对点的方式与主机进行通信。$kp$, section = '' where id = 22054;
update t_knowledge_point set title = $kp$IEEE-1394 接口$kp$, content = $kp$主要用于连接需要高速传输大量数据的音频和视频设备，数据传输速率高达 400 Mb/s。连接器共有 6 线，采用级联方式连接外部设备，设备间以菊花链方式进行转接，在一个接口上最多可以连接 63 个设备。速度高于 USB 接口。$kp$, section = '' where id = 22055;
update t_knowledge_point set title = $kp$总线带宽计算示例$kp$, content = $kp$总线最重要的性能是它的带宽。若总线的数据线宽度为 16 位，总线的工作频率为 133 MHz，则其带宽为____。$kp$, section = '' where id = 22060;
update t_knowledge_point set title = $kp$ISA 与 PCI 总线的位宽$kp$, content = $kp$ISA 总线的位宽是 16 位，PCI 总线的位宽有 32 位和 64 位两种。

CD-ROM 盘片的信息存储原理：利用在盘上压制凹坑的机械方法，凹坑的边缘表示“1”，凹坑内外的平坦部分表示“0”，再使用激光读出信息。$kp$, section = '' where id = 22096;
update t_knowledge_point set title = $kp$I/O 操作的任务与特点$kp$, content = $kp$输入的任务：将输入设备输入的信息送到内存储器的指定区域。
输出的任务：将内存储器指定区域的内容送出到输出设备。
（I/O 操作也包括辅存与内存之间的数据传输。）

特点：
I/O 操作与 CPU 的运算可同时进行；多个 I/O 设备的操作也可同时进行；每类 I/O 设备都有各自的控制器，它们按照 CPU 的 I/O 操作命令，独立地控制 I/O 操作的全过程。$kp$, section = '' where id = 22114;
update t_knowledge_point set title = $kp$I/O 接口的定义与分类$kp$, content = $kp$I/O 接口是 I/O 设备与主机之间的连接器，包括插头/插座的形式、通信规程和电气特性等。

分类：
从数据传输方式分：串行（一次只传输 1 位）、并行（多位一起传输）。
从是否能连接多个设备分：总线式（可连接多个设备）、独占式（只能连接 1 个设备）。
从是否符合标准分：标准接口（通用接口）、专用接口。$kp$, section = '' where id = 22139;
update t_knowledge_point set title = $kp$USB 接口及其传输速率$kp$, content = $kp$通用串行总线式接口（Universal Serial Bus），高速、可连接多个设备、串行传输。

传输速率：USB 2.0 版最高达 480 Mb/s（60 MB/s）；USB 3.0 版最高达 3.2 Gb/s（400 MB/s）。

USB 2.0 使用 4 线标准连接器，体积小，符合即插即用规范（Plug & Play，即 PnP）；使用“USB 集线器”扩展机器的 USB 接口，最多连接 127 个设备；可通过 USB 接口由主机向外设提供电源（+5V，100～500 mA）。$kp$, section = '' where id = 22141;
update t_knowledge_point set title = $kp$台式 PC 机箱背部的 I/O 接口$kp$, content = $kp$机箱背部常见的 I/O 接口有：数字音频接口（同轴电缆接口）、键盘接口、e-SATA 接口、以太网 RJ-45 接口、鼠标器接口、HDMI 接口、显示器接口（3 种）、USB 接口、麦克风、音箱。$kp$, section = '' where id = 22156;
update t_knowledge_point set title = $kp$常用 I/O 接口及其性能参数$kp$, content = $kp$| 名称 | 传输方式 | 数据传输速率 | 插头/插座形式 | 连接设备数目 | 连接的设备 |
| --- | --- | --- | --- | --- | --- |
| PS/2 接口 | 串行，双向 | 低速 | 圆形 6 针 | 1 | 鼠标器、键盘 |
| USB(2.0) | 串行，双向 | 60 MB/s（高速） | 矩形 4 线 | 最多 127 | 几乎所有外围设备 |
| USB(3.0) | 串行，双向 | 400 MB/s（超高速） | 矩形 8 线 | 最多 127 | 几乎所有外围设备 |
| IEEE 1394 | 串行，双向 | 12.5、25、50、100 MB/s | 矩形 6 线 | 最多 63 | 数字视频设备、光驱、硬盘 |
| ATA | 并行，双向 | 66、100、133 MB/s | (E-IDE) 40/80 线 | 1～4 | 硬盘、光驱、软驱 |
| SATA（串行 ATA） | 串行，双向 | 150、300、600 MB/s | 7 针插头/插座 | 1 | 硬盘、光盘 |
| eSATA | 串行，双向 | 300 MB/s | 连接线最长 2 m | 1 | 外置 SATA 接口，连接移动硬盘 |
| 显示器接口 VGA | 并行，单向 | 200～500 MB/s | HDB15 | 1 | 显示器 |
| 显示器接口 DVI | 并行，单向 | 3.7/7.6 Gbit/s | 24 针插座 | 1 | 显示器 |
| 高清晰多媒体接口 HDMI | 并行，单向 | 10.2 Gbps | 19 针插座 | 1 | 显示器、电视机 |$kp$, section = '' where id = 22169;
update t_knowledge_point set title = $kp$总线带宽及其计算$kp$, content = $kp$总线带宽：单位时间内总线上可传送的数据量（字节数）。

计算公式：总线带宽（MB/s）=（数据线宽度/8）（B）× 总线工作频率（MHz）。

补充：ISA 总线的宽度仅为 16 位，PCI 总线的宽度可以是 32 位，也可以是 64 位。

练习：
1. 1991 年以后的计算机使用 PCI 总线。若一台计算机的数据线宽度为 64 位、总线工作频率为 266 MHz，另一台数据线宽度为 32 位、总线工作频率为 133 MHz，则前者与后者的总线带宽之比为____。
2. 总线最重要的性能是它的带宽。若总线的数据线宽度为 16 位，总线的工作频率为 133 MHz，则其带宽为____。$kp$, section = '' where id = 22175;
update t_knowledge_point set title = $kp$无线 I/O 接口——蓝牙$kp$, content = $kp$蓝牙是一种短距离无线通信技术（802.15.1 协议），数据传输速率 1～24 Mb/s，距离在 10 m 之内。

蓝牙设备的配对分 3 种情况：
（1）即刻工作（Just works）：用于蓝牙耳机、音箱、手环、智能手表等几乎没有输入界面的设备，无需用户操作即可配对（可能需要用户确认）。
（2）数值对比（Numeric comparison）：两个设备都有显示屏，且有一个设备能输入“是/否”（例如两部手机），则在双方设备上分别显示一个 6 位数字，若两数相同即可确认配对。
（3）万能钥匙（Passkey Entry）：用于一个有显示屏的设备和一个有数字键盘的设备（例如一部手机和一个蓝牙键盘），或两个都有数字键盘的设备。第一种情况下，显示屏上显示 6 位数字，用户在另一设备的键盘上输入该数字；第二种情况下，两个设备需同时在键盘上输入相同的 6 位数字。$kp$, section = '' where id = 23049;
update t_knowledge_point set title = $kp$按数据传输方式分类$kp$, content = $kp$串行端口：一位一位地传输数据，一次只传输 1 位。
并行端口：8 位或者 16 位、32 位一起进行传输。$kp$, section = '' where id = 24585;
update t_knowledge_point set title = $kp$I/O 操作的特点$kp$, content = $kp$I/O 操作的任务是：将输入设备输入的数据送入内存，或者将数据从内存读出送到输出设备。

I/O 操作与 CPU 的数据处理操作是并行进行的。I/O 操作由 CPU 执行 I/O 指令后启动 I/O 控制器完成，I/O 设备通过 I/O 控制器接收 CPU 的输入/输出操作命令。

I/O 操作与 CPU 运算可以同时运行；对同一个 I/O 设备的操作也可以同时进行。

每类 I/O 设备都有各自的控制器，听从 CPU 的 I/O 操作指令；操作由 CPU 启动，但设备的控制是在 I/O 控制器控制下完成的（不是 CPU）。

辅助存储器与内存储器之间的数据传输也属于 I/O 操作。硬盘、U 盘、光盘、通信网络也可以看作 I/O 设备。$kp$, section = '' where id = 25213;
update t_knowledge_point set title = $kp$I/O 总线及其发展$kp$, content = $kp$**定义与任务**
I/O 总线是计算机用于在 I/O 设备与内存（主机）之间传输数据的部件，由传输线路及控制器组成，主要任务是高速传输数据。I/O 总线连接的是 I/O 控制器，I/O 控制器提供 I/O 接口，I/O 接口再连接 I/O 设备。I/O 接口的作用是：连接 I/O 设备自身的控制器，实现 I/O 设备与总线、与主机的连接。

**性能指标**
I/O 总线最重要的性能指标是带宽，即单位时间内可传输的最大数据量。总线带宽（MB/s）= 数据线宽度（bits）/8 × 总线工作频率（MHz）× 每个总线周期传输数据的次数。多个 I/O 设备可同时工作，分别同时与内存进行数据传输。

**PC 的 I/O 总线发展**
第 1 代：ISA 总线、EISA 总线；第 2 代：PCI 总线、PCI-X 总线；第 3 代：PCI-E 总线。

**PCI-E 的特点**
PCI-E 是 PCI 的改进，采用高速串行传输，以点对点方式进行数据传输（DMI、PCI-E 均为串行、点对点，串行即一位一位顺序传输数据）；台式 PC 中 PCI-E 总线呈树状结构；针脚数目大为减少，降低了体积和成本；支持高级电源管理和热插拔；PCI-E ×1 和 PCI-E ×16 已成为台式机的标配。外围设备的接口不一定插在 PCI 插槽中，还有 USB、IEEE 1394 等。

**PCI-E 规格**
乘几表示有几个传输通道，n 个通道提供 n 倍带宽：×1 可满足主流声卡、网卡和多数辅助存储器对带宽的要求；×4、×8；×16 能提供 16 GB/s 的带宽，更好地满足独立显卡对数据传输速率的需求。

**分类**
按数据传输方式（传输位数）：串行一次传输一位，并行一次传输 8 位（或 16 位、32 位），两种方式中不一定并行更快；按能否连接多个设备：总线式（连接多个设备）、独占式（只连 1 个）；按是否符合标准：标准接口（通用接口）、专用接口。$kp$, section = '' where id = 25214;
update t_knowledge_point set title = $kp$常用 I/O 设备接口$kp$, content = $kp$**常见接口（传输方式、单双工、典型设备）**
- 红外线接口
- COM1/2/3（9 针、25 针）：串行、双向，鼠标、通信设备
- RS232（9 针、D 型）：串行、双向，鼠标、键盘
- PS/2（6 针、圆形）：串行、双向，鼠标、键盘
- USB 2.0（4 线）、USB 3.0（8 线）：串行、双向，几乎所有外围设备
- IEEE 1394：串行、双向，扫描仪、移动硬盘、硬盘、数字视频设备
- SCSI（SAS）/SATA：串行、双向，扫描仪、硬盘、打印机、光盘
- eSATA：串行、双向，移动硬盘
- IDE/ATA（PATA）：并行、双向，硬盘、光驱、软驱
- VGA：并行、单向，显示器
- DVI：并行、单向，显示器
- HDMI：并行、单向，显示器、电视机；高清数字音频+视频接口，可同时传送音频和视频

**设备与接口的对应**
移动硬盘：eSATA、USB、IEEE 1394；扫描仪：IEEE 1394、SCSI（SAS）、USB；打印机：SCSI（SAS）、COM、USB；硬盘：IEEE 1394、SCSI（SAS）、SATA、IDE、ATA（PATA）。SCSI（SAS）不能用于移动硬盘，IEEE 1394 不能用于打印机。IEEE 1394 已比不上 USB，基本被淘汰。

**USB 接口**
USB 1.1：1.5 Mb/s、12 Mb/s；USB 2.0：最高 480 Mb/s（60 MB/s）；USB 3.0：最高 3.2 Gb/s（400 MB/s）。特点：借助“USB 集线器”可以扩展 USB 接口数目，一次最多连接 127 个设备；USB 接口的 I/O 设备可以有自身电源，USB 接口也向外设提供 +5V 电压；符合即插即用（PnP）规范；支持热插拔（计算机运行时不关机即可插拔设备）；使用 RJ45 接口的网卡和 VGA 接口的显示器也可通过适配器与 USB 连接。

**主板背板接口**
上排：PS/2 接口、USB 接口、VGA 接口、RJ45 接口、音频接口；下排：PS/2 接口、HDMI 接口、DVI 接口。$kp$, section = '' where id = 25215;
update t_knowledge_point set title = $kp$串行总线带宽的计算$kp$, content = $kp$串行总线带宽（MB/s）= 串行总线时钟频率（MHz）× 串行总线位宽（bit，8 bit = 1 B）× 串行总线管线数 × 编码方式 × 每时钟传输的数据组数。

PCI Express ×1 总线位宽为 1 位，总线频率 2500 MHz，管线 1 条，每时钟传输 2 组数据，编码方式为 8b/10b，其带宽为 2500 MHz × 1/8 B × 1 × 8/10 × 2 = 500 MB/s ≈ 476.84 MB/s，即 3814.7 Mb/s（约为 PCI 的 3.75 倍）。

PCI Express ×2：953.68 MB/s，即 7629.4 Mb/s（仅用于主板内部接口而非插槽）；×4：1907.36 MB/s，即 15258.9 Mb/s；×8：3814.72 MB/s，即 30517.8 Mb/s；×16：7629.44 MB/s，即 61035.5 Mb/s（约为 AGP 8X 的 3.75 倍）；×32：15258.88 MB/s，即 122071 Mb/s。

注：以上均为理论值，实际达不到，与实际网速和带宽的关系类似。$kp$, section = '' where id = 25878;
update t_knowledge_point set title = $kp$I/O 总线与 I/O 控制方式$kp$, content = $kp$1）I/O 总线：指缆线和连接器系统，用来传输 I/O 路径指定的数据和控制信号，另外还包括总线终结电阻或电路，该终结电阻用来减弱电缆上的信号反射干扰。

2）I/O 控制方式：程序查询方式、中断方式、DMA 方式和通道方式。

3）常用的几类 I/O 设备接口：并行接口、串行接口、直接数据传送接口、中断控制接口、定时器/计数器接口。

4）I/O 总线带宽计算：总线带宽 =（总线位宽/8）× 总线频率。$kp$, section = '' where id = 26705;
update t_knowledge_point set title = $kp$总线带宽的定义$kp$, content = $kp$总线带宽是指单位时间内总线上可以传输的最大数据量。$kp$, section = '' where id = 27068;
update t_knowledge_point set title = $kp$显卡的主机接口电路$kp$, content = $kp$显卡的主机接口电路负责显卡与 CPU 和内存之间的数据传输，目前一般采用 PCI-E ×16 接口。$kp$, section = '' where id = 27190;
update t_knowledge_point set title = $kp$总线带宽的计算公式$kp$, content = $kp$总线带宽（MB/s）=（总线位宽/8）× 总线工作频率（MHz）× 每个总线周期数据传输的次数。$kp$, section = '' where id = 27225;
update t_knowledge_point set title = $kp$总线的概念与分类$kp$, content = $kp$1. 总线的概念
连接 CPU、内存、外存设备和 I/O 设备，并在它们之间传输信息的一组共享传输线及控制电路。

2. 总线的分类
总线分为 CPU 总线（前端总线）、I/O 总线等。$kp$, section = '' where id = 27239;
update t_knowledge_point set title = $kp$I/O 总线与总线带宽$kp$, content = $kp$I/O 总线是各类 I/O 控制器与 CPU、存储器之间相互交换信息的公共信号线，用于连接内存和 I/O 设备。

① PCI 总线是 I/O 总线的一种。
② PCI 总线的标准性能已经跟不上实际使用，现在已发展为 PCI-E 总线标准。
③ PCI-E 采用高速串行方式传输数据，支持高级电源管理和热插拔。
④ 目前主流的显卡接口是 PCI-E ×16，PCI-E ×16 已经取代了传统的 AGP 接口。

3. 总线的组成
总线由地址总线、数据总线、控制总线组成。

4. 总线带宽
总线带宽指单位时间内总线上可以传输的最大数据量。总线带宽（MB/s）=（总线位宽/8）× 总线工作频率（MHz）× 每个总线周期数据传输的次数。$kp$, section = '' where id = 27241;
update t_knowledge_point set title = $kp$I/O 操作与 CPU 运算并行$kp$, content = $kp$I/O 操作与 CPU 的运算可并行进行。$kp$, section = '' where id = 27242;
update t_knowledge_point set title = $kp$独占式与总线式接口$kp$, content = $kp$独占式接口只能外接 1 个设备；总线式接口可以扩展多个设备。$kp$, section = '' where id = 27243;
update t_knowledge_point set title = $kp$USB 连接器的线数$kp$, content = $kp$USB 2.0 采用 4 线连接器，USB 3.0 采用 8 线连接器。$kp$, section = '' where id = 27244;
update t_knowledge_point set title = $kp$USB 集线器扩展接口$kp$, content = $kp$通过“USB 集线器”可以扩充 USB 的接口数目，最多可连接 127 个设备。$kp$, section = '' where id = 27245;
update t_knowledge_point set title = $kp$USB 接口的供电$kp$, content = $kp$USB 接口可以提供 +5V 的电源。$kp$, section = '' where id = 27246;
update t_knowledge_point set title = $kp$并口的典型设备$kp$, content = $kp$并口：打印机、扫描仪。$kp$, section = '' where id = 27250;
update t_knowledge_point set title = $kp$IEEE-1394 接口的用途$kp$, content = $kp$IEEE-1394 接口用于连接需要传输大量数据的音、视频设备。$kp$, section = '' where id = 27251;
update t_knowledge_point set title = $kp$I/O 控制器的集成$kp$, content = $kp$现在很多 I/O 控制器都不以扩展卡的形式出现，南桥芯片中已经集成了 I/O 控制器的功能。$kp$, section = '' where id = 27271;
update t_knowledge_point set title = $kp$I/O 设备控制器的作用$kp$, content = $kp$每个 I/O 设备都有各自专用的控制器，负责对 I/O 操作全程监控。$kp$, section = '' where id = 27272;
update t_knowledge_point set title = $kp$I/O 总线与 PCI-E$kp$, content = $kp$I/O 总线是各类 I/O 控制器与 CPU、存储器之间相互交换信息的公共信号线，用于连接内存和 I/O 设备。

① PCI 总线是 I/O 总线的一种。
② PCI 总线标准性能已经跟不上实际使用，现在已发展为 PCI-E 总线标准。
③ PCI-E 采用高速串行方式传输数据，支持高级电源管理和热插拔。
④ 目前主流的显卡接口是 PCI-E ×16，PCI-E ×16 已经取代了传统的 AGP 接口。$kp$, section = '' where id = 28047;
update t_knowledge_point set title = $kp$总线带宽的定义与计算$kp$, content = $kp$总线带宽是指单位时间内总线上可以传输的最大数据量。

总线带宽（MB/s）=（总线位宽/8）× 总线工作频率（MHz）× 每个总线周期数据传输的次数。$kp$, section = '' where id = 28049;
update t_knowledge_point set title = $kp$I/O 操作的全程监控$kp$, content = $kp$每个 I/O 设备都有各自专用的控制器。CPU 不对 I/O 操作全程监控，I/O 控制器对 I/O 操作全程监控。$kp$, section = '' where id = 28050;
update t_knowledge_point set title = $kp$I/O 控制器的独立控制$kp$, content = $kp$I/O 设备控制器独立地控制 I/O 设备的操作，直到 I/O 操作完成。$kp$, section = '' where id = 28051;
update t_knowledge_point set title = $kp$I/O 接口的传输方式与扩展性$kp$, content = $kp$① 串行：一次传输 1 位数据；并行：一次传输 8 位（或 16 位、32 位）数据。串行的传输速度不一定小于并行传输速度。
② 独占式：只能外接 1 个设备；总线式：可以扩展多个设备。$kp$, section = '' where id = 28052;
update t_knowledge_point set title = $kp$USB 2.0 与 USB 3.0 的线数$kp$, content = $kp$USB 2.0 采用 4 线连接器，USB 3.0 采用 8 线连接器。$kp$, section = '' where id = 28053;
update t_knowledge_point set title = $kp$USB 的即插即用与热插拔$kp$, content = $kp$USB 支持“即插即用”和“热插拔”。$kp$, section = '' where id = 28054;
update t_knowledge_point set title = $kp$USB 集线器与设备数量$kp$, content = $kp$通过“USB 集线器”可以扩充 USB 的接口数目，最多可达 127 个。$kp$, section = '' where id = 28055;
update t_knowledge_point set title = $kp$USB 各版本的传输速率$kp$, content = $kp$USB 1.1：1.5 Mb/s；USB 2.0：60 MB/s；USB 3.0：400 MB/s。$kp$, section = '' where id = 28056;
update t_knowledge_point set title = $kp$IEEE-1394 接口及其连接器$kp$, content = $kp$IEEE-1394 接口用于连接需要传输大量数据的音、视频设备，采用 6 线连接器。$kp$, section = '' where id = 28058;
update t_knowledge_point set title = $kp$显卡采用 PCI-E ×16 接口$kp$, content = $kp$显卡的主机接口电路负责显卡与 CPU 和内存之间的数据传输，目前一般采用 PCI-E ×16 接口。$kp$, section = '' where id = 28072;
update t_knowledge_point set title = $kp$MAC 地址$kp$, content = $kp$MAC 地址为 48 位，一般用 16 进制书写。$kp$, section = '' where id = 28226;
update t_knowledge_point set title = $kp$串行接口与并行接口$kp$, content = $kp$按每次传输数据的位数分：
① 串行接口一次传输 1 位数据，其数据传输速度不一定小于并行传输速度。
② 并行接口一次传输 8 位（或 16 位、32 位）数据。$kp$, section = '' where id = 28249;
update t_knowledge_point set title = $kp$按能否扩展分类的接口$kp$, content = $kp$按是否能扩展分为：
① 独占式：只能外接 1 个设备；
② 总线式：可以扩展多个设备。$kp$, section = '' where id = 28250;
update t_knowledge_point set title = $kp$USB 接口向外设供电$kp$, content = $kp$USB 接口可以提供 +5V 的电源。$kp$, section = '' where id = 28251;
update t_knowledge_point set title = $kp$AGP 插槽$kp$, content = $kp$AGP 插槽属于已淘汰的考点，早期用于插显卡，现在的显卡都插在 PCI-E ×16 插槽中。$kp$, section = '' where id = 28254;
update t_knowledge_point set title = $kp$总线带宽的计算方法$kp$, content = $kp$总线带宽是指单位时间内总线上可以传输的数据量。

总线带宽（MB/s）=（总线位宽/8）× 总线工作频率（MHz）× 每个总线周期数据传输的次数。$kp$, section = '' where id = 28283;
update t_knowledge_point set title = $kp$IEEE-1394 接口与常见接口识别$kp$, content = $kp$IEEE-1394 接口用于连接需要传输大量数据的音、视频设备。

台式机背部常见的 I/O 接口还有：PS/2 接口、USB 接口、VGA 接口、RJ45 接口、音频接口、HDMI 接口、DVI 接口。$kp$, section = '' where id = 28284;
update t_knowledge_point set title = $kp$I/O 总线与 PCI 的对应$kp$, content = $kp$看到 I/O 总线要想到 PCI 总线标准，看到 PCI 要想到 I/O 总线。$kp$, section = '' where id = 28498;
update t_knowledge_point set title = $kp$I/O 操作的启动与控制$kp$, content = $kp$多个 I/O 设备可以并行进行工作。PC 机中 CPU 通过执行 I/O 指令向 I/O 控制器发出启动 I/O 操作的命令，由 I/O 控制器负责对 I/O 设备进行全程控制。$kp$, section = '' where id = 28501;
update t_knowledge_point set title = $kp$多个 I/O 设备并行工作$kp$, content = $kp$多个 I/O 设备可以并行进行工作。$kp$, section = '' where id = 28562;
update t_knowledge_point set title = $kp$缓冲管理$kp$, content = $kp$缓冲管理：为缓解 CPU 和 I/O 设备速度不匹配的矛盾，提高 CPU 和 I/O 设备的利用率及系统吞吐量，许多操作系统通过设置缓冲区的办法来实现。$kp$, section = '' where id = 28611;
update t_knowledge_point set title = $kp$设备处理$kp$, content = $kp$设备处理：设备处理程序又称设备驱动程序，其基本任务是实现 CPU 和设备控制器之间的通信。$kp$, section = '' where id = 28613;
update t_knowledge_point set title = $kp$I/O 操作的任务、特点与注意点$kp$, content = $kp$1）任务：将输入设备输入的信息送入内存的指定区域，或者将内存指定的内容送出到输出设备。

2）特点：① I/O 设备速度比 CPU 慢，为提高系统效率，I/O 操作与 CPU 的数据处理操作是并行的；② 多个 I/O 设备能同时工作（例如一面键盘输入、一面屏幕显示，同时进行打印输出等）；③ I/O 设备的种类多、性能相差很大，与计算机主机的连接方法也各不相同。

3）注意：每个（类）I/O 设备都有各自专用的控制器，它们的任务是接收 CPU 启动 I/O 操作的命令后，独立地控制 I/O 操作的全过程。$kp$, section = '' where id = 28643;
update t_knowledge_point set title = $kp$总线带宽计算举例$kp$, content = $kp$计算公式：总线带宽 = 数据线宽度/8 × 总线工作频率 × 周期数（MB/s）。

例：某计算机数据总线宽度为 64 位，工作频率为 133 MHz，每个周期传输 1 次数据，则带宽 = 64/8 × 133 MHz × 1 ≈ 1064 MB/s = 1.064 GB/s。$kp$, section = '' where id = 28659;
update t_knowledge_point set title = $kp$I/O 设备的并行与独立控制$kp$, content = $kp$所有设备都可以同时工作。
所有设备都有控制器，按照 CPU 的命令独立控制 I/O 设备。$kp$, section = '' where id = 28678;
update t_knowledge_point set title = $kp$总线的定义与带宽$kp$, content = $kp$总线（bus）是把所有设备连接起来的一组共享线路。

带宽 =（数据线宽度/8）× 工作频率（Hz）× 传输次数。

例如：某数据线宽度为 64 b，工作频率为 133 MHz，该总线的带宽为 1064 MB/s。$kp$, section = '' where id = 28679;
update t_knowledge_point set title = $kp$I/O 接口的分类与含义$kp$, content = $kp$按传输方式分：串行，一位一位传输；并行，一次 8 位或 16 位传输。

按是否能连多个设备分：总线式，一次性可以识别多个设备（例如 USB 集线器）；独占式，一次性只能识别一个设备。

按是否通用分：通用接口，几乎什么设备都能识别；专用接口，只能识别某个特定设备。$kp$, section = '' where id = 28680;
update t_knowledge_point set title = $kp$总线带宽公式$kp$, content = $kp$总线带宽（MB/s）= 数据线宽度（bits）/8 × 总线工作频率（MHz）× 每个总线周期传输数据的次数。$kp$, section = '' where id = 28735;
update t_knowledge_point set title = $kp$常见的 I/O 接口$kp$, content = $kp$常见的 I/O 接口有：串口（COM1 和 COM2）、并口、PS/2 串口（6 针，圆形）、RS232 串口（9 针，D 型）、USB、IDE、SATA、SCSI、IEEE-1394 和红外线接口。$kp$, section = '' where id = 28736;
update t_knowledge_point set title = $kp$USB 接口的版本与特点$kp$, content = $kp$USB 接口按版本分为 USB 1.0（1.5 Mb/s）、USB 1.1（1.5 MB/s）、USB 2.0（60 MB/s）；采用 4 线连接器；一次最多连接 127 个设备；向外设提供 +5V 电压。$kp$, section = '' where id = 28737;
update t_knowledge_point set title = $kp$PnP 与驱动程序安装$kp$, content = $kp$PnP 服务启动新安装的驱动程序后，新的硬件设备就可以正常使用。

即插即用（PnP）是指将硬件连接到计算机后，操作系统可以自动识别并配置，使其正常工作。$kp$, section = '' where id = 28811;
update t_knowledge_point set title = $kp$热插拔$kp$, content = $kp$“热插拔”是指在不关闭操作系统或计算机电源的情况下，随时将硬件设备连接到计算机或断开与计算机的连接，而不会对硬件设备以及其中存储的数据造成破坏。USB（通用串行总线）接口设备和 IEEE 1394 接口设备都支持热插拔，比如 U 盘、移动硬盘等。$kp$, section = '' where id = 28813;
update t_knowledge_point set title = $kp$USB 设备的驱动安装$kp$, content = $kp$USB 设备连接到计算机后，系统通常可以自己检测到该设备并安装好相应的驱动程序，稍后即可使用。

非 USB 设备（如声卡、显卡、网卡等）需要连接到主板的特定插槽。系统内部集成了大量硬件设备的驱动程序，有些可以自动匹配，但有时会提示驱动太旧，需要更新驱动。可以通过驱动程序安装光盘安装，也可以自行下载安装，或借助第三方软件（如驱动精灵）安装。$kp$, section = '' where id = 28814;
update t_knowledge_point set title = $kp$非即插即用设备的驱动安装$kp$, content = $kp$非即插即用主要针对旧的设备：这些设备连接计算机后，操作系统无法自动检测到，或者即使检测到也无法为它们安装正确的驱动程序，因此需要手动检测硬件并安装相应的驱动程序。可在“设备管理器”中选择“添加过时硬件”，再选择驱动文件进行安装。$kp$, section = '' where id = 28815;
update t_knowledge_point set title = $kp$I/O 总线与接口的内容范围$kp$, content = $kp$本节内容包括 I/O 总线、I/O 操作方式、常用的几类 I/O 设备接口和 I/O 总线带宽计算。$kp$, section = '' where id = 28818;
update t_knowledge_point set title = $kp$网卡的 MAC 地址$kp$, content = $kp$网络接口和硬件层使用 MAC 地址。网卡的 MAC 地址是标识主机的硬件地址，由 48 位二进制组成，通常用 16 进制数表示。$kp$, section = '' where id = 28832;
update t_knowledge_point set title = $kp$I/O 总线的定义$kp$, content = $kp$I/O 总线（PCI 总线就是 I/O 总线的一种）是 I/O 设备控制器和 CPU、存储器之间相互交换信息、传输数据的一组公用信号线，用于连接主机和 I/O 设备。$kp$, section = '' where id = 28858;
update t_knowledge_point set title = $kp$总线带宽计算题$kp$, content = $kp$总线带宽是指单位时间内总线上可以传输的数据量。

总线带宽（MB/s）=（总线位宽/8）× 总线工作频率（MHz）× 每个总线周期数据传输的次数。$kp$, section = '' where id = 28859;
update t_knowledge_point set title = $kp$I/O 总线与 PCI 总线$kp$, content = $kp$看到 I/O 总线要想到 PCI 总线标准，并且知道现在的显卡都是插在 PCI-E 插槽中的。$kp$, section = '' where id = 28860;
update t_knowledge_point set title = $kp$接口的传输方式与 USB 特点$kp$, content = $kp$接口从传输方式分为串行端口和并行端口。串行接口一次只传输一位数据。

键盘（紫色）或鼠标（绿色）的接口主要使用 PS/2 接口。现在的 U 盘主要用串行 USB 口连接。

USB 的特点：速度快、4 线连接器、最多连接 127 个设备、向外设提供 +5V 电压、支持热插拔。$kp$, section = '' where id = 28910;
update t_knowledge_point set title = $kp$I/O 总线与接口考点范围$kp$, content = $kp$I/O 总线、I/O 操作方式、常用的几类 I/O 设备接口、I/O 总线带宽计算（要求理解）。$kp$, section = '' where id = 28928;
update t_knowledge_point set title = $kp$缓冲区技术$kp$, content = $kp$“缓冲区技术”是为了减少主机等待 I/O 设备操作的时间，解决 I/O 设备速度与主机速度不匹配的问题而采用的技术。$kp$, section = '' where id = 30144;
update t_knowledge_point set title = $kp$USB 1.1 与 2.0 的速率比较$kp$, content = $kp$USB 2.0（60 MB/s）比 USB 1.1（1.5 MB/s）快 40 倍。$kp$, section = '' where id = 30193;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21819,21862,21918,21924,21981,21982,21992,22004,22022,22023,22024,22054,22055,22060,22096,22114,22139,22141,22156,22169,22175,23049,24585,25213,25214,25215,25878,26705,27068,27190,27225,27239,27241,27242,27243,27244,27245,27246,27250,27251,27271,27272,28047,28049,28050,28051,28052,28053,28054,28055,28056,28058,28072,28226,28249,28250,28251,28254,28283,28284,28498,28501,28562,28611,28613,28643,28659,28678,28679,28680,28735,28736,28737,28811,28813,28814,28815,28818,28832,28858,28859,28860,28910,28928,30144,30193) and not deleted) <> 86 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
