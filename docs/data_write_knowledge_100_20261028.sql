-- 知识点 100 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_100
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_100 as
select * from t_knowledge_point where id in (22596,22612,22613,22615,22621,22653,22659,22660,22673,22674,22704,22708,22738,22741,22745,22748,22749,22759,22760,22779,22784,22791,22794,22874,22941,22950,22953,22984,22999,23024,23027,23038,23039,23040,23041,23072,23074,23080,23086,23137,23141,23142,23543,23591,23603,23604,23831,23841,23843,23920,23951,23953,23978,24000,24105,24231,24232,24688,24720,25256,25267,25297,25351,25476,25484,25582,26044,26045,26192,26763,27438,27439,27440,27441,27442,27445,27947,27948,27949,28404,28515,28541,28575,28576,28587,29195,29208,29209,29247,29248,29249,29264,29265,29266,29275,29292,29293,29294,29327,29357,29399,29426,29441,29442,29443,29444,29445,29458,29470,29471,29472,29486,29493,30111,30125);

update t_knowledge_point set title = $kp$广域网中计算机的地址$kp$, content = $kp$连接在广域网上的每台计算机都有一个地址。当一台计算机向另一台计算机发送数据包时，必须在数据包中包含目的计算机的地址。$kp$, section = '' where id = 22596;
update t_knowledge_point set title = $kp$电话拨号接入$kp$, content = $kp$家庭计算机用户利用本地电话网，通过调制解调器拨号接入广域网。

电话MODEM最重要的性能是它的数据传输速率，以Kbps（千比特/秒）为单位。目前电话MODEM的主流产品速率是56Kbps。实际使用过程中，由于电话线路的质量不佳、网络服务提供商不能提供足够的带宽，或者所连接的网络发生拥塞等原因，都会使传输效率降低。

电话调制解调器的数据传输速率不高，且与打电话一样按通话时间计费，现已很少使用。$kp$, section = '' where id = 22612;
update t_knowledge_point set title = $kp$ADSL的安装与配置$kp$, content = $kp$ADSL可专门申请一条单独的线路，也可在已有的电话线上改造。

用户端需配置一个ADSL MODEM；计算机中需安装10M/100M的以太网网卡，网卡与ADSL MODEM之间用双绞线连接，并设置有关参数。$kp$, section = '' where id = 22613;
update t_knowledge_point set title = $kp$ISDN的传输介质与用户—网络接口$kp$, content = $kp$ISDN使用与模拟信号电话系统相同类型的双绞铜线，却提供端到端的数字通信线路，这是它与电话网的最大不同。

ISDN通过标准的“用户—网络接口”（UNI），将PC机、电话机、传真机等各类不同的终端设备接入到ISDN网络中。$kp$, section = '' where id = 22615;
update t_knowledge_point set title = $kp$调制解调器的组成与功能$kp$, content = $kp$调制器（Modulator）：把数字信号转换为模拟信号。

解调器（Demodulator）：把模拟信号转换为数字信号。$kp$, section = '' where id = 22621;
update t_knowledge_point set title = $kp$ADSL的优点与信道划分$kp$, content = $kp$ADSL像ISDN一样，可以与普通电话共存于一条电话线上，可同时接听、拨打电话并进行数据传输，两者互不影响。虽然使用的还是原来的电话线，但ADSL传输的数据并不通过电话交换机，所以ADSL上网不需要缴付额外的电话费，节省了费用。ADSL的数据传输速率根据线路情况自动调整，以尽力而为的方式进行数据传输。

ADSL利用普通电话线作为传输介质，通过自适应的数字信号调制解调技术，能在电话线上得到3个可以同时工作的信息通道：为电话服务的通道、速率为640Kbps～1.0Mbps的上行通道、速率为1～8Mbps的高速下行通道。$kp$, section = '' where id = 22653;
update t_knowledge_point set title = $kp$ISDN的两类用户—网络接口$kp$, content = $kp$基群（一次群）速率接口PRI：包括30个B通道（数据通道）和一个D通道（信令通道），每个B通道和D通道均为64Kbps（称为30B+D），可提供2Mbps的数据通信速率，为单位用户的局域网与远程广域网互连提供了支持。

基本速率接口BRI：又称N-ISDN、“窄带ISDN”，俗称“一线通”。包括两个B通道（速率为64Kbps）和一个D通道（16Kbps，用作控制信道）（称为2B+D）。用户使用一条电话线就能实现两路数据传输，可以一边上网，一边同时打电话；如果2个通道都用作数据传输，则可提供128Kbps的数据通信速率。$kp$, section = '' where id = 22659;
update t_knowledge_point set title = $kp$MODEM的传输速率$kp$, content = $kp$MODEM的传输速率指每秒钟可传送的数据量。目前主流产品速率是56Kbps（ITU V.90协议）。实际使用过程中，由于电话线路的质量不佳、网络服务提供商不能提供足够的带宽，或者所连接的网络发生拥塞等原因，都会使传输速率降低。$kp$, section = '' where id = 22660;
update t_knowledge_point set title = $kp$帧中继网$kp$, content = $kp$帧中继交换网是X.25分组网的改进方案。

它使用光纤作为传输介质：一方面提高了信道的传输速率，另一方面光纤通信的高可靠性使X.25网中的差错处理等得到了简化，降低了传输延迟。

帧（分组）的长度至少有1600字节，有些可达到8K字节，比X.25分组网的128字节帧长得多，使交换机的开销大大减少，适合计算机通信的需求。传输速率可以达到2Mbps。$kp$, section = '' where id = 22673;
update t_knowledge_point set title = $kp$广域网中计算机的编址方案$kp$, content = $kp$广域网采用两层地址，即计算机连接到的交换机编号加上该计算机的编号。$kp$, section = '' where id = 22674;
update t_knowledge_point set title = $kp$SMDS（交换多兆位数据服务）$kp$, content = $kp$交换多兆位数据服务（SMDS）是远程线路运营商提供的另一种高速广域网数据服务，对远程数据传输进行了优化：将数据包头部开销减到最小，并使每个包能装多达9188字节的数据；把信息切割成固定长度（53字节）的信元在网上传输。

SMDS提供了一种虚拟专用网（VPN）的能力，使访问通路只为一个用户所专用，其他人无法访问其信息，提供了像专用网络那样的安全性。

SMDS网络的工作速度高于帧中继。$kp$, section = '' where id = 22704;
update t_knowledge_point set title = $kp$上传与下载速率不对称$kp$, content = $kp$数据下行传输速率为36Mb/s，上传信道传输速率为320kb/s～10Mb/s。$kp$, section = '' where id = 22708;
update t_knowledge_point set title = $kp$ATM（异步传输模式）$kp$, content = $kp$异步传输模式（ATM）是一种重要的广域网技术，试图设计一种单一的技术在广域内提供语音、动态图像和数据服务，其中包的尺寸是关键问题之一。ATM把数据分成较小的固定大小的包，称为信元（cell），每个ATM信元包括53个字节（5个字节的头部信息，48个字节的数据）。

ATM网交换机有多个端口，每个端口可连接另一台交换机或者一台计算机。多数ATM网使用光纤作为通信介质，例如ATM交换机上的一个典型端口其运行速率为155Mbps或者更高。$kp$, section = '' where id = 22738;
update t_knowledge_point set title = $kp$有线电视网接入的复用技术$kp$, content = $kp$采用频分多路复用技术，将下传和上传的频带提供给多个用户共享。每个用户都需要一对调制解调器（一个置于有线电视中心，另一个装在用户站点上），这一对调制解调器必须调到相同的载波频段，与电视信号一起在电缆上多路复用。

在一个大的都市地区，有线电视可能有上百万用户，不可能为每个用户分配一个独立的载波频段，因此频分多路复用方法不具备可扩展性，需要在采用频分多路复用技术的基础上再采用时分多路复用技术。$kp$, section = '' where id = 22741;
update t_knowledge_point set title = $kp$有线电视网接入（Cable MODEM）$kp$, content = $kp$当前，有线电视系统已经广泛采用光纤同轴电缆混合网（HFC）传输电视节目。

使用Cable MODEM传输数据时，将同轴电缆的整个频带划分为3部分，分别用于数据上传、数据下传和电视节目下传。数据通信与电视信号的传输互不影响，上网时仍可收看电视节目。

