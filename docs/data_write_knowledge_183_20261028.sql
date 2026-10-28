-- 知识点 183 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_183
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_183 as
select * from t_knowledge_point where id in (22388,22401,22715,22814,22850,23221,23586,23648,23814,23815,24100,24158,24163,24205,24206,24207,24211,24214,24220,24221,24223,25632,26042,26857,27048,27400,27693,28024,28229,29136,29993,29994,30018,30019,30020,30021,30022,30023,30024,30030,30032,30037,30039,30040,30041,30108);

update t_knowledge_point set title = $kp$iOS 核心操作系统层（Core OS）$kp$, content = $kp$核心操作系统层（Core OS）位于 iOS 系统架构的最底层，包括内存管理、文件系统、电源管理以及一些其他的操作系统任务，可以直接与硬件设备交互。

Windows Phone 是微软发布的手机操作系统，将 Xbox Live 游戏、Xbox Music 音乐与独特的视频体验集成到手机中。Windows Phone 7 基于 Windows Embedded CE 内核，Windows Phone 8 基于 Windows NT 内核；其系统架构分为应用层、系统层、内核层和硬件层。

Symbian（塞班）是实时性、多任务的纯 32 位操作系统，具有功耗低、内存占用少等特点，适合手机等移动设备使用，经过不断完善可支持 GPRS、蓝牙、SyncML 及 3G 技术。Symbian 已被诺基亚并购，并以开放源代码的形式发布。$kp$, section = '' where id = 22388;
update t_knowledge_point set title = $kp$HTML5 的新特性$kp$, content = $kp$相比 HTML4，HTML5 的主要新特性：

- 支持 WebGL、拖曳、离线应用和桌面提醒，大大增强了浏览器的用户体验。
- 支持地理位置定位，更适合移动应用开发。
- 支持浏览器端的本地存储与本地数据库，加快页面响应。
- 使用语义化标签，标签结构更清晰，且利于 SEO。
- 摆脱对 Flash 等插件的依赖，使用浏览器的原生接口。
- 使用 CSS3，减少页面对图片的使用。
- 兼容手机、平板电脑等不同尺寸、不同浏览器的浏览。

HTML5 手机应用的优势是可以在网页上直接调试和修改，开发人员无需反复编码、调试和运行，因此许多手机杂志客户端基于 HTML5 标准开发，便于轻松调试修改。

Android 是 Google 与开放手机联盟合作开发的、基于 Linux 平台的开源手机操作系统。2013 年 9 月 24 日 Android 迎来 5 岁生日，当时全世界采用该系统的设备数量已达 10 亿台。$kp$, section = '' where id = 22401;
update t_knowledge_point set title = $kp$Android 核心服务层$kp$, content = $kp$核心服务层为应用提供所需的基础系统服务，如账户（Accounts）框架、广告框架、数据存储框架、网络连接框架、地理位置框架、运动框架等。$kp$, section = '' where id = 22715;
update t_knowledge_point set title = $kp$HTML5 概述$kp$, content = $kp$HTML5 在原有 HTML 基础上扩展了 API，使 Web 应用成为 RIA（Rich Internet Applications，富互联网应用），具有高度互动性、丰富用户体验以及功能强大的客户端特性。

广义上，HTML5 指包括 HTML、CSS 和 JavaScript 在内的一套技术组合。其目标是减少浏览器对插件式富网络应用服务（RIA）的依赖，如 Adobe Flash、Microsoft Silverlight 与 Oracle JavaFX，并提供更多能有效增强网络应用的标准集。

HTML5 的设计目的是在移动设备上支持多媒体，推动浏览器厂商使 Web 开发能够跨平台、跨设备。$kp$, section = '' where id = 22814;
update t_knowledge_point set title = $kp$Web 2.0 的含义$kp$, content = $kp$Web 2.0 严格来说不是一种技术。相对于 Web 1.0，它有明显特征：每个人既是内容的生产者也是获取者、信息个性化定制的自由度高、网页技术不同、长尾效应明显。

Web 2.0 技术主要包括博客（Blog）、RSS、百科全书（Wiki）、网摘、社会网络（SNS）、P2P、即时信息（IM）等。

