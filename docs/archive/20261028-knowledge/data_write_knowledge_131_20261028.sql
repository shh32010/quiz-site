-- 知识点 131 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_131
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_131 as
select * from t_knowledge_point where id in (22185,22712,22911,23166,23167,23168,23185,23191,23193,23205,23222,23223,23224,23242,23256,23268,23281,23291,23294,23306,23308,23311,23312,23314,23318,23320,23327,23335,23356,23368,23369,23370,23372,23374,23381,23407,23421,23422,23423,23424,23425,23434,23450,23456,23457,24229,24786,25275,25547,25548,25554,25639,25640,25710,25958,26009,26011,26188,26189,26369,26399,26402,26444,26517,26806,26807,26808,26809,26810,26811,26812,27024,27503,27504,27505,27506,27507,27508,27509,27510,27511,27524,27531,27567,27568,27569,27571,28214,28590,29538,29539,29542,29551,29552,29566,29567,29569,29572,29573,29575,29583,29591,29592,29597,29612,29613,29621,29622,29640,29643,29651,29659,29662);

update t_knowledge_point set title = $kp$数字摄像头$kp$, content = $kp$数字摄像头的分辨率一般为352×288～640×480，高清摄像头分辨率更高；帧速一般在30fps左右；镜头视角可达45～60度；支持USB或IEEE1394（火线）接口；成像器件采用CMOS或CCD。$kp$, section = '' where id = 22185;
update t_knowledge_point set title = $kp$数字电视$kp$, content = $kp$数字电视是电视技术与数字技术相结合的产物，它将电视信号数字化，然后以数字形式进行编辑、制作、传输、接收和播放。数字电视的传输途径多种多样，因特网性能的不断提高已使其成为数字电视传播的一种新途径。

数字电视接收设备有三种形式：专用的播放设备，如DVD播放机、MP4播放器等；传统模拟电视机外加一个数字机顶盒；连接因特网的PC机、平板电脑或手机等手持终端设备。$kp$, section = '' where id = 22712;
update t_knowledge_point set title = $kp$点播电视（VOD）$kp$, content = $kp$VOD（视频点播）指用户可以自己选择观看需要的电视节目，改变了电视台播什么用户只能看什么的被动收看模式。

VOD系统通常由视频服务器、节目制作中心、交换器、分配服务器、网络管理工作站、用户接入网和宽带广域网等组成，家庭用户和单位用户分别通过相应接入网连接。$kp$, section = '' where id = 22911;
update t_knowledge_point set title = $kp$MPEG-1$kp$, content = $kp$MPEG-1主要用于VCD、数码相机、数字摄像机等。$kp$, section = '' where id = 23166;
update t_knowledge_point set title = $kp$MPEG-1编码标准$kp$, content = $kp$MPEG-1是一种运动图像及其伴音的编码标准。码率为1.2～1.5Mb/s；图像质量约200多线，相当于一般家用录像机；应用于数码相机、数字摄像机和VCD。$kp$, section = '' where id = 23167;
update t_knowledge_point set title = $kp$VCD和DVD$kp$, content = $kp$DVD-Video的伴音可支持5.1声道（左、右、中、左环绕、右环绕和超重低音），足以实现三维环绕立体声音响效果。$kp$, section = '' where id = 23168;
update t_knowledge_point set title = $kp$电视基本知识$kp$, content = $kp$电视画面是一种光栅扫描图像，一般采用隔行扫描方式，即图像由奇数场和偶数场两部分组成，二者合起来构成一帧图像。

PAL制式（中国采用）：帧频25帧/s，场频50场/s；一帧图像的扫描线总数为625线，其中可见部分575线，不可见的回扫线50线；行频为625×25＝15.625kHz。

远距离传输时用亮度信号Y和两个色度信号U、V表示，优点是：能与黑白电视接收机保持兼容，Y分量由黑白电视机直接显示而无需进一步处理；可利用人眼对两个色度信号不太灵敏的视觉特性，节省电视信号的带宽和发射功率。$kp$, section = '' where id = 23185;
update t_knowledge_point set title = $kp$DVD视频播放软件$kp$, content = $kp$可以用来播放DVD视频的媒体播放软件包括Windows Media Player、RealPlayer和暴风影音（Storm Player）等。$kp$, section = '' where id = 23191;
update t_knowledge_point set title = $kp$高清与超高清视频标准$kp$, content = $kp$高清概念最早在广播电视领域提出，由美国电影电视工程师协会（SMPTE）等机构制定相关标准。720×480、640×480属于标清，1280×720属于高清，1920×1080属于全高清，3840×2160属于超高清。我国数字视频标准中，标清为720×576，高清为1920×1080，超高清为3840×2160。$kp$, section = '' where id = 23193;
update t_knowledge_point set title = $kp$HTML5的多媒体支持$kp$, content = $kp$HTML5的设计目标是在移动设备上支持多媒体，推动浏览器厂商使Web开发能够跨平台、跨设备支持。$kp$, section = '' where id = 23205;
update t_knowledge_point set title = $kp$MPEG-2音频编码$kp$, content = $kp$MPEG-2的声音压缩编码采用与MPEG-1相同的编解码器，层1、层2和层3的结构也相同，但能支持5.1声道和7.1声道的环绕立体声。$kp$, section = '' where id = 23222;
update t_knowledge_point set title = $kp$MPEG-2$kp$, content = $kp$MPEG-2主要应用于DVD、数字卫星电视转播和数字有线电视。$kp$, section = '' where id = 23223;
update t_knowledge_point set title = $kp$MPEG-2标准$kp$, content = $kp$MPEG-2针对数字电视（DTV）的应用要求，码率为1.5～60Mb/s甚至更高；通用性强，向下兼容MPEG-1；应用于数字卫星电视、高清晰度电视（HDTV）广播和数字视盘DVD。$kp$, section = '' where id = 23224;
update t_knowledge_point set title = $kp$视频信号的数字化$kp$, content = $kp$视频信号的数字化以一帧帧画面为单位进行。由于采用YUV彩色空间，人眼对颜色信号的敏感度远不如对亮度信号灵敏，因此色度信号的取样频率可以比亮度信号低，以减少数字视频的数据量。$kp$, section = '' where id = 23242;
update t_knowledge_point set title = $kp$MPEG-4$kp$, content = $kp$MPEG-4的目标是支持各种网络条件下（包括移动通信）的交互式多媒体应用，侧重于对多媒体信息内容的访问。

MPEG-4 ASP应用于低分辨率、低码率领域，如监控、IPTV、手机、MP4播放器等；MPEG-4 AVC已应用于HDTV、蓝光光盘、IPTV、Xbox、iPad、iPod、iPhone等领域。$kp$, section = '' where id = 23256;
update t_knowledge_point set title = $kp$视频卡$kp$, content = $kp$视频采集卡简称视频卡，是PC机中用于视频信号数字化的插卡。

其功能是：将模拟视频信号（及伴音信号）数字化并存储在硬盘中；数字化后的视频图像经彩色空间转换（从YUV转换为RGB），与图形显示卡产生的图像叠加后显示在屏幕上；获取数字视频的同时，使用数字信号处理器（DSP）对音频和视频数据进行压缩编码。$kp$, section = '' where id = 23268;
update t_knowledge_point set title = $kp$数字视频及应用$kp$, content = $kp$视频（video）指内容随时间变化的一个图像序列，也称为活动图像（motion picture）。常见的视频有电视和计算机动画。电视能传输和再现真实世界的图像与声音，是当代最有影响力的信息传播工具；数字视频是数字化的电视信号；计算机动画是计算机制作的图像序列，是一种计算机合成的视频。$kp$, section = '' where id = 23281;
update t_knowledge_point set title = $kp$点播电视（VOD）$kp$, content = $kp$VOD是视频点播（也称为点播电视）技术的简称，用户可以根据自己的需要选择电视节目。VOD技术从根本上改变了用户只能被动收看电视的状况。

目前在因特网上支持视频直播或视频点播，一般采用流媒体技术。$kp$, section = '' where id = 23291;
update t_knowledge_point set title = $kp$视频获取设备$kp$, content = $kp$数字摄像头是在线获取数字视频的设备，通过光学镜头采集图像，然后直接将图像转换成数字信号并输入PC机，不需要视频采集卡进行模数转换。

数字摄像机是一种离线的数字视频获取设备。$kp$, section = '' where id = 23294;
update t_knowledge_point set title = $kp$数字视频基础$kp$, content = $kp$基本概念

- 视频（video）：内容随时间变化的一个图像序列，也称为活动图像（motion picture）。
- 常见的视频有电视和计算机动画。
- 电视：能传输和再现真实世界的图像与声音，是当代最有影响力的信息传播工具。
- 数字视频：数字化的电视信号。
- 计算机动画：计算机制作的图像序列，是一种计算机合成的视频。

电视基本知识

