-- 知识点 56 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_56
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_56 as
select * from t_knowledge_point where id in (21925,21942,21979,21980,21994,22020,22037,22056,22091,22117,22130,22145,22157,22178,22188,22191,22192,22193,22195,22214,23213,23525,25219,25341,26710,27187,27188,27189,27191,27192,27193,27194,27197,27227,27228,27266,28067,28068,28070,28071,28073,28074,28075,28076,28081,28239,28253,28272,28273,28285,28286,28287,28288,28594,28648,28685,28686,28744,28746,28747,28748,28789,28790,28791,28828,28829,28831,28862,28863,28864,28865,28879,28912,30142);

update t_knowledge_point set title = $kp$针式、激光与喷墨打印机的分类与特点$kp$, content = $kp$针式打印机：击打式打印机，工作原理主要体现在打印头上，能实现多层套打（打印票据），耗材为色带。
激光打印机：非击打式打印机，是激光技术与复印技术相结合的产物，属高质量、高速度、低噪声、价格适中的输出设备；利用激光成像、静电吸附碳粉的原理工作，耗材为碳粉。
喷墨打印机：非击打式打印机，使墨水喷射到纸上形成图案或字符；优点是能输出彩色图像、经济、低噪音、打印效果好、使用低电压、不产生臭氧，有利于保护办公室环境，在彩色图像输出设备中占绝对优势，耗材为墨水。$kp$, section = '' where id = 21925;
update t_knowledge_point set title = $kp$显示器的作用、组成与性能指标$kp$, content = $kp$作用：将数字信号转化为光信号，最终把文字、图形、图像显示出来。
组成：监视器（Monitor，即显示器）和显示控制器（显卡）。
常见类型：阴极射线管显示器（CRT）、液晶显示器（LCD）。
CRT显示器工作原理：接收显示控制器传送过来的颜色信号，通过电子枪调整红、绿、蓝三基色的亮度，在荧光屏上轰击出一个个彩色亮点，组成一幅幅图像。
LCD显示器工作原理：利用液晶在电场下可以快速扭曲的特性，通过电场的有无控制液晶的透光与不透光，使部分背光透过液晶，构成图像。
主要性能指标：
显示屏尺寸：指对角线长度，如15吋、17吋、21吋；屏幕横向与纵向比例一般为4∶3。
分辨率：整屏可显示的像素个数，分辨率越高图像越清晰，一般用“水平像素个数×垂直像素个数”表示，如1024×1024、1024×768、800×600、640×480。
点距：像素点之间的距离。
刷新速率：显示图像每秒钟更新的次数，速率越高图像稳定性越好。
像素的颜色数目：一个像素可显示的颜色数量，由表示该像素颜色编码的二进制位数决定，如4位二进制数可表示16种颜色。
辐射和环保：“能源之星”节能标准，MPRII和TCO认证（电磁辐射标准）。
显示控制器（显卡）组成：
显示控制电路：控制显示器工作。
显示存储器（VRAM）：存储屏幕上所有像素的颜色信息。
接口电路：负责显示控制器与主机之间的数据传输。
显示卡一般插在主板上的PCI或AGP总线扩展槽上，卡上的视频输出端口（Video port）用于连接显示器；若主板上集成了显示卡电路，便不再需要独立的显示卡。$kp$, section = '' where id = 21942;
update t_knowledge_point set title = $kp$3D打印机的原理与主要技术$kp$, content = $kp$“增材制造”过程：物件在计算机中设计成型后，被分割成一系列数字切片传送到3D打印机，打印机再将这些薄层通过特殊胶水逐层堆叠起来，形成立体物品。
主要技术：
熔融沉积技术：将热塑性塑料等丝状材料加热熔化后挤出，逐层堆积构造物体。
选择性激光烧结技术：先在铺设好的打印层上扫描出零件截面，再用高强度激光将粉末材料烧结在一起，得到成型的坚硬零件。
立体平版印刷技术：与选择性激光烧结技术相似，但使用的材料是液态树脂。$kp$, section = '' where id = 21979;
update t_knowledge_point set title = $kp$3D立体显示器$kp$, content = $kp$传统3D电影在荧幕上有两组图像，来源于拍摄时互成角度的两台摄影机；观众戴上偏光镜，让一只眼只接收一组图像，形成视差（parallax），从而建立3D立体感。
计算机上的3D显示方案使用120Hz液晶显示器、NVIDIA GeForce 8600GT及以上级别显卡，并配备专用3D眼镜及信号接收器。$kp$, section = '' where id = 21980;
update t_knowledge_point set title = $kp$打印机的作用、分类与性能指标$kp$, content = $kp$作用：一种主要输出设备，能把程序、数据、字符、图形打印在纸上。
分类：针式打印机、激光打印机、喷墨打印机。
针式打印机：击打式打印机，工作原理主要体现在打印头上；耗材成本低，能多层套打，但打印质量低、工作噪声大。
激光打印机：激光技术与复印技术相结合的产物，高质量、高速度、低噪声、价格适中，分辨率较高、打印质量好。
喷墨打印机：能输出彩色图像，经济、打印效果好、低噪音、使用低电压、环保，但墨水成本高、消耗快。
性能指标：
打印精度：用每英寸可打印的点数（dpi）表示，如180dpi、300dpi、800dpi。
打印速度：针式打印机用每秒打印的字符数（CPS）表示，约100～200CPS；激光和喷墨打印机用每分钟打印页数（PPM）表示，约4～20PPM。$kp$, section = '' where id = 21994;
update t_knowledge_point set title = $kp$CRT显示器工作原理$kp$, content = $kp$接收显示控制器传送过来的颜色信号，通过电子枪调整红、绿、蓝三基色的亮度，在荧光屏上轰击出一个个彩色亮点，组成一幅幅图像。$kp$, section = '' where id = 22020;
update t_knowledge_point set title = $kp$输出设备的含义与功能$kp$, content = $kp$输出（output）的双重含义：1. 把信息送出计算机的过程；2. 从计算机输出的内容。
输出设备（output devices）的功能：从计算机输出信息。
常见输出设备：
显示器——输出文字、符号和图形；
打印机——打印文字、符号和图形；
扬声器——输出声音。
多数输出设备的共性：把计算机中的二进位信息转换成人可感知的形式（文字、符号、图形、声音等）。$kp$, section = '' where id = 22037;
update t_knowledge_point set title = $kp$LCD显示器的工作原理与特点$kp$, content = $kp$工作原理：利用液晶在电场下可以快速扭曲的特性，通过电场的有无控制液晶的透光和不透光，使部分背光透过液晶，构成图像。
与CRT显示器相比，LCD具有工作电压低、没有辐射危害、功耗小、不闪烁、适于大规模集成电路驱动、体积轻薄、易于实现大画面显示等特点，现已广泛应用于计算机、数码相机、数码摄像机、电视机等设备。$kp$, section = '' where id = 22056;
update t_knowledge_point set title = $kp$显示控制器（显卡）的组成$kp$, content = $kp$显示控制电路：负责对显示卡的操作进行控制，包括对显示器进行控制。
绘图处理器（GPU）：有一组适用于图像和图形处理的专用指令，可加快图形绘制和操作的速度。
显示存储器（VRAM）：存储屏幕上所有像素的颜色信息。
接口电路：负责显卡与CPU和内存之间的数据传输。
注意：若主板上集成了显示卡电路，便不再需要独立的显示卡。$kp$, section = '' where id = 22091;
update t_knowledge_point set title = $kp$PC与移动设备使用的GPU$kp$, content = $kp$集成显卡：GPU集成在CPU芯片中，型号如Intel HD Graphics 4xxx、5xxx、6xxx。
独立显卡：nVIDIA公司的GeForce系列、AMD（ATI）公司的Radeon系列。
智能手机、平板电脑使用的GPU集成在SoC芯片中：英国Imagination公司的PowerVR系列（iPhone）、英国ARM公司的Mali系列（华为Mate8、三星8890）、美国高通公司的Adreno系列。$kp$, section = '' where id = 22117;
update t_knowledge_point set title = $kp$液晶的特性$kp$, content = $kp$液晶是介于固态和液态之间的一种物质，是具有规则分子排列的有机化合物。加热时呈现透明的液体状态，冷却时出现结晶颗粒的混浊固体状态，因此既具有液体的流动性，又具有固态晶体排列的有向性。
它是一种弹性连续体，在电场作用下能快速地展曲、扭曲或者弯曲。$kp$, section = '' where id = 22130;
update t_knowledge_point set title = $kp$显示控制器（显卡）的类型与组成$kp$, content = $kp$显卡的类型：独立显卡以扩展卡形式插在机箱中，自带GPU与显存；集成显卡集成在主板上，功能较弱，显示使用的存储器需占用内存的一部分。
显示卡的组成与连接：显示器通过VGA、DVI、HDMI等视频输出接口与显示卡相连；卡上包含显示存储器、绘图图形处理器（GPU）和显示控制电路，通过PCI-E x16接口与主机（CPU、芯片组）连接。
显示存储器存放一个像素的颜色信息等，容量为64MB、128MB甚至更高；显示控制电路负责对显示卡的操作进行控制。$kp$, section = '' where id = 22145;
update t_knowledge_point set title = $kp$喷墨打印机$kp$, content = $kp$类型：非击打式打印机，大多为彩色打印。
优点：可以打印近似全彩色图像，经济、效果好、低噪音、使用低电压、环保。
缺点：墨水成本高，消耗快。
应用：家庭及办公。
彩色喷墨打印机大多带有一个黑色墨盒和一个彩色墨盒（三色、四色、五色、六色等）。$kp$, section = '' where id = 22157;
update t_knowledge_point set title = $kp$打印机的作用与类型$kp$, content = $kp$作用：将程序、数据、字符、图形打印输出在纸上。
类型：针式打印机、激光打印机、喷墨打印机。$kp$, section = '' where id = 22178;
update t_knowledge_point set title = $kp$OLED可弯曲显示器$kp$, content = $kp$有机发光二极管（OLED）可弯曲显示器由塑料衬底实现，易曲性更好、重量更轻、耐用性更强，且制作成本更低。$kp$, section = '' where id = 22188;
update t_knowledge_point set title = $kp$激光打印机$kp$, content = $kp$类型：非击打式打印机。
原理：激光技术与复印技术相结合。
优点：分辨率较高、打印质量好，速度高、噪声低，价格适中。
缺点：彩色输出价格还比较高。
接口：过去是并行口，目前流行使用USB接口。
应用：办公室和家庭。
组成：控制电路、激光器、碳粉夹、进纸卷轴、感光鼓、出纸卷轴。$kp$, section = '' where id = 22191;
update t_knowledge_point set title = $kp$激光打印机工作原理$kp$, content = $kp$激光器发出的激光束经调制驱动电路按打印内容（如1001101……）调制，再由不断旋转的反射镜反射到感光鼓（硒鼓）上。
硒鼓表面被激光照射后产生电荷并吸附碳粉，从而生成输出图像的潜像，再将墨粉印在纸上。
纸张经加热加压（红外线热辐射定影）后，墨粉固定在纸面上，完成打印输出。$kp$, section = '' where id = 22192;
update t_knowledge_point set title = $kp$热敏打印机$kp$, content = $kp$结构：与针式打印机相仿，打印头上以行、列或矩阵的形式安装有半导体加热元件；使用的热敏打印纸覆盖了一层涂有热敏材料的透明膜。
原理：打印时打印头有选择地在热敏纸的某些位置加热，热敏材料经高温加热处瞬间变成黑色，从而在纸上产生字符或图形。
优点：打印速度快、噪音低、打印清晰、使用方便。
应用：POS机、ATM柜员机、医疗仪器。$kp$, section = '' where id = 22193;
update t_knowledge_point set title = $kp$电子书阅读器$kp$, content = $kp$电子书阅读器是一种专门用于阅读各种电子文档（如.txt、.doc、.html、.pdf等）的专用硬件设备。
采用电子墨水显示屏，被动发光，耗电极少，持续工作时间很长（1个月以上）；阅读效果接近纸质图书，轻薄便于携带。平板电脑的出现使其前景受限。$kp$, section = '' where id = 22195;
update t_knowledge_point set title = $kp$计算机显示器的作用与组成$kp$, content = $kp$作用：是计算机必不可少的图文输出设备，能将数字信号转化为光信号，使文字和图像在屏幕上显示出来。
组成与分类：计算机显示器（Display device）由显示器（Monitor）和显示控制器（显卡、图形卡）组成；显示器分为阴极射线管显示器（CRT）和液晶显示器（LCD），显示控制器分为集成显卡和独立显卡。$kp$, section = '' where id = 22214;
update t_knowledge_point set title = $kp$输出的基本概念$kp$, content = $kp$输出（output）：把信息送出计算机；作为名词使用时，指计算机所产生的结果。
计算机的输出可以是文本、语音、音乐、图像、动画等多种形式。
输出设备：负责完成输出任务的设备，即把计算机中用“0”和“1”表示的信息转换成人可以直接识别和感知的形式。$kp$, section = '' where id = 23213;
update t_knowledge_point set title = $kp$输出与输出设备的基本概念$kp$, content = $kp$输出（output）：把信息送出计算机的过程；也指计算机所产生的结果（名词）。
计算机的输出可以是文本、语音、音乐、图像、动画等多种形式。
输出设备：完成信息输出的设备，即把计算机存储器中用“0”和“1”表示并存储的信息转换成人可直接识别的信息形式的设备。$kp$, section = '' where id = 23525;
update t_knowledge_point set title = $kp$打印机分类及声音、力反馈输出$kp$, content = $kp$打印机是常用的输出设备。
针式打印机（击打式）：一行一行打印；打印头由若干钢针组成，有9针、16针、24针，两个方向都能打印；可多层套打，耗材成本低，主要耗材是色带；打印质量不高，工作噪声大；适合银行、税务、证券、邮电、商业等领域。
热敏打印机（非击打式）：打印头以行、列或矩阵形式安装半导体加热元件；热敏打印纸覆盖一层热敏材料的透明膜；打印速度快、噪音低、打印清晰、使用方便；最早用于传真机，适合POS机、ATM柜员机、医疗仪器。
激光打印机（非击打式）：基于激光技术和复印技术；主要耗材为硒鼓（感光鼓）和碳粉；分辨率高、质量好、速度快、噪声低、价格适中，彩色输出价格较高；主机接口过去是并行口，现在是USB接口；分黑白和彩色两种。
喷墨打印机（非击打式）：主要耗材是墨水，关键技术是喷头；适合专业彩色打印（如数码相机照片）；可打近似全彩图像，经济实惠、效果好、噪声低、电压低、不产生臭氧、环保，但墨水成本高、消耗快；已有6色、9色墨水，颜色范围超出传统CMYK的局限；技术专利有压电喷墨技术（Epson）和热喷技术（Canon、HP）。
3D打印机：熔融沉积技术用粉末状金属或塑料等可粘合材料；选择性激光烧结技术用粉末材料；立体平版印刷技术用液态树脂材料。
打印机接口：SCSI（SAS）、COM、USB。
性能指标：打印精度即分辨率dpi（每英寸可打印的点数）；打印速度用每秒可打印的字符数或行数表示，喷墨与激光打印机均用每分钟打印页数衡量；还有打印幅面大小、色彩表现力（可打印的不同颜色总数）、主机接口类型，以及打印成本、噪音、功耗、节能指标、可打印的拷贝数目等。
声音的输出：扬声器、耳机、音箱。
力反馈输出：微型振动马达。$kp$, section = '' where id = 25219;
update t_knowledge_point set title = $kp$显示器与打印机要点$kp$, content = $kp$显示器
种类：CRT阴极射线管显示器；LCD液晶显示器（利用液晶在电场下快速扭曲的特性）。
参数：尺寸、分辨率、刷新速度、响应时间。
显示控制器（显卡）：显示控制电路、显示存储器、接口电路、GPU图像处理器；接口包括VGA模拟接口、DVI数字接口、HDMI全高清多媒体接口；显卡分为独立显卡和集成显卡。
打印机
类型：针式打印机（耗材为色带，击打式、可多层套打，用于票据打印）；激光打印机（耗材为碳粉，彩色打印费用高）；喷墨打印机（耗材为墨盒，彩色效果好）。
性能指标：打印精度dpi、打印速度、彩色表现能力。$kp$, section = '' where id = 25341;
update t_knowledge_point set title = $kp$常用输出设备的工作原理与分类$kp$, content = $kp$单色液晶显示器的原理：LCD技术是把液晶灌入两个列有细槽的平面之间。
液晶的物理特性：通电时导通，排列变得有秩序，使光线容易通过；不通电时排列混乱，阻止光线通过。
投影仪的基本原理：将光线照射到图像的显示元件上产生影像，再通过镜头投射出去。
显示器分类：CRT显示器体积较大、重量较沉、耗电量较高，但对普通消费者适用性强，显示速度和效果较好；LCD显示器耗电量小、辐射低、屏幕不闪烁、重量轻、体积小，但画面质量不如CRT显示器，显示色彩会随观察角度不同而变化。
投影仪主要分类：传统灯泡机；LED投影仪（画面色彩好、使用寿命长、体积小巧、携带方便）；激光投影仪（投射比小，在超短距离内即可投射超大画面；激光是冷光源，机器温度大幅降低，对显示芯片的灼烧程度也大幅降低，并能长时间保持优异色彩；可瞬时开关机，无需预热散热，开机即可达到100%亮度）。$kp$, section = '' where id = 26710;
update t_knowledge_point set title = $kp$LCD显示器的特点$kp$, content = $kp$工作电压低，辐射危害小，功耗低，不闪烁，适用于大规模集成电路驱动，体量轻薄，易于实现大画面显示等。$kp$, section = '' where id = 27187;
update t_knowledge_point set title = $kp$显卡的核心是GPU$kp$, content = $kp$显卡的核心是GPU（图形处理器）。$kp$, section = '' where id = 27188;
update t_knowledge_point set title = $kp$显卡控制电路的作用$kp$, content = $kp$显卡的控制电路负责对显卡的操作进行控制。$kp$, section = '' where id = 27189;
update t_knowledge_point set title = $kp$独立显卡与集成显卡$kp$, content = $kp$显卡分为独立显卡和集成显卡。
独立显卡自带GPU和显存。
集成显卡的GPU集成在CPU中，共享系统主存，性能较弱。$kp$, section = '' where id = 27191;
update t_knowledge_point set title = $kp$针式打印机$kp$, content = $kp$击打式打印机。
钢针垂直排列，每次击打打印一个字符的一列。
能多层套打，适用于票据打印，也可以打印图案。
耗材为色带。
热敏打印机的结构与之相仿，但属于非击打式打印机。$kp$, section = '' where id = 27192;
update t_knowledge_point set title = $kp$激光打印机$kp$, content = $kp$非击打式打印机。
是激光技术与复印技术相结合的产物。
打印速度快，可以打印黑白和彩色效果。
耗材为碳粉、硒鼓。$kp$, section = '' where id = 27193;
update t_knowledge_point set title = $kp$喷墨打印机与打印机性能指标$kp$, content = $kp$喷墨打印机：非击打式打印机；彩色打印效果好；关键设备是喷头；耗材为墨盒或墨水。
打印机的性能指标：打印精度、色彩数目、打印成本、打印速度。
打印机的打印速度：针式打印机用每秒打印字符数衡量，激光和喷墨打印机用每分钟打印页数衡量。$kp$, section = '' where id = 27194;
update t_knowledge_point set title = $kp$票据打印使用的打印机$kp$, content = $kp$目前打印票据使用针式打印机，可实现多层套打。$kp$, section = '' where id = 27197;
update t_knowledge_point set title = $kp$声卡的核心与集成声卡$kp$, content = $kp$声卡的核心是数字信号处理器（DSP）。现在多数是集成在主板上的集成声卡。$kp$, section = '' where id = 27227;
update t_knowledge_point set title = $kp$集成声卡与独立声卡$kp$, content = $kp$声卡的核心是数字信号处理器（DSP）。声卡分为集成声卡和独立声卡，现在多数是集成在主板上的集成声卡。$kp$, section = '' where id = 27228;
update t_knowledge_point set title = $kp$手动双面打印$kp$, content = $kp$手动双面打印：先打印1、3、5、……等奇数页，取出后再放入打印机，继续打印2、4、6、……等偶数页。$kp$, section = '' where id = 27266;
update t_knowledge_point set title = $kp$显示器的分类$kp$, content = $kp$显示器分为阴极射线管显示器（CRT）和液晶显示器（LCD）。$kp$, section = '' where id = 28067;
update t_knowledge_point set title = $kp$液晶显示器$kp$, content = $kp$液晶显示器（LCD显示器）利用液晶在电场下透光特性的变化来显示图像，具有工作电压低、无辐射危害、功耗小、不闪烁、体积轻薄等特点。$kp$, section = '' where id = 28068;
update t_knowledge_point set title = $kp$LCD显示器的类型$kp$, content = $kp$LCD显示器的类型：透射型（计算机显示器）、反射型、半穿透反射式。$kp$, section = '' where id = 28070;
update t_knowledge_point set title = $kp$显示卡（显示控制器）$kp$, content = $kp$显示卡又称显示控制器或图形卡，由显示控制电路、显示存储器和接口电路组成，核心是GPU。$kp$, section = '' where id = 28071;
update t_knowledge_point set title = $kp$显卡的分类与特点$kp$, content = $kp$显卡分为独立显卡和集成显卡。独立显卡自带GPU和显存；集成显卡的GPU集成在CPU中，共享系统主存，性能较弱。$kp$, section = '' where id = 28073;
update t_knowledge_point set title = $kp$针式打印机$kp$, content = $kp$针式打印机属于击打式打印机。打印头钢针垂直排列，每次击打打印一个字符的一列；能多层套打，适用于票据打印，也可打印图案；耗材为色带。热敏打印机不属于针式打印机，而属于非击打式打印机。$kp$, section = '' where id = 28074;
update t_knowledge_point set title = $kp$激光打印机$kp$, content = $kp$激光打印机属于非击打式打印机，是激光技术与复印技术相结合的产物。打印速度快，可输出黑白和彩色效果；耗材为碳粉和硒鼓。$kp$, section = '' where id = 28075;
update t_knowledge_point set title = $kp$喷墨打印机$kp$, content = $kp$喷墨打印机属于非击打式打印机，彩色打印效果好；关键部件是喷头；耗材为墨盒或墨水。$kp$, section = '' where id = 28076;
update t_knowledge_point set title = $kp$显示存储器的作用$kp$, content = $kp$显示存储器用于存储显示屏上像素的颜色信息。$kp$, section = '' where id = 28081;
update t_knowledge_point set title = $kp$喷墨打印机的耗材$kp$, content = $kp$喷墨打印机的耗材是墨水和墨盒。$kp$, section = '' where id = 28239;
update t_knowledge_point set title = $kp$显示器的作用$kp$, content = $kp$显示器将数字信号转换为光信号，使文字和图像在屏幕上显示出来，属于典型的输出设备。$kp$, section = '' where id = 28253;
update t_knowledge_point set title = $kp$打印机耗材与彩色打印$kp$, content = $kp$激光打印机的耗材是碳粉和硒鼓。喷墨打印机和激光打印机既有黑白机型也有彩色机型。激光打印机属于非击打式输出设备。$kp$, section = '' where id = 28272;
update t_knowledge_point set title = $kp$打印机性能指标与部件$kp$, content = $kp$针式打印机的优势是适合打印票据；喷墨打印机的核心部件是喷头。打印机的性能指标包括打印精度、色彩数目、打印成本和打印速度。针式打印机速度较慢，通常用每秒打印字符数或每分钟行数衡量，PPM（每分钟页数）多用于激光打印机和喷墨打印机。$kp$, section = '' where id = 28273;
update t_knowledge_point set title = $kp$打印机的三大类型$kp$, content = $kp$打印机主要分为针式打印机、激光打印机和喷墨打印机。$kp$, section = '' where id = 28285;
update t_knowledge_point set title = $kp$针式打印机的特点$kp$, content = $kp$针式打印机采用行式打印和击打式打印，能多层套打，适用于票据打印，耗材为色带，也可以打印图案。$kp$, section = '' where id = 28286;
update t_knowledge_point set title = $kp$激光打印机的特点$kp$, content = $kp$激光打印机采用页式打印，是激光技术与复印技术相结合的产物，耗材为碳粉（硒鼓），有黑白和彩色机型。$kp$, section = '' where id = 28287;
update t_knowledge_point set title = $kp$喷墨打印机的特点$kp$, content = $kp$喷墨打印机采用页式打印，支持彩色打印，耗材为墨盒或墨水；关键部件是喷头，有黑白和彩色机型。$kp$, section = '' where id = 28288;
update t_knowledge_point set title = $kp$液晶本身不发光$kp$, content = $kp$液晶本身不发光，液晶显示器依靠背光光源（荧光灯或LED）提供照明。$kp$, section = '' where id = 28594;
update t_knowledge_point set title = $kp$针式、激光、喷墨打印机比较$kp$, content = $kp$针式打印机：击打式；耗材为色带；打印质量差；工作噪声最大；不产生臭氧；打印速度慢；平均成本中等；主要用于超市、银行等商业场合打印存折、票据和字符图案；打印头安装若干钢针，每次击打一列；突出特点是多层套打，采用平推式进纸技术；接口为并口、USB、SCSI。

