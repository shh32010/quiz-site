-- 知识点 44 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_44
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_44 as
select * from t_knowledge_point where id in (21814,21816,21817,21854,21919,21939,21983,22029,22032,22053,22110,22174,22197,22228,22234,22237,23482,24127,24201,24601,24602,24719,25866,25867,26697,26698,26699,26952,26953,26954,26955,26956,26957,26958,26960,26961,26962,26963,26965,26966,26967,26968,27055,27159,27160,27161,27162,27163,27164,27165,27166,27167,27168,27226,27278,27286,27577,28008,28010,28011,28013,28014,28015,28016,28069,28216,28271,28275,28502,28623,28624,28625,28626,28627,28665,28666,28667,28690,28691,28692,28693,28694,28696,28697,28698,28699,28700,28701,28703,28711,28712,28713,28714,28765,28773,28817,28833,28834,28835,28836,28883,28886,28895,28896,28897,28898,28943,29150,30122,30131,30132,30189);

update t_knowledge_point set title = $kp$微电子技术基础元件的演变$kp$, content = $kp$电子管阶段产生了广播、电视、无线电通信、仪器仪表、自动化技术和第一代电子计算机。晶体管于1948年发明，加上印制电路组装技术的使用，使电子电路在小型化方面前进了一大步，产生了第二代计算机。集成电路（Integrated Circuit，简称IC）于20世纪50年代出现，以半导体单晶片作为材料；现代集成电路使用的半导体材料通常是硅（Si），也可以是砷化镓（GaAs）等化合物半导体。小规模集成电路使电子电路进一步缩小，产生了第三代计算机；超大规模集成电路使电子电路微型化，产生了第四代计算机。目前所使用的计算机都属于第四代计算机。$kp$, section = '' where id = 21814;
update t_knowledge_point set title = $kp$集成电路的制造$kp$, content = $kp$集成电路是在硅衬底上制作而成的。制造流程为：单晶硅→硅抛光片→硅平面工艺过程→晶圆→芯片。$kp$, section = '' where id = 21816;
update t_knowledge_point set title = $kp$集成电路的发展趋势$kp$, content = $kp$集成电路的特点是体积小、重量轻、可靠性高。集成电路的工作速度主要取决于组成逻辑门电路的晶体管的尺寸，晶体管的尺寸越小，其极限工作频率越高，门电路的开关速度就越快。芯片上电路元件的线条越细，相同面积的晶片可容纳的晶体管就越多，功能就越强，速度也越快。提高集成度，关键在缩小门电路面积。

Moore定律：单块集成电路的集成度平均每18～24个月翻一番（Intel公司创始人Gordon E. Moore，1965年）。

但是，当晶体管的基本线条小到纳米（nm）级，线路的电流微弱到仅有几十个甚至几个电子流动时，晶体管已逼近其物理极限，将无法正常工作。在纳米尺寸下，纳米结构会表现出一些新的量子现象和效应。当前技术前沿是探索量子世界的“纳米芯片技术”，同时发展光子学，研制集成光路，或把电子与光子并用，实现光电子集成。

因此，当前单块集成电路的集成度是有极限的，Moore定律不可能永远成立。$kp$, section = '' where id = 21817;
update t_knowledge_point set title = $kp$IC卡的基本概念$kp$, content = $kp$IC卡是“集成电路卡”的简称，是把集成电路芯片密封在塑料卡基片内部，使其成为能存储、处理和传输数据的载体。与磁卡相比，IC卡不受磁场干扰，而且还能可靠地存储数据。$kp$, section = '' where id = 21854;
update t_knowledge_point set title = $kp$IC卡按芯片分类$kp$, content = $kp$存储器卡：主要用于数据的存储，应用领域广泛，如电话卡、公交卡、医疗卡、饭卡等。

CPU卡：也叫智能卡，具有存储、处理数据的功能，安全性能和智能化程度高，如SIM卡。$kp$, section = '' where id = 21919;
update t_knowledge_point set title = $kp$集成电路按结构工艺分类$kp$, content = $kp$按结构、工艺分为：双极型（bipolar）、金属-氧化物-半导体（MOS）型和双极-MOS型（bi-MOS）。$kp$, section = '' where id = 21939;
update t_knowledge_point set title = $kp$IC卡按使用方式分类$kp$, content = $kp$接触式IC卡：表面有一个方形镀金接口，共有8个或6个镀金触点。使用时必须将IC卡插入读卡机卡口内，通过金属触点传输数据。这种IC卡多用于存储信息量大、读写操作比较复杂的场合，但易磨损、怕油污，寿命不长，如电话IC卡。