- 电视画面是一种光栅扫描图像，一般采用隔行扫描方式，即图像由奇数场和偶数场两部分组成，二者合起来构成一帧图像。
- PAL制式（中国采用）：帧频25帧/s，场频50场/s；一帧图像的扫描线总数为625线，可见部分575线，不可见回扫线50线；行频为625×25＝15.625kHz。
- 远距离传输时用亮度信号Y和两个色度信号U、V表示。优点是：能与黑白电视接收机保持兼容，Y分量由黑白电视机直接显示而无需进一步处理；可利用人眼对两个色度信号不太灵敏的视觉特性，节省电视信号的带宽和发射功率。
- 彩色信号YUV与RGB的转换：Y＝0.3R＋0.59G＋0.11B；U＝0.493（B－Y）；V＝0.877（R－Y）。$kp$, section = '' where id = 23306;
update t_knowledge_point set title = $kp$数字视频的压缩编码$kp$, content = $kp$数字视频的数据量很大，1分钟CCIR601数字视频的数据量约为1GB。

数字视频压缩是可行的，原因包括：画面内部信息相关性很强；相邻画面的内容具有高度连贯性；人眼的视觉特性允许画面有一定失真。$kp$, section = '' where id = 23308;
update t_knowledge_point set title = $kp$数字视频的编辑$kp$, content = $kp$非线性编辑系统

- 非线性编辑系统是摆脱磁带顺序存取束缚的计算机视频编辑系统，节目制作在大容量随机存取磁盘存储器上进行，效率大幅提高。
- 系统组成：计算机主机、视（音）频卡、SCSI硬盘、视频编辑软件、控制装置。
- 使用方式：把电视节目素材存入硬盘，根据需要对不同长短、不同顺序的素材进行剪辑，同时配上字幕、特技和动画，再进行配音、配乐，最终制作高质量的电视节目。
- 功能：视频处理以及数字特技、字幕、编辑、调音等。
- 核心软件：数字视频编辑器，如Adobe Premiere。

虚拟演播室

- 虚拟演播室利用计算机生成运动或静止的三维场景，与现场拍摄的视频图像实时合成。现场直播时，三维场景可不断变化更换，并根据演播室摄像机运动的位置显示正确的透视图，使合成图像取得真实视觉效果。
- 组成：摄像机、摄像机位置参数分析与控制、图形工作站、背景素材库和图像合成设备等。$kp$, section = '' where id = 23311;
update t_knowledge_point set title = $kp$计算机动画$kp$, content = $kp$计算机动画是采用计算机生成一系列可供实时演播的连续画面的技术，其基础是计算机图形学。制作过程：在计算机中生成场景和形体的模型→设置它们的运动→生成图像并转换为视频信号输出。

创作软件：二维动画软件如Animator Pro，三维动画软件如3D Studio MAX等。

三维动画的制作步骤：按照动画脚本对景物进行造型；确定景物颜色；设置灯光和布置摄像机位置；描述和设置动画运动要求；绘制图像；输出动画结果。$kp$, section = '' where id = 23312;
update t_knowledge_point set title = $kp$数字视频的应用$kp$, content = $kp$MPEG-1与VCD

- CD（Compact Disc）是小型光盘，最早应用于数字音响领域，代表产品是CD唱片。每张CD唱片存储容量约650MB，可存放1小时立体声高保真音乐。
- VCD（Video CD）是1994年由JVC、Philips等公司联合定义的、以数字技术在CD光盘上存储视频和音频信息的规范。它规定了将MPEG-1音视频数据记录在CD光盘上的文件系统标准，使一张普通CD光盘可记录约60分钟音视频数据，图像质量达到家用录像机水平，可播放立体声。VCD播放机体积小、价格便宜、音视频质量较好。VCD的派生产品Karaoke CD与VCD保持兼容。

MPEG-2与DVD

- DVD（Digital Versatile Disk）是数字多用途光盘，有多种规格，用途广泛。DVD-Video（日常简称DVD）是一种类似于LD或Video CD的家用影碟。
- 与VCD相比，DVD存储容量大得多：CD光盘容量650MB，可存放74分钟VHS质量（352×240）的视频图像；单面单层DVD容量4.7GB，以平均码率4.69Mb/s播放视频，能存放133分钟接近于广播级图像质量（720×480）的整部电影。
- DVD采用MPEG-2压缩编码，画面品质比VCD高。
- DVD-Video可提供32种文字或卡拉OK字幕，最多可录放8种语言的声音；具有多结局、多角度（可从9个角度选择观看图像）、变焦和家长锁定控制等功能；画面长宽比有全景扫描、4:3普通屏幕、16:9宽屏幕三种方式；伴音具有5.1声道（左、右、中、左环绕、右环绕和超重低音），可实现三维环绕立体声效果。

数字电视

- 数字电视是将电视信号数字化，然后以数字形式进行编辑、制作、传输、接收和播放。
- 特点：频道利用率高、图像清晰度好；可开展交互式数据业务，包括电视购物、电视银行、电视商务、电视通信、电视游戏、实时点播电视、电视网上游览、观众参与的电视竞赛等。
- 数字电视系统由信源编码、业务复用、信道传输与发送构成。
- 美国DTV、欧洲DVB和日本ISDB标准中，信源编码的视频都采用MPEG-2，音频采用MPEG-2或Dolby AC-3；业务复用采用MPEG-2系统层规范或其扩展形式；信道及发送部分各不相同。
- 数字电视接收机有三种形式：数字电视接收机（传统模拟电视接收机的换代产品）；传统模拟电视机外加数字机顶盒；可以接收数字电视的PC机。

点播电视（VOD）

- VOD（Video On Demand）是视频点播（也称点播电视）技术的简称，用户可以根据自己的需要收看电视节目。
- TVOD（True VOD）：用户提出要求即可及时从VOD系统得到服务，为每个用户提供单独连接，每个连接占用一定网络带宽。
- NVOD（Near VOD）：准视频点播，系统每隔一段时间（例如10分钟）在不同的频道上播放同一个节目，用户可选择收看。其特点是播放切换；缺点是不能及时提供点播服务；优点是减少用户连接数目、节省网络带宽与费用、降低服务器性能要求。
- VOD系统由视频服务器、节目制作中心、交换器、分配服务器、网络管理工作站、用户接入网等组成。$kp$, section = '' where id = 23314;
update t_knowledge_point set title = $kp$视频输出与无线投屏$kp$, content = $kp$除电脑专用的LCD显示器外，液晶电视机也可作为电脑和手机的外接显示器。通过电脑的VGA、DVI或HDMI接口与电视机连接，或者通过无线局域网（WiFi）借助DLNA、Miracast等技术，就可以将电脑或智能手机的图像和声音传至电视机和投影机输出。

- VGA：过去使用较多，模拟接口。
- DVI：现在使用较多，数字接口。
- HDMI：全高清多媒体接口，可同时传送未经压缩的数字视频和多声道音频信号。
- DLNA：数字生活网络联盟提出的标准，旨在解决个人电脑、消费电器、移动设备等无线和有线网络的互联互通，使数字媒体和内容服务能够共享。
- Miracast：由Wi-Fi联盟于2012年制定、以Wi-Fi直连（Wi-Fi Direct）为基础的无线显示标准。支持该标准的设备可通过无线方式分享视频画面，例如手机可将视频或照片直接在电视或其他设备上播放，无需连接线，也无需经过无线热点（AP）。$kp$, section = '' where id = 23318;
update t_knowledge_point set title = $kp$常见音视频格式$kp$, content = $kp$MP3属于音频文件格式。MP4是一套用于音频、视频信息的压缩编码标准。AVI即音频视频交错格式，AVI文件将音频和视频数据包含在一个文件容器中，允许音频同步回放。MPG是按照MPEG标准压缩的视频图像文件格式。$kp$, section = '' where id = 23320;
update t_knowledge_point set title = $kp$点播电视（VOD）$kp$, content = $kp$VOD（Video On Demand）是视频点播（也称点播电视）技术的简称，用户可以根据自己的需要收看电视节目。$kp$, section = '' where id = 23327;
update t_knowledge_point set title = $kp$流媒体技术$kp$, content = $kp$流媒体技术是指在数据网络上按时间先后次序传输和播放连续音视频数据流的技术，具有连续性、实时性和时序性的特点。主要应用于视频点播（VOD）、视频广播、视频监视、视频会议、远程教学、交互式游戏等。$kp$, section = '' where id = 23335;
update t_knowledge_point set title = $kp$VCD与DVD的比较$kp$, content = $kp$| 项目 | VCD | DVD |
| --- | --- | --- |
| 视频压缩编码标准 | MPEG-1 Video，图像分辨率352×240（家用电视质量） | MPEG-2 Video，图像分辨率720×480（广播级电视图像质量） |
| 音频压缩编码标准 | MPEG-1 Audio层2，支持双声道立体声 | MPEG-2 Audio或杜比AC-3，支持5.1声道三维环绕立体声 |
| 光盘存储容量 | 约650MB | 有多种规格，单面单层4.7GB，单面双层8.5GB |
| 播放时间 | 约1小时 | 单面单层约2小时 |
| 其他功能 | 较少 | 支持多种字幕、多种语言声音、多种视角、多种宽高比等 |$kp$, section = '' where id = 23356;
update t_knowledge_point set title = $kp$互联网动画：GIF和Flash$kp$, content = $kp$GIF动画将多幅图像按一定顺序循环显示，形成动画效果。

Flash动画由Adobe（原Macromedia）公司开发：

