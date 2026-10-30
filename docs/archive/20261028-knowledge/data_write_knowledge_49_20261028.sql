-- 知识点 49 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_49
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_49 as
select * from t_knowledge_point where id in (21818,21838,21839,21841,21842,21852,21897,21899,21912,21913,21916,21956,21957,22018,22068,22107,22154,22205,25337,25338,26702,26921,26922,26978,27066,27203,27204,27213,27237,27238,27280,27281,27282,27283,27284,27285,28029,28032,28042,28043,28044,28046,28087,28088,28089,28246,28279,28290,28291,28482,28488,28505,28561,28614,28617,28662,28673,28674,28675,28688,28705,28728,28730,28756,28776,28777,28778,28788,28825,28851,28852,28854,28855,28856,28870,28871,28877,28907,28909);

update t_knowledge_point set title = $kp$微电子技术基础元件的演变与四代计算机$kp$, content = $kp$电子管——第一代电子计算机（1946—1955）。

晶体管——第二代计算机（1956—1963）。

集成电路（Integrated Circuit，简称 IC）——20 世纪 50 年代出现。现代集成电路使用的半导体材料通常是硅（Si），也可以是砷化镓（GaAs）等化合物半导体。

中、小规模集成电路——第三代计算机（1964—1971）。

大规模、超大规模集成电路——第四代计算机（1972 年至今）。$kp$, section = '' where id = 21818;
update t_knowledge_point set title = $kp$BIOS 的四部分程序及功能$kp$, content = $kp$基本输入/输出系统（Basic Input/Output System，BIOS）是存放在主板只读存储器芯片（ROM）中的一组机器语言程序，具有启动计算机工作、诊断计算机故障及控制低级输入输出操作的功能，是操作系统最底层部分的可执行程序代码。由于 BIOS 存放在主板上的 ROM 芯片中，该芯片一般称为 BIOS 芯片。

BIOS 包含 4 部分程序，一般情况下不能被修改。

① POST（Power On Self Test，加电自检）程序，用于检测计算机故障。接通电源或按下 Reset 复位键时，系统首先执行 POST 程序，并根据 CMOS 中的配置信息对系统各部件进行测试和初始化，目的是判断各部件的工作状态是否正常，从而决定计算机的下一步操作；若发现不正常现象，POST 程序会在屏幕上报告错误信息。

② 系统自举（装入）程序，用于启动计算机。自举程序按 CMOS 中预先设定的外存启动顺序读出引导程序并装入内存，然后把控制权交给引导程序，由引导程序继续装入操作系统。

③ CMOS 设置程序。在 PC 机执行自举程序前，用户按下某一热键（如 Del）即可启动 CMOS 设置程序，查看和修改相关配置信息。

④ 基本外围设备的驱动程序，即实现常用外部设备输入输出操作的控制程序。上述过程中键盘、显示器、软驱、硬盘等常用基本外围设备都要参与工作，因此它们的驱动程序必须预先存放在 BIOS 中，成为 BIOS 的组成部分。$kp$, section = '' where id = 21838;
update t_knowledge_point set title = $kp$BIOS 存放在闪存中的组成与执行$kp$, content = $kp$BIOS 的中文名是基本输入/输出系统，它是存放在主板闪速存储器（Flash ROM）中的一组机器语言程序。由于存放在闪存中，即使机器关机，其中的内容也不会改变。每次机器加电时，CPU 总是首先执行 BIOS 程序，它具有诊断计算机故障及启动计算机工作的功能。

BIOS 包含 4 部分程序，一般情况下不能被修改。

① POST（加电自检）程序，检测计算机故障。接通电源或按下 Reset 复位键时，系统首先执行 POST 程序，并根据 CMOS 中的配置信息对各部件进行测试和初始化，以判断其工作状态是否正常，从而决定下一步操作；若发现异常，POST 程序会在屏幕上报告错误信息。

② 系统自举（装入）程序，启动计算机。自举程序按 CMOS 中预先设定的外存启动顺序读出引导程序并装入内存，再把控制权交给引导程序，由引导程序继续装入操作系统。

③ CMOS 设置程序。在 PC 机执行自举程序前，用户按下某一热键（如 Del）即可启动 CMOS 设置程序，查看和修改相关配置信息。

④ 基本外围设备的驱动程序，即实现常用外部设备输入输出操作的控制程序。启动过程中键盘、显示器、硬盘等常用外围设备都要参与工作，因此它们的驱动程序必须预先存放在 BIOS 中，成为 BIOS 的组成部分。$kp$, section = '' where id = 21839;
update t_knowledge_point set title = $kp$ROM 的三种类型：掩膜 ROM、PROM/EPROM 与 Flash ROM$kp$, content = $kp$① Mask ROM（掩膜 ROM）：存储的数据由工厂在生产过程中一次形成，此后无法修改。

② PROM（Programmable ROM，可编程只读存储器）和 EPROM（Erasable Programmable ROM，可擦除可编程只读存储器）：用户可用专用装置写入信息；前者写入后不能改写，后者可通过专用设备擦除并改写其中的信息。