Cable MODEM带宽充足（最高速率可以达到36Mbps），但它属于共享式的总线型网络，当同时上网的用户数目较多时，各个用户所得到的有效带宽将会下降，这是它的不足之处。$kp$, section = '' where id = 22745;
update t_knowledge_point set title = $kp$电缆调制解调技术$kp$, content = $kp$电缆调制解调（Cable MODEM）技术是利用有线电视网高速传送数字信息的技术。$kp$, section = '' where id = 22748;
update t_knowledge_point set title = $kp$电话拨号接入方式的缺点$kp$, content = $kp$电话网采用传统的电路交换，每一条话路的带宽是64Kbps。建立在此基础上的MODEM传输机制，发展到极限的V.92也不过是56Kbps的下传速率，其中还包括控制信令部分，真正有效的数据还要少。线上传送的是模拟信号，受外界电磁环境的干扰比较大；握手时间长，下载速度慢，容易掉线。$kp$, section = '' where id = 22749;
update t_knowledge_point set title = $kp$广域网的类型$kp$, content = $kp$不同广域网采用的数据包格式不同、地址格式不同、相互连接的数据通信线路不同、应用不同，因而会有不同类型的广域网。$kp$, section = '' where id = 22759;
update t_knowledge_point set title = $kp$广域网的特点$kp$, content = $kp$从功能上来说，广域网与局域网并无本质区别，只是由于数据传输较慢，局域网上的一些功能很难在广域网上实现。

广域网的特征是可将任意距离的任意多台计算机互连。目前，广域网普遍采用的交换技术是分组（包）交换。$kp$, section = '' where id = 22760;
update t_knowledge_point set title = $kp$光纤接入网$kp$, content = $kp$光纤接入网是使用光纤作为主要传输介质的远程网接入系统。

在交换局一侧，应把电信号转换为光信号，以便在光纤中传输；到达用户端时，要使用光网络单元（ONU）把光信号转换成电信号，然后再传送到计算机。

按光网络单元设置的位置，光纤接入网分为光纤到路边（FTTC）、光纤到小区（FTTZ）、光纤到大楼（FTTB）。$kp$, section = '' where id = 22779;
update t_knowledge_point set title = $kp$Cable MODEM通信方式的优点$kp$, content = $kp$集调制/解调功能、加密/解密功能、网卡及集线器等功能于一身。

无须拨号上网，不占用电话线，可永久连接。

理论上没有距离限制，覆盖的地域很广。$kp$, section = '' where id = 22784;
update t_knowledge_point set title = $kp$无线接入因特网的技术$kp$, content = $kp$无线接入因特网的技术主要有三类：无线局域网（WLAN）接入、GPRS移动电话网接入、3G移动电话网接入。$kp$, section = '' where id = 22791;
update t_knowledge_point set title = $kp$Cable MODEM通信方式的缺点$kp$, content = $kp$Cable MODEM带宽充足（最高速率可以达到36Mbps），但它属于共享式的总线型网络，同一个接入点如果上网的用户增多，每一个用户能分配到的带宽很有限，使数据传输速率不够稳定。

我国有线电视网用户已达8000多万，发展Cable MODEM有多方面的有利条件，但现有的有线电视网都是单向广播式，要实现Internet接入必须进行双向改造，这项工程的投资是巨大的。使用“光纤—同轴混合”线路（HFC，Hybrid Fiber Coaxial）改造有线电视网络，需把干线全部更换为光纤，保留现存的同轴电缆连接用户，在光纤和同轴电缆之间加入新的接口设备，并将所有放大器改造为双向工作，改造需要大量的投资。$kp$, section = '' where id = 22794;
update t_knowledge_point set title = $kp$5G与HTML5相关选择题$kp$, content = $kp$【1129】在5G关键技术中，（）极大地提高信道容量
A. 多入多出
B. 波束赋形
C. D2D
D. 毫米波

【1130】以下属于移动互联网的特征的有（）
A. 便携性
B. 隐私性
C. 定位性
D. 强关联性

【1131】以下不属于Web 2.0技术应用的有（）
A. Facebook
B. 微博
C. QQ即时通信
D. 百度贴吧

【1132】5G的应用场景分类主要包括（）
A. 增强移动宽带
B. 超高可靠低时延通信
C. 海量机器类通信
D. 航天航空

【1133】5G的具体应用场景包括（）
A. 工业控制
B. 远程医疗
C. 自动驾驶
D. 智能家居

【1134】下列哪项应用不属于URLLC应用场景（）
A. 工业自动化
B. 远程医疗
C. 自动驾驶
D. 智能家居

【1135】5G网络关键性能指标不正确的是（）
A. 1ms时延
B. 小区峰值吞吐率1G+bps
C. 连接数100万每平方公里
D. 高速移动性500km/小时

【1136】对于mMTC的业务特点不包括（）
A. 低时延
B. 低功耗
C. 低速率
D. 连接数巨大

【1137】5G每平方公里至少支持多少台设备（）
A. 1000
B. 10000
C. 100000
D. 1000000

【1138】5G的特点是：超高速率、超多连接、（）
A. 超多APP
B. 超低时延
C. 超级快
D. 超时尚

【1139】5G三大主要应用场景，以下哪项不是（）
A. 增强移动宽带（eMBB）
B. 低时延高可靠（URLLC）
C. 高质量通话
D. 超高密度物联（mMTC）

【1140】5G的部署分为三个阶段，第一个阶段主要面向哪些业务（）
A. eMBB
B. 10T
C. mMTC
D. uRLLC

【1141】在5G技术中，用于提升接入用户数的技术是（）
A. Massive MIMO
B. SOA
C. Massive CA
D. mCTT

【1142】根据IMT-2020，5G最重要的关键性能指标是（）
A. 每平方公里连接数量
B. 时延
C. 用户体验速率
D. 移动速度

【1143】5G的三大应用场景中没有（）
A. eMBB
B. MEC
C. uRLLC
D. mMTC

【1144】地铁覆盖场景的特点是（）
A. 人员密集，容量需求高
B. 移动速度超高，穿损大
C. 高价值用户聚集
D. 覆盖场景分散

【1145】5G是指（）
A. 5G网络
B. 第五代移动通信技术
C. 5G互联网
D. 5G智能手机

【1146】5G的超低时延是多少（）
A. 1ms
B. 2ms
C. 5ms
D. 10ms

【1147】5G的网络时延约是（）
A. 1～10毫秒
B. 0.1～1毫秒
C. 20～80毫秒
D. 100～200毫秒

【1148】5G目前主要的应用集中在（）
A. eMBB
B. mMTC
C. uRLLC
D. 终端

【1149】HTML5技术簇主要包括（）
A. HTML5
B. CSS3
C. JavaScript
D. TCP/IP

【1150】HTML5具有以下的新特性（）
A. 丰富的结构化、语义化标签
B. 面向应用的功能增强
C. 系统能力调用
D. 富媒体支持$kp$, section = '' where id = 22874;
update t_knowledge_point set title = $kp$ADSL宽带上网过程$kp$, content = $kp$调制解调器把计算机送出的数字信号，采用数字调制的方法调制成为适合于在用户电话线上传输的载波信号；载波信号在电话网中经过交换机传输至目的地；目的地的调制解调器从载波信号中解调恢复出数字信号，传送给计算机。$kp$, section = '' where id = 22941;
update t_knowledge_point set title = $kp$光纤到楼、以太网入户$kp$, content = $kp$“光纤到楼、以太网入户”（FTTx+ETTH）：采用1000Mbps光纤以太网作为城域网的干线，实现1000M/100M以太网到大楼和小区，再通过100M以太网到楼层或小型楼宇，然后以10M以太网入户或者到办公室和桌面，满足多数情况下用户对接入速度的需求。$kp$, section = '' where id = 22950;
update t_knowledge_point set title = $kp$光纤高速传输干线$kp$, content = $kp$SDH基本速率单位为155.520Mbps，其速率分级名称为同步传输模块STM；SONET的电信号称为同步传输信号STS，光信号称为光载波OC，基本速率单位是51.840Mbps。

两者的对应关系为：STM-0（OC-1/STS-1）速率为51.840Mbit/s，话路数目810；STM-1（OC-3/STS-3）速率为155.520Mbit/s，话路数目2430；STM-4（OC-12/STS-12）速率为622.080Mbit/s，话路数目9720；STM-16（OC-48/STS-48）速率为2488.320Mbit/s，话路数目38880；STM-64（OC-192/STS-192）速率为10.7Gbit/s，话路数目155520。$kp$, section = '' where id = 22953;
update t_knowledge_point set title = $kp$家庭用户拨号上网的过程$kp$, content = $kp$1. 用户PC机通过MODEM呼叫ISP（因特网服务提供商）的路由器。
2. 路由器一边的MODEM响应电话呼叫，建立一个物理连接。
3. PC机按PPP协议向路由器发送一系列消息与路由器协商，选择所使用的PPP参数，配置网络层，并获得一个IP地址；由于ISP没有足够数目的IP地址，不能为每个用户固定分配1个，只能临时动态分配。
4. PC机成为因特网上的一台主机，可以进行各种网络应用。
5. 当PC机不再需要联网时，PPP协议用来断开网络层的连接，释放IP地址，断开链路层的连接。
6. PC机通知MODEM断开电话线路，释放物理层的连接。$kp$, section = '' where id = 22984;
update t_knowledge_point set title = $kp$互联网接入技术的比较$kp$, content = $kp$电话拨号：使用电话线和拨号Modem，最高56kbps，受电话线和连接质量的影响。