- 支持矢量图形，也支持位图图像，文件较小；
- 画面大小可任意调节，支持用户交互；
- 既可生成可自动执行文件（*.exe），也可生成用Flash播放器播放的文件（*.swf）；
- 既可做成单独的动画，也可嵌入网页文件；
- 采用流式传输方式，可以边下载边播放。$kp$, section = '' where id = 23368;
update t_knowledge_point set title = $kp$MPEG-4 ASP与MPEG-4 AVC$kp$, content = $kp$MPEG-4是数字音视频压缩编码的国际标准，分为23个部分，其中Part 2和Part 10是视频编码。为适应不同应用对视频图像大小和质量的要求，每种视频编码标准都分成若干Level和Profile。

MPEG-4 Part 2分成21个Profile，ASP（Advanced Simple Profile）是其中之一，技术特点是画面分辨率较低，最低码率仅64kb/s左右，但画面质量好、复杂度中等。

MPEG-4 Part 10又称为MPEG-4 AVC（Advanced Video Coding），是目前技术最先进的视频编码方案之一，分成7个Profile，可用于HDTV。$kp$, section = '' where id = 23369;
update t_knowledge_point set title = $kp$流媒体$kp$, content = $kp$在因特网上收听（看）音视频节目有两种方式：

- 下载存储方式：先下载存储在计算机中，下载完毕后再播放。缺点是需等待较长时间，并需较大的存储容量。
- 流式传输方式：边下载、边播放。只需下载一部分数据后即可开始播放，同时继续下载，等待时间短、存储需求小。

流媒体是一种允许用户在网络上一边下载一边收看（听）音视频媒体的媒体分发（delivery）技术。例如Real Networks公司的Real Media（RealAudio和RealVideo）、微软公司的Windows Media Services（WMA、WMV和ASF）、苹果公司的QuickTime。$kp$, section = '' where id = 23370;
update t_knowledge_point set title = $kp$视频的基本概念$kp$, content = $kp$视频（video）泛指内容随时间变化的图像序列，又叫运动图像或活动图像（motion picture）。常见的视频有电视、电影、动画等。

视频的特点：内容随时间变化；伴随有与画面动作同步的声音（伴音）；人类接受的信息约70%来自视觉，其中活动图像是信息量最丰富、直观、生动、具体的一种承载信息的媒体。视频信息的处理是多媒体技术的核心。

| 名称 | 图像格式 | 主要应用 |
| --- | --- | --- |
| MPEG-1 | 352×288 | VCD、数码相机、数字摄像机等 |
| MPEG-2（MP@ML） | 720×576 | 用途最广，如DVD、卫星电视直播、数字有线电视等 |
| MPEG-4 ASP | 分辨率较低的视频格式 | 低分辨率、低码率领域，如监控、IPTV、手机、MP4播放器等 |
| MPEG-4 AVC | 多种不同的视频格式 | HDTV、蓝光光盘、IPTV、Xbox、iPod、iPhone等 |$kp$, section = '' where id = 23372;
update t_knowledge_point set title = $kp$计算机动画$kp$, content = $kp$计算机动画是使用计算机生成一系列内容连续的画面供实时演播的技术，它是一种计算机合成的数字视频，而不是用摄像机拍摄的“自然视频”。

20世纪90年代开始，计算机动画技术应用于电影特技，如电影《侏罗纪公园》《玩具总动员》《泰坦尼克号》等，取得轰动效应。

应用领域：影视和广告（电影特技、动画片、电视广告制作等）；教育和培训（辅助教学、驾驶员训练等）；科技（科学计算可视化、复杂系统动态模拟）；军事（军事训练、作战模拟等）；游戏。$kp$, section = '' where id = 23374;
update t_knowledge_point set title = $kp$动画制作软件$kp$, content = $kp$著名的造型与动画制作商品化软件包括：

- 加拿大Alias公司的PowerAnimator；
- 法国TDI公司的Explore；
- 荷兰ElectroGIG公司的3DGO；
- 加拿大Vertigo公司的Vertigo；
- 美国Wavefront公司的Advanced Visualizer；
- Alias|Wavefront公司的MAYA；
- 美国Autodesk公司（Discreet）的3ds max、Animator Studio。$kp$, section = '' where id = 23381;
update t_knowledge_point set title = $kp$使用数字视频的优点$kp$, content = $kp$数字视频易于使用计算机编辑、修改和处理；有利于存储和复制，复制不会产生失真；有利于传输（节省频率资源，抗干扰能力强）；可以通过计算机网络传输；用户接收的数字图像质量更好（可达演播室水平）；容易与其他媒体（声音、文字等）组合使用；便于管理和检索。$kp$, section = '' where id = 23407;
update t_knowledge_point set title = $kp$数字视频的优点与获取设备$kp$, content = $kp$数字视频与模拟视频相比具有以下优点：复制和传输时不会造成质量下降；容易进行编辑修改；有利于传输（抗干扰能力强，易于加密）；可节省频率资源。

视频信号的数字化

- 视频信号的数字化以一帧帧画面为单位进行。
- 由于采用YUV彩色空间，人眼对颜色信号的敏感度远不如对亮度信号灵敏，所以色度信号的取样频率可以比亮度信号低，以减少数字视频的数据量。
- 常用的色度信号取样格式：4:4:4，色度信号的取样与亮度信号完全一样；4:2:2，每条扫描线上色度信号的取样只是亮度信号的一半；4:2:0，在水平和垂直方向上色度信号的取样都只是亮度信号的一半。
- 常用视频图像格式包括CCIR601、CIF、QCIF和SQCIF，分辨率依次降低。

视频卡与视频获取设备

- 视频采集卡简称视频卡，是PC机中用于视频信号数字化的插卡。其功能是：将模拟视频信号（及伴音信号）数字化并存储在硬盘中；数字化后的视频图像经彩色空间转换（从YUV转换为RGB），与图形显示卡产生的图像叠加后显示在屏幕上；获取数字视频的同时使用数字信号处理器（DSP）进行音频和视频数据的压缩编码。
- 数字摄像头是在线获取数字视频的设备，通过光学镜头采集图像，然后直接将图像转换成数字信号输入PC机，不需视频采集卡进行模数转换。最高分辨率640×480，一般352×288；速度30帧/s以下；镜头视角45～60度；光传感器大多采用CCD，部分采用CMOS，后者分辨率不能很高，但功耗低、速度快；接口为USB或IEEE1394（火线）。
- 数字摄像机是一种离线的数字视频获取设备，原理与数码相机类似，功能更多；视频图像及伴音使用M-JPEG或MPEG-2压缩编码；记录介质为磁带、硬盘；接口为USB、IEEE1394。$kp$, section = '' where id = 23421;
update t_knowledge_point set title = $kp$数字视频信号的获取$kp$, content = $kp$视频信号的数字化过程与图像、声音的数字化过程相仿，但更复杂一些。

数字视频的获取设备包括：

- 视频采集卡（简称视频卡）；
- 数字摄像头：通过光学镜头和CCD或CMOS采集动态图像，转换成数字信号并输入PC机；
- 脱机获取设备：数码摄像机。$kp$, section = '' where id = 23422;
update t_knowledge_point set title = $kp$数字视频的主要参数$kp$, content = $kp$帧频（帧速率，frame rate）：每秒钟显示多少帧图像，单位是fps。
帧大小：每帧图像的分辨率，即图像宽度×图像高度，单位为像素。
颜色深度（像素深度）：图像中每个像素所使用的二进制位数，单位为bit。

例：持续时间为1小时的一段数字视频，假设帧大小为640×480，像素深度为24位，帧速率为25fps，则：

- 每帧像素数＝640×480＝307,200；
- 每帧数据量＝307,200×24＝7,372,800bit≈7.37Mbit；
- 视频流比特率＝7.37Mbit×25＝184.25Mb/s；
- 1小时视频数据量＝184.25Mb/s×3600s＝663,300Mbit≈663.3Gbit≈82.9GB。$kp$, section = '' where id = 23423;
update t_knowledge_point set title = $kp$数字视频的压缩编码$kp$, content = $kp$视频数据压缩的必要性：数字视频的数据量很大，1分钟数字电视图像未压缩时数据量可超过1GB，对存储、传输和处理都有很大困难。

视频数据压缩的可能性：视频信息的每个画面内部有很多信息冗余；相邻画面的内容有高度连贯性；人眼的视觉灵敏度有限，允许画面有一定失真。

结论：数字视频的数据量可压缩几十倍甚至几百倍。$kp$, section = '' where id = 23424;
update t_knowledge_point set title = $kp$数字视频编码标准的三大类别$kp$, content = $kp$数字视频编码标准按制定组织可分为三大类：

| 类别 | 标准（年代） |
| --- | --- |
| ITU-T | H.261（1984—1990）、H.263、H.263+、H.263++（1994—2001） |
| ITU-T/ISO/IEC 联合 | H.262/MPEG-2（1990—1994）、H.264/MPEG-4 AVC（1997—2003）、H.265/MPEG-H（2004 年后） |
| ISO/IEC | MPEG-1（1988—1993）、MPEG-4（1993—2000） |

此外还有公司标准：早期有 Intel 的 Indeo Video、苹果的 Cinepak；当前有 Real Networks 的 RealVideo、微软的 WMV、Google 的 VP8 与 VP9 等。$kp$, section = '' where id = 23425;
update t_knowledge_point set title = $kp$数码摄像机$kp$, content = $kp$数码摄像机的主要特点：

