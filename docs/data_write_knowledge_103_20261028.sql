-- 知识点 103 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_103
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_103 as
select * from t_knowledge_point where id in (22560,22583,22588,22604,22629,22658,22661,22730,22751,22761,22829,22840,22890,22897,22906,22939,22944,22980,22985,23035,23082,23089,23138,24961,25164,25260,25263,25265,25350,26361,26420,26429,26523,26635,26652,26766,27375,27376,27387,27402,28180,28186,28197,28203,28204,28324,28331,28512,28535,28538,28539,28550,29181,29182,29280,29281,29286,29287,29312,29407,29435,29436,29494,29507,29512,32005);

update t_knowledge_point set title = $kp$通信API的分层结构与Socket$kp$, content = $kp$应用程序通常建立在系统提供的应用编程接口（Application Programming Interface，简称API）之上，客户/服务器（Client/Server，简称C/S）应用程序的开发也不例外。客户进程和服务器进程通过调用通信API来相互作用，从而协同完成某些特定任务。按抽象程度不同，通信API可分为三个层次：低层通信API提供独立于各种网卡的通用接口；中间层通信API使应用程序能利用网络协议提供的各种服务；高层通信API为应用程序提供基于消息传递和过程调用的接口。这种分层结构使通信API具有良好的灵活性和可扩充性。

在这些API中，Socket占有重要地位。它提供了位于TCP/IP等多种网络协议之上的统一编程接口，成为开发C/S应用的重要途径。但利用Socket API开发C/S应用并不简单：开发者需要构造C/S应用的通信模型，并显式完成字节序转换、字符串转换、收/发缓冲区的开辟、格式化数据的收/发等工作。原因在于，Socket API在为应用提供基于流的通信机制的同时，把许多工作留给了应用程序本身。

因此，可利用通信API分层的特性，在现有Socket API基础上加以扩充，设计并实现通用的C/S应用编程接口，以提供更高层次的服务。

通信API的层次结构（自下而上）：物理网络（Ethernet、Token Ring、ISDN）— 低层API（NDIS、ODI）— 中间层API（Socket、NetBIOS、TLI）— 高层API（RPC、Peer-to-Peer、DCE、ONC），其下承载TCP/IP、NetBEUI、SPX/IPX等协议。$kp$, section = '' where id = 22560;
update t_knowledge_point set title = $kp$TCP/IP协议标准$kp$, content = $kp$网络协议：计算机网络中各个组成部分相互通信时都必须认同的一套规则，也称通信协议，例如数据包（或帧）的格式与含义等。

TCP/IP协议：目前在网络互联中用得最为广泛的协议，它是一个协议系列，包含100多个协议。

TCP/IP中两个最基本、最重要的协议：

- TCP（Transmission Control Protocol，传输控制协议）
- IP（Internet Protocol，网际协议）$kp$, section = '' where id = 22583;
update t_knowledge_point set title = $kp$互联网的构成$kp$, content = $kp$互联网由众多子网连接而成，是一个逻辑性网络。每个子网中都有一些主机，这些主机主要由计算机构成，它们相互连接，共同控制着自己区域的子网。互联网可为人们提供多种服务。$kp$, section = '' where id = 22588;
update t_knowledge_point set title = $kp$TCP/IP各层的数据单元$kp$, content = $kp$应用层：如电子邮件、HTML文档等数据。
传输层（TCP或UDP）：TCP或UDP数据报。
网络互连层（IP）：IP数据报。
网络接口层：如以太网信息帧或ATM信元。
物理层：完成比特流的传输。$kp$, section = '' where id = 22604;
update t_knowledge_point set title = $kp$IP协议的特点$kp$, content = $kp$IP协议提供非可靠、无连接的数据报传输服务。“非可靠”意味着它并不保证所传输的数据一定到达目的地：当路由出错导致某个数据传输失败时，会丢弃该数据并发回一个ICMP信息。可靠性需由更上层的协议（如TCP协议）提供。$kp$, section = '' where id = 22629;
update t_knowledge_point set title = $kp$IP数据报$kp$, content = $kp$互连的物理网络所使用的数据包（或帧）格式可能互不兼容，因此不能直接将一个网络送来的包传送给另一个网络。为克服这种异构性，IP协议定义了一种独立于各种物理网络的数据包格式，称为IP数据报。

IP数据报由两部分组成：头部和数据区。头部信息主要用于确定数据报在网络中传输的路由，内容包括：发送数据报的计算机的IP地址；接收数据报的计算机的IP地址；IP协议版本号（目前大量使用的仍是IPv4）；头部长度（以32位为单位指出头部长度）；数据报长度（整个数据报的长度，即头部长度加上数据区长度）；服务类型（指明发送方对数据传输的要求）。