ADSL：使用电话线、ADSL Modem和以太网卡，下行1Mbps～8Mbps，上行64kbps～256kbps，无需拨号，上网与通话可同时进行。

有线电视：使用同轴电缆、Cable MODEM和以太网卡，下行最快可达36Mb/s，上行320kb/s～10Mb/s，速率受同时上网的用户数目影响。

光纤接入：使用光纤、光网络单元和以太网卡等，速率10Mbps～1000Mbps，可以将整个局域网接入。

无线局域网（WLAN）：使用Wi-Fi无线网卡和无线接入点（AP），速率11Mbps～100Mbps，必须在安装有Wi-Fi接入点的热点区域中才能接入。

GPRS移动电话网：使用GPRS无线网卡，速率56kb/s～114kb/s，方便但速率不快、费用较高。

3G移动电话网：使用3G无线网卡，速率几百kbps～3Mbps，方便但费用较高。$kp$, section = '' where id = 22999;
update t_knowledge_point set title = $kp$ATM技术要点$kp$, content = $kp$异步传输模式（ATM）是一种重要的广域网技术。

它试图设计一种单一的技术在广域内提供语音、动态图像和数据服务，其中包的尺寸是关键问题之一。ATM把数据分成较小的固定大小的包，称为信元（cell），每个ATM信元包括53个字节（5个字节的头部信息，48个字节的数据）。

ATM网交换机有多个端口，每个端口可连接另一台交换机或者一台计算机。多数ATM网使用光纤作为通信介质，例如ATM交换机上的一个典型端口其运行速率为OC-3（155Mbps）或者更高。$kp$, section = '' where id = 23024;
update t_knowledge_point set title = $kp$广域网的通信子网$kp$, content = $kp$通信子网是进行数据通信的子网，是网络中的数据通信系统，主要任务是实现计算机之间的数据传输。

通信子网由传输线和交换单元组成：传输线也称线路、信道或干线，负责在交换单元之间传送数据；交换单元是一种特殊的计算机，用于连接数据传输线，可以是分组交换节点或路由器等设备。$kp$, section = '' where id = 23027;
update t_knowledge_point set title = $kp$电话拨号接入的设备与原理$kp$, content = $kp$通过本地公用电话网接入计算机网络。设备为电话MODEM（调制解调器），最高传输速率为56Kbps。

工作过程：计算机送出的数字信号经MODEM调制为适合在用户线上传输的音频模拟信号，经本地电话网传到对方MODEM，再解调为数字信号送入计算机网络。

缺点：传输速率低、每次都要拨号、上网时不能通电话、费用不便宜。$kp$, section = '' where id = 23038;
update t_knowledge_point set title = $kp$ADSL接入的设备与原理$kp$, content = $kp$不对称数字用户线（ADSL）也通过本地公用电话网接入计算机网络，需要配置ADSL Modem和以太网网卡。其原理是频分多路复用加数字调制。

传输速率：上传64kbps～256kbps，下行1～8Mbps。

特点：上网和通话互不影响；不需要缴付额外的电话费；传输速率可根据线路情况调整。

用户端通过分离器（滤波器）把电话线与ADSL Modem分开，电话信号送往电话交换机，数据信号经ADSL Modem送往ISP。$kp$, section = '' where id = 23039;
update t_knowledge_point set title = $kp$有线电视网接入（HFC）$kp$, content = $kp$有线电视已广泛采用光纤同轴电缆混合网（Hybrid Fiber Coaxial，简称HFC）进行信息传输：主干线路采用光纤连接到小区，然后用同轴电缆以总线方式接入用户。

用户端需要以太网卡和电缆调制解调器（Cable MODEM）。Cable MODEM的基本原理与ADSL相似，以频分多路复用的方式工作，小区内多个用户共享信道。

特点：上网和收看电视互不影响；传输速率受并发用户数目多少的影响。$kp$, section = '' where id = 23040;
update t_knowledge_point set title = $kp$光纤接入的三种方式$kp$, content = $kp$使用光纤作为计算机接入网络的主要传输介质，分为三种：

光纤到小区（FTTZ）：将光网络单元放置在小区，为整个小区服务。

光纤到大楼（FTTB）：将光网络单元放置在大楼内，以每栋楼为单位，提供高速数据通信、远程教育等宽带业务，主要为单位服务。

光纤到家庭（FTTH）：将光网络单元放置在楼层或用户家中，由几户或1户家庭专用，为家庭提供宽带业务。

“光纤到楼、以太网入户”（FTTx+ETTH）则通过楼道交换机、小区核心交换机、光网络单元和骨干交换机，以双绞线和光纤把住户接入城域网。$kp$, section = '' where id = 23041;
update t_knowledge_point set title = $kp$电缆调制解调技术的优缺点$kp$, content = $kp$优点：集调制/解调功能、加密/解密功能、网卡及集线器等功能于一身；无须拨号上网，不占用电话线，可永久连接；理论上没有距离限制，覆盖的地域很广。

缺点：Cable MODEM带宽充足（最高速率可以达到36Mbps），但它属于共享式的总线型网络，同一个接入点如果上网的用户增多，每一个用户能分配的带宽很有限，使数据传输速率不够稳定。

我国有线电视网用户已达8000多万，发展Cable MODEM有多方面的有利条件，但现有的有线电视网都是单向广播式，要实现Internet接入必须进行双向改造，这项工程的投资是巨大的。$kp$, section = '' where id = 23072;
update t_knowledge_point set title = $kp$电话拨号接入与MODEM的组成$kp$, content = $kp$家庭用户利用本地电话网，通过调制解调器拨号接入广域网。

调制解调器的组成与功能：调制器（Modulator）把数字信号转换为模拟信号；解调器（Demodulator）把模拟信号转换为数字信号。

工作过程：计算机送出的数字信号经MODEM调制为模拟信号，通过本地环路传到电话局，再经对方MODEM解调为数字信号送入计算机网络。$kp$, section = '' where id = 23074;
update t_knowledge_point set title = $kp$四种多路复用技术$kp$, content = $kp$时分多路复用（TDM）：各终端设备按不同时间轮流使用同一线路来传输数据，是计算机网络传输使用的复用方式。

频分多路复用（FDM）：将不同信源发出的信号调制在不同频率的载波上。

波分多路复用（WDM）：在一根光纤中传输不同波长的光波。

码分多路复用（CDM）：每个用户分配一个地址码，各个码型互不重叠，通信各方之间不会相互干扰，抗干扰能力强。$kp$, section = '' where id = 23080;
update t_knowledge_point set title = $kp$综合业务数字网（ISDN）的接口$kp$, content = $kp$ISDN的“用户—网络接口”有两类：

基群（一次群）速率接口PRI：包括30个B通道（数据通道）和一个D通道（信令通道），每个B通道和D通道均为64Kbps（称为30B+D），可提供2Mbps的数据通信速率，为单位用户的局域网与远程广域网互连提供了支持。

基本速率接口BRI：又称N-ISDN、“窄带ISDN”，俗称“一线通”。包括两个B通道（速率为64Kbps）和一个D通道（16Kbps，用作控制信道）（称为2B+D）。用户使用一条电话线就能实现两路数据传输，可以一边上网，一边同时打电话；如果2个通道都用作数据传输，则可提供128Kbps的数据通信速率。$kp$, section = '' where id = 23086;
update t_knowledge_point set title = $kp$频分多路复用举例：电视节目的发送与接收$kp$, content = $kp$电视节目的发送与接收是频分多路复用的典型例子。多路电视图像及其伴音分别经调制器调制到不同频率的载波上，由多路复用器合并后经电视信号发射器以电磁波形式发送；接收端由电视调谐器（分路器）选出所需频道，再经解调器还原出电视节目。

各频道载波频率：1频道87.75MHz、2频道95.75MHz、3频道103.75MHz、4频道115.25MHz、5频道123.25MHz、6频道206.25MHz、7频道214.25MHz、8频道222.25MHz、9频道230.25MHz、10频道238.25MHz、11频道246.25MHz、12频道254.25MHz。$kp$, section = '' where id = 23137;
update t_knowledge_point set title = $kp$多路复用技术的由来与分类$kp$, content = $kp$通信系统中，传输线路的建设和维护成本占整个系统成本的很大份额；而一条传输线路（铜线、光纤、无线电波）的容量通常远远超过传输 1 路用户信号所需的能力。