激光打印机：非击打式；耗材为碳粉（硒鼓）；打印质量最好；工作噪声小；使用高电压会产生臭氧；打印速度最快；平均成本最低，但初始购机成本大；主要用于政府或单位；原理为激光成像、静电吸附；是激光技术与复印技术相结合的产物。

喷墨打印机：非击打式；耗材为墨水；打印质量好；工作噪声低；不产生臭氧；打印速度中等；平均成本高，墨水成本高、消耗快，但能最经济地输出彩色图像；主要用于家庭；原理为墨水喷射到纸上形成图案或字符；关键技术是喷头，易堵塞。$kp$, section = '' where id = 28648;
update t_knowledge_point set title = $kp$计算机显示器的组成$kp$, content = $kp$计算机显示器由显示屏和显示控制器组成。显示屏分为CRT（阴极射线管）和LCD（液晶显示器）；显示控制器即显卡（图形控制卡），分为集成显卡和独立显卡。$kp$, section = '' where id = 28685;
update t_knowledge_point set title = $kp$显示器、显卡、打印机及硬盘知识要点$kp$, content = $kp$LCD的种类：反射型、透射型（背光光源为荧光灯或LED）、半穿透反射型。

显示器性能指标：尺寸为屏幕对角线长度，单位为英寸；宽高比为4:3或16:10；显示分辨率在显卡控制下可设置，设置的分辨率越大，图标越小；刷新速率为画面每秒更新的次数；不存在绝对无辐射的显示屏。

