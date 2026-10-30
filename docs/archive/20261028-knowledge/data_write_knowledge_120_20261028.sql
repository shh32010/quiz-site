-- 知识点 120 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_120
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_120 as
select * from t_knowledge_point where id in (22494,22538,22540,23145,23156,23171,23183,23195,23201,23203,23243,23269,23274,23275,23276,23278,23292,23298,23313,23390,23392,23408,23409,23436,23439,23442,23443,23451,23458,23460,23723,23753,24046,24173,25124,25125,25137,25278,25711,26451,26455,26726,26785,26789,26790,26792,26799,26858,26899,27001,27053,27054,27064,27496,27532,27533,27534,27539,27551,27552,27553,27555,27558,28205,28213,28346,28354,28355,28408,28438,28805,29513,29514,29515,29522,29524,29532,29533,29556,29557,29559,29561,29568,29574,29576,29577,29582,29607,29619,29625,29627,29629,29633,29644,29646,29647,29661,29995,32018,32021,32022);

update t_knowledge_point set title = $kp$常用的矢量绘图软件$kp$, content = $kp$专业绘图软件：AutoCAD、PROTEL和CAXA电子图板（用于机械、建筑等）；MAPInfo、ARCInfo、SuperMap GIS（用于地图、地理信息系统）。

办公与事务处理、平面设计、电子出版等使用的绘图软件：Corel公司的CorelDraw、Adobe公司的Illustrator、Macromedia公司的FreeHand、微软公司的Microsoft Visio等。

MS Office中内嵌的绘图软件：Word和PowerPoint中的绘图功能（用于简单的二维图形）。$kp$, section = '' where id = 22494;
update t_knowledge_point set title = $kp$CMYK与RGB颜色模式$kp$, content = $kp$有文献解释CMYK中的K为Key Color（定位套版色），实为与制版时所用定位套版观念混淆而有此一说。此处缩写使用最后一个字母K而非开头的B，是为了避免与Blue混淆。CMYK模式是减色模式，相对应的RGB模式是加色模式。$kp$, section = '' where id = 22538;
update t_knowledge_point set title = $kp$计算机图形的应用$kp$, content = $kp$(1) 计算机辅助设计和辅助制造（CAD/CAM）。
(2) 利用计算机生成各种地形图、交通图、天气图、海洋图、石油开采图等。
(3) 作战指挥和军事训练。
(4) 计算机动画和计算机艺术。
(5) 其他：电子出版、数据处理、工业监控、辅助教学、软件工程等。$kp$, section = '' where id = 22540;
update t_knowledge_point set title = $kp$Android系统分层结构与射频识别$kp$, content = $kp$Android系统自上而下分为：应用程序层（主屏幕、搜索、电话、联系人、浏览器、邮件、日历、相机、地图等）；Java应用软件接口（API）框架（活动管理、窗口管理、内容提供、视图系统、通告管理、包管理、电话管理、资源管理、位置管理、传感器管理、Google Talk服务等）；系统库（C/C++函数库、图像/音频/视频播放与存储的多媒体框架、2D图形SGL、安全通信SSL、3D绘图OpenGL、显示管理Surface Manager、小型SQL数据库、网页浏览器核心WebKit、点阵字和矢量字绘制工具FreeType等）与Android运行时（ART，含核心库）；硬件抽象层（HAL）；Linux内核（内存管理、进程管理、安全管理、网络协议栈、电源管理等核心服务，以及显示器、键盘、音频、蓝牙、USB、相机、WiFi、闪存卡等驱动程序）。

无线射频识别（RFID）是自动识别技术的一种，通过射频信号进行非接触双向数据通信，自动采集信息。$kp$, section = '' where id = 23145;
update t_knowledge_point set title = $kp$按位异或运算$kp$, content = $kp$1111 1111 ⊕ 1010 1010 H

④是逻辑异或，按位进行异或，相同时为0，相异时为1。

( ?? )H = 1111 1111 ⊕ 1010 1010 H = 0101 0101 = 55H$kp$, section = '' where id = 23156;
update t_knowledge_point set title = $kp$图像的数字化$kp$, content = $kp$图像的获取（capturing）：从现实世界中获得数字图像的过程。图像获取设备：扫描仪、数码相机。

图像获取的过程实质上是模拟信号的数字化过程，处理步骤为：

扫描：将画面划分为M×N个网格，每个网格称为一个取样点。
分色：将彩色图像取样点的颜色分解成R、G、B三个基色。
取样：测量每个取样点每个分量的亮度值。
量化：对亮度值进行A/D转换，把模拟量用数字量来表示。$kp$, section = '' where id = 23171;
update t_knowledge_point set title = $kp$景物的计算机表示$kp$, content = $kp$计算机图形学（Computer Graphics）：研究如何使用计算机描述景物并生成其图像的原理、方法与技术。

景物的建模与图像的合成过程：建模（Modeling）得到景物形状的模型（model），再经绘制（Rendering）得到景物的视图。

景物的模型（model）：景物在计算机内的描述。
景物的建模（modeling）：人们进行景物描述的过程。
绘制（rendering）：也称图像合成，根据景物的模型生成图像的过程，所产生的数字图像称为计算机合成图像。$kp$, section = '' where id = 23183;
update t_knowledge_point set title = $kp$HTML5 canvas元素与Android开发语言$kp$, content = $kp$HTML5的canvas元素使用JavaScript在网页上绘制图像。

Android应用程序可以使用Java语言进行开发。$kp$, section = '' where id = 23195;
update t_knowledge_point set title = $kp$软件设计的内容与工具$kp$, content = $kp$软件设计的内容有多种，例如网络设计、代码设计、输入/输出设计、处理流程设计、数据存储设计、用户界面设计、安全性和可靠性设计等。

工具：图形工具（程序流程图、N-S图、PAD图）；表格工具（判定表）；语言工具（PDL——过程设计语言）、伪代码等。

程序流程图属于图形工具。$kp$, section = '' where id = 23201;
update t_knowledge_point set title = $kp$图像与图形的比较$kp$, content = $kp$| 比较项 | 图像 | 图形 |
| --- | --- | --- |
| 生成途径 | 通过图像获取设备获得景物的图像 | 使用矢量绘图软件以交互方式制作而成 |
| 表示方法 | 将景物的映像（投影）离散化，然后使用像素表示 | 使用计算机描述景物的结构、形状与外貌 |
| 表现能力 | 能准确地表示出实际存在的任何景物与形体的外貌，但丢失了部分三维信息 | 规则的形体（实际的或假想的）能准确表示，自然景物只能近似表示 |
| 相应的编辑处理软件 | 典型的图像处理软件，如PhotoShop | 典型的矢量绘图软件，如AutoCAD |
| 文件扩展名 | .bmp、.gif、.tif、.jpg、.jp2等 | .dwg、.dxf、.wmf等 |
| 数据量 | 大 | 小 |$kp$, section = '' where id = 23203;
update t_knowledge_point set title = $kp$计算机合成图像的绘制$kp$, content = $kp$图像绘制（图像合成）：在计算机内建立了景物的模型之后，从景物的模型生成用户可见的、具有高度真实感的该景物图像的过程。

