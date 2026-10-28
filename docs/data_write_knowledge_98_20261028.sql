-- 知识点 98 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_98
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_98 as
select * from t_knowledge_point where id in (22579,22584,22603,22625,22679,22714,22737,22870,22872,22873,22978,23052,23053,23054,23055,23056,23057,23143,23531,24025,24076,25294,25310,25799,25800,25830,26075,26076,26078,26094,26372,26373,26448,26761,26855,27427,27428,27429,27430,27431,28177,28183,28184,28340,28577,29259,29365,29366,29367,29368,29369,29370,29371,29372,29373,29374,29375,29376,29377,29378,29379,29380,29381,29382,29384,29385,29386,29387,29434,29459,29489,29491,29492,30133,30256,31989,31990,31996,32001,32007,32008,32009);

update t_knowledge_point set title = $kp$Windows 10 检测不到无线网络的原因$kp$, content = $kp$在计算机中正确安装并配置无线网卡后，Windows 10 会自动检测所在范围内的无线网络。如果系统检测不到可访问的无线网络，可能的原因有：

(1) 计算机的无线开关已关闭；
(2) 无线路由器或无线接入点已关闭或工作不正常；
(3) 计算机与无线路由器或无线接入点的距离太远；
(4) 无线网络的 SSID 设置为不广播。$kp$, section = '' where id = 22579;
update t_knowledge_point set title = $kp$WPA 与 WPA2 安全类型$kp$, content = $kp$①、WPA2-个人、WPA-个人、WPA2-企业、WPA-企业这四种安全类型都属于 WPA，WPA2 是 WPA 的升级版。WPA3 标准包括个人、企业两种模式，同时还可以应用于物联网领域。
②、WPA 的设计可以用在所有的无线网卡上，但不一定能用在第一代的无线热点（比如无线路由器）上。WPA2 可能不能用在某些旧型号的网卡上。
③、WPA 和 WPA2 都采用 TKIP（本质是 WEP 补丁）或者 AES（对称，高级加密标准）加密方式，比 WEP 的加密级别高，因而更安全。
④、AES 是一个完全独立的加密算法，远远优于任何 TKIP 提供的算法，该算法有 128 位、192 位或 256 位的分组密码，所以 AES 的安全性能比 TKIP 好。
⑤、采用 AES 加密方式时，密码（网络安全密钥）长度要求为 8~63 个 ASCII 字符或 8~64 个十六进制字符，即可以设置 8~64 个字母、数字和英文标点符号的组合作为密码。$kp$, section = '' where id = 22584;
update t_knowledge_point set title = $kp$无线局域网的工作原理$kp$, content = $kp$无线局域网使用无线电波传输，电波覆盖范围较广，采用扩频方式通信，具有抗干扰、抗噪声和抗信号衰减的能力，通信比较安全，可较好地避免信息被偷听和窃取，具有很高的可用性。

主要协议为 802.11（俗称 Wi-Fi）和蓝牙。

无线局域网需使用无线网卡、无线接入点等设备构建，目前还不能完全脱离有线网络，只是有线网络的补充。

无线接入点（Wireless Access Point，简称 WAP 或 AP）实际上是一个无线交换机或无线 Hub，相当于手机通信中的“基站”。它把通过双绞线传送过来的电信号转换为无线电波发送出去，或接收无线电波并转换为双绞线上的电信号，使无线工作站之间以及无线工作站与有线局域网之间可以相互访问。无线 AP 的室外覆盖距离通常可达 100~300m，室内一般仅为 30m 左右。$kp$, section = '' where id = 22603;
update t_knowledge_point set title = $kp$蓝牙（IEEE 802.15）$kp$, content = $kp$蓝牙是一种短距离、低速率、低成本的无线通信技术，是个人无线区域网协议（IEEE 802.15）的基础。$kp$, section = '' where id = 22625;
update t_knowledge_point set title = $kp$无线局域网技术的优点$kp$, content = $kp$具有很好的灵活性；最大通信范围可达几十公里；无线局域网的组建、配置和维护较容易。$kp$, section = '' where id = 22679;
update t_knowledge_point set title = $kp$无线局域网技术的缺点$kp$, content = $kp$无线局域网还不能完全脱离有线网络，它只是有线网络的补充；产品比较贵；传输速度较慢（早期产品还达不到 2Mbps）。$kp$, section = '' where id = 22714;
update t_knowledge_point set title = $kp$WEP、WPA、WPA2 均采用对称加密$kp$, content = $kp$Wi-Fi 路由器中 WEP、WPA、WPA2 所采用的加密技术都属于对称加密算法，因此“Wi-Fi 采用非对称加密”的说法错误。$kp$, section = '' where id = 22737;
update t_knowledge_point set title = $kp$无线局域网的优点$kp$, content = $kp$具有很好的灵活性；最大通信范围可达几米至几公里；组网、配置和维护较容易。$kp$, section = '' where id = 22870;
update t_knowledge_point set title = $kp$无线局域网的组成与常用协议$kp$, content = $kp$无线局域网由无线网卡、无线接入点等设备组成。

无线接入点（Wireless Access Point，简称 WAP 或 AP）提供从无线节点对有线局域网、以及从有线局域网对无线节点的访问，实际上就是一个无线交换机。

无线局域网还不能完全脱离有线网络，它只是有线网络的补充。

常用协议及其性能：

| 协议名称 | 频段 | 最高传输速率 |
| --- | --- | --- |
| 802.11a | 5.8GHz | 54Mb/s |
| 802.11b | 2.4GHz | 11Mb/s |
| 802.11g | 2.4GHz | 54Mb/s |
| 802.11n | 2.4GHz/5GHz | 150Mb/s |
| 802.11ac | 5GHz | 1000Mb/s |
| 802.15（蓝牙） | 2.4GHz | 1Mb/s |
| NFC | 13.56MHz | 400kb/s |

