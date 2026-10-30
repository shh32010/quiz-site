-- 知识点 127 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_127
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_127 as
select * from t_knowledge_point where id in (23194,23210,23246,23260,23280,23288,23300,23303,23317,23346,23347,23348,23360,23375,23398,23406,23410,23459,23467,24084,24582,25143,25533,25999,26186,26187,26805,27023,27026,27525,27526,27527,27528,27529,27530,28348,28409,29579,29611,29637,29641,29655,29658,32039,32040);

update t_knowledge_point set title = $kp$RFID、ZigBee与IP地址等知识$kp$, content = $kp$RFID（射频识别）通过无线电信号对标签或射频卡进行读写，从而达到识别目标和数据交换的目的，被认为是21世纪最具发展潜力的信息技术之一。

ZigBee（紫蜂）是一种近距离、低复杂度、低功耗、低速率、低成本的双向无线通信技术，广泛应用于船舶客舱、楼宇自动化、工业自动化等，使用工业科学医疗（ISM）免执照频段：915MHz（美国）、868MHz（欧洲）、2.4GHz（全球）。在ZigBee协议架构中，由IEEE 802.15.4（低功耗、低成本、低速率的局域网）标准定义的是物理层和MAC层。

关系R、S有相同属性B，属于自然连接。

操作系统的主要功能是对计算机的所有资源进行控制和管理，为用户使用计算机提供方便。

用高级程序设计语言编写的程序具有可读性和可移植性，基本上不作修改就能用于各种型号的计算机和各种操作系统。源程序经过编译、连接成可执行文件后，就可以直接在本机运行。

MP3是一种音频压缩技术，全称为MPEG Audio Layer 3，简称MP3；WMA是微软制订的音频压缩文件格式，比MP3标准晚，文件比MP3更小、音质更好；WAV是微软公司开发的一种声音文件格式，采用未压缩编码方式。

每个IP地址使用32个位（4个字节）表示，通常写成“点分十进制”的形式。$kp$, section = '' where id = 23194;
update t_knowledge_point set title = $kp$常见文件格式的分类$kp$, content = $kp$AVI是视频文件格式。

GIF是图像文件格式。

MID是计算机合成音乐文件格式。

WMA是数字音频文件格式。$kp$, section = '' where id = 23210;
update t_knowledge_point set title = $kp$音乐合成与MIDI$kp$, content = $kp$MIDI（Musical Instrument Digital Interface，乐器数字接口）是计算机中描述乐谱的一种标准描述语言，规定了乐谱的数字表示方法（包括音符、定时、乐器等），以及演奏控制器、音源、计算机等相互连接时的通信规程。$kp$, section = '' where id = 23246;
update t_knowledge_point set title = $kp$声音的重建$kp$, content = $kp$计算机输出声音的过程通常分为两步：首先把声音从数字形式转换成模拟信号形式，这个过程称为声音的重建；然后将模拟声音信号经过处理和放大送到扬声器发出声音。

声音重建的步骤：解码、数模转换、插值处理。

声卡输出的波形信号需送到音箱发音。普通音箱接收的是重建的模拟声音信号；数字音箱可直接接收数字声音信号，由音箱自己完成声音重建，可避免信号在传输中发生畸变和受到干扰，声音质量更有保证。$kp$, section = '' where id = 23260;
update t_knowledge_point set title = $kp$图像数据压缩的可能性$kp$, content = $kp$由于数字图像中数据的相关性很强、冗余度很大，因此对数字图像进行大幅度的数据压缩是完全可能的。而且人眼的视觉有一定的局限性，即使压缩前后的图像有一定失真，只要限制在人眼允许的误差范围之内，也是允许的。$kp$, section = '' where id = 23280;
update t_knowledge_point set title = $kp$声音的播放$kp$, content = $kp$声音播放是计算机输出声音的过程。

声音重建（reconstruction）是把声音从数字形式转换成模拟信号形式，步骤为解码、数模转换、插值处理，然后将模拟声音信号经过处理和放大送到扬声器发出声音。

