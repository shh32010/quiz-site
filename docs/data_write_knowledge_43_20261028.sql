-- 知识点 43 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_43
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_43 as
select * from t_knowledge_point where id in (21879,21886,21892,21894,21930,21934,21937,21966,21988,21996,22019,22109,22129,22132,22140,22144,22180,22181,22183,22194,22223,22224,22471,22486,23534,23765,24708,25166,25203,25204,25205,25207,25332,25333,25334,25359,26522,26696,27172,27173,27174,27229,27230,27231,27260,27643,27700,27755,27756,28009,28020,28021,28022,28023,28025,28026,28027,28033,28034,28086,28242,28243,28263,28278,28280,28295,28391,28470,28471,28472,28473,28490,28492,28493,28495,28496,28497,28556,28558,28559,28560,28619,28620,28622,28635,28636,28637,28638,28639,28657,28669,28670,28704,28721,28722,28723,28751,28752,28760,28767,28769,28775,28822,28823,28824,28840,28841,28843,28844,28849,28887,28888,28906,28926,28946,29747,30140);

update t_knowledge_point set title = $kp$Cache 与程序访问的局部性$kp$, content = $kp$Cache 技术利用程序访问的局部性原理，把程序中正在使用的部分存放在高速的、容量较小的 Cache 中，使 CPU 的访存操作大多数针对 Cache 进行，从而大大提高程序的执行速度。$kp$, section = '' where id = 21879;
update t_knowledge_point set title = $kp$微处理器发展的标志$kp$, content = $kp$微处理器的发展标志包括字长、结构、功能、晶体管数目和工作频率。$kp$, section = '' where id = 21886;
update t_knowledge_point set title = $kp$CPU 的工作频率：主频、外频与倍频$kp$, content = $kp$主频是 CPU 内部的时钟频率，即 CPU 进行运算时的工作频率。一般来说，主频越高，CPU 的运算速度越快；但由于内部结构不同，并非所有时钟频率相同的 CPU 性能都一样。

外频即系统总线频率，指 CPU 与周边设备传输数据的频率，具体是 CPU 到芯片组之间的总线速度。

倍频：主频 = 外频 × 倍频。倍频是 CPU 主频与系统总线频率相差的倍数，外频不变时提高倍频，CPU 的主频也随之提高。$kp$, section = '' where id = 21892;
update t_knowledge_point set title = $kp$CPU 的主要性能指标$kp$, content = $kp$计算机的性能在很大程度上由 CPU 决定，CPU 的性能主要表现在程序执行速度的快慢。与 CPU 相关的影响因素主要有：

字长（位数）：CPU 中整数寄存器和定点运算器的宽度，即二进制整数运算的位数。存储器地址是整数，整数运算由定点运算器完成，因此定点运算器的宽度大体决定了地址码的位数；地址码的长度决定了 CPU 可访问的存储器最大空间。

主频（CPU 时钟频率）：CPU 中电子线路的工作频率，决定着 CPU 芯片内部数据传输与操作速度的快慢。主频越高，执行一条指令所需的时间越少，处理速度越快；但内部结构不同，相同主频的 CPU 性能未必一样。

CPU 总线速度：CPU 总线（前端总线）的工作频率和数据线宽度决定 CPU 与内存之间传输数据的速度，总线越快，CPU 的性能发挥得越充分。

高速缓存（Cache）的容量与结构：可减少 CPU 访问内存的次数，容量越大、级数越多，效果越显著。

指令系统：指令的类型、数目和功能都会影响程序的执行速度。

逻辑结构：定点运算器和浮点运算器的数目、是否具有数字信号处理功能、有无指令和数据预测功能、流水线结构和级数等，都会影响指令的执行速度。$kp$, section = '' where id = 21894;
update t_knowledge_point set title = $kp$字长与微处理器字长演变$kp$, content = $kp$字长指中央处理器中运算器和寄存器的宽度，即数据在运算器中运算或存储时的二进制位数。字长决定了计算的精度，通常是 2 的整数次幂。

微处理器字长的演变：Intel 4004 为 4 位（1971 年，世界上第一个微处理器）；Intel 8008、8080 为 8 位；Intel 8086 为 16 位；Intel 80386、80486 和 Pentium 为 32 位。$kp$, section = '' where id = 21930;
update t_knowledge_point set title = $kp$并行处理$kp$, content = $kp$使用具有多个微处理器的计算机时，把多项任务分配给不同的 CPU 同时执行，以提高计算机系统的效率。$kp$, section = '' where id = 21934;
update t_knowledge_point set title = $kp$指令系统$kp$, content = $kp$CPU 所能执行的所有指令的集合称为计算机的指令系统或指令组（instruction set）。指令系统中通常有数以百计的不同指令，例如数据传送指令、算术运算指令、逻辑运算指令、移位指令、位操作指令、控制转移指令和输入/输出指令。$kp$, section = '' where id = 21937;
update t_knowledge_point set title = $kp$Intel 微处理器产品的发展过程$kp$, content = $kp$8088（8086）→ 80286 → 80386 → 80486 → Pentium → Pentium Pro → Pentium II → Pentium III → Pentium 4。

当前产品分为赛扬系列、奔腾系列和酷睿 i3、i5、i7 系列，性能依次提高。$kp$, section = '' where id = 21966;
update t_knowledge_point set title = $kp$CPU 的兼容问题$kp$, content = $kp$不同公司生产的 CPU 各有自己的指令系统，它们未必互相兼容。Intel 公司的 CPU 与 AMD 公司的 CPU 相互兼容，但与 IBM 公司的 POWER 微处理器不兼容。

同一公司的 CPU 产品通常“向下兼容”，即新处理器中保留老处理器的所有指令，同时扩充功能更强的新指令。$kp$, section = '' where id = 21988;
update t_knowledge_point set title = $kp$指令系统的兼容性$kp$, content = $kp$每种类型的 CPU 都有自己的指令系统，某一类计算机的可执行程序未必能在其他计算机上运行，这就是计算机指令系统的“兼容性”问题。