非接触式IC卡：又叫射频卡、感应卡，采用电磁感应方式无线传输数据，解决了无源（卡中无电源）和免接触的难题，操作方便、快捷。这种IC卡记录的信息简单，读写数据不多，常用于身份验证等场合。由于采用全密封胶固化，防水、防污，使用寿命很长，如第二代身份证、公交卡等。$kp$, section = '' where id = 21983;
update t_knowledge_point set title = $kp$晶圆与集成电路的制造$kp$, content = $kp$在硅片上可制作出成百上千的集成电路，这种硅片称作晶圆，晶圆可以直接制成集成电路。集成电路的工作速度主要取决于组成逻辑门电路的晶体管的尺寸，因此人们采用缩小门电路面积的方法，使集成电路规模越来越大。$kp$, section = '' where id = 22029;
update t_knowledge_point set title = $kp$集成电路按用途分类$kp$, content = $kp$按用途分为通用集成电路和专用集成电路（ASIC，Application Specific Integrated Circuit）。专用集成电路是指应特定用户要求和特定电子系统的需要而设计、制造的集成电路。目前用CPLD（复杂可编程逻辑器件）和FPGA（现场可编程逻辑阵列）进行ASIC设计是最为流行的方式之一，它们的共性是都具有用户现场可编程特性，都支持边界扫描技术，但两者在集成度、速度以及编程方式上各有特点。$kp$, section = '' where id = 22032;
update t_knowledge_point set title = $kp$外存储器的种类$kp$, content = $kp$外存储器主要有磁存储器、半导体集成电路存储器、光存储器等。磁存储器是计算机的主要外存储器，现在大多使用磁带和磁盘。$kp$, section = '' where id = 22053;
update t_knowledge_point set title = $kp$CPU是超大规模集成电路$kp$, content = $kp$CPU能高速执行指令，完成二进制数据的算术运算、逻辑运算等操作；由数字电路组成，结构极复杂；制作在大规模集成电路芯片上（仅几个平方厘米），称为“微处理器”（microprocessor）。$kp$, section = '' where id = 22110;
update t_knowledge_point set title = $kp$微电子技术与集成电路$kp$, content = $kp$集成电路芯片是微电子技术的结晶，是计算机的核心。先进的微电子技术带来高集成度芯片，进而形成高性能的计算机；计算机又可用于集成电路的设计、生产过程控制及自动测试，从而制造出性能更高、成本更低的集成电路芯片。$kp$, section = '' where id = 22174;
update t_knowledge_point set title = $kp$电子线路基础元件的演变$kp$, content = $kp$集成电路（Integrated Circuit，简称IC）于20世纪50年代出现，以半导体单晶片作为材料，经平面工艺加工制造，将大量晶体管、电阻等元器件及互连线构成的电子线路集成在基片上，构成一个微型化的电路或系统。

现代集成电路使用的半导体材料通常是硅（Si），也可以是砷化镓（GaAs）等化合物半导体。

按集成度可分为小规模集成电路和超大规模集成电路等。$kp$, section = '' where id = 22197;
update t_knowledge_point set title = $kp$集成电路按结构与工艺分类$kp$, content = $kp$根据所用晶体管结构、电路和工艺分为：双极型（Bipolar）集成电路、金属-氧化物-半导体（MOS）集成电路、双极-金属-氧化物-半导体（Bi-MOS）集成电路等。$kp$, section = '' where id = 22228;
update t_knowledge_point set title = $kp$量子计算机$kp$, content = $kp$量子计算机是运用量子力学原理设计的计算机，其潜在运算速度远高于电子计算机。从理论上说，其速度提升几乎没有止境，因为量子计算技术可以在同一时间内执行各种操作，同时有足够的能力完成电子计算机还很难完成的任务，例如密码破译和语音识别等。欧洲已经成立了量子计算机研究所，估计量子计算机可能会在今后的十五年左右出现。$kp$, section = '' where id = 22234;
update t_knowledge_point set title = $kp$集成电路的规模分类$kp$, content = $kp$根据所包含的晶体管数目分为：

| 集成电路规模 | 集成度（个电子元件） |
| --- | --- |
| 小规模集成电路（SSI） | ＜100 |
| 中规模集成电路（MSI） | 100～3000 |
| 大规模集成电路（LSI） | 3000～10万 |
| 超大规模集成电路（VLSI） | 10万～100万 |
| 极大规模集成电路（ULSI） | ＞100万 |$kp$, section = '' where id = 22237;
update t_knowledge_point set title = $kp$微电子技术的基本概念$kp$, content = $kp$微电子技术是以集成电路（IC）为核心的电子技术，是在电子电路和系统的超小型化和微型化过程中逐渐形成和发展起来的。

微电子技术是信息技术领域中的关键技术，是发展电子信息产业和各项高技术的基础。$kp$, section = '' where id = 23482;
update t_knowledge_point set title = $kp$NFC的技术参数$kp$, content = $kp$采用13.56MHz频带的近距离无线通信技术；通信距离仅10cm左右；传输速度106～848kb/s；可进行双向通信，既可读数据也能写数据。$kp$, section = '' where id = 24127;
update t_knowledge_point set title = $kp$NFC的三种功能$kp$, content = $kp$卡模拟：模拟非接触式IC卡或RFID标签，用于刷卡消费。

读写器模拟：读写IC卡或RFID标签的数据。

点对点数据通信（P2P）。$kp$, section = '' where id = 24201;
update t_knowledge_point set title = $kp$集成电路按晶体管数目分类$kp$, content = $kp$小规模（SSI）：小于100个电子元件；中规模（MSI）：100～3000；大规模（LSI）：3000～10万；超大规模（VLSI）：10万～100万；极大规模（ULSI）：大于100万。$kp$, section = '' where id = 24601;
update t_knowledge_point set title = $kp$集成电路规模的分界值$kp$, content = $kp$按晶体管数目分为小规模（SSI）、中规模（MSI）、大规模（LSI）、超大规模（VLSI）、极大规模（ULSI），相邻规模的分界值依次为100、3000、10万、100万。$kp$, section = '' where id = 24602;
update t_knowledge_point set title = $kp$IC卡按使用方式分类$kp$, content = $kp$接触式IC卡：如电话卡，卡上通常含有一个金属触点，通过相应的读写系统进行操作。

非接触式IC卡：采用电磁感应方式无线传输数据，方便、快捷。$kp$, section = '' where id = 24719;
update t_knowledge_point set title = $kp$非接触式IC卡的特点与应用$kp$, content = $kp$原理：采用电磁感应方式无线传输数据，实现无源（卡中无电源）和免接触。

特点：操作方便、快捷，采用全密封胶固化，防水、防污，使用寿命长。

适用场景：用于读写信息较简单的场合，如身份验证等。即射频卡、感应卡，如身份证。$kp$, section = '' where id = 25866;
update t_knowledge_point set title = $kp$双界面卡$kp$, content = $kp$原理：可通过接触方式的触点使用，也可相隔一定距离以射频方式使用。

特点：一卡多用、一卡通用、高度安全、快速交易等。

