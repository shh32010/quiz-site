-- 知识点 60 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_60
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_60 as
select * from t_knowledge_point where id in (21933,21985,22077,22093,22113,22137,22165,22186,22200,22208,22211,23132,23550,23577,23898,25208,26714,27011,27069,27207,27210,27220,27258,27259,27263,27290,27291,28064,28092,28094,28095,28096,28237,28256,28257,28258,28485,28486,28565,28649,28650,28664,28749,28754,28786,28820,28827,28867,28913,28914,28922,29691,30143);

update t_knowledge_point set title = $kp$存取时间$kp$, content = $kp$存取时间的含义：在存储器地址被选定后，存储器读出数据并送到 CPU（或把 CPU 的数据写入存储器）所需要的时间。
单位：ns（1ns = 10^-9 秒）。$kp$, section = '' where id = 21933;
update t_knowledge_point set title = $kp$硬盘的主要性能指标$kp$, content = $kp$存储容量（单位：GB）
存储容量 = 磁盘面数（磁头数）× 磁道数（柱面数）× 扇区数 × 512 字节。
硬盘容量以千兆字节（GB）为单位。作为 PC 的外存储器，容量越大越好；但受成本和体积限制，总容量相同时碟片数目宜少不宜多，因此提高单碟容量是提高硬盘容量的关键。

平均寻道时间
指硬盘在盘面上移动读写头至指定磁道寻找相应目标数据所用的时间，描述硬盘读取数据的能力，单位为毫秒（ms）。

平均等待时间
指磁头移动到数据所在的磁道后，等待所要的数据块继续转动到磁头下方的时间，为盘片旋转周期的 1/2。

平均存取时间
取决于硬盘的旋转速度、磁头的寻道时间和数据的传输速率。
平均存取时间 = 平均寻道时间 + 平均等待时间。$kp$, section = '' where id = 21985;
update t_knowledge_point set title = $kp$硬盘的等待时间、缓存容量与传输速率$kp$, content = $kp$平均等待时间（Average Latency Time）
指磁头移动到数据所在的磁道后，等待所要的数据块继续转动到磁头下方的时间，为盘片旋转周期的 1/2。

平均寻道时间（Average Seek Time）
指硬盘在盘面上移动读写头至指定磁道寻找相应目标数据所用的时间，描述硬盘读取数据的能力，单位为毫秒。

平均访问时间 = 平均寻道时间 + 平均等待时间，是评价硬盘读写数据所用时间的最佳指标。

Cache 容量（单位 KB 或 MB）
与主板上的高速缓存（RAM Cache）一样，硬盘缓存用于解决系统前后级读写速度不匹配的问题，以提高硬盘的读写速度。

数据传输速率（单位 MB/s）
主要指硬盘外部和内部数据的传输速率。外部传输速率即突发数据传输速率，一般指硬盘数据接口的速率；内部数据传输速率指磁头至硬盘缓存间的最大数据传输速率。外部速率大于内部速率，内部速率是评价硬盘数据传输速率的最佳指标。$kp$, section = '' where id = 22077;
update t_knowledge_point set title = $kp$硬盘常见操作$kp$, content = $kp$硬盘分区：在一个物理硬盘上建立多个逻辑硬盘（C:、D: 等）。
作用：安装多个操作系统，便于文件分类管理，有利于预防病毒。
逻辑硬盘格式化：在逻辑盘上产生四个区域——引导扇区、文件分配表（FAT）、根目录区和数据区。
其他常见操作还有碎片整理等。$kp$, section = '' where id = 22093;
update t_knowledge_point set title = $kp$DVD 刻录机与 DVD 光盘的容量$kp$, content = $kp$DVD 刻录盘目前有 2 大类、5 种规格：
一次性可写：DVD-R、DVD+R；
可擦写：DVD-RAM、DVD-RW、DVD+RW。
SuperMulti DVD 刻录机能兼容上述大部或全部盘片。

DVD 盘片容量：