声音的重建由声卡完成，声卡输出的声音需送到音箱发音。$kp$, section = '' where id = 23288;
update t_knowledge_point set title = $kp$波形声音的获取与播放$kp$, content = $kp$声音由振动产生，通过空气传播，它由许多不同频率的谐波组成，谐波的频率范围称为声音的带宽（bandwidth），带宽是声音的一项重要参数。多媒体技术处理的声音信号主要是人耳可听到的20Hz～20kHz的音频信号（audio）。

话音（语音）指人说话的声音，频率范围约为300～3400Hz；全频带声音（音乐声、风雨声、汽车声等）带宽可达20Hz～20kHz。

声音信号的数字化是把模拟声音信号转换成数字编码形式以便于计算机处理的过程，包括取样、量化、编码三个步骤，即A/D转换。

模拟声音信号转为数字形式处理的优点：以数字形式存储的声音重放性能好，复制时没有失真；可编辑性强，易于进行效果处理；能进行数据压缩，传输时抗干扰能力强；容易与其他媒体相互结合（集成）；为自动提取元数据和实现基于内容的检索创造了条件。

波形声音的获取设备：麦克风将声波转换为电信号，声卡进行数字化。波形声音的获取即把模拟声音信号转换为数字形式（话筒或线路输入，单声道或双声道）。

声卡的工作原理：取样、量化→DSP→DMA接口→D/A→重建、滤波，另有MIDI合成器和MIDI接口。声卡以数字信号处理器（DSP）为核心，DSP在数字声音的编码、解码及声音编辑操作中起着重要作用；它利用PCI总线与主机进行数据交换，混音器（mixer）将不同的声音信号进行混音，并提供音量控制功能。PC机的声卡较多已与主板集成在一起，不再做成独立的插卡。

利用声卡可在线（on-line）获取声音；使用数码录音笔可离线（off-line）获取声音，然后再通过USB接口将已经数字化的声音数据送入计算机。数码录音笔的原理与上述过程基本相同，但由于带宽的原因，一般适合于录制语音。

此外还包括波形声音的重建与播放、MIDI声音的输入、MIDI声音的合成与播放等内容。$kp$, section = '' where id = 23300;
update t_knowledge_point set title = $kp$计算机合成声音：语音合成与MIDI音乐$kp$, content = $kp$语音合成（Speech synthesis）是根据语言学和自然语言理解的知识，使计算机模仿人的发声、自动生成语音的过程。目前主要是按照文本（书面语言）进行语音合成，这个过程称为文语转换（Text-To-Speech，TTS）。文语转换的过程为：文本分析→韵律处理→语音合成，需要词典与发音规则、韵律规则库和语音库。语音库中存储了大量预先录制的语音基元（单音、词组、短语或句子）的波形，合成时读取这些波形进行拼接和韵律修饰，然后输出连续语音流。

对计算机合成语音的要求：发音清晰可懂、语气语调自然、说话人可选择、语速可变化等。应用包括股票交易、航班动态查询、电话报税等业务，有声E-mail服务，CAI课件或游戏解说词的自动配音，以及文稿校对、语言学习、语音秘书、自动报警、残疾人服务等。

音乐是使用乐器演奏而成的，其基本单元是一些音符。音符的属性：音调（声波的基频）、音色（由声音的频谱决定，不同乐器有不同的音色）、音强（声音的强度）；旋律是乐曲中音符持续时间的变化。

音源也称为音乐合成器（music synthesizer），能模仿许多乐器生成各种不同音色的音符，PC机的声卡一般都带有音源。声卡上的音源有调频合成器和波表合成器。调频合成器是一种受控的电子振荡器（波形发生器），能模拟生成许多乐器演奏的音符，特点是音色单调、效果较差；波表合成器预先将每种乐器演奏的各个音符的波形数字化，组织成一张表（称为波表）存放在ROM中，播放时根据乐器类型、音符等参数访问ROM，取出相应的波形数据，修饰成所要求的音强和时长后播放，特点是音色优美、效果好。

MIDI（Musical Instrument Digital Interface）是计算机中描述乐谱的一种标准描述语言，规定了乐谱的数字表示方法（包括音符、定时、乐器等）和演奏控制器、音源、计算机等相互连接时的通信规程。乐谱中的音符及其定时、速度、音色（乐器）等采用MIDI消息（MIDI message）进行描述，每个MIDI消息描述一个音乐事件（如开始演奏某个音符、结束演奏某个音符、选择音色、改变演奏速度等）。一首乐曲所对应的全部MIDI消息组成一个MIDI文件，扩展名为.MID，它是计算机合成音乐的交换标准，也是商业音乐作品发行的标准。