适用场景：适用于恶劣工作环境和自助消费场所，适用于对安全性要求高的系统，可作为金融电子钱包应用，如公交一卡通、银行IC卡。$kp$, section = '' where id = 25867;
update t_knowledge_point set title = $kp$集成电路$kp$, content = $kp$集成电路缩写作IC，或称微电路（microcircuit）、微芯片（microchip）、芯片（chip），在电子学中是一种把电路（主要包括半导体设备，也包括被动组件等）小型化的方式，并时常制造在半导体晶圆表面上。$kp$, section = '' where id = 26697;
update t_knowledge_point set title = $kp$集成电路的概念$kp$, content = $kp$集成电路（integrated circuit）是一种微型电子器件或部件。$kp$, section = '' where id = 26698;
update t_knowledge_point set title = $kp$集成电路的发展与分类$kp$, content = $kp$电子管阶段（20世纪初至20世纪60年代）：电子管是最早的电信号放大器件。

晶体管阶段（20世纪50年代至70年代）。

集成电路阶段（20世纪60年代至今）。

集成电路按功能分类：微处理器、存储器、逻辑器件、模拟器件。

IC卡是将一个微电子芯片嵌入符合ISO 7816标准的卡基中，做成卡片形式。IC卡与读写器之间的通讯方式可以是接触式，也可以是非接触式。$kp$, section = '' where id = 26699;
update t_knowledge_point set title = $kp$微电子技术与集成电路$kp$, content = $kp$微电子技术是信息技术领域中的关键技术，是发展电子信息产业和各项高技术的基础。

微电子技术的核心是集成电路技术。$kp$, section = '' where id = 26952;
update t_knowledge_point set title = $kp$电子电路元器件的发展演变$kp$, content = $kp$电子管（1904年）、晶体管（1948年）、中小规模集成电路（20世纪50年代）、大规模和超大规模集成电路（20世纪70年代）。

微电子技术是以集成电路为核心的电子技术，它是在电子元器件小型化、微型化的过程中发展起来的。$kp$, section = '' where id = 26953;
update t_knowledge_point set title = $kp$集成电路的定义与优点$kp$, content = $kp$集成电路（Integrated Circuit，简称IC）：以半导体单晶片作为基片，采用平面工艺，将晶体管、电阻、电容等元器件及其连线所构成的电路制作在基片上，构成一个微型化的电路或系统。

优点：体积小、重量轻；功耗小、成本低；速度快、可靠性高。$kp$, section = '' where id = 26954;
update t_knowledge_point set title = $kp$集成电路的制造工艺$kp$, content = $kp$集成电路的制造工序繁多，从原料熔炼开始到最终产品包装大约需要400多道工序，工艺复杂且技术难度非常高，有一系列的关键技术。许多工序必须在恒温、恒湿、超洁净的无尘厂房内完成。兴建一个具有两条生产线、能加工8英寸晶圆的集成电路工厂需投资人民币10亿元以上。$kp$, section = '' where id = 26955;
update t_knowledge_point set title = $kp$集成电路性能提升的途径$kp$, content = $kp$集成电路的工作速度主要取决于晶体管的尺寸。晶体管的尺寸越小，其极限工作频率越高，门电路的开关速度就越快，相同面积的晶片可容纳的晶体管数目也越多。所以从集成电路问世以来，人们就一直在缩小晶体管、电阻、电容、连接线的尺寸上下功夫。$kp$, section = '' where id = 26956;
update t_knowledge_point set title = $kp$Moore定律$kp$, content = $kp$Moore定律：单块集成电路的集成度平均每18个月翻一番（Gordon E. Moore，1965年）。

以Intel微处理器集成度的发展为例：1970年4004、1971年8008、1972年8080、1975年约3万个晶体管、1978年8086、1982年80286、1985年80386、1989年80486、1994年Pentium、1997年Pentium II、1999年Pentium III、2000年Pentium 4，2003年约2亿、2005年约4亿、2008年约8亿，2010年达10亿个晶体管。$kp$, section = '' where id = 26957;
update t_knowledge_point set title = $kp$集成电路技术的发展趋势$kp$, content = $kp$减小蚀刻尺寸，缩小晶体管、电阻、电容和连线的尺寸；增大硅晶圆的面积，使每块晶圆能生产更多的芯片。

| 项目 | 1999 | 2001 | 2004 | 2008 | 2010 | 2014 |
| --- | --- | --- | --- | --- | --- | --- |
| 工艺（μm） | 0.18 | 0.13 | 0.09 | 0.045 | 0.032 | 0.014 |
| 晶体管（百万个） | 23.8 | 47.6 | 135 | 539 | 1000 | 3500 |
| 时钟频率（GHz） | 1.2 | 1.6 | 2.0 | 2.655 | 3.8 | 5 |
| 面积（mm²） | 340 | 340 | 390 | 468 | 600 | 901 |
| 连线层数 | 6 | 7 | 8 | 9 | 9 | 10 |
| 晶圆直径（英寸） | 12 | 12 | 14 | 16 | 16 | 18 |$kp$, section = '' where id = 26958;
update t_knowledge_point set title = $kp$IC卡简介$kp$, content = $kp$几乎每个人每天都与IC卡打交道，例如身份证、手机SIM卡、公交卡、校园卡等。IC卡有哪些类型和用途、工作原理大致如何，下面作简单介绍。$kp$, section = '' where id = 26960;
update t_knowledge_point set title = $kp$IC卡的定义、特点与应用$kp$, content = $kp$IC卡（chip card、smart card）又称为集成电路卡，它是把集成电路芯片密封在塑料卡基片内，使其成为能存储信息、处理和传递数据的载体。

特点：存储信息量大；保密性能强，可以防止伪造和窃用；抗干扰能力强；可靠性高。

应用举例：作为电子证件，记录持卡人的信息，用作身份识别（如身份证、考勤卡、医疗卡、住房卡等）；作为电子钱包（如校园卡、公交卡、加油卡等）。$kp$, section = '' where id = 26961;
update t_knowledge_point set title = $kp$IC卡按芯片分类$kp$, content = $kp$存储器卡：封装的集成电路为存储器，信息可长期保存，也可通过读卡器改写。结构简单，使用方便，有一定安全措施。用于电话卡、校园卡、公交卡等。