AP 的产品形式有无线交换机和无线路由器。$kp$, section = '' where id = 22872;
update t_knowledge_point set title = $kp$无线局域网的缺点$kp$, content = $kp$还不能完全脱离有线网络，只是有线网络的补充；传输速度较慢；产品相对较贵。$kp$, section = '' where id = 22873;
update t_knowledge_point set title = $kp$无线自组网与临时组网方式$kp$, content = $kp$变通解决办法：将笔记本电脑设置为 AP；用 3G/4G/5G 手机作为 AP。

无线自组网（Ad hoc）是一种无线对等局域网，由一组无线工作站以自组织、多跳移动通信的方式构成。网络中的所有计算机都可以自由移动，均具有动态搜索、定位和恢复连接的能力，在军事上非常有用，也可用于会议室和家庭。$kp$, section = '' where id = 22978;
update t_knowledge_point set title = $kp$无线局域网的优缺点$kp$, content = $kp$优点：具有很好的灵活性；最大通信范围可达几十公里；组建、配置和维护较容易。

缺点：还不能完全脱离有线网络，只是有线网络的补充；产品比较贵；传输速度较慢（早期产品还达不到 2Mbps）。$kp$, section = '' where id = 23052;
update t_knowledge_point set title = $kp$无线局域网（WLAN）$kp$, content = $kp$无线局域网（Wireless Local Area Network，WLAN）是局域网与无线通信技术相结合的产物。

它采用红外线（IR）或者无线电波（RF）进行数据通信，能提供有线局域网的所有功能，同时还能按照用户的需要方便地移动或改变网络。

无线电波是目前使用最多的无线局域网传输介质，所用频段主要是 S 频段（2.4GHz~2.4835GHz）。它覆盖范围广，采用扩频方式通信时抗干扰、抗噪声、抗衰落能力强，通信安全，基本避免了信号被偷听和窃取，具有很高的可用性。$kp$, section = '' where id = 23053;
update t_knowledge_point set title = $kp$无线局域网常用协议及性能$kp$, content = $kp$| 协议名称 | 频段 | 最高传输速率 | 最大距离（室内） | 最大距离（室外） |
| --- | --- | --- | --- | --- |
| 802.11a | 5.8GHz | 54Mb/s | 35m | 120m |
| 802.11b | 2.4GHz | 11Mb/s | 35m | 140m |
| 802.11g | 2.4GHz | 54Mb/s | 38m | 140m |
| 802.11n | 2.4GHz/5GHz | 150Mb/s | 70m | 250m |
| 802.11ac | 5GHz | 1000Mb/s | 35m | — |
| 802.15（蓝牙） | 2.4GHz | 1Mb/s | 10m | 50~100m |
| NFC | 13.56MHz | 400kb/s | 20cm | — |$kp$, section = '' where id = 23054;
update t_knowledge_point set title = $kp$无线接入点（AP）$kp$, content = $kp$AP 实际上就是一个无线以太网交换机，产品形式有无线交换机和无线路由器。

无线路由器通常与 ADSL Modem 或 Cable Modem 连接并接入 Internet，同时为台式机、笔记本、PDA、NAS 等设备提供无线接入。

变通解决办法：将笔记本电脑设置为 AP；用 3G/4G 手机作为 AP。$kp$, section = '' where id = 23055;
update t_knowledge_point set title = $kp$无线网络$kp$, content = $kp$在物联网中，物品与人的无障碍交流离不开高速、可进行大批量数据传输的无线网络。

无线网络既包括允许用户建立远距离无线连接的全球语音和数据网络，也包括为近距离无线连接进行优化的红外线技术及射频技术。它与有线网络的用途十分类似，最大的不同在于传输媒介不同：利用无线电技术取代网线，并可与有线网络互为备份。$kp$, section = '' where id = 23056;
update t_knowledge_point set title = $kp$无线自组网（Ad hoc）$kp$, content = $kp$一种无线对等局域网，由一组无线工作站以自组织、多跳移动通信的方式构成。

网络中的所有计算机都可以自由移动，均具有动态搜索、定位和恢复连接的能力。

在军事上非常有用，也可用于会议室和家庭中。$kp$, section = '' where id = 23057;
update t_knowledge_point set title = $kp$无线局域网的组成$kp$, content = $kp$无线局域网由无线网卡、无线接入点等设备组成。

无线接入点（Wireless Access Point，简称 WAP 或 AP）提供从无线节点对有线局域网、以及从有线局域网对无线节点的访问，实际上就是一个无线交换机。

无线局域网还不能完全脱离有线网络，它只是有线网络的补充。$kp$, section = '' where id = 23143;
update t_knowledge_point set title = $kp$无线局域网的工作原理$kp$, content = $kp$采用红外线（IR）或者无线电波（RF）进行数据通信，能提供有线局域网的所有功能。

使用无线电波的 S 频段（2.4GHz~2.4835GHz），对人体无害。

采用扩频通信，抗干扰、抗噪声、抗衰减，保证通信安全。

主要协议：802.11 和蓝牙（Bluetooth）标准。$kp$, section = '' where id = 23531;
update t_knowledge_point set title = $kp$无线通信与电磁波频段划分$kp$, content = $kp$无线通信是利用电磁波携带信息在自由空间中传播来进行通信。

电磁波的种类与频率范围：

- 无线电波：10^4~10^11 Hz
- 中波：0.3~3 MHz
- 短波：3~30 MHz
- 超短波：30~300 MHz
- 微波：0.3~300 GHz
- 红外线：10^11~10^14 Hz
- 可见光：约 10^14 Hz
- 紫外线：10^14~10^16 Hz

应用：无线电波用于无线广播、电视和通信；手机使用 900MHz、1.8GHz、2.1~2.2GHz；无线 LAN 使用 2.4GHz、5.8GHz。$kp$, section = '' where id = 24025;
update t_knowledge_point set title = $kp$红外线通信$kp$, content = $kp$红外线（Infrared，IR）技术广泛应用在电视机、空调等家用电器的遥控器中，也可以作为网络通信的介质。

