-- 知识点 59 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_59
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_59 as
select * from t_knowledge_point where id in (21840,21847,21863,21868,21911,21917,21946,21978,22003,22030,22034,22063,22098,22131,22134,22135,22158,22163,22172,22199,22202,22225,22242,22243,23848,23914,24059,24226,24973,25210,25211,25212,25339,26521,26713,26920,27062,27143,27144,27199,27206,27208,27211,27215,27247,27262,27704,27705,27706,27707,28091,28093,28097,28098,28261,28266,28267,28269,28387,28483,28484,28487,28500,28566,28567,28584,28593,28651,28687,28689,28750,28755,28826,28869,28872,28891,28892,28915);

update t_knowledge_point set title = $kp$CD光盘存储器的组成与记录原理$kp$, content = $kp$CD光盘存储器由CD光盘片和CD光盘驱动器（光盘刻录机）组成。驱动器接口有SCSI接口、IDE接口、并行口和USB接口；驱动器分CD-ROM光驱和CD-RW刻录机，盘片分CD-ROM、CD-R和CD-RW三种。
CD盘上记录数据的是一条由里向外连续的螺旋光道。记录原理是在盘上压制凹坑：凹坑的边缘表示“1”，凹坑内外的平坦部分表示“0”，读出时用激光识别信息。$kp$, section = '' where id = 21840;
update t_knowledge_point set title = $kp$光盘存储器的特点与类型$kp$, content = $kp$优点：成本低、存储密度高、容量大、可靠性高、不易受损、耐用、易于长期保存数据。
缺点：读出速度和数据传输速度比硬盘慢得多。
光盘存储器分为CD光盘存储器和DVD光盘存储器两大类型。$kp$, section = '' where id = 21847;
update t_knowledge_point set title = $kp$硬盘存储器的组成与工作原理$kp$, content = $kp$组成：磁盘盘片（存储介质）、主轴与主轴电机、移动臂、磁头和控制电路。
工作原理：一块硬盘通常由1～5张盘片（1张盘片也称1个单碟）组成，所有盘片都固定在主轴上，所有盘片上相同半径处的一组磁道称为“柱面”，因此硬盘上的数据用柱面号、扇区号和磁头号三个参数定位。主轴底部有一个电机，工作时电机带动主轴，主轴带动盘片高速旋转，转速为每分钟几千转甚至上万转；盘片高速旋转带动的气流将盘片两侧的磁头托起。磁头是一个质量很轻的薄膜组件，负责盘片上数据的写入或读出。移动臂用来固定磁头，并带动磁头沿盘片径向高速移动，以便定位到指定的磁道。$kp$, section = '' where id = 21863;
update t_knowledge_point set title = $kp$软盘存储器的组成$kp$, content = $kp$软盘存储器由软盘片、软盘驱动器、软盘控制器组成。$kp$, section = '' where id = 21868;
update t_knowledge_point set title = $kp$CD光盘存储器系列$kp$, content = $kp$组成：CD光盘片、CD光盘驱动器（光盘刻录机）。驱动器接口有SCSI接口、IDE接口、并行口和USB接口；驱动器分CD-ROM光驱和CD-RW刻录机，盘片分CD-ROM、CD-R和CD-RW三种。
① CD光盘片（Compact Disc，小型光盘）
CD-ROM光盘片：只读光盘，不能删除也不能写入，只能读出盘中的信息，存储容量为650MB、700MB。
CD-R光盘片：只写一次式光盘，只能写一次，写后不能删除和修改，只能读出。
CD-RW光盘片：可擦写型光盘，利用金属合金材料的相变原理实现可重复读写，用户可以自己写入信息，也可以对写入的信息进行擦除和改写；搭配CD-RW刻录机可反复读写1000次以上。
信息存储原理：在盘片的信息记录层上沿螺旋形轨道（光道）压制出一系列凹坑，凹坑的两个边沿处均表示数据“1”，其他平坦处表示数据“0”。
信息读取原理：CD-ROM光盘片放入光盘驱动器，被激光束照射时，凹坑两个边沿处产生的反射光弱，作为数据“1”；平坦处产生的反射光强，作为数据“0”。
② CD光盘驱动器
CD-ROM光盘驱动器（简称光驱），主要性能指标是读取数据速度。单速为150KB/s，4速（4X）为4×150KB/s，40速（40X）为40×150KB/s，一般转速也是单速光驱的40倍。
CD-RW刻录机，主要性能指标有读取数据速度、复写数据速度、刻录速度（例如40X、12X、40X）、数据缓冲区大小、兼容性（数据格式）、有无刻不死功能等。
③ CD光盘驱动器的接口类型：SCSI接口、IDE接口、并行口和USB接口等。$kp$, section = '' where id = 21911;
update t_knowledge_point set title = $kp$DVD光盘存储器的组成与特点$kp$, content = $kp$组成：DVD光盘片（Digital Versatile Disk，数字多用途光盘，存储容量一般为4.7GB）和DVD驱动器。
DVD驱动器的结构比CD驱动器更加精密，使用波长更短的红色激光，因而信息鉴别能力更强。$kp$, section = '' where id = 21917;
update t_knowledge_point set title = $kp$硬盘存储器的作用、特点与组成$kp$, content = $kp$作用：长期保存各类信息。
特点：可读写、大容量、不便携带。
组成：磁盘片（存储介质）、主轴与主轴电机、移动臂和磁头、控制电路。$kp$, section = '' where id = 21946;
update t_knowledge_point set title = $kp$DVD光盘片与DVD驱动器的分类$kp$, content = $kp$组成：DVD光盘片（Digital Versatile Disk，数字多用途光盘，存储容量一般为4.7GB，最大可达17GB）和DVD驱动器。
① DVD光盘片
DVD-ROM：DVD只读光盘，用途类似CD-ROM。
DVD-R（或称DVD-Write-Once）：限写一次的DVD，用途类似CD-R。
DVD-RAM（或称DVD-Rewritable）：可多次读写的光盘，用途类似CD-RW。
DVD-Video：家用影视光盘，用途类似LD或VCD。
DVD-Audio：音乐光盘，用途类似CD唱片。
② DVD驱动器分类
DVD播放机：专门用于播放DVD影碟的DVD影碟机。
DVD-ROM：安装在PC机上使用的DVD-ROM（DVD光驱）。
DVD-RW刻录机：可刻录DVD和CD光盘，并支持读取上述两种光盘。$kp$, section = '' where id = 21978;
update t_knowledge_point set title = $kp$蓝光光盘存储器（BD）$kp$, content = $kp$该技术已经成熟，采用蓝色激光，单面单层盘片的存储容量为25GB，双层容量可达50GB。$kp$, section = '' where id = 22003;
update t_knowledge_point set title = $kp$硬盘的工作原理$kp$, content = $kp$硬盘的盘片由铝合金制成（最新的硬盘盘片采用玻璃材料），盘片上涂有一层很薄的磁性材料，通过磁层的磁化来记录数据。
一块硬盘一般由1～5张盘片（1张盘片也称1个单碟）组成，它们都固定在主轴上。主轴底部有一个电机，工作时电机带动主轴，主轴带动盘片高速旋转，转速为每分钟几千转甚至上万转。盘片高速旋转时带动的气流将盘片上的磁头托起，磁头是一个质量很轻的薄膜组件，负责盘片上数据的写入或读出。移动臂用来固定磁头，使磁头可以沿盘片径向高速移动，以便定位到指定的磁道。$kp$, section = '' where id = 22030;
update t_knowledge_point set title = $kp$硬盘驱动器与主机的接口$kp$, content = $kp$SCSI：主要应用于中、高端服务器和高档工作站。
IDE：并行ATA接口，传统常用接口。
SATA：串行ATA接口，比IDE性能更优良，近年来普及，传输速率为150MB/s～300MB/s。$kp$, section = '' where id = 22034;
update t_knowledge_point set title = $kp$硬盘读写扇区数据的过程$kp$, content = $kp$读写前已知要读写的扇区地址，包括磁头号（所在记录面，例如0号磁头）、柱面号（所在的磁道，例如0号柱面）和扇区号（所在的扇区，例如1号扇区）。
读写过程：先由柱面号控制磁头寻道，再等待扇区旋转到达磁头下方（由扇区号控制），最后由磁头号控制读写该扇区的数据。
相应的时间开销为平均寻道时间和平均等待时间。$kp$, section = '' where id = 22063;
update t_knowledge_point set title = $kp$硬盘驱动器接口电路的功能与类型$kp$, content = $kp$功能：在主机与硬盘驱动器之间提供一个数据、地址和控制信号的高速通道，实现主机对硬盘驱动器的各种控制，完成主机与硬盘之间的数据交换。
接口电路类型：IDE接口（Integrated Drive Electronics，集成驱动电子设备）和SCSI接口（Small Computer System Interface，小型计算机系统接口）。$kp$, section = '' where id = 22098;
update t_knowledge_point set title = $kp$U盘$kp$, content = $kp$采用NAND Flash存储器（闪存）芯片，体积小、重量轻。
容量按需要而定（几GB至几百GB），具有写保护功能。
数据保存安全可靠，使用寿命长。
使用USB接口，即插即用，支持热插拔（必须先停止工作）。
读写速度比较快。
可以模拟光驱和硬盘启动操作系统。$kp$, section = '' where id = 22131;
update t_knowledge_point set title = $kp$光盘存储器的发展$kp$, content = $kp$光盘存储器分三代：
第1代，1982年，CD光盘存储器，红外光，存储容量650MB。
第2代，1995年，DVD光盘存储器，红光，存储容量4.7GB。
第3代，2006年，BD光盘存储器，蓝光，存储容量25GB。
其中DVD和BD的容量均为单面单层的容量。$kp$, section = '' where id = 22134;
update t_knowledge_point set title = $kp$光盘驱动器的类型$kp$, content = $kp$按信息读写能力分为只读光驱和可写光驱（光盘刻录机）。
按可处理的盘片类型进一步分为：CD只读光驱、CD刻录机、DVD只读光驱、DVD刻录机、由DVD只读和CD刻录组合而成的“康宝”、BD（Blue-ray Disc）只读光驱、BD刻录机。
CD光盘容量约0.7GB，使用780nm红外激光。$kp$, section = '' where id = 22135;
update t_knowledge_point set title = $kp$固态硬盘（SSD）$kp$, content = $kp$固态硬盘（Solid State Disk、Solid State Drive）是使用NAND型闪存做成的外存储器。
用途：在便携式计算机中代替传统的硬盘。外形及与主机的接口和常规硬盘相同，如1.8英寸、2.5英寸或3.5英寸。
存储容量：64GB～128GB或更大。
优点：低功耗、无噪音、抗震动、低热量，读写速度也快于传统硬盘。
存在问题：成本高于常规硬盘；Flash存储器都有一定的写入寿命，寿命到期后数据会读不出来且难以修复。$kp$, section = '' where id = 22158;
update t_knowledge_point set title = $kp$存储卡$kp$, content = $kp$原理与U盘相同，也使用闪存芯片（flash memory）做成。
外形为长方形或正方形的卡片状，使用印刷插头，不使用USB插头，需使用读卡器才能对存储卡进行读写。
主要种类：CF卡、MMC卡、SD/SDHC卡（包括Mini SD卡、Micro SD卡）、Memory Stick卡（MS卡）。
用途：数码相机、游戏机、手机、MP3播放器等。$kp$, section = '' where id = 22163;
update t_knowledge_point set title = $kp$平板电脑和智能手机的辅助存储器$kp$, content = $kp$多数平板电脑的辅助存储器既不是硬盘也不是SSD：
iPad将NAND型Flash芯片直接焊接在主板上作为外存储器，容量可以是16GB、32GB、64GB或128GB；
微软公司的平板电脑Surface使用microSDXC存储卡；
多数智能手机的外存储器是micro SD存储卡。$kp$, section = '' where id = 22172;
update t_knowledge_point set title = $kp$硬盘存储器的结构$kp$, content = $kp$主要部件及作用：硬盘片用于存储数据；主轴带动盘片高速旋转；移动臂固定并带动磁头沿盘片径向移动；磁头浮在高速旋转的盘片上，负责盘片上数据的写入或读出；此外还有接口和控制电路。
所有盘片上相同半径处的所有磁道构成一个“柱面”。$kp$, section = '' where id = 22199;
update t_knowledge_point set title = $kp$移动硬盘$kp$, content = $kp$工作原理与固定硬盘相同。
存储容量较大（160GB、320GB、1TB、2TB等）。
采用USB或IEEE1394接口，即插即用，支持热插拔（必须先停止工作）。
小巧便于携带，速度快，安全可靠。$kp$, section = '' where id = 22202;
update t_knowledge_point set title = $kp$闪速存储器（flash memory）$kp$, content = $kp$闪速存储器是半导体集成电路存储器，属于非易失性存储器。
优点：没有机械运动部件，工作时无噪音，尺寸小、轻便，抗震性更好，能耐受高压高温。
不足：写入过程较复杂，写入速度慢于读出速度，写入次数有限制，性价比低于传统硬盘。
分类：
NOR型闪存可以按字节地址读出，用来存储需要运行但不常更新的程序代码，可作内存使用；
NAND型闪存的存储密度比NOR型高、每个比特的成本更低，抹写速度较快，可抹除次数也高出NOR型闪存十倍，但不能按字节随机读写，只能像硬盘那样以数据块为单位存取信息。$kp$, section = '' where id = 22225;
update t_knowledge_point set title = $kp$常见存储卡的种类$kp$, content = $kp$常见的存储卡有SM卡（Smart Media卡）、CF卡（Compact Flash卡）、Memory Stick（记忆棒）和SD（mini SD）卡等。$kp$, section = '' where id = 22242;
update t_knowledge_point set title = $kp$光盘片按读写特性分类$kp$, content = $kp$CD盘片：只读盘片（CD-ROM）、一次性可写盘片（CD-R）、可擦写盘片（CD-RW）。
DVD盘片：只读盘片（DVD-ROM）、一次性可写盘片（DVD-R、DVD+R）、可擦写盘片（DVD-RW、DVD+RW、DVD-RAM）。
蓝光盘片：只读盘片（BD-ROM）、一次性可写盘片（BD-R）、可擦写盘片（BD-RE）。$kp$, section = '' where id = 22243;
update t_knowledge_point set title = $kp$DVD容量比CD大得多的原因$kp$, content = $kp$1）凹坑长度更小（约2.08倍）；
2）数据轨道间隔更紧密（约2.16倍）；
3）采用波长较短的635nm或650nm红色激光，使激光斑点直径缩小，提高信息鉴别能力；
4）数据区域稍大（约1.02倍）；
5）信道比特调制更有效（约1.06倍）；
6）纠错码更有效（约1.32倍）；
7）段开销较少（约1.06倍）。$kp$, section = '' where id = 23848;
update t_knowledge_point set title = $kp$光盘的信息记录原理$kp$, content = $kp$光盘的信息记录在一条螺旋形光道上，通过在盘面压制凹坑来表示数据：凹坑的边缘处表示“1”，凹坑内和凹坑外的平坦处表示“0”，读出时用激光束分辨和识别。$kp$, section = '' where id = 23914;
update t_knowledge_point set title = $kp$磁盘的信息存储原理$kp$, content = $kp$磁头用于写入和读出信息。磁盘表面微小区域中磁性材料粒子的两种不同磁化方向，分别表示记录的是“0”还是“1”，盘片按一定方向旋转。$kp$, section = '' where id = 24059;
update t_knowledge_point set title = $kp$SD卡的分类$kp$, content = $kp$按尺寸大小分为SD卡、Mini SD卡、Micro SD卡（TF卡）。
按容量大小分为SD（8MB～2GB）、SDHC（大于2GB～32GB）、SDXC（大于32GB～2TB）。
按存取速度从快到慢分为UHS-II、UHS-I、Class 10、Class 6、Class 4等。$kp$, section = '' where id = 24226;
update t_knowledge_point set title = $kp$磁盘的磁道和扇区$kp$, content = $kp$磁盘表面被分为许多同心圆，每个同心圆称为一个磁道，每个磁道都有一个编号，最外面的是0磁道。每个磁道被划分为若干段，每段称为一个扇区，每个扇区的存储容量均为512字节，每个扇区也都有编号。$kp$, section = '' where id = 24973;
update t_knowledge_point set title = $kp$光盘存储器要点$kp$, content = $kp$特点：成本不高、容量较大、可靠性好、不容易损坏；盘面有指纹、灰尘时数据仍然可以读出；表面介质不受温度和环境的影响；但读出速度和数据传输速度比硬盘慢得多。
三代产品：第1代，1982年，CD光盘存储器，红外光，650MB；第2代，1995年，DVD光盘存储器，红光，4.7GB；第3代，2006年，BD光盘存储器，蓝光，25GB（单层）。
记录原理与磁盘不同，通过在盘面压制凹坑的方法记录信息：凹坑的边缘处表示“1”，凹坑内和凹坑外的平坦处表示“0”，信息的读出需使用激光进行分辨和识别。
光盘片：用来存储数据，基片是一种耐热的有机玻璃，信息记录在一条由里向外的连续螺旋状光道上。类型有CD盘片（红光）：CD-ROM只读盘片、CD-R一次性可写盘片、CD-RW可擦写盘片（不是无限擦写，可多次擦写）；DVD盘片（红光）：DVD-ROM只读盘片、DVD±R一次性可写盘片、DVD±RW和DVD-RAM可擦写盘片；蓝光光盘片：BD-ROM只读盘片、BD-R一次性可写盘片、BD-RE可擦写盘片。DVD盘片有单面单层、单面双层、双面单层、双面双层四种。
光盘驱动器：用来带动盘片旋转并读出盘片上的数据，与主机的接口大多是SATA接口，也可以使用USB接口。主要性能指标是数据传输速率，以基本CD-ROM驱动器的150KB/s作为基本度量单位（即倍速）。
驱动器类型：按信息读写能力分为只读光驱和可写光驱（即光盘刻录机，又一次性和多次擦写两种）；按可处理盘片类型分为CD只读光驱、CD刻录机（使用红外激光）、DVD只读光驱（具有向下兼容性，既能读出CD光盘也能读出DVD光盘，但不能在光盘上写入信息）、DVD刻录机（使用红色激光，可读写DVD光盘并兼容CD光盘读写）、DVD只读和CD刻录组合而成的组合光驱（康宝，既有DVD只读光驱功能，可读出CD和DVD盘片，又有CD光盘刻录机功能，可刻录CD-R、CD-RW）、BD只读光驱、BD刻录机。$kp$, section = '' where id = 25210;
update t_knowledge_point set title = $kp$闪速存储器与NOR、NAND型闪存$kp$, content = $kp$闪速存储器（Flash Memory）是一种半导体集成电路存储器，属于非易失性存储器。
与硬盘相比：抗震、耐高湿、耐高温，可携带；信息存取速度快，工作无噪声，尺寸小、轻便。但写入过程复杂，写入速度慢于读出速度；写入次数有限，数据损坏后难以修复，性价比也与硬盘有差距。
每个存储单元可存储1个比特（SLC闪存）、2个比特（MLC闪存）或3个比特（TLC闪存）。智能手机、U盘大多采用MLC或TLC型的NAND闪存芯片。
NOR型（或非型）：可以按字节地址读取存储单元内容，但写入前必须以块为单位进行擦除；适合存储不需要经常更新的程序代码（如BIOS程序、机顶盒和路由器中的固件）；用途是取代ROM芯片（EPROM与EEPROM只读存储器）。
NAND型（与非型）：比NOR型存储密度高、成本低；擦写速度较快，擦除次数高出NOR型10倍；不能按字节随机读写，只能和硬盘一样以数据块为单位存取信息；用途是取代磁介质存储器（硬盘）。
两者的存储单元结构、连接方式不相同，外围接口也不一样，性能有差异，用途不同。$kp$, section = '' where id = 25211;
update t_knowledge_point set title = $kp$采用NAND型闪存芯片的产品$kp$, content = $kp$U盘：又称优盘、闪存盘。机芯是一小块印刷电路板，机芯上的控制芯片是一个以8位CPU为核心的嵌入式计算机。支持即插即用，采用硬件加软件的双重数据安全防护。U盘可以模拟光盘和硬盘启动操作系统（需重新设置CMOS）。
存储卡：是在闪存芯片基础上做成的固态存储卡。SD卡按尺寸分为标准SD卡、Mini SD卡、Micro SD卡（TF卡）；按容量分三档：SD（8MB～2GB）、SDHC（大于2GB～32GB）、SDXC（大于32GB～2TB）；按数据读写速度由慢到快为Class 0、Class 2、Class 4、Class 6、Class 8、Class 10、UHS-I、UHS-II。MMC卡（多媒体存储卡）与标准SD卡大小差不多，可以插入SD卡槽使用，由控制电路和闪存芯片组成，其技术标准是开放的，其他厂商可免费使用。此外还有CF卡、Memory Stick（MS）卡。台式机PC配置了读卡器也可使用存储卡。
固态硬盘SSD：基于NAND型闪速存储器构成的辅助存储器，接口规范、功能、使用特性与普通硬盘完全相同，外形和尺寸保持一致。主体是一块印刷电路板，安装了NAND型闪存芯片、控制芯片和缓存芯片，缓存芯片由DRAM组成，用来辅助主控芯片进行数据处理。SSD与主机连接采用SATA、PCI-E接口，也可以使用USB3.0接口。读写速度快、功耗低、无噪音、抗震动，但价格高、容量低、硬件损坏很难修复、寿命短。PC还采用了混合硬盘（SSD+HDD）：SSD用来休眠和作为文件的高级缓冲，HDD机械硬盘用来海量存储数据。
闪存芯片存储器的通用接口：eMMC为并行接口，UFS为串行接口。$kp$, section = '' where id = 25212;
update t_knowledge_point set title = $kp$磁介质硬盘与光盘存储器要点$kp$, content = $kp$磁介质存储器即硬盘：需熟悉磁道、扇区、柱面的概念，相关计算题是重点；硬盘含有低速cache。
光盘：CD采用红外激光，沿螺旋状光道读取，CD-ROM可读不可写，CD-R可一次写入，CD-RW可反复读写；DVD采用红色激光；蓝光光盘采用蓝色激光。$kp$, section = '' where id = 25339;
update t_knowledge_point set title = $kp$存储设备容量不断增加$kp$, content = $kp$数据被存储在磁盘、磁带、光盘、闪存等各种类型的存储介质中。随着科学技术不断进步，存储设备的制造工艺不断升级，容量大幅增加，速度不断提升，价格却在不断下降。
早期的存储设备容量小、价格高、体积大。例如IBM在1956年生产的一个早期商业硬盘容量只有5MB，不仅价格昂贵，体积还有一个冰箱那么大。今天容量为1TB的硬盘大小只有3.5英寸（约8.89cm），读写速度达到200MB/s，价格仅为400元左右。廉价、高性能的硬盘不仅提供了海量的存储空间，也大大降低了数据存储成本。
与此同时，以闪存为代表的新型存储介质开始大规模普及和应用。闪存是一种新兴的半导体存储器，从1984年诞生第一款闪存产品开始，闪存技术不断取得新的突破，并逐渐在计算机存储产品市场中确立了自己的重要地位。闪存是非易失性存储器，即使断电也不会丢失数据，因此可以作为永久性存储设备，具有体积小、质量轻、能耗低、抗震性好等优良特性。
闪存芯片可以被封装制作成SD卡、U盘和固态盘等各种存储产品，SD卡和U盘主要用于个人数据存储，固态盘则越来越多地应用于企业级数据存储。一个32GB的SD卡体积只有24mm×32mm×2.1mm，质量只有0.5g。以前7200r/min的硬盘一秒钟读写次数只有100 IOPS（Input/Output Operations Per Second），传输速率只有50MB/s；而现在基于闪存的固态盘每秒钟读写次数有几万甚至更高的IOPS，访问延迟只有几十微秒，允许以更快的速度读写数据。
总体而言，数据量和存储设备容量是相辅相成、互相促进的。一方面，随着数据不断产生，需要存储的数据量不断增加，对存储设备容量提出更高要求，促使生产商制造更大容量的产品满足市场需求；另一方面，更大容量的存储设备进一步加快了数据量增长的速度。在存储设备价格高企的年代，考虑到成本问题，一些不必要或当前不能明显体现价值的数据往往会被丢弃；随着单位存储空间价格不断降低，人们开始倾向于把更多的数据保存起来，以期在未来某个时刻用更先进的数据分析工具从中挖掘价值。$kp$, section = '' where id = 26521;
update t_knowledge_point set title = $kp$各类外存储器的原理、组成、分类与接口$kp$, content = $kp$1）软盘
原理：软盘的读写通过软盘驱动器完成。马达带动盘片转动，转速约为每分钟300转；磁头定位器是一个很小的步进马达，负责把磁头移动到正确的磁道，由磁头完成读写操作。
组成：软盘外壳和盘片。
分类：常用的有5.25英寸和3.5英寸两种。
接口：内置使用FDD接口，外置使用USB接口。
2）U盘
原理：计算机把二进制数字信号转为复合二进制数字信号（加入分配、核对、堆栈等指令），读写到USB芯片适配接口，通过芯片处理信号，分配给EEPROM存储芯片的相应地址存储二进制数据，实现数据存储。
组成：主要由外壳和机芯组成。
分类：无驱型、加密型、启动型。
接口：USB接口。
3）硬盘
原理：硬盘是采用磁介质的数据存储设备，数据存储在密封于洁净的硬盘驱动器内腔的若干个磁盘片上。盘片一般在片基表面涂有磁性介质。在盘片每一面上，以转动轴为轴心、以一定磁密度为间隔的若干同心圆被划分成磁道（track），每个磁道又划分为若干扇区（sector），数据按扇区存放在硬盘上。每一面都相应地有一个读写磁头（head），不同磁头的所有相同位置的磁道构成柱面（cylinder）。传统硬盘读写以柱面、磁头、扇区为寻址方式（CHS寻址）。硬盘上电后保持高速旋转，位于磁头臂上的磁头悬浮在磁盘表面，可通过步进电机在不同柱面之间移动，对不同柱面进行读写。
组成：磁头、磁道、扇区、柱面。
分类：与主机通讯方式分XT型（即DMA方式）和AT型（即中断驱动方式）两种；磁头驱动分步进电机驱动和音圈电机驱动两种。
接口：硬盘接口分为IDE、SATA、SCSI、SAS和光纤通道五种。
4）光盘存储器
原理：光盘存储器是采用光存储技术存储信息的存储器，用聚焦激光束在盘式介质上非接触地记录高密度信息，以介质材料光学性质（如反射率、偏振方向）的变化表示所存储信息的“1”或“0”。
组成：圆形薄片。
分类：按可擦写性主要分为只读型光盘和可擦写型光盘。
接口：专用接口、IDE（EIDE）接口、SCSI接口。
5）磁带存储器
原理：利用称为磁头的装置来形成和判别磁层中的不同磁化状态。
组成：磁头、盘片。
分类：按带宽分有1/4英寸和1/2英寸；按带长分有2400英尺、1200英尺和600英尺；按外形分有开盘式磁带和盒式磁带；按记录密度分有800位/英寸、1600位/英寸、6250位/英寸；按带面并行记录的磁道数分有9道、16道等。
接口：磁带控制器是连接计算机与磁带机之间的接口设备。$kp$, section = '' where id = 26713;
update t_knowledge_point set title = $kp$磁盘中比特的表示与存储$kp$, content = $kp$磁盘表面微小区域中，磁性材料粒子的两种不同磁化状态分别表示0和1，由磁头完成信息的写入和读出，盘片按一定方向旋转。$kp$, section = '' where id = 26920;
update t_knowledge_point set title = $kp$硬盘是重要的外部存储设备$kp$, content = $kp$硬盘是目前计算机系统中重要的外部存储设备。$kp$, section = '' where id = 27062;
update t_knowledge_point set title = $kp$磁盘的两种磁化状态$kp$, content = $kp$磁盘表面微小区域中磁性材料粒子的两种不同磁化状态，分别表示二进制数据0和1。$kp$, section = '' where id = 27143;
update t_knowledge_point set title = $kp$光盘表面的凹凸状态$kp$, content = $kp$光盘信息记录层上压制出的凹坑边缘表示“1”，凹坑内外的平坦处表示“0”，读出时由激光分辨其凹凸状态。$kp$, section = '' where id = 27144;
update t_knowledge_point set title = $kp$外存的特点与存储介质$kp$, content = $kp$外存存取速度慢、容量大、成本低。内存都由半导体芯片构成；外存的存储介质有磁表面存储器（硬盘）和半导体芯片（U盘）等。$kp$, section = '' where id = 27199;
update t_knowledge_point set title = $kp$硬盘盘片的组成与数据记录原理$kp$, content = $kp$硬盘的盘片由铝合金（或玻璃）制成，盘片上涂有一层很薄的磁性材料，通过磁层的磁化来记录数据。$kp$, section = '' where id = 27206;
update t_knowledge_point set title = $kp$硬盘的接口$kp$, content = $kp$硬盘的接口：IDE、SATA。$kp$, section = '' where id = 27208;
update t_knowledge_point set title = $kp$只读型光盘（CD-ROM）$kp$, content = $kp$只读型光盘（CD-ROM）：只能读，不能写。$kp$, section = '' where id = 27211;
update t_knowledge_point set title = $kp$文件管理是对外存的管理$kp$, content = $kp$文件管理：对外存的管理。$kp$, section = '' where id = 27215;
update t_knowledge_point set title = $kp$硬盘接口$kp$, content = $kp$硬盘接口：IDE、SATA。$kp$, section = '' where id = 27247;
update t_knowledge_point set title = $kp$快速格式化$kp$, content = $kp$快速格式化：只删除硬盘上的文件，但不检查磁盘的坏扇区，也不做标注。$kp$, section = '' where id = 27262;
update t_knowledge_point set title = $kp$一次性写入光盘（CD-R）$kp$, content = $kp$一次性写入光盘（CD-R）：只能写入一次，可以反复读取。$kp$, section = '' where id = 27704;
update t_knowledge_point set title = $kp$一次性写入光盘（CD-R）$kp$, content = $kp$一次性写入光盘（CD-R）：只能写入一次。$kp$, section = '' where id = 27705;
update t_knowledge_point set title = $kp$可擦写型光盘（CD-RW）$kp$, content = $kp$可擦写型光盘（CD-RW）：可反复擦除和写入。$kp$, section = '' where id = 27706;
update t_knowledge_point set title = $kp$CD、DVD 与蓝光光碟使用的激光$kp$, content = $kp$CD 光盘使用红外激光，DVD 光盘使用红色激光，蓝光光碟使用蓝色激光。$kp$, section = '' where id = 27707;
update t_knowledge_point set title = $kp$硬盘盘片的组成与数据记录原理$kp$, content = $kp$硬盘的盘片由铝合金（或玻璃）制成，盘片上涂有一层很薄的磁性材料，通过磁层的磁化来记录数据。$kp$, section = '' where id = 28091;
update t_knowledge_point set title = $kp$硬盘的作用$kp$, content = $kp$硬盘的作用：长期保存各类信息的外存。$kp$, section = '' where id = 28093;
update t_knowledge_point set title = $kp$只读型光盘（CD-ROM）$kp$, content = $kp$只读型光盘（CD-ROM）：只能读，不能写。$kp$, section = '' where id = 28097;
update t_knowledge_point set title = $kp$DVD 光驱使用的激光$kp$, content = $kp$目前 DVD 光驱采用的激光为红色激光。$kp$, section = '' where id = 28098;
update t_knowledge_point set title = $kp$CD-ROM 采用的文件管理程序$kp$, content = $kp$CD-ROM 采用的是 CDFS 文件管理程序。$kp$, section = '' where id = 28261;
update t_knowledge_point set title = $kp$半导体芯片也可能是外存$kp$, content = $kp$半导体芯片也可能是外存。$kp$, section = '' where id = 28266;
update t_knowledge_point set title = $kp$外存的存储介质$kp$, content = $kp$外存的存储介质有：磁表面存储器（硬盘）、半导体芯片（U 盘）等。$kp$, section = '' where id = 28267;
update t_knowledge_point set title = $kp$硬盘的 SATA 接口$kp$, content = $kp$硬盘的接口：SATA 接口。$kp$, section = '' where id = 28269;
update t_knowledge_point set title = $kp$外存的特点$kp$, content = $kp$外存：存取速度慢，容量大，成本低。$kp$, section = '' where id = 28387;
update t_knowledge_point set title = $kp$半导体芯片与内存、外存的关系$kp$, content = $kp$内存由半导体芯片构成，但半导体芯片不都是内存，半导体芯片也可以是外存（如 U 盘）。内存按地址访问，外存可按文件名访问。$kp$, section = '' where id = 28483;
update t_knowledge_point set title = $kp$半导体芯片也可能是外存$kp$, content = $kp$半导体芯片也可能是外存。外存的存储介质有：磁表面存储器（硬盘）、半导体芯片（U 盘）等。$kp$, section = '' where id = 28484;
update t_knowledge_point set title = $kp$硬盘的缓存采用 DRAM$kp$, content = $kp$硬盘的 cache（缓存）是 DRAM。$kp$, section = '' where id = 28487;
update t_knowledge_point set title = $kp$硬盘接口的演进与 I/O 并行$kp$, content = $kp$硬盘的接口已经从 IDE 发展到 SATA 接口。