CPU卡：封装的集成电路为中央处理器（CPU）和存储器，还配有芯片操作系统（Chip Operating System），处理能力强，保密性更好，常用作银行卡和信用卡。手机中使用的SIM卡就是一种专用的CPU卡。$kp$, section = '' where id = 26962;
update t_knowledge_point set title = $kp$SIM卡的组成$kp$, content = $kp$SIM卡由5部分组成：CPU（8位/16位/32位）、程序存储器ROM、工作存储器RAM、数据存储器EEPROM、串行通信单元。$kp$, section = '' where id = 26963;
update t_knowledge_point set title = $kp$接触式IC卡$kp$, content = $kp$表面有方形镀金接口，共8个或6个镀金触点。使用时必须将IC卡插入读卡机，通过金属触点传输数据。用于信息量大、读写操作比较复杂的场合，但易磨损、怕脏、寿命短。如电话IC卡。$kp$, section = '' where id = 26965;
update t_knowledge_point set title = $kp$非接触式IC卡的原理与特点$kp$, content = $kp$又称射频卡、感应卡。采用电磁感应方式无线传输数据，解决了无源（卡中无电源）和免接触问题。操作方便、快捷，采用全密封胶固化，防水、防污，使用寿命长。用于读写信息较简单的场合，如身份验证等。$kp$, section = '' where id = 26966;
update t_knowledge_point set title = $kp$双界面卡$kp$, content = $kp$双界面卡既可通过接触方式的触点使用，也可相隔一定距离以射频方式使用，兼有接触式IC卡与非接触式IC卡两种接口。图中对比了接触式IC卡、非接触式IC卡与双界面CPU卡三种形态。$kp$, section = '' where id = 26967;
update t_knowledge_point set title = $kp$非接触式IC卡在第二代身份证中的应用$kp$, content = $kp$第二代身份证使用非接触式CPU卡，可实现“电子防伪”和“数字管理”两大功能。

电子防伪措施：个人数据和人脸图像经过加密后存储在芯片中，需要时可通过非接触式读卡器读出进行验证；还可以将指纹等人体生物特征保存在芯片中，以进一步提高防伪性能。

数字管理功能：存储器能储存多达几兆字节的信息，采用分区存储，按不同安全等级授权读写；采用数据库和网络技术，实现全国联网快速查询和身份识别，使二代证在公共安全、社会管理、电子政务、电子商务等方面发挥重要作用。$kp$, section = '' where id = 26968;
update t_knowledge_point set title = $kp$线宽缩小带来的物理极限问题$kp$, content = $kp$线宽进一步缩小后，晶体管线条小到纳米级时，其电流微弱到仅有几十个甚至几个电子流动，晶体管将逼近其物理极限而无法正常工作。$kp$, section = '' where id = 27055;
update t_knowledge_point set title = $kp$微电子技术与集成电路$kp$, content = $kp$微电子技术是以集成电路为核心的电子技术。电子元器件的发展经历四代：电子管、晶体管、中/小型规模集成电路、大/超大规模集成电路。$kp$, section = '' where id = 27159;
update t_knowledge_point set title = $kp$计算机按所用电子元器件划分四代$kp$, content = $kp$按照所用电子元器件的不同，计算机被划分为四代，现代计算机属于大规模和超大规模集成电路时代。$kp$, section = '' where id = 27160;
update t_knowledge_point set title = $kp$现代集成电路使用的半导体材料$kp$, content = $kp$现代集成电路使用的半导体材料主要是硅，也可以是化合物半导体砷化镓（GaAs）或者锗。$kp$, section = '' where id = 27161;
update t_knowledge_point set title = $kp$集成电路按用途分类$kp$, content = $kp$集成电路按用途分为通用集成电路和专用集成电路。

① 通用集成电路：存储器芯片、CPU芯片等。
② 专用集成电路：手机、洗衣机、照相机等使用的集成电路。$kp$, section = '' where id = 27162;
update t_knowledge_point set title = $kp$集成电路按功能分类$kp$, content = $kp$集成电路按功能分为数字集成电路和模拟集成电路。$kp$, section = '' where id = 27163;
update t_knowledge_point set title = $kp$集成电路按所含元器件数目分类$kp$, content = $kp$集成电路按包含的电子元器件的数目分为小规模、中规模、大规模、超大规模、极大规模集成电路。$kp$, section = '' where id = 27164;
update t_knowledge_point set title = $kp$集成电路的分类、特点与Moore定律$kp$, content = $kp$集成电路按照所用晶体管的结构、电路和工艺的不同，分为双极型集成电路、金属氧化物半导体（MOS）型电路、双极-金属氧化物半导体集成电路等。

集成电路的特点是体积小、重量轻、可靠性高。

Moore定律：单块集成电路的集成度平均每18～24个月翻一番。Moore定律不可能永远成立。$kp$, section = '' where id = 27165;
update t_knowledge_point set title = $kp$非接触式IC卡（射频卡、感应卡）$kp$, content = $kp$① 工作原理：电磁感应方式、无线传输数据、无源（卡中无电源）、免接触。
② 特点：操作方便、防水、防污、使用寿命长。
③ 适用场合：读写信息较简单的场合，如身份验证等。

