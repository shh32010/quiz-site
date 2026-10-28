-- 知识点 96 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_96
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_96 as
select * from t_knowledge_point where id in (22244,22600,22684,22697,22729,22756,22962,23001,23003,23011,23012,23094,25306,25466,26759,27417,27418,27420,27422,27423,28105,28171,28172,28174,28176,28178,28179,28338,28528,29186,29272,29273,29274,29279,29322,29339,29340,29352,29353,29354,29358,29362,29431,29466,31987);

update t_knowledge_point set title = $kp$局域网共享资源的特点$kp$, content = $kp$- 可共享的资源主要是文件和打印机，由资源所在计算机自行管理，使用比较简单。
- 不需要专门的硬件服务器，也不需要网络管理员。
- 保证可靠性和安全性是关键。$kp$, section = '' where id = 22244;
update t_knowledge_point set title = $kp$局域网的组成、MAC 地址与数据帧$kp$, content = $kp$计算机局域网的逻辑组成包括网络工作站、网络服务器、网络打印机、网络接口卡、传输介质、网络互连设备等。

网络上的每一台设备都有自己的物理地址，称为介质访问地址（MAC 地址），以便相互区别，实现计算机之间的通信。MAC 地址由 48 位（6 个字节）二进制数组成。

局域网采用分组交换技术。为使网络上的计算机都能得到迅速而公平的数据传输机会，局域网要求每台计算机把要传输的数据分成小块（称为“帧”），一次只能传输 1 帧，不允许任何计算机连续传输任意多的数据。这样，来自多台计算机的不同数据帧就以时分多路复用的方式共享传输介质，显著提高了网络的整体效率。

数据帧包含五部分内容：源计算机 MAC 地址、目的计算机 MAC 地址、控制信息、传输的数据、检验信息。$kp$, section = '' where id = 22600;
update t_knowledge_point set title = $kp$网卡的作用与分类$kp$, content = $kp$网络上的每台计算机都安装有网络接口卡（简称网卡），每块网卡都有一个全球唯一的地址码，该地址码就成为安装了该网卡的计算机的物理地址（MAC 地址）。网卡通过双绞线、光纤或者无线电波把计算机与网络连接起来。网卡的任务是负责发送数据和接收数据，CPU 将其视同为输入/输出设备。

局域网有若干类型。不同类型的局域网其 MAC 地址的规定和数据帧的格式各不相同，因此接入不同类型局域网的计算机需要使用不同类型的网卡。另外，即使接入同类局域网，使用有线传输与使用无线传输的网卡也是有区别的。$kp$, section = '' where id = 22684;
update t_knowledge_point set title = $kp$星型拓扑结构$kp$, content = $kp$在局域网的拓扑结构中，以交换机或主机为中央节点、其他计算机都与该中央节点相连接的拓扑结构是星型结构。$kp$, section = '' where id = 22697;
update t_knowledge_point set title = $kp$计算机网络的组成要素$kp$, content = $kp$计算机网络是利用通信设备和网络软件，把多台计算机连接起来的一个系统。

性质：它是一种数据通信系统（与电话、电视系统不同）；它是计算机系统的延伸与扩展，需要使用多种复杂的技术。

组成要素：
1. 终端设备：计算机、手机、平板电脑、电子书、监控探头等。
2. 数据通信链路：包括用于传输数据的介质（双绞线、光缆、无线电波等）和通信控制设备（网卡、集线器、交换机、调制解调器、路由器等），确保通信正确、可靠、有效地进行。
3. 网络通信协议：共同遵循的一组规则和约定，规定通信如何开始和结束、数据如何表示、命令如何表示、通信对象如何区分、身份如何鉴别、发生错误如何处理等，例如 TCP/IP、HTTP、FTP、POP3 等。
4. 网络操作系统和网络应用软件：实现通信协议、管理网络资源，并实现各种网络应用，如浏览器、电子邮件程序、QQ、搜索引擎等。$kp$, section = '' where id = 22729;
update t_knowledge_point set title = $kp$局域网的物理组成$kp$, content = $kp$局域网的物理组成包括工作站、服务器（含网络接口卡）、网络打印机、传输介质、网络互连设备（例如集线器、交换机）等。