显卡：集成显卡共享系统内存，GPU和显示控制器集成在CPU（或芯片组）中；独立显卡自带GPU和显存。显卡由显示存储器、显示控制器和绘图处理器（GPU）组成：显示存储器存储屏幕上的像素和颜色，显示控制器控制图像刷新，GPU处理图像细节。输出接口有VGA（模拟视频，15针）、DVI（数字视频，24针）和HDMI（全高清多媒体，19针）。

打印机：针式打印机是唯一的击打式打印机，支持多层套打，耗材为色带，每次击打一列、按行打印；激光打印机耗材为碳粉（硒鼓），打印黑白便宜、彩色贵，原理是激光技术与复印技术相结合；喷墨打印机耗材为墨水（墨盒），打印黑白贵、彩色便宜。打印机性能指标包括分辨率（dpi，常见约400～1000dpi）、色彩位数、打印速度（PPM，页/分钟）和打印幅面（最大可打印纸张大小）。

硬盘结构：磁道是盘片表面的一组同心圆，从0开始由外向内编号；每个磁道分为若干扇区，每个扇区512B；划分磁道和扇区的过程称为格式化（低级格式化）；盘片为铝合金材质；主轴带动盘片高速旋转，转速有4200rpm、5400rpm、7200rpm、10000rpm；磁头负责读写数据，一张盘片一般有两个磁头，磁头从0开始编号；柱面数等于磁道数；移动臂带动磁头沿径向移动。

