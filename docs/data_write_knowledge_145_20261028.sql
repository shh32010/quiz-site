-- 知识点 145 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_145
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_145 as
select * from t_knowledge_point where id in (23569,26041,26252,26253,26254,26255,26374,26375,26416,26418,26437,26438,26819,27645,27646,27650,27665,28219,29802,29803,29898,29930,29964,29965);

update t_knowledge_point set title = $kp$Android 手机界面与汉字编码、机器语言$kp$, content = $kp$我国内地销售的 Android 智能手机，一般不使用 Android 所附带的用户界面和应用程序（即 GMS），而采用自研界面，如华为的 EMUI、小米的 MIUI、OPPO 的 ColorOS 等。

GB18030 是我国颁布的编码标准，也是当前包含汉字最多的编码标准；UCS 由国际标准化组织发布，与其等同的是由微软等公司共同制定的工业标准 Unicode。GB18030 与 Unicode 两者的汉字编码有很大区别。

机器语言就是二进制指令代码（机器代码），不需要语言处理系统，可被计算机直接执行。$kp$, section = '' where id = 23569;
update t_knowledge_point set title = $kp$电磁波的种类与频率范围$kp$, content = $kp$无线电波：10^4 ~ 10^11 Hz
中波：0.3 ~ 3 MHz
短波：3 ~ 30 MHz
超短波：30 ~ 300 MHz
微波：0.3 ~ 300 GHz
红外线：10^11 ~ 10^14 Hz
可见光：约 10^14 ~ 10^15 Hz
紫外线：10^14 ~ 10^16 Hz

无线电波用于无线广播、电视和通信。$kp$, section = '' where id = 26041;
update t_knowledge_point set title = $kp$无线通信系统与频段划分$kp$, content = $kp$通信领域中近些年发展最快、应用最广的就是无线通信技术。

根据频率、应用场合、传送信号类型的不同，常见的无线网络通信系统有无线 PDH（Plesiochronous Digital Hierarchy，准同步数字系列）、Wi-Fi（Wireless Fidelity）、移动网、WiMAX（Worldwide Interoperability for Microwave Access，全球微波接入互通技术）、蓝牙、对讲系统、LMDS（Local Multipoint Distribution Services，微波宽带业务）、MMDS（Microwave Multipoint Distribution Systems，微波多路分配系统）、卫星等。

国际电信联盟（International Telecommunications Union，ITU）对无线传输所使用的频段进行了正式命名，分别是低频（Low Frequency，LF）、中频（Medium Frequency，MF）、高频（High Frequency，HF）、甚高频（Very High Frequency，VHF）、特高频（Ultra High Frequency，UHF）、超高频（Super High Frequency，SHF）、极高频（Extremely High Frequency，EHF）和目前尚无标准译名的 THF（Tremendously High Frequency）。$kp$, section = '' where id = 26252;
update t_knowledge_point set title = $kp$微波通信$kp$, content = $kp$微波通信在无线数据通信中占有重要地位。微波的频率范围为 300MHz ~ 300GHz，但主要使用 1 ~ 40GHz 的频率范围。微波通信主要有两种方式，即地面微波接力通信和卫星通信。

地面微波系统由视距范围内两个互相对准方向的抛物面天线组成，长距离通信则需要多个中继站组成微波中继链路。

由于微波在空间是直线传播的，而地球表面是个曲面，因此其传输距离受到限制，一般只有 50km 左右。若采用 100m 高的天线塔，传输距离可增大到 100km。为实现远距离传输，必须在信道的两个终端之间建立若干个中继站，故称“接力通信”。$kp$, section = '' where id = 26253;
update t_knowledge_point set title = $kp$卫星通信$kp$, content = $kp$卫星通信是在地球站之间利用位于约 36000km 高空的同步卫星作为中继的一种微波接力通信。每颗卫星覆盖范围达 18000km，通常在赤道上空等距离地放置三颗相隔 120 度的卫星，就可覆盖全球。卫星通信的最大特点是通信距离远，基本没有盲区，缺点是传输时延长。