数据区长度可根据应用而改变，最小时只有1个字节；整个数据报最大可达64KB（包含头部在内）。$kp$, section = '' where id = 22658;
update t_knowledge_point set title = $kp$TCP/IP协议栈$kp$, content = $kp$计算机网络的分层结构中，不同计算机的同一层必须共同遵循相同的规则和约定，才能正确地进行数据通信，这些规则和约定就是网络协议。现在大多数局域网和互联网都采用发源于美国国防部的TCP/IP协议系列。$kp$, section = '' where id = 22661;
update t_knowledge_point set title = $kp$网络分层结构与TCP/IP协议$kp$, content = $kp$本节内容包括两部分：网络的分层结构；TCP/IP协议（栈）。$kp$, section = '' where id = 22730;
update t_knowledge_point set title = $kp$网络技术与浏览器关系图$kp$, content = $kp$“网络的演变”是谷歌推出的一个网站，用于说明网络技术与浏览器如何相互作用，使网络越来越强大。每一条彩带代表一门网络技术，可以查看不同时期浏览器对技术产生的不同影响；特别是手机端Safari和Chrome加入后，网络技术变得越来越强大和复杂。$kp$, section = '' where id = 22751;
update t_knowledge_point set title = $kp$TCP/IP模型的层次结构$kp$, content = $kp$网络协议：计算机网络中各个组成部分相互通信时都必须认同的一套规则，也称通信协议，是计算机网络不可缺少的组成部分。计算机网络的协议采用“分层”的方法进行设计和开发：分层可以把庞大而复杂的问题转化为若干较小的局部问题，使问题比较容易处理。

TCP/IP协议：目前在网络互联中用得最为广泛的协议，它是一个协议系列，包含100多个协议。其中两个最基本、最重要的协议是TCP（Transmission Control Protocol，传输控制协议）和IP（Internet Protocol，网际协议）。UNIX、Linux和Windows等操作系统已将遵循TCP/IP协议的通信软件作为其内核的组成部分。

OSI参考模型与TCP/IP参考模型的对应关系：应用层、表示层、会话层对应TCP/IP的应用层；传输层对应传输层；网络层对应网络互连层；数据链路层、物理层对应网络接口和硬件层。

TCP/IP模型各层的功能与目的：

第4层 应用层：规定运行在不同主机上的应用程序之间如何通过互连的网络进行通信。不同应用使用不同的应用层协议，如电子邮件程序使用SMTP协议（简单邮件传输协议），Web浏览器使用HTTP协议（超文本传输协议）。

第3层 传输层：规定怎样进行端到端的数据传输，有TCP和UDP两个协议。大部分应用程序使用TCP协议，它负责可靠地完成数据从发送计算机到接收计算机的传输，如电子邮件传送和网页下载；使用UDP协议时，网络只是尽力而为地进行快速数据传输，但不保证可靠性，例如音频和视频数据的传输。

第2层 网络互连层：规定在整个互连的网络中所有计算机统一使用的编址方法和数据包格式（称为IP数据报），以及怎样将IP数据报从一台计算机逐步地通过一个或多个路由器送达最终目标的转发机制。

第1层 网络接口和硬件层：规定怎样与各种不同的物理网络进行接口，并负责把IP数据报转换成适合在特定物理网络中传输的帧格式。$kp$, section = '' where id = 22761;
update t_knowledge_point set title = $kp$IP数据报的格式$kp$, content = $kp$相互连接的异构网络所使用的数据包（或帧）格式互不兼容，因此不能直接将一个网络送来的包传送给另一个网络。解决方法：IP协议定义了一种独立于各种物理网络的统一数据包格式，称为IP数据报（IP datagram）。

IPv4数据报头部字段依次为：版本号；头部长度；服务类型；数据报总长度（16位）；标识（16位）；标志；片偏移（13位）；生存时间（8位）；协议（8位）；头部校验和（16位）；源IP地址（32位）；目的IP地址（32位）；可选字段（长度可变）；填充。头部之后为数据区。$kp$, section = '' where id = 22829;
update t_knowledge_point set title = $kp$网络协议与协议软件$kp$, content = $kp$网络协议：计算机网络中各个组成部分相互通信时都必须认同的一套规则，也称通信协议，例如数据包（或帧）的格式与含义等。实现这些规则的软件称为协议软件。