MIDI音乐的制作与播放：可由MIDI键盘实时演奏，或通过音序器软件输入乐谱，生成MIDI文件；播放时媒体播放器读入MIDI文件，把一个个MIDI消息发送给声卡上的音乐合成器，由合成器解释并执行MIDI消息所规定的操作，合成出各种音色的音符，通过扬声器播放出乐曲。音序器（sequencer）软件还能对MIDI文件进行修改和编辑、生成并打印乐谱、管理与检索MIDI文件、播放MIDI乐曲等，典型的音序器软件有Cakewalk、Encore。MIDI文件在Windows系统中可以使用媒体播放器播放。

由PC机、声卡、MIDI演奏器和音序器软件等构成的个人电脑音乐系统，彻底改变了传统的音乐制作方式和概念：原来需要由多人才能完成的工作现在只需一个人即可；记录音乐的方式由乐谱变成了MIDI文件；音乐作品由修改困难变为可任意编辑修改；强大的编辑功能提高了音乐表现的精确性，降低了制作者对演奏技术的依赖性，使音乐制作变成大众化的个人活动。

MIDI音乐与高保真的波形声音相比，优点是数据量很少、易于编辑修改、可以与波形声音同时播放；缺点是音质较差，无法合成出所有各种不同的声音（例如语音）。$kp$, section = '' where id = 23303;
update t_knowledge_point set title = $kp$WAV与MIDI的区别$kp$, content = $kp$WAV声音可达到CD品质，支持多种采样频率和量化位数，获得广泛支持；但WAV是未压缩的，所以数据量较大。

MIDI文件只能记录数字乐器的弹奏行为或乐谱指令，而非声音的实际“波形”，故MIDI文件不能用于解说。$kp$, section = '' where id = 23317;
update t_knowledge_point set title = $kp$MIDI的不足$kp$, content = $kp$只能合成音乐，不能合成歌曲和语音；音质与硬件设备相关。$kp$, section = '' where id = 23346;
update t_knowledge_point set title = $kp$MIDI的优点$kp$, content = $kp$数据量极小（比CD立体声少3个数量级，比MP3少2个数量级）；易于制作和编辑修改；可以与波形声音同时播放。$kp$, section = '' where id = 23347;
update t_knowledge_point set title = $kp$MIDI音乐与波形声音的比较$kp$, content = $kp$MIDI音乐与高保真的波形声音相比：

缺点：音质方面较差；无法合成出所有各种不同的声音（例如语音）。

优点：数据量很少（比CD-DA少3个数量级，比MP3少2个数量级）；易于编辑修改；可以与波形声音同时播放。$kp$, section = '' where id = 23348;
update t_knowledge_point set title = $kp$MIDI的三个要素：乐器、乐谱和演奏员$kp$, content = $kp$计算机合成音乐需要三个要素：乐器、乐谱和“演奏员”。

播放MIDI音乐时，媒体播放器软件相当于“演奏员”，它先从磁盘读入.MID文件并解释其内容，然后以MIDI消息的形式向声卡上的音乐合成器发出指令；声卡上的音乐合成器相当于乐器，能模仿几十种不同的乐器发出声音，按MIDI消息合成出不同音色和音调的音符，通过扬声器播放出音乐。$kp$, section = '' where id = 23360;
update t_knowledge_point set title = $kp$计算机合成音频的类型$kp$, content = $kp$计算机合成音频就是计算机模仿人说话或演奏音乐，分为两类：

计算机合成话音（语音）：计算机模仿人把一段文字朗读出来，即把文字转换为说话声音，简称TTS。应用：有声查询、文稿校对、语言学习、语音秘书、自动报警、残疾人服务等。

计算机合成音乐（MIDI）：计算机模拟各种乐器发声并按照乐谱演奏音乐。应用：计算机作曲、配器等。$kp$, section = '' where id = 23375;
update t_knowledge_point set title = $kp$声音的特性和类型$kp$, content = $kp$声音（sound）由振动产生，通过空气等介质进行传播。声音是一种波，它由许多不同频率的谐波组成，谐波的频率范围称为声音的“带宽”。