红外线是一种视线技术，不能通过不透明的物体（如墙壁），并且易受外界光线干扰，有效距离较短，一般在几米之内，因此红外技术并不适合作为连接网络的主要方式。当前，红外技术在计算机系统中更多地应用于外围设备，如红外键盘、鼠标等。$kp$, section = '' where id = 24076;
update t_knowledge_point set title = $kp$无线电波按波段的分类与传播特点$kp$, content = $kp$- 电磁波在空间传输信息，无线电波按频率（波长）分类：
  - 中波：沿地面传播，绕射能力强，适合广播和海上通信。
  - 短波：具有较强的电离层反射能力，适合环球通信。
  - 超短波、微波：频率很高，绕射能力较差，适合调频广播和近距离中继通信。
- 微波是频率很高的电磁波，传播速度接近光速。
- 频率越高，波长越短，绕射能力越弱，直至微波几乎不能绕射。
- 判断题订正：
  - “电波通过自由空间传播时，能量集中，传输距离可以很远”——错误，电波在自由空间中会扩散衰减。
  - “激光能在长距离内保持聚焦并能穿透物体，因而可以传输很远的距离”——错误，激光不能穿透不透明物体。$kp$, section = '' where id = 25294;
update t_knowledge_point set title = $kp$无线局域网的特点、组成与关键技术$kp$, content = $kp$- 特点
  - 是以太网和无线通信技术相结合的产物，借助无线电波进行数据传输。
  - 工作原理与有线以太网基本相同。
  - 使用 2.4GHz 和 5GHz 两个频段，覆盖范围广。
  - 采用扩频方式通信，具有抗干扰、低噪声、抗信号衰减的能力，通信安全、可用性好。
  - 采用 IEEE 802.11（俗称 Wi-Fi）协议，最早的协议是 802.11b（2.4GHz 频段）。
  - 还不能完全脱离有线网络，只是有线网络的补充和延伸。
- 组成
  - 无线网卡：每个无线节点都需要一块无线网卡。
  - 无线接入点（WAP 或 AP，也称无线热点）：提供从无线节点对有线局域网、以及从有线局域网对无线节点的访问；实际上是一个无线交换机，相当于手机通信中的“基站”；可支持 30~100 台设备接入；提供数据加密、虚拟专网和防火墙功能。
- 关键技术
  - 蓝牙：近距离、低速率、低功耗，一般 10cm~10m，增加发射功率可达 100m；适合办公室和家庭环境的无线个人网（WPAN）；蓝牙 4.0 具有低功耗的特点。802.11a 与 802.11g 的速率均为 54Mbps。
  - NFC：近距离无线通信，是 RFID 的一种应用，双向通信、可读可写，可用于模拟 RFID 的非接触式 IC 卡，实现刷卡消费。
  - 无线自组网：一种无线对等局域网，所有工作站都可以自由移动，具有动态搜索、定位、恢复连接的功能，用于军事、家庭和会议室。$kp$, section = '' where id = 25310;
update t_knowledge_point set title = $kp$WPA 与 WPA2 的安全类型和加密方式$kp$, content = $kp$①、WPA2-个人、WPA-个人、WPA2-企业、WPA-企业这四种安全类型都属于 WPA，WPA2 是 WPA 的升级版。WPA3 标准包括个人、企业两种模式，同时还可以应用于物联网领域。
②、WPA 的设计可以用在所有的无线网卡上，但不一定能用在第一代的无线热点（比如无线路由器）上；WPA2 可能不能用在某些旧型号的网卡上。
③、WPA 和 WPA2 都采用 TKIP（本质是 WEP 补丁）或者 AES（对称，高级加密标准）加密方式，比 WEP 的加密级别高，因而更安全。
④、AES 是一个完全独立的加密算法，远远优于任何 TKIP 提供的算法，该算法有 128 位、192 位或 256 位的分组密码，所以 AES 的安全性能比 TKIP 好。
⑤、采用 AES 加密方式时，密码（网络安全密钥）长度要求为 8~63 个 ASCII 字符或 8~64 个十六进制字符，即可以设置 8~64 个字母、数字和英文标点符号的组合作为密码。
⑥、企业版需要专用的服务器来发放和验证证书，不使用密码。
⑦、个人版不需要专用的证书，可以使用预先设定的密码（预共享密钥，pre-shared key，缩写 PSK），所以很多地方又将 WPA-个人、WPA2-个人称为 WPA-PSK 和 WPA2-PSK。
⑧、WPA3 是新近发布的 Wi-Fi 安全标准，提供更加安全的私有和公共网络，包括个人、企业两种模式。WPA3 加密基于 256 位伽罗瓦/计数器模式协议（GCMP-256），使破解加密的难度更大。$kp$, section = '' where id = 25799;
update t_knowledge_point set title = $kp$802.1X 接入认证$kp$, content = $kp$①、802.1x 协议是基于 Client/Server 的访问控制和认证协议。
②、类似于企业版的 WPA，802.1X 也需要专门的认证服务器来对 Wi-Fi 连接进行认证。
③、它可以限制未经授权的用户或设备通过接入端口（access port）访问 LAN/WLAN。
④、在获得交换机或 LAN 提供的各种业务之前，802.1x 对连接到交换机端口上的用户或设备进行认证。
⑤、在认证通过之前，802.1x 只允许 EAPOL（基于局域网的扩展认证协议）数据通过设备连接的交换机端口；认证通过以后，正常的数据可以顺利地通过以太网端口。$kp$, section = '' where id = 25800;
update t_knowledge_point set title = $kp$Windows 中手动连接无线网络的设置$kp$, content = $kp$在“网络和 Internet 设置”中，可以更改设置，例如将某个连接设置为按流量计费，也可以打开或关闭 WLAN、飞行模式和移动热点。