使用计算机合成图像的主要优点：既能生成实际存在的具体景物的图像，也能生成假想或抽象景物的图像；既能生成静止图像，也能生成各种运动、变化的动态图像。$kp$, section = '' where id = 23243;
update t_knowledge_point set title = $kp$计算机合成图像的应用$kp$, content = $kp$计算机辅助设计和辅助制造（CAD/CAM）；利用计算机生成各种地形图、交通图、天气图、海洋图、石油开采图等；作战指挥和军事训练；计算机动画和计算机艺术；其他：电子出版、数据处理、工业监控、辅助教学（CAI）、软件工程等。$kp$, section = '' where id = 23269;
update t_knowledge_point set title = $kp$图像的获取$kp$, content = $kp$图像的获取：从现实世界中获得数字图像的过程。$kp$, section = '' where id = 23274;
update t_knowledge_point set title = $kp$图像的压缩编码$kp$, content = $kp$为了节省存储数字图像所需的存储器容量、降低存储成本，特别是在因特网应用中为了提高图像的传输速度，尽可能地压缩图像的数据是非常必要的。

由于数字图像中数据的相关性很强、冗余度很大，因此对数字图像进行大幅度的数据压缩是完全可能的。而且人眼的视觉有一定的局限性，即使压缩前后的图像有一定失真，只要限制在人眼允许的误差范围之内，也是允许的。$kp$, section = '' where id = 23275;
update t_knowledge_point set title = $kp$文本类型$kp$, content = $kp$文本是计算机表示文字及符号信息的最常用也是最基本的一种数字媒体。使用计算机制作的数字文本，根据用途分为简单文本、丰富格式文本和超文本三类。$kp$, section = '' where id = 23276;
update t_knowledge_point set title = $kp$图像与图形$kp$, content = $kp$计算机中的数字图像按其生成方法可以分为两类：

一类是从现实世界中通过扫描仪、数码相机等设备获取的图像，称为取样图像，也称为点阵图像或位图图像，简称图像。

另一类是使用计算机合成（制作）的图像，称为矢量图形，简称图形。$kp$, section = '' where id = 23278;
update t_knowledge_point set title = $kp$矢量绘图软件$kp$, content = $kp$矢量绘图软件：制作矢量图形的软件，如AutoCAD、MAPInfo、ARCInfo等。

二维矢量绘图软件：Corel公司的CorelDraw、Adobe公司的Illustrator、Macromedia公司的FreeHand、微软公司的Microsoft Visio，以及微软公司Office办公套件中的Word和PowerPoint。$kp$, section = '' where id = 23292;
update t_knowledge_point set title = $kp$图像与图形的分类$kp$, content = $kp$从现实世界中通过数字化设备获取的图像，称为取样图像（sampled image）、点阵图像（dot matrix image）、位图图像（bitmap image），简称图像（image）。

计算机合成的图像（synthetic image），称为矢量图形（vector graphics），简称图形（graphics）。$kp$, section = '' where id = 23298;
update t_knowledge_point set title = $kp$计算机图形的基本概念$kp$, content = $kp$景物的模型（model）：景物在计算机内的描述。
景物的建模（modeling）：人们进行景物描述的过程。
绘制（rendering）：也称图像合成（image synthesis），根据景物的模型生成图像的过程，所产生的数字图像称为计算机合成图像。
计算机图形学（Computer Graphics）：研究如何使用计算机描述景物并生成其图像的原理、方法与技术。$kp$, section = '' where id = 23313;
update t_knowledge_point set title = $kp$图像的获取过程$kp$, content = $kp$从现实世界中获得数字图像的过程称为图像的“获取”。常用的图像获取设备：手机、扫描仪、数码相机、监控摄像头等。

图像获取过程：模拟图像经扫描（将画面划分为M×N个网格，每个网格称为一个取样点）、分色（将彩色图像取样点的颜色分解成R、G、B三个基色）、取样（测量每个取样点每个分量的亮度值）、量化（对取样点每个分量的亮度值进行A/D转换，使用数字整型量表示），最终得到数字图像。$kp$, section = '' where id = 23390;
update t_knowledge_point set title = $kp$图形绘制的硬件——显卡$kp$, content = $kp$绘制的三个基本要求：每秒可处理的三角面片数量要大（10^8个），以生成复杂场景的图像；纹理数据库要大（几至几十GB），以生成多种多样的高度真实感图像；绘制速度要快，游戏要求实时绘制（大于25帧/秒）。

绘制过程中，每一个像素的颜色及其亮度都要经过大量的计算才能得到，因此绘制过程的计算量很大，特别是三维图形和动画。绘图处理器承担着绘制过程中的大部分计算任务，显卡在绘制过程中起着关键作用。$kp$, section = '' where id = 23392;
update t_knowledge_point set title = $kp$图像与图形的对比$kp$, content = $kp$| 比较项 | 图像 | 图形 |
| --- | --- | --- |
| 生成途径 | 通过图像获取设备获得景物的图像 | 使用矢量绘图软件以交互方式制作而成 |
| 表示方法 | 将景物的映像（投影）离散化，然后使用像素表示 | 使用计算机描述景物的结构、形状与外貌 |
| 表现能力 | 能准确地表示出实际存在的任何景物与形体的外貌，但丢失了部分三维信息 | 规则的形体（实际的或假想的）能准确表示，自然景物只能近似表示 |
| 相应的编辑处理软件 | 典型的图像处理软件，如PhotoShop | 典型的矢量绘图软件，如AutoCAD |
| 文件的扩展名 | .bmp、.gif、.tif、.jpg、.jp2等 | .dwg、.dxf、.wmf等 |
| 数据量 | 大 | 小 |$kp$, section = '' where id = 23408;
update t_knowledge_point set title = $kp$图像与图形的比较$kp$, content = $kp$计算机中的“图”按其生成方法可以分为两大类：

通过数字化设备获取的“图”，称为取样图像、点阵图像或位图图像，通常简称图像（image）。

通过计算机建模并绘制而成的“图”，称为矢量图形，通常简称图形（graphics）。

两者在外观上很难区分，但它们有许多不同的属性，一般需要使用不同的软件进行处理。$kp$, section = '' where id = 23409;
update t_knowledge_point set title = $kp$整数（定点数）的表示$kp$, content = $kp$整数不使用小数点，或者说小数点始终隐含在个位数的右面，所以整数也叫做“定点数”。

整数的分类：

不带符号的整数（unsigned integer），一定是正整数。取值范围：8位为0～255（2^8－1），16位为0～65535（2^16－1），32位为0～2^32－1。

带符号的整数（signed integer），既可表示正整数，又可表示负整数。使用最高位（最左面的一位）作为符号位，“0”表示正数，“1”表示负数，其余各位表示数的绝对值。8位取值范围为－127～＋127（－2^7+1～＋2^7－1）。例如：00101011＝＋43，10101011＝－43。