| DVD 光盘类型 | 120mm DVD 容量（GB） | 80mm DVD 容量（GB） |
| --- | --- | --- |
| 单面单层（SS/SL） | 4.7（DVD-5） | 1.46（DVD-1） |
| 单面双层（SS/DL） | 8.5（DVD-9） | 2.66（DVD-2） |
| 双面单层（DS/SL） | 9.4（DVD-10） | 2.92（DVD-3） |
| 双面双层（DS/DL） | 17（DVD-18） | 5.32（DVD-4） |$kp$, section = '' where id = 22113;
update t_knowledge_point set title = $kp$光驱的数据传输速率$kp$, content = $kp$CD-ROM 光盘驱动器（简称光驱）的主要性能指标是读取数据的速度。
单速光驱的数据传输速率为 150KB/s。
N 倍速光驱的数据传输速率 = N × 150KB/s，例如 40 倍速为 40 × 150KB/s = 6000KB/s（即 6MB/s）。$kp$, section = '' where id = 22137;
update t_knowledge_point set title = $kp$存储容量$kp$, content = $kp$（1）软盘存储器
存储容量 = 磁盘面数 × 磁道数 × 扇区数 × 512 字节 = 2 × 80 × 18 × 512 字节 = 1.44MB。
读写数据的最小单位是扇区；操作系统在软盘上为文件分配存储区的单位是簇（2～8 个扇区）。

（2）硬盘存储器
存储容量 = 磁盘面数（磁头数）× 磁道数（柱面数）× 扇区数 × 512 字节。

（3）光盘存储器
CD-ROM 光盘片容量为 650MB、700MB；DVD-ROM（单面单层 120mm）为 4.7GB。

（4）内存储器
存储容量指存储器所包含的存储单元的总数，单位是 MB（1MB = 2^20 字节）或 GB（1GB = 2^30 字节）。
每个存储单元（一个字节）都有一个地址，CPU 按地址对存储器进行访问。
若 CPU 的地址线宽度为 n，则 CPU 的寻址空间为 2^n 字节。$kp$, section = '' where id = 22165;
update t_knowledge_point set title = $kp$数据传输速率$kp$, content = $kp$数据传输速率分为外部传输速率和内部传输速率，单位为 MB/s（兆字节/秒）。
外部传输速率指主机从硬盘缓存读出（或向缓存写入）数据的速度，与采用的接口类型有关。
内部传输速率指硬盘在盘片上读写数据的速度，通常远小于外部传输速率；单碟容量相同时，转速越高内部传输速率越快。
选购硬盘时，存储容量、平均存取时间、缓存大小、内部传输速率、接口类型等都是需要考虑的因素。$kp$, section = '' where id = 22186;
update t_knowledge_point set title = $kp$硬盘读写数据的时间$kp$, content = $kp$（1）读写某个扇区中数据的过程
已知要读写扇区的地址：柱面号（所在磁道）、扇区号（所在扇区）、磁头号（所在记录面）。
读写过程：磁头寻道（由柱面号控制）→ 等待扇区转到磁头下方（由扇区号控制）→ 读写扇区数据（由磁头号控制）。

（2）硬盘读写数据的时间
平均等待时间：数据所在扇区转到磁头下方所需的平均时间，为盘片旋转周期的 1/2，单位 ms。
平均寻道时间：把磁头移动到数据所在磁道（柱面）所需的平均时间，是衡量硬盘机械能力的重要指标，单位 ms。
平均访问时间：找到数据所在扇区所需的平均时间，为平均寻道时间与平均等待时间之和，是衡量硬盘找到数据所用时间的最好标志。
平均访问时间（ms）= 平均等待时间 + 平均寻道时间。

（3）数据传输速率
硬盘的数据传输速率也称磁盘的吞吐率，分为内部传输速率和外部传输速率。通常内部传输速率小于外部传输速率，内部传输速率是评价硬盘传输速率的最重要指标。