同一公司的 CPU 产品通常“向下兼容”，即新型号的处理器在旧型号处理器指令系统的基础上进行扩充。$kp$, section = '' where id = 21996;
update t_knowledge_point set title = $kp$CPU 寻址空间的计算$kp$, content = $kp$如果 CPU 的地址线宽度为 n 位，那么 CPU 的寻址空间为 2 的 n 次方字节（B）。$kp$, section = '' where id = 22019;
update t_knowledge_point set title = $kp$CPU 工作频率与字长$kp$, content = $kp$主频：CPU 内部的时钟频率，是 CPU 进行运算时的工作频率。一般来说，主频越高，CPU 的运算速度越快；但内部结构不同，相同主频的 CPU 性能未必一样。

外频：即系统总线频率，指 CPU 与周边设备传输数据的频率，具体是 CPU 到芯片组之间的总线速度。

倍频：主频 = 外频 × 倍频。外频不变时提高倍频，CPU 主频也随之提高。

微处理器字长的演变：Intel 4004 为 4 位（1971 年，世界上第一个微处理器）；Intel 8008、8080 为 8 位；Intel 8086 为 16 位；Intel 80386、80486、Pentium 为 32 位。$kp$, section = '' where id = 22109;
update t_knowledge_point set title = $kp$双核与四核处理器$kp$, content = $kp$最初是把 2 个功能完全相同的处理器内核封装在单个 IC 封装中；进一步发展为一个晶片上做 2 个内核，共享 L2 Cache，提高性价比；随后把 2 个双核晶片封装在一起成为 4 核处理器；现在则是把 4 个或 6 个内核做在同一晶片上，共享 L3 Cache（如 Core i7/i5/i3 处理器）。$kp$, section = '' where id = 22129;
update t_knowledge_point set title = $kp$CPU 体系结构：字长与指令系统$kp$, content = $kp$字长（位数）指通用寄存器和定点运算器的宽度，即二进制整数运算的位数。

指令系统：指令的类型、数目和功能等都会影响程序的执行速度。$kp$, section = '' where id = 22132;
update t_knowledge_point set title = $kp$Intel 公司 CPU 的指令系统$kp$, content = $kp$Intel 公司产品的发展过程为：8088（8086）→ 80286 → 80386 → 80486 → Pentium → Pentium Pro → Pentium II → Pentium III → Pentium 4 → 奔腾 D、奔腾至尊 → 酷睿 → 酷睿 2 → Core i3/i5/i7。

为解决软件兼容性问题，Intel 采用“向下兼容”方式开发新的处理器，即所有新处理器均保留老处理器的全部指令，同时还扩充功能更强的新指令。例如：Pentium 比 80386 增加了 80 多条浮点指令；Pentium II 比 Pentium 增加了 50 多条处理多媒体信息的指令（MMX）；Pentium III 比 Pentium II 增加了 70 条处理 128 位长操作数的流式单指令多数据指令（SSE）；Pentium 4 又比 Pentium III 增加了 144 条指令（SSE2）；奔腾 D、奔腾至尊、酷睿 2 等又增加了 13 条 SSE3 指令；Core i5 和 Core i7 又增加了 40 多条 SSE4 指令。$kp$, section = '' where id = 22140;
update t_knowledge_point set title = $kp$指令系统与 RISC 的设计原则$kp$, content = $kp$CPU 可执行的全部指令称为该 CPU 的指令系统，即它的机器语言。

指令应该简单，简单才能提高速度（RISC）：一是操作功能要简单，不宜太多、太复杂；二是指令的格式要统一，采用固定长度、统一分段。

ARM 处理器符合上述要求；Intel 处理器由于历史的原因，并不符合这些原则。$kp$, section = '' where id = 22144;
update t_knowledge_point set title = $kp$指令及其格式$kp$, content = $kp$指令采用二进制表示，大多数情况下由操作码和操作数地址两部分组成。操作码指出 CPU 应执行何种操作，例如加、减、乘、除等；操作数地址指出该指令所操作的数据或数据所在的位置。

指令格式需要确定：操作码有几位（决定有多少种不同的操作）、操作数地址是 2 个还是 3 个、如何指出内存地址（寻址方式）、指令长度是多少位以及采用固定长度还是可变长度。例如加法指令 R1←R3+R5 和减法指令 R1←R1-R3，都要给出操作码和相应的操作数地址。$kp$, section = '' where id = 22180;
update t_knowledge_point set title = $kp$指令在计算机中的执行过程$kp$, content = $kp$取指令：CPU 的控制器从存储器读取一条指令并放入指令寄存器。

指令译码：指令寄存器中的指令经过译码，决定该指令应进行何种操作、操作数在哪里。

执行指令：按操作码的要求完成运算处理。$kp$, section = '' where id = 22181;
update t_knowledge_point set title = $kp$提高 CPU 性能的三大措施$kp$, content = $kp$提高 CPU 性能的三条主要途径：一是改进 CPU 结构；二是提高集成电路速度（主频）；三是增加 CPU 内核的数目。$kp$, section = '' where id = 22183;
update t_knowledge_point set title = $kp$CPU 的物理实现：主频与内核数目$kp$, content = $kp$主频（CPU 内部时钟频率）指 CPU 芯片中电子线路（门、触发器）的工作频率，它决定着 CPU 芯片内部数据传输与操作速度的快慢。

内核数目可以是 1 个、2 个……6 个、8 个甚至更多。$kp$, section = '' where id = 22194;
update t_knowledge_point set title = $kp$多核心 CPU 的含义$kp$, content = $kp$多核心 CPU 是指一个物理 CPU 集成多个 CPU 内核，核数越多，CPU 芯片的整体性能越高。$kp$, section = '' where id = 22223;
update t_knowledge_point set title = $kp$CPU 的逻辑实现：微架构与缓存$kp$, content = $kp$逻辑结构（微架构）包括 CPU 包含的定点运算器和浮点运算器的数目、采用的流水线结构和级数、指令分支预测的机制、执行部件的数目等。

高速缓存（Cache）的容量与结构也是影响 CPU 性能的重要因素。$kp$, section = '' where id = 22224;
update t_knowledge_point set title = $kp$多核为何能提高计算机性能$kp$, content = $kp$多个线程排队等候进入 CPU 处理，哪一个 CPU 空闲，就把等候的线程交给它执行；多个处理器并行处理后，结果按顺序汇总。