网络上的每一台设备，包括工作站、服务器以及打印机等，都称为网络上的一个节点（node）。网络上的每一个节点都有一块网络接口卡（NIC，简称网卡），网卡通过电缆把节点与网络连接起来。

为了实现总线上任意两个节点之间的通信，局域网中的每个节点都有一个唯一的地址，称为介质访问地址（Media Access Address，简称 MAC 地址），由 48 位二进制数组成。

每一个数据帧中都要包含自己的 MAC 地址和接收节点的 MAC 地址。数据帧的接收方可以是一个节点，也可以是一组节点（组播），甚至是网络中的所有节点（广播）。$kp$, section = '' where id = 22756;
update t_knowledge_point set title = $kp$决定局域网性能的主要技术$kp$, content = $kp$- 用以传输数据的传输介质。
- 用以连接各种设备的网络拓扑结构。
- 对共享资源（传输介质）的介质访问控制方法。$kp$, section = '' where id = 22962;
update t_knowledge_point set title = $kp$局域网（LAN）的特点与组成$kp$, content = $kp$- 单位自建自管，地理范围有限。
- 使用专门铺设的传输介质进行连网。
- 数据传输速率高（10Mbps～10Gbps），延迟时间短。
- 数据传输误码率低（10⁻⁸～10⁻¹¹）。

传输介质为双绞线、同轴电缆、光纤或者无线电波；连接的每台设备都装有网络接口卡（网卡），计算机通过网卡和传输介质相互连接。$kp$, section = '' where id = 23001;
update t_knowledge_point set title = $kp$局域网的拓扑结构类型$kp$, content = $kp$环型局域网：传输速率高，传输距离远；一个站点的故障会引起整个网络的崩溃。例如 IBM 令牌环网。

星型局域网：通信协议简单，站点故障容易检测和隔离；连线费用大，中央结点要求高。例如 ATM 交换式局域网。$kp$, section = '' where id = 23003;
update t_knowledge_point set title = $kp$局域网的分类$kp$, content = $kp$- 按使用的传输介质可分为：有线网、无线网。
- 按网中各种设备互连的拓扑结构可分为：星型、环型、总线型、树型、混合型。
- 按所使用的介质访问控制方法可分为：以太网、交换式局域网、令牌环网、FDDI 网等。$kp$, section = '' where id = 23011;
update t_knowledge_point set title = $kp$局域网的组成$kp$, content = $kp$结点（node）：网络上的每一台设备，包括工作站、服务器以及打印机等，都称为网络上的一个结点。

网卡（网络适配器）：网络上的每一个结点都有一块网络接口卡。网卡和电缆负责把结点与网络连接起来，将需要发送的数据从计算机传送到网络，将需要接收的数据从网络传送到结点。不同类型的网络使用不同类型的网卡。

MAC 地址：为了实现总线上任意两个节点之间的通信，局域网中的每个节点都有一个唯一的地址，称为介质访问地址（Media Access Address，简称 MAC 地址）。每一个数据帧中都要包含自己的 MAC 地址和接收节点的 MAC 地址。数据帧的接收方可以是一个节点，也可以是一组节点（组播），甚至是网络中的所有节点（广播）。

【2007 真题】在以太（Ethernet）局域网中，每个节点把要传输的数据封装成“数据帧”，来自多个节点的不同数据帧以时分多路复用的方法共享传输介质。这些数据帧能被目的主机正确接收，一个重要原因是帧头部封装了目的主机的（　）。A．IP 地址　B．MAC 地址　C．计算机名　D．域名地址　答案：B。

【2007 真题】计算机网络中，互连的各种数据终端设备是按（　）相互通信的。答案：通信协议。仅连接网络硬件设备无法通信，硬件之间通信还需要网络协议来规范通信格式。$kp$, section = '' where id = 23012;
update t_knowledge_point set title = $kp$网络工作站$kp$, content = $kp$一台独立的计算机使用电缆或其他通信介质与一个局域网连接后，它就成为网络上的一个工作站，使用这台计算机的用户就成了一个网络用户。