“手动连接到无线网络”用于连接隐藏网络或创建新的无线配置文件，需要填写网络名、安全类型、加密类型和安全密钥，并可选择自动启动此连接、即使网络未进行广播也连接。选择后者时，计算机的隐私信息可能存在风险。$kp$, section = '' where id = 25830;
update t_knowledge_point set title = $kp$ZigBee 物理层$kp$, content = $kp$在 ZigBee 无线网络中，物理层位于协议层的最底层，是距离硬件最近的层，它直接控制并与无线收发器通信。物理层负责激活发送或接收数据包的无线设备，还负责选择信道的频率，并确保该频道当前没有被其他网络中的设备所使用。$kp$, section = '' where id = 26075;
update t_knowledge_point set title = $kp$ZigBee MAC 层$kp$, content = $kp$MAC 层为物理层和网络层提供接口，负责产生信标并为信标网络（beacon-enabled 网络）同步设备，还提供建立连接和解除连接的服务。$kp$, section = '' where id = 26076;
update t_knowledge_point set title = $kp$ZigBee 应用层及相关参数$kp$, content = $kp$应用层是 ZigBee 无线网络中的最高协议层，并且管理应用对象。生产商开发应用对象来为各种应用定制设备，在 ZigBee 设备中应用对象控制和管理协议层，单个设备中最多可以有 240 个应用对象。

- 中国使用的 ZigBee 工作频段是 2.4GHz，定义 16 个信道。
- 在 ZigBee 协议架构中，属于 IEEE 802.15.4 标准定义的是物理层和 MAC 层。
- ZigBee 支持的网络拓扑结构：星型、树型、网状。$kp$, section = '' where id = 26078;
update t_knowledge_point set title = $kp$毫米波$kp$, content = $kp$无线传输速率的提升一般通过提高频谱利用率或增加频谱带宽来实现，毫米波技术属于后者。

毫米波指波长在 1~10 毫米的电磁波，频率处于 30GHz~300GHz 区间。

它大致位于微波与远红外波相交叠的波长范围，因而兼具两种波谱的特点。$kp$, section = '' where id = 26094;
update t_knowledge_point set title = $kp$ZigBee 技术$kp$, content = $kp$ZigBee 技术是一种近距离、低复杂度、低功耗、低速率、低成本的双向无线通信技术。其名称来源于蜜蜂的八字舞：蜜蜂靠飞翔和“嗡嗡”地抖动翅膀的“舞蹈”把花粉所在方位的信息传递给同伴，即依靠这种方式构成群体中的通信网络。

ZigBee 网络的主要特点是功耗低、成本低、时延短、网络容量大、可靠、安全，主要适用于自动控制和远程控制领域，可以嵌入各种设备。ZigBee 设备的类型如下：

（1）ZigBee 协调器（Coordinator）；
（2）ZigBee 路由器（Router）；
（3）ZigBee 终端设备。

一个 ZigBee 网络由一个协调器节点、多个路由器和多个终端设备节点组成。$kp$, section = '' where id = 26372;
update t_knowledge_point set title = $kp$Wi-Fi 技术$kp$, content = $kp$Wi-Fi 是一个无线网络通信技术的品牌，由 Wi-Fi 联盟（Wi-Fi Alliance）持有，目的是改善基于 IEEE 802.11 标准的无线网络产品之间的互通性。

IEEE 802.11 是电气电子工程师学会（Institute of Electrical and Electronics Engineers，IEEE）最初制定的一个无线局域网标准，主要用于解决办公室局域网和校园网中用户与用户终端的无线接入，业务主要限于数据存取。Wi-Fi 是一种可以将计算机、手持设备（如 PDA、手机）等终端以无线方式互相连接的技术。

Wi-Fi 的优势：

（1）无线电波的覆盖范围广；
（2）传输速度非常快；
（3）厂商进入该领域的门槛比较低。$kp$, section = '' where id = 26373;
update t_knowledge_point set title = $kp$HTML5 的新特性$kp$, content = $kp$HTML5 将成为 HTML（Hypertext Markup Language，超文本标记语言）、XHTML 以及 HTML DOM 的新标准。虽然 HTML5 仍处于完善之中，但大部分现代浏览器已经具备了某些 HTML5 支持。

HTML5 的新特性如下：

1）绘画 canvas。canvas 标签用于绘制图像，通常通过 JavaScript 脚本实现。

2）用于媒介回放的 video 和 audio 元素。HTML5 DOM 为 audio 和 video 元素提供了方法、属性和事件，可以用 JavaScript 来操作这两个元素。

3）本地离线存储 localStorage 长期存储数据，浏览器关闭后数据不丢失，没有时间限制。

4）sessionStorage 的数据在浏览器关闭后自动删除，是针对一个 session 的数据存储。

5）语义化更好的内容元素，比如 article、footer、header、nav、section。

- article 标签定义外部的内容。
- header 标签定义文档或者文档某一部分区域的页眉，该元素应作为介绍内容或导航链接栏的容器。
- nav 元素可以用作页面导航的链接组，组内有很多链接，点击每个链接可以链接到其他页面或当前页面的其他部分。
- section 是带有语义的标签。

6）表单控件，如 calendar、date、time、email、url、search。