注：不严格地说，“线程”可以理解为程序中可独立且并发地执行的一串指令。$kp$, section = '' where id = 22471;
update t_knowledge_point set title = $kp$如何衡量 CPU 的性能$kp$, content = $kp$计算机的性能主要表现为程序执行速度的快慢。计算机性能由 CPU、内存、硬盘、显卡等多种因素决定，但 CPU 通常是主要因素。CPU 性能的高低主要表现为 CPU 的速度，常用的衡量方法有两种：

一是计算每秒钟可执行的指令数目，单位为 MIPS、MFLOPS。巨型计算机可达每秒千万亿至万万亿次基本运算，个人计算机为每秒几千万至几亿次基本运算。

二是 PC 大多以常用软件（办公软件、数字媒体处理软件和 3D 游戏等）的运行速度来测试 CPU 的性能，例如游戏性能测试程序 3DMark、整体综合性能测试程序 PCMark。$kp$, section = '' where id = 22486;
update t_knowledge_point set title = $kp$指令$kp$, content = $kp$指令是对计算机进行程序控制的最小单位。指令用二进制位表示，规定计算机执行什么操作。指令包括两部分：操作码指出计算机应执行何种操作，操作数指出该指令所处理的数据或数据所在的位置。

在计算机内部，程序由一连串指令组成，指令是构成程序的基本单位。$kp$, section = '' where id = 23534;
update t_knowledge_point set title = $kp$微处理器晶体管数量的增长$kp$, content = $kp$该图为微处理器晶体管数量增长示意图，纵轴为晶体管数（10 万至 1 亿），图中列出的型号包括 80486、Pentium、Pentium II、Pentium III 和 Pentium 4，晶体管数量随型号更新而大幅增加。$kp$, section = '' where id = 23765;
update t_knowledge_point set title = $kp$指令执行周期$kp$, content = $kp$指令执行周期通常包括四步：取指令、指令译码、执行指令、修改指令计数器（决定下一条指令的地址）。每一步需要 1 个或几个时钟周期才能完成。$kp$, section = '' where id = 24708;
update t_knowledge_point set title = $kp$运算速度$kp$, content = $kp$用于说明具有并行处理能力的巨型机运算速度的度量单位有：次/秒（每秒执行加法运算的次数）、MIPS（每秒钟可完成 100 万次整数运算）。

世界第一台计算机 ENIAC 的运算速度为 5000 次/秒。$kp$, section = '' where id = 25166;
update t_knowledge_point set title = $kp$指令的组成与执行过程$kp$, content = $kp$指令是构成程序的基本单位，采用二进制表示，用来规定计算机执行什么操作。任何复杂的程序，总是由 CPU 一条一条地执行指令来完成，而 CPU 执行每一条指令还要分成若干步。

指令由操作码和操作数地址组成。操作码指出计算机应执行何种操作，如加、减、乘、除、逻辑运算、取数、存数、移位、跳转，每一种操作用不同的二进制代码表示；操作数地址提供指令所处理数据的位置（在哪个寄存器或内存的哪个单元）。操作码一定有，操作数地址可以没有，操作数地址的个数由操作码决定。

指令的执行过程：① CPU 的控制器从存储器读取一条指令放入指令寄存器；② 指令寄存器中的指令经过译码，决定应进行何种操作、操作数在哪里；③ 根据操作数的位置取出操作数；④ 运算器按操作码的要求对操作数完成运算，并根据运算结果修改或设置状态标志；⑤ 将运算结果保存到指定的寄存器，需要时再保存到内存单元；⑥ 修改指令计数器，决定下一条指令的地址。

可概括为：取指令、指令译码并取操作数、执行指令、修改指令计数器，每一步需 1 个或几个时钟周期。CPU 所执行的指令及处理的数据，都来自内存。$kp$, section = '' where id = 25203;
update t_knowledge_point set title = $kp$指令系统与 Intel、AMD 公司的 CPU$kp$, content = $kp$CPU 所能执行的全部指令称为 CPU 的指令系统（指令集）。不同公司生产的 CPU，指令系统一般不同，典型组合也不一样。

指令要简单、格式要统一：ARM 处理器符合这一要求，Intel 处理器由于出现太早、受历史原因影响而不符合。

Core 处理器有七大类指令：数据传送类、算术运算类、逻辑运算类、移位操作类、位操作类、控制转移类、输入输出类。

Intel 公司和 AMD 公司的 CPU 兼容。Intel 公司芯片的发展：4004 → 8080 → 8088（8086）→ 80286 → 80386 → 80486 → Pentium、Pentium Pro、Pentium II → Pentium III、Pentium 4 → 赛扬系列、奔腾 D（双核）、酷睿 2（双核）、酷睿 2（四核）、至强、安腾 2（64 位）。Intel 产品按性能分为赛扬（1 星）、奔腾、酷睿 i3、i5、i7（5 星）、i9 等档次。产品标注如 Core i5/3.2GHz/1GB/160GB，依次表示 CPU 型号、主频、内存条容量和硬盘容量。

AMD 公司产品：Athlon XP、Athlon 64（速龙）、Duron（毒龙）、Sempron（闪龙）、Turion（炫龙）、Ryzen（锐龙）。$kp$, section = '' where id = 25204;
update t_knowledge_point set title = $kp$程序的执行过程$kp$, content = $kp$① 任务启动，把执行任务的程序和数据从辅存送到内存；② CPU 从内存读取程序的指令和数据；③ CPU 按指令运算处理，结果送到内存保存；④ 需要时，处理结果送到辅存长久保存。$kp$, section = '' where id = 25205;
update t_knowledge_point set title = $kp$CPU 的性能指标与提高性能的途径$kp$, content = $kp$影响 CPU 性能的主要因素：

指令系统——指令的类型、数目和功能。

逻辑结构——CPU 包含的定点运算器和浮点运算器的数目，是否有数字信号处理功能、指令预测功能，流水线结构和级数等。

高速缓存（Cache）的容量与结构——可减少 CPU 访问内存的次数，容量越大、级数越多，效果越显著。

主频——CPU 内部时钟频率，提高主频可提高 CPU 与内存之间交换数据的工作频率。

CPU 总线速率——即总线带宽。