通信是一个很复杂的过程，一般把通信问题划分为许多子问题，然后为每个子问题设计一个单独的协议，这样做使得每个协议的设计、分析、实现和测试都比较容易。$kp$, section = '' where id = 22840;
update t_knowledge_point set title = $kp$互联网（Internet）$kp$, content = $kp$互联网即广域网、局域网及单机按照一定的通信协议组成的国际计算机网络。互联网是将两台或两台以上的计算机终端、客户端、服务端通过计算机信息技术手段互相联系起来的结果，人们借此可以与远在千里之外的朋友相互发送邮件、共同完成一项工作、共同娱乐。$kp$, section = '' where id = 22890;
update t_knowledge_point set title = $kp$互联网的两大组成部分$kp$, content = $kp$边缘部分：由所有连接在互联网上的主机组成，是用户直接使用的部分，用来进行通信和资源共享。

核心部分：由大量网络和连接这些网络的路由器组成，负责为边缘部分提供连通性和数据交换服务。$kp$, section = '' where id = 22897;
update t_knowledge_point set title = $kp$TCP/IP协议$kp$, content = $kp$TCP/IP是网络互连的工业标准，包含100多个协议，其中TCP（传输控制协议）和IP（网际协议）是两个最基本、最重要的协议。传输层负责把应用数据封装为TCP或UDP数据报。$kp$, section = '' where id = 22906;
update t_knowledge_point set title = $kp$使用网桥进行互连$kp$, content = $kp$网桥（Bridge）用来连接两个同类型的网段，比中继器多了“帧过滤”功能。

过滤帧：网桥检查每一信息帧的发送地址和目的地址。若目的地址与发送地址在同一网段，该帧就不会被网桥转发到另一个网段；只有当目的地址不在发送方所在网段时，网桥才把该帧转发到另一网段，从而降低整个网络的通信负荷。

网桥工作在网络的链路层，实现两个网络链路层的互连。$kp$, section = '' where id = 22939;
update t_knowledge_point set title = $kp$物联网与区块链的基本概念$kp$, content = $kp$开放的标准使不同厂商的产品可以相互操作。

物联网：连接到物联网上的物体应具有四个基本特征，即地址标识、感知能力、通信能力和可控制性。物联网的核心和基础仍然是互联网，它是在互联网基础上延伸和扩展的网络；其网络连接延伸到物品与物品之间，这些物品通过各种信息传感设备与互联网连接，进行信息交换和通信。

区块链：传输信息时需要接收方的地址，并使用接收方的公钥进行加密。

比特币和Q币都可以进行交易花费。$kp$, section = '' where id = 22944;
update t_knowledge_point set title = $kp$因特网（Internet）的发展与组成$kp$, content = $kp$Internet是最大的计算机互连网，它使用TCP/IP协议将遍布世界各地的计算机网络互连成一个超级计算机网络。

Internet起源于美国国防部的ARPANET计划，后来与美国国家科学基金会的科学教育网合并。20世纪90年代起，美国政府机构和公司的计算机也纷纷入网，并迅速扩大到全球100多个国家和地区。据估计，目前因特网已连接数百万个网络、上亿台计算机，用户数目超过6.5亿。

Internet在美国分为三个层次：底层为大学校园网或企业网，中间层为地区网，最高层为全国主干网（如NSFnet，National Science Foundation Network）。它们连通了美国东西海岸，并通过海底电缆或卫星通信等手段连接到世界各国。$kp$, section = '' where id = 22980;
update t_knowledge_point set title = $kp$OSI与TCP/IP模型对比$kp$, content = $kp$国际标准OSI参考模型为7层，互联网标准TCP/IP协议集为4层，对应关系如下：

| OSI（7层） | TCP/IP（4层） |
| --- | --- |
| 应用层 | 应用层 |
| 表示层 | 应用层 |
| 会话层 | 应用层 |
| 传输层 | 传输层 |
| 网络层 | 网络层 |
| 数据链路层 | 网络接口 |
| 物理层 | 网络接口 |

TCP/IP各层的主要协议：应用层包括Telnet、FTP、SMTP、DNS、HTTP以及其他应用协议；传输层为TCP、UDP；网络层为IP、ARP、RARP、ICMP；网络接口层为各种通信网络接口（以太网等物理网络）。$kp$, section = '' where id = 22985;
update t_knowledge_point set title = $kp$异构网络的互连$kp$, content = $kp$为了把不同类型的网络互连成一个统一的网络，必须解决统一编址和统一数据包格式等问题。解决方案是统一采用TCP/IP协议，使用的网络互连设备是路由器。