为了提高系统的效率，I/O 操作与 CPU 的数据处理操作通常是并行进行的。$kp$, section = '' where id = 28500;
update t_knowledge_point set title = $kp$一次性写入光盘（CD-R）$kp$, content = $kp$一次性写入光盘（CD-R）：只能写入一次，可以反复读取。$kp$, section = '' where id = 28566;
update t_knowledge_point set title = $kp$CD、DVD 与蓝光光碟使用的激光$kp$, content = $kp$CD 使用红外激光，DVD 使用红色激光，蓝光光碟使用蓝色激光。$kp$, section = '' where id = 28567;
update t_knowledge_point set title = $kp$光盘的文件管理系统$kp$, content = $kp$光盘的文件管理系统：UDF、CDFS。$kp$, section = '' where id = 28584;
update t_knowledge_point set title = $kp$可多次擦写型光盘（CD-RW）$kp$, content = $kp$CD-RW：可多次擦写型光盘。$kp$, section = '' where id = 28593;
update t_knowledge_point set title = $kp$CD-ROM 与 DVD-ROM 的存储容量$kp$, content = $kp$CD-ROM 盘片存储容量：600MB～700MB；DVD-ROM 盘片（单面单层）存储容量为 4.7GB。

DVD 比 CD 存储容量大的原因：DVD 的道间距比 CD 小，并利用聚焦更细的红色激光进行信息的存取。$kp$, section = '' where id = 28651;
update t_knowledge_point set title = $kp$U 盘、存储卡与固态硬盘$kp$, content = $kp$接口从 SATA 变成 USB。