内核数目——一个 CPU 芯片包含多个 CPU 内核，每个核是一个独立的 CPU，各核有自己的一级、二级 Cache，共享三级 Cache 和前端总线，多个核并行工作。CPU 读取数据时依次查找 L1、L2、L3 缓存，未命中再访问内存。

字长（位数）——CPU 中整数寄存器和定点运算器的宽度。定点运算器的宽度决定地址码的位数，地址码的位数决定 CPU 可访问的最大内存空间。字长越长，运算速度越快，寻址空间越大。字长是宽度的单位，字节是存储的单位；字长都是 8 的倍数，如 8 位、16 位、32 位、64 位。

提高 CPU 性能的途径：增加逻辑部件的复杂程度、增加 ALU 数目、增加寄存器数目、增加内核数目、提高主频。

CPU 的主要性能指标：主频（主频提高一倍，PC 机速度未必提高一倍；主频越高，CPU 运算速度越快）、字长、高速缓存（容量越大、级数越多，效果越显著）。

计算机的性能指标一般指 CPU 的性能、运算速度 MIPS、存储容量（主要是内存容量）、存储周期。$kp$, section = '' where id = 25207;
update t_knowledge_point set title = $kp$CPU 的性能指标$kp$, content = $kp$字长：32 位、64 位，指 CPU 一次能处理的二进制位数，即定点运算器与整数寄存器的宽度。

主频（CPU 时钟频率）：单位 GHz，主频越高速度越快，但不是线性关系。

高速缓存 Cache：容量越大、级数越多，命中率越高，速度越快；Cache 由 SRAM 构成，速度高于内存。

核数：如 4 核、8 核，即并行处理的数目。

总线速度：也是 CPU 的性能指标之一，常作为计算题考查。$kp$, section = '' where id = 25332;
update t_knowledge_point set title = $kp$指令、程序与指令系统的兼容$kp$, content = $kp$指令用二进制表示，格式由操作码和操作数地址组成：操作码指出如何操作，如加、减、乘、除、取数、跳转等；操作数地址指出指令所操作数据的地址。

指令系统是 CPU 所能执行的全部指令。指令是程序控制的最小单元，是构成程序的基本单位，一堆指令组成程序。

指令系统的兼容性：Intel 与 AMD 的 CPU 兼容；同一公司的新处理器兼容旧处理器的指令，即向下兼容。$kp$, section = '' where id = 25333;
update t_knowledge_point set title = $kp$内存与 CPU 的指令数据通路$kp$, content = $kp$内存分为代码段和数据段：代码段存放进程的指令 1、指令 2……指令 n，数据段存放数据 1、数据 2……数据 m。

CPU 包含控制单元（指令计数器、指令寄存器）、存储单元和运算单元。

指令地址由指令计数器送到代码段；指令从代码段送入指令寄存器；操作数地址由存储单元送到数据段；数据在数据段与存储单元之间传送；控制指令由指令寄存器送到存储单元和运算单元；数据在存储单元与运算单元之间传送。$kp$, section = '' where id = 25334;
update t_knowledge_point set title = $kp$操作码与操作数地址（地址码）$kp$, content = $kp$（1）操作码

操作码字段表征指令的操作特性与功能，用来指明指令所要完成的操作，如加法、减法、取数、存数、移位等。

指令系统中的每一条指令都有一个唯一确定的操作码，指令不同，其操作码的编码也不同。

为了能表示整个指令系统中的全部指令，操作码字段应当具有足够的位数。一般来说，一个 n 位的操作码最多能表示 2 的 n 次方条指令。

（2）操作数地址（地址码）

地址码指出该指令所处理的数据或数据所在的位置，用来指出源操作数（一个或两个）的地址、结果的地址以及下一条指令的地址。“地址”可以是主存地址，也可以是寄存器地址，甚至是 I/O 设备的地址。以主存地址为例，地址码结构常见的有四地址指令、三地址指令、二地址指令、一地址指令和零地址指令。$kp$, section = '' where id = 25359;
update t_knowledge_point set title = $kp$CPU 处理能力大幅提升$kp$, content = $kp$CPU 处理能力的不断提升也是促使数据量不断增加的重要因素。性能不断提升的 CPU 大大提高了处理数据的速度，使我们能更快地处理不断累积的海量数据。从 20 世纪 80 年代至今，CPU 的制造工艺不断提升，晶体管数量不断增加，运行频率不断提高，核心数量逐渐增多，而同等价格所能获得的 CPU 处理能力也呈几何级数上升。截至 2017 年初，CPU 的处理速度已从 10 MHz 提高到 4.5 GHz；在 2013 年之前的很长一段时期，CPU 处理速度的增加一直遵循“摩尔定律”，性能每隔 18 个月提高一倍，价格下降一半。$kp$, section = '' where id = 26522;
update t_knowledge_point set title = $kp$微处理器发展的六个阶段$kp$, content = $kp$第一代（1971—1973 年）：字长 4 位或 8 位，处理速度 0.05 MIPS（MIPS 即每秒百万条指令），指令 45 条，没有操作系统，只有汇编语言。

第二代（1974—1977 年）：字长 8 位，处理速度 0.5～0.75 MIPS，约为第一代的 10～15 倍。

第三代（1978—1984 年）：字长 16 位，时钟频率 6.66～20 MHz，采用 x86 指令。

第四代（1985—1992 年）：字长 32 位，时钟频率 12.5～40 MHz。

第五代（1993—2005 年）：字长 32 位，前端总线频率 75～1066 MHz；内部采用超标量指令流水线结构和多媒体指令增强技术，包括 57 条多媒体指令，Pentium III 处理器又加入 70 条新指令。