带符号整数有原码和补码两种表示方式，其中带符号正数的补码就是原码本身；带符号负数的补码由原码除符号位外各位取反再加一得到，计算机中带符号的负数采用补码形式存放。

原码到补码的换算：保持最高位符号位不变，其余各位取反，然后末位加1。补码到原码的换算方法相同。

注意：如果是正数，则补码就是其原码本身；如果带符号数补码的最高位是0，则该补码表示形式也是该数值的原码表示形式。$kp$, section = '' where id = 23436;
update t_knowledge_point set title = $kp$三种整数的比较$kp$, content = $kp$| 8位二进制代码 | 无符号整数的值 | 带符号整数的值（原码） | 带符号整数的值（补码） |
| --- | --- | --- | --- |
| 0000 0000 | 0 | 0 | 0 |
| 0000 0001 | 1 | ＋1 | ＋1 |
| …… | | | |
| 0111 1111 | 127 | ＋127 | ＋127 |
| 1000 0000 | 128 | －0 | －128 |
| 1000 0001 | 129 | －1 | －127 |
| …… | | | |
| 1111 1111 | 255 | －127 | －1 |$kp$, section = '' where id = 23439;
update t_knowledge_point set title = $kp$景物图像的绘制过程$kp$, content = $kp$景物图像通过绘制流水线（Rendering Pipeline）生成。$kp$, section = '' where id = 23442;
update t_knowledge_point set title = $kp$景物形状的计算机表示与合成图像绘制$kp$, content = $kp$形体与景物的建模方法：

几何造型技术：线框模型、表面模型、实体模型。
过程模型技术：分形几何、微粒系统、形状语法、基于物理的建模。

计算机合成图像的绘制：图像绘制（图像合成）是在计算机内建立了景物的模型之后，从景物的模型生成用户可见的、具有高度真实感的该景物图像的过程。

从景物模型绘制景物图像的处理步骤：取景变换→视域裁剪→三角化→光栅化→隐藏面消除→明暗处理→阴影生成→纹理映射。

使用计算机合成图像的主要优点：能生成实际存在的具体景物的图像，还能生成假想或抽象景物的图像；能生成静止图像，还能生成各种运动、变化的动态图像。

计算机合成图像的应用：计算机辅助设计和辅助制造（CAD/CAM）；利用计算机生成各种地形图、交通图、天气图、海洋图、石油开采图等；作战指挥和军事训练；计算机动画和计算机艺术；其他：电子出版、数据处理、工业监控、辅助教学（CAI）、软件工程等。

矢量绘图软件：矢量图形即计算机合成图像，矢量绘图软件是制作矢量图形的软件，如AutoCAD、MAPInfo、ARCInfo等。二维矢量绘图软件有Corel公司的CorelDraw、Adobe公司的Illustrator、Macromedia公司的FreeHand、微软公司的Microsoft Visio，以及微软公司Office办公套件中的Word和PowerPoint。

国际标准的绘图语言：二维图形的国际标准是GKS，三维图形的国际标准是GKS-3D、PHIGS，工业标准为Open GL，公司标准如微软公司的Direct-3D。

图形元文件标准（数据形式）：国际标准CGM和STEP，Autodesk公司的DXF，Microsoft公司的WMF。$kp$, section = '' where id = 23443;
update t_knowledge_point set title = $kp$计算机图形的绘制$kp$, content = $kp$计算机根据景物的模型生成其图像的过程称为“绘制”，也叫做图像合成，这是借助计算机中的绘制软件和图形卡（显卡）实现的。$kp$, section = '' where id = 23451;
update t_knowledge_point set title = $kp$计算机合成图像的过程$kp$, content = $kp$计算机合成图像的过程为：建模（造型，Modeling）得到景物形状的模型（model），再经绘制得到景物的视图。

景物形状的计算机表示：

几何模型是景物建模方法与景物类型有关的模型。普通工业产品（如电视机、电话机、汽车、飞机等），使用基本的几何元素（如点、线、面、体等）及表面材料的性质等进行描述所建立的模型。按所使用的几何元素类型，几何模型分为线框模型、曲面模型、实体模型，应用于工业产品的计算机辅助设计/制造。

过程模型（算法模型）：根据景物的生成规律，并使用相应的算法来描述其规律所建立的模型，如剪贴画的构造与效果，可通过改变几何点来调整。$kp$, section = '' where id = 23458;
update t_knowledge_point set title = $kp$计算机图形的绘制技术$kp$, content = $kp$绘制（rendering）也称为图像合成（image synthesis），是依据景物的模型，根据观察位置和光线情况，生成该景物可视图像的过程。$kp$, section = '' where id = 23460;
update t_knowledge_point set title = $kp$浮点数的阶码与尾数$kp$, content = $kp$57.6256 = 10^2 × (0.576256)

－1984.043 = 10^4 × (－0.1984043)

0.004567 = 10^-2 × (0.4567)

其中指数部分（称为“阶码”，是一个整数）用来指出实数中小数点的位置，括号内是一个纯小数（称为“尾数”）。二进制的实数表示也是这样，例如：

1001.011 = 2^100 × (0.1001011)

－0.0010101 = 2^-10 × (－0.10101)

在计算机中通常把浮点数分成阶码和尾数两部分，其中阶码一般用补码定点整数表示，尾数一般用补码或原码定点小数表示。阶符表示指数的符号位，阶码表示幂次，数符表示尾数的符号位，尾数表示规格化的小数值。

用科学计数法表示：N = S × 2^i，其中S为尾数，i为阶码。

| 阶符 | 阶码 | 数符 | 尾数 |
| --- | --- | --- | --- |

阶码用来指示尾数中的小数点应当向左或向右移动的位数；尾数表示数值的有效数字，其小数点约定在数符和尾数之间。在浮点数中数符和阶符各占一位，阶码的值随浮点数数值的大小而定，尾数的位数则依浮点数的精度要求而定。$kp$, section = '' where id = 23723;
update t_knowledge_point set title = $kp$一维与二维条形码$kp$, content = $kp$商品条码由左侧数据符、中间分隔符、右侧数据符、终止符和右侧静空区组成，其中的数字依次为国家代码、厂商代码、产品代码和校验码。

一维条形码将宽度不等的黑条和白条按一定的编码规则排列成平行线图案，用以对物品进行标识；只在一个方向表达信息，信息量有限（几十个字符），只能包含字母、数字和一些特殊符号。

二维条形码在平面（二维方向）上以黑白相间的图形记录文字和符号信息，信息容量大。QR条码由定位标志和数据区组成，可容纳7089个数字，或者4296个字母，或者1800个汉字，也可以表示签字、指纹等信息；检错和纠错功能较强，能360度全方位识读，可靠性高；可引入加密技术，保密性、防伪性较好。$kp$, section = '' where id = 23753;
update t_knowledge_point set title = $kp$浮点数表示$kp$, content = $kp$实数一般用浮点数表示，因为它的小数点位置不固定，所以称浮点数。它是既有整数又有小数的数，纯小数可以看作实数的特例。任何一个实数都可以表达成一个乘幂和一个纯小数之积，57.6256、－1984.043、0.004567都是实数。以上三个数又可以表示为：