IC卡按芯片分类，除非接触式外还包括存储器卡和CPU卡。$kp$, section = '' where id = 27166;
update t_knowledge_point set title = $kp$存储器卡$kp$, content = $kp$① 原理：卡封装的集成电路主要是存储器。
② 特点：有写保护和加密电路，也就是说存储器卡也可以加密。
③ 适用场合：校园卡、公交卡、医保卡、门禁卡。$kp$, section = '' where id = 27167;
update t_knowledge_point set title = $kp$CPU卡（智能卡）$kp$, content = $kp$① 原理：CPU卡集成了微处理器（CPU）、程序处理器和数据存储器，还配有操作系统。
② 特点：处理能力强，保密性更好。
③ 适用场合：证件、信用卡、手机的SIM卡。$kp$, section = '' where id = 27168;
update t_knowledge_point set title = $kp$微电子技术的核心$kp$, content = $kp$微电子技术是以集成电路为核心的电子技术。$kp$, section = '' where id = 27226;
update t_knowledge_point set title = $kp$第三代计算机：中小规模集成电路$kp$, content = $kp$第三代：中小规模集成电路计算机。$kp$, section = '' where id = 27278;
update t_knowledge_point set title = $kp$身份识别方法与访问控制$kp$, content = $kp$身份识别是访问控制的基础。身份识别方法：口令、硬件（IC卡、护照）、生理特征（指纹、声音）。

举例：ATM柜员机通过IC卡或磁卡与一个6位数口令结合进行身份验证；网上银行采用USB钥匙和口令相结合进行身份验证。$kp$, section = '' where id = 27286;
update t_knowledge_point set title = $kp$接触式IC卡$kp$, content = $kp$① 工作原理：插入读卡机，通过金属触点传输数据。
② 特点：易磨损、怕脏、寿命短。
③ 适用场合：信息量大、读写操作比较复杂。$kp$, section = '' where id = 27577;
update t_knowledge_point set title = $kp$第三代计算机：中小规模集成电路$kp$, content = $kp$第3代：中小规模集成电路计算机。$kp$, section = '' where id = 28008;
update t_knowledge_point set title = $kp$电子元器件发展的四代$kp$, content = $kp$电子元器件发展的四代：电子管、晶体管、中/小型规模集成电路、大/超大规模集成电路。$kp$, section = '' where id = 28010;
update t_knowledge_point set title = $kp$现代PC机的微处理器与芯片组$kp$, content = $kp$现代PC机中所使用的微处理器、芯片组等都属于大规模和超大规模集成电路。$kp$, section = '' where id = 28011;
update t_knowledge_point set title = $kp$集成电路按所含元器件数目分类$kp$, content = $kp$集成电路按包含的电子元器件的数目分为小规模、中规模、大规模、超大规模、极大规模集成电路。$kp$, section = '' where id = 28013;
update t_knowledge_point set title = $kp$集成电路的分类、特点与Moore定律$kp$, content = $kp$集成电路按照所用晶体管的结构、电路和工艺的不同，分为双极型集成电路、金属氧化物半导体（MOS）型电路、双极-金属氧化物半导体集成电路等。

集成电路的特点是体积小、重量轻、可靠性高。

Moore定律：单块集成电路的集成度平均每18～24个月翻一番。Moore定律不可能永远成立。$kp$, section = '' where id = 28014;
update t_knowledge_point set title = $kp$存储器卡$kp$, content = $kp$① 原理：卡封装的集成电路主要是存储器。
② 特点：有写保护和加密电路，也就是说存储器卡也可以加密。
③ 适用场合：校园卡、公交卡、医保卡、门禁卡。$kp$, section = '' where id = 28015;
update t_knowledge_point set title = $kp$CPU卡（智能卡）$kp$, content = $kp$① 特点：处理能力强，保密性更好。
② CPU卡集成了微处理器（CPU）、程序处理器和数据存储器，还配有操作系统，具有智能处理能力，保密性好。
③ 适用场合：证件和信用卡，手机的SIM卡。$kp$, section = '' where id = 28016;
update t_knowledge_point set title = $kp$LCD显示器的特点$kp$, content = $kp$LCD显示器的特点：工作电压低、辐射危害小、功耗低、不闪烁、适于大规模集成电路驱动、体量轻薄、易于实现大画面显示等。$kp$, section = '' where id = 28069;
update t_knowledge_point set title = $kp$接触式IC卡$kp$, content = $kp$① 工作原理：插入读卡机，通过金属触点传输数据。
② 特点：易磨损、怕脏、寿命短。
③ 适用场合：信息量大、读写操作比较复杂。$kp$, section = '' where id = 28216;
update t_knowledge_point set title = $kp$液晶显示器的特点与打印机耗材$kp$, content = $kp$液晶显示器辐射小、功耗低、适合大规模集成电路的驱动。

针式打印机的耗材是色带；喷墨打印机的耗材是墨水；激光打印机的耗材是碳粉。$kp$, section = '' where id = 28271;
update t_knowledge_point set title = $kp$现代集成电路的半导体材料与分类$kp$, content = $kp$现代集成电路使用的半导体材料主要是硅，也可以是化合物半导体砷化镓或者锗。

① 集成电路按用途分：通用集成电路和专用集成电路，存储器芯片、CPU芯片都属于通用集成电路。
② 集成电路按功能分：数字集成电路和模拟集成电路。
③ 集成电路按晶体管数目分：小规模、中规模、大规模、超大规模、极大规模。

现代计算机是第四代，采用大规模和超大规模集成电路，没有第五代计算机的说法。$kp$, section = '' where id = 28275;
update t_knowledge_point set title = $kp$液晶显示器的特点与打印机耗材$kp$, content = $kp$液晶显示器辐射小、功耗低、适合大规模集成电路的驱动。

针式打印机的耗材是色带；喷墨打印机的耗材是墨水；激光打印机的耗材是碳粉。$kp$, section = '' where id = 28502;
update t_knowledge_point set title = $kp$信息技术的核心技术$kp$, content = $kp$核心技术：微电子技术、通信技术、计算机技术。

微电子技术以集成电路为核心，集成电路芯片是信息产业的基础。$kp$, section = '' where id = 28623;
update t_knowledge_point set title = $kp$集成电路的工作速度与晶体管尺寸$kp$, content = $kp$集成电路的工作速度主要取决于组成逻辑门电路的晶体管的尺寸。晶体管的尺寸越小，其极限工作频率越高，门电路的开关速度就越快。$kp$, section = '' where id = 28624;
update t_knowledge_point set title = $kp$集成电路按所含电子元件数目分类$kp$, content = $kp$按所包含的电子元件数目分：