U 盘、存储卡、固态硬盘的写保护是指不允许写入。$kp$, section = '' where id = 28687;
update t_knowledge_point set title = $kp$SSD 与嵌入式闪存的应用$kp$, content = $kp$现在计算机一般使用 SSD 作为系统盘，手机、平板一般是焊接 Nand 型 Flash 芯片。$kp$, section = '' where id = 28689;
update t_knowledge_point set title = $kp$光盘的分类与光道$kp$, content = $kp$光盘分为 CD（CD-ROM 只读型、CD-R 可记录一次型、CD-RW 可多次改写型）、DVD（DVD-ROM 只读型、DVD-R 可记录一次型、DVD-RW 可多次改写型）、BD（BD-ROM 只读型、BD-R 可记录一次型、BD-RW 可多次改写型）；它们的光道是“1 条由里向外的螺旋道”。$kp$, section = '' where id = 28750;
update t_knowledge_point set title = $kp$软盘、硬盘、CD 与 DVD 的记录面数$kp$, content = $kp$每张软盘、硬盘的盘片均含有两个记录面；CD 只有一个记录面；DVD 可为单记录面，也可为双记录面。$kp$, section = '' where id = 28755;
update t_knowledge_point set title = $kp$硬盘与显卡的接口$kp$, content = $kp$硬盘的接口：SATA 接口。