Web 1.0 是别人的网站，Web 2.0 是朋友的网站，Web 3.0 是你我的网站。$kp$, section = '' where id = 22850;
update t_knowledge_point set title = $kp$Android 媒体层（Media）$kp$, content = $kp$媒体层支持在应用程序中使用各种媒体文件，进行音频与视频的录制、图形绘制以及制作基础的动画效果。$kp$, section = '' where id = 23221;
update t_knowledge_point set title = $kp$NFC 手机作为被读设备（卡模拟）$kp$, content = $kp$在该应用模式中，NFC 识读设备从具备 TAG 功能的 NFC 手机中采集数据，再通过无线网络将数据送到应用处理系统进行处理。$kp$, section = '' where id = 23586;
update t_knowledge_point set title = $kp$NFC 手机之间的点对点通信$kp$, content = $kp$与红外线传输类似，可用于数据交换，但传输距离较短、连接建立速度快、传输速度较快且功耗低。将两个具备 NFC 功能的设备连接，即可实现点对点数据传输。$kp$, section = '' where id = 23648;
update t_knowledge_point set title = $kp$NFC 发展概述$kp$, content = $kp$NFC 英文全称 Near Field Communication，即近场通信技术。NFC 脱胎于无线设备间的“非接触式射频识别”（RFID）及互联技术，为消费性电子产品提供了便利的通讯方式。

NFC 在数厘米（通常 15cm 以内）的距离、13.56MHz 频率范围内运作，通过射频信号自动识别目标对象并获取相关数据，识别过程无需人工干预。任意两个设备（如移动电话）接近时无需线缆插接即可相互通信，满足无线设备间的信息交换、内容访问与服务交换。$kp$, section = '' where id = 23814;
update t_knowledge_point set title = $kp$NFC 技术应用$kp$, content = $kp$NFC 采用双向的识别和连接，NFC 手机具有三种应用模式：

1. NFC 手机作为识读设备（读写器）。
2. NFC 手机作为被读设备（卡模拟）。
3. NFC 手机之间的点对点通信。$kp$, section = '' where id = 23815;
update t_knowledge_point set title = $kp$NFC 与蓝牙、红外的比较$kp$, content = $kp$| 项目 | NFC | 蓝牙 | 红外 |
| --- | --- | --- | --- |
| 网络类型 | 点对点 | 单点对多点（WPAN） | 点对点 |
| 频率 | 13.56 MHz | 2.4–2.5 GHz | 红外波段 |
| 使用距离 | < 0.2 m | 约 10 m，低能耗模式约 1 m | ≤ 1 m |
| 速度 | 106、212、424 kbps，规划速率可达 1 Mbps 左右 | 2.1 Mbps，低能耗模式约 1 Mbps | 约 1.0 Mbps |
| 建立时间 | < 0.1 s | 6 s，低能耗模式 1 s | 0.5 s |
| 安全性 | 具备，硬件实现 | 具备，软件实现 | 不具备，使用 IRFM 时除外 |$kp$, section = '' where id = 24100;
update t_knowledge_point set title = $kp$NFC 的定义与工作方式$kp$, content = $kp$NFC 英文全称 Near Field Communication，即近场通信技术。NFC 脱胎于无线设备间的“非接触式射频识别”（RFID）及互联技术，为消费性电子产品提供了便利的通讯方式。与 RFID 不同，NFC 采用双向的识别和连接。