通信卫星可看作是悬在太空中的微波中继站。卫星上的转发器把波束对准地球上的一定区域，在此区域中的卫星地面站之间就可互相通信。地面站以一定的频段向卫星发送信息（称为上行频段），卫星上的转发器将接收到的信号放大并变换到另一个频段上（称下行频段）发回地面接收站。这样的卫星通信系统可以在一定的区域内组成广播式通信网络，特别适合于海上、空中、矿山、油田等经常移动的工作环境。卫星传输供应商可以将卫星信道划分成许多子信道出租给商业用户，用户安装甚小孔径终端系统（VSAT）组成卫星专用网，地面上的集中站作为收发中心与用户交换信息。$kp$, section = '' where id = 26254;
update t_knowledge_point set title = $kp$红外通信$kp$, content = $kp$红外传输系统利用墙壁或屋顶反射红外线来形成整个房间内的广播通信系统。这种系统所用的红外光发射器和接收器与光纤通信中使用的类似，也常见于电视机的遥控装置中。红外通信的设备相对便宜，可获得高的带宽。这种通信方式的缺点是传输距离有限，而且易受室内空气状态（如有烟雾等）的影响。$kp$, section = '' where id = 26255;
update t_knowledge_point set title = $kp$蓝牙$kp$, content = $kp$蓝牙（Bluetooth）是一种支持设备短距离通信（一般为 10m 以内）的无线电技术，能在移动电话、PDA、无线耳机、笔记本计算机、相关外设等众多设备之间进行无线信息交换。利用蓝牙技术，能够有效地简化移动通信终端设备之间的通信，也能够成功地简化设备与互联网之间的通信，从而使数据传输变得更加迅速高效。蓝牙支持点对点及点对多点通信，工作在全球通用的 2.4GHz ISM（即工业、科学、医学）频段，其数据速率为 1Mbps。采用时分双工传输方案实现全双工传输。$kp$, section = '' where id = 26374;
update t_knowledge_point set title = $kp$移动通信网、互联网与无线网络等关键技术$kp$, content = $kp$①移动通信网（Mobile Communication Network）

移动通信网指移动物体之间的通信，或移动体与固定体之间的通信。移动体可以是人、汽车、火车、收音机等物体。移动通信系统由空间系统和地面系统（卫星移动无线电台、天线、基站等）两部分组成。

②互联网（Internet）

互联网是指将两台及以上计算机终端、客户端、服务端通过计算机信息技术的手段互联，实现全球范围的信息交互网络。

③无线网络（Wireless Network）

在物联网中，要实现物品与人的无障碍交流，必然需要高速、可进行大批量数据传输的无线网络。无线网络即通过无线方式建立远距离全球语音和数据网络或近距离红外及射频技术。

④近程通信技术（Short Distance Wireless Communication）

近程通信技术是新兴的短距离连接技术，从很多无接触式的认证和互联技术演化而来。RFID 和蓝牙技术是其中的重要代表。$kp$, section = '' where id = 26375;
update t_knowledge_point set title = $kp$移动应用的便携性$kp$, content = $kp$相对于 PC，移动终端具有小巧轻便、可随身携带的特点，人们可以将其装入随身携带的书包和手袋中，并可以在任意场合接入网络。除了睡眠时间，移动设备一般都以远高于 PC 的使用时间伴随在其主人身边。这个特点决定了使用移动终端设备上网，可以带来 PC 上网无可比拟的优越性，即沟通与资讯的获取远比 PC 设备方便。用户能够随时随地获取娱乐、生活、商务相关的信息，进行支付、查找周边位置等操作，使得移动应用可以进入人们的日常生活，满足衣食住行、吃喝玩乐等需求。$kp$, section = '' where id = 26416;
update t_knowledge_point set title = $kp$移动应用的定位性$kp$, content = $kp$移动互联网有别于传统互联网的典型应用是位置服务应用，主要包括：位置签到、位置分享及基于位置的社交应用；基于位置围栏的用户监控及消息通知服务；生活导航及优惠券集成服务；基于位置的娱乐和电子商务应用；基于位置的用户情境上下文感知及信息服务。$kp$, section = '' where id = 26418;
update t_knowledge_point set title = $kp$D2D（终端直通）技术$kp$, content = $kp$传统的蜂窝通信系统的组网方式是以基站为中心实现小区覆盖，而基站及中继站无法移动，其网络结构在灵活度上有一定的限制。随着无线多媒体业务不断增多，传统的以基站为中心的业务提供方式已无法满足海量用户在不同环境下的业务需求。

D2D 技术无需借助基站的帮助就能够实现通信终端之间的直接通信，拓展网络连接和接入方式。由于是短距离直接通信，信道质量高，D2D 能够实现较高的数据速率、较低的时延和较低的功耗；通过广泛分布的终端，能够改善覆盖，实现频谱资源的高效利用；支持更灵活的网络架构和连接方法，提升链路灵活性和网络可靠性。

目前，D2D 采用广播、组播和单播技术方案，未来将发展其增强技术，包括基于 D2D 的中继技术、多天线技术和联合编码技术等。$kp$, section = '' where id = 26437;
update t_knowledge_point set title = $kp$超密集网络$kp$, content = $kp$在未来的 5G 通信中，无线通信网络正朝着网络多元化、宽带化、综合化、智能化的方向演进。随着各种智能终端的普及，数据流量将出现井喷式的增长。未来数据业务将主要分布在室内和热点地区，这使得超密集网络成为实现未来 5G 的 1000 倍流量需求的主要手段之一。

超密集网络能够改善网络覆盖，大幅度提升系统容量，并且对业务进行分流，具有更灵活的网络部署和更高效的频率复用。$kp$, section = '' where id = 26438;
update t_knowledge_point set title = $kp$无线电通信、微波通信、卫星通信、红外线通信与移动通信$kp$, content = $kp$无线电通信（radio communications）是将需要传送的声音、文字、数据、图像等电信号调制在无线电波上，经空间和地面传至对方的通信方式，即利用无线电磁波在空间传输信息的通信方式。