人耳可听见的声音（20Hz～20kHz）在信息技术中称为音频信号，简称音频（audio）。两种音频：话音或语音（speech）专指人的说话声音，带宽仅为300～3400Hz；全频带声音（如音乐声、风雨声、汽车声等）带宽可达到20Hz～20kHz。$kp$, section = '' where id = 23398;
update t_knowledge_point set title = $kp$实数的浮点表示法$kp$, content = $kp$实数既有整数部分又有小数部分，整数和纯小数只是实数的特例。任何一个实数总可以表示成一个乘幂和一个纯小数之积，例如：56.725 = 10²×(0.56725)，－0.0034756 = 10⁻²×(－0.34756)。指数部分指出实数中小数点的位置，括号里是一个纯小数。

二进制数的情况完全类同，例如：1001.011 = 2¹⁰⁰×(0.1001011)，－0.0010101 = 2⁻¹⁰×(－0.10101)。

浮点表示法是计算机内部用“指数”（一个整数，称为阶码）和“尾数”（一个纯小数）表示实数的方法，即 实数 = 尾数 × 2^指数，实数N可表示为 N = ±S × 2^±P。$kp$, section = '' where id = 23406;
update t_knowledge_point set title = $kp$计算机中音频的小结$kp$, content = $kp$音频的特点：是一种连续媒体，传输与播放有实时性要求；数据量大，对存储和传输的要求比较高，必须进行压缩。

计算机中音频的类型：

数字音频：数字语音应用于电话、手机、多媒体配音等；全频带声音用于CD和DVD音乐、数字电视伴音等。

计算机合成音频：合成语音、合成音乐（MIDI）。$kp$, section = '' where id = 23410;
update t_knowledge_point set title = $kp$计算机合成音乐（MIDI）$kp$, content = $kp$计算机合成音乐需要三个要素：乐器、乐谱和“演奏员”。

播放MIDI音乐时，媒体播放器软件相当于“演奏员”，它先从磁盘上读入.MID文件，解释其内容，然后以MIDI消息的形式向声卡上的音乐合成器发出各种指令。声卡上的音乐合成器能像电子琴一样模仿几十种不同的乐器发出声音，它按照MIDI消息合成出不同音色和音调的音符，通过扬声器播放出音乐来。$kp$, section = '' where id = 23459;
update t_knowledge_point set title = $kp$MIDI的不足$kp$, content = $kp$只能合成音乐，不能合成歌曲和语音；音质与硬件设备相关。$kp$, section = '' where id = 23467;
update t_knowledge_point set title = $kp$计算机中存储单位的换算$kp$, content = $kp$位（bit，比特）是表示信息的最小单位，1bit简写为1b（小写英文字母b）。字节（Byte）是最常用的信息基本单位，1Byte简写为1B（大写英文字母B）。字长是计算机一次能处理的二进制位数，或指运算器和寄存器的宽度，如字长为32位的CPU所在计算机又称为32位机，通常也可称为双字。

基本换算：1B = 8b，1字 = 2字节。

1KB = 1024B = 2¹⁰B；1MB = 1024KB = 2²⁰B；1GB = 1024MB = 2³⁰B；1TB = 1024GB = 2⁴⁰B。

1kb = 1000b，1KB = 8Kb，1B/s = 8bps（b/s），1KB/s = 8Kbps（Kb/s），1MB/s = 8Mbps（Mb/s）。字节与位之间换算时，要注意K与k的大小写问题。$kp$, section = '' where id = 24084;
update t_knowledge_point set title = $kp$存储容量单位换算$kp$, content = $kp$1B = 8b；1KB = 1024B = 2¹⁰B；1MB = 1024KB = 2²⁰B；1GB = 1024MB = 2³⁰B；1TB = 1024GB = 2⁴⁰B。$kp$, section = '' where id = 24582;
update t_knowledge_point set title = $kp$力反馈输出$kp$, content = $kp$作用：在开/关手机、虚拟键盘输入、电话来电通知等场合，会产生力反馈使手机振动，提醒用户知晓。