实际的物理网络中，以太网采用CSMA/CD，ATM面向连接，X.25使用虚电路，传输介质包括光纤、微波、卫星、同轴电缆、电话线、双绞线等，各网络的链路层和物理层各不相同。经路由器互连后，各层统一采用TCP/IP，对用户呈现为一个逻辑上单一的计算机网络。$kp$, section = '' where id = 23035;
update t_knowledge_point set title = $kp$移动互联网的定义$kp$, content = $kp$移动互联网是指互联网的技术、平台、商业模式和应用与移动通信技术结合并实践的活动的总称。移动互联网是以移动网络作为接入网络的互联网及服务，包括三个要素：移动终端、移动网络和应用服务。$kp$, section = '' where id = 23082;
update t_knowledge_point set title = $kp$网络互连需要解决的问题$kp$, content = $kp$不同的网络技术使用互不兼容的包格式和编址方案。为了把许多不同类型的物理网络连成一个统一的网络，必须解决统一编址、包格式转换等问题。$kp$, section = '' where id = 23089;
update t_knowledge_point set title = $kp$互联网发展的三个阶段$kp$, content = $kp$第1阶段：起源于1969年美国国防部的ARPANET网（4个大学互连），1983年确定TCP/IP协议作为ARPANET的标准协议。

第2阶段：20世纪90年代起，美国政府机构和公司的计算机纷纷入网，建成了由主干网、地区网和校园网（或企业网）三级结构组成的互联网。

第3阶段：迅速扩大到全球100多个国家和地区，逐渐形成多层次ISP结构的互联网，出现了互联网服务提供商（ISP）。$kp$, section = '' where id = 23138;
update t_knowledge_point set title = $kp$主机甲向主机乙传送文件的过程$kp$, content = $kp$该图示意主机甲向主机乙传送文件时数据在各层之间逐层封装与传递的过程，图中以1～5标注各层的处理步骤，原图内容已无法辨识。$kp$, section = '' where id = 24961;
update t_knowledge_point set title = $kp$应用层交付文件数据$kp$, content = $kp$应用程序把需要传送的文件交给应用层，形成文件数据；接收端为主机乙。$kp$, section = '' where id = 25164;
update t_knowledge_point set title = $kp$网络分层结构与TCP/IP协议$kp$, content = $kp$计算机网络工作可划分为三层模块：

第3层（最高层）文件处理模块：负责文件存取与处理，是两台计算机最高的一层。文件处理模块不能直接进行文件传输，需交给第2层通信服务模块。

第2层 通信服务模块：将数据和命令打包后交给第1层网络接入模块。

第1层 网络接入模块：根据所接入的网络类型进行处理和数据传输工作，将包转换成以太网的帧，并将数据转换成适合在网络上传输的电信号或光信号。

分层的优点：各层独立，灵活性好；易于实现和维护；促进标准化工作。

计算机网络分层——开放系统互联参考模型OSI（ISO提出），共7层：应用层、表示层、会话层、传输层、网络层、数据链路层（涉及MAC地址、点对点协议PPP）、物理层。

TCP/IP模型共4层：

第4层 应用层：SMTP（邮件发送协议）、HTTP（网页）、FTP（文件传输）、DNS、Telnet等。

第3层 传输层：TCP为面向连接、可靠的传输，将数据分成数据段，具有处理数据报丢失、重复、损坏的能力；UDP效率高但不保证可靠，面向非连接，用于音频和视频数据传输及QQ等。应用数据被转换成1个或多个TCP数据报或UDP数据报。

第2层 网络层：规定计算机使用的编址方案和数据包格式（IP数据报），包括IPv4、IPv6、ARP、RARP、ICMP等；TCP/UDP数据报被封装成IP数据报。

第1层 网络接口和硬件层（又称链路层）：规定怎样与不同的物理网络进行接口，如以太网、FDDI网、X.25网、帧中继网、ATM网；把IP数据报封装为以太网帧或ATM信元。

TCP/IP协议的特点：网络协议是为进行网络中的数据交换而建立的规则、标准或约定，三要素为语法、语义和同步。不同计算机的同一层共同遵循相同的规则和约定，才能进行数据通信。网络协议由软件和硬件实现。大多数局域网和因特网都采用美国国防部ARPANET的TCP/IP协议，TCP/IP是最核心的协议，是其他协议的基础。