第六代（2005 年至今）：64 位微处理器，主频 2.66～3.2 GHz，采用 AVX、AES 等新指令集。$kp$, section = '' where id = 26696;
update t_knowledge_point set title = $kp$主频与 CPU 速度的关系$kp$, content = $kp$主频越高，单位时间内完成的时钟周期越多，CPU 的速度也就越快。$kp$, section = '' where id = 27172;
update t_knowledge_point set title = $kp$字长的含义$kp$, content = $kp$字长指 CPU 中整数寄存器和定点运算器的宽度，也可以理解为 CPU 一次能处理的二进制数的位数。$kp$, section = '' where id = 27173;
update t_knowledge_point set title = $kp$字长与 PC 机 CPU 的位数$kp$, content = $kp$字长都是字节的整数倍。以前 PC 使用的 CPU 大都是 32 位，目前 Core i3、i5、i7 的 CPU 都是 64 位处理器。$kp$, section = '' where id = 27174;
update t_knowledge_point set title = $kp$指令是 CPU 可直接执行的二进制命令$kp$, content = $kp$指令就是二进制的命令，CPU 可以直接执行。$kp$, section = '' where id = 27229;
update t_knowledge_point set title = $kp$CPU 指令系统的向下兼容$kp$, content = $kp$同一公司的 CPU 产品指令集通常“向下兼容”。不同公司生产的 CPU 各有自己的指令系统，一般并不兼容，但也有例外，如 AMD 的 CPU 与 Intel 的 CPU 指令集基本兼容。$kp$, section = '' where id = 27230;
update t_knowledge_point set title = $kp$ARM 架构 CPU 与 PC 不兼容$kp$, content = $kp$智能手机、平板电脑使用的是英国 ARM 公司设计的 CPU，其指令系统与 PC 上的 CPU 不一样，PC 上的程序不能直接在平板电脑和智能手机上运行。$kp$, section = '' where id = 27231;
update t_knowledge_point set title = $kp$前台与后台窗口共享 CPU 时间$kp$, content = $kp$不管前台还是后台窗口，都能分享 CPU 的运行时间。$kp$, section = '' where id = 27260;
update t_knowledge_point set title = $kp$机器语言与指令$kp$, content = $kp$机器语言就是计算机的指令系统；指令是使用二进制编码表示的。$kp$, section = '' where id = 27643;
update t_knowledge_point set title = $kp$主频提高与 PC 速度$kp$, content = $kp$主频提高一倍，PC 速度未必提高一倍。$kp$, section = '' where id = 27700;
update t_knowledge_point set title = $kp$指令由操作码和操作数组成$kp$, content = $kp$指令 = 操作码 + 操作数（地址码）。操作码不可缺少，操作数可以省略。$kp$, section = '' where id = 27755;
update t_knowledge_point set title = $kp$指令的执行过程$kp$, content = $kp$指令的执行过程：取指令 → 译指令 → 执行指令。$kp$, section = '' where id = 27756;
update t_knowledge_point set title = $kp$平板电脑与智能手机采用 ARM CPU$kp$, content = $kp$近年来流行的平板电脑、智能手机均采用英国 ARM 公司的 ARM 技术 CPU。平板电脑、智能手机的 CPU 的指令系统和普通 PC 机完全不一样，相互不兼容。$kp$, section = '' where id = 28009;
update t_knowledge_point set title = $kp$指令系统就是机器语言$kp$, content = $kp$指令的集合称为计算机的指令系统。指令系统就是机器语言。每一种 CPU 都有自己独特的指令系统。$kp$, section = '' where id = 28020;
update t_knowledge_point set title = $kp$不同公司 CPU 指令系统的兼容性$kp$, content = $kp$同一公司的 CPU 产品指令集通常“向下兼容”。不同公司生产的 CPU 各有自己的指令系统，一般并不兼容，例如 AMD 的 CPU 与 Intel 的 CPU 指令系统部分兼容。$kp$, section = '' where id = 28021;
update t_knowledge_point set title = $kp$ARM CPU 与 PC 程序不通用$kp$, content = $kp$智能手机、平板电脑使用的是英国 ARM 公司设计的 CPU，和 PC 机上的 CPU 的指令系统不一样，PC 机上的程序不能直接在平板电脑和智能手机上运行。$kp$, section = '' where id = 28022;
update t_knowledge_point set title = $kp$主频的含义$kp$, content = $kp$主频是 CPU 进行运算时的内部工作频率。$kp$, section = '' where id = 28023;
update t_knowledge_point set title = $kp$字长与 CPU 一次处理的位数$kp$, content = $kp$字长指 CPU 中整数寄存器和定点运算器的宽度，也可以理解为 CPU 一次能处理的二进制数的位数。$kp$, section = '' where id = 28025;
update t_knowledge_point set title = $kp$字长与 CPU 位数$kp$, content = $kp$字长用来表示 CPU 一次能处理的二进制数据的位数；字长都是字节的整数倍；以前 PC 机使用的 CPU 大都是 32 位，目前 Core i3、i5、i7 的 CPU 都是 64 位处理器。$kp$, section = '' where id = 28026;
update t_knowledge_point set title = $kp$Cache 缓解 CPU 与内存的速度差异$kp$, content = $kp$CPU 的 Cache 缓解了 CPU 和内存之间速度不匹配的问题。$kp$, section = '' where id = 28027;
update t_knowledge_point set title = $kp$影响 CPU 性能的其他因素$kp$, content = $kp$除字长、主频、Cache 等之外，CPU 总线速度、指令系统和逻辑结构的复杂度、内核数目等也影响 CPU 的性能。$kp$, section = '' where id = 28033;
update t_knowledge_point set title = $kp$时钟频率即主频$kp$, content = $kp$时钟频率指的是主频，也就是 CPU 的时钟频率，它决定着 CPU 内部的工作速度。$kp$, section = '' where id = 28034;
update t_knowledge_point set title = $kp$内存容量与 CPU 速度$kp$, content = $kp$内存容量不会影响 CPU 的速度；内存容量属于计算机的性能指标之一。$kp$, section = '' where id = 28086;
update t_knowledge_point set title = $kp$并行处理技术与多核$kp$, content = $kp$使用多个 CPU 实现超高速计算机的技术称为“并行处理技术”，采用这种技术的计算机系统称为“多处理器系统”。这两个概念都是使用多个 CPU 的技术。