NFC 工作频率为 13.56MHz，工作距离在 20cm 以内（通常为数厘米）。它通过射频信号自动识别目标对象并获取相关数据，识别过程无需人工干预；两个设备接近时无需线缆插接即可通信，实现信息交换、内容访问与服务交换。$kp$, section = '' where id = 24158;
update t_knowledge_point set title = $kp$NFC 的技术特点$kp$, content = $kp$| 项目 | NFC | 蓝牙 | 红外 |
| --- | --- | --- | --- |
| 通信模式 | 主动-主动/被动 | 主动-主动 | 主动-主动 |
| RFID 兼容 | ISO 18000-3 | 无 | 无 |
| 标准化机构 | ISO/IEC | Bluetooth SIG | IrDA |
| 网络标准 | ISO 13157 等 | IEEE 802.15.1 | IrDA 1.1 |
| 加密 | 不支持 RFID 加密 | 支持 | 支持 |
| 成本 | 低 | 中 | 低 |$kp$, section = '' where id = 24163;
update t_knowledge_point set title = $kp$iOS 触摸层（Cocoa Touch）$kp$, content = $kp$触摸层为应用程序开发提供各种常用框架，大部分框架与界面有关，本质上负责用户在 iOS 设备上的触摸交互操作。$kp$, section = '' where id = 24205;
update t_knowledge_point set title = $kp$DVD 光盘容量规格$kp$, content = $kp$- 单面单层：120mm 盘 4.7GB，80mm 盘 1.46GB。
- 单面双层：120mm 盘 8.5GB，80mm 盘 2.66GB。
- 双面单层：120mm 盘 9.4GB，80mm 盘 2.92GB。
- 双面双层：120mm 盘 17GB，80mm 盘 5.32GB。$kp$, section = '' where id = 24206;
update t_knowledge_point set title = $kp$802.11a/b/g/n 的工作频段$kp$, content = $kp$| 标准 | 802.11a | 802.11b | 802.11g | 802.11n |
| --- | --- | --- | --- | --- |
| 频段 | 5GHz | 2.4GHz | 2.4GHz | 2.4GHz 或 5GHz |$kp$, section = '' where id = 24207;
update t_knowledge_point set title = $kp$SOA 的核心要素$kp$, content = $kp$SOA 的目标是实现灵活可变的 IT 系统，主要通过标准化封装、复用、粗粒度和松耦合的服务架构等途径实现。$kp$, section = '' where id = 24211;
update t_knowledge_point set title = $kp$移动互联网的关键技术范围$kp$, content = $kp$移动互联网的关键技术包括 SOA、Web 2.0、HTML5、Android、iOS、Windows Phone。其中 Android 是一种基于 Linux 的自由及开放源代码操作系统，主要用于智能手机和平板电脑等移动设备。$kp$, section = '' where id = 24214;
update t_knowledge_point set title = $kp$操作系统为 APP 开发提供高效平台$kp$, content = $kp$操作系统为应用程序开发提供高效率的平台，此外还能处理软硬件错误、监控系统性能、保护系统安全等。$kp$, section = '' where id = 24220;
update t_knowledge_point set title = $kp$A-GPS（辅助 GPS）$kp$, content = $kp$A-GPS（Assisted GPS）通过移动通信基站及后台的位置服务器快速帮助终端设备定位，以提高 GPS 卫星定位系统的性能。$kp$, section = '' where id = 24221;
update t_knowledge_point set title = $kp$Android 系统架构$kp$, content = $kp$Android 系统采用分层架构，自上而下分为四层：应用程序层、应用程序框架层、系统运行库层（含 Android 运行时）和 Linux 内核层。

- 应用程序层：包含 Home、联系人、电话、浏览器等应用。
- 应用程序框架层：提供活动管理、窗口管理、内容提供者、视图系统、通知管理、包管理、电话管理、资源管理、位置管理、XMPP 服务等。
- 系统运行库层：包括 Surface 管理、媒体框架、SQLite、OpenGL ES、FreeType、WebKit、SGL、SSL、libc 等库，以及 Android 运行时。
- Linux 内核层：包括显示、摄像头、蓝牙、闪存、Binder（IPC）、USB、键盘、WiFi、音频、电源管理等驱动。$kp$, section = '' where id = 24223;
update t_knowledge_point set title = $kp$SOA 与 Web Service$kp$, content = $kp$移动互联网技术体系主要涵盖六大技术产业领域：关键应用服务平台、网络平台技术、移动智能终端软件平台技术、移动智能终端硬件平台技术、移动智能终端原材料元器件技术和移动安全控制技术。Web 2.0、HTML5、Android、iOS 等是其中的关键技术，SOA 与 XML 是重要支撑。

一、SOA（面向服务架构）