显卡的接口：PCI-E X16。$kp$, section = '' where id = 28826;
update t_knowledge_point set title = $kp$外存的特点$kp$, content = $kp$外存：

① 运行速度慢，断电后数据不会消失，存储量大。
② 不能直接和 CPU 交换数据。
③ 外存中：硬盘属于磁表面存储器，U 盘属于半导体存储器，光盘使用激光原理读取数据。$kp$, section = '' where id = 28869;
update t_knowledge_point set title = $kp$闪存的应用与内存、外存的区别$kp$, content = $kp$Flash Memory（闪存）用于 BIOS、U 盘、固态硬盘。

计算机中的存储器就像是人类使用的记忆装置。其中内存称为主存，属于工作存储器，不可缺少；外存称为辅助存储器，可以没有，实际用于海量存放数据。

内存和外存的说法放在当下并不准确，比如硬盘安装在计算机内部，却属于典型的外部存储器，现在只是沿用了以前的说法。$kp$, section = '' where id = 28872;
update t_knowledge_point set title = $kp$硬盘与主机的接口$kp$, content = $kp$硬盘与主机的接口：

1）定义：在主机内存和硬盘缓存之间提供一个数据传输的高速通道。
2）类型：IDE（PATA，仅机箱内部使用）、SCSI、光纤通道，以及主流的 SATA（150MB/s～300MB/s）。$kp$, section = '' where id = 28891;
update t_knowledge_point set title = $kp$特殊光盘与光驱、外存储器比较$kp$, content = $kp$特殊光盘和光驱：