57.6256＝10^2×(0.576256)
－1984.043＝10^4×(－0.1984043)
0.004567＝10^-2×(0.4567)

其中指数部分（称为“阶码”，是一个整数）用来指出实数中小数点的位置，括号内是一个纯小数（称为“尾数”）。二进制的实数表示也是这样，例如：

1001.011＝2^100×(0.1001011)
－0.0010101＝2^-10×(－0.10101)

在计算机中通常把浮点数分成阶码和尾数两部分，其中阶码一般用补码定点整数表示，尾数一般用补码或原码定点小数表示。阶符表示指数的符号位，阶码表示幂次，数符表示尾数的符号位，尾数表示规格化的小数值。

用科学计数法表示：N＝S×2^i，其中S为尾数，i为阶码。

浮点数的格式为：阶符｜阶码｜数符｜尾数。

阶码用来指示尾数中的小数点应当向左或向右移动的位数；尾数表示数值的有效数字，其小数点约定在数符和尾数之间。在浮点数中数符和阶符各占一位，阶码的值随浮点数数值的大小而定，尾数的位数则依浮点数的精度要求而定。

例如：二进制数－110101101.01101可以表示成－0.11010110101101×2^1001。假定阶码8位、尾数24位，则该数的表示为：阶符0，阶码0001001，数符1，尾数11010110101101000000000。

补充：Pentium处理器中的32位浮点数包含三个部分：符号s占1位，s＝0表示此浮点数为正，s＝1表示为负；偏移阶码e共8位，是带有偏移量127的无符号整数，指数的实际值＝e－127；尾数共23位，使用原码表示，绝对值在1与2之间，其中1和小数点都是隐含的，不直接表示出来。即：符号位（1位）｜偏移阶码（8位）｜尾数（23位）。$kp$, section = '' where id = 24046;
update t_knowledge_point set title = $kp$分形图案示例$kp$, content = $kp$由分形几何方法生成的图案，具有自相似的细节结构。$kp$, section = '' where id = 24173;
update t_knowledge_point set title = $kp$什么是计算机图形$kp$, content = $kp$通过计算机和软件对景物的结构、形状与外貌进行描述（称为“建模”），然后根据该描述和选定的观察位置及光线状况，生成该景物的图形（称为“绘制”）。计算机图形也称为计算机合成图像。

计算机制作图形的步骤为：建模（Modeling）得到景物的模型（model），再经绘制（Rendering，Image Synthesis）得到景物的视图。$kp$, section = '' where id = 25124;
update t_knowledge_point set title = $kp$俄罗斯茶壶$kp$, content = $kp$美国康奈尔大学Suzanne Smits和Priamos Georgiades建模并绘制的俄罗斯茶壶，是计算机合成图像的典型示例。$kp$, section = '' where id = 25125;
update t_knowledge_point set title = $kp$计算机绘制的钢笔画和铅笔画$kp$, content = $kp$计算机绘制的玻璃瓶与木桶，以钢笔画、铅笔画的风格呈现。引用自Georges Winkenbach、D. Salesin（华盛顿大学），SIGGRAPH'96，pp.469-476。$kp$, section = '' where id = 25137;
update t_knowledge_point set title = $kp$计算机动画与 Flash 动画$kp$, content = $kp$计算机动画在教材中出现于两处：①“图形→应用→计算机动画”，与计算机辅助设计（CAD）、计算机辅助制造（CAM）、计算机生成地形图/交通图/天气图/海洋图/石油开采图等并列；②“数字视频及应用→计算机动画→Flash 动画”。

Flash 动画的特点：画面由矢量图形构成；任意放大都清晰；扩展名为 .swf；数据量较小，便于互联网传输。$kp$, section = '' where id = 25278;
update t_knowledge_point set title = $kp$度量学习$kp$, content = $kp$度量学习也称距离度量学习、相似度学习。通过学习对象之间的距离，度量学习能够用于分析对象之间的关联与比较关系，在实际问题中应用较为广泛，可用于辅助分类、聚类问题，也广泛用于图像检索、人脸识别等领域。$kp$, section = '' where id = 25711;
update t_knowledge_point set title = $kp$Android 的程序库（核心库）$kp$, content = $kp$Android 包含一些 C/C++ 库，这些库能被 Android 系统中不同的组件使用，并通过 Android 应用程序框架为开发者提供服务。核心库包括：

- 系统 C 库：从 BSD 继承来的标准 C 系统函数库（libc），专门为基于嵌入式 Linux 的设备定制。
- 媒体库：基于 PacketVideo OpenCORE，支持多种常用音频、视频格式的回放和录制，同时支持静态图像文件；编码格式包括 MPEG4、H.264、MP3、AAC、AMR、JPG、PNG。
- Surface Manager：管理显示子系统，并为多个应用程序提供 2D 和 3D 图层的无缝融合。
- LibWebCore：网页浏览器引擎，支持 Android 浏览器和一个可嵌入的 Web 视图。
- SGL：底层的 2D 图形引擎。
- 3D libraries：基于 OpenGL ES 1.0 API 实现，可使用硬件 3D 加速（如果可用）或高度优化的 3D 软加速。
- FreeType：位图（bitmap）和矢量（vector）字体显示。
- SQLite：对所有应用程序可用、功能强劲的轻型关系型数据库引擎。$kp$, section = '' where id = 26451;
update t_knowledge_point set title = $kp$iOS 的媒体层$kp$, content = $kp$媒体层（Media layer）提供图片、音乐、影片等多媒体功能。图像分为 2D 图像和 3D 图像，前者由 Quartz 2D 支持，后者由 OpenGL ES 支持；与音乐对应的模组是 Core Audio 和 OpenAL，Media Player 实现影片播放，Core Animation 提供动画支持。$kp$, section = '' where id = 26455;
update t_knowledge_point set title = $kp$软件的分类$kp$, content = $kp$软件可分为：网络软件、系统软件、应用软件，以及联络聊天、图形图像、多媒体行业软件、游戏娱乐、编程开发、安全相关、教育教学、硬件驱动等类别。$kp$, section = '' where id = 26726;
update t_knowledge_point set title = $kp$多媒体技术$kp$, content = $kp$多媒体技术专指在计算机程序中处理图形、图像、影音、声音、动画等的计算机应用技术。$kp$, section = '' where id = 26785;
update t_knowledge_point set title = $kp$图像与图形的区别$kp$, content = $kp$图像是由扫描仪、摄像机等输入设备捕捉实际画面产生的数字图像，由像素点阵构成，属于位图。