微波通信（Microwave Communication）是使用波长在 0.1 毫米至 1 米之间的电磁波——微波进行的通信，该波长段电磁波所对应的频率范围是 300MHz 至 3000GHz。

卫星通信简单地说就是地球上（包括地面和低层大气中）的无线电通信站之间利用卫星作为中继而进行的通信。卫星通信系统由卫星和地球站两部分组成。卫星通信的特点是：通信范围大，只要在卫星发射的电波所覆盖的范围内，从任何两点之间都可进行通信；不易受陆地灾害的影响，可靠性高；只要设置地球站电路即可开通，开通电路迅速；同时可在多处接收，能经济地实现广播、多址通信；电路设置非常灵活，可随时分散过于集中的话务量；同一信道可用于不同方向或不同区间。

红外线通信是一种利用红外线传输信息的通信方式，可传输语言、文字、数据、图像等信息，传输角度有一定限制。

移动通信（mobile communications）是沟通移动用户与固定点用户之间或移动用户之间的通信方式。$kp$, section = '' where id = 26819;
update t_knowledge_point set title = $kp$中波、短波与微波的传播特点$kp$, content = $kp$无线通信

① 中波：靠绕射传播，用于广播、海上通信。
② 短波：靠电离层反射，可进行环球通信。
③ 微波：直线传播。

手机通信使用的是微波。

卫星使用微波通信，3 颗卫星即可覆盖全球。我国自行研制的北斗导航系统是卫星通信系统的一种典型应用。$kp$, section = '' where id = 27645;
update t_knowledge_point set title = $kp$微波通信的特点与方式$kp$, content = $kp$微波通信建设费用低。

微波通信方式：卫星通信、对流层散射、地面接力。$kp$, section = '' where id = 27646;
update t_knowledge_point set title = $kp$蓝牙技术的特点$kp$, content = $kp$蓝牙是一种短距离、低速度、低成本的无线通信技术。$kp$, section = '' where id = 27650;
update t_knowledge_point set title = $kp$即时通信举例$kp$, content = $kp$即时通信的典型应用有 QQ、微信等。$kp$, section = '' where id = 27665;
update t_knowledge_point set title = $kp$微波通信方式$kp$, content = $kp$微波通信方式包括卫星通信、对流层散射、地面接力。$kp$, section = '' where id = 28219;
update t_knowledge_point set title = $kp$卫星通信系统的组成$kp$, content = $kp$卫星通信系统是利用人造地球卫星作为中继站转发无线电信号的，由通信卫星、地球站和信道三部分组成。$kp$, section = '' where id = 29802;
update t_knowledge_point set title = $kp$卫星通信的特点$kp$, content = $kp$卫星通信是微波接力通信技术和空间技术相结合的产物，具有通信距离远、频带宽、容量大、干扰小、信号稳定等特点。$kp$, section = '' where id = 29803;
update t_knowledge_point set title = $kp$无线通信要点$kp$, content = $kp$① 微波是直线传播。
② 微波通信包括卫星通信、移动通信。
③ 卫星通信的应用：GPS 导航、我国的北斗导航。
④ WiFi 只是有线通信的补充，不能取代有线通信。
⑤ 蓝牙是 WiFi 技术的补充：距离短、速率慢、安全性好、可靠性高。$kp$, section = '' where id = 29898;
update t_knowledge_point set title = $kp$微波通信的特点与方式$kp$, content = $kp$微波通信的特点：直线传播，每隔几十公里设立一个中继站，没有绕射能力；容量大、可靠性高、抗灾能力强，建设费用低。

微波通信方式：卫星通信、对流层散射、地面接力。

卫星通信以人造地球卫星作为中继站，并不存在“大气层通信”这一说法。

我国自行研制的北斗导航系统是卫星通信系统的一种典型应用。$kp$, section = '' where id = 29930;
update t_knowledge_point set title = $kp$NFC 的特点：距离近、能耗低$kp$, content = $kp$NFC 是一种能够提供安全、快捷通信的无线连接技术。由于 NFC 采取了独特的信号衰减技术，其他通信技术的传输范围可以达到几米甚至上百米，而 NFC 的通信距离不超过 20cm；由于其传输距离较近，能耗也相对较低。$kp$, section = '' where id = 29964;
update t_knowledge_point set title = $kp$NFC 更具安全性$kp$, content = $kp$NFC 是一种近距离连接技术，可提供各种设备之间距离较近的通信。NFC 是一种私密通信方式，加上其距离近、射频范围小的特点，其通信更加安全。$kp$, section = '' where id = 29965;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (23569,26041,26252,26253,26254,26255,26374,26375,26416,26418,26437,26438,26819,27645,27646,27650,27665,28219,29802,29803,29898,29930,29964,29965) and not deleted) <> 24 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