实现：微型振动马达。$kp$, section = '' where id = 25143;
update t_knowledge_point set title = $kp$波形声音的获取与播放$kp$, content = $kp$声音由振动产生，通过空气介质进行传播；声音是一种波，它由许多不同频率的谐波组成，谐波的频率范围称为声音的“带宽”。

波形声音是最常用的Windows多媒体特性。波形声音设备可以通过麦克风（将模拟信号转换为电信号）捕捉声音，并将其转换为数值，然后存储到内存或磁盘上的波形文件中，波形文件的扩展名是.wav。$kp$, section = '' where id = 25533;
update t_knowledge_point set title = $kp$声音的播放与音箱类型$kp$, content = $kp$播放是将模拟音频信号经过处理和放大后送到音箱（扬声器）。

普通音箱接收的是重建的模拟声音信号；数字音箱直接接收数字声音信号，自己完成声音重建，失真更小。$kp$, section = '' where id = 25999;
update t_knowledge_point set title = $kp$计算机合成话音（语音）$kp$, content = $kp$计算机模仿人把一段文字朗读出来，即把文字转换为说话声音，简称为TTS。

应用：有声查询、文稿校对、语言学习、语音秘书、自动报警、残疾人服务等。$kp$, section = '' where id = 26186;
update t_knowledge_point set title = $kp$计算机合成音乐（MIDI）$kp$, content = $kp$计算机模拟各种乐器发声并按照乐谱演奏音乐。

应用：计算机作曲、配器等。$kp$, section = '' where id = 26187;
update t_knowledge_point set title = $kp$计算机合成声音的分类$kp$, content = $kp$计算机合成声音有两类：一类是计算机合成的语音，另一类是计算机合成的音乐。$kp$, section = '' where id = 26805;
update t_knowledge_point set title = $kp$Windows XP中的多媒体程序$kp$, content = $kp$Windows XP系统中附带了较为简单的多媒体应用软件，打开程序的一般操作方法是：单击【开始】按钮，选择“所有程序”|“附件”|“娱乐”级联菜单中的相应程序。$kp$, section = '' where id = 27023;
update t_knowledge_point set title = $kp$音量控制与录音机$kp$, content = $kp$如果计算机系统配置了多媒体装置，就可以使用“音量控制”程序调节计算机或其他多媒体应用程序所播放声音的音量、平衡和高低音等设置。

默认保存的声音文件扩展名是.wav；录音机可以将声音转换成MP3格式。$kp$, section = '' where id = 27026;
update t_knowledge_point set title = $kp$MIDI与MIDI音乐$kp$, content = $kp$MIDI是乐谱的二进制编码表示方法，使用MIDI描述的音乐称为MIDI音乐。$kp$, section = '' where id = 27525;
update t_knowledge_point set title = $kp$MIDI文件$kp$, content = $kp$MIDI文件保存演奏一首乐曲所对应的全部MIDI消息。$kp$, section = '' where id = 27526;
update t_knowledge_point set title = $kp$MIDI消息$kp$, content = $kp$MIDI消息是播放器发给声卡的音乐合成器的指令。$kp$, section = '' where id = 27527;
update t_knowledge_point set title = $kp$MIDI音乐的音质与数据量$kp$, content = $kp$MIDI音乐相对数字音频而言音质较差，MIDI消息的数据量很低。$kp$, section = '' where id = 27528;
update t_knowledge_point set title = $kp$MIDI音乐的数据量与编辑$kp$, content = $kp$MIDI音乐的数据量很小，易于编辑修改。$kp$, section = '' where id = 27529;
update t_knowledge_point set title = $kp$文语转换（TTS）$kp$, content = $kp$文语转换（TTS）让计算机模仿人将文字朗读出来。$kp$, section = '' where id = 27530;
update t_knowledge_point set title = $kp$计算机合成语音：文语转换（TTS）$kp$, content = $kp$① TTS将文本转换成语音，朗读出来。

② 应用：股票交易、文稿校对、有声E-mail。

③ Office中的【读出】功能可以进行文语转换。