图形是指由外部轮廓线条构成的矢量图，即由计算机绘制的直线、矩形、曲线、图表等。$kp$, section = '' where id = 26789;
update t_knowledge_point set title = $kp$色彩的产生、表达方法与色彩空间$kp$, content = $kp$色彩产生的原理：色彩是通过眼、脑和生活经验所产生的对光的视觉感受。肉眼所见的光线由波长范围很窄的电磁波产生，不同波长的电磁波表现为不同的颜色；对色彩的辨认是肉眼受到电磁波辐射刺激后所引起的视觉神经感觉。

常用的表现技法：自然配色法、非自然配色法、渐变、分离、强调。

“色彩空间”一词源于西方的 Color Space，又称“色域”。色彩学中建立了多种色彩模型，用一维、二维、三维甚至四维空间坐标来表示某一色彩，这种坐标系统所能定义的色彩范围即色彩空间。常用色彩空间主要有 RGB、CMYK、Lab 等。$kp$, section = '' where id = 26790;
update t_knowledge_point set title = $kp$模拟图像的数字化过程$kp$, content = $kp$图像数字化主要分为三个步骤：采样、量化、编码。

采样：实质是用多少个点来描述一幅图像，采样结果质量的高低用图像分辨率衡量。具体做法是对二维空间上连续的图像在水平和垂直方向上等间距地分割成矩形网状结构，所形成的微小方格称为像素点，一幅图像就被采样成有限个像素点构成的集合。

量化：指用多大范围的数值来表示图像采样之后的每一个点。量化的结果是图像能够容纳的颜色总数，它反映了采样的质量。

压缩编码：数字化后得到的图像数据量十分巨大，必须采用编码技术压缩其信息量。在一定意义上，编码压缩技术是实现图像传输与存储的关键。已有许多成熟的编码算法应用于图像压缩，常见的有预测编码、变换编码、分形编码、小波变换图像压缩编码等。$kp$, section = '' where id = 26792;
update t_knowledge_point set title = $kp$计算机合成图像的过程、优点与常用绘图软件$kp$, content = $kp$1）合成图像：计算机生产的图像。

2）合成图像的优点：能生成实际存在的具体景物的图像，也能生成假想或抽象景物的图像；能生成静止图像和各种运动变化的动态图像；图形文件中只记录生成图的算法和图上的某些特征点，数据量较小。

3）常见绘图软件：平面图形处理软件（Photoshop）、矢量图形绘图软件（CorelDRAW、Illustrator）、建筑与机械制图软件（AutoCAD）、三维动画软件（3ds Max）、二维动画软件（Flash）、工程制图（CAD）。$kp$, section = '' where id = 26799;
update t_knowledge_point set title = $kp$iOS 的系统架构$kp$, content = $kp$iOS 基于 UNIX 系统，其系统架构分为四层，由上到下依次为：可触摸层（Cocoa Touch layer）、媒体层（Media layer）、核心服务层（Core Services layer）、核心操作系统层（Core OS layer）。

（1）触摸层：为应用程序开发提供各种常用框架，大部分框架与界面有关，本质上负责用户在 iOS 设备上的触摸交互操作，如 NotificationCenter 的本地通知和远程推送服务、iAd 广告框架、GameKit 游戏工具框架、消息 UI 框架、图片 UI 框架、地图框架、连接手表框架、自动适配等。

（2）媒体层：提供应用中视听方面的技术。图形图像相关有 CoreGraphics、CoreImage、GLKit、OpenGL ES、CoreText、ImageIO 等；声音技术相关有 CoreAudio、OpenAL、AVFoundation；视频相关有 CoreMedia、Media Player 框架；音视频传输有 AirPlay 框架等。

（3）核心服务层：提供应用所需要的基础系统服务，如 Accounts 账户框架、广告框架、数据存储框架、网络连接框架、地理位置框架、运动框架等。其中最核心的是 CoreFoundation 和 Foundation 框架，定义了所有应用使用的数据类型；CoreFoundation 是基于 C 的一组接口，Foundation 是对 CoreFoundation 的 Objective-C 封装。

（4）核心操作系统层：包含大多数低级别、接近硬件的功能，其中的框架常常被其他框架使用。Accelerate 框架包含数字信号、线性代数、图像处理的接口，针对所有 iOS 设备硬件之间的差异做优化，保证写一次代码在所有 iOS 设备上高效运行；CoreBluetooth 框架利用蓝牙与外设交互，包括扫描连接蓝牙设备、保存连接状态、断开连接、获取外设数据或向外设传输数据等；Security 框架提供管理证书、公钥和私钥信任策略、keychain、hash 认证、数字签名等与安全相关的解决方案。$kp$, section = '' where id = 26858;
update t_knowledge_point set title = $kp$人工智能的行业应用领域$kp$, content = $kp$人工智能在医疗、智慧金融、智慧教育等领域的应用包括：全屋智能、无人驾驶、智慧工厂、视频会诊、声纹识别、量化交易、投资顾问、客服服务、风险管理、深度学习等。$kp$, section = '' where id = 26899;
update t_knowledge_point set title = $kp$设置色彩模式和分辨率$kp$, content = $kp$在“显示属性”对话框中选择“设置”选项卡，可对显示器使用的颜色和屏幕分辨率大小进行设置：“颜色质量”下拉列表框中可以选择当前显示器表示颜色的位数；在“屏幕分辨率”选项组中，利用滑块设置屏幕分辨率。$kp$, section = '' where id = 27001;
update t_knowledge_point set title = $kp$实数的特点与表示方法$kp$, content = $kp$特点：既有整数部分又有小数部分，小数点位置不固定；整数和纯小数是实数的特例；任何一个实数总可以表达成一个乘幂和一个纯小数之积。

例如：56.725 = 0.56725 × 10^2；-0.0034756 = -0.34756 × 10^-2。

实数的表示方法（浮点表示法）用 3 个部分表示：

1. 乘幂中的指数：表示实数中小数点的位置。
2. 纯小数部分（尾数）：表示实数中的有效数字部分。
3. 数的正负（符号）。$kp$, section = '' where id = 27053;
update t_knowledge_point set title = $kp$两个多位数的逻辑运算$kp$, content = $kp$多位数的逻辑运算按位独立进行，每一位都不受其他位的影响。

例 1（或运算）：A = 0110，B = 1010，F = A ∨ B = 1110。

例 2（与运算）：A = 0110，B = 1010，F = A ∧ B = 0010。

例 3（非运算）：A = 0110，NOT A = 1001。

例 4（非运算）：B = 1010，NOT B = 0101。$kp$, section = '' where id = 27054;
update t_knowledge_point set title = $kp$量化$kp$, content = $kp$在图像的数字化过程中，量化是把取样点每个分量的亮度用数字量来衡量。$kp$, section = '' where id = 27064;
update t_knowledge_point set title = $kp$光电鼠标的工作原理$kp$, content = $kp$光电鼠标使用微型镜头拍摄其下方的图像，由 DSP 分析移动的距离和方向。$kp$, section = '' where id = 27496;
update t_knowledge_point set title = $kp$图形与图像的获取过程$kp$, content = $kp$图形：计算机合成制作的图像称为矢量图形，简称图形。