7）新的技术 Web Worker、WebSocket、Geolocation。$kp$, section = '' where id = 26448;
update t_knowledge_point set title = $kp$无线局域网（WLAN）$kp$, content = $kp$无线局域网简称 WLAN，是不使用任何导线或传输电缆连接的局域网，而使用无线电波或电场与磁场作为数据传送的介质，传送距离一般只有几十米。$kp$, section = '' where id = 26761;
update t_knowledge_point set title = $kp$HTML5 的新特性$kp$, content = $kp$1. 用于绘画的 canvas 元素。
2. 用于媒介回放的 video 元素和 audio 元素。
3. 对本地离线存储的更好支持。
4. 新的特殊内容元素：article、footer、header 等。
5. 新的表单控件：calendar、date、time、url、email 等。$kp$, section = '' where id = 26855;
update t_knowledge_point set title = $kp$无线局域网的技术基础$kp$, content = $kp$无线局域网是以太网技术与无线通信技术的结合。$kp$, section = '' where id = 27427;
update t_knowledge_point set title = $kp$无线局域网的主要优点$kp$, content = $kp$无线局域网最大的优点就是灵活、方便。$kp$, section = '' where id = 27428;
update t_knowledge_point set title = $kp$无线局域网与 802.11 协议$kp$, content = $kp$无线局域网使用的是 IEEE 802.11 协议，俗称 Wi-Fi。$kp$, section = '' where id = 27429;
update t_knowledge_point set title = $kp$无线局域网是有线网络的补充和延伸$kp$, content = $kp$无线局域网还不能摆脱有线网络，只是有线网络的补充和延伸。$kp$, section = '' where id = 27430;
update t_knowledge_point set title = $kp$红外线通信的特点$kp$, content = $kp$红外线通信：范围小，点到点。$kp$, section = '' where id = 27431;
update t_knowledge_point set title = $kp$无线网卡与有线网卡不同$kp$, content = $kp$无线网卡和有线网卡不一样。$kp$, section = '' where id = 28177;
update t_knowledge_point set title = $kp$无线局域网的最大优点$kp$, content = $kp$无线局域网最大的优点就是灵活、方便。$kp$, section = '' where id = 28183;
update t_knowledge_point set title = $kp$红外线通信的范围$kp$, content = $kp$红外线通信：范围小，点到点。$kp$, section = '' where id = 28184;
update t_knowledge_point set title = $kp$无线节点需要配置无线网卡$kp$, content = $kp$每个无线节点都需要有 1 块无线网卡。$kp$, section = '' where id = 28340;
update t_knowledge_point set title = $kp$蓝牙技术的特点$kp$, content = $kp$蓝牙：短距离、低速度、低成本的无线通信技术。$kp$, section = '' where id = 28577;
update t_knowledge_point set title = $kp$WLAN 的组成与特点$kp$, content = $kp$WLAN（无线局域网）方式：使用 Wi-Fi 无线网卡和无线 AP，速率 11Mbps~100Mbps。特点：只有在提供了无线接入点即 AP 的热点区域中才能上网。$kp$, section = '' where id = 29259;
update t_knowledge_point set title = $kp$WLAN 的含义$kp$, content = $kp$无线局域网，WLAN 是 Wireless Local Area Network 的简称，指将计算机设备互联起来，构成可以互相通信和实现资源共享的网络体系。$kp$, section = '' where id = 29365;
update t_knowledge_point set title = $kp$无线局域网的缺点$kp$, content = $kp$性能低于有线网（障碍物阻碍了传输）；传输速率低于有线网；安全性较差（信号容易被监听，容易造成信息泄露）。$kp$, section = '' where id = 29366;
update t_knowledge_point set title = $kp$无线通信网络的分类与局域网协议标准$kp$, content = $kp$无线通信网络根据应用领域可分为：无线个域网（WPAN）、无线局域网（WLAN）、无线城域网（WMAN）、蜂窝移动通信网（WWAN）。

局域网相关协议标准：

- IEEE 802.3：以太网的 CSMA/CD 总线访问控制方法与物理层规范。
- IEEE 802.11：无线局域网访问控制方法与物理层规范，Wi-Fi 使用该标准。
- IEEE 802.15：无线个人区域网（WPAN）规范，蓝牙使用该标准。

| 项目 | 802.11a | 802.11b | 802.11g | 802.11n |
| --- | --- | --- | --- | --- |
| 频段 | 5GHz | 2.4GHz | 2.4GHz | 2.4GHz 或 5GHz |
| 不重叠信道 | 最多 23 个 | 3 个 | 3 个 | 2.4GHz 为 3 个，5GHz 更多 |
| 批准时间 | 1999.10 | 1999.10 | 2003.6 | 2008.9 |
| 数据速率 | 最快 54Mb/s | 最快 11Mb/s | DSSS 最快 11Mb/s，OFDM 最快 54Mb/s | 两个 MIMO 流 248Mb/s，理论最高 600Mb/s |
| 调制技术 | OFDM | DSSS | OFDM、DSSS | MIMO-OFDM |
| 优点 | 速度快，不易受干扰 | 成本低，传输距离远 | 速度快、距离远、不易被吸收 | 速率高、距离远 |
| 缺点 | 成本高、距离短 | 速率慢、易受干扰，2.4GHz 频段家电多 | 易受干扰 | 不同厂家设备可能不兼容 |

常见无线局域网拓扑结构：

（1）无线桥接：使用无线路由器连接多个 WLAN。WDS（Wireless Distribution System，无线分布式系统）桥接功能可以将无线路由器通过无线方式连接到已有信号。多台无线路由器桥接到一台主路由器，副路由器的数量取决于主路由器的无线带机量。

所谓“A 桥接 B、B 桥接 C……”，主要用于长方形覆盖区域的扩展。根据基本通信原理，建议不超过三级 WDS 桥接，三级以上的 WDS 桥接不能保证网络的稳定性和无线速率。