③ Flash ROM（快擦除 ROM，又称闪速存储器、闪存）：一种新型非易失性存储器。在低电压下存储的信息只可读不可写，在较高电压下所存信息可以更改和删除。PC 机中用于存放 BIOS 程序，也用于数码相机和优盘。$kp$, section = '' where id = 21841;
update t_knowledge_point set title = $kp$SRAM 与高速缓存 Cache$kp$, content = $kp$原理：SRAM 芯片用于构造高速缓冲存储器（Cache，简称缓存），其速度几乎与 CPU 一样快。计算机执行程序时，CPU 会预测将要使用哪些数据和指令，并预先把它们送入 Cache。CPU 需要读取数据或指令时先检查 Cache，若命中则直接从 Cache 读取而不访问主存；未命中时再直接访问主存。因此 Cache 中的数据只是主存很小一部分内容的副本。

对比：与 DRAM 相比，SRAM 电路较复杂、集成度低、功耗较大、制造成本高、价格贵。

功能：匹配 CPU 与内存的工作速度，发挥 CPU 的高速性能。

指标：Cache 的重要指标是“命中率”，即 CPU 需要的指令或数据能在 Cache 中直接找到的概率。

结构：Cache 分为一级缓存和二级缓存。早期一级缓存设计在 CPU 内部、二级缓存设计在主板上；随着集成电路制造工艺的改进，现在两级缓存都集成在 CPU 内部，二级缓存的容量大于一级缓存。

容量：一级缓存（L1 Cache）为几 KB 至几十 KB，二级缓存（L2 Cache）为 128 KB 至 1 MB。一般来说容量越大命中率越高，但受成本限制容量并不大；容量过大还会降低 CPU 在 Cache 中查找的效率。$kp$, section = '' where id = 21842;
update t_knowledge_point set title = $kp$只读存储器 ROM 的分类$kp$, content = $kp$只读存储器（Read Only Memory，ROM）是一种能够永久或半永久地保存数据的存储器，掉电（或关机）后其中的数据不会丢失，因此称为非易失性存储器。按内容能否改写，ROM 可分为以下几类：

① Mask ROM（掩膜 ROM）：数据由工厂在生产过程中一次形成，此后无法修改。

② PROM（Programmable ROM）和 EPROM（Erasable Programmable ROM）：用户可用专用装置写入信息；前者写入后不能改写，后者可通过专用设备擦除后改写。

③ Flash ROM（快擦除 ROM，又称闪速存储器）：一种新型非易失性存储器，低电压下只可读、高电压下可改写，常用于存放 PC 中的 BIOS 程序，也用于数码相机和优盘。$kp$, section = '' where id = 21852;
update t_knowledge_point set title = $kp$内存储器的分类体系$kp$, content = $kp$内存储器由称为存储器芯片的半导体集成电路组成。半导体存储器芯片按能否随机读写，分为只读存储器（Read Only Memory，ROM）和随机存取存储器（Random Access Memory，RAM）两大类，其体系如下：

内存储器
- 只读存储器 ROM
  - 掩膜 ROM
  - 可编程 ROM（PROM）
  - 可编程可擦除 ROM（EPROM）
  - 快擦除存储器 Flash ROM，用于存放 BIOS
- 随机存储器 RAM
  - 静态随机存储器 SRAM，用作高速缓存 Cache
  - 动态随机存储器 DRAM：SDRAM（PC100、PC133）、DDR SDRAM（DDR200、DDR266）、双通道 RDRAM，用作主存（内存条）$kp$, section = '' where id = 21897;
update t_knowledge_point set title = $kp$主板上的 ROM（BIOS）与 CMOS$kp$, content = $kp$主板上还有两块特别有用的集成电路：一块是只读存储器（ROM），其中存放基本输入/输出系统（BIOS），它是 PC 机软件中最基础的部分；另一块是 CMOS 存储器，用于存放系统的配置参数，由电池供电。$kp$, section = '' where id = 21899;
update t_knowledge_point set title = $kp$CMOS 芯片存放的配置信息$kp$, content = $kp$CMOS 芯片是易失性的，存放计算机系统相关的一些参数（称为“配置信息”），包括当前的日期和时间、开机口令、已安装的光驱或硬盘的个数及类型、启动系统时访问外存的顺序等。这些数据非常重要，一旦丢失，系统将不能正常运行，甚至不能启动，所以需要用电池供电。$kp$, section = '' where id = 21912;
update t_knowledge_point set title = $kp$CMOS 芯片及 CMOS 设置程序$kp$, content = $kp$CMOS 芯片（互补金属氧化物半导体存储器）存放用户对计算机硬件设置的一些参数（称为“配置信息”），包括当前的日期和时间、开机口令、系统中安装的软盘和硬盘驱动器的数目、类型及参数、显示卡的类型、Cache 的使用状况、启动系统时访问外存的顺序等。这些数据非常重要，一旦丢失，系统将不能正常运行，甚至不能启动。

CMOS 是一种半导体存储器芯片，使用电池供电，属于易失性存储器；只要电池供电正常，关机后其中存储的信息不会丢失，时钟也不会停走。