- 提供 480 线以上的分辨率，清晰度高
- 自动对焦、自动曝光
- 使用 MPEG-2 进行压缩编码，然后记录在存储卡或硬盘上
- 具有录音功能
- 数据量很大，采用 USB 接口或 IEEE1394 接口$kp$, section = '' where id = 23434;
update t_knowledge_point set title = $kp$目前流行的数字视频编码国际标准$kp$, content = $kp$| 名称 | 图像格式 | 压缩后的码率 | 主要应用 |
| --- | --- | --- | --- |
| MPEG-1 | 360×288 | 约 1.2～1.5 Mb/s | VCD、数码相机、数字摄像机等 |
| H.261 | 360×288 或 180×144 | P×64 kb/s（P=1、2 时只支持 180×144，P≥6 时可支持 360×288） | 视频通信，如可视电话、会议电视等 |
| MPEG-2（MP@ML） | 720×576 | 5～15 Mb/s | 用途最广，如 DVD、卫星电视直播、数字有线电视等 |
| MPEG-2 高清格式 | 1440×1152、1920×1152 | 80～100 Mb/s | 高清晰度电视（HDTV）领域 |
| MPEG-4 ASP | 分辨率较低的视频格式 | 与 MPEG-1、MPEG-2 相当，最低可达 64 kb/s | 低分辨率低码率领域，如监控、IPTV、手机、MP4 播放器等 |
| MPEG-4 AVC | 多种不同的视频格式 | 采用多种新技术，编码效率比 MPEG-4 ASP 显著提高 | HDTV、蓝光盘、IPTV、XBOX、iPod、iPhone 等 |$kp$, section = '' where id = 23450;
update t_knowledge_point set title = $kp$视频压缩编码标准及其应用$kp$, content = $kp$| 名称 | 源图像格式 | 压缩后的码率 | 主要应用 |
| --- | --- | --- | --- |
| MPEG-1 | CIF 格式 | 约 1.2～1.5 Mb/s | VCD、数码相机、数字摄像机等 |
| H.261 | CIF、QCIF 格式 | P×64 kb/s（P=1、2 时只支持 QCIF，P≥6 时可支持 CIF） | 视频通信，如可视电话、会议电视等 |
| MPEG-2（MP@ML） | 720×576 | 5～15 Mb/s | 用途最广，如 DVD、150 路卫星电视直播、540 路 CATV 等 |
| MPEG-2 High Profile | 1440×1152、1920×1152 | 80～100 Mb/s | 目标是高清晰度电视（HDTV）领域 |
| MPEG-4 | 多种不同的视频格式 | 与 MPEG-1、MPEG-2 相当，最低可达 64 kb/s | 交互式多媒体应用，如虚拟现实、远程教学、交互式电视等 |

- MPEG-1：运动图像及其伴音的编码标准。码率 1.2～1.5 Mb/s，图像质量 200 多线，相当于一般家用录像机；用于数码相机、数字摄像机和 VCD。
- MPEG-2：针对数字电视（DTV）的应用要求。码率 1.5～60 Mb/s 甚至更高，通用性强，向下兼容 MPEG-1；用于数字卫星电视、高清晰度电视（HDTV）广播、数字视盘 DVD。
- MPEG-4：目标是支持各种网络条件下（包括移动通信）的交互式多媒体应用，侧重于对多媒体信息内容的访问；支持自然的（取样）和计算机合成的视频与音频，功能强、应用前景广。
- H.261：由国际电联（ITU）前身 CCITT 制定的数字视频编码标准，适用于在 ISDN 网上以 p×64 kb/s（p=1～30）的速率开展视频会议和可视电话业务。
- AVI（Audio Video Interleaved Format）：一种音频/视频文件格式，在 Windows 平台的获取、编辑和播放软件中被广泛使用。对压缩方法没有限制，只需在文件中加以说明，可扩展性强，可使用 Microsoft RLE、Microsoft Video 1、Intel Indeo 5.1/5.2、Cinepak、MPEG、Motion-JPEG 等压缩算法；缺点是不适应在网络上对视频流的实时播放。
- ASF（Advanced Stream Format）：针对 AVI 文件网络实时播放的缺陷开发，采用 WM Video 8 和 WM Audio 8 流媒体技术；用于互联网视频直播（WebTV）、视频点播（VOD）、视频会议等。
- RealMedia（包括 RealVideo 和 RealAudio）：Real Networks 公司的流媒体技术，与微软流媒体技术相当，已在互联网上广泛应用。$kp$, section = '' where id = 23456;
update t_knowledge_point set title = $kp$计算机动画的制作过程$kp$, content = $kp$计算机动画制作包括：在计算机中建立景物的模型、描述它们的运动、生成一系列逼真的图像。$kp$, section = '' where id = 23457;
update t_knowledge_point set title = $kp$存储容量与传输速率的单位换算$kp$, content = $kp$存储容量（内存、文件，按二进制 2 的幂）：

- 1KB = 2^10 B = 1024 B
- 1MB = 2^20 B = 1024 KB
- 1GB = 2^30 B = 1024 MB
- 1TB = 2^40 B = 1024 GB
- 1PB = 2^50 B = 1024 TB
- 1EB = 2^60 B = 1024 PB

硬盘等厂商标注容量（按十进制 10 的幂）：

- 1KB = 10^3 B，1MB = 10^6 B，1GB = 10^9 B，1TB = 10^12 B

数据传输速率（b 表示比特，B 表示字节）：

- 1kb/s = 10^3 b/s
- 1Mb/s = 10^6 b/s = 1000 kb/s
- 1Gb/s = 10^9 b/s = 1000 Mb/s
- 1Tb/s = 10^12 b/s = 1000 Gb/s
- 1B/s = 8 b/s，即 1 b/s = 1/8 B/s$kp$, section = '' where id = 24229;
update t_knowledge_point set title = $kp$数字电视接收机的三种形式$kp$, content = $kp$数字电视接收机（DTV 接收机）是传统模拟电视接收机的换代产品，有三种形式：

1. 数字电视接收机（一体机）。
2. 传统模拟电视机外加一个数字机顶盒。
3. 可以接收数字电视的 PC 机。$kp$, section = '' where id = 24786;
update t_knowledge_point set title = $kp$数字视频及应用知识梳理$kp$, content = $kp$- 数字视频的压缩编码
  - ISO/IEC 国际标准 MPEG-1——VCD 光盘
  - ITU-T 与 ISO/IEC 联合标准 MPEG-2/H.262——数字卫星电视、数字有线电视、DVD 光盘
  - ITU-T 与 ISO/IEC 联合标准 MPEG-4 AVC/H.264——传输标准清晰度数字视频、微信视频、4K/8K UHDTV；另有 MPEG-4 ASP 与 HEVC/H.265（在线播放 1080P 全高清视频，高效视频编码）
- 数字视频的主要参数：帧率。视频里的一幅画称 1 帧，每秒钟显示多少帧图像称为帧速率或帧频，单位 fps
- 数字电视
  - 范围：高端为全高清晰度电视 HDTV（1920×1080）；中端为常规模拟电视数字化后的 DTV（720×576）；低端为互联网上的 IPTV
  - 优点：频道利用率高、抗干扰强、图像清晰度高、音响效果好（5.1 环绕）
- 数字视频的应用：VCD、DVD、可视电话和视频会议、数字电视、VOD 技术
  - VCD——容量 650MB，可存放 1 小时分辨率 352×240 的视频图像
  - DVD——单面单层容量 4.7GB，可存放 2 小时标准清晰度 720×576 的电影；伴音支持 5.1 声道（左、右、中、左环绕、右环绕和超重低音），足以实现三维环境立体音响效果
  - 可视电话和视频会议——如微信视频，采用 MPEG-4 AVC（H.264）标准
  - VOD 技术——基于电视的交互式数据业务（电视购物、电视银行、电视商务、电视游戏、点播电视）；因特网视频直播或视频点播；点播电视做到想看什么就看什么
- 补充：电视采用 PAL 制式，帧率 25fps；视频解压是从 YUV 到 RGB 的数据转换；数字电视信号需输入计算机进行存储和处理；流媒体采用流媒体技术，基于 C/S 模式$kp$, section = '' where id = 25275;
update t_knowledge_point set title = $kp$数字视频信号的获取过程$kp$, content = $kp$视频信号的数字化过程：先将 RGB 三基色转换为 Y、U、V（亮度和两个色差信号），经滤波后再分别作取样、量化和编码处理，得到数字视频的 Y、U、V 三个分量。

流程为：模拟视频信号（Y、U、V）→ 滤波 → 取样 → 量化（8～10 bit）→ 编码 → 数字视频的 Y、U、V 分量。$kp$, section = '' where id = 25547;
update t_knowledge_point set title = $kp$数字视频的获取设备$kp$, content = $kp$数字视频的获取设备主要有三类。

① 视频采集卡（简称视频卡）：将模拟视频信号数字化后输入计算机。

② 数字摄像头：通过光学镜头和 CCD（电荷耦合器件）或 CMOS（互补金属氧化物半导体）采集动态图像，转换成数字信号并输入 PC 机。

- 分辨率为 352×288～640×480，高清摄像头分辨率更高
- 速度一般在 30fps（每秒 30 帧）左右
- 镜头视角可达 45°～60°
- 支持 USB 接口或 IEEE1394（火线）接口
- 成像器件采用 CMOS 或 CCD