为降低成本，采用多路复用技术（Multiplexing）：多路信号使用同一条传输线路同时进行传输。

常见方法：频分多路复用（FDM）、时分多路复用（TDM）、波分多路复用（WDM）。$kp$, section = '' where id = 23141;
update t_knowledge_point set title = $kp$接入网的作用$kp$, content = $kp$接入网使用各种不同的接入技术，解决“最后一公里”问题，常见方式有：电话拨号接入、有线电视接入、ADSL 接入、光纤接入、无线接入。

用户通过接入网连接到宽带主干网，主干网由国家级主干网和若干 POP（接入点）组成。$kp$, section = '' where id = 23142;
update t_knowledge_point set title = $kp$有线载波通信$kp$, content = $kp$传输介质：架空明线、对称电缆、同轴电缆。

通信原理：利用频率分割原理，实现在有线信道上的多路复用。发信端各路信号对不同载波频率进行调制，分别搬移到不同的频带后，同时在同一线路上传输；收信端对线路信号放大后，按相反顺序用滤波器分开各路信号，经过解调恢复原来的信息。

应用范围：主要用来传输电话、电报、传真和数据，也可以传输广播、可视电话和电视节目。$kp$, section = '' where id = 23543;
update t_knowledge_point set title = $kp$Cable Modem 的频带划分$kp$, content = $kp$使用 Cable Modem 传输数据时，将同轴电缆的整个频带划分为 3 部分：

- 数字信号上传：5～42MHz
- 电视节目（模拟信号）下传：50～550MHz
- 数字信号下传：550～750MHz$kp$, section = '' where id = 23591;
update t_knowledge_point set title = $kp$卫星通信的轨道类型与特点$kp$, content = $kp$中、低轨道卫星：相对于地面是运动的，覆盖范围小，地面天线必须跟踪卫星，但损耗小、延时少。

同步定点卫星：位于赤道上空大约 36000 公里，相对于地面固定不动，覆盖范围大，三颗卫星几乎可以覆盖地球全部面积。

卫星通信的特点：通信距离远、频带宽、容量大、干扰小、较稳定；但造价高、技术复杂，有一定延时。$kp$, section = '' where id = 23603;
update t_knowledge_point set title = $kp$卫星通信与全球定位系统$kp$, content = $kp$卫星通信的一个重要应用是全球定位系统（GPS），它为地面用户提供实时的、全天候的、全球性的导航服务。$kp$, section = '' where id = 23604;
update t_knowledge_point set title = $kp$时分多路复用（TDM）$kp$, content = $kp$基本思想：各通信终端（计算机、电话）以规定的顺序和时间轮流使用同一传输线路进行数据传输。

工作原理：复用器按时间片依次把多路信号送上传输线路，解复用器在接收端按同样的顺序把各路信号分离还原。

应用：主要用于数字通信领域，如电话中继通信、GSM 手机、总线式以太网等。$kp$, section = '' where id = 23831;
update t_knowledge_point set title = $kp$三种交换方式的特点$kp$, content = $kp$电路交换：整个报文的比特流连续地从源点直达终点，好像在一个管道中传送。

报文交换：整个报文先传送到相邻结点，全部存储下来后查找转发表，转发到下一个结点。

分组交换：把报文划分为若干分组，单个分组（只是整个报文的一部分）传送到相邻结点，存储下来后查找转发表，转发到下一个结点。$kp$, section = '' where id = 23841;
update t_knowledge_point set title = $kp$非对称数字用户线（ADSL）$kp$, content = $kp$数字用户线（DSL）技术：通过本地电话环路提供数字服务的新技术中最有效的类型之一，有多种变化，名称只在前几个字上不同，统称为 xDSL。

非对称数字用户线（ADSL）：提供高速发送和接收数字信息的能力，是为接收信息远多于发送信息的用户而优化的技术，下行流速率高于上行流。

数据上传速率：640Kbps～1Mbps；数据下行速率：1Mbps～8Mbps（理想状态下最大可达 10Mbps）。$kp$, section = '' where id = 23843;
update t_knowledge_point set title = $kp$光纤通信的瓶颈与全光网$kp$, content = $kp$光纤通信的瓶颈之一是光信号的传输距离，焦点在“信号放大”。

普通光纤网络中，信息每隔 200km～500km 需加入电放大器，将光信号还原成电信号进行放大，然后再转换成光信号继续传输。这不仅增加成本，还使进一步提高带宽越来越困难，超高速传输带来的经济效益会被昂贵的光/电和电/光转换所抵消。

全光网（All Optical Network）：光信息流在通信网络中的传输及交换始终以光的形式存在，不需要经过光/电、电/光转换，是光纤通信领域的前沿技术。$kp$, section = '' where id = 23920;
update t_knowledge_point set title = $kp$卫星通信与 GPS 定位原理$kp$, content = $kp$卫星通信：中继站设在人造地球卫星上的一种微波通信。

优点：通信距离远、频带宽、容量大、抗干扰强、通信稳定。缺点：造价高、技术复杂、有较大延时，同步轨道卫星数目仅约 180 颗。

赤道上方约 35800 公里处为地球同步轨道，卫星运行周期与地球自转周期相同，从地面看静止不动。一颗同步轨道卫星覆盖约 120°，3 颗同步定点卫星可以覆盖地球的几乎全部面积，实现全天候通信。

例：美国 GPS 系统由 30 多颗卫星在 1.2 万公里高空以 12 小时的周期绕地球运行，地面任意点在任何时刻都可同时观测到 4 颗以上卫星。由于卫星位置精确可知，地面接收机测得与各卫星的距离后，利用三维坐标中的距离计算公式即可推算出接收机所在地的经度、纬度和高程。定位精度：民用约 10 米，军用高得多。$kp$, section = '' where id = 23951;
update t_knowledge_point set title = $kp$卫星通信的特点$kp$, content = $kp$卫星通信的特点是：通信范围大，只要在卫星发射的电波覆盖范围内，任意两点之间都可进行通信；不易受陆地灾害的影响，可靠性高；只要设置地球站电路即可开通，开通迅速；可同时在多处接收，能经济地实现广播和多址通信；电路设置灵活，可随时分散过于集中的话务量；同一信道可用于不同方向或不同区间，即多址联接。$kp$, section = '' where id = 23953;
update t_knowledge_point set title = $kp$调制解调器的作用$kp$, content = $kp$通信一般是双向进行的，收发双方都需要调制器与解调器，它们通常做在一起，称为调制解调器（MODEM）。

信源信号经调制器调整载波的某个参数（幅度、频率或相位）；调制后的载波信号携带着被传输的信号在信道中进行长距离传输；到达目的地后，用解调器把载波所携带的信号检测出来，恢复为原始信号的形式。$kp$, section = '' where id = 23978;
update t_knowledge_point set title = $kp$数字信号的三种调制方法$kp$, content = $kp$用基带信号（两个状态）去控制高频正弦波载波的某个参数，得到三种键控方式：幅移键控（ASK）、频移键控（FSK）、相移键控（PSK）。

实现信号调制与解调的设备分别称为调制器和解调器。通信一般双向进行，收发双方都需要调制器与解调器，它们通常做在一起，称为调制解调器（MODEM）。$kp$, section = '' where id = 24000;
update t_knowledge_point set title = $kp$远程数字通信线路$kp$, content = $kp$远程数字通信线路采用：数字电话线路、光纤高速传输干线。$kp$, section = '' where id = 24105;
update t_knowledge_point set title = $kp$四种无线接入技术的比较$kp$, content = $kp$| 接入技术 | 使用的接入设备 | 数据传输速率 | 说明 |
| --- | --- | --- | --- |
| 无线局域网（WLAN）接入 | Wi-Fi 无线网卡、无线接入点 | 11Mbps～100Mbps | 必须在安装有接入点（AP）的热点区域中才能接入 |
| GPRS 移动电话网接入 | GPRS 无线网卡或 GSM 手机 | 56kb/s～114kb/s | 方便，有手机信号的地方就能上网，但速率不快、费用较高 |
| 3G 移动电话网接入 | 3G 无线网卡或 3G 手机 | 几百 kbps～几 Mbps | 方便，有 3G 信号的地方就能上网，但费用较高 |
| 4G 移动电话网接入 | 4G 无线网卡或 4G 手机 | 几十～100Mbps 左右 | 同上，传输速率更快 |

注：我国 3G 移动通信有三种技术标准（中国移动的 TD-SCDMA、中国电信的 CDMA2000、中国联通的 WCDMA），各自使用专门的上网卡，相互并不兼容。$kp$, section = '' where id = 24231;
update t_knowledge_point set title = $kp$无线通信系统：微波、卫星与移动通信$kp$, content = $kp$一、微波通信