平均存取时间：寻道时间约5ms；平均等待时间为盘片转一圈时间的1/2，如7200转/分的硬盘约为4ms；数据传输时间约0.01ms；平均存取时间=寻道时间+平均等待时间+数据传输时间。

硬盘性能指标：容量一般为TB或GB；平均存取时间；缓存容量（芯片为DRAM，越大越好）；数据传输速率分为外部速率（取决于接口）和内部速率（即平均存取），外部速率大于内部速率；接口早期为ATA（并行接口），现在为SATA（串行接口，600MB/s）。

辅助存储器除硬盘外还包括移动硬盘。$kp$, section = '' where id = 28686;
update t_knowledge_point set title = $kp$显卡的组成与接口$kp$, content = $kp$显卡（即显示控制器、显示适配器）由显示控制电路、绘图处理器（GPU）、接口电路和显示存储器（VRAM，用于存储显示屏上正在显示的所有像素的颜色信息）组成。显卡与主机的接口有AGP和PCI-E；输出接口有VGA、DVI和S端子等。$kp$, section = '' where id = 28744;
update t_knowledge_point set title = $kp$针式打印机的特点$kp$, content = $kp$针式打印机为击打式打印机，成本低、速度慢，最大特点是多层套打，适合银行、证券等单位打印票据、存折等；主要耗材是色带。$kp$, section = '' where id = 28746;
update t_knowledge_point set title = $kp$喷墨打印机的特点$kp$, content = $kp$喷墨打印机为非击打式打印机，成本高、效果好，适合专业彩色打印；主要耗材是墨水。其技术专利包括压电喷墨技术（Epson公司）和热喷墨技术（Canon和HP公司），关键技术体现在喷头上。$kp$, section = '' where id = 28747;
update t_knowledge_point set title = $kp$激光打印机的特点$kp$, content = $kp$激光打印机为非击打式打印机，成本适中、速度快、质量高、噪音低，适合日常办公使用；主要耗材是碳粉和硒鼓；它是激光技术和复印技术相结合的产物。$kp$, section = '' where id = 28748;
update t_knowledge_point set title = $kp$打印机按击打方式分类$kp$, content = $kp$打印机分为针式打印机（击打式）、激光打印机（非击打式）和喷墨打印机（非击打式）。$kp$, section = '' where id = 28789;
update t_knowledge_point set title = $kp$针式打印机的工作原理$kp$, content = $kp$针式打印机属于击打式打印机，打印头上的钢针垂直排列，每次击打打印一个字符的一列。$kp$, section = '' where id = 28790;
update t_knowledge_point set title = $kp$针式打印机与热敏打印机的应用$kp$, content = $kp$针式打印机广泛应用于银行、证券、邮电、商业等领域，用于打印存折和票据。热敏打印机常用于POS机、ATM柜员机等，具有打印速度快、噪音低、打印清晰、使用方便的特点。$kp$, section = '' where id = 28791;
update t_knowledge_point set title = $kp$激光打印机与彩色打印$kp$, content = $kp$激光打印机的耗材是碳粉和硒鼓。喷墨打印机和激光打印机既有黑白打印也有彩色打印。激光打印机属于非击打式输出设备。$kp$, section = '' where id = 28828;
update t_knowledge_point set title = $kp$打印机性能指标与部件$kp$, content = $kp$针式打印机的优势是适合打印票据；喷墨打印机的核心部件是喷头。打印机的性能指标包括打印精度、色彩数目、打印成本和打印速度。针式打印机速度较慢，打印速度通常用每秒字符数或每分钟行数衡量，PPM多用于激光打印机和喷墨打印机。$kp$, section = '' where id = 28829;
update t_knowledge_point set title = $kp$打印机的打印方式与速度指标$kp$, content = $kp$针式打印机每次击打打印一个字符的一列或多列，打完一行再打印下一行，称为行式打印。激光打印机和喷墨打印机用PPM（每分钟打印页数）衡量速度；针式打印机用每秒打印的字符数或行数衡量。$kp$, section = '' where id = 28831;
update t_knowledge_point set title = $kp$显示器部分的考查重点$kp$, content = $kp$显示器是输入输出设备中的常考内容，主要考查液晶显示器。显示器的知识与实际生活联系密切，应从理解的角度备考。$kp$, section = '' where id = 28862;
update t_knowledge_point set title = $kp$针式打印机的特点$kp$, content = $kp$针式打印机为击打式打印机，能多层套打，适用于票据打印，耗材为色带，也可以打印图案。$kp$, section = '' where id = 28863;
update t_knowledge_point set title = $kp$针式打印机与激光打印机$kp$, content = $kp$针式打印机采用行式打印和击打式打印，能多层套打，可以打印图案。激光打印机是激光技术与复印技术相结合的产物，耗材为碳粉（硒鼓），有彩色和黑白机型。$kp$, section = '' where id = 28864;
update t_knowledge_point set title = $kp$喷墨打印机与存储器的分类$kp$, content = $kp$喷墨打印机采用页式打印，支持彩色打印，耗材为墨盒或墨水；关键部件是喷头，有黑白和彩色机型。存储器分为内存和外存：内存包括寄存器、cache和主存储器（RAM和ROM）；外存包括软盘、硬盘、光盘等，后备存储器有磁带库、光盘库。$kp$, section = '' where id = 28865;
update t_knowledge_point set title = $kp$文本展现的过程$kp$, content = $kp$文本展现的过程：①对文本的格式描述进行解释；②生成文字和图表的映像；③传送到显示器或打印机输出。$kp$, section = '' where id = 28879;
update t_knowledge_point set title = $kp$打印机分类与性能指标$kp$, content = $kp$打印机分为针式打印机、激光打印机和喷墨打印机。针式打印机为击打式，能多层套打，适用于票据打印，耗材为色带，也可打印图案（如第一代身份证）；激光打印机是激光技术与复印技术相结合的产物，耗材为墨粉；喷墨打印机支持彩色打印，耗材为墨盒或墨水。打印机的性能指标包括打印精度、打印速度、色彩数目和打印成本。$kp$, section = '' where id = 28912;
update t_knowledge_point set title = $kp$LCD与CRT的比较$kp$, content = $kp$与CRT相比，LCD工作电压低、辐射小、功耗小、不闪烁，广泛应用于笔记本、DC、DV和TV中。$kp$, section = '' where id = 30142;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21925,21942,21979,21980,21994,22020,22037,22056,22091,22117,22130,22145,22157,22178,22188,22191,22192,22193,22195,22214,23213,23525,25219,25341,26710,27187,27188,27189,27191,27192,27193,27194,27197,27227,27228,27266,28067,28068,28070,28071,28073,28074,28075,28076,28081,28239,28253,28272,28273,28285,28286,28287,28288,28594,28648,28685,28686,28744,28746,28747,28748,28789,28790,28791,28828,28829,28831,28862,28863,28864,28865,28879,28912,30142) and not deleted) <> 74 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