1）中小规模集成电路，集成对象为门电路或单级放大器；
2）大规模集成电路，集成对象为功能部件、子系统；
3）PC机使用的微处理器、芯片组、图形加速芯片都是超大规模（VLSI）和极大规模集成电路。$kp$, section = '' where id = 28625;
update t_knowledge_point set title = $kp$集成电路按功能分类$kp$, content = $kp$按功能分为数字集成电路和模拟集成电路。数字集成电路如逻辑电路、存储器、微处理器、微控制器、数字信号处理器等；模拟集成电路又称为线性电路，如信号放大器、功率放大器等。$kp$, section = '' where id = 28626;
update t_knowledge_point set title = $kp$集成电路按用途分类与Moore定律$kp$, content = $kp$按用途分：通用集成电路（如微处理器和存储器芯片等）、专用集成电路（ASIC、FPGA）。

Moore定律：在未来的十多年里，单块集成电路的集成度平均每18～24个月翻一番。

集成电路卡即IC卡。$kp$, section = '' where id = 28627;
update t_knowledge_point set title = $kp$集成电路按用途分类$kp$, content = $kp$按用途分：通用集成电路，例如内存条、CPU芯片等；专用集成电路，例如航空电子导航。$kp$, section = '' where id = 28665;
update t_knowledge_point set title = $kp$集成电路按功能分类$kp$, content = $kp$按功能分：数字集成电路，例如计算机、手机等；模拟集成电路，例如收音机、麦克风等。$kp$, section = '' where id = 28666;
update t_knowledge_point set title = $kp$集成电路的集成度分类、发展趋势与IC卡应用$kp$, content = $kp$按集成度（单位面积上元器件数目）分：小规模（SSI）、中规模（MSI）、大规模（LSI）、超大规模（VLSI）、极大规模（ULSI）。

四、集成电路的发展趋势：集成电路的晶体管尺寸越小，速度越快。集成度的提高规律（Moore定律）：单块集成电路的集成度平均每18～24个月翻一番（目前符合）。集成电路的出路：量子计算机、光子计算机、生物（酶）计算机。

五、IC卡应用（所有IC卡都可以加密）
1. 按芯片分：CPU卡，卡中既有硬件也有操作系统，安全级别高（信用卡、SIM卡、身份证）；存储器卡，用于安全级别不高的场合（饭卡、公交卡）。
2. 按使用方式分：接触式，必须插入读卡器才能读出信息；非接触式（感应卡、射频卡），用电磁感应方式解决卡中无源问题；双界面卡，既可以接触也可以非接触。

第三节 计算机的硬件
一、计算机的发展：第一代（40—50年代）电子管、磁鼓，使用机器语言和汇编语言，用于科学计算和军事；第二代（50—60年代）晶体管、磁芯，使用高级语言，用于数据处理；第三代（60—70年代）中小规模集成电路，出现操作系统、数据库，用于工业控制；第四代（70—80年代）大/超大规模集成电路，采用软件工程、分布式处理，应用于各行各业。

二、计算机系统
1. 计算机系统由硬件系统和软件系统组成。
2. 现代计算机之父是冯·诺依曼。现代计算机的结构＝输入设备＋处理设备＋输出设备＝输入设备＋CPU＋存储器＋输出设备＝输入设备＋控制器＋运算器＋存储器＋输出设备。
3. 具体结构：输入设备，不论信息的原始形态如何，输入计算机都以二进制形式表示；处理器，能够执行算术运算、逻辑运算以及数据传送的部件（例如GPU、DSP），中央处理器（CPU）是处理系统软件与应用软件的处理器；CPU与CPU芯片，CPU芯片在个人电脑中一般只有一个，但该芯片可以包含多个CPU（内核），多核可以执行并行处理；存储器，内存贵、快，与CPU是直接关系，断电信息不保存，外存便宜、慢，与CPU是间接关系，断电信息保存；输出设备，把计算机中的二进制转换成人们可以识别的信息；总线（Bus），把所有设备连接起来的一组共享线路和控制电路，其中CPU总线（前端总线）连接CPU和内存，I/O总线连接内存与I/O设备。

三、计算机的分类$kp$, section = '' where id = 28667;
update t_knowledge_point set title = $kp$集成电路不是分立元件$kp$, content = $kp$IC不是分立元件（电子管、晶体管是分立元件），而是将晶体管、电阻、电容等元器件及它们之间的连线，经过平面工艺加工制造，制作在半导体单晶片的基片上，构成一个微型化的具有特定功能的电路或系统。$kp$, section = '' where id = 28690;
update t_knowledge_point set title = $kp$集成电路的优点$kp$, content = $kp$集成电路的优点是体积小、重量轻、功耗小、成本低、速度快、可靠性高。$kp$, section = '' where id = 28691;
update t_knowledge_point set title = $kp$集成电路的分类与集成度划分$kp$, content = $kp$按用途分：通用集成电路（如CPU、内存条、芯片组等）、专用集成电路（ASIC）。

按集成度分：

- 小规模集成电路（SSI）：小于100个元件
- 中规模集成电路（MSI）：小于3000个
- 大规模集成电路（LSI）：小于10万个，例子为功能部件、子系统
- 超大规模集成电路（VLSI）：10万到100万
- 极大规模集成电路（ULSI）：100万以上

中小规模集成电路的例子如简单的门电路（完成基本的算术运算、逻辑运算）和触发器（用于在CPU内部存储一个比特）、单级放大器。以后不再区分VLSI和ULSI，统称为VLSI。