③ 脱机获取设备：智能手机（带摄像头）、数码相机、数码摄像机。

- 数码摄像机提供 480 线以上的分辨率，清晰度高
- 数码摄像机自动对焦、自动曝光
- 数码摄像机使用 MPEG-2 压缩编码，然后记录在存储卡或硬盘上
- 数码摄像机具有录音功能
- 数码摄像机数据量很大，采用 USB 接口或 IEEE1394 接口
- 数码相机的成像器件也是 CMOS 或 CCD$kp$, section = '' where id = 25548;
update t_knowledge_point set title = $kp$数字视频的应用：影碟、可视电话、数字电视与监控$kp$, content = $kp$（1）VCD、DVD 和蓝光

| 名称 | 光盘类型 | 光盘容量 | 视频 | 音频 | 说明 |
| --- | --- | --- | --- | --- | --- |
| VCD | CD | 650MB | 1 小时低清晰度视频（352×240） | 支持双声道立体声 | 已基本淘汰 |
| DVD 影碟 | DVD | 4.7GB（单层）、8.5GB（双层） | 2 小时标准清晰度视频（720×576） | 支持 5.1 声道环绕立体声 | 也应用于软件的发行 |
| 蓝光影碟 | BD | 25GB（单层）、50GB（双层） | 全高清、超高清和 8K 电影 | 同上 | 内容丰富，常包含特制菜单、评论、幕后花絮等 |

（2）可视电话和视频会议：① iPad/iPhone 的 FaceTime；② 微信的视频聊天；③ QQ 的视频聊天，使用 MPEG-4 AVC（H.264）标准。

（3）数字电视、IPTV：① 数字电视清晰度高，抗干扰能力强；② 在模拟电视机上安装一个数字机顶盒，可收看数字电视；③ IPTV 通过互联网传播数字电视（视频），模拟电视安装 IPTV 机顶盒后可观看该类节目，智能手机、平板电脑等终端通过视频网站或客户端也可收看。

（4）视频点播（VOD）：将电视的视频和音频压缩后存储在服务器的硬盘上，点播时将视频和音频解压后输出到显示器上，基于 C/S 模式。① 互联网上的视频点播一般采用流媒体技术，支持视频直播或视频点播；② 流媒体的特点是边下载边播放。

（5）视频监控：① 视频监控是银行、商场、交通管理等建立安全防范系统的重要组成部分；② 视频监控系统主要由摄像、传输、控制、显示、录像等部分组成；③ 人工智能特别是计算机视觉（computer vision）技术对提高监控系统的效用有重大作用。$kp$, section = '' where id = 25554;
update t_knowledge_point set title = $kp$行内语义性标签$kp$, content = $kp$行内语义性标签用于完成 Web 页面具体内容的引用和表述，丰富展示内容，主要有：

- meter：表示特定范围内的数值，如工资、数量、百分比
- time：表示时间值
- progress：进度条，用 max、value 等属性控制并监听进度
- video：视频元素，用于视频播放，支持缓冲预载和多种视频媒体格式
- audio：音频元素，用于音频播放，支持缓冲预载和多种音频媒体格式$kp$, section = '' where id = 25639;
update t_knowledge_point set title = $kp$Android 系统架构$kp$, content = $kp$Android 系统采用分层架构（主要开发语言为 Java），自上而下为五层：

1. 应用层：主屏幕、搜索、电话、联系人、浏览器、邮件、日历、相机、地图等应用。
2. 应用框架层：活动管理、窗口管理、内容提供、视图系统、通告管理、包管理、电话管理、资源管理、位置管理、传感器管理、Google Talk 服务等，为开发者提供 Java API。
3. 系统运行库层：C/C++ 函数库（图像/音频/视频播放与存储的多媒体框架、2D 图形 SGL、安全通信 SSL、3D 绘图 OpenGL、显示管理 Surface Manager、小型 SQL 数据库 SQLite、网页浏览器核心 WebKit、点阵字和矢量字绘制工具 FreeType）以及 Android 运行时 ART（核心库）。
4. 硬件抽象层（HAL）：操作系统与硬件之间的接口，隐藏特定硬件平台的接口细节，保护硬件厂商知识产权。
5. Linux 内核：内存管理、进程管理、安全管理、网络协议栈、电源管理等核心服务，以及显示器、键盘、音频、蓝牙、USB、相机、WiFi、闪存卡等驱动程序。$kp$, section = '' where id = 25640;
update t_knowledge_point set title = $kp$视频分类$kp$, content = $kp$视频分类是视频理解任务的基础。与图像分类不同，分类对象不再是静止图像，而是由多帧图像构成、包含语音数据和运动信息的视频对象，因此理解视频需要更多上下文信息：不仅要理解每帧图像是什么、包含什么，还要结合不同帧掌握上下文的关联信息。

视频分类方法主要有基于卷积神经网络的方法、基于循环神经网络的方法，以及将两者结合的方法。$kp$, section = '' where id = 25710;
update t_knowledge_point set title = $kp$IPv6 地址$kp$, content = $kp$① IPv6 地址有 128 位，即 16 个字节，理论上最多可分配 2^128 个地址。
② IPv6 具有更大的地址空间、更好的头部格式，使用更小的路由表，具有更高的安全性。
③ IPv6 加入了对自动配置的支持。
④ IPv6 允许协议进行扩充。
⑤ IPv6 增加了增强的组播支持以及对流的控制，适合多媒体应用。$kp$, section = '' where id = 25958;
update t_knowledge_point set title = $kp$标准清晰度、高清晰度与超高清晰度电视$kp$, content = $kp$（1）标准清晰度电视（SDTV，表示为 576i）

① 图像画面分辨率为 720×576，隔行扫描，帧频 25fps，视频流（压缩后）比特率约 3 Mb/s。
② 目前数字有线电视的大部分频道用于播放标准清晰度电视节目，DVD-Video 光盘中的视频大多也是 SDTV 格式。

（2）高清晰度电视（HDTV，表示为 1080i）

① 分辨率为 1920×1080，隔行扫描（1080p 为逐行扫描），帧频 25fps，视频流比特率约 8 Mb/s。
② 比标准清晰度电视可展现更多影像细节，数字有线电视中的高清频道播放的就是 HDTV 节目。

（3）超高清晰度电视（UHDTV，也称 4K 电视）

① 分辨率达 3840×2160 甚至更高，是 HDTV 的 4 倍以上。
② 近年来 4K 电视机和 LCD 显示器已经成熟，电脑显卡也都支持 4K 显示，高端智能手机也能拍摄 4K 视频。
③ 8K（超高清晰度）：分辨率达 7680×4320，每秒 24p、30p、60p 帧；即使输入片源画质不够好，通过该技术也可对其进行降噪、边缘改善、亮度调节等处理，改善片源画质，输出时达到接近 8K 画质的水平。
④ 10K（超高清晰度电视）：分辨率达 10240×4320，由 HDMI 2.1 标准支持。$kp$, section = '' where id = 26009;
update t_knowledge_point set title = $kp$数字视频压缩编码标准$kp$, content = $kp$① MPEG-1：用于 VCD。
② MPEG-2：用于 DVD、数字有线电视、卫星电视。
③ MPEG-4 AVC：用于互联网或移动通信环境下传输的标清数字视频、iPhone 等。
④ MPEG-4 ASP：用于监控、MP4 播放器。
⑤ 目前流行的数字视频编码国际标准：

| 名称 | 图像格式 | 压缩后的码率 | 主要应用 |
| --- | --- | --- | --- |
| MPEG-1 | 360×288 | 约 1.2～1.5 Mb/s | VCD、数码相机、数字摄像机等 |
| H.261 | 360×288 或 180×144 | P×64 kb/s（P=1、2 时只支持 180×144，P≥6 时可支持 360×288） | 视频通信，如可视电话、会议电视等 |
| MPEG-2（MP@ML） | 720×576 | 5～15 Mb/s | 用途最广，如 DVD、卫星电视直播、数字有线电视等 |
| MPEG-2 高清格式 | 1440×1152、1920×1152 | 80～100 Mb/s | 高清晰度电视（HDTV）领域 |
| MPEG-4 ASP | 分辨率较低的视频格式 | 与 MPEG-1、MPEG-2 相当，最低可达 64 kb/s | 低分辨率低码率领域，如监控、IPTV、手机、MP4 播放器等 |
| MPEG-4 AVC | 多种不同的视频格式 | 采用多种新技术，编码效率比 MPEG-4 ASP 显著提高 | HDTV、蓝光盘、IPTV、XBOX、iPod、iPhone 等 |$kp$, section = '' where id = 26011;
update t_knowledge_point set title = $kp$可视电话和视频会议$kp$, content = $kp$① iPad/iPhone 的 FaceTime。
② 微信的视频聊天。
③ QQ 的视频聊天，使用 MPEG-4 AVC（H.264）标准。$kp$, section = '' where id = 26188;
update t_knowledge_point set title = $kp$数字电视、IPTV 与视频点播$kp$, content = $kp$（3）数字电视、IPTV

① 数字电视清晰度高，抗干扰能力强。
② 在模拟电视机上安装一个数字机顶盒，可收看数字电视。
③ IPTV 通过互联网传播数字电视（视频）。模拟电视安装 IPTV 机顶盒后可以观看该类视频节目；智能手机、平板电脑等终端通过视频网站或者客户端也可以收看该类视频节目。