补充：硬盘容量、平均访问时间、缓存容量、内部传输速率是硬盘最重要的四个指标。$kp$, section = '' where id = 22200;
update t_knowledge_point set title = $kp$硬盘存储器的性能指标$kp$, content = $kp$容量：以 GB 为单位。
平均访问时间：在几 ms 至几十 ms 之间，由硬盘旋转速度（平均等待时间）、磁头寻道时间（平均寻道时间）和数据传输速率决定。
缓存容量：原则上越大越好，通常为几十 MB，硬盘的 Cache 采用 DRAM 芯片制成。
数据传输速率：外部传输速率指主机从硬盘缓存读出（或写入）数据的速度，与接口类型有关；内部传输速率指硬盘在盘片上读写数据的速度，转速越高内部传输速率越快。
与主机的接口：
- 并行 ATA（现已很少使用）；
- SCSI（小型计算机系统接口）：主要用于中、高端服务器和高档工作站，有串行也有并行；
- IDE（集成设备电路）：传统常用的并行接口；
- SATA（串行高级技术附件）：串行接口，目前主流。SATA1.0 传输速率 150MB/s（1.5Gb/s），SATA2.0 为 300MB/s（3.0Gb/s，理论峰值 375MB/s），SATA3.0 为 600MB/s（6Gb/s，理论峰值 750MB/s）。$kp$, section = '' where id = 22208;
update t_knowledge_point set title = $kp$缓存容量$kp$, content = $kp$高速缓冲存储器能有效改善硬盘的数据传输性能，理论上缓存越快越好、越大越好。目前硬盘的缓存容量大多已达到 8MB 以上。$kp$, section = '' where id = 22211;
update t_knowledge_point set title = $kp$平均等待时间与总线带宽的计算$kp$, content = $kp$平均等待时间（ms）= 盘片旋转一周所需时间 / 2（1s = 1000ms）。
例如 7200r/min 的硬盘，旋转一周所需时间 = 60s × 1000ms / 7200 ≈ 8.33ms，平均等待时间约为 4.17ms。

总线带宽（MB/s）= 数据线宽度（bit）/ 8 × 总线工作频率（MHz）× 每个总线周期传输数据的次数。$kp$, section = '' where id = 23132;
update t_knowledge_point set title = $kp$磁盘格式化$kp$, content = $kp$所谓磁盘的格式化操作，就是在盘面上划分磁道和扇区，并在扇区中填写扇区号等信息的过程。$kp$, section = '' where id = 23550;
update t_knowledge_point set title = $kp$3.5 英寸软盘片的信息存储模式与存储容量$kp$, content = $kp$两个记录面，即两个读写磁头（从 0 开始编号）；每个记录面有 80 个磁道（从 0 开始编号，0 号磁道位于最外圈）；每个磁道有 18 个扇区（从 1 开始编号）；每个扇区存储 512 字节二进制数据。
存储容量 = 磁盘面数 × 磁道数 × 扇区数 × 512 字节 = 2 × 80 × 18 × 512 字节 = 1.44MB。
读写数据的最小单位是扇区；操作系统在软盘上为文件分配存储区的单位是簇（2～8 个扇区）。
软盘写保护：3.5 英寸软盘片封装在开有读写窗的硬塑料保护壳中，读写窗由一个可移动的金属套（快门）保护，写保护口处有一块可移动的翼片；移动翼片露出写保护口后，信息就无法记录到盘片上，从而实现写保护。$kp$, section = '' where id = 23577;
update t_knowledge_point set title = $kp$信息的平均存取时间$kp$, content = $kp$磁盘上的信息以扇区为单位进行读写，平均存取时间 T = 寻道时间 + 旋转等待时间 + 数据传输时间。
寻道时间：磁头寻找到指定磁道所需的时间（约 5ms）。
旋转等待时间：指定扇区旋转到磁头下方所需的时间（约 4～6ms），转速为 4200/5400/7200/10000rpm。
数据传输时间：约 0.01ms/扇区。$kp$, section = '' where id = 23898;
update t_knowledge_point set title = $kp$硬盘存储器$kp$, content = $kp$特点
- 既是输入设备也是输出设备；
- 非易失性存储器，可长期保存二进制信息；
- 可读可写，成本低、可靠性高、容量大；
- 磁盘属于磁存储器而非半导体存储器，通过磁表面存储记录数据。