启动过程中按下 Del 键（或其他键）可进入 CMOS 设置程序，允许用户修改系统硬件的部分配置信息。一般在下列情况下需要进入 CMOS 设置程序：

① PC 机组装好之后第一次加电。
② 系统增加、减少或更换硬件或 I/O 设备。
③ CMOS 芯片因掉电、病毒侵害、放电等原因造成内容丢失或被错误修改。
④ 用户希望更改或设置系统口令。
⑤ 系统因某种需要而调整某些设置参数。$kp$, section = '' where id = 21913;
update t_knowledge_point set title = $kp$DRAM 主存储器与内存条$kp$, content = $kp$主存储器主要由 DRAM 芯片组成，包含大量存储单元，每个存储单元可以存放 1 个字节（8 个二进制位）。存储器的存储容量就是它所包含的存储单元的总和。每个存储单元都有一个地址，CPU 按地址对存储器进行访问。

存储器的存取时间指从 CPU 给出存储器地址开始，到存储器读出数据并送到 CPU（或把 CPU 的数据写入存储器）所需要的时间，主存储器存取时间的单位是 ns（1 ns = 10⁻⁹ 秒）。

随着 CPU 前端总线工作频率的进一步提高，近几年大多数 PC 机已改用 DDR SDRAM（双倍数据速率的同步 DRAM）以及性能更优越的 DDR2 SDRAM、DDR3 SDRAM。

主存储器在物理结构上由若干内存条组成，内存条必须插入主板中相应的内存条插槽才能使用。DDR2 和 DDR3 均采用双列直插式内存条（DIMM 内存条），PC 机主板一般都配备 2 个或 4 个 DIMM 插槽。$kp$, section = '' where id = 21916;
update t_knowledge_point set title = $kp$随机存储器 RAM 的两类$kp$, content = $kp$随机存取存储器（Random Access Memory，RAM）多采用 MOS（金属氧化物半导体）型半导体集成电路芯片制成，属于易失性存储器。根据其保存数据的机理，又可分为 SRAM（静态随机存取存储器）和 DRAM（动态随机存取存储器）两类。$kp$, section = '' where id = 21956;
update t_knowledge_point set title = $kp$RAM 按保存机理的分类$kp$, content = $kp$随机存取存储器（RAM）属于易失性存储器。根据其保存数据的机理可分为 SRAM（静态随机存取存储器）和 DRAM（动态随机存取存储器）两类。$kp$, section = '' where id = 21957;
update t_knowledge_point set title = $kp$设备管理的概念与 BIOS 的组成$kp$, content = $kp$设备管理：对计算机系统中除 CPU 和内存以外的所有 I/O 设备的管理，驱动程序是操作系统和硬件之间的接口。设备管理的对象除了进行实际 I/O 操作的设备外，还包括控制器、通道等支持设备。

BIOS 的组成：

① 加电自检程序（POST）：检测计算机硬件故障。
② 系统自举程序（Boot）：启动计算机，加载并进入操作系统运行状态。
③ CMOS 设置程序：设置日期、时间、口令等系统参数。$kp$, section = '' where id = 22018;
update t_knowledge_point set title = $kp$固件（Firmware）的含义$kp$, content = $kp$固件（Firmware）就是写入 EPROM（可擦除可编程只读存储器）或 EEPROM（电可擦可编程只读存储器）中的程序。固件是设备内部保存的“驱动程序”，通过固件，操作系统才能按照标准的设备驱动实现特定机器的运行动作，例如光驱、刻录机等都有内部固件。$kp$, section = '' where id = 22068;
update t_knowledge_point set title = $kp$BIOS 芯片包含的四类程序$kp$, content = $kp$加电自检程序（POST，Power On Self Test）：用于检测计算机硬件故障。

系统自举程序（Boot）：启动计算机工作，加载并进入操作系统运行状态。

CMOS 设置程序：设置日期、时间、口令、配置参数等系统参数。

常用外部设备的驱动程序（Driver）：在计算机启动阶段实现对键盘、显示器、软驱和硬盘等常用外部设备输入输出操作的控制。$kp$, section = '' where id = 22107;
update t_knowledge_point set title = $kp$半导体存储器的分类与应用$kp$, content = $kp$半导体存储器分为易失性存储器（RAM）和非易失性存储器（ROM）两类。

易失性存储器 RAM：
- SRAM（静态随机存取存储器）：每个存储单元由 6 个晶体管组成，只要加上电信息就能一直保持，对电器干扰不很敏感，比 DRAM 更快也更贵，用作 Cache。
- DRAM（动态随机存取存储器）：每个存储单元由 1 个电容和 1 个晶体管组成，每 10～100 ms 必须刷新一次，对电器干扰比较敏感，比 SRAM 慢但便宜，用作主存储器。