多核是指一个 CPU 芯片里有多个 CPU 内核。CPU 芯片强调的是物理上能看到的实体，CPU 强调的是逻辑上的功能模块。关于多核的最佳说法是：1 个 CPU 芯片里面有多个 CPU 内核。$kp$, section = '' where id = 28242;
update t_knowledge_point set title = $kp$计算机的性能指标$kp$, content = $kp$计算机的性能指标一般指的是：CPU 的性能、运算速度 MIPS、存储容量（主要指的是内存的容量）、存储周期等。$kp$, section = '' where id = 28243;
update t_knowledge_point set title = $kp$指令寄存器存放的内容$kp$, content = $kp$指令寄存器用于存放当前正在执行的指令，而不是数据。$kp$, section = '' where id = 28263;
update t_knowledge_point set title = $kp$二进制物理实现简单$kp$, content = $kp$二进制在物理上容易实现。$kp$, section = '' where id = 28278;
update t_knowledge_point set title = $kp$字长是字节的整数倍$kp$, content = $kp$字长是字节的整数倍，也就是字长都是 8 的倍数，比如 8 位、16 位、32 位、64 位等。$kp$, section = '' where id = 28280;
update t_knowledge_point set title = $kp$统计已执行指令数目的作用$kp$, content = $kp$统计已经执行过的指令数目，可用于衡量 CPU 的执行速度。$kp$, section = '' where id = 28295;
update t_knowledge_point set title = $kp$CPU 的任务就是执行指令$kp$, content = $kp$CPU 的任务就是执行指令。$kp$, section = '' where id = 28391;
update t_knowledge_point set title = $kp$控制器的两个重要部件$kp$, content = $kp$控制器有两个重要部件：① 指令计数器，用来存放 CPU 正在执行的指令的地址；② 指令寄存器，用来保存当前正在执行的指令。$kp$, section = '' where id = 28470;
update t_knowledge_point set title = $kp$指令寄存器与指令系统$kp$, content = $kp$指令寄存器存放的是当前正在执行的指令，而不是数据。指令系统是 CPU 所能执行的所有指令的集合。$kp$, section = '' where id = 28471;
update t_knowledge_point set title = $kp$指令系统的兼容性$kp$, content = $kp$同一公司的 CPU 产品的指令系统向下兼容；不同公司的 CPU 产品的指令系统一般并不兼容，但 Intel 和 AMD 公司的 CPU 基本兼容。$kp$, section = '' where id = 28472;
update t_knowledge_point set title = $kp$指令系统的复杂程度是性能指标$kp$, content = $kp$指令系统的复杂程度是 CPU 的性能指标，也是计算机的性能指标。$kp$, section = '' where id = 28473;
update t_knowledge_point set title = $kp$Cache 的存取速度快于主存$kp$, content = $kp$CPU 的 Cache 存取速度快于主存。$kp$, section = '' where id = 28490;
update t_knowledge_point set title = $kp$Cache 对程序员的透明性$kp$, content = $kp$CPU 的 Cache 可被 CPU 访问，但不能被程序或程序员直接访问，这就是 Cache 的透明性。$kp$, section = '' where id = 28492;
update t_knowledge_point set title = $kp$Cache 与程序访问的局部性$kp$, content = $kp$CPU 中 Cache 的内容遵循程序访问的局部性原理。Cache 中的数据只是主存中部分内容的副本，并不是主存全部内容的映射。$kp$, section = '' where id = 28493;
update t_knowledge_point set title = $kp$CPU 数据总线与总线带宽$kp$, content = $kp$CPU 数据总线的位数（根数、宽度）决定了 CPU 和外部交换数据的速率。CPU 总线的带宽属于计算机的性能指标之一。$kp$, section = '' where id = 28495;
update t_knowledge_point set title = $kp$字长是 CPU 一次处理的二进制位数$kp$, content = $kp$字长就是 CPU 一次能处理的二进制位数。$kp$, section = '' where id = 28496;
update t_knowledge_point set title = $kp$字长与目前 PC 的位数$kp$, content = $kp$字长实际上就是 CPU 整数寄存器和定点运算器的宽度。目前 PC 机使用的 CPU 大都是 64 位。$kp$, section = '' where id = 28497;
update t_knowledge_point set title = $kp$指令由操作码和操作数组成$kp$, content = $kp$指令 = 操作码 + 操作数（地址码）。操作码不可缺少，操作数可以省略。$kp$, section = '' where id = 28556;
update t_knowledge_point set title = $kp$指令的执行过程$kp$, content = $kp$指令的执行过程：取指令、译指令、执行指令。$kp$, section = '' where id = 28558;
update t_knowledge_point set title = $kp$主频提高一倍与 PC 速度$kp$, content = $kp$主频提高一倍，PC 机速度未必提高一倍。$kp$, section = '' where id = 28559;
update t_knowledge_point set title = $kp$指令计数器$kp$, content = $kp$指令计数器中保存的是正在执行的指令的地址，执行完毕后自动加 1，也叫程序计数器。$kp$, section = '' where id = 28560;
update t_knowledge_point set title = $kp$字长（位数）$kp$, content = $kp$字长指 CPU 中通用寄存器／定点运算器的宽度，即二进制整数运算的位数。由于存储器地址是整数，整数运算由定点运算器完成，定点运算器的宽度也就大体决定了地址码位数的多少。$kp$, section = '' where id = 28619;
update t_knowledge_point set title = $kp$主频（CPU 时钟频率）$kp$, content = $kp$主频指 CPU 中电子线路的工作频率，它决定着 CPU 芯片内部数据传输与操作速度的快慢。执行 1 条指令通常需要 1 个或几个时钟周期，所以主频越高，执行一条指令需要的时间就越少，CPU 的处理速度就越快。$kp$, section = '' where id = 28620;
update t_knowledge_point set title = $kp$逻辑结构（微架构）$kp$, content = $kp$CPU 包含的定点运算器和浮点运算器数目、是否具有数字信号处理功能、有无指令预测功能、流水线结构和级数等，都对指令执行的速度有影响，甚至对某些特定应用有很大的影响。$kp$, section = '' where id = 28622;
update t_knowledge_point set title = $kp$控制器与指令计数器$kp$, content = $kp$控制器是解释指令的含义、控制运算器的操作、记录内部状态的部件。指令计数器用来存放 CPU 正在执行的指令的地址，CPU 按照该地址从内存读取所要执行的指令。$kp$, section = '' where id = 28635;
update t_knowledge_point set title = $kp$指令执行过程$kp$, content = $kp$指令执行过程：取指令、指令译码、执行指令、保存结果（注意顺序）。$kp$, section = '' where id = 28636;
update t_knowledge_point set title = $kp$字长的定义与意义$kp$, content = $kp$定义：字长指 CPU 中定点运算器的宽度，即一次能同时进行二进制整数运算的位数。