TCP/IP分层模型和协议的主要特点：适用于异构网络；通过TCP的重传功能确保可靠的端到端通信；既支持面向连接服务（TCP），也支持无连接服务（UDP）。$kp$, section = '' where id = 25260;
update t_knowledge_point set title = $kp$IP数据报的组成$kp$, content = $kp$特点：互连的物理网络使用的数据包（或帧）格式不同，不能把一个网络送来的包直接在另一个网络上传输；IP协议定义了独立于各种物理网络的统一数据包格式，各种物理网络的数据包都能封装成IP数据报；传输的单位是IP数据报。

组成：包头和数据区。

包头：含版本号等控制信息，以及发送IP数据报的主机IP地址（源地址）和接收IP数据报的主机IP地址（目的地址），用于在网络中进行数据的存储转发。

数据区：数据（有效载荷），长度可变。$kp$, section = '' where id = 25263;
update t_knowledge_point set title = $kp$互联网与因特网服务提供商ISP$kp$, content = $kp$互联网的特点：使用TCP/IP协议、通过路由器连接所有网络；起源于美国国防部ARPANET，最初主要用于科研与教育服务。

因特网基于ISP的多层结构：第一层为最高级别的主干网ISP，第二层ISP是它们的用户，第三层为地区性ISP。早先的结构分为三级：主干网、地区网、校园网（覆盖全美的大学和研究所）。

互联网属于广域网、异构网络；工作模式为C/S模式，因特网大多数应用采用C/S工作模式，大大增强了网络信息服务的灵活性；用域名标识主机，并通过DNS解析为IP地址。

Internet指全球最大的互联网（因特网），起源于ARPANET但不等同于ARPANET；Intranet（内部网）是采用与因特网同样技术的网络，建在一个企业或组织的内部，只为成员提供服务。

互联网的组成：边缘部分为所有连接在因特网上的主机，是用户直接使用的部分；核心部分由大量网络和连接这些网络的路由器组成。

因特网服务提供商ISP的特点：计算机网络接入因特网需获得ISP（如江苏电信、南京广电）分配的IP地址；ISP拥有自己的通信线路，并拥有从因特网管理机构申请的许多IP地址。

对单位用户：ISP分配一批地址（如一个B类或若干个C类网络号），单位的网络中心再为网络中每一台主机指定子网号和主机号，使每台计算机都有自己固定的IP地址。

对个人和家庭用户：ISP不分配固定IP地址，而采用动态分配方式，由DHCP服务器临时分配一个IP地址。$kp$, section = '' where id = 25265;
update t_knowledge_point set title = $kp$OSI各层及其典型协议$kp$, content = $kp$开放系统互联参考模型（OSI/RM，7层）与互联网标准（TCP/IP协议集，4层）的对应关系及典型协议：