图像的获取过程：扫描—分色—取样—量化。$kp$, section = '' where id = 27532;
update t_knowledge_point set title = $kp$像素与模数转换$kp$, content = $kp$取样点称为像素。图像输入（数字化）时进行的是 A/D 转换，图像输出时进行的是 D/A 转换。$kp$, section = '' where id = 27533;
update t_knowledge_point set title = $kp$量化与像素分量$kp$, content = $kp$图像获取过程中的量化，指确定表示每个取样点亮度值所用的二进制位数；灰度图像和黑白图像的像素只包含亮度分量。$kp$, section = '' where id = 27534;
update t_knowledge_point set title = $kp$像素深度与颜色模型$kp$, content = $kp$像素深度：每个像素的二进制位数。显示器使用 RGB 模型；彩色打印机使用 CMYK 模型；图像组件使用 HSB 模型。颜色模型可以互相转换。$kp$, section = '' where id = 27539;
update t_knowledge_point set title = $kp$计算机图形及其应用领域$kp$, content = $kp$计算机图形可应用于军事、公安、档案管理等领域。景物的计算机表示是计算机图形的基础内容。$kp$, section = '' where id = 27551;
update t_knowledge_point set title = $kp$绘制（图像合成）$kp$, content = $kp$计算机根据景物的模型生成图像的过程称为绘制，也叫图像合成。$kp$, section = '' where id = 27552;
update t_knowledge_point set title = $kp$计算机生成图像的能力$kp$, content = $kp$计算机中不但可以生成实际存在的具体景物，还能生成假想或抽象景物的图像。$kp$, section = '' where id = 27553;
update t_knowledge_point set title = $kp$显示桌面的快捷键$kp$, content = $kp$按【Windows】+【M】组合键可显示桌面。$kp$, section = '' where id = 27555;
update t_knowledge_point set title = $kp$Windows 常考知识点$kp$, content = $kp$① Windows 提供图形用户界面（GUI）。

② Windows 支持“即插即用”的系统配置方法，并具有支持多种协议的通信软件。

③ 为了保护系统资源不被非法访问，Windows 采用了“用户组”访问策略，不同用户组具有不同的访问权限。$kp$, section = '' where id = 27558;
update t_knowledge_point set title = $kp$鼠标的分辨率$kp$, content = $kp$鼠标的分辨率是指鼠标每移动 1 英寸，光标在屏幕上通过的像素数目，用 dpi（dot per inch）表示。$kp$, section = '' where id = 28205;
update t_knowledge_point set title = $kp$操作系统提供友善的人机界面$kp$, content = $kp$为用户提供友善的人机界面，包括命令行界面与图形界面。$kp$, section = '' where id = 28213;
update t_knowledge_point set title = $kp$彩色图像的像素组成$kp$, content = $kp$彩色图像的像素通常由 3 个彩色分量组成。$kp$, section = '' where id = 28346;
update t_knowledge_point set title = $kp$矢量图形的特点$kp$, content = $kp$矢量图形的特点：放大不失真；数据量小；方便编辑。$kp$, section = '' where id = 28354;
update t_knowledge_point set title = $kp$用 Office 编辑简单的二维图形$kp$, content = $kp$Office 中可以编辑简单的二维图形。$kp$, section = '' where id = 28355;
update t_knowledge_point set title = $kp$显卡与计算机合成图像的应用$kp$, content = $kp$显卡中的核心是绘图处理器 GPU，它能承担绘制过程中的大部分计算任务。

计算机合成图像的应用：计算机辅助设计（CAD）、地形图、交通图、天气图、作战指挥、军事训练、计算机艺术和计算机动画（Flash）。$kp$, section = '' where id = 28408;
update t_knowledge_point set title = $kp$数据可视化$kp$, content = $kp$数据可视化是将数据以不同的视觉表现形式（图形图像）展现在不同系统中。$kp$, section = '' where id = 28438;
update t_knowledge_point set title = $kp$类的图形化表示$kp$, content = $kp$根据识别出来的类，定义类的相关属性及行为（方法），并以类之间的关系绘制类图。例题：以下（D）是正确的类的图形化表示，其他都是不完整的。$kp$, section = '' where id = 28805;
update t_knowledge_point set title = $kp$Android 的系统运行库$kp$, content = $kp$系统运行库（系统库）包括：C/C++ 函数库；图像/音频/视频播放与存储的多媒体框架；2D 图形 SGL；安全通信 SSL；3D 绘图 OpenGL；显示管理 Surface Manager；小型 SQL 数据库 SQLite；网页浏览器核心 WebKit；点阵字和矢量字绘制工具 FreeType；以及 Android 运行时 ART（核心库）。$kp$, section = '' where id = 29513;
update t_knowledge_point set title = $kp$系统运行库的组成$kp$, content = $kp$系统运行库包括：C/C++ 函数库、图像/音频/视频播放与存储的多媒体框架、2D 图形 SGL、安全通信 SSL、3D 绘图 OpenGL、显示管理 Surface Manager、小型 SQL 数据库、网页浏览器核心 WebKit、点阵字和矢量字绘制工具 FreeType，以及 Android 运行时 ART（核心库）。$kp$, section = '' where id = 29514;
update t_knowledge_point set title = $kp$iOS 媒体层的图形与动画框架$kp$, content = $kp$媒体层：Core Graphics 负责 2D 绘图；OpenGL ES 负责 OpenGL 三维图形；Core Animation 是绘图的动画框架；并提供访问各种媒体文件的接口。$kp$, section = '' where id = 29515;
update t_knowledge_point set title = $kp$量化与 A/D 转换$kp$, content = $kp$量化：对取样点每个分量的亮度值进行 A/D 转换。$kp$, section = '' where id = 29522;
update t_knowledge_point set title = $kp$颜色空间的类型（颜色模型）$kp$, content = $kp$颜色空间（颜色模型）指彩色图像所使用的颜色描述方法。常用的颜色模型有 RGB、CMYK、HSB、YUV 等，颜色模型可以相互转换。$kp$, section = '' where id = 29524;
update t_knowledge_point set title = $kp$图形文件的特点与计算机合成图像的应用$kp$, content = $kp$图形文件中只记录生成图的算法和图上的某些特征点，数据量较小。

计算机合成图像的应用：计算机辅助设计、绘制电路图（最直接的应用）等。$kp$, section = '' where id = 29532;
update t_knowledge_point set title = $kp$计算机动画与常用矢量绘图软件$kp$, content = $kp$计算机动画

（八）矢量绘图软件：AutoCAD、CorelDraw、Illustrator、FreeHand、Microsoft Visio。

九、声音