注意：今天的CPU、内存、芯片组、显卡上的绘图处理器等都是VLSI；集成电路芯片是计算机和通信设备的硬件核心，是现代信息产业化的基础；目前几乎所有的电子产品（手机、计算机、音响设备等）都以集成电路芯片为核心。$kp$, section = '' where id = 28692;
update t_knowledge_point set title = $kp$硅平面工艺与集成电路制造流程$kp$, content = $kp$制造工艺技术采用硅平面工艺。制造流程：单晶硅锭→晶圆→芯片→集成电路→成品。$kp$, section = '' where id = 28693;
update t_knowledge_point set title = $kp$晶圆$kp$, content = $kp$单晶硅锭经切割、研磨、抛光后制成像镜面一样光滑的圆形薄片，上面整齐排满集成电路，一块晶圆可制作成百上千个独立的集成电路。$kp$, section = '' where id = 28694;
update t_knowledge_point set title = $kp$Moore定律$kp$, content = $kp$单块集成电路的集成度平均每18～24个月翻一番。到目前为止，IC的发展大致遵循Moore定律；Moore定律不可能永远有效。$kp$, section = '' where id = 28696;
update t_knowledge_point set title = $kp$集成电路的发展趋势$kp$, content = $kp$集成电路的工作速度主要取决于晶体管的尺寸。晶体管尺寸越小，极限工作频率越高，门电路的开关速度就越快；同时，相同面积的晶片可容纳的晶体管数目越多，功能越强。$kp$, section = '' where id = 28697;
update t_knowledge_point set title = $kp$IC卡$kp$, content = $kp$IC卡（chip card、smart card）即集成电路卡，把集成电路芯片密封在塑料卡基片内。$kp$, section = '' where id = 28698;
update t_knowledge_point set title = $kp$IC卡按所嵌芯片分类$kp$, content = $kp$按所嵌的芯片分类：存储器卡、带加密逻辑的存储器卡、CPU卡（即智能卡）。

CPU卡封装有中央处理器（CPU）、存储器（程序存储器和数据存储器）和芯片操作系统（Chip Operating System，属于程序）。特点：处理能力强，保密性更好。用途：证件和信用卡，如手机中的SIM卡、第二代身份证。

注：手机的SIM卡是CPU卡，卡上可存储用户身份信息、电话号码、短消息等。$kp$, section = '' where id = 28699;
update t_knowledge_point set title = $kp$接触式IC卡$kp$, content = $kp$使用过程：插入读卡机，通过金属触点传输数据。

适用场合：信息量大、读写操作比较复杂。缺点：易磨损、怕脏、寿命短。$kp$, section = '' where id = 28700;
update t_knowledge_point set title = $kp$非接触式IC卡$kp$, content = $kp$非接触式IC卡又称射频卡、感应卡。

工作原理：采用电磁感应方式无线传输数据，无源（卡中无电源）、免接触。

特点：操作方便、快捷，全密封胶固化，防水、防污，使用寿命长。

适用场合：读写信息较简单的场合，如身份验证等。

注：读卡器发射电磁波，非接触式IC卡通过电磁感应在卡内产生约2V电压，在距读卡器约5～10厘米范围内进行数据交换；数据传输时对卡的方向没有限制。$kp$, section = '' where id = 28701;
update t_knowledge_point set title = $kp$晶体管的重要性$kp$, content = $kp$晶体管（开关）可以用来实现各种“门”电路，所以它是所有计算机（数字装置）中最基本的物理单元。

所谓“主频”，实质上就是晶体管每秒钟允许的最大通断（开关）次数。

晶体管的工作电压越低，功耗就越小。

晶体管可以使用平面工艺制作在半导体硅片上。

借助微电子工艺技术，几平方厘米的硅片上可以制作数以千万计的晶体管。$kp$, section = '' where id = 28703;
update t_knowledge_point set title = $kp$集成电路的常见封装形式$kp$, content = $kp$常见封装形式有单列直插式（SIP）、双列直插式（DIP）和阵列式（PGA）。$kp$, section = '' where id = 28711;
update t_knowledge_point set title = $kp$集成电路按功能与用途分类$kp$, content = $kp$IC按功能分为数字IC和模拟IC；按用途分为通用IC（如存储器、CPU等）和专用IC。$kp$, section = '' where id = 28712;
update t_knowledge_point set title = $kp$IC卡按芯片分类$kp$, content = $kp$IC卡按卡中所镶嵌的集成电路芯片分为存储器卡（如公交卡）和CPU卡（如SIM卡）。$kp$, section = '' where id = 28713;
update t_knowledge_point set title = $kp$IC卡按使用方式分类$kp$, content = $kp$IC卡按使用方式分为接触式IC卡（如电话IC卡）和非接触式IC卡（如第二代身份证）。$kp$, section = '' where id = 28714;
update t_knowledge_point set title = $kp$微电子技术与集成电路概述$kp$, content = $kp$1946年，美国宾夕法尼亚大学研制成功电子计算机ENIAC。

发展经历电子管、晶体管、中小规模集成电路、大规模和超大规模集成电路等阶段。

分类：通用和专用。

集成电路制造：单晶硅—晶片—硅平面工艺技术—晶圆—芯片。

特点：集成度越高，速度越快。摩尔定律指出集成电路每18个月集成度提高一倍，但该定律不会永远成立。$kp$, section = '' where id = 28765;
update t_knowledge_point set title = $kp$计算机发展的四个阶段$kp$, content = $kp$电子管、晶体管、中小规模集成电路、大规模和超大规模集成电路。

集成电路规模：SSI（小规模）、MSI（中规模）、LSI（大规模）、VLSI（超大规模）、ULSI（极大规模）。$kp$, section = '' where id = 28773;
update t_knowledge_point set title = $kp$计算机系统与集成电路的学习要求$kp$, content = $kp$了解计算机系统的基本组成、常见设备和基本原理，了解集成电路，掌握信息在计算机中的表示。$kp$, section = '' where id = 28817;
update t_knowledge_point set title = $kp$集成电路的材料与分类$kp$, content = $kp$现代集成电路使用的半导体材料主要是硅，也可以是化合物半导体砷化镓或锗。

① 按用途分：通用集成电路和专用集成电路。存储器芯片、CPU芯片都属于通用集成电路。

② 按功能分：数字集成电路和模拟集成电路。