④ 智能手机支持TTS。$kp$, section = '' where id = 28348;
update t_knowledge_point set title = $kp$MIDI不能合成所有声音$kp$, content = $kp$MIDI用于计算机合成音乐，只能合成音乐，不能合成出语音等所有声音。$kp$, section = '' where id = 28409;
update t_knowledge_point set title = $kp$重建声音的步骤$kp$, content = $kp$重建声音：解码（解压缩恢复数字声音）→数模转换→插值处理→将模拟声音信号经处理和放大送到扬声器发出声音。

重建由声卡完成，声卡输出的声音需要送到音箱去发音。$kp$, section = '' where id = 29579;
update t_knowledge_point set title = $kp$计算机合成音乐（MIDI 音乐）$kp$, content = $kp$① MIDI 是计算机中表示乐谱的音乐描述语言。
② 用 MIDI 描述的音乐就是 MIDI 音乐，文件扩展名为 .mid 或 .midi。
③ MIDI 消息：由播放设备发给声卡，描述一个音乐事件，是数字式电子乐器的乐谱指令。
④ MIDI 文件：保存演奏一首乐曲所对应的全部 MIDI 消息。
⑤ MIDI 只能合成音乐（乐曲），不能合成歌曲。WAV 适合解说，MIDI 适合做背景音乐。
⑥ MIDI 音乐由声卡中的音乐合成器演奏产生。同一个 MIDI 文件，在不同档次的声卡上，音乐合成器合成出的音质不同。$kp$, section = '' where id = 29611;
update t_knowledge_point set title = $kp$声音的重建（播放）过程$kp$, content = $kp$声音重建（播放）的流程：解码 → 数模转换（D/A，数字信号转换为模拟信号）→ 插值处理。
音箱可分为普通音箱和数字音箱两类。$kp$, section = '' where id = 29637;
update t_knowledge_point set title = $kp$计算机合成声音的两类：合成语音与合成音乐$kp$, content = $kp$计算机合成的声音有两类：计算机合成语音和计算机合成音乐。

合成音乐（MIDI）的要素：乐器、乐谱和演奏员。MIDI 不能合成歌声。

优点：易于编辑修改；可以与波形声音同时播放；以指令形式存储，占用空间小；能达到乐器无法演奏的效果。$kp$, section = '' where id = 29641;
update t_knowledge_point set title = $kp$声卡的功能$kp$, content = $kp$声卡在计算机中用于完成声音的输入与输出：输入时将声音信号数字化，输出时重建声音信号。$kp$, section = '' where id = 29655;
update t_knowledge_point set title = $kp$声音的播放（输出）过程$kp$, content = $kp$输出声音的过程称为声音的播放，即把数字声音转换为模拟声音，并将模拟声音经过处理和放大后送到扬声器发音。$kp$, section = '' where id = 29658;
update t_knowledge_point set title = $kp$计算机处理的声音类型$kp$, content = $kp$① 话音或语音：专指人的说话声音，带宽300～3400Hz。

② 全频带声音：带宽可达到20Hz～20kHz（人耳可听到的声音）。$kp$, section = '' where id = 32039;
update t_knowledge_point set title = $kp$计算机合成音乐与合成语音$kp$, content = $kp$计算机合成音乐（MIDI音乐）：

① MIDI是计算机中表示乐谱的音乐描述语言，使用MIDI描述的音乐是MIDI音乐，文件扩展名是.MID或.MIDI。

② MIDI消息由播放器发给声卡，描述一个音乐事件，是数字式电子乐器的乐谱指令。

③ MIDI文件保存演奏一首乐曲所对应的全部MIDI消息。

④ MIDI音乐不能合成出歌曲，只能合成乐曲（音乐）。WAV适合解说，MIDI适合做背景音乐。

⑤ 同一个MIDI文件，不同档次的声卡合成出的音质是不同的。

计算机合成语音：将文本转换成语音朗读出来，称为文语转换（TTS）。$kp$, section = '' where id = 32040;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (23194,23210,23246,23260,23280,23288,23300,23303,23317,23346,23347,23348,23360,23375,23398,23406,23410,23459,23467,24084,24582,25143,25533,25999,26186,26187,26805,27023,27026,27525,27526,27527,27528,27529,27530,28348,28409,29579,29611,29637,29641,29655,29658,32039,32040) and not deleted) <> 45 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