意义：字长决定了 CPU 可访问的最大内存空间。例如地址线数目为 20 位，则 CPU 可访问的最大内存空间为 2 的 20 次方字节，即 1 MB。$kp$, section = '' where id = 28637;
update t_knowledge_point set title = $kp$主频及其意义$kp$, content = $kp$定义：CPU 中电子线路的工作频率，又称 CPU 时钟频率、内部频率。

意义：决定 CPU 内部数据传输与指令执行的快慢，主频越高，速度越快。

奔腾 4 系列的主频范围为 1500～3800 MHz。

注意：主频提高一倍，PC 机速度未必提高一倍。$kp$, section = '' where id = 28638;
update t_knowledge_point set title = $kp$CPU 运算速度的衡量方法$kp$, content = $kp$传统衡量方法是用每秒钟能执行的指令数目来表示。例如 MIPS 表示每秒百万条单字长定点指令，MFLOPS 表示每秒百万条单字长浮点指令。$kp$, section = '' where id = 28639;
update t_knowledge_point set title = $kp$寻址能力与内存容量的计算$kp$, content = $kp$1 GB = 2 的 10 次方 MB = 2 的 20 次方 KB = 2 的 30 次方 B。

寻址能力（CPU 一次访问的内存容量）= 2 的“字长（地址线宽度）”次方，单位为 B。

例：某 CPU 的地址线宽度（字长）为 32 位，一次可访问的内存容量为 2 的 32 次方 B，即 4 GB。$kp$, section = '' where id = 28657;
update t_knowledge_point set title = $kp$指令与指令系统及 CPU 的组成$kp$, content = $kp$程序是由指令按顺序组成的序列。

指令由操作码和操作数（操作数地址）组成。

指令系统就是计算机的机器语言，即计算机能够理解和识别的全部指令。

指令系统的特点：不同品牌的 CPU 一般互不兼容；同一品牌的 CPU 向下兼容。

CPU 的组成：控制器包括指令计数器（程序计数器，存放当前正在执行指令的地址）、指令寄存器（临时存放指令）、指令译码器（把指令翻译成操作码和操作数的地址）；寄存器组根据地址到内存中找操作数并临时存放；运算器负责算术运算和逻辑运算。

指令执行周期：取指令 → 存指令 → 译指令 → 执行指令（取数、运算）→ 修改指令计数器。$kp$, section = '' where id = 28669;
update t_knowledge_point set title = $kp$影响 CPU 性能的主要因素$kp$, content = $kp$字长：一次处理二进制的位数，即定点运算器或寄存器的位数。

指令系统：指令的类型、数目和功能都会影响指令的执行速度。

逻辑结构（微架构）：定点运算器和浮点运算器的数目，是否采用指令预测、是否采用流水线结构等。

高速缓存（Cache）：平衡 CPU 与主存之间的速度差异。

主频（GHz）：CPU 内部电子线路的工作频率。原则上主频越高速度越快，但不是正比关系。

内核：单核、多核（并行处理），可充分发挥 CPU 的效能。$kp$, section = '' where id = 28670;
update t_knowledge_point set title = $kp$Core i7 的制造工艺$kp$, content = $kp$Intel 公司的 Core i7 微处理器采用 32 nm 工艺，晶体管数量超过 10 亿个。$kp$, section = '' where id = 28704;
update t_knowledge_point set title = $kp$指令执行过程的四个步骤$kp$, content = $kp$每一种 CPU 都有自己独特的一组指令，即指令系统。指令的执行过程是：Fetch（取指令）、Decode（指令译码）、Execute（指令执行）、Store（存储运行结果）。$kp$, section = '' where id = 28721;
update t_knowledge_point set title = $kp$新处理器向下兼容$kp$, content = $kp$4004、8008、8080、286、386、486、Pentium、P1、P2、P3 的指令系统中的指令没有 P4 多，因此在 P4 上能运行的程序不一定能在 Pentium、P1、P2、P3 上运行。$kp$, section = '' where id = 28722;
update t_knowledge_point set title = $kp$CPU 的主要性能指标$kp$, content = $kp$CPU 的主要性能指标有：字长（即 ALU 一次同时执行的二进制位数）、主频（即 CPU 时钟频率）、CPU 前端总线速度、Cache 容量、指令系统、逻辑结构。$kp$, section = '' where id = 28723;
update t_knowledge_point set title = $kp$Intel 公司推出的 CPU 型号$kp$, content = $kp$美国 Intel 公司推出的 CPU 型号有：4004、8080、8086、286、386、486、Pentium、Pentium Pro、P2、P3、P4、赛扬系列、奔腾 D（双核）、酷睿 2（双核）、酷睿 2（四核）、至强、安腾 2（64 位）等。$kp$, section = '' where id = 28751;
update t_knowledge_point set title = $kp$AMD 公司推出的 CPU 型号$kp$, content = $kp$美国 AMD 公司推出的 CPU 型号有：Athlon XP、Duron（毒龙）、Sempron（闪龙）和 Athlon 64 等。$kp$, section = '' where id = 28752;
update t_knowledge_point set title = $kp$机器语言的特点$kp$, content = $kp$机器语言的代码计算机可以直接执行，执行速度最快，但不可移植，依赖于具体计算机的指令系统，使用 0 和 1 编写程序。$kp$, section = '' where id = 28760;
update t_knowledge_point set title = $kp$主频与时钟频率$kp$, content = $kp$主频即时钟频率，单位为 Hz，表示每秒钟的时钟周期数。主频相同的 CPU 性能不一定相同。$kp$, section = '' where id = 28767;
update t_knowledge_point set title = $kp$外频与前端总线$kp$, content = $kp$外频：CPU 和主板之间的数据交换频率。

FSB 是前端系统总线。在早期的计算机中 FSB 和外频是一样的；FSB 表示 CPU 和内存之间的数据交换频率，现在的 FSB 一般是外频的两倍、四倍或八倍。$kp$, section = '' where id = 28769;
update t_knowledge_point set title = $kp$CPU、Cache 与主频$kp$, content = $kp$CPU 由运算器、控制器和寄存器组成。