非易失性存储器 ROM：
- EEPROM。
- 闪速存储器（Flash Memory）：NOR 型可用作内存（存放 BIOS 等固件），也可用作辅存（U 盘、固态硬盘）；NAND 型用作智能手机、平板电脑的辅助存储器。$kp$, section = '' where id = 22154;
update t_knowledge_point set title = $kp$BIOS 与 CMOS 相关选项的错误分析$kp$, content = $kp$选项 B 描述错误：主板上有一个闪速存储器，用来存放基本输入/输出系统（BIOS），它是 PC 启动时最先运行的软件，没有它机器就无法启动。

选项 C 描述错误：主板上还有一个 CMOS 存储器，其中存放与计算机系统相关的一些参数，包括当前的日期和开机口令、已安装的光驱和硬盘的个数及类型、加载操作系统的顺序等；基本外围设备的驱动程序属于 BIOS 的组成部分，并不存放在 CMOS 中。$kp$, section = '' where id = 22205;
update t_knowledge_point set title = $kp$BIOS 与 CMOS 的思维导图$kp$, content = $kp$主板 → BIOS / CMOS

BIOS（基本输入/输出系统）的功能：
1. POST 加电自检
2. 系统自举
3. CMOS 设置程序
4. 基本外围设备驱动程序

启动流程：POST → 系统自举 → 引导程序 → 操作系统

CMOS：
- 易失性
- 存放基本配置信息
- 时间
- 日期
- 开机口令$kp$, section = '' where id = 25337;
update t_knowledge_point set title = $kp$半导体存储器与 ROM 的分类思维导图$kp$, content = $kp$存储器 → 半导体部分

触发器：位于 CPU 中，一组触发器构成寄存器，1 个触发器存储 1 b。

电容器 → 半导体存储器：
- 易失性 RAM
  - SRAM（静态随机存储器）→ Cache
  - DRAM（动态随机存储器）→ 内存主存，一个存储单元为 8 b
- 非易失性 ROM
  - Mask ROM → 一次成型，不可修改
  - PROM → 写入后不可修改
  - EPROM → 可擦除修改
  - Flash ROM（闪存）
    - NOR 型 → BIOS
    - NAND 型 → U 盘、固态硬盘 SSD（成本高、有寿命、难修复）$kp$, section = '' where id = 25338;
update t_knowledge_point set title = $kp$BIOS 的组成、启动过程与内存储器类型$kp$, content = $kp$1）BIOS 的组成：由加电自检程序、系统自举程序、CMOS 设置程序和基本外围设备驱动程序四部分组成。

2）BIOS 的运行过程：计算机加电后一般不直接执行操作系统，而是先执行系统初始化软件，完成基本 I/O 初始化和引导加载。系统初始化软件是在操作系统内核运行之前运行的一段小程序，通过它可以初始化硬件设备、建立系统的内存空间映射图，把系统的软硬件环境带到合适的状态，为最终调用操作系统内核准备好正确的环境。最后由引导加载程序把操作系统内核映像装入 RAM，并将系统控制权交给它。

3）内存储器 RAM 和 ROM 的类型：ROM 是只读存储器，只能读出信息、不能写入，关机后其中的信息仍然保存，一般用于存放固定的系统软件和字库等；RAM 是随机存取存储器，可对其中任一存储单元进行读或写，关机后信息不再保存，再次开机需要重新装入，通常用于存放操作系统、正在运行的软件、输入输出数据、中间结果以及与外存交换的信息。$kp$, section = '' where id = 26702;
update t_knowledge_point set title = $kp$用电容存储二进位信息$kp$, content = $kp$计算机存储器中用电容器存储二进位信息：当电容的两极被加上电压时它就被充电，电压去掉后充电状态仍可保持一段时间，因而 1 个电容可用来存储 1 个比特。

存储单元由字线、位线和读出放大器等构成。$kp$, section = '' where id = 26921;
update t_knowledge_point set title = $kp$电容充放电状态表示 0 和 1$kp$, content = $kp$电容 C 处于充电状态时表示 1，处于放电状态时表示 0。

半导体存储器利用集成电路技术，可以在半导体芯片上制作出数以亿计的微型电容器，从而存储大量二进位信息。这类靠电容保存电荷的存储器属于易失性存储器，断电后信息不再保持。$kp$, section = '' where id = 26922;
update t_knowledge_point set title = $kp$计算机的启动顺序$kp$, content = $kp$开机顺序：先开外设电源开关，后开主机电源开关。

启动时依次执行：BIOS 中的加电自检程序（POST）→ BIOS 中的自举程序 → 系统引导程序（从外存装入内存）→ 操作系统程序（从外存装入内存）。

注：启动过程中按 F8 键可进入 Windows 安全模式菜单。$kp$, section = '' where id = 26978;
update t_knowledge_point set title = $kp$电容充放电状态表示 RAM 中的 0 和 1$kp$, content = $kp$RAM（动态随机存储器）用电容的充电状态或放电状态来记录二进位信息：充电表示 1，放电表示 0。$kp$, section = '' where id = 27066;
update t_knowledge_point set title = $kp$SRAM 与 DRAM 的对比$kp$, content = $kp$随机存储器 RAM 分为两类。

① SRAM：无须刷新，读写速度较快；电路复杂、集成度低、能耗高、成本较高，用于 Cache。