硬盘数据的三个参数：柱面号（磁道号）、磁头号（记录面号）、扇区号。

技术指标
容量：影响因素为总磁头数、柱面数（磁道数）、扇区数和每扇区容量。
平均存取时间：由磁盘旋转速度（平均等待时间）、磁头寻道时间和数据传输速率决定；平均存取时间 = 平均等待时间 + 平均寻道时间；平均等待时间（ms）= 盘片旋转一周所需时间 / 2，7200r/min 时一周所需时间 = 60s × 1000ms / 7200（1s = 1000ms）。
缓存容量：硬盘的高速缓冲 Cache 由 DRAM 芯片构成，可提高数据输入输出性能。
数据传输速率：又称磁盘传输率，分为内部传输速率（盘片上读写数据的速度）和外部传输速率（主机从硬盘缓存读写数据的速度，与接口类型有关，现在多采用 SATA3.0 接口，6Gb/s、600MB/s），内部传输速率小于外部传输速率。
接口类型：串行 ATA（SATA）1.0 为 150MB/s、2.0 为 300MB/s、3.0 为 600MB/s；串行接口有利于散热。

组成
- 磁盘盘片（存储介质）：由铝合金或玻璃材料制成，盘片有 1～5 张，直径 3.5/2.5/1.8 英寸；信息以扇区为单位；盘片上下两面涂有磁性材料，通过磁性材料粒子的磁化记录数据；盘面由外向内分成许多同心圆，每个同心圆称为一个磁道，磁道由外向内从 0 开始编号；每个磁道分成若干扇区，每个扇区容量一般为 512 字节或 4KB（容量超过 2TB 的硬盘）；同一半径上的各磁道构成柱面；盘片两侧各有一个磁头，两面都可记录数据。
- 主轴和主轴电机；
- 移动臂：带动磁头沿半径方向移动；
- 磁头：不能与盘片接触；
- 控制电路。

使用注意
- 硬盘读写时不能关掉电源；
- 注意防高温、防潮、防尘、防磁场、防震动。$kp$, section = '' where id = 25208;
update t_knowledge_point set title = $kp$存储器的层次结构与性能指标$kp$, content = $kp$存储器结构层次：
第一层：通用寄存器堆；
第二层：指令与数据缓冲栈；
第三层：高速缓冲存储器；
第四层：主存储器（DRAM）；
第五层：联机外部存储器（硬磁盘机）；
第六层：脱机外部存储器（磁带、光盘存储器等）。