工作站本身所具有的硬盘、光盘、程序、数据、打印机等都是该用户的本地资源，网络上其他工作站和服务器的资源称为网络资源。$kp$, section = '' where id = 23094;
update t_knowledge_point set title = $kp$局域网 LAN 的特点与应用$kp$, content = $kp$局域网（LAN）的特点：网络地域范围较小（几公里）；属于一个单位所有并由该单位管理；家庭多台计算机互连成网可视为 PAN 的特例。

应用：一幢楼、一个校园、一个企业，如校园网、企业网。

局域网的一般特点：地理范围有限（几公里）；使用双绞线、同轴电缆、光纤等传输介质；传输速率高、误码率低；以共享传输信道为基础；结构简单、连接规范；有特定的拓扑结构；有特定的介质访问控制方式；安全可靠。

局域网中计算机所扮演的角色：服务器提供资源（数据文件、磁盘空间、打印机、处理能力等）；客户机是使用服务器资源的计算机。$kp$, section = '' where id = 25306;
update t_knowledge_point set title = $kp$局域网拓扑结构与 MAC 地址$kp$, content = $kp$总线型局域网：共享总线以太网。按介质分为有线、无线；按通信方式分为广播式、点对点式。

环型局域网：令牌网、FDDI（光纤分布式数据接口网），环型拓扑的抗故障性能好。

星型局域网：以中央结点连接各站点。

树形局域网：千兆/万兆以太网。

MAC 地址：
- 局域网中每一个节点（每块以太网卡）都有一个全球唯一的 MAC 地址，又称物理地址、介质访问控制地址、硬件地址。
- MAC 地址使用 48 位表示，一般用十六进制书写，例如 00 02 AC 39 FE AE。
- MAC 地址出厂时写在固件里，通常情况下无法直接修改，需要借助工具软件修改，例如 Windows 系统上有操作界面可以修改。
- 局域网内的节点之间通信只使用 MAC 地址，不使用 IP 地址。
- 不同类型局域网的 MAC 地址格式各不相同。$kp$, section = '' where id = 25466;
update t_knowledge_point set title = $kp$局域网的特点、组成与分类$kp$, content = $kp$特点：建网、维护以及扩展等较容易，系统灵活性高，覆盖范围小、传输效率高、延迟短、支持多种传输介质。

组成：局域网由网络硬件（包括网络服务器、网络工作站、网络打印机、网卡、网络互连设备等）、网络传输介质以及网络软件组成。

分类：按网络使用的传输介质分类，可分为有线网和无线网。$kp$, section = '' where id = 26759;
update t_knowledge_point set title = $kp$节点的物理地址（MAC 地址）$kp$, content = $kp$局域网中的每个节点都有一个唯一的物理地址，即介质访问地址（MAC 地址），又称硬件地址。$kp$, section = '' where id = 27417;
update t_knowledge_point set title = $kp$不同类型局域网的 MAC 地址格式不同$kp$, content = $kp$不同类型局域网的 MAC 地址格式各不相同。$kp$, section = '' where id = 27418;
update t_knowledge_point set title = $kp$不同类型局域网需要不同的网卡与数据帧$kp$, content = $kp$不同类型的局域网需要不同的网卡，数据帧的格式和大小也不同。$kp$, section = '' where id = 27420;
update t_knowledge_point set title = $kp$局域网使用的网络协议$kp$, content = $kp$局域网普遍使用 TCP/IP 网络协议，局域网也可以使用其他协议。$kp$, section = '' where id = 27422;
update t_knowledge_point set title = $kp$TCP/IP 协议与常用局域网类型$kp$, content = $kp$TCP/IP 协议既适用于局域网，也适用于广域网。