微波是频率极高的电磁波，介于无线电波与光波之间，频率 300MHz～300GHz，波长 1m～1mm。微波不能沿地面绕射传播，也不能经电离层反射传播。远距离微波通信方式有地面微波接力通信、卫星通信、对流层散射通信。微波通信容量大、建设费用省、抗灾能力强。

二、卫星通信

卫星轨道有两种：中、低轨道卫星相对于地面是运动的，覆盖范围小，地面天线必须跟踪卫星，但损耗小、延时少；同步定点卫星位于赤道上空大约 36000 公里，相对于地面固定不动，覆盖范围大，三颗卫星几乎可以覆盖地球全部面积。卫星通信的特点是通信距离远、频带宽、容量大、干扰小、较稳定，但造价高、技术复杂，有一定延时。

三、移动通信系统

移动通信是指处于移动状态的对象之间的通信，包括蜂窝移动、集群调度、无绳电话、寻呼系统和卫星系统。第一代移动通信采用模拟技术；第二代广泛采用数字技术（GSM、CDMA）；第三代的目标是全球漫游、适应多种环境、提供高质量多媒体业务以及大容量、高保密性和优质服务。

系统组成：移动台是移动的通信终端，包括手机、呼机、无绳电话等；基站是与移动台联系的固定收发机，负责与一个特定区域（10km～20km）内所有移动台进行通信；移动交换中心与基站之间通过无线微波、电缆或光缆交换信息，再与公共电话网连接。各基站的有效区域既相互分割又彼此交叠，整个移动通信网形如蜂窝，故称蜂窝式移动通信。$kp$, section = '' where id = 24232;
update t_knowledge_point set title = $kp$综合业务数字网（ISDN）$kp$, content = $kp$通过普通电话的本地环路向用户提供数字语音和数据传输服务。$kp$, section = '' where id = 24688;
update t_knowledge_point set title = $kp$MODEM 的类型$kp$, content = $kp$外置式、内置式、PCMCIA 插卡式。$kp$, section = '' where id = 24720;
update t_knowledge_point set title = $kp$无线通信分类与移动通信代际特点$kp$, content = $kp$无线通信的特点：频率越来越高、波长越来越小、绕射能力越来越弱（微波基本无绕射能力）。

一、微波通信

直线传播，遇到障碍物会影响正常通信，无绕射能力，可以穿透电离层而不返回地面；既可传输电话，也可传输电视图像。

二、卫星通信

中继站设在人造卫星上，通信距离远、频带宽、容量大、抗干扰强、通信稳定，但造价高、技术复杂、延时大。

四大卫星定位系统：美国 GPS、俄罗斯格洛纳斯、欧洲伽利略、中国北斗（BDS）；服务方式分开放服务和授权服务。

三、移动通信

指处于移动状态的对象之间的通信。组成三要素：移动台（手机等不带线的可移动通信设备，与基站无线连接）、基站（与移动台联系的一个无线信号收发机）、移动电话交换中心（与基站有线或无线连接）。

个人移动通信系统的发展：

- 第一代：采用模拟通信技术，仅限电话通信，使用 FDM。
- 第二代：采用数字通信系统，GSM（中国移动、中国联通）、CDMA（中国电信）；可语音通信，还可进行低速数据业务，如收发短信、传输文本；使用 TDM。
- 第三代：频段成倍增长，数据传输能力比 2G 高十倍，可进行高质量多媒体通信和接入互联网应用；有三种技术标准：中国移动 TD-SCDMA（时分-同步码分多址接入）、中国联通 WCDMA、中国电信 CDMA2000；特点是网络互通但终端设备不兼容。
- 第四代：中国移动 TD-LTE 制式，中国电信和中国联通 FDD-LTE 制式，终端设备（手机、上网卡）采用多模多频工作方式；两种制式均支持 3G、2G。

常见错误说法：电波通过自由空间传播时能量集中、传输距离可以很远；激光能在长距离内保持聚焦并能穿透物体，因而可以传输很远的距离。$kp$, section = '' where id = 25256;
update t_knowledge_point set title = $kp$因特网的接入方式$kp$, content = $kp$一、电话拨号接入

利用本地电话网络（电话线）接入：计算机送出的数字信号经频率调制或相位调制变成音频模拟信号；接收方 ISP 的解调器再把模拟信号恢复成数字信号，然后接入局域网或互联网。数据传输率很低，为 56kbps；上网时无法通话；与打电话一样按通话时间计费。

二、ADSL（不对称数字用户线）接入

也通过本地电话网络即电话线接入。不需要改变电话的本地环路，只需在线路两端加装 ADSL 设备（专用的 ADSL MODEM）和语音分离器（滤波器）。计算机中安装一块 10M/100M 以太网网卡，网卡与 ADSL MODEM 之间用双绞线连接；MODEM 把电话线中的电话信号与数据信号分开。适合接收信息远多于发送信息的用户，下行带宽大于上行带宽。ADSL 使用频分多路复用，一条电话线可以同时打电话和传输数据，两者互不影响；ADSL 传输的数据不经过电话交换机，因此上网和打电话两不误。ADSL 的数据传输速率根据线路情况自动调整，是尽力而为的传输。

三、有线电视网接入

有线电视（Cable TV 或 CATV）系统采用光纤同轴电缆混合网（HFC）传输电视节目：主干为光纤，从广电接入小区；最后 1 公里使用同轴电缆以树形总线方式接入用户住所。HFC 传输容量大、抗电子干扰能力强，可传输频道多、质量高的广播电视节目，还能提供高速数据传输和信息增值服务，以及数字电视点播服务。借助 HFC 接入互联网时，主机端采用以太局域网技术，同轴电缆到用户主机需使用 Cable MODEM（电缆调制解调器），其原理与 ADSL 相似；数据通信与电视信号传输互不影响，上网仍可看电视。Cable MODEM 还提供以太网接口，可连接 PC 网卡和路由器。

四、光纤接入

以光纤作为传输介质，电信号与光信号在两端相互转换。按光网络单元的位置划分：光纤到路边（FTTC）为单位和小区提供服务；光纤到小区（FTTZ）；光纤到大楼（FTTB）适合事业单位；光纤到家庭（FTTH）适合一户或多户家庭。一般采用“光纤到楼、以太网入户”（FTTx、ETTH），以千（万）兆位光纤以太网作为城域网干线，实现 1000M/100M 以太网到大楼和小区，再通过 100M 以太网到楼层或直接入户。光猫（光 MODEM）负责光信号的调制与解调（光信号→电信号）、通信协议的转换，并可集成无线路由器功能。

五、无线接入

包括无线局域网（WLAN）接入、GPRS 移动电话网接入、3G 移动电话网接入、4G 移动电话网接入。其中 GPRS 是在第二代移动通信系统 GSM 基础上发展出来的，基于分组交换的数据通信业务，有人称其为 2.5G。$kp$, section = '' where id = 25267;
update t_knowledge_point set title = $kp$移动通信的组成与个人移动通信的发展$kp$, content = $kp$移动通信指处于移动状态的对象之间的通信。

组成三要素：移动台（手机等不带线的可移动通信设备，与基站无线连接）、基站（与移动台联系的一个无线信号收发机）、移动电话交换中心（与基站有线或无线连接）。其代表是个人移动通信系统。

个人移动通信的发展：

- 第一代：采用模拟通信技术，仅限电话通信，使用 FDM。
- 第二代：采用数字通信系统，GSM（中国移动、中国联通）、CDMA（中国电信）；可语音通信，还可进行低速数据业务，如收发短信、传输文本；使用 TDM。
- 第三代：频段成倍增长，数据传输能力比 2G 高十倍，可进行高质量多媒体通信和接入互联网应用；有三种技术标准：中国移动 TD-SCDMA（时分-同步码分多址接入）、中国联通 WCDMA、中国电信 CDMA2000；特点是网络覆盖互通，但终端设备不兼容。
- 第四代：中国移动 TD-LTE 制式，中国电信和中国联通 FDD-LTE 制式，终端设备（手机、上网卡）采用多模多频工作方式；两种制式均支持 3G、2G。

应用：对流层散射通信、长途电话、全数字高清晰度电视（HDTV）、手机 Wi-Fi 与蓝牙。$kp$, section = '' where id = 25297;
update t_knowledge_point set title = $kp$调制解调器的工作原理$kp$, content = $kp$MODEM 是调制解调器，它能把计算机的数字信号转换成可沿普通电话线传送的模拟信号，这些信号由线路另一端的调制解调器接收，并还原成计算机能识别的数字信号。

调制器（Modulator，D/A 转换）：数字信号→模拟信号；解调器（Demodulator，A/D 转换）：模拟信号→数字信号。$kp$, section = '' where id = 25351;
update t_knowledge_point set title = $kp$点到点连接组建广域网$kp$, content = $kp$点到点连接方式组建广域网，一种是组成全连通式网络，所有路由节点互相连通，但成本太高；另一种是用网桥或 Modem 进行点到点连接，个人用户使用 Modem 接入广域网，局域网使用网桥或路由器接入。