主要性能指标：存储容量、存取时间、存储周期、存储器带宽。
存储容量的基本单位是字节（Byte），1KB = 1024B = 2^10B。$kp$, section = '' where id = 26714;
update t_knowledge_point set title = $kp$硬件及驱动程序的安装$kp$, content = $kp$大多数设备是即插即用（Plug & Play，缩写 P&P）型的，如主板、硬盘、光驱等，系统一般会自动安装驱动程序。也有些设备如显卡、声卡、Modem 等，虽然系统能够识别，但仍需用户手动安装硬件厂商提供的驱动程序。
安装新硬件有自动安装和手动安装两种方法。$kp$, section = '' where id = 27011;
update t_knowledge_point set title = $kp$光驱倍速与数据传输速率$kp$, content = $kp$单倍速光驱的数据传输速率为 150KB/s，N 倍速光驱的数据传输速率 = N × 150KB/s。$kp$, section = '' where id = 27069;
update t_knowledge_point set title = $kp$硬盘的磁道结构$kp$, content = $kp$硬盘盘面由外向内分成许多同心圆，每个同心圆就是一个磁道，盘面有几千个磁道。每条磁道的存储数据量相同，但各磁道的存储密度不同（外圈磁道长，密度低）。$kp$, section = '' where id = 27207;
update t_knowledge_point set title = $kp$硬盘的主要性能指标$kp$, content = $kp$① 平均等待时间 = 硬盘转一圈时间的一半，要会从硬盘的转速推算出平均等待时间。
② 平均存取时间（几 ms 至几十 ms 之间）= 寻道时间 + 旋转等待时间 + 数据传输时间。
③ 平均存取时间由旋转速度、磁头的寻道时间和数据的传输速率决定。
④ 硬盘的传输速率指硬盘外部和内部数据的传输速率，外部速率大于内部速率。$kp$, section = '' where id = 27210;
update t_knowledge_point set title = $kp$虚拟存储器容量的限制$kp$, content = $kp$虚拟存储器的大小受到外存空间及 CPU 地址表示范围的限制。$kp$, section = '' where id = 27220;
update t_knowledge_point set title = $kp$逻辑硬盘的回收站$kp$, content = $kp$每个逻辑硬盘都有一个回收站，删除的文件先放入回收站，而不是直接从磁盘上删除。$kp$, section = '' where id = 27258;
update t_knowledge_point set title = $kp$磁盘碎片整理与磁盘清理$kp$, content = $kp$磁盘碎片整理程序帮助整理硬盘空间，提高硬盘运行速度，不删除文件。
磁盘清理程序搜索驱动器，列出临时文件、Internet 缓存文件以及可以安全删除的不需要的程序和文件，用户可以有选择地删除部分或全部这些文件。$kp$, section = '' where id = 27259;
update t_knowledge_point set title = $kp$完全格式化$kp$, content = $kp$完全格式化会删除硬盘上的全部文件，并在检查磁盘后将坏扇区标注出来。$kp$, section = '' where id = 27263;
update t_knowledge_point set title = $kp$硬盘存储容量的计算$kp$, content = $kp$硬盘存储容量 = 磁头数 × 柱面数 × 每个磁道的扇区数 × 512B。$kp$, section = '' where id = 27290;
update t_knowledge_point set title = $kp$光驱倍速与数据传输速率$kp$, content = $kp$单倍速光驱的数据传输速率为 150KB/s，N 倍速光驱的数据传输速率 = N × 150KB/s。$kp$, section = '' where id = 27291;
update t_knowledge_point set title = $kp$数码相机可存照片数量的影响因素$kp$, content = $kp$数码相机能存储照片的多少，除了与存储器容量有关，还与存入照片的分辨率等有关。$kp$, section = '' where id = 28064;
update t_knowledge_point set title = $kp$硬盘的磁道结构$kp$, content = $kp$硬盘盘面由外向内分成许多同心圆，每个同心圆就是一个磁道，盘面有几千个磁道。每条磁道的存储数据量相同，但各磁道的存储密度不同（外圈磁道长，密度低）。$kp$, section = '' where id = 28092;
update t_knowledge_point set title = $kp$硬盘的主要性能指标$kp$, content = $kp$硬盘的主要性能指标包括平均等待时间和平均寻道时间。$kp$, section = '' where id = 28094;
update t_knowledge_point set title = $kp$平均等待时间与硬盘转速的关系$kp$, content = $kp$平均等待时间 = 硬盘转一圈时间的一半，应能由硬盘的转速推算出平均等待时间。$kp$, section = '' where id = 28095;
update t_knowledge_point set title = $kp$硬盘传输速率与光盘存储原理$kp$, content = $kp$硬盘的传输速率分为外部数据传输速率和内部数据传输速率，外部速率大于内部速率。