| OSI（7层） | TCP/IP（4层） | 协议 |
| --- | --- | --- |
| 应用层 | 应用层 | Telnet、FTP、SMTP、DNS、HTTP及其他应用协议 |
| 表示层 | 应用层 | 同上 |
| 会话层 | 应用层 | 同上 |
| 传输层 | 传输层 | TCP、UDP |
| 网络层 | 网络层 | IP、ARP、RARP、ICMP |
| 数据链路层 | 网络接口 | 各种通信网络接口（以太网等，物理网络） |
| 物理层 | 网络接口 | 同上 |$kp$, section = '' where id = 25350;
update t_knowledge_point set title = $kp$物联网的网络层$kp$, content = $kp$网络层主要通过现有互联网（IPv4/IPv6网络）、移动通信网（GSM、WCDMA、CDMA、无线接入网、无线局域网等）、卫星通信网等基础网络设施，对来自感知层的信息进行接入和传输。其主要设备是能接入各种异构网络的网关等。$kp$, section = '' where id = 26361;
update t_knowledge_point set title = $kp$移动互联网的局限性$kp$, content = $kp$移动互联网应用服务在提供便捷的同时，也受到来自网络能力和终端硬件能力的限制。在网络能力方面，受到无线网络传输环境、技术能力等因素限制；在终端硬件能力方面，受到终端大小、处理能力、电池容量等的限制。移动互联网各部分相互联系、相互作用并相互制约，任何一部分的滞后都会延缓移动互联网发展的步伐。$kp$, section = '' where id = 26420;
update t_knowledge_point set title = $kp$移动互联网雏形（2001年前）$kp$, content = $kp$最初，由于受到手机智能化程度与网络限制，中国移动和国内百家网络内容服务商（ICP）首次坐在一起探讨商业合作模式，初探“移动+开放的互联网”模式——“移动梦网”。手机用户可通过“移动梦网”享受移动游戏、信息点播、掌上理财、旅行服务、移动办公等服务，其主要以信息浏览和搜索为主。$kp$, section = '' where id = 26429;
update t_knowledge_point set title = $kp$网络带宽不断增加$kp$, content = $kp$1977年，世界上第一条光纤通信系统在美国芝加哥市投入商用，数据传输速率为45 Mbps，从此人类社会的信息传输速度不断被刷新。进入21世纪，世界各国纷纷加大宽带网络建设力度，不断扩大网络覆盖范围和传输速度。以我国为例，据工业和信息化部统计，截至2018年12月底，三家基础电信企业的固定互联网宽带接入用户总数达4.07亿户，全年净增5884万户。其中，光纤接入（FTTH/O）用户3.68亿户，占固定互联网宽带接入用户总数的90.4%。宽带用户持续向高速率迁移，100Mbps及以上接入速率的固定互联网宽带接入用户总数达2.86亿户，占固定宽带用户总数的70.3%。与此同时，移动通信宽带网络迅速发展，4G网络基本普及，5G网络不断建设，各种终端设备可以随时随地传输数据。大数据时代，信息传输不再遭遇网络发展初期的瓶颈和制约。$kp$, section = '' where id = 26523;
update t_knowledge_point set title = $kp$点对点（P2P）传输$kp$, content = $kp$点对点传输简称P2P网络。有了这个网络，任一节点可以把自己的交易信息向网络进行“广播”，同时获取来自网络内的总账内容。$kp$, section = '' where id = 26635;
update t_knowledge_point set title = $kp$以太坊的网络层$kp$, content = $kp$与比特币一样，以太坊的系统也是基于P2P网络的，网络中每个节点既有客户端角色，又有服务端角色。$kp$, section = '' where id = 26652;
update t_knowledge_point set title = $kp$互联网的起源与TCP/IP协议$kp$, content = $kp$互联网始于1969年的美国，又称因特网。在美军ARPA（阿帕网，美国国防部研究计划署）制定的协定下，将美国西南部四所大学的四台主要计算机连接起来，即UCLA（加利福尼亚大学洛杉矶分校）、Stanford Research Institute（斯坦福研究所）、UCSB（加利福尼亚大学圣巴巴拉分校）和University of Utah（犹他大学）。该网络由BBN等机构承建，1969年12月开始联机。