点到点连接包括专用线路网和电路交换网。专线方式会在两个节点之间建立一个安全永久的信道，数据传输时不需要建立连接或进行拨号，是点到点连接的网络；典型的专线网采用异步模拟专线和数字同步专线。

点到点永久性独占线路具有固定带宽。DTE 是客户端设备，DCE 是服务器端，由运营商设定时钟并指定带宽。链路层常使用 HDLC、PPP 等协议。$kp$, section = '' where id = 25476;
update t_knowledge_point set title = $kp$ADSL 接入方式与 TCP/IP 协议模型$kp$, content = $kp$一、ADSL 的两种接入方式

虚拟拨号接入：用户通过电脑的拨号软件拨号（填写用户名和密码），通过身份验证后获得一个动态 IP，即可连通网络。

专线接入：以固定 IP、自动连接为特点，类似专线的方式。

两者的区别：虚拟拨号多用于家庭，IP 随机获取，带宽共享；专线接入一般用于企业用户，有固定的外网 IP，带宽单独固定。

二、其他接入方式

有线电视网接入：可提供较高的带宽，但同一网段内同时上网的用户数目较多时，各用户得到的有效带宽会下降。

光纤接入：光纤到楼（FTTB）指局端与用户之间完全以光纤作为传输媒体，可分为有源光接入和无源光接入。

虚拟专用网（VPN）：在公用网络上建立专用网络，进行加密通讯，在企业网络中有广泛应用；通过对数据包的加密和数据包目标地址的转换实现远程访问，可通过服务器、硬件、软件等多种方式实现。

三、TCP/IP 协议模型

互联网采用统一的网络通信协议，核心是 TCP/IP 协议族，其中包含一百多个协议，IP 协议是核心。

TCP/IP 四层与 OSI/RM 七层的对应：应用层（对应 OSI 的应用层、表示层、会话层；Telnet、FTP、SMTP、DNS、HTTP 及其他应用协议）、传输层（TCP、UDP）、网络层（IP、ARP、RARP、ICMP）、网络接口层（各种通信网络接口，即物理网络）。

各层功能、主要设备及协议：应用层实现具体的应用功能（POP3、FTP、HTTP、Telnet、SMTP、DHCP、TFTP、SNMP、DNS）；表示层负责数据的格式与表达、加密、压缩；会话层负责建立、管理和终止会话；传输层提供端到端的连接（TCP、UDP）；网络层负责分组传输和路由选择（三层交换机、路由器；ARP、RARP、IP、ICMP、IGMP）；数据链路层传送以帧为单位的信息（网桥、交换机、网卡；PPTP、L2TP、SLIP、PPP）；物理层进行二进制传输（中继器、集线器）。

应用层协议：SMTP（简单邮件传输）、POP3（邮件接收）、Telnet（远程登录）、DNS（域名解析）、HTTP（超文本传输）、FTP（文件传输）。

TCP 协议：面向连接、可靠。它不仅是计算机到计算机的通信，而且是端到端的通信，即源计算机的某个应用与目的计算机的某个应用之间的通信。数据传输之前，客户端与服务器需先建立可信任的连接，传输结束后再断开；通过超时重传、流量控制、数据包序号检查、检验和等机制，确保数据包不丢失、不重复、不乱序、不出错。

UDP 协议：无连接、不可靠、尽力而为，适合音频视频传输，也是端到端。传送的数据称为 UDP 数据报，首部开销小，只有 8 个字节；传送数据之前不需要建立连接，接收方收到 UDP 报文后也不需要给出确认，因此通信开销少、效率高；传输途中出现丢包不负责重发，数据包乱序也不负责纠正，由采用 UDP 的应用自行处理。主要用于需要在计算机之间高速传输数据的网络应用，如数据包问题少的通信（DNS、SNMP 等）、视频音频等多媒体通信、限定于 LAN 等特定网络中的应用通信以及广播和多播通信。

网络互连层：IP 协议、ARP（地址解析协议，IP 到 MAC）、RARP（反向地址解析协议，MAC 到 IP）、ICMP（Internet 控制报文协议），路由器工作在这一层。

网络接口和硬件层：中继器、集线器、网卡。

TCP/IP 的优点：适用于异构网络的互连、确保可靠的端到端通信、与操作系统紧密结合、支持多种网络连接服务。$kp$, section = '' where id = 25484;
update t_knowledge_point set title = $kp$5G 三大应用场景$kp$, content = $kp$eMBB（增强移动宽带）：GB/秒级移动通信、3D/超高清视频、VR/AR、云办公、云游戏等。

mMTC（海量机器类通信）：智能家庭、工业自动化、M2M、智能城市等。

URLLC（超高可靠低时延通信）：自动驾驶、移动医疗等高可靠、低时延应用。$kp$, section = '' where id = 25582;
update t_knowledge_point set title = $kp$频谱效率$kp$, content = $kp$定义：峰值频谱效率为理想情况下峰值速率与所占带宽的比值，单位 bit/s/Hz；平均频谱效率为小区内所有用户的总速率与所占带宽及天线端口数的比值，单位 bit/s/Hz/TRxP。

使用场景：eMBB。

指标：下行峰值频谱效率 > 30bit/s/Hz，上行峰值频谱效率 > 15bit/s/Hz。$kp$, section = '' where id = 26044;
update t_knowledge_point set title = $kp$可靠性$kp$, content = $kp$定义：在规定时间段 1ms 内成功传输指定大小 32byte 数据包的概率。

使用场景：uRLLC。

指标：下行可靠性 > 99.999%，上行可靠性 > 99.999%。$kp$, section = '' where id = 26045;
update t_knowledge_point set title = $kp$用户面时延$kp$, content = $kp$定义：发送者发出数据包到接收者收到数据包的过程中，无线网络部分（空口）所引入的单向时间延迟，单位为 ms。

使用场景：eMBB、uRLLC。

指标：eMBB 4ms，uRLLC 1ms。$kp$, section = '' where id = 26192;
update t_knowledge_point set title = $kp$广域网结构与接入技术概述$kp$, content = $kp$广域网结构分为通信子网与资源子网。

广域网接入技术包括传统的 DDN、FR、ISDN，以及 ADSL、HFC、VPN 等较新的技术。$kp$, section = '' where id = 26763;
update t_knowledge_point set title = $kp$电话拨号接入的调制与解调$kp$, content = $kp$电话拨号接入技术使用调制解调器实现数字信号与模拟信号之间的转换：调制（D/A）为数字信号→模拟信号；解调（A/D）为模拟信号→数字信号。