光盘存储原理：光盘基片是一种耐热的有机玻璃，用于记录数据的是一条由里向外的连续螺旋状光道；它通过盘面上压制凹坑的方法记录信息，凹坑边缘表示 1，凹坑平坦部分表示 0。$kp$, section = '' where id = 28096;
update t_knowledge_point set title = $kp$硬盘平均存取时间的影响因素$kp$, content = $kp$硬盘的平均存取时间由硬盘的旋转速度（平均等待时间）、磁头的寻道时间和数据的传输速率决定。$kp$, section = '' where id = 28237;
update t_knowledge_point set title = $kp$硬盘存储容量的计算$kp$, content = $kp$硬盘存储容量 = 磁头数 × 柱面数 × 每个磁道的扇区数 × 512B。$kp$, section = '' where id = 28256;
update t_knowledge_point set title = $kp$硬盘的内部与外部传输速率$kp$, content = $kp$硬盘的传输速率分为外部数据传输速率和内部数据传输速率，外部速率大于内部速率。$kp$, section = '' where id = 28257;
update t_knowledge_point set title = $kp$CD-ROM 只读光盘与光驱速率$kp$, content = $kp$CD-ROM 是只读光盘；光驱单速的数据传输速率为 150KB/s。$kp$, section = '' where id = 28258;
update t_knowledge_point set title = $kp$硬盘平均存取时间的影响因素$kp$, content = $kp$硬盘的平均存取时间由硬盘的旋转速度（平均等待时间）、磁头的寻道时间和数据的传输速率决定。$kp$, section = '' where id = 28485;
update t_knowledge_point set title = $kp$硬盘的平均等待时间与内部传输速率$kp$, content = $kp$硬盘的平均等待时间指硬盘旋转一周所需时间的一半。硬盘的内部传输速率小于外部传输速率。$kp$, section = '' where id = 28486;
update t_knowledge_point set title = $kp$平均存取时间的组成$kp$, content = $kp$平均存取时间（几 ms 至几十 ms 之间）= 寻道时间 + 旋转等待时间 + 数据传输时间。$kp$, section = '' where id = 28565;
update t_knowledge_point set title = $kp$外存与内存不能统一编址$kp$, content = $kp$软盘、硬盘上的信息按磁道和扇区存放，而内存按字节存放，因此外存与内存之间不能统一编址。$kp$, section = '' where id = 28649;
update t_knowledge_point set title = $kp$硬盘数据定位：3D寻址与硬盘接口$kp$, content = $kp$硬盘上定位一块数据采用3D寻址——柱面号、扇区号、磁头号。1) 磁道：硬盘表面由外向里分成若干个同心圆。2) 柱面：所有单碟上相同磁道的组合。硬盘与主机的接口：在主机内存和硬盘缓存之间提供数据传输的高速通道；类型有IDE（PATA）、SCSI、光纤通道、SATA（150MB/s~300MB/s）。$kp$, section = '' where id = 28650;
update t_knowledge_point set title = $kp$外存容量单位的十进制换算$kp$, content = $kp$外存容量单位通常按十进制换算（厂商常用1000而非1024）：1KB=1000B（10的3次方B），1MB=1000KB=10的6次方B，1GB=1000MB（10的9次方B），1TB=1000GB，其后依次为PB、EB、ZB。$kp$, section = '' where id = 28664;
update t_knowledge_point set title = $kp$硬盘的结构、主要技术指标与平均存取时间$kp$, content = $kp$硬盘的盘片有1~5张，材料主要有铝合金和玻璃，直径有3.5英寸、1.8英寸等；转速一般有5400r/min和7200r/min；激光读写磁头不与盘片接触，沿半径方向往返运动。定位硬盘上的一块数据需要三个参数：磁头号（记录面号）、柱面号（磁道号）、扇区号；每个扇区容量为512字节。硬盘的主要技术指标有：容量（60GB、80GB、100GB、120GB等）、平均存取时间（平均等待时间+平均寻道时间）、缓存容量（DRAM芯片，越大越好）、数据传输速率（100MB/s~300MB/s）、接口类型（IDE、SATA串口）等。例：寻道时间2ms、转速7200r/min，平均存取时间T=2+60×1000/7200/2=2+4=6ms。$kp$, section = '' where id = 28749;
update t_knowledge_point set title = $kp$内存与外存的编址单位及簇$kp$, content = $kp$内存和外存不是统一编址的。内存储器的编址单位是字节；外存的基本编址单位是扇区；Windows系统为文件分配存储空间的基本单位是簇（每个簇由若干个扇区组成）。$kp$, section = '' where id = 28754;
update t_knowledge_point set title = $kp$磁盘管理：格式化、碎片整理与磁盘清理$kp$, content = $kp$格式化：重新划分磁道和扇区，删除硬盘中的数据，格式化过程中可以设置磁盘卷标和单元大小。格式化分为快速格式化和全面格式化，快速格式化不扫描磁盘的坏扇区，全面格式化则扫描扇区，发现坏道则修复，不能修复则隔离。磁盘碎片整理：经常对文件进行剪切或复制会产生文件碎片，影响计算机速度，碎片整理可以提高读写速度。磁盘清理：清理垃圾文件。$kp$, section = '' where id = 28786;
update t_knowledge_point set title = $kp$存储器存储结构与信息表示（章节标题）$kp$, content = $kp$本节标题为“存储器存储结构，各项性能参数设置，数据分布，容量计算”，其后章节为“信息在计算机中的表示”。$kp$, section = '' where id = 28820;
update t_knowledge_point set title = $kp$磁盘文件系统与光盘、硬盘磁道的区别$kp$, content = $kp$磁盘的文件管理系统有FAT、NTFS。光盘的光道是螺旋线，硬盘的磁道是同心圆。光盘上平坦部分记为0，边缘记为1。$kp$, section = '' where id = 28827;
update t_knowledge_point set title = $kp$外存不属于计算机性能指标$kp$, content = $kp$外存和计算机的速度无关，也就是说外存不属于计算机的性能指标，也不是CPU的性能指标。$kp$, section = '' where id = 28867;
update t_knowledge_point set title = $kp$软盘存储器：尺寸、容量与容量计算$kp$, content = $kp$软盘存储器：尺寸3.5英寸，标准容量1.44MB。存储容量=磁盘面数×磁道数×扇区数×512字节（单位是B）。磁盘每个扇区的存储容量固定为512字节。$kp$, section = '' where id = 28913;
update t_knowledge_point set title = $kp$硬盘的作用、特点与主要性能指标$kp$, content = $kp$硬盘的作用是长期保存各类信息，特点是可读写、大容量、不便携带。主要性能指标为平均等待时间、平均寻道时间。平均访问时间=平均寻道时间+平均等待时间，是评价硬盘读写数据所用时间的最佳指标（也叫平均存取时间）。硬盘的传输率分为外部传输率和内部传输率（外部速率大于内部速率）。$kp$, section = '' where id = 28914;
update t_knowledge_point set title = $kp$快速格式化与完全格式化的区别$kp$, content = $kp$在Windows中，快速格式化只删除硬盘上的文件，但不检查磁盘的坏扇区；完全格式化会删除硬盘上的全部文件，并在检查磁盘后将坏扇区标注出来。$kp$, section = '' where id = 28922;
update t_knowledge_point set title = $kp$3.5英寸软盘的存储模式与容量计算$kp$, content = $kp$3.5英寸软盘片的信息存储模式与存储容量：1) 每个扇区存储512字节二进制数据；每个磁道有18个扇区；每个记录面有80个磁道（从0开始编号，0号磁道位于最外圈）；共两个记录面（两个读写磁头）。2) 512字节×18段×80磁道×2面=1474560字节=1474560/1024KB=1440KB=1.44MB。$kp$, section = '' where id = 29691;
update t_knowledge_point set title = $kp$3.5英寸软盘的实际容量与磁道扇区结构$kp$, content = $kp$直径为3.5英寸（每英寸为2.54厘米）的软盘总容量实际是1.41MB（标称约1.44MB，可用容量1.38MB），含2个记录面（软盘盘片的正反面），每个记录面含80个磁道，每个磁道分为18个扇区，每个扇区容量为512字节；最外面是0号磁道，最里面是79号磁道。软盘不同磁道上扇区的存储密度不同，内磁道密度大，外磁道密度小。$kp$, section = '' where id = 30143;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21933,21985,22077,22093,22113,22137,22165,22186,22200,22208,22211,23132,23550,23577,23898,25208,26714,27011,27069,27207,27210,27220,27258,27259,27263,27290,27291,28064,28092,28094,28095,28096,28237,28256,28257,28258,28485,28486,28565,28649,28650,28664,28749,28754,28786,28820,28827,28867,28913,28914,28922,29691,30143) and not deleted) <> 53 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