Cache 可分为 L1 和 L2：一级缓存的速度与 CPU 速度一致；二级缓存的速度是 CPU 速度的一半，其中的数据是内存中部分数据的副本。CPU 访问缓存用“命中率”衡量，缓存越大命中率越高，但不表示速度越快。

主频：单位 Hz。外频：主板的工作频率。FSB：前端系统总线，是内存的工作频率。倍频：主频 = 外频 × 倍频。

字长：每一个时钟周期内同时处理的二进制位数。

CPU 的寻址空间为 2 的“地址线位数”次方；CPU 访问内存采用按字节编址，一个字节就是一个地址单元。

存取时间：CPU 从内存中读出数据或写入数据所用的时间。$kp$, section = '' where id = 28775;
update t_knowledge_point set title = $kp$同一公司与不同公司 CPU 的兼容性$kp$, content = $kp$同一公司的 CPU 产品的指令系统向下兼容；不同公司的 CPU 产品的指令系统一般并不兼容，但 Intel 和 AMD 公司的 CPU 基本兼容。$kp$, section = '' where id = 28822;
update t_knowledge_point set title = $kp$CPU 性能指标概览$kp$, content = $kp$CPU 的性能指标包括主频、字长、指令系统的复杂程度、Cache 的容量、内核的个数、逻辑结构的复杂程度（微架构）等。$kp$, section = '' where id = 28823;
update t_knowledge_point set title = $kp$智能手机与 PC 的 CPU 不兼容$kp$, content = $kp$智能手机、平板电脑的 CPU 和 PC 机的 CPU 完全不同，两者的指令和指令系统完全不同，也不会相互兼容。$kp$, section = '' where id = 28824;
update t_knowledge_point set title = $kp$主频与 PC 速度$kp$, content = $kp$主频提高一倍，PC 机速度未必提高一倍。主频越高，CPU 的运算速度也就越快。$kp$, section = '' where id = 28840;
update t_knowledge_point set title = $kp$字长的定义$kp$, content = $kp$字长也就是 CPU 整数寄存器和定点运算器的宽度，即二进制整数运算的位数。$kp$, section = '' where id = 28841;
update t_knowledge_point set title = $kp$字长是 8 的倍数$kp$, content = $kp$字长是字节的整数倍，也就是字长都是 8 的倍数，比如 8 位、16 位、32 位、64 位等。$kp$, section = '' where id = 28843;
update t_knowledge_point set title = $kp$Core i3/i5/i7 是 64 位处理器$kp$, content = $kp$目前 Core i3、i5、i7 的 CPU 都是 Intel 公司的 64 位处理器，还没有出现 128 位的处理器。$kp$, section = '' where id = 28844;
update t_knowledge_point set title = $kp$Core i3/i5/i7 集成显卡功能$kp$, content = $kp$Core i3/i5/i7 CPU 芯片中已经将北桥芯片的存储器控制功能和图形处理器功能集成在 CPU 芯片中，也就是说现在的 CPU 已经实现了集成显卡的功能。$kp$, section = '' where id = 28849;
update t_knowledge_point set title = $kp$微处理器的分类$kp$, content = $kp$微处理器 = 通用微处理器（如 CPU）+ 专用微处理器（绘图处理器、通信处理器等）。

冯·诺依曼计算机的基本原理是存储程序和程序控制（存储程序控制），即能存储大量信息，并可按照程序自动高速地进行计算。$kp$, section = '' where id = 28887;
update t_knowledge_point set title = $kp$指令执行过程与指令计数器$kp$, content = $kp$指令执行过程：取指令（取自内存储器）、指令译码、执行指令、指令计数器（决定下一条指令的地址或位置）。（注意顺序）$kp$, section = '' where id = 28888;
update t_knowledge_point set title = $kp$指令与指令系统$kp$, content = $kp$指令采用二进制位（机器语言）表示，由操作码和操作数地址组成。计算机能执行的所有指令的集合称为计算机的指令系统或指令组，每一种 CPU 都有自己独特的指令系统。

计算机语言分为高级语言、汇编语言和机器语言。前两者需经编译或汇编后才能交给 CPU 运行；机器语言由 0 和 1 组成，可移植性差。$kp$, section = '' where id = 28906;
update t_knowledge_point set title = $kp$微处理器发展与客户机/服务器概述$kp$, content = $kp$微处理器发展、字长、处理速度、指令与指令系统，以及客户机、服务器概述（要求理解）。$kp$, section = '' where id = 28926;
update t_knowledge_point set title = $kp$指令的组成$kp$, content = $kp$指令由操作码和操作数地址组成：操作码是表示计算机执行何种操作的一个二进制代码，操作数地址指出操作数本身或操作数所在的地址。$kp$, section = '' where id = 28946;
update t_knowledge_point set title = $kp$频率的单位换算$kp$, content = $kp$频率的单位为 Hz，采用 1000 进制：1 GHz = 1000 MHz，1 MHz = 1000 kHz。$kp$, section = '' where id = 29747;
update t_knowledge_point set title = $kp$程序与指令的组成$kp$, content = $kp$程序由一条一条的机器指令（简称指令）组成，指令由操作码和操作数地址组成；每条指令必须有操作码，但可能没有操作数，操作码决定了操作数的个数。$kp$, section = '' where id = 30140;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21879,21886,21892,21894,21930,21934,21937,21966,21988,21996,22019,22109,22129,22132,22140,22144,22180,22181,22183,22194,22223,22224,22471,22486,23534,23765,24708,25166,25203,25204,25205,25207,25332,25333,25334,25359,26522,26696,27172,27173,27174,27229,27230,27231,27260,27643,27700,27755,27756,28009,28020,28021,28022,28023,28025,28026,28027,28033,28034,28086,28242,28243,28263,28278,28280,28295,28391,28470,28471,28472,28473,28490,28492,28493,28495,28496,28497,28556,28558,28559,28560,28619,28620,28622,28635,28636,28637,28638,28639,28657,28669,28670,28704,28721,28722,28723,28751,28752,28760,28767,28769,28775,28822,28823,28824,28840,28841,28843,28844,28849,28887,28888,28906,28926,28946,29747,30140) and not deleted) <> 117 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