③ 按晶体管数目分：小规模、中规模、大规模、超大规模、极大规模。$kp$, section = '' where id = 28833;
update t_knowledge_point set title = $kp$Moore定律$kp$, content = $kp$单块集成电路的集成度平均每18～24个月翻一番，但不可能永远成立。$kp$, section = '' where id = 28834;
update t_knowledge_point set title = $kp$IC卡按芯片类型分类$kp$, content = $kp$存储卡（公交卡）和CPU卡（SIM卡、芯片信用卡）。$kp$, section = '' where id = 28835;
update t_knowledge_point set title = $kp$CPU卡与存储卡$kp$, content = $kp$CPU卡集成了微处理器（CPU）、程序存储器和数据存储器，还配有操作系统，具有智能处理能力，保密性好，如手机的SIM卡。存储卡也有一定的加密功能。$kp$, section = '' where id = 28836;
update t_knowledge_point set title = $kp$微电子技术简介$kp$, content = $kp$核心技术：微电子技术、通信技术、计算机技术。

微电子技术以集成电路为核心，集成电路芯片是信息产业的基础。$kp$, section = '' where id = 28883;
update t_knowledge_point set title = $kp$微处理器$kp$, content = $kp$把CPU和一组寄存器（Registers）集成在一片大规模集成电路或超大规模集成电路封装之中的器件。$kp$, section = '' where id = 28886;
update t_knowledge_point set title = $kp$电子元器件的四代$kp$, content = $kp$电子管（1904年）、晶体管（1948年）、中小规模集成电路（20世纪50年代）、大规模和超大规模集成电路（20世纪70年代）。现代计算机属于第四代。$kp$, section = '' where id = 28895;
update t_knowledge_point set title = $kp$集成电路的材料与规模划分$kp$, content = $kp$现代集成电路使用的半导体材料主要是硅（Si），也可以是化合物半导体砷化镓（GaAs）。

按用途分：通用集成电路和专用集成电路，存储器芯片属于通用集成电路。

按功能分：数字集成电路和模拟集成电路。

按晶体管数目分：小规模（100个电子元器件以下）、中规模（100～3000个电子元器件）、大规模（3000～10万个电子元器件）、超大规模（10万～100万个电子元器件）、极大规模（大于100万个电子元器件）。现代计算机属于第四代，即超大规模集成电路。$kp$, section = '' where id = 28896;
update t_knowledge_point set title = $kp$集成电路的特点与Moore定律$kp$, content = $kp$集成电路的特点：体积小、重量轻、可靠性高。

Moore定律：单块集成电路的集成度平均每18～24个月翻一番，但不可能永远成立。$kp$, section = '' where id = 28897;
update t_knowledge_point set title = $kp$IC卡的分类$kp$, content = $kp$按芯片类型分类：存储卡（公交卡、饭卡）和CPU卡（信用卡），CPU卡内主要有CPU和存储器。

按使用方式分类：接触式（银行卡）和非接触式（公交卡）。

手机中使用的SIM卡是一种特殊的CPU卡。$kp$, section = '' where id = 28898;
update t_knowledge_point set title = $kp$集成电路的定义$kp$, content = $kp$以半导体单晶片作为材料，经平面工艺加工制造，将大量晶体管、电阻等元器件及互连线构成的电子线路集成在基片上，构成一个微型化的电路或系统。$kp$, section = '' where id = 28943;
update t_knowledge_point set title = $kp$身份鉴别$kp$, content = $kp$又名真实性鉴别、身份认证。

定义：证实某人或某物（消息、文件、主机等）的真实身份与其所声称的身份是否相符的过程。

目的：防止欺诈和假冒攻击。

认证方式：IC卡、磁卡、USB钥匙、口令、眼底虹膜等。

在计算机系统中，单纯采用令牌（如IC卡、磁卡等）进行身份认证的缺点是：丢失令牌将导致他人能轻易进行假冒，从而带来安全隐患。$kp$, section = '' where id = 29150;
update t_knowledge_point set title = $kp$集成电路的线宽$kp$, content = $kp$目前线宽为32nm，以后发展到14nm（数量级为几十纳米），线宽越来越细。

注意：微电子技术最终会到达极限，线宽不会一直细小下去。$kp$, section = '' where id = 30122;
update t_knowledge_point set title = $kp$集成电路按元器件数目分类$kp$, content = $kp$IC按包含的电子元器件（晶体管、电阻、电容等）的个数分为：SSI（小规模）、MSI（中规模）、LSI（大规模）、VLSI（超大规模）、ULSI（极大规模）。$kp$, section = '' where id = 30131;
update t_knowledge_point set title = $kp$摩尔对集成度的预测$kp$, content = $kp$Intel公司的创始人摩尔1965年在《电子学》杂志上预测，单块IC的集成度平均每18～24个月翻一番。$kp$, section = '' where id = 30132;
update t_knowledge_point set title = $kp$IC卡按使用方式分类及工作原理$kp$, content = $kp$按使用方式分为接触式（银行卡）和非接触式（公交卡）；非接触式IC卡利用电磁感应工作，不需要电池。$kp$, section = '' where id = 30189;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21814,21816,21817,21854,21919,21939,21983,22029,22032,22053,22110,22174,22197,22228,22234,22237,23482,24127,24201,24601,24602,24719,25866,25867,26697,26698,26699,26952,26953,26954,26955,26956,26957,26958,26960,26961,26962,26963,26965,26966,26967,26968,27055,27159,27160,27161,27162,27163,27164,27165,27166,27167,27168,27226,27278,27286,27577,28008,28010,28011,28013,28014,28015,28016,28069,28216,28271,28275,28502,28623,28624,28625,28626,28627,28665,28666,28667,28690,28691,28692,28693,28694,28696,28697,28698,28699,28700,28701,28703,28711,28712,28713,28714,28765,28773,28817,28833,28834,28835,28836,28883,28886,28895,28896,28897,28898,28943,29150,30122,30131,30132,30189) and not deleted) <> 112 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