TCP/IP协议即传输控制协议/互联网协议（也称网络通信协议），是互联网的基础，由网络层的IP协议和传输层的TCP协议组成。$kp$, section = '' where id = 26766;
update t_knowledge_point set title = $kp$传输层协议：TCP与UDP$kp$, content = $kp$传输层：TCP协议面向连接、可靠；UDP协议无连接、不可靠、尽力而为，适用于音频和视频。$kp$, section = '' where id = 27375;
update t_knowledge_point set title = $kp$网络互连层$kp$, content = $kp$网络互连层使用IP协议，路由器工作在这一层。$kp$, section = '' where id = 27376;
update t_knowledge_point set title = $kp$IP数据报与ATM信元$kp$, content = $kp$IP数据报分为头部和数据区，数据大小不固定，最大64KB。ATM网的数据报大小固定为53字节。路由器尽力而为地传输IP数据报，但并不能保证数据传输的可靠性，须由上层的TCP协议来解决。$kp$, section = '' where id = 27387;
update t_knowledge_point set title = $kp$接入 Internet 的计算机不能保证传输可靠性$kp$, content = $kp$任何一台能正常访问 Internet 的计算机，都不能保证数据传输的可靠性，可靠性需要由传输层的 TCP 协议来保证。$kp$, section = '' where id = 27402;
update t_knowledge_point set title = $kp$TCP/IP 协议适用于局域网和广域网$kp$, content = $kp$TCP/IP 协议适用于局域网和广域网。常用的局域网有：共享式以太网、交换式以太网、千（万）兆位以太网、无线局域网。$kp$, section = '' where id = 28180;
update t_knowledge_point set title = $kp$传输层协议：TCP 与 UDP$kp$, content = $kp$传输层：TCP 协议面向连接、可靠；UDP 无连接、不可靠、尽力而为，适用于音频视频等实时业务。$kp$, section = '' where id = 28186;
update t_knowledge_point set title = $kp$IP 数据报的结构与大小$kp$, content = $kp$IP 数据报分为头部和数据区，数据大小不固定，最大 64KB；ATM 网的数据包大小固定为 53 字节。路由器尽力而为地传输 IP 数据报，但不能保证数据传输的可靠性，可靠性需要由上层 TCP 协议解决。$kp$, section = '' where id = 28197;
update t_knowledge_point set title = $kp$OSI/RM 的七层与 TCP/IP 的四层$kp$, content = $kp$ISO 的开放系统互连参考模型（OSI/RM）分为物理层、数据链路层、网络层、运输层、会话层、表示层和应用层 7 层；TCP/IP 模型则分为网络接口层、网际层、运输层和应用层 4 层。$kp$, section = '' where id = 28203;
update t_knowledge_point set title = $kp$Internet 的定义$kp$, content = $kp$Internet 是当前全球最大的、开放的、由众多网络相互连接而成的特定计算机网络，它采用 TCP/IP 协议作为通信的规则。$kp$, section = '' where id = 28204;
update t_knowledge_point set title = $kp$TCP/IP 将互联网分为四层$kp$, content = $kp$TCP/IP 协议将互联网分为 4 层：网络接口层、网际层、运输层、应用层。$kp$, section = '' where id = 28324;
update t_knowledge_point set title = $kp$IP 协议不保证数据传输的正确性$kp$, content = $kp$在 TCP/IP 网络中，IP 协议不能保证传输数据的正确性，数据的正确性必须依靠 TCP 协议。$kp$, section = '' where id = 28331;
update t_knowledge_point set title = $kp$TCP/IP 协议的核心是 IP 协议$kp$, content = $kp$TCP/IP 协议的核心是 IP 协议。$kp$, section = '' where id = 28512;
update t_knowledge_point set title = $kp$TCP 是面向连接的可靠协议$kp$, content = $kp$TCP 协议是面向连接的可靠协议，保证了数据的正确性。$kp$, section = '' where id = 28535;
update t_knowledge_point set title = $kp$传输层 TCP 可靠、UDP 不可靠$kp$, content = $kp$传输层中，TCP 协议是可靠的，UDP 协议是不可靠的。$kp$, section = '' where id = 28538;
update t_knowledge_point set title = $kp$网络互连层与路由器$kp$, content = $kp$网络互连层：路由器工作在这一层，主要协议有 IP、ARP、RARP、ICMP。$kp$, section = '' where id = 28539;
update t_knowledge_point set title = $kp$OSI 七层中与 TCP/IP 应用层对应的层次$kp$, content = $kp$国际标准化组织（ISO）定义的开放系统互连（OSI）参考模型含有 7 层，其中应用层、表示层、会话层与 TCP/IP 的应用层相对应。$kp$, section = '' where id = 28550;
update t_knowledge_point set title = $kp$互联网采用统一的 TCP/IP 协议$kp$, content = $kp$互联网采用统一的网络通信协议，核心是 TCP/IP（传输控制协议/网际协议），该协议族包含一百多个协议，其中 IP 协议是核心。$kp$, section = '' where id = 29181;
update t_knowledge_point set title = $kp$可靠传输是互联网的特征$kp$, content = $kp$可靠传输是互联网的关键特征，指通过各种电信网络与因特网融合，对接收到的感知信息进行实时远程传送，实现信息的交互和共享，并进行各种有效的处理。这一过程通常需要用到现有的电信运行网络，包括无线和有线网络；尤其是 5G 移动通信的发展，更加推动了物联网的快速接入。$kp$, section = '' where id = 29182;
update t_knowledge_point set title = $kp$TCP/IP 是包含 100 多个协议的协议系列$kp$, content = $kp$TCP/IP 是一个协议系列，包含了 100 多个协议，TCP（传输控制协议）和 IP（网络互连协议）是其中两个最基本、最重要的协议。$kp$, section = '' where id = 29280;
update t_knowledge_point set title = $kp$TCP/IP 将网络通信问题划分为四个层次$kp$, content = $kp$TCP/IP 协议将计算机网络通信问题划分为 4 个层次：网络接口和硬件层（如 FDDI、ATM）、网络互连层（如 IP）、传输层（如 TCP、UDP）、应用层（如 HTTP、FTP、SMTP、POP3、IMAP）。$kp$, section = '' where id = 29281;
update t_knowledge_point set title = $kp$Internet 的起源与三级网络结构$kp$, content = $kp$Internet 起源于美国国防部的 ARPANET 计划，在美国分为 3 个层次：校园网、地区网、全国主干网。$kp$, section = '' where id = 29286;
update t_knowledge_point set title = $kp$Internet 属于广域网、异构网络$kp$, content = $kp$Internet 属于广域网，是异构网络，使用 TCP/IP 协议，工作模式为 C/S 模式（客户/服务器工作模式）。$kp$, section = '' where id = 29287;
update t_knowledge_point set title = $kp$网络协议的定义与三要素$kp$, content = $kp$网络协议是为进行网络中的数据交换而建立的规则、标准或约定，由三个要素组成：语法、语义、同步。$kp$, section = '' where id = 29312;
update t_knowledge_point set title = $kp$用 ping 命令测试到 Internet 的连通性$kp$, content = $kp$ping 命令用于测试到 Internet 的网络状态，示例输出：
64 bytes from 104.193.88.77: icmp_seq=1 ttl=128 time=155 ms
64 bytes from 104.193.88.77: icmp_seq=2 ttl=128 time=249 ms
64 bytes from 104.193.88.77: icmp_seq=3 ttl=128 time=168 ms
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 155.187/191.097/249.388/41.587 ms
注意：访问外网需要宿主机网络能够上 Internet。$kp$, section = '' where id = 29407;
update t_knowledge_point set title = $kp$网络互连层与路由器$kp$, content = $kp$网络互连层：IP 协议属于这一层，路由器也工作在这一层。$kp$, section = '' where id = 29435;
update t_knowledge_point set title = $kp$OSI 七层模型与 IP 地址$kp$, content = $kp$ISO 的 OSI（开放系统互联）参考模型分为七层。