（4）视频点播（VOD）

将电视的视频和音频压缩后存储在服务器的硬盘上，点播时将视频和音频解压后输出到显示器上，基于 C/S 模式。

① 互联网上的视频点播一般都采用流媒体技术，支持视频直播或视频点播。
② 流媒体的特点：可以边下载边播放。$kp$, section = '' where id = 26189;
update t_knowledge_point set title = $kp$多媒体信息采集与处理技术$kp$, content = $kp$多媒体信息采集与处理技术利用摄像头、相机、麦克风等设备采集视频、音频、图像等信息，并对采集到的信息进行抽取、挖掘和处理，把非结构化的信息从大量采集数据中抽取出来，保存到结构化数据库中，从而为各种信息服务系统提供数据输入。$kp$, section = '' where id = 26369;
update t_knowledge_point set title = $kp$现代农业中的智慧农业$kp$, content = $kp$智慧农业是农业中的智慧经济，即智慧经济形态在农业中的具体表现。智慧农业是物联网技术在现代农业领域的应用，主要有监控功能系统、监测功能系统、实时图像与视频监控功能。$kp$, section = '' where id = 26399;
update t_knowledge_point set title = $kp$农业物联网的实时图像与视频监控$kp$, content = $kp$农业物联网是实现农作物与环境、土壤及肥力之间物物相联的关系网络，通过多维信息与多层次处理实现农作物最佳生长环境调理及施肥管理。但仅靠数值化的物物相联，并不能完全营造作物最佳生长条件，视频与图像监控为物与物之间的关联提供了更直观的表达方式：视频监控直观反映农作物生产的实时状态，引入视频图像处理既可直观反映作物的生长长势，也可侧面反映作物生长的整体状态及营养水平，从整体上为农户提供更科学的种植决策依据。

智慧农业可以让农业生产人员通过监测数据对环境进行分析，有针对性地投放农业生产资料，并根据需要调动各种执行设备，进行调温、调光、换气等动作，实现对农业生长环境的智能控制。农业生产环境监控通过布设于农田、温室、园林等目标区域的大量传感节点，实时收集温度、湿度、光照、气体浓度以及土壤水分、电导率等信息并汇总到中控系统。

智慧农业还可以保证食品安全：利用物联网技术建设农产品溯源系统，通过对农产品的高效可靠识别和对生产、加工环境的监测，实现农产品追踪、清查功能，进行有效的全程质量监控。物联网技术贯穿生产、加工、流通、消费各环节，实现全过程严格控制，使用户可以迅速了解食品的生产环境和过程，从而为食品供应链提供完全透明的展现，保证向社会提供优质的放心食品，增强用户对食品安全程度的信心，保障合法经营者的利益，提升可溯源农产品的品牌效应。$kp$, section = '' where id = 26402;
update t_knowledge_point set title = $kp$第三代移动通信（3G）$kp$, content = $kp$第三代移动通信（3G）能够处理图像、音乐、视频流等多种媒体形式，提供网页浏览、电话会议、电子商务等服务。与第一代模拟移动通信和第二代数字移动通信相比，3G 是覆盖全球的多媒体移动通信，主要特点是可实现全球漫游，使任意时间、任意地点、任意人之间的交流成为可能，并能实现高速数据传输和宽带多媒体服务。

除普通寻呼和通话外，3G 还可以上网读报纸、查信息、下载文件和图片；由于带宽提高，3G 系统还可以传输图像、提供可视电话业务；短信业务是 3G 业务平台提供的一种数据业务，并利用 SMSC（短信业务中心）为短信提供“存储转发”功能；WAP 业务是移动数据业务与 Internet 融合的基本业务，用户通过手机等无线终端的浏览器查看从服务器收到的信息，可像 Internet 用户一样访问 Internet 内容和其他数据服务。$kp$, section = '' where id = 26444;
update t_knowledge_point set title = $kp$云云协同$kp$, content = $kp$2021 年 6 月 18 日，在华为云 TechWave 技术峰会上，华为云宣布“云云协同”策略：华为云和华为终端云在能力和生态两方面深度协同，为客户和伙伴提供统一的服务和体验，包括统一账号、支付、音频、视频、地图、广告等开放能力，以及统一开发平台、统一应用分发及运营服务，实现 to B 和 to C 的全生态融合。$kp$, section = '' where id = 26517;
update t_knowledge_point set title = $kp$数字视频及其应用$kp$, content = $kp$数字视频是由 0 和 1 编码的传输和记录的比特流。像素决定了图像清晰与否，数据量非常大，格式多，可以进行非线性搜索和编辑，接口多样化。

应用：VCD 与 DVD、可视电话与视频会议、数字电视、点播电视。$kp$, section = '' where id = 26806;
update t_knowledge_point set title = $kp$视频信号的组成、原理与彩色电视制式$kp$, content = $kp$视频信号显示通常采用三基色原理：任何颜色均由红（R）、绿（G）、蓝（B）三种颜色分量组成；在电视原理里，用亮度（Y）、蓝色差（U）、红色差（V）三个分量表示。两种表示方法相互之间可以转换。

视频信号扫描方式有两种：隔行扫描，表示为 1080i、720i 等；逐行扫描，即通常说的 1080P、720P 等。两种扫描方式各有优劣。

高清视频信号的传输有模拟传输、数字信号传输、网络传输三种方式。

彩色电视的三种制式：PAL、NTSC、SECAM。$kp$, section = '' where id = 26807;
update t_knowledge_point set title = $kp$数字视频的获取与播放$kp$, content = $kp$数字视频的获取方式：下载数字视频资源；接收实时传输的视频流媒体。$kp$, section = '' where id = 26808;
update t_knowledge_point set title = $kp$视频信号的数字化$kp$, content = $kp$视频信号数字化有两种方式：全信号数字化和分量数字化。

（1）全信号数字化方式：对彩色全电视信号直接进行数字化，这种方式应用较少。

（2）分量数字化方式：对彩色全电视信号中的亮度信号（Y）、红色差信号（R-Y）和蓝色差信号（B-Y）先分别进行数字化，然后利用时分复用制（通过一定方式将这三个分别数字化的信号复合起来）进行处理，这种方式称为分量数字化。$kp$, section = '' where id = 26809;
update t_knowledge_point set title = $kp$数字视频存储数据量的计算$kp$, content = $kp$视频文件存储容量的计算公式：

文件体积（MB）≈ [视频码率（kb/s）+ 音频码率（kb/s）] ÷ 8 × 时长（秒）÷ 1024

即码率之和除以 8 得到每秒的字节数，再乘以时长并换算为 MB。$kp$, section = '' where id = 26810;
update t_knowledge_point set title = $kp$计算机合成数字视频$kp$, content = $kp$合成视频的基本步骤：描述景物的形状与结构；确定景物的颜色和材质；设置灯光并确定虚拟摄像机的位置；描述场景中物体的运动和摄像机的移动；绘制并输出一系列图像作为结果。$kp$, section = '' where id = 26811;
update t_knowledge_point set title = $kp$流媒体$kp$, content = $kp$流媒体是指在网络中使用流式传输技术传输的连续时基媒体，例如音频、视频、动画或其他多媒体文件。流媒体的主要特点是以流的形式进行多媒体数据的传输，即把连续的影音信息经压缩处理后放到网络服务器上，浏览者可以一边下载一边欣赏。$kp$, section = '' where id = 26812;
update t_knowledge_point set title = $kp$Windows Media Player$kp$, content = $kp$Windows Media Player 可以播放和组织计算机及 Internet 上的数字媒体文件，还可以收听全世界电台的广播、播放和复制 CD、创建自己的 CD，以及将音乐或视频复制到便携设备（如便携式数字音频播放机和 Pocket PC）中。$kp$, section = '' where id = 27024;
update t_knowledge_point set title = $kp$数字视频获取设备中的在线设备$kp$, content = $kp$数字视频信号的获取设备分为在线设备和脱机设备。

在线设备：数字摄像头通过光学镜头和 CCD 或 CMOS 采集动态图像，转换成数字信号并输入 PC。$kp$, section = '' where id = 27503;
update t_knowledge_point set title = $kp$MPEG-1 的应用$kp$, content = $kp$MPEG-1 用于 VCD。$kp$, section = '' where id = 27504;
update t_knowledge_point set title = $kp$MPEG-2 的应用$kp$, content = $kp$MPEG-2 用于 DVD、数字有线电视、卫星电视。$kp$, section = '' where id = 27505;
update t_knowledge_point set title = $kp$MPEG-4 ASP 的应用与网络视频格式$kp$, content = $kp$MPEG-4 ASP 用于监控、MP4 播放器。目前，视频网站多数使用 FLV、F4V 格式来传播音频视频。$kp$, section = '' where id = 27506;
update t_knowledge_point set title = $kp$计算机动画$kp$, content = $kp$计算机动画即使用计算机生成一系列内容连续的画面，它是一种计算机合成的数字视频，而不是用摄像机拍摄的“自然视频”。互联网动画常用 GIF 和 Flash。$kp$, section = '' where id = 27507;
update t_knowledge_point set title = $kp$VCD 与 DVD$kp$, content = $kp$① VCD（Video CD）：按 MPEG-1 标准将 60 分钟的音频/视频节目记录在一张 CD 光盘上，图像质量为 VHS 水平（352×240），即家用录像机的水平。