常用的局域网有：共享式以太网、交换式以太网、千（万）兆位以太网、无线局域网。$kp$, section = '' where id = 27423;
update t_knowledge_point set title = $kp$MAC 地址的别称$kp$, content = $kp$局域网中的每个节点都有一个唯一的物理地址（介质访问地址、硬件地址），简称 MAC 地址。$kp$, section = '' where id = 28105;
update t_knowledge_point set title = $kp$局域网的主要性能特点$kp$, content = $kp$数据传输速率高，延时短，可靠性高，误码率低，使用专线连接。$kp$, section = '' where id = 28171;
update t_knowledge_point set title = $kp$局域网内通信只使用 MAC 地址$kp$, content = $kp$节点在局域网内通信时只使用 MAC 地址，不使用 IP 地址。$kp$, section = '' where id = 28172;
update t_knowledge_point set title = $kp$数据帧与时分多路复用$kp$, content = $kp$局域网采用时分多路复用技术，把传输的数据分成小块，称为“数据帧”，每个节点每次传输 1 个帧。$kp$, section = '' where id = 28174;
update t_knowledge_point set title = $kp$不同类型局域网需要不同的网卡与帧格式$kp$, content = $kp$不同类型局域网需要不同的网卡，数据帧的格式也不同。$kp$, section = '' where id = 28176;
update t_knowledge_point set title = $kp$一台设备可拥有多个 MAC 地址$kp$, content = $kp$一台设备可以安装多个网卡，因此可以拥有多个 MAC 地址。$kp$, section = '' where id = 28178;
update t_knowledge_point set title = $kp$局域网普遍使用 TCP/IP 协议$kp$, content = $kp$局域网普遍使用 TCP/IP 网络协议，局域网也可以使用其他协议。$kp$, section = '' where id = 28179;
update t_knowledge_point set title = $kp$局域网协议与以太网的主流地位$kp$, content = $kp$局域网的协议有很多种，不是只有 TCP/IP 协议；互联网只使用 TCP/IP 协议。

局域网有很多种类，在计算机网络的发展过程中，以太网最终成为主流。以太网是局域网的一种标准，是目前最为普遍的一种局域网。$kp$, section = '' where id = 28338;
update t_knowledge_point set title = $kp$以太网是局域网的一种类型$kp$, content = $kp$局域网有很多种类型，以太网是局域网的一种。$kp$, section = '' where id = 28528;
update t_knowledge_point set title = $kp$星型局域网（交换式以太网）$kp$, content = $kp$星型局域网即交换式以太网。中央节点发生故障之后，整个网络会瘫痪；费用要比其他结构高。$kp$, section = '' where id = 29186;
update t_knowledge_point set title = $kp$局域网的逻辑组成$kp$, content = $kp$局域网在逻辑上主要包括：工作站、服务器、网络打印机、网卡、传输介质、网络互连设备。$kp$, section = '' where id = 29272;
update t_knowledge_point set title = $kp$节点的 MAC 地址与数据帧内容$kp$, content = $kp$局域网中的每个节点（node）都有一个全球唯一的物理地址，即 MAC 地址（48 位二进制数，随每块网卡分配）。网卡的任务就是发送“帧”和接收“帧”，帧中包含“源计算机 MAC 地址”“目的计算机 MAC 地址”和“传输的数据”。$kp$, section = '' where id = 29273;
update t_knowledge_point set title = $kp$常见的局域网类型$kp$, content = $kp$以太网：10/100Mbps 自适应网卡，以集线器为中心，分为总线式（总线拓扑结构，共享带宽，广播方式通信）和交换式（星型拓扑结构，独享带宽，点到点通信）。

FDDI 网：环型拓扑结构，主/副双环，光纤，100Mbps。

WLAN：无线电波，无线网卡、无线集线器、无线网桥，协议是 802.11（11Mbps）和蓝牙（1Mbps，10cm～10m，适合办公室、家庭环境）。$kp$, section = '' where id = 29274;
update t_knowledge_point set title = $kp$局域网与广域网常用的网络协议$kp$, content = $kp$局域网一般采用的网络协议有：IPX、NetBEUI、TCP/IP；广域网一般采用 TCP/IP 协议。$kp$, section = '' where id = 29279;
update t_knowledge_point set title = $kp$局域网传输介质及其传输距离$kp$, content = $kp$有线介质：双绞线 100 米；同轴电缆 185 米和 500 米；光纤 2 千米和 20 千米。