（一）声音信号的数字化$kp$, section = '' where id = 29533;
update t_knowledge_point set title = $kp$模拟图像数字化的四个步骤$kp$, content = $kp$图像获取的过程实质上是模拟信号的数字化过程，它分为4步：扫描（划分网格）、分色（对像素点分成RGB三种基色）、取样（获得分量的亮度值）、量化（对亮度值进行A/D转换）。$kp$, section = '' where id = 29556;
update t_knowledge_point set title = $kp$常见的颜色空间类型$kp$, content = $kp$颜色空间的类型有：RGB（电脑）、CMYK（彩色打印机）、HSB（处理图片）、YUV（电视）。$kp$, section = '' where id = 29557;
update t_knowledge_point set title = $kp$数据压缩的分类$kp$, content = $kp$数据压缩分成无损压缩（算法如行程长度编码、哈夫曼编码）和有损压缩（变换编码、矢量编码）。$kp$, section = '' where id = 29559;
update t_knowledge_point set title = $kp$计算机合成图像的主要优点$kp$, content = $kp$使用计算机合成图像的主要优点有：不仅能生成实际存在的图像，还能生成假想或抽象的图像；不仅能生成静止图像，还能生成各种运动、变化的动态图像。$kp$, section = '' where id = 29561;
update t_knowledge_point set title = $kp$网页制作中广泛使用的两种动画$kp$, content = $kp$目前因特网网页制作中广泛使用的动画有两种：一种是Flash动画，另一种是GIF动画。$kp$, section = '' where id = 29568;
update t_knowledge_point set title = $kp$用“动作设置”建立和取消超级链接$kp$, content = $kp$使用“动作设置”命令建立超级链接的步骤是：

① 选取要建立超级链接的对象。

② 选择“幻灯片放映”菜单中的“动作设置”命令。

③ 在随后出现的对话框中，选择“单击鼠标”选项卡中的“超级链接到”，从中选择一个链接位置即可完成超级链接。使用“播放声音”，可以在链接跳转的同时播放声音。

④ 单击“确定”按钮完成操作。

在“动作设置”中取消超级链接的步骤是：

① 选中具有超级链接的对象。

② 单击鼠标右键，在出现的快捷菜单中选取“动作设置”命令。

③ 选取“单击鼠标”选项卡中的“无动作”选项。

④ 单击“确定”按钮完成操作。$kp$, section = '' where id = 29574;
update t_knowledge_point set title = $kp$图形与图像的区别$kp$, content = $kp$图形图像、声音及视频。

图形：计算机绘制，是矢量图，放大或缩小不失真。

图像：外部获取，是位图（点阵图、光栅图、像素图），放大或缩小会失真。$kp$, section = '' where id = 29576;
update t_knowledge_point set title = $kp$获取图像的四个步骤$kp$, content = $kp$获取图像

扫描：取分辨率的过程，水平分辨率×垂直分辨率。

分色：找出色彩种类（位平面），根据基色的数量决定位平面数量；黑白图、灰度图的位平面是1，RGB图像的位平面是3。

取样：取色彩的亮度值（像素深度）。

量化：A/D模/数转换。$kp$, section = '' where id = 29577;
update t_knowledge_point set title = $kp$幻灯片的动画设置$kp$, content = $kp$动画设置针对幻灯片中的每个对象。可以使用动画方案，也可以自定义动画，自定义动画可以为每个对象单独设置动画效果。$kp$, section = '' where id = 29582;
update t_knowledge_point set title = $kp$计算机合成图像的应用$kp$, content = $kp$计算机合成图像应用

① 计算机辅助设计（CAD）

② 地形图、交通图、天气图

③ 作战指挥、军事训练

④ 计算机艺术和计算机动画（Flash）$kp$, section = '' where id = 29607;
update t_knowledge_point set title = $kp$矢量绘图软件与声音信号的数字化$kp$, content = $kp$计算机动画

（八）矢量绘图软件：AutoCAD、CorelDraw、Illustrator、FreeHand、Microsoft Visio。

九、声音

（一）声音信号的数字化$kp$, section = '' where id = 29619;
update t_knowledge_point set title = $kp$验证码的作用$kp$, content = $kp$为了防止用机器程序进行批量注册或反复尝试密码，在网上注册或登录时通常要输入验证码。【2013】$kp$, section = '' where id = 29625;
update t_knowledge_point set title = $kp$图像获取的处理步骤$kp$, content = $kp$图像获取的处理步骤：扫描→分色→取样→量化（顺序不能颠倒，考判断题）。

分色：将图像分解成三基色RGB（红绿蓝），印刷的时候可以通过软件转换成CMYK（青、洋红、黄、黑）。

取样：取分量的亮度。

量化：模拟转数字，即A/D转换。$kp$, section = '' where id = 29627;
update t_knowledge_point set title = $kp$图像分辨率与常用的颜色模型$kp$, content = $kp$图像的分辨率＝垂直分辨率×水平分辨率，图像分辨率决定图像的大小。

常用的颜色模型：RGB（红绿蓝）用于显示器，颜色模型决定了图像的用途（可以通过软件相互转换）；CMYK（青、品红、黄、黑）用于彩色打印；HSB（色彩、饱和度、亮度）即色彩三要素，B为0表示纯黑，最亮最高为白色；YUV（亮度Y，色度UV）用于彩色电视信号传输（考填空题）【2010】。

色彩深度：决定图像的逼真度，也是调节对比度的依据，用位数表示，为2的N次方。$kp$, section = '' where id = 29629;
update t_knowledge_point set title = $kp$计算机图形与图像的区别及应用$kp$, content = $kp$计算机图形：建模→绘制。

计算机合成图像也是图形。

应用：计算机辅助设计（CAD）、地形图、交通图、天气图、作战指挥、军事训练、计算机艺术和计算机动画。

图像称为位图、点阵图，图形称为矢量图。$kp$, section = '' where id = 29633;
update t_knowledge_point set title = $kp$虚拟现实技术与多媒体常识$kp$, content = $kp$虚拟现实技术使计算机从一种需要用键盘、鼠标对其进行操作的设备，变成了人处于计算机创造的环境中，通过感官、语言、手势等比较“自然”的方式进行“交互、对话”的系统和环境。【2007年】

JPEG2000比JPEG的压缩率小【2009判断】。

用Flash软件制作的动画是矢量图形，这种动画文件（文件后缀是swf）很小，便于在因特网上传输【2011】。AVI是音频视频交错格式【2012】。Word可以制作2D矢量图形【2012】。

DVD伴音具有5.1声道，足以实现三维环绕立体音响效果【2013】。$kp$, section = '' where id = 29644;
update t_knowledge_point set title = $kp$图形的对齐与分布$kp$, content = $kp$图形的对齐：选中多个对象（按Shift键加选）后执行“对齐”；分布：使对象间距相等。

对齐至少需要2个对象，分布至少需要3个对象。$kp$, section = '' where id = 29646;
update t_knowledge_point set title = $kp$图形的组合与取消组合$kp$, content = $kp$图形的组合和取消组合。组合的作用：可以一起移动，可以一起变换大小。