ADSL 接入即不对称数字用户线接入。$kp$, section = '' where id = 27438;
update t_knowledge_point set title = $kp$ADSL 的安装与连接$kp$, content = $kp$ADSL 技术在已有电话线上改造，需要配置 ADSL Modem、安装网卡，网卡与 ADSL Modem 之间用双绞线连接。$kp$, section = '' where id = 27439;
update t_knowledge_point set title = $kp$ADSL 的尽力而为传输$kp$, content = $kp$ADSL 根据线路情况自动调整数据传输速率，尽力而为地传输，可以提供较高的上网速率。$kp$, section = '' where id = 27440;
update t_knowledge_point set title = $kp$有线电视网的 HFC 结构$kp$, content = $kp$有线电视网络已经广泛采用光纤同轴电缆混合网（HFC）进行信息传输，网络的主干部分是光纤，同轴电缆入户。$kp$, section = '' where id = 27441;
update t_knowledge_point set title = $kp$Cable Modem 的连接方式$kp$, content = $kp$有线电视网络使用 Cable Modem，通过双绞线与主机有线网卡进行连接，无须拨号，可永久连接。$kp$, section = '' where id = 27442;
update t_knowledge_point set title = $kp$虚拟专网（VPN）$kp$, content = $kp$虚拟专网（VPN）把公司的计算机连接成一个公司的网络；不同城市和地区子公司的网络通过构建虚拟专用网（VPN）实现互联。$kp$, section = '' where id = 27445;
update t_knowledge_point set title = $kp$电话拨号接入的局限$kp$, content = $kp$电话拨号接入时，上网与打电话不能同时进行。$kp$, section = '' where id = 27947;
update t_knowledge_point set title = $kp$ADSL 上网与通话并行$kp$, content = $kp$ADSL 使用频分多路复用技术，打电话与上网可以同时进行。$kp$, section = '' where id = 27948;
update t_knowledge_point set title = $kp$有线电视电缆上的三类信号$kp$, content = $kp$有线电缆上传输三类信号：数据上传、数据下传、电视节目下传，因此上网与看电视可以同时进行。$kp$, section = '' where id = 27949;
update t_knowledge_point set title = $kp$光纤接入$kp$, content = $kp$光纤接入以光纤作为传输介质，光信号经光网络单元（光猫）转换为电信号后送入用户设备。按光网络单元的位置分为光纤到路边（FTTC）、光纤到小区（FTTZ）、光纤到大楼（FTTB）和光纤到户（FTTH）。$kp$, section = '' where id = 28404;
update t_knowledge_point set title = $kp$有线电视网络中的时分与频分复用$kp$, content = $kp$有线电视网络同时使用频分和时分多路复用：频分用于传送电视节目，时分用于计算机网络的数据传输。$kp$, section = '' where id = 28515;
update t_knowledge_point set title = $kp$有线电视网络共享带宽；路由器至少设置两个 IP 地址$kp$, content = $kp$有线电视网络采用共享带宽，同一网络中的用户共同分配带宽。
路由器至少需要设置两个 IP 地址，分别属于它所连接的不同网络。$kp$, section = '' where id = 28541;
update t_knowledge_point set title = $kp$调制与解调的作用：解决远距离传输问题$kp$, content = $kp$调制与解调用于解决信号远距离传输的问题：发送端把数字信号调制到载波上，接收端再解调还原。$kp$, section = '' where id = 28575;
update t_knowledge_point set title = $kp$载波信号是频率远高于被传输信号的正弦波$kp$, content = $kp$载波信号是频率比被传输信号高得多的正弦波，用来承载并传输信息。$kp$, section = '' where id = 28576;
update t_knowledge_point set title = $kp$有线电视电缆上同时传输三类信号$kp$, content = $kp$有线电视电缆上同时传输三类信号：数据上传、数据下传、电视节目下传，因此上网与看电视两不误。$kp$, section = '' where id = 28587;
update t_knowledge_point set title = $kp$调制解调器（MODEM）的调制与解调功能$kp$, content = $kp$调制解调器（MODEM）是可实现调制和解调功能的设备。
1) 调制：使用数字信号调整载波的参数，使信号转换成适合远距离传输的调制信号。
2) 解调：把接收到的调制信号转换为传输的原始信号。
3) 外置式调制解调器应接在计算机的串口或 USB 接口上。$kp$, section = '' where id = 29195;
update t_knowledge_point set title = $kp$虚拟专网（VPN）的概念与优点$kp$, content = $kp$1) 概述：架构在公用骨干网所提供的网络平台之上的逻辑网络，不是端到端的物理连接。
2) 实现虚拟专网常用的技术：隧道技术、加密、身份鉴别等。
3) 基于因特网的 VPN 具有节省费用、运行灵活、易于扩展、易于管理等优点。$kp$, section = '' where id = 29208;
update t_knowledge_point set title = $kp$ATM（异步传输模式）的特点$kp$, content = $kp$1) 多数使用光纤作为通信介质。
2) 采用定长短分组，即信元（53 字节）。
3) 传输速率为 155 Mbps。$kp$, section = '' where id = 29209;
update t_knowledge_point set title = $kp$数字有线电视的信号传输与接收$kp$, content = $kp$数字有线电视信号经过调制后，通过光纤和同轴电缆发送到用户；用户端由机顶盒解调，再送入传统电视机观看。$kp$, section = '' where id = 29247;
update t_knowledge_point set title = $kp$使用多路复用技术的目的$kp$, content = $kp$提高线路利用率，降低传输成本。方法：使用同一条传输线，同时传输多路信号。$kp$, section = '' where id = 29248;
update t_knowledge_point set title = $kp$多路复用的三种方式及 Cable Modem 的应用$kp$, content = $kp$1) 频分多路复用（FDM）：广播、电视使用。特点：同一时刻有多路信号，每一路信号使用一部分带宽。
2) 时分多路复用（TDM）：数字通信领域使用，如计算机网络、GSM 手机。特点：同一时刻只有一路信号，各路信号分时传输；在一个时间段内所有信号都在传输，每一路信号使用全部带宽；发送方与接收方可以不同步（异步）进行信息传输。
3) 波分多路复用（WDM）：光纤通信使用。特点：同一时刻有多路不同波长的光信号传输。
注：Cable Modem（有线电视 Modem，用于有线电视上网）采用频分多路复用 + 时分多路复用。频分用于将上网信号与有线电视信号同时传输（上网与看电视两不误）；时分用于上网带宽在所有的有线电视 Modem（如同一大楼内）之间共享。$kp$, section = '' where id = 29249;
update t_knowledge_point set title = $kp$调制解调器的调制方式：调幅、调频、调相$kp$, content = $kp$Modem（调制解调器）的功能是对载波信号进行调制和解调，调制的方法有三种：调幅、调频、调相。$kp$, section = '' where id = 29264;
update t_knowledge_point set title = $kp$调制解调器的种类$kp$, content = $kp$Modem（调制解调器）的种类有电话 Modem、ADSL Modem、Cable Modem 等。$kp$, section = '' where id = 29265;
update t_knowledge_point set title = $kp$信道多路复用的四种技术$kp$, content = $kp$信道多路复用技术主要有四种：时分复用（TDM）、频分复用（FDM）、波分复用（WDM）、码分复用（CDM）。$kp$, section = '' where id = 29266;
update t_knowledge_point set title = $kp$专用网络的构建方法$kp$, content = $kp$专用网络（政府网、金融网、教育网）的构建方法有：电话网连接（如 ISDN）、专线（如教育网）、虚拟专网 VPN（隧道技术）。$kp$, section = '' where id = 29275;
update t_knowledge_point set title = $kp$因特网的接入方案$kp$, content = $kp$因特网的接入方案有：
1) 电话拨号接入：如 ISDN（俗称一线通），需要 Modem，速率 56 kbps 和 128 kbps。
2) 不对称数字用户线技术：如 ADSL。
3) 电缆调制解调技术：即 Cable Modem 技术。
4) 光纤接入网：需要光网络单元 ONU。$kp$, section = '' where id = 29292;
update t_knowledge_point set title = $kp$Cable Modem 的特点$kp$, content = $kp$Cable Modem 是利用有线电视网高速传送数字信息的技术：上传速度可达 10 Mbps，下行速度可达 36 Mbps；不占用电话线；采用频分和时分两种多路复用技术；覆盖地域广；缺点是用户共享带宽。$kp$, section = '' where id = 29293;
update t_knowledge_point set title = $kp$光纤接入网的分类$kp$, content = $kp$光纤接入网分为：光纤到路边（FTTC）、光纤到小区（FTTZ）、光纤到大楼（FTTB）、光纤到家庭（FTTH）。$kp$, section = '' where id = 29294;
update t_knowledge_point set title = $kp$广域网接入技术、网络模型与 IP 地址要点$kp$, content = $kp$三、广域网接入技术
1) PSTN 电话拨号：需要有电话线、计算机（无网卡）和 Modem。特点：速度慢，只有 56 kbps，易掉线，电话费与上网费双重收费。
2) ISDN 综合业务数字网（一线通）：B 通道为数据通道，速率 64 kbps；D 通道为指令通道，速率 16 kbps；电话信号和网络信号都使用 B 通道。基本速率传输 BRI 为 2B+D，基群速率传输 PRI 为 30B+D。
3) ADSL 不对称数字用户线（宽带）：需要电话线、计算机（有网卡）和具有语音分离功能的 ADSL Modem；下行速度 1～8 Mbps，上行速度 640 kbps～1 Mbps。
4) Cable Modem 电缆调制解调技术（有线电视）：三个通道分别是数据上传通道、数据下行通道和模拟电视信号下行通道；下行速度 36 Mbps，但受用户使用量影响，实际约为 36 Mbps/N；上传速度 10 Mbps；在频分多路复用的基础上采用时分多路复用。
5) 光纤入户：需要有光纤信号收发器进行光电转换。光纤通信先进行电光转换，接收端再进行光电转换；全光网则不需要光电转换。
6) 无线网络：由移动台（无线网卡）、基站和移动交换中心组成，采用蜂窝式移动通信；无线网络不能脱离有线网络，是有线网络的有效补充，速度较低，一般 2 Mbps 左右。考点：不同厂家的无线网卡不兼容。
7) 局域网接入：安全性高，通过服务器提供网络连接。