无线介质：无线电波、红外线、蓝牙、激光。$kp$, section = '' where id = 29322;
update t_knowledge_point set title = $kp$局域网（LAN）的英文名称$kp$, content = $kp$局部区域网络（Local Area Network）通常简称为局域网，英文缩写为 LAN。$kp$, section = '' where id = 29339;
update t_knowledge_point set title = $kp$局域网的定义与应用地位$kp$, content = $kp$局域网是在同一地点上经网络连在一起的一组计算机。局域网通常相距很近，是目前应用最广泛的一类网络，其性能主要取决于传输介质和介质访问控制方式。$kp$, section = '' where id = 29340;
update t_knowledge_point set title = $kp$小型局域网$kp$, content = $kp$小型局域网：用户数大约 100 人及以下。一般选用总线型或星型拓扑结构。$kp$, section = '' where id = 29352;
update t_knowledge_point set title = $kp$中型局域网$kp$, content = $kp$中型局域网：用户数大约 100 人至 500 人，一般在企业、政府、科研及教育等单位。用户对于网络的需求各不相同，从简单的文件共享、办公自动化，到复杂的电子商务、ERP 等。一般选用星型拓扑结构或者树型拓扑结构。$kp$, section = '' where id = 29353;
update t_knowledge_point set title = $kp$大型局域网$kp$, content = $kp$大型局域网的用户数超过 1000 人，如学校、医院、数码社区、大型商场等。一般采用多种拓扑组合，比如主干网采用星形或总线结构。网络分层设计为三层：核心层、汇聚层和接入层。$kp$, section = '' where id = 29354;
update t_knowledge_point set title = $kp$网卡的分类与传输速率$kp$, content = $kp$网卡分为集成网卡和独立网卡。按支持的传输速率分类，主要分为 10Mbps 网卡、100Mbps 网卡、10/100Mbps 自适应网卡和 1000Mbps 网卡四类。

10Mbps 和 100Mbps 网卡分别只支持 10Mbps 和 100Mbps 的传输速率。在使用非屏蔽双绞线 UTP 作为传输介质时，通常 10Mbps 网卡与 3 类 UTP 配合使用，100Mbps 网卡与 5 类 UTP 相连接。10/100Mbps 自适应网卡由网卡自动检测网络的传输速率，保证网络中两种不同传输速率的兼容性。随着局域网传输速率不断提高，1000Mbps 网卡大多应用于高速服务器中。$kp$, section = '' where id = 29358;
update t_knowledge_point set title = $kp$对等网网络故障的排除$kp$, content = $kp$对等网常见故障及排查顺序：① 网线不通；② 系统找不到网卡；③ 网卡驱动程序未安装或安装错误；④ 网络组件不完整；⑤ IP 地址未配置或冲突。$kp$, section = '' where id = 29362;
update t_knowledge_point set title = $kp$局域网的特点$kp$, content = $kp$局域网的特点：① 数据传输率高；② 延时短，可靠性高；③ 误码率低；④ 使用专线；⑤ 主机数量有限。$kp$, section = '' where id = 29431;
update t_knowledge_point set title = $kp$局域网的 MAC 地址与帧$kp$, content = $kp$局域网中每个节点都有一个唯一的地址，称为介质访问地址（MAC 地址），由 48 位二进制（6 字节）组成。

局域网不一定要采用 TCP/IP 协议，也可以采用 NetBEUI、IPX/SPX 等协议。

局域网采用时分多路复用技术，传输数据分成的小块称为“帧”，每个节点每次传输 1 个帧。帧中包含发送端的 MAC 地址和接收端的 MAC 地址，缺一不可。$kp$, section = '' where id = 29466;
update t_knowledge_point set title = $kp$星型网络的中央结点$kp$, content = $kp$星型网络由一个唯一的转发结点（中央结点）和连接到该中央结点的各站点组成，各站点之间的通信都经中央结点转发。$kp$, section = '' where id = 31987;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22244,22600,22684,22697,22729,22756,22962,23001,23003,23011,23012,23094,25306,25466,26759,27417,27418,27420,27422,27423,28105,28171,28172,28174,28176,28178,28179,28338,28528,29186,29272,29273,29274,29279,29322,29339,29340,29352,29353,29354,29358,29362,29431,29466,31987) and not deleted) <> 45 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