② DRAM：须定时刷新，读写速度较慢；电路简单、集成度高、能耗低、成本较低，用于主存。$kp$, section = '' where id = 27203;
update t_knowledge_point set title = $kp$闪速存储器 Flash ROM 的特点与应用$kp$, content = $kp$只读存储器 ROM 中的 Flash ROM（又称闪速存储器）：非易失性存储器，断电后信息不丢失；低电压下只可读，高电压下可写入和擦除。用于存放 BIOS 程序，也用于数码相机存储卡、固态硬盘、U 盘等。$kp$, section = '' where id = 27204;
update t_knowledge_point set title = $kp$操作系统启动中的 POST 与引导装入$kp$, content = $kp$操作系统启动过程：加电后先执行 BIOS 中的加电自检程序 POST，再由引导装入程序（自举程序）把引导程序装入内存并移交控制权，由引导程序加载操作系统；BIOS 中的基本外围设备驱动程序是操作系统与硬件之间的接口。$kp$, section = '' where id = 27213;
update t_knowledge_point set title = $kp$CMOS 信息丢失的常见原因$kp$, content = $kp$CMOS 芯片因掉电（电池失效）、病毒侵害或放电等原因，会造成其中的配置信息丢失或被错误修改。$kp$, section = '' where id = 27237;
update t_knowledge_point set title = $kp$BIOS 或 CMOS 损坏对启动的影响$kp$, content = $kp$BIOS、CMOS 芯片如果发生损坏，计算机将无法正常启动。CMOS 参数被破坏后，无法正常找到引导程序，从而导致无法加载操作系统。$kp$, section = '' where id = 27238;
update t_knowledge_point set title = $kp$BIOS 芯片是非易失的 ROM$kp$, content = $kp$BIOS 芯片指的是主板上的一块 ROM 存储器，断电后其中的信息不会丢失。$kp$, section = '' where id = 27280;
update t_knowledge_point set title = $kp$BIOS 的四个组成部分$kp$, content = $kp$BIOS 由加电自检程序 POST、系统自举程序 Boot、CMOS 设置程序和基本外围设备驱动程序组成。$kp$, section = '' where id = 27281;
update t_knowledge_point set title = $kp$计算机启动的先后顺序$kp$, content = $kp$计算机启动顺序：POST（加电自检）→ 引导装入程序（自举程序）→ 引导程序 → 操作系统。$kp$, section = '' where id = 27282;
update t_knowledge_point set title = $kp$CMOS 芯片属于 RAM 及病毒对硬件的破坏$kp$, content = $kp$CMOS 芯片是主板上的一块 RAM（随机存取存储器），靠电池供电保存配置信息。