（2）小型 WLAN：用于独立办公室、家庭、宿舍等无线网络环境，能够为少量用户提供无线网络接入服务。$kp$, section = '' where id = 29367;
update t_knowledge_point set title = $kp$中型 WLAN 的应用场景$kp$, content = $kp$中型 WLAN 主要用于企业网、校园网、酒店网等无线网络环境，能够为大量用户提供无线接入服务。$kp$, section = '' where id = 29368;
update t_knowledge_point set title = $kp$大型 WLAN 的应用场景$kp$, content = $kp$大型 WLAN：园区、城市等。大型 WLAN 中，运营商会在城市部分区域建设运营级 WLAN 网络；某些城市由市政提供便民免费无线上网服务，此时也会选用大型 WLAN 网络。$kp$, section = '' where id = 29369;
update t_knowledge_point set title = $kp$WDS 无线分布系统模式$kp$, content = $kp$WDS（无线分布系统）模式：各设备之间通过 MAC 地址互相连接，且要求 SSID（服务集标识，用于划分不同身份验证的子网络）、信道、密码、加密方式相同。分为 WDS 点对点桥接（WDS-P2P）模式和 WDS 点对多点桥接（WDS-P2MP）模式。$kp$, section = '' where id = 29370;
update t_knowledge_point set title = $kp$设备作为无线交换机的模式$kp$, content = $kp$在此模式下，该设备相当于一台无线交换机，可实现无线之间、无线到有线、无线到广域网络的访问。$kp$, section = '' where id = 29371;
update t_knowledge_point set title = $kp$AP 模式$kp$, content = $kp$AP 模式可以把有线的网络传输转换为无线传输。如果已经有一台有线路由器，又想使用无线网络，这种方式刚好符合要求。$kp$, section = '' where id = 29372;
update t_knowledge_point set title = $kp$点对多点无线网桥$kp$, content = $kp$点对多点的无线网桥能够把多个离散的有线网络连成一体，结构相对于点对点无线网桥来说较复杂。$kp$, section = '' where id = 29373;
update t_knowledge_point set title = $kp$WISP 无线运营商$kp$, content = $kp$WISP（Wireless Internet Service Provider）即无线 ISP、无线局域网运营商，采用无线局域网提供互联网接入。$kp$, section = '' where id = 29374;
update t_knowledge_point set title = $kp$WISP 的部署场所$kp$, content = $kp$WISP 可以在机场、酒店、咖啡馆、茶馆等公共场所建设自己的基站，提供无线上网服务，需要上网的用户连接无线网并登录后即可接入互联网。$kp$, section = '' where id = 29375;
update t_knowledge_point set title = $kp$WISP 模式的组网$kp$, content = $kp$WISP 组网中，运营商一侧提供基站，用户一侧使用室外无线 CPE（如 LF-R300，远距离传输最高 2km）以及室外高增益无线网卡（如 LF-D530）接收更远距离的信号。$kp$, section = '' where id = 29376;
update t_knowledge_point set title = $kp$无线覆盖的盲区$kp$, content = $kp$在别墅、写字间等面积较大的家庭或办公环境中，路由器的无线覆盖范围有限，部分区域信号较弱甚至存在信号盲点。$kp$, section = '' where id = 29377;
update t_knowledge_point set title = $kp$AP 的无线中继方式$kp$, content = $kp$AP 的无线中继方式：各设备之间通过 MAC 地址互相连接。当两个局域网之间的距离超过无线局域网产品允许的最大传输距离，或在两网络之间存在较大干扰的障碍物时，可以采用无线中继方案。$kp$, section = '' where id = 29378;
update t_knowledge_point set title = $kp$AP Client 客户端模式$kp$, content = $kp$AP Client 客户端模式也称“主从模式”。在此模式下工作的 AP 会被主 AP 看作一台无线客户端，其地位与无线网卡等同。$kp$, section = '' where id = 29379;
update t_knowledge_point set title = $kp$无线桥接中两台设备的分工$kp$, content = $kp$在此方案中，两台无线设备起着不同的作用、担当不同角色。无线设备 A 向上连接宽带线路，向下通过所支持的局域网标准与终端用户实现有线或无线连接，此时它既可以是一台无线路由器，也可以是一台无线接入器。$kp$, section = '' where id = 29380;
update t_knowledge_point set title = $kp$SSID 的作用$kp$, content = $kp$SSID 技术可以将一个无线局域网划分为几个需要不同身份验证的子网络，只有通过身份验证的用户才可以进入相应的子网络，从而防止未被授权的用户进入本网络。SSID 用来区分不同的网络，最多可以有 32 个字符。$kp$, section = '' where id = 29381;
update t_knowledge_point set title = $kp$SSID、ESSID 与 BSSID$kp$, content = $kp$SSID 是一个笼统的概念，包含 ESSID 和 BSSID。无线网卡设置了不同的 SSID 就可以进入不同的网络；SSID 通常由 AP 广播出来，各操作系统自带的扫描功能可以查看当前区域内的 SSID（部分设备支持中文）。$kp$, section = '' where id = 29382;
update t_knowledge_point set title = $kp$802.1X 访问控制与认证$kp$, content = $kp$802.1X 协议是基于 Client/Server 的访问控制和认证协议。

① 802.1X 企业版的 WPA 需要专门的认证服务器对 Wi-Fi 连接进行认证。
② 它可以限制未经授权的用户或设备通过接入端口（access port）访问 LAN/WLAN。
③ 在获得交换机或 LAN 提供的各种业务之前，802.1X 对连接到交换机端口上的用户或设备进行认证。
④ 认证通过之前，802.1X 只允许 EAPOL（基于局域网的扩展认证协议）数据通过设备连接的交换机端口。
⑤ 认证通过之后，正常数据可以顺利地通过以太网端口。

常见安全类型：开放、WEP、WPA2 个人（AES）、WPA2 企业（AES）、WPA3 个人（AES）、802.1X。$kp$, section = '' where id = 29384;
update t_knowledge_point set title = $kp$WAPI 无线局域网安全标准$kp$, content = $kp$WAPI（Wireless LAN Authentication and Privacy Infrastructure）是无线局域网鉴别和保密基础结构，是一种安全协议，同时也是中国无线局域网安全强制性标准，最早由西安电子科技大学综合业务网理论及关键技术国家重点实验室提出。

WAPI 无线局域网鉴别基础结构（WAI）具有更加安全的鉴别机制、更加灵活的密钥管理技术，并实现了整个基础网络的集中用户管理，从而满足更多用户和更复杂的安全性要求。

与 Wi-Fi 的单向加密认证不同，WAPI 双向均认证，从而保证传输的安全性。

WAPI 包括两部分：WAI（WLAN Authentication Infrastructure）和 WPI（WLAN Privacy Infrastructure）。WAI 和 WPI 分别实现对用户身份的鉴别和对传输的业务数据加密。其中 WAI 采用公开密钥密码体制，利用公钥证书对 WLAN 系统中的 STA 和 AP 进行认证；WPI 则采用对称密码算法实现对 MAC 层 MSDU 的加、解密操作。