四、网络模型
OSI 七层与 TCP/IP 四层的对应关系：应用层、表示层、会话层对应应用层；传输层对应传输层；网络层对应网络层；数据链路层、物理层对应网络接口层。
传输层负责传输控制，由 TCP 和 UDP 协议组成：TCP 是可靠传输协议，UDP 是非可靠传输协议，UDP 主要负责音频或视频信号。
网络层使用 IP 协议，传输数据报（由报头 + 数据组成），报头中封装了源计算机和目标计算机的 IP 地址，主要硬件是路由器。
考点：TCP/IP 是一个协议栈，包含一百多种协议，其中 TCP 和 IP 是最重要的两个协议；不同结构的网络之所以可以互相通信，是因为它们遵循了相同的协议，通过路由器将数据帧转为数据报，使数据脱离硬件。
数据链路层传输数据帧（帧头 + 数据 + 帧尾），帧头中封装了源计算机和目标计算机的 MAC 地址，帧尾封装了数据校验功能，主要硬件是交换机和网桥。
考点：每块网卡都有一个唯一地址，即 MAC 地址，是一个 48 位的地址，可以使用 ipconfig /all 查看。
物理层传输二进制数据流，硬件是集线器和中继器。

IP 地址：IPv4 为 32 位，IPv6 为 128 位。
IPv4 由四组 0～255 之间的数字构成，中间以英文句点隔开，由类型号 + 网络号 + 主机号构成。
A 类 IP 第一组数字在 1～126 之间，二进制最高位是 0，第一组是网络号，后三组是主机号。$kp$, section = '' where id = 29327;
update t_knowledge_point set title = $kp$调制解调器的作用$kp$, content = $kp$调制解调器（Modem）把计算机的数字信号转换成可在通信线路上传输的信号，由线路另一端的调制解调器接收，并还原成计算机可识别的信号。$kp$, section = '' where id = 29357;
update t_knowledge_point set title = $kp$Windows 中创建宽带连接、WIFI 连接与 Internet 选项设置$kp$, content = $kp$创建宽带连接的步骤：
1) 打开控制面板，进入“网络和共享中心”。
2) 单击“设置新的连接或网络”。
3) 单击“连接到 Internet”。
4) 单击“设置新连接”。
5) 单击“宽带”。
6) 输入账号和密码等连接信息。
通过 WIFI 连接：可以直接手动创建 WIFI 连接，也可以搜索到 WIFI 后直接连接。
Internet 选项：在控制面板中把查看方式改为大图标或小图标并显示隐藏的图标，进入“网络和共享中心”后点击“Internet 选项”，也可在控制面板中直接打开；重点掌握“安全”选项卡中安全级别的文字描述。$kp$, section = '' where id = 29399;
update t_knowledge_point set title = $kp$多路复用技术及其应用$kp$, content = $kp$多路复用解决成本问题：多路信号同时公用一条传输线路进行传输，可提高信道利用率、降低通信成本。
1) 频分复用：每个信源发出的信号调制在不同频率的载波上，在同一传输线路上传输。应用举例：广播、电视信号、ADSL 拨号。
2) 时分复用：终端（计算机）轮流使用同一传输线路。应用举例：计算机网络。
3) 波分复用：一根光纤中传输几种不同波长的光波。应用举例：光纤通信。
有线电视节目使用频分多路复用；有线电视网络使用时分多路复用 + 频分多路复用。$kp$, section = '' where id = 29426;
update t_knowledge_point set title = $kp$ADSL 的尽力而为传输$kp$, content = $kp$ADSL 采用尽力而为的传输方式：根据线路情况自动调整数据传输速率，可以提供较高的上网速率。$kp$, section = '' where id = 29441;
update t_knowledge_point set title = $kp$有线电视网络采用光纤同轴电缆混合网（HFC）$kp$, content = $kp$有线电视网络已经广泛采用光纤同轴电缆混合网（简称 HFC）进行信息传输：网络的主干部分是光纤，同轴电缆入户。$kp$, section = '' where id = 29442;
update t_knowledge_point set title = $kp$有线电视广播与有线电视网络使用的多路复用技术$kp$, content = $kp$有线电视广播使用频分多路复用技术，有线电视网络使用频分多路和时分多路复用技术。$kp$, section = '' where id = 29443;
update t_knowledge_point set title = $kp$Cable Modem 与主机的连接方式$kp$, content = $kp$有线电视网络使用 Cable Modem，通过双绞线与主机有线网卡进行连接，不需拨号、可永久连接。$kp$, section = '' where id = 29444;
update t_knowledge_point set title = $kp$光纤入网的方式$kp$, content = $kp$光纤入网包括光纤到路边（FTTC）、光纤到小区（FTTZ）、光纤到大楼（FTTB）、光纤到家庭（FTTH）。$kp$, section = '' where id = 29445;
update t_knowledge_point set title = $kp$帧中继、SMDS 与 ATM 的特点$kp$, content = $kp$1) FR（帧中继网）：传输速率可以达到 2 Mbps。
2) SMDS（交换多兆位数据服务）：工作速度高于帧中继，采用定长短分组。
3) ATM（异步传输模式）：多数使用光纤作为通信介质，采用定长短分组即信元（53 字节），传输速率 155 Mbps。$kp$, section = '' where id = 29458;
update t_knowledge_point set title = $kp$调制解调器的调制与解调$kp$, content = $kp$调制解调器是 PC 机传输数据时必须使用的设备。调制：把数字信号转换成模拟信号；解调：把模拟信号转换成数字信号。$kp$, section = '' where id = 29470;
update t_knowledge_point set title = $kp$几种因特网接入方式的特点$kp$, content = $kp$1) MODEM：网速慢，费用高，单向通行。
2) 不对称数字用户线技术（ADSL）：速度快，双向，上下行不对称，下载速度比上传快。
3) 虚拟专网（VPN）：不需要专门线路。
4) 电缆调制解调技术（也叫有线电视网）：用 Cable Modem 传输数据。
5) 光纤入网：光纤到小区（FTTZ）、光纤到大楼（FTTB）、光纤到家庭（FTTH）。$kp$, section = '' where id = 29471;
update t_knowledge_point set title = $kp$广域网技术与 TCP/IP 的分层结构$kp$, content = $kp$1) X.25：公共分组交换网，使用电话专线或电话拨号，电话上网速率 56 kbps。
2) 帧中继：传输速率可达到 2 Mbps。
3) SMDS：交换多兆位数据服务。
4) ATM：异步传输模式，属于广域网技术。
5) TCP/IP 协议集包含 100 多个协议，其中 TCP（传输控制协议）和 IP（网际协议）最重要。
6) OSI 参考模型分为 7 层：应用层、表示层、会话层、传输层、网络层、数据链路层、物理层；TCP/IP 分为 4 层：应用层、传输层、网络层、网络接口层。
7) 各层的典型协议与设备：应用层如 HTTP，传输层如 TCP、UDP（UDP 面向无连接），网络层主要设备是路由器，物理层设备如网卡、中继器。$kp$, section = '' where id = 29472;
update t_knowledge_point set title = $kp$多路复用技术提高线路利用率$kp$, content = $kp$为了提高网络中数据传输线路的利用率，必须采用多路复用技术，包括时分多路复用、频分多路复用、波分多路复用技术等。$kp$, section = '' where id = 29486;
update t_knowledge_point set title = $kp$接入因特网都需要 ISP 提供服务$kp$, content = $kp$单位用户和家庭用户可以选择多种方式接入因特网，但不论用哪种方式接入因特网，都需要因特网服务提供商（ISP）提供服务。$kp$, section = '' where id = 29493;
update t_knowledge_point set title = $kp$SMDS（交换多兆位数据服务）的特点$kp$, content = $kp$1) 工作速度高于帧中继。
2) 采用定长短分组传输。$kp$, section = '' where id = 30111;
update t_knowledge_point set title = $kp$通过 MODEM 电话拨号上网的过程与特点$kp$, content = $kp$计算机通过 MODEM 和电话线上网：计算机的数字信号经 MODEM 调制为模拟的语音信号，在电话线上传输；接收方经 MODEM 解调，将模拟信号还原成数字信号。因此这种方式 1) 要付电话费；2) 上网与打电话不能同时进行。$kp$, section = '' where id = 30125;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22596,22612,22613,22615,22621,22653,22659,22660,22673,22674,22704,22708,22738,22741,22745,22748,22749,22759,22760,22779,22784,22791,22794,22874,22941,22950,22953,22984,22999,23024,23027,23038,23039,23040,23041,23072,23074,23080,23086,23137,23141,23142,23543,23591,23603,23604,23831,23841,23843,23920,23951,23953,23978,24000,24105,24231,24232,24688,24720,25256,25267,25297,25351,25476,25484,25582,26044,26045,26192,26763,27438,27439,27440,27441,27442,27445,27947,27948,27949,28404,28515,28541,28575,28576,28587,29195,29208,29209,29247,29248,29249,29264,29265,29266,29275,29292,29293,29294,29327,29357,29399,29426,29441,29442,29443,29444,29445,29458,29470,29471,29472,29486,29493,30111,30125) and not deleted) <> 115 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