② DVD-Video（简称 DVD）：按 MPEG-2 标准记录音频/视频，图像质量为广播级（720×576），支持 5.1 声道环绕立体声；单面单层 DVD（容量 4.7GB）可记录 120 分钟以上的影视节目。$kp$, section = '' where id = 27508;
update t_knowledge_point set title = $kp$可视电话和视频会议$kp$, content = $kp$① iPad/iPhone 的 FaceTime。
② 微信的视频聊天。
③ QQ 的视频聊天，使用 MPEG-4 AVC（H.264）标准。$kp$, section = '' where id = 27509;
update t_knowledge_point set title = $kp$数字电视与 IPTV$kp$, content = $kp$① 数字电视清晰度高，抗干扰能力强。
② 在模拟电视机上安装一个数字机顶盒，可收看数字电视。
③ IPTV 通过互联网传播数字电视（视频）。模拟电视安装 IPTV 机顶盒后可以观看该类视频节目；智能手机、平板电脑等终端通过视频网站或者客户端也可以收看该类视频节目。$kp$, section = '' where id = 27510;
update t_knowledge_point set title = $kp$视频点播（VOD）$kp$, content = $kp$视频点播（VOD）：将电视的视频和音频压缩后存储在服务器的硬盘上，点播时将视频和音频解压后输出到显示器上，基于 C/S 模式。

① 互联网上的视频点播一般采用流媒体技术，支持视频直播或视频点播。
② 流媒体的特点：可以边下载边播放。$kp$, section = '' where id = 27511;
update t_knowledge_point set title = $kp$流媒体技术及常见格式$kp$, content = $kp$① 互联网环境下开发数字音频（视频）的实时应用，采用了流媒体技术。
② 常见的流媒体技术有：Real 公司的 RealMedia；微软公司的 WMA、WMV、ASF；苹果公司的 QuickTime。$kp$, section = '' where id = 27524;
update t_knowledge_point set title = $kp$HDMI 接口$kp$, content = $kp$HDMI 接口：高清晰数字音频和视频接口，可以同时传输数字音频和数字视频。$kp$, section = '' where id = 27531;
update t_knowledge_point set title = $kp$为对象设置多个动画效果$kp$, content = $kp$可以为一个对象设置多个动画效果；多个对象的动画效果可以同时播放。$kp$, section = '' where id = 27567;
update t_knowledge_point set title = $kp$动画刷$kp$, content = $kp$动画刷：复制动画效果。$kp$, section = '' where id = 27568;
update t_knowledge_point set title = $kp$动画预览$kp$, content = $kp$动画可以预览，也可以设置为自动预览。$kp$, section = '' where id = 27569;
update t_knowledge_point set title = $kp$PowerPoint 的备注页视图、大纲视图与母版视图$kp$, content = $kp$不可以设置幻灯片中对象的动画效果。

3. 备注页视图：只可以编辑备注，不可以编辑幻灯片；在备注页视图下可以插入图形图像。

4. 大纲视图：分为大纲窗格、编辑区、备注区三个窗格；大纲窗格不可以显示图表、图像等内容，历年考题常直接表述为“大纲视图不能显示图表、图像”。

母版视图：包括幻灯片母版、讲义母版、备注母版，没有大纲母版。$kp$, section = '' where id = 27571;
update t_knowledge_point set title = $kp$IPv6 对多媒体的支持$kp$, content = $kp$IPv6 增加了增强的组播支持以及对流的控制，适合多媒体应用。$kp$, section = '' where id = 28214;
update t_knowledge_point set title = $kp$数字电视$kp$, content = $kp$数字电视：电视节目的制作（摄录、编辑）、处理、传输、接收播放全过程的数字化，特别是将电视信号进行数字化之后以数字形式进行传输和接收。$kp$, section = '' where id = 28590;
update t_knowledge_point set title = $kp$MPEG 系列标准$kp$, content = $kp$1）MPEG-1：VCD
2）MPEG-2：数字电视和 DVD
3）MPEG-4：交互式多媒体应用

MPEG-4 的目标：支持各种网络条件下（包括移动通信）的交互式多媒体应用，侧重于对多媒体信息内容的访问。$kp$, section = '' where id = 29538;
update t_knowledge_point set title = $kp$流媒体技术的定义、应用与代表$kp$, content = $kp$1）定义：允许在窄带网上让用户一边下载一边收看（听）音视频连续媒体的技术。
2）应用：在线音频广播、实时音乐或视频点播、视频会议。
3）代表：微软公司的 WMV、ASF。

数字视频编辑器（核心软件）：Adobe Premiere、VideoStudio（会声会影）、Windows Movie Maker。
动画制作软件：MAYA、3ds max、Animator Pro、Flash。$kp$, section = '' where id = 29539;
update t_knowledge_point set title = $kp$帧频（帧速率）$kp$, content = $kp$帧频（帧速率）：视频每秒钟包含的帧（图像）的个数，单位是 fps。$kp$, section = '' where id = 29542;
update t_knowledge_point set title = $kp$计算机第 4 代$kp$, content = $kp$第 4 代：主要元器件为 LSI、VLSI；应用领域为 PC、Internet、多媒体。$kp$, section = '' where id = 29551;
update t_knowledge_point set title = $kp$IEEE 1394 接口$kp$, content = $kp$IEEE 1394 主要用来连接音、视频设备，速度为 50MB/s～100MB/s；串行接口；6 线连接器；一次最多连接 63 个设备，在笔记本电脑上一般作为标配存在。$kp$, section = '' where id = 29552;
update t_knowledge_point set title = $kp$常见声音流媒体软件$kp$, content = $kp$目前流行的声音流媒体（边下载边播放）软件有：Real 公司的 RA、微软的 WMA、苹果公司的 QuickTime。$kp$, section = '' where id = 29566;
update t_knowledge_point set title = $kp$MPEG-1 的主要应用$kp$, content = $kp$MPEG-1 的主要应用有：DAB、VCD、Internet、MP3、数字盒式录音带。$kp$, section = '' where id = 29567;
update t_knowledge_point set title = $kp$远程医疗$kp$, content = $kp$远程医疗是指通过计算机技术、通信技术、遥感技术与多媒体技术，同医疗技术相结合，旨在提高诊断与医疗水平、降低医疗开支、满足广大人民群众保健需求的一项全新的医疗服务。$kp$, section = '' where id = 29569;
update t_knowledge_point set title = $kp$动画方案$kp$, content = $kp$选择“幻灯片放映”菜单中的“动画方案”命令，在右侧的任务窗格中出现动画方案的列表，可在其中选择一种动画方案，快速生成动画效果。优点：制作过程快；缺点：每一个对象的动画播放效果相同，缺乏个性。$kp$, section = '' where id = 29572;
update t_knowledge_point set title = $kp$自定义动画$kp$, content = $kp$当向幻灯片中插入了许多不同对象的时候，可以利用“自定义动画”来确定各个对象在放映时出现的先后次序；同时可以为幻灯片上的各个对象（如文字、图片、表格等）的出现方式设置动画效果，使演示更加生动、富有趣味性。

进入“自定义动画”任务窗格：选择“幻灯片放映”菜单中的“自定义动画”命令。

1．“添加效果”按钮：有进入、强调、退出、动作路径四种效果可供选择。

通过“自定义动画”任务窗格，可以对同一幻灯片上的不同对象设置动画，包括对象播放动画的先后顺序和时间、动画效果、动画播放的控制方式，以及声音或影片等多媒体对象的动画播放效果。$kp$, section = '' where id = 29573;
update t_knowledge_point set title = $kp$接口、外存、算法语言、多媒体与网络基础要点$kp$, content = $kp$USB 2.0 速度是 60MB/s，一个 USB 口可以通过转接设备连接 127 个设备。
IEEE 1394 火线接口，速率最高 400Mb/s（约 50MB/s），最多连接 63 个设备。
IDE 接口：接硬盘、光驱，速度有 66、100、133MB/s。
SATA 接口：接硬盘，速度 150～300MB/s。
插槽：PCI 插槽、ISA、AGP、CPU 插槽、内存插槽。

I/O 控制器：CPU 启动 I/O 控制器，由 I/O 控制器对输入输出全程监控，由 DMA（直接存储器存取）负责数据传输，传输完毕后 I/O 控制器向 CPU 发出一个中断，多个 I/O 设备可以协同完成操作。

总线：CPU 总线、存储器总线、I/O 总线；对应地址信号、数据信号、控制信号，即地址总线、数据总线、控制总线。

外存：硬盘、软盘、光盘；硬盘和软盘都是磁介质设备，光盘是光介质设备。接口有 IDE、SATA、SCSI。
容量：软盘 3.5 英寸，容量 1.44MB；容量＝磁头数×磁道（柱面）数×扇区数×512B，软盘共 2 个磁头、80 个磁道、18 个扇区，每扇区 512B。
光盘：CD 640MB～700MB，DVD 4.7GB～17GB。
速度：硬盘外部传输率高于内部传输率，外部传输率一般有 66、100、133MB/s；CD 盘单倍速 150KB/s，VCD 采用双倍速，DVD 盘单倍速 1350KB/s。
光盘分类：CD（CD-ROM 只读、CD-R 一次性写、CD-RW 可擦写）；DVD（DVD-ROM、DVD-R、DVD-RW）。光驱：CD-ROM、CD-RW 刻录光驱、DVD-ROM、DVD-RW 刻录光驱。
主板：南桥芯片和北桥芯片。北桥芯片负责 CPU、内存、AGP 插槽；南桥芯片负责系统时钟、PCI、ISA、IDE 等插槽及主板接口。