WAPI 鉴别及密钥管理的方式有两种，即基于证书和基于预共享密钥 PSK。采用基于证书的方式，整个过程包括证书鉴别、单播密钥协商与组播密钥通告；采用预共享密钥的方式，整个过程则为单播密钥协商与组播密钥通告。$kp$, section = '' where id = 29385;
update t_knowledge_point set title = $kp$通过 WLAN 设置添加新网络$kp$, content = $kp$第一种：在网络和 Internet 的 WLAN 配置中管理已知网络，增加新网络连接信息（SSID、安全类型、安全密码等）。$kp$, section = '' where id = 29386;
update t_knowledge_point set title = $kp$搜索 Wi-Fi 并输入密码连接$kp$, content = $kp$第二种：直接搜索到的 Wi-Fi 网络，输入密码进行连接。在 WLAN 设置中可查看可用网络、管理已知网络、添加新网络（填写网络名称、安全类型、安全密码），并可设置自动连接以及“即使此网络未广播也进行连接”。$kp$, section = '' where id = 29387;
update t_knowledge_point set title = $kp$每个无线节点都需要无线网卡$kp$, content = $kp$每个无线节点都需要有 1 块无线网卡。$kp$, section = '' where id = 29434;
update t_knowledge_point set title = $kp$无线局域网概述$kp$, content = $kp$无线局域网（WLAN）：

1) 是计算机网络与无线通信技术结合的产物。
2) 蓝牙（Bluetooth）——IEEE 802.15：近距离无线数字通信的标准，是 802.11 的补充，适合于办公室或家庭环境的无线网络。
3) 无线上网的计算机需要无线网卡。
4) 采用无线信道，无线网络不仅需要考虑存储数据时的安全，还需考虑传输过程的安全问题。

有线与无线的比较：

| 项目 | 有线局域网 | 无线局域网 |
| --- | --- | --- |
| 传输介质 | 双绞线、光纤 | 无线电波 |
| 网卡 | 普通网卡 | 无线网卡 |
| 通信协议 | TCP/IP 为主 | IEEE 802.11 为主 |
| 组建、配置和维护网络 | 固定 | 灵活 |$kp$, section = '' where id = 29459;
update t_knowledge_point set title = $kp$家用无线路由器的设置方式$kp$, content = $kp$目前市场上提供多种家用无线路由器，如 D-Link、TP-Link，组网时大多采用 Web 方式对其进行参数设置。$kp$, section = '' where id = 29489;
update t_knowledge_point set title = $kp$终端与 AP 的距离对信号的影响$kp$, content = $kp$接入无线局域网的计算机与接入点（AP）之间的距离一般在几米到几十米之间，距离越大，信号越弱。$kp$, section = '' where id = 29491;
update t_knowledge_point set title = $kp$无线网卡的传输速率$kp$, content = $kp$接入无线局域网的每台计算机都需要有 1 块无线网卡，其数据传输速率目前已可达到 1Gb/s。$kp$, section = '' where id = 29492;
update t_knowledge_point set title = $kp$微波中继的三种方式$kp$, content = $kp$微波信号需要中继才能实现远距离传输。用于微波中继的方式有：地面中继站、卫星中继站、大气对流层散射。$kp$, section = '' where id = 30133;
update t_knowledge_point set title = $kp$隐藏 SSID 与 MAC 地址过滤$kp$, content = $kp$出于安全考虑，无线网络可以不广播 SSID，此时用户需要手工设置（输入）SSID 才能接入网络；此外还可手工配置允许接入的 MAC 地址列表，进行 MAC 地址过滤。$kp$, section = '' where id = 30256;
update t_knowledge_point set title = $kp$WDS 点对点桥接模式$kp$, content = $kp$拓扑结构：Internet 经宽带线路接入 ADSL Modem，连接到主发射端 A，A 通过交换机以有线方式连接本端局域网；相距约 1 公里且互相可视的副接收端 B 同样通过交换机以有线方式连接另一端局域网，A 与 B 之间采用无线连接。这种模式称为 WDS 点对点桥接（WDS-P2P）模式。$kp$, section = '' where id = 31989;
update t_knowledge_point set title = $kp$无线网络安全类型：开放、WEP 与 WPA$kp$, content = $kp$无身份验证（开放式）：

①、早期的 Wi-Fi 没有提供数据加密，即无身份认证的开放式无线网络，任何设备不需要授权即可连接到该网络。
②、连接到这样的无线网络后，系统中的无线连接会提示“不安全”，因为通过这样的 Wi-Fi 连接很容易遭到窃听。

共享式（WEP）：

①、WEP 是 Wired Equivalent Privacy 的缩写，即有线等效保密。
②、1999 年 WEP 加密协议获得通过，提供与有线连接等效的加密安全性；但后来事实证明 WEP 很容易被破解，于是产生了 WPA 加密方式。在有更高加密标准可用时，一般不使用 WEP。

WPA：

①、WPA2-个人、WPA-个人、WPA2-企业、WPA-企业这四种安全类型都属于 WPA，WPA2 是 WPA 的升级版。WPA3 标准包括个人、企业两种模式，还可以应用于物联网领域。
②、WPA 的设计可以用在所有的无线网卡上，但不一定能用在第一代的无线热点（比如无线路由器）上；WPA2 可能不能用在某些旧型号的网卡上。
③、WPA 和 WPA2 都采用 TKIP（本质是 WEP 补丁）或者 AES（对称，高级加密标准）加密方式，比 WEP 的加密级别高，因而更安全。
④、AES 是一个完全独立的加密算法，远远优于任何 TKIP 提供的算法，该算法有 128 位、192 位或 256 位的分组密码，所以 AES 的安全性能比 TKIP 好。
⑤、采用 AES 加密方式时，密码（网络安全密钥）长度要求为 8~63 个 ASCII 字符或 8~64 个十六进制字符，即可以设置 8~64 个字母、数字和英文标点符号的组合作为密码。
⑥、企业版需要专用的认证服务器来发放和验证证书，不使用预先设定的密码；个人版不需要专用证书，可以使用预先设定的密码（预共享密钥，pre-shared key，缩写 PSK），所以很多地方又将 WPA-个人、WPA2-个人称为 WPA-PSK 和 WPA2-PSK。
⑦、WPA3 是新近发布的 Wi-Fi 安全标准，提供更加安全的私有和公共网络，包括个人、企业两种模式。WPA3 加密基于 256 位伽罗瓦/计数器模式协议（GCMP-256），使破解加密的难度更大。$kp$, section = '' where id = 31990;
update t_knowledge_point set title = $kp$移动热点与 WLAN 连接状态$kp$, content = $kp$Windows 的“移动热点”可将本机已有的网络连接共享给其他设备。