组合的对象可以单独改变颜色（但对图形的属性没有影响）【2010】。$kp$, section = '' where id = 29647;
update t_knowledge_point set title = $kp$HTML5的设备接口与图形多媒体特性$kp$, content = $kp$设备方向和运动API（DeviceOrientation & DeviceMotion API）。DeviceOrientation常用于检测重力感应方向，DeviceMotion常用于摇一摇功能。

④ 连接特性

更有效的连接提高了工作效率，使得基于页面的实时聊天、更快速的网页游戏体验、更优化的在线交流得到了实现。HTML5拥有更有效的服务器推送技术，Server-Sent Event和WebSockets就是其中的两个特性，这两个特性能够帮助实现服务器将数据“推送”到客户端的功能。

⑤ 网页多媒体特性

支持网页端的Audio、Video等多媒体功能，与网站自带的APPS、摄像头、影音功能相得益彰。

⑥ 三维、图形及特效特性

基于SVG、Canvas、WebGL及CSS3的3D功能，用户会惊叹于在浏览器中所呈现的惊人视觉效果。SVG是用于描述二维矢量图形的一种图形格式。

- SVG可被非常多的工具读取和修改（比如记事本）。

- SVG与JPEG和GIF图像比起来，尺寸更小，且可压缩性更强。

- SVG是可伸缩的。

- SVG图像可在任何的分辨率下被高质量地打印。

- SVG可在图像质量不下降的情况下被放大。

- SVG图像中的文本是可选的，同时也是可搜索的（很适合制作地图）。

- SVG文件是纯粹的XML。

HTML5的canvas元素使用JavaScript在网页上绘制图像。画布是一个矩形区域，可以控制其每一像素。canvas拥有多种绘制路径、矩形、圆形、字符以及添加图像的方法。canvas元素本身是没有绘图能力的，所有的绘制工作必须在JavaScript内部完成。

Canvas和SVG都允许在浏览器中创建图形，但是它们在根本上是不同的。SVG是一种使用XML描述2D图形的语言，在SVG中每个被绘制的图形均被视为对象，如果SVG对象的属性发生变化，那么浏览器能够自动重现图形。Canvas通过JavaScript来绘制2D图形。SVG不依赖分辨率，不适合游戏应用；Canvas依赖分辨率，最适合图像密集型的游戏，其中的许多对象会被频繁重绘。

WebGL（全写Web Graphics Library）是一种3D绘图标准。WebGL可以为HTML5 Canvas提供硬件3D加速渲染，这样Web开发人员就可以借助系统显卡在浏览器里更流畅地展示3D场景和模型，还能创建复杂的导航和数据视觉化。

CSS3允许元素以3D的形式显示。

⑦ 性能与集成特性

没有用户会永远等待你的Loading——HTML5会通过XMLHttpRequest2等技术，解决以前的跨域等问题，帮助Web应用和网站在多样化的环境中更快速地工作。性能与集成特性主要包括两个东西：Web Workers和XMLHttpRequest 2。$kp$, section = '' where id = 29661;
update t_knowledge_point set title = $kp$媒体层提供的视听技术$kp$, content = $kp$媒体层：提供应用中视听方面的技术，如图形图像相关的CoreGraphics、CoreImage、GLKit、OpenGL ES、CoreText、ImageIO等；声音技术相关的CoreAudio、OpenAL、AVFoundation；视频相关的CoreMedia、Media Player框架；音视频传输的AirPlay框架等。$kp$, section = '' where id = 29995;
update t_knowledge_point set title = $kp$图形处理（Word）$kp$, content = $kp$理论知识要点：

- 支持图片或图形与文本的混排。
- 嵌入方式：嵌入式对象、浮动式对象。
- 位置：嵌入式对象只能位于当前插入点位置，与文字依次排版；浮动式对象可精确定位到页面任意位置。
- 文字环绕方式：七种。其中“嵌入式”是嵌入图形对象（不能浮于文字上方或下方，只能与文字一起依次排版），其他是“浮动”图形对象（可与文字叠加、位于文字上方或下方）。
- 组合：将对象组合在一起，以便能够像使用一个对象一样来使用它们。可以将组合中的所有对象作为一个单元进行翻转、旋转以及调整大小或缩放等操作，还可以同时更改组合中所有对象的属性，例如为组合中的所有对象更改填充颜色或添加阴影；也可以选取组合中的一个项目并应用某个属性而无需取消组合；还可以在组合中再创建组合以帮助构建复杂图形。可以随时取消对象的组合。
- 文本添加到图形：添加的文本将成为图形的一部分，如果旋转或翻转该图形，则文本将与其一起旋转或翻转。
- 文本框：一种可移动、可调大小的文字或图形容器。使用文本框，可以在一页上放置数个文字块，或使文字按与文档中其他文字不同的方向排列。文本框可作为图形处理，能以多种与设置图形格式相同的方式进行格式设置，包括添加颜色、填充及边框。
- 浮动图形对象：插入绘图层的图形或其他对象，可在页面上为其精确定位或使其位于文字或其他对象的上方或下方。
- 嵌入图形对象：在Microsoft Word文档中，直接从插入点放置到文字中的图形或其他对象。
- 图文框：可调整其大小并置于页面任意位置的容器。若要放置包含批注、脚注、尾注或特定域的文字或图形，则必须使用图文框而不是文本框。图文框会将环绕的文字推至周围，总是锁定在最近的段落上，并总是与锁定段落出现在同一页面。

操作要点：插入图片。$kp$, section = '' where id = 32018;
update t_knowledge_point set title = $kp$绘制自选图形$kp$, content = $kp$自选图形包括矩形、圆这样的基本形状，以及各种线条、连接符、箭头总汇、流程图符号、星与旗帜和标注等。单击“绘图”工具栏上的【自选图形】按钮可绘制需要的图形。$kp$, section = '' where id = 32021;
update t_knowledge_point set title = $kp$设置图形的旋转$kp$, content = $kp$选取要旋转的图形，向所需的方向拖动对象上的旋转控点，单击图形以外的地方以将旋转确定下来。如果要向左旋转90°或向右旋转90°，在“绘图”工具栏上单击【绘图】，指向“旋转或翻转”，再选择单击旋转的方式。$kp$, section = '' where id = 32022;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22494,22538,22540,23145,23156,23171,23183,23195,23201,23203,23243,23269,23274,23275,23276,23278,23292,23298,23313,23390,23392,23408,23409,23436,23439,23442,23443,23451,23458,23460,23723,23753,24046,24173,25124,25125,25137,25278,25711,26451,26455,26726,26785,26789,26790,26792,26799,26858,26899,27001,27053,27054,27064,27496,27532,27533,27534,27539,27551,27552,27553,27555,27558,28205,28213,28346,28354,28355,28408,28438,28805,29513,29514,29515,29522,29524,29532,29533,29556,29557,29559,29561,29568,29574,29576,29577,29582,29607,29619,29625,29627,29629,29633,29644,29646,29647,29661,29995,32018,32021,32022) and not deleted) <> 101 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