（1）SOA 是一个组件模型，它将应用程序的不同功能单元（称为服务）进行拆分，并通过这些服务之间定义良好的接口和协议联系起来。SOA 服务具备消除边界和技术差异的能力，带来灵活可定制的架构，同时也带来大量安全挑战。
（2）接口采用中立的方式定义，独立于实现服务的硬件平台、操作系统和编程语言。
（3）SOA 是一种粗粒度、松耦合的服务架构，服务之间通过简单、精确定义的接口进行通讯，不涉及底层编程接口和通讯模型。
（4）Web Service 是目前实现 SOA 的主要技术，是平台独立、低耦合、自包含、基于可编程 Web 的应用程序，可使用开放的 XML 标准来描述、发布、发现、协调和配置，用于开发分布式的互操作应用程序。

二、Web Service

Web Service 技术使运行在不同机器上的不同应用无需借助附加的专门第三方软件或硬件即可相互交换数据或集成；依据 Web Service 规范实施的应用，无论所用语言、平台或内部协议如何，都能相互交换数据。

典型技术包括：

- SOAP（Simple Object Access Protocol，简单对象访问协议）：用于传递信息，是交换 XML 编码信息的轻量级协议。
- WSDL（Web Service Description Language，Web 服务描述语言）：用于描述服务，以机器可阅读的、基于 XML 的方式描述 Web Service 及其函数、参数和返回值。
- UDDI（Universal Description Discovery and Integration，统一描述、发现与集成）：用于 Web 服务的注册，是一套基于 Web（XML）的分布式信息注册中心实现标准规范，使企业能注册自身提供的 Web Service，便于其他企业发现。
- XML（可扩展标记语言）：用于数据交换，是 Web Service 平台中表示数据的基本格式，既与平台无关，又与厂商无关。

Web Service 定义了一种松散的、粗粒度的分布式计算模式：提供者用 WSDL 描述服务，使用者通过 UDDI 发现服务，两者之间采用 SOAP 协议通信，并使用标准 HTTP(S) 协议传送 XML 表示及封装的内容，主要目标是跨平台的互操作性。

三、适合使用 Web Service 的情况

① 跨越防火墙：客户端与服务器之间通常有防火墙或代理服务器，通过 Web 服务访问服务器端逻辑和数据可规避防火墙阻挡。
② 应用程序集成：企业需要集成不同语言编写、在不同平台上运行的各种程序时，Web 服务可用标准方法提供功能和数据供其他应用使用。
③ B2B 集成：跨公司业务集成中，通过 Web 服务将关键商务应用提供给指定的合作伙伴和客户，易于解决互操作问题。
④ 软件重用：Web 服务允许在重用代码的同时重用代码层面的数据，可动态获取当前数据信息，也可通过集成各种应用的功能为用户提供统一界面。

四、不适合使用 Web Service 的情况

Web 服务在某些情况下会降低应用程序性能，以下两类程序不宜使用：

① 单机应用程序：只与本地机器上的其他程序通信的桌面应用程序，使用本地 API 即可。
② 局域网上的同构应用程序：使用同一种语言开发、运行在相同平台的同一局域网中的程序，通过 TCP 等协议调用更有效。

五、SOA 的基本特性

- 服务自治：服务相对独立，不依赖其他服务。
- 依赖开放的标准：不同厂商可以相互操作。
- 支持跨平台：例如 Java 应用能够调用 .NET 平台暴露的服务接口。
- 组合和复用：小粒度功能实现的服务成为原子服务，多个原子服务可通过合理组合编排成新的聚合型服务。
- 松耦合：SOA 通过契约实现客户端对服务的调用，双方只需采用能够匹配的契约即可保证正常交往。$kp$, section = '' where id = 25632;
update t_knowledge_point set title = $kp$电磁波频谱与无线通信应用$kp$, content = $kp$电磁波按频率从低到高可分为中波、短波、超短波、微波、红外线、可见光、紫外线等。不同传输介质和应用占用不同频段：双绞线、同轴电缆用于有线传输；AM 广播使用中波，FM 广播和电视使用超短波，手机、无线 LAN、地面微波、卫星通信使用微波等频段。