知识拓展：计算机病毒主要破坏程序和数据，但也可以破坏部分硬件，例如 CIH 病毒可破坏主板上的 BIOS 芯片和硬盘数据。$kp$, section = '' where id = 27283;
update t_knowledge_point set title = $kp$CMOS 中存放的基本参数$kp$, content = $kp$CMOS 存放计算机的一些基本参数，包括当前的日期和时间、硬件启动顺序等，这些参数可以改写。$kp$, section = '' where id = 27284;
update t_knowledge_point set title = $kp$用 BIOS 设置程序设置 CMOS 参数$kp$, content = $kp$通过 BIOS 中的 CMOS 设置程序对 CMOS 参数进行设置。$kp$, section = '' where id = 27285;
update t_knowledge_point set title = $kp$Cache 的组成与速度特点$kp$, content = $kp$Cache 一般由 SRAM 芯片组成，存取速度快于主存但慢于 CPU，容量小于主存。$kp$, section = '' where id = 28029;
update t_knowledge_point set title = $kp$Cache 与主存的映射关系$kp$, content = $kp$Cache 中的数据是主存中部分内容的映射，数据从内存调入 Cache 由硬件（CPU）自动完成，无需人为干预，其依据是程序访问的局部性原理。$kp$, section = '' where id = 28032;
update t_knowledge_point set title = $kp$BIOS 中程序的性质$kp$, content = $kp$BIOS 芯片中存放的一组机器语言程序属于系统软件。$kp$, section = '' where id = 28042;
update t_knowledge_point set title = $kp$CMOS 中可改写的配置参数$kp$, content = $kp$CMOS 存放计算机的一些基本参数，包括当前的日期和时间、硬件启动顺序等，可以改写。$kp$, section = '' where id = 28043;
update t_knowledge_point set title = $kp$CMOS 断电后信息丢失，需主板电池供电$kp$, content = $kp$计算机断电后 CMOS 中的信息会丢失，因此 CMOS 芯片需要主板上的电池供电，以保证断电后信息不丢失。知识拓展：计算机病毒主要破坏程序和数据，但也可以破坏部分硬件，例如 CIH 病毒可以破坏主板 BIOS（Flash ROM）中的程序。$kp$, section = '' where id = 28044;
update t_knowledge_point set title = $kp$BIOS 或 CMOS 芯片损坏会导致计算机无法启动$kp$, content = $kp$BIOS、CMOS 芯片如果发生损坏，计算机将无法正常启动。CMOS 参数被破坏后，将无法正常找到引导程序，从而导致无法加载操作系统。$kp$, section = '' where id = 28046;
update t_knowledge_point set title = $kp$半导体存储器分为 RAM 和 ROM$kp$, content = $kp$半导体存储器芯片分为随机存储器 RAM 和只读存储器 ROM。$kp$, section = '' where id = 28087;
update t_knowledge_point set title = $kp$RAM 分为 SRAM 和 DRAM$kp$, content = $kp$随机存取存储器 RAM 可分为：
① SRAM：不需要刷新，读写速度较快；电路复杂，集成度低，能耗高，成本较高；用于 Cache。
② DRAM：需要定时刷新，读写速度较慢；电路简单，集成度高，能耗低，成本较低；用于主存。$kp$, section = '' where id = 28088;
update t_knowledge_point set title = $kp$Flash ROM 闪速存储器的特点与用途$kp$, content = $kp$只读存储器 ROM 中的 Flash ROM 又称闪速存储器，是非易失性存储器，断电后信息不丢失，低电压可读、高电压可写。用于存放 BIOS、数码相机存储卡、固态硬盘、优盘等。$kp$, section = '' where id = 28089;
update t_knowledge_point set title = $kp$CMOS 是易失性存储器，靠主板电池供电$kp$, content = $kp$CMOS 属于易失性存储器，但主板上安装有一颗纽扣电池给 CMOS 供电，防止主机断电后参数丢失。$kp$, section = '' where id = 28246;
update t_knowledge_point set title = $kp$高速缓存 Cache 的特点与命中率$kp$, content = $kp$高速缓存（Cache）：容量越大、级数越多，效果越显著。
① CPU 的 Cache 一般由 SRAM 芯片组成，存取速度快于主存、慢于 CPU；与主存统一编址，可被 CPU 访问。
② Cache 中的数据是主存中部分内容的映射。
③ Cache 的替换依据局部性访问原理。
④ Cache 命中率是 CPU 在 Cache 中找到所需数据的概率，命中率越高越好。
⑤ Cache 具有透明性，程序或程序员不能直接访问。$kp$, section = '' where id = 28279;
update t_knowledge_point set title = $kp$存储器按存储芯片分为 RAM 和 ROM$kp$, content = $kp$按照存储芯片的不同，存储器分为随机存储器 RAM 和只读存储器 ROM。PC 机中用户实际可用的内存容量通常指 RAM 的容量。$kp$, section = '' where id = 28290;
update t_knowledge_point set title = $kp$RAM 的分类$kp$, content = $kp$随机存储器 RAM 可分为静态随机存储器 SRAM 和动态随机存储器 DRAM。$kp$, section = '' where id = 28291;
update t_knowledge_point set title = $kp$BIOS 芯片属于 ROM，断电后信息不丢失$kp$, content = $kp$BIOS 芯片属于 ROM（Flash ROM）芯片，断电后信息不会丢失。$kp$, section = '' where id = 28482;
update t_knowledge_point set title = $kp$CPU 的 Cache 由 SRAM 组成并与主存统一编址$kp$, content = $kp$CPU 的 Cache 由 SRAM 组成。高速缓存（Cache）与主存统一编址，接受 CPU 的访问，其存取速度远高于主存。$kp$, section = '' where id = 28488;
update t_knowledge_point set title = $kp$SRAM 不需要刷新，用作 CPU 的 Cache$kp$, content = $kp$SRAM 是静态存储器，不需要刷新，用作 CPU 的 Cache。使用 B/S 模式访问动态生成的网页，B/S 指客户层—Web 服务器层—数据库服务器层。$kp$, section = '' where id = 28505;
update t_knowledge_point set title = $kp$PC 机组装后第一次加电需设置 CMOS 参数$kp$, content = $kp$PC 机组装之后第一次加电，需要进入 CMOS 设置程序进行参数设置。$kp$, section = '' where id = 28561;
update t_knowledge_point set title = $kp$BIOS 的功能作用$kp$, content = $kp$功能作用：① 开机时诊断计算机故障（比如出现蓝屏）；② 启动计算机工作；③ 启动阶段控制外设的基本输入输出操作（键盘、鼠标、磁盘读写、屏幕显示等）。$kp$, section = '' where id = 28614;
update t_knowledge_point set title = $kp$增大 Cache 容量或增加级数可缓解 CPU 与内存速度不匹配$kp$, content = $kp$增大 Cache 存储器容量、增加 Cache 的级数，可以解决 CPU 与内存速度不匹配的问题。$kp$, section = '' where id = 28617;
update t_knowledge_point set title = $kp$RAM 用电容充放电状态表示 1 和 0，断电后信息不保存$kp$, content = $kp$内存（RAM）用电容的充电状态表示 1，用电容放电或无电状态表示 0，断电后信息不保存。$kp$, section = '' where id = 28662;
update t_knowledge_point set title = $kp$BIOS 包含的四个程序$kp$, content = $kp$BIOS 包含 4 个程序：
加电自检程序（POST）：开机对计算机硬件进行检查。
系统自举程序（BOOT）：加载操作系统。
CMOS 设置程序：可以修改日期、时间、硬件口令及配置参数。
常用设备的驱动程序：鼠标、键盘、显示器、磁盘等驱动。$kp$, section = '' where id = 28673;
update t_knowledge_point set title = $kp$CMOS 芯片存放参数，由主板纽扣电池供电$kp$, content = $kp$CMOS 芯片使用 RAM 作为存储器，存放日期、时间、口令和配置参数，由主板上的纽扣电池供电。$kp$, section = '' where id = 28674;
update t_knowledge_point set title = $kp$半导体存储器的分类与各类芯片用途$kp$, content = $kp$半导体存储器分为随机存取存储器（RAM）和只读存储器（ROM）。
RAM 中：SRAM（静态随机存取存储器）用作高速缓存；DRAM（动态随机存取存储器）用作内存条芯片。
ROM 中：EPROM 一般用于低端设备，内部存储的程序一般不可以修改；Flash ROM 即闪速存储器，分 Nor 型和 Nand 型，Nor 型擦写次数少但寿命长，Nand 型擦写次数多但寿命短。$kp$, section = '' where id = 28675;
update t_knowledge_point set title = $kp$Flash ROM 的 Nor 型与 Nand 型$kp$, content = $kp$Nor 型：按字节编址，用作内存（BIOS ROM），寿命长，擦写次数少。
Nand 型：按数据块编址，用作外存，寿命短，擦写次数多。$kp$, section = '' where id = 28688;
update t_knowledge_point set title = $kp$操作系统的启动过程$kp$, content = $kp$操作系统的启动：
第一步：执行 BIOS 中的加电自检，与操作系统无关。
第二步：执行 BIOS 中的引导装入程序（自举程序），与操作系统无关。
第三步：装入并执行硬盘上的主引导记录（512 字节的机器代码程序），不同操作系统的主引导记录程序不同，与操作系统相关；主引导记录装入并执行操作系统的引导程序。
第四步：由操作系统的引导程序不断装入并执行操作系统本身。
注意：启动过程中会读取 CMOS 中的参数数据，若 CMOS 中数据丢失，系统可能无法正常启动。$kp$, section = '' where id = 28705;
update t_knowledge_point set title = $kp$BIOS 主要包含的四个部分程序$kp$, content = $kp$BIOS 主要包含四个部分的程序：POST（加电自检程序）、系统自举（读出系统引导程序）、CMOS 设置程序（增加或减少硬件、更改系统日期时间等）、基本外设驱动程序（如键盘、硬盘、显示器等）。$kp$, section = '' where id = 28728;
update t_knowledge_point set title = $kp$DRAM 与 SRAM 的用途及差别$kp$, content = $kp$RAM 分为 DRAM（主要用来制造内存条和硬盘中的缓存）和 SRAM（主要用来制造 Cache）；SRAM 比 DRAM 成本高、速度快。$kp$, section = '' where id = 28730;
update t_knowledge_point set title = $kp$系统配置信息保存在主板 CMOS 存储器中$kp$, content = $kp$PC 机中的系统配置信息，如硬盘的参数、当前时间、日期等，均保存在主板上需要使用电池供电的 CMOS 存储器中。$kp$, section = '' where id = 28756;
update t_knowledge_point set title = $kp$BIOS 与 CMOS 的区别$kp$, content = $kp$BIOS 是只读存储器（ROM），CMOS 则是 RAM 存储器。BIOS 中存放的是程序，CMOS 中存放的是参数。$kp$, section = '' where id = 28776;
update t_knowledge_point set title = $kp$系统自举按 CMOS 设置的启动顺序引导系统$kp$, content = $kp$系统自举时，BIOS 读取 CMOS 中设置的开机启动顺序，找到引导设备后把控制权交给引导程序，再由引导程序引导系统启动。$kp$, section = '' where id = 28777;
update t_knowledge_point set title = $kp$CMOS 中存储的是硬件设置参数$kp$, content = $kp$CMOS 中存储的是用户对计算机硬件的设置参数，一般添加新硬件或优化开机时才设置 CMOS。在 CMOS 中可以设置系统时间、启动顺序、病毒检测、即插即用设备、开机密码及 CMOS 密码、磁盘驱动器数量等。$kp$, section = '' where id = 28778;
update t_knowledge_point set title = $kp$断电后 CMOS 中的信息会丢失$kp$, content = $kp$断电后 CMOS 中的信息会丢失，所以 CMOS 芯片须由主板上的电池供电，以保证计算机断电后信息不丢失。$kp$, section = '' where id = 28788;
update t_knowledge_point set title = $kp$BIOS 的内容与执行时机$kp$, content = $kp$BIOS 里面的内容不可以被用户自行修改，但可以通过运行厂家发布的软件升级 BIOS 程序。BIOS 里面的程序开机就会执行，早于操作系统的运行。BIOS 芯片属于 ROM（Flash ROM），断电后信息不会丢失。开机后先执行 BIOS，再启动操作系统。$kp$, section = '' where id = 28825;
update t_knowledge_point set title = $kp$BIOS 芯片中的程序组成$kp$, content = $kp$BIOS 芯片的程序由加电自检、引导装入程序（系统自举）、CMOS 设置程序、基本设备驱动程序组成。$kp$, section = '' where id = 28851;
update t_knowledge_point set title = $kp$计算机加电后先执行 BIOS 再运行操作系统$kp$, content = $kp$计算机加电后，CPU 会立刻执行 BIOS 芯片中的程序，而不会先运行操作系统，这个顺序一定要注意。$kp$, section = '' where id = 28852;
update t_knowledge_point set title = $kp$CMOS 存放参数，属易失性存储器但由电池持续供电$kp$, content = $kp$CMOS 芯片中存放的是参数，属于易失性存储器；需要主板电池供电，断电后由于主板电池持续供电，所以信息不会丢失。$kp$, section = '' where id = 28854;
update t_knowledge_point set title = $kp$需要设置 CMOS 参数的几种情况$kp$, content = $kp$需要进行 CMOS 参数设置的情况：
- PC 机组装之后第一次加电；
- 系统增加、减少或更换硬件设备时；
- CMOS 芯片因为主机断电、病毒造成信息丢失；
- 用户希望更换系统口令、日期；
- 需要更改启动盘顺序。$kp$, section = '' where id = 28855;
update t_knowledge_point set title = $kp$BIOS 存程序，CMOS 存参数$kp$, content = $kp$BIOS 和 CMOS 本质上来说都是存储器，看到 BIOS 应想到 BIOS 里面存放的是程序，CMOS 里面存放的是参数。$kp$, section = '' where id = 28856;
update t_knowledge_point set title = $kp$静态随机存储器 SRAM 的特点$kp$, content = $kp$静态随机存储器 SRAM：集成度低、功耗大、成本高、速度快、不需要刷新，用作 CPU 的 Cache。$kp$, section = '' where id = 28870;
update t_knowledge_point set title = $kp$动态随机存储器 DRAM 的特点$kp$, content = $kp$动态随机存储器 DRAM：集成度高、功耗小、成本低、速度慢，需要刷新，用于主存。$kp$, section = '' where id = 28871;
update t_knowledge_point set title = $kp$Windows 虚拟内存文件 pagefile.sys$kp$, content = $kp$在 Windows 中，虚拟内存文件位于系统盘系统根目录下的 pagefile.sys。用户可以设置虚拟内存的大小，也可以指定虚拟内存放在哪个硬盘中。$kp$, section = '' where id = 28877;
update t_knowledge_point set title = $kp$Cache 的作用及 BIOS、CMOS 要点$kp$, content = $kp$Cache（高速缓存）的作用是缓解内存与 CPU 的速度差。Cache 由静态存储芯片（SRAM）组成，速度接近于 CPU，用来存放指令和数据，通常保存内存中部分内容的副本。
BIOS：基本输入输出系统，每次开机都运行；是 ROM 只读存储器，只能读不能写；由加电自检、系统自举、CMOS 设置、基本设备驱动程序组成。
CMOS：RAM 随机存储器，属易失性存储器；需要电池供电；保存系统配置参数，如时间、启动盘顺序；容易被病毒破坏。$kp$, section = '' where id = 28907;
update t_knowledge_point set title = $kp$存储器分类、速度排序及 I/O 设备特点$kp$, content = $kp$半导体存储器分为随机存储器 RAM 和只读存储器 ROM。
PC 机中用户实际可用的内存容量通常指 RAM 的容量。
随机存储器 RAM 可分为静态随机存储器 SRAM（用作 Cache 存储器）和动态随机存储器 DRAM（用作主存储器）。
只读存储器 ROM 可分为不可在线改写内容的 ROM 和可擦除的 Flash ROM（用于存放 BIOS）。
RAM 能够直接与外存交换数据。
计算机中存储器速度由快到慢：CPU → 寄存器 → Cache → 内存 → 外存储器（软盘、硬盘、光盘）→ 后备存储器（磁带库、光盘库）。
I/O 即输入/输出设备：I/O 操作与 CPU 的运算可并行进行；多个 I/O 设备可以同时工作；每类 I/O 设备都有各自的控制器，它们按照 CPU 的 I/O 操作命令独立控制 I/O 操作的全过程。$kp$, section = '' where id = 28909;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21818,21838,21839,21841,21842,21852,21897,21899,21912,21913,21916,21956,21957,22018,22068,22107,22154,22205,25337,25338,26702,26921,26922,26978,27066,27203,27204,27213,27237,27238,27280,27281,27282,27283,27284,27285,28029,28032,28042,28043,28044,28046,28087,28088,28089,28246,28279,28290,28291,28482,28488,28505,28561,28614,28617,28662,28673,28674,28675,28688,28705,28728,28730,28756,28776,28777,28778,28788,28825,28851,28852,28854,28855,28856,28870,28871,28877,28907,28909) and not deleted) <> 79 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