数据库部分
数据结构：逻辑结构、存储结构、运算。逻辑结构如线性表和树，物理结构如链接表（二维表），运算指算法。
算法的特性：有穷性——必须在有限的步骤内执行完操作；确切性——每一步都要有意义；输入——0 个或多个；输出——至少 1 个结果；可行性——程序编写正确。
语言：机器语言可以直接识别，速度快，但不易记忆、理解和维护；汇编语言用助记符代替操作码，必须经过翻译后才能执行；高级语言易理解、记忆、维护，必须经过编译或解释才能执行，速度最慢。相关程序：汇编程序、编译程序、解释程序。
数据库：数据模型分为层次、网状、关系、面向对象；概念模型。
程序是算法的表示形式，算法是程序的设计核心。
信息系统：高级语言＋数据库。
电子商务：B2B 企业到企业，B2C 企业对个人。
制造业信息系统：ERP 企业资源计划、MRP 物料需求计划、CIMS 计算机现代集成制造系统、CSRP 客户同步资源计划。

多媒体部分
多媒体包括文字、图像、声音、视频。
文字：西文字符以 ASCII 存储，中文字符以内码存储，也可以用字形码存储（点阵汉字）。汉字有输入码、存储码及输出码；无论用什么编码输入字符，同一个汉字的内码完全一样。
区位码、国标码和机内码：国标码＝区位码＋2020H，机内码＝国标码＋8080H，机内码＝区位码＋A0A0H。机内码用双字节存储汉字，最高位都是 1。
字形码存储汉字：1 个汉字占 水平分辨率×垂直分辨率/8 B。
图形与图像：图像指点阵图、像素图、光栅图、位图，通过输入设备输入计算机，经 CCD 芯片进行光电转换，将光信号转为电信号；图形指计算机绘图、矢量图。
图像的获取方式：扫描、分色、取样、量化。扫描——分辨率，水平分辨率×垂直分辨率；分色——将图像颜色分解为 RGB 三原色；取样——提取像素点的亮度值（色彩深度/像素深度）；量化——A/D 模/数转换。数据量＝分辨率×色彩深度/8。
图像类型和压缩方法：BMP、TIFF、GIF、JPEG、JPEG2000。GIF 采用无损压缩，色彩不超过 256 色，图像较小，一般用于网页，可以使用透明背景和动画效果。
音频：计算机合成音乐为 MIDI，获取的音频为 WAV；合成音乐不能模拟自然声音，只能是乐器合成音，WAV 格式的音乐可以模拟自然声音，用于旁白。
音频获取：取样、模数转换、编码。取样频率至少为信号最高频率的两倍。数据量＝取样频率×位宽×声道数/8 B（每秒）。
声音编码格式：MPEG-1。播放（输出）：解码、数模转换、插值。
视频：MPEG-1 用于 VCD，MPEG-2 用于 DVD 和数字电视，MPEG-4 用于交互式多媒体应用。PAL 制式 25 帧/s。

网络部分
网络分类：广域网、城域网、局域网。
网络拓扑结构：总线型、星型、环型。
广域网接入技术：电话拨号、ISDN、ADSL、电缆调制解调技术（Cable Modem）、无线、光纤。
IP 地址：IPv4、IPv6。IPv4 由四组 0～255 的数字构成，每组 8 位，中间以英文句点隔开，是 32 位地址；IPv6 用十六进制数标识，共 8 组、每组 16 位，合计 128 位。
IPv4 地址的组成和分类：由网络号＋主机号组成，分为 A、B、C、D、E 类。A 类首组数字 1～126，第一组为网络号，后三组为主机号；B 类首组数字 128～191，前两组为网络号，后两组为主机号；C 类首组数字 192～223，前三组为网络号，最后一组为主机号。$kp$, section = '' where id = 29575;
update t_knowledge_point set title = $kp$大数据特点：数据类型繁多（Variety）$kp$, content = $kp$数据类型繁多（Variety）：行业数据多，数据种类多，如邮件、视频、音频、微信、微博、位置信息、网络日志等。$kp$, section = '' where id = 29583;
update t_knowledge_point set title = $kp$CD-ROM$kp$, content = $kp$CD-ROM：只读光盘，不能写入数据。$kp$, section = '' where id = 29591;
update t_knowledge_point set title = $kp$ADSL$kp$, content = $kp$ADSL（不对称数字用户线）：打电话的同时可以上网，下载速率 1～8Mb/s，上传不超过 1Mb/s。$kp$, section = '' where id = 29592;
update t_knowledge_point set title = $kp$HDMI 接口与常见接口类型$kp$, content = $kp$HDMI 接口：高清晰数字音频和视频接口。

常见接口：PS/2 接口、USB 接口、VGA 接口、RJ45 接口、音频接口、HDMI 接口、DVI 接口。$kp$, section = '' where id = 29597;
update t_knowledge_point set title = $kp$彩色电视信号的 YUV 表示$kp$, content = $kp$彩色电视信号使用 YUV 表示：Y 表示亮度，UV 表示色度。人眼对亮度更敏感，因此对视频信号的压缩主要是对色度进行压缩。$kp$, section = '' where id = 29612;
update t_knowledge_point set title = $kp$MPEG-4 及其档次的应用$kp$, content = $kp$MPEG-4：适用于网络，实现交互。

① MPEG-4 AVC：在互联网或者移动通信环境下传输标清数字视频，如 iPhone、微信视频聊天。
② MPEG-4 ASP：用于监控、MP4 播放器等低端设备。$kp$, section = '' where id = 29613;
update t_knowledge_point set title = $kp$“一秒题”的考法变化$kp$, content = $kp$计算机的真题中“一秒题”越来越少。所谓一秒题，就是通过概念看一眼就可以看出答案的题目，比如 DVD 的编码是 MPEG-2。这类题目在单选题中几乎不出现了，填空题还有一些，2006 年左右考得还比较多。大多数题目是一个选择题中出现很多同类型的相关知识点，让考生选择错误的一个或正确的一个。近年真题还新增了一些比较偏的题目，如软键盘、键盘盲区、pagefile.sys 等填空。$kp$, section = '' where id = 29621;
update t_knowledge_point set title = $kp$IEEE 1394 火线接口与常用按键$kp$, content = $kp$火线接口 IEEE 1394：高速传输音频、视频设备，6 线连接，最多连接 63 个设备。

常用按键：Insert 插入/改写；Alt+Print Screen 截取窗口；Print Screen 截屏；Ctrl+Alt+Del 重启（打开资源管理器）。$kp$, section = '' where id = 29622;
update t_knowledge_point set title = $kp$流媒体与常见音频格式$kp$, content = $kp$流媒体：可以边下载边播放。为了在因特网上支持视频直播或视频点播，目前一般都采用流媒体技术。

WAV 未压缩；FLAC、APE、M4A 都是无损音乐；MP3、WMA、AC3、AAC 是有损音乐。$kp$, section = '' where id = 29640;
update t_knowledge_point set title = $kp$数字电视机顶盒与 TTS$kp$, content = $kp$数字电视是在传统电视上安装数字机顶盒，作用是模拟与数字的转换；VOD 为视频点播技术。

将文本转换为语音所使用的技术是 TTS，中文名称为文语转换。$kp$, section = '' where id = 29643;
update t_knowledge_point set title = $kp$HDMI 可无压缩传输全高清视频和音频$kp$, content = $kp$全高清多媒体接口（HDMI）能以无压缩方式传送 1920×1200 的数字视频信号和 5.1 声道音频信号。$kp$, section = '' where id = 29651;
update t_knowledge_point set title = $kp$数字摄像头$kp$, content = $kp$在 PC 上安装数字摄像头，可以通过镜头拍摄活动图像，并将其转换成数字视频信号传输到计算机中。$kp$, section = '' where id = 29659;
update t_knowledge_point set title = $kp$媒体层$kp$, content = $kp$媒体层：通过它可以在应用程序中使用各种媒体文件，进行音频与视频的录制、图形的绘制，以及制作基础的动画效果。$kp$, section = '' where id = 29662;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22185,22712,22911,23166,23167,23168,23185,23191,23193,23205,23222,23223,23224,23242,23256,23268,23281,23291,23294,23306,23308,23311,23312,23314,23318,23320,23327,23335,23356,23368,23369,23370,23372,23374,23381,23407,23421,23422,23423,23424,23425,23434,23450,23456,23457,24229,24786,25275,25547,25548,25554,25639,25640,25710,25958,26009,26011,26188,26189,26369,26399,26402,26444,26517,26806,26807,26808,26809,26810,26811,26812,27024,27503,27504,27505,27506,27507,27508,27509,27510,27511,27524,27531,27567,27568,27569,27571,28214,28590,29538,29539,29542,29551,29552,29566,29567,29569,29572,29573,29575,29583,29591,29592,29597,29612,29613,29621,29622,29640,29643,29651,29659,29662) and not deleted) <> 113 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