例如：GSM 手机 900MHz，4G 手机 1.8–2.7GHz，WiFi 2.4GHz 和 5GHz。$kp$, section = '' where id = 26042;
update t_knowledge_point set title = $kp$Android 系统运行库$kp$, content = $kp$Android 包含一些 C/C++ 库，可被系统中不同的组件使用，并通过 Android 应用程序框架为开发者提供服务。$kp$, section = '' where id = 26857;
update t_knowledge_point set title = $kp$Android 应用程序框架$kp$, content = $kp$开发人员可以完全访问核心应用程序所使用的 API 框架。该框架简化了组件的重用：任何一个应用程序都可以发布它的功能块，其他应用程序在遵循框架安全性的前提下也可以使用这些功能块；这种重用机制也使用户可以方便地替换程序组件。$kp$, section = '' where id = 27048;
update t_knowledge_point set title = $kp$MPEG-4 AVC$kp$, content = $kp$MPEG-4 AVC 主要用于互联网或移动通信环境。$kp$, section = '' where id = 27400;
update t_knowledge_point set title = $kp$CD、DVD、蓝光光盘的容量$kp$, content = $kp$CD 光盘容量约为 650MB，单层 DVD 光盘容量约为 4.7GB，单层蓝光光盘容量为 25GB。$kp$, section = '' where id = 27693;
update t_knowledge_point set title = $kp$CPU 主频与字长$kp$, content = $kp$主频的单位是 Hz，如 i5 的主频为 2.5GHz。

字长是 CPU 一次能并行处理的二进制位数。$kp$, section = '' where id = 28024;
update t_knowledge_point set title = $kp$CD、DVD、蓝光光盘的容量$kp$, content = $kp$CD 光盘容量约为 650MB，单层 DVD 光盘容量约为 4.7GB，单层蓝光光盘容量为 25GB。$kp$, section = '' where id = 28229;
update t_knowledge_point set title = $kp$存储容量单位 TB$kp$, content = $kp$太字节（TB）：1TB = 2^40 字节 = 1024GB。$kp$, section = '' where id = 29136;
update t_knowledge_point set title = $kp$媒体访问 API（Media API）$kp$, content = $kp$麦克风和摄像头涉及用户隐私，因此浏览器会向用户申请访问权限。$kp$, section = '' where id = 29993;
update t_knowledge_point set title = $kp$iOS 触摸层$kp$, content = $kp$触摸层为应用程序开发提供各种常用框架，大部分框架与界面有关，本质上负责用户在 iOS 设备上的触摸交互操作。$kp$, section = '' where id = 29994;
update t_knowledge_point set title = $kp$宏定义末尾不能加分号$kp$, content = $kp$宏定义 #define PI 3.1415926 末尾不能出现分号；写成 #define PI 3.1415926; 是错误的。$kp$, section = '' where id = 30018;
update t_knowledge_point set title = $kp$算术运算符与整数除法$kp$, content = $kp$算术运算符包括 +、-、*、/、%。

“/”两边都是整型时，结果仍为整型，如 3/2 的结果是 1；只要有一边是小数，结果就是小数，如 3/2.0 的结果是 1.5。

“%”是求余运算，不是除号，且两边都必须是整数。$kp$, section = '' where id = 30019;
update t_knowledge_point set title = $kp$连续赋值$kp$, content = $kp$int x, y; x = y = 10; 定义完成后可以连续赋值。$kp$, section = '' where id = 30020;
update t_knowledge_point set title = $kp$复合赋值表达式$kp$, content = $kp$int a = 2; a *= 2 + 3; 运行完成后 a 的值是 10。复合赋值先把右侧整个表达式加上括号，即 a = a * (2 + 3)，再参与运算。$kp$, section = '' where id = 30021;
update t_knowledge_point set title = $kp$强制类型转换$kp$, content = $kp$强制类型转换写成 (int)a，不能写成 int(a)，类型上必须加括号。

(int)(a+b) 与 (int)a+b 不同：前者先把 a+b 的结果转型，后者只把 a 转型后再加 b。