已连接的 WLAN 可设置为按流量计费的连接，也可以更改其他属性。状态页显示已连接到 Internet，以及该 WLAN（guang）最近 30 天内的使用情况。$kp$, section = '' where id = 31996;
update t_knowledge_point set title = $kp$常见网络拓扑结构及其优缺点$kp$, content = $kp$计算机网络拓扑是把构成网络的节点和连接节点的线路抽象成点和线，用几何关系表示网络结构，从而反映出网络中各实体的结构关系。常见的网络拓扑结构主要有总线型、星型、环型、树型和网状型。

总线型：网络中各个节点由一根总线相连，数据在总线上由一个节点传向另一个节点。优点：节点的加入和退出都很方便，可靠性高，结构简单，成本低，是局域网普遍采用的形式。缺点：故障检测比较困难。

星型：每个节点与中心点连接，中心节点控制全网的通信，任何两个节点之间的通信都要通过中心节点，因此要求中心节点有很好的可靠性。优点：结构简单，易于实现和管理。缺点：采用集中控制方式，一旦中心节点出现故障，就会造成全网瘫痪，可靠性较差。

环型：各个节点通过中继器连接到一个闭合的环路上，环中的数据沿一个方向传输，由目的节点接收。优点：结构简单、成本低，适用于数据不需要在中心节点处理而主要在各自节点上处理的情况。缺点：环中任意一个节点的故障都可能造成网络瘫痪，是环型网络可靠性的瓶颈。

树型：节点按层次进行连接，像树一样有分支、根节点、叶子节点，信息交换主要在上、下节点之间进行。树型拓扑可以看作是星型拓扑的扩展，主要适用于汇集信息的应用要求。优点：易于扩展和故障隔离。缺点：对根节点依赖性太大。

网状型：没有上述四种那样明显的规则，又称无规则型，节点与节点之间的连接是任意的，没有规律。目前实际存在和使用的广域网基本上都采用网状型拓扑结构。优点：系统可靠性高。缺点：结构复杂，必须采用路由协议、流量控制等方法。$kp$, section = '' where id = 32001;
update t_knowledge_point set title = $kp$初次连接不安全无线网络时的提示$kp$, content = $kp$初次连接时，可能会提示是否连接不安全的无线网络。先确认连接，正常连接后，网络属性中会显示当前信号强度。$kp$, section = '' where id = 32007;
update t_knowledge_point set title = $kp$登录无线网络节点的管理界面$kp$, content = $kp$打开浏览器，在地址栏输入无线网络节点的地址 http://192.168.0.50。

在弹出的认证框内输入说明书中所给出的无线网络节点管理密码，正确输入后即可进入无线网络节点的管理界面。

进入管理界面后，可以修改无线网络节点的管理密码。$kp$, section = '' where id = 32008;
update t_knowledge_point set title = $kp$无线网络节点的 IP 设置与 WEP 加密$kp$, content = $kp$根据接入方式的不同，需要将无线网络节点的 IP 地址设置为静态或动态。这里采用的宽带接入方式 IP 是动态的，所以将无线网络节点的 IP 地址设置为动态获取。设置完毕后，保存设置并重新启动无线网络节点。

如果无线网络适配器能与无线网络节点正常连接，电脑就可以正常上网；如果不能正常连接，就需要检查网络设置或者调整无线网络节点的位置。

现在电脑虽然可以实现无线上网，但组建的无线局域网只实现了宽带共享，却非常不安全：附近只要装有无线网卡的电脑，就可能不知不觉地入侵这个无线局域网，甚至利用你的宽带接入上网。为了保证无线网络的安全，还要对网络进行加密。

通过 IE 浏览器再次登录无线网络节点的管理界面，找到安全选项后，选择打开 WEP 加密功能，然后输入一段 16 进制字符（字符必须为 0~9 或 a~f）作为加密字串，加密字串一定得记牢，遗失以后没有办法连接无线网络节点。根据 WEP 类型的不同，加密字串的位数也有区别：通常 64 位加密需要输入 10 位字串，128 位加密需要输入 26 位字串。保存设置后重新启动无线网络节点，重启后别人的无线网卡就无法与无线网络节点连接。

点击“网上邻居”的“属性”，进入“无线网络连接属性”页面，选择“无线网络配置”，在可用网络里找到自己的无线网络节点（如果附近没有其他无线网络节点，这里应该只列出一个网络）。点击“属性”，启用“数据加密（WEP 启用）”，在下面的“网络密钥”和“确认网络密钥”两栏填入刚才设置的加密字串，点击“确定”完成，此时无线网卡就能够与无线网络节点正确连接，整个无线网络设置成功。$kp$, section = '' where id = 32009;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22579,22584,22603,22625,22679,22714,22737,22870,22872,22873,22978,23052,23053,23054,23055,23056,23057,23143,23531,24025,24076,25294,25310,25799,25800,25830,26075,26076,26078,26094,26372,26373,26448,26761,26855,27427,27428,27429,27430,27431,28177,28183,28184,28340,28577,29259,29365,29366,29367,29368,29369,29370,29371,29372,29373,29374,29375,29376,29377,29378,29379,29380,29381,29382,29384,29385,29386,29387,29434,29459,29489,29491,29492,30133,30256,31989,31990,31996,32001,32007,32008,32009) and not deleted) <> 82 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