IP 地址就像移动电话的电话号码，互联网中两台计算机互相通信，必须知道彼此的 IP 地址。IP 地址的本质是二进制数，只是为了方便使用才采用点分十进制表示。IP 地址是人为设定的逻辑地址。

IP 地址有两个版本：IPv4 因位数少，目前已被分配完；IPv6 是 128 位的 IP 地址，符合物联网的发展趋势，可解决 IPv4 地址不够用的问题，具有更灵活的头部、更高的安全性并支持自动配置。$kp$, section = '' where id = 29436;
update t_knowledge_point set title = $kp$以太网通信可以不必使用 TCP/IP 协议$kp$, content = $kp$互联网需要使用 TCP/IP 协议实现计算机的互联，而以太网通信可以不必使用 TCP/IP 协议。$kp$, section = '' where id = 29494;
update t_knowledge_point set title = $kp$Web 2.0 的核心理念$kp$, content = $kp$Web 2.0 是互联网的一次理念和思想体系的升级换代，由原来自上而下、由少数资源控制者集中控制主导的互联网体系，转变为自下而上、由广大用户集体智慧和力量主导的互联网体系。$kp$, section = '' where id = 29507;
update t_knowledge_point set title = $kp$5G、Web 2.0 与 HTML5 等关键技术$kp$, content = $kp$全面发展期（2014 年至今）。

5G 通信的主要优势：超高速率、低功耗、低成本、强大连接能力；频率更高、频带更宽，延迟约 1ms，最高 10Gb/s，每平方千米同时连接数可达百万量级。技术特点包括网络切片、网络开放虚拟化、NSA 与 SA 两种组网方式、毫米波（波长 1～10 毫米的电磁波）、小基站、多天线部署、全双工。关键技术还包括为用户提供计算和存储能力的边缘计算。2018 年开始试验组网。

SOA：面向服务的架构，是一种粗粒度、松耦合的服务架构。

Web 2.0：Web 1.0 的互联网内容由少数编辑人员（或站长）定制，如各门户网站；Web 2.0 中每个人都是内容的供稿者，标志着以个人为中心的互联网时代的到来。它并不是某一项具体技术，而是提倡众人参与的互联网思维模式。

HTML5：构建 Web 内容的一种语言描述方式。最显著的优势是跨平台性，用 H5 搭建的站点与应用可以兼容 PC 端与移动端、Windows 与 Linux、安卓与 iOS；最大特色之一是支持音频视频；有利于 SEO（搜索引擎优化）。

Android 系统架构自上而下共包含四个层次：应用程序层、应用程序框架层、系统运行库层和 Linux 内核层。$kp$, section = '' where id = 29512;
update t_knowledge_point set title = $kp$用ping 127.0.0.1验证TCP/IP$kp$, content = $kp$输入ping 127.0.0.1，验证网卡是否可以正常加载并运行TCP/IP。如不正常，应检查协议添加的正确性。$kp$, section = '' where id = 32005;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22560,22583,22588,22604,22629,22658,22661,22730,22751,22761,22829,22840,22890,22897,22906,22939,22944,22980,22985,23035,23082,23089,23138,24961,25164,25260,25263,25265,25350,26361,26420,26429,26523,26635,26652,26766,27375,27376,27387,27402,28180,28186,28197,28203,28204,28324,28331,28512,28535,28538,28539,28550,29181,29182,29280,29281,29286,29287,29312,29407,29435,29436,29494,29507,29512,32005) and not deleted) <> 66 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