常见的取整丢小数情况有三种：强制类型转换、整数除法、把浮点数赋给整型变量。$kp$, section = '' where id = 30022;
update t_knowledge_point set title = $kp$存储容量单位 TB$kp$, content = $kp$太字节（TB）：1TB = 2^40 字节 = 1024GB。$kp$, section = '' where id = 30023;
update t_knowledge_point set title = $kp$CD、DVD、BD 的激光与容量$kp$, content = $kp$| 种类 | 激光 | 容量 |
| --- | --- | --- |
| CD 盘 | 红外光 | 650MB |
| DVD | 红光 | 4.7GB |
| BD | 蓝光 | 25GB |$kp$, section = '' where id = 30024;
update t_knowledge_point set title = $kp$计算机辅助技术系统$kp$, content = $kp$计算机辅助技术系统包括：CAD（计算机辅助设计）、CAM（计算机辅助制造）、CAI（计算机辅助教学）、CAT（计算机辅助测试）、CAPP（计算机辅助工艺规划）、CNC（计算机数字控制）等。$kp$, section = '' where id = 30030;
update t_knowledge_point set title = $kp$CD、DVD 与蓝光光盘的容量$kp$, content = $kp$CD 盘容量约为 650MB，单层 DVD 盘容量约为 4.7GB，单层蓝光光碟容量为 25GB。光盘上只有一条螺旋形光道，用凹坑的边缘表示“1”，用凹坑内外的平坦部分表示“0”，激光束沿光道读取这些数字信息。$kp$, section = '' where id = 30032;
update t_knowledge_point set title = $kp$iOS 核心操作系统层及其框架$kp$, content = $kp$核心操作系统层包含大多数低级别、接近硬件的功能，它所包含的框架常常被其它框架所使用。Accelerate 框架包含数字信号、线性代数和图像处理的接口，针对所有 iOS 设备硬件之间的差异做优化，保证写一次代码即可在所有 iOS 设备上高效运行。CoreBluetooth 框架利用蓝牙与外设交互，包括扫描连接蓝牙设备、保存连接状态、断开连接、获取外设数据或向外设传输数据等。Security 框架提供管理证书、公钥和私钥的信任策略。iOS 系统架构自下而上分为 Core OS、Core Services、Media、Cocoa Touch 四层。$kp$, section = '' where id = 30037;
update t_knowledge_point set title = $kp$Android 开发的四大组件$kp$, content = $kp$Android 开发的四大组件分别是：活动（Activity），用于表现功能；服务（Service），在后台运行服务，不提供界面呈现；广播接收者（BroadcastReceiver），用于接收广播；内容提供者（ContentProvider），支持在多个应用中存储和读取数据，相当于数据库。$kp$, section = '' where id = 30039;
update t_knowledge_point set title = $kp$iOS 可触摸层（Cocoa Touch）$kp$, content = $kp$可触摸层为应用程序开发提供了各种有用的框架，并且大部分与用户界面有关，本质上它负责用户在 iOS 设备上的触摸交互操作。$kp$, section = '' where id = 30040;
update t_knowledge_point set title = $kp$iOS 核心操作系统层的功能$kp$, content = $kp$核心操作系统层包括内存管理、文件系统、电源管理以及一些其他的操作系统任务，它可以直接和硬件设备进行交互。$kp$, section = '' where id = 30041;
update t_knowledge_point set title = $kp$iOS 触控界面层的 UIKit 框架$kp$, content = $kp$触控界面层的 UIKit 是轻量级的 UI 框架，用于开发和创建前端 UI 界面，提供窗口、视图、控件以及触摸事件处理等能力，为应用程序开发提供各种有用的框架。$kp$, section = '' where id = 30108;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22388,22401,22715,22814,22850,23221,23586,23648,23814,23815,24100,24158,24163,24205,24206,24207,24211,24214,24220,24221,24223,25632,26042,26857,27048,27400,27693,28024,28229,29136,29993,29994,30018,30019,30020,30021,30022,30023,30024,30030,30032,30037,30039,30040,30041,30108) and not deleted) <> 46 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