1）CD-R（CD-Recordable）——只写一次式光盘：写入后不能修改，但允许反复多次读出的 CD 光盘存储器。
2）CD-RW（CD Rewritable）——可重复擦写型光盘存储器：信息写入后可改写，但平均只能擦写 1000～1500 次。
3）COMBO 不仅可以读写 CD 光盘，而且可以读 DVD 光盘。

移动存储器＝移动硬盘＋闪存盘（USB 接口、Flash ROM）。

外存储器比较：

| | 容量 | 速度 | 寿命 | 体积 | 便携性 |
| --- | --- | --- | --- | --- | --- |
| 软盘 | 1.44MB | 最慢 | 最短 | | |
| U 盘 | 8MB~16GB | 较快 | | 最小 | 最好 |
| 光盘 | 650MB、4.7GB | 较快 | | | |
| 硬盘 | 20GB~1.5TB | 最快 | 长 | 最大 | 最差 |$kp$, section = '' where id = 28892;
update t_knowledge_point set title = $kp$光盘与光驱的类型及存储原理$kp$, content = $kp$CD-ROM 只读光盘（光驱），单速 150KB/s；CD-R 只写一次式光盘；CD-RW 可擦写型光盘（刻录机）。

信息存储原理：在盘片的信息记录层上沿螺旋型轨道（光道）压制出一系列的凹坑。

DVD-ROM 只读光盘，存储量大；DVD-R 仅写一次；DVD-RW 可多次读写光盘。$kp$, section = '' where id = 28915;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21840,21847,21863,21868,21911,21917,21946,21978,22003,22030,22034,22063,22098,22131,22134,22135,22158,22163,22172,22199,22202,22225,22242,22243,23848,23914,24059,24226,24973,25210,25211,25212,25339,26521,26713,26920,27062,27143,27144,27199,27206,27208,27211,27215,27247,27262,27704,27705,27706,27707,28091,28093,28097,28098,28261,28266,28267,28269,28387,28483,28484,28487,28500,28566,28567,28584,28593,28651,28687,28689,28750,28755,28826,28869,28872,28891,28892,28915) and not deleted) <> 78 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
