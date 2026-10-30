-- 知识点 105 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_105
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_105 as
select * from t_knowledge_point where id in (22724,22783,22798,22876,22961,23118,23119,23120,23121,25307,25492,25493,26768,27388,27389,28198,28199,28200,28201,28330,28332,28334,28342,28513,28536,28542,29205,29215,29285,29309,29310,29323,29355,29356,29421,29423,29440,29474,29497);

update t_knowledge_point set title = $kp$路由器$kp$, content = $kp$路由器是一台用于完成网络互连工作的专用计算机，可以把局域网与局域网、局域网与广域网或两个广域网互相连接起来，被连接的这两个网络不必使用同样的技术。
路由器实际上是一台高性能的专用计算机，它有多个输入端口和多个输出端口，其主要功能是：选择路由、转发 IP 数据报、进行协议转换等。
每个路由器应分配 2 个或多个 IP 地址。
若某计算机网络连接到路由器的某个端口，则该网络中各计算机的 IP 地址与路由器该端口 IP 地址中一定相同的是“网络号”。$kp$, section = '' where id = 22724;
update t_knowledge_point set title = $kp$路由器$kp$, content = $kp$路由器是用于连接异构网络的基本设备，是一台用于完成网络互连工作的专用计算机，可以把局域网与局域网、局域网与广域网或两个广域网互相连接起来，被连接的这两个网络不必使用同样的技术。
路由器可以连接 2 个甚至多个物理网络，因此每个路由器应分配 2 个或多个 IP 地址。
路由器每个端口的 IP 地址必须与相连子网的 IP 地址具有相同的子网地址。
路由器工作在网络层。$kp$, section = '' where id = 22783;
update t_knowledge_point set title = $kp$路由器连接逻辑网络$kp$, content = $kp$在网络互连设备中，路由器主要用于连接不同的逻辑网络，且每一个端口都有唯一的物理地址和逻辑地址。$kp$, section = '' where id = 22798;
update t_knowledge_point set title = $kp$路由器与网桥的作用区别$kp$, content = $kp$一、作用不同
1. 路由器：在网络间起网关的作用，是读取每一个数据包中的地址然后决定如何传送的专用智能型网络设备。
2. 网桥：是连接两个局域网的一种存储转发设备，能将一个网段或两个相隔较远的 LAN 互连，使 LAN 上的所有用户都能访问服务器。$kp$, section = '' where id = 22876;
update t_knowledge_point set title = $kp$交换机 MAC 地址学习与转发流程$kp$, content = $kp$具体工作流程如下：
（1）当交换机从某个端口收到一个数据包时，它读取包头中的源 MAC 地址，这样它就知道源 MAC 地址的机器是连在哪个端口上的。
（2）读取包头中的目的 MAC 地址，并在地址表中查找相应的端口。
（3）如果表中有与这个目的 MAC 地址对应的端口，就把数据包直接转发到该端口上。
（4）如果表中找不到相应的端口，则把数据包广播到所有端口上；当目的机器对源机器回应时，交换机就可以学习到目的 MAC 地址与哪个端口对应，下次传送数据时就不需要对所有端口进行广播了。$kp$, section = '' where id = 22961;
update t_knowledge_point set title = $kp$路由器转发 IP 数据报的过程$kp$, content = $kp$假设以太网中的计算机 A 要把一个 IP 数据报发给 FDDI 网络中的计算机 B，其过程大体如下：
因为目的地计算机 B 在 FDDI 网中，所以源计算机必须先把 IP 数据报送到路由器 R1（IP 地址为 131.108.99.5）。
源计算机 A 与路由器 R1 都连接在同一个以太网中，它们进行数据通信必须使用 MAC 地址，因此应将计算机 A（131.108.99.2）与路由器 R1 的 IP 地址（131.108.99.5）分别翻译为 MAC 地址，这个过程称为“地址解析”，地址解析是在计算机 A 中完成的。
计算机 A 需发送的 IP 数据报与以太网的信息帧格式不一致，不能直接在以太网上传输，因此必须将 IP 数据报“封装”成以太网的帧格式。
在以太网中将信息帧按 MAC 地址发送至路由器 R1，路由器收到这一信息帧之后，从帧中取出 IP 数据报，然后丢弃这一帧。
路由器 R1 通过查找路由表知道，计算机 B 就在本地 FDDI 网络中，于是经过地址解析，把路由器 R1 的 IP 地址（223.240.129.2）和计算机 B 的 IP 地址（223.240.129.5）解析为 FDDI 网络中的物理地址（由路由器完成）。
路由器将收到的 IP 数据报封装成为 FDDI 的帧格式。
在 FDDI 网络中，路由器把信息帧按 FDDI 物理地址发送至目的地计算机 B，目的地计算机收到这一帧信息后，从帧中取出 IP 数据报，传输任务到此完成。$kp$, section = '' where id = 23118;
update t_knowledge_point set title = $kp$路由器的作用与 IP 地址设置$kp$, content = $kp$路由器是一种能够连接异构网络的分组交换机，其作用是：
按照路由表在网络之间转发数据包；
根据需要对数据包的格式进行转换。
路由器的 IP 地址设置：
当路由器某端口连接一个物理网络时，该端口应分配 IP 地址；
该 IP 地址的网络号必须与所连接物理网络的网络号相同。$kp$, section = '' where id = 23119;
update t_knowledge_point set title = $kp$路由器转发 IP 数据报的功能$kp$, content = $kp$在两个物理网络之间转发 IP 数据报（主机 A 到主机 B）：
若主机 B 在网络 2 中，主机 A 将 IP 数据报发送给路由器后，路由器通过查找转发表得知，由路由器直接发给 B；
若主机 B 不在网络 2 中，则主机 A 将 IP 数据报发给路由器后，路由器通过查找转发表得知，再将 IP 数据报转发给另一个路由器。$kp$, section = '' where id = 23120;
update t_knowledge_point set title = $kp$路由器设备与分类$kp$, content = $kp$路由器是连接两个或多个计算机网络的设备，它安装在两个或多个网络的交汇处。
路由器之间通过路由协议进行通信，能创建和维护各自的路由表，路由表存储了去往其他网络的最佳路径。
互联网中有两类路由器：
核心路由器（core router）：只负责与其他路由器之间（例如 ISP 的网络）传递数据；
边缘路由器（edge router）：将客户连接到 Internet。
大型核心路由器与无线网络路由器是两类常见设备形态。$kp$, section = '' where id = 23121;
update t_knowledge_point set title = $kp$网络互连设备一览$kp$, content = $kp$网卡：又称网络适配器或网络接口卡。
中继器：具有对信号放大、整形的功能。
集线器（Hub）：多端口中继器，共享带宽，工作在物理层。
网桥：连接两个同类型的网络（同构网络），工作在数据链路层。
交换机（Switch）：多端口网桥，属于数据链路层设备，用于连接相同类型的 LAN，独享带宽。
网关：连接不同网络、不同协议的网络。
路由器（Router）：连接不同的网络，是不同协议之间网络互连的设备，具有路径选择功能。$kp$, section = '' where id = 25307;
update t_knowledge_point set title = $kp$交换机的特点$kp$, content = $kp$交换机主要具有以下特点。
① 独享带宽。若一台端口速率为 100 Mbit/s 的交换机同时连接 N 台计算机，那么网络的总带宽为 N×100 Mbit/s。换言之，采用交换机组建的交换式以太网，其网络带宽不会因节点数量的增加而减少，网络性能也不会因负荷的增加而降低。
② 多对节点可并行通信。交换机允许自身连接的多对设备同时建立通信链路，进行数据交换。
③ 可灵活配置端口速率。交换机允许各节点按照自身需求灵活配置端口速率，且不仅支持某种速率的端口，还支持端口自适应配置。
④ 便于管理。交换机支持构造虚拟局域网（VLAN），以软件的方式通过逻辑工作组划分和管理网络中的设备。另外，交换机可与使用集线器搭建的网络兼容，在从共享式局域网过渡到交换式以太网时可替代集线器，实现网络的无缝连接。$kp$, section = '' where id = 25492;
update t_knowledge_point set title = $kp$交换机的工作原理$kp$, content = $kp$交换机在接收到数据时，会先检查数据中包含的 MAC 地址，再将数据从目的主机所在的端口转发出去。交换机之所以能实现这一功能，是因为交换机内存有一张 MAC 地址表，该表记录了网络中所有 MAC 地址与该交换机各端口的对应信息。当有数据帧需要通过该交换机进行转发时，交换机根据内部存储的 MAC 地址表获取目的设备所对应的端口，通过找到的端口转发数据。
假设图中的设备 PC2 向主机 PC3 发送一个数据帧，交换机接收到该数据帧后，会先查出目的 MAC 地址为 00-0B-2F-4B-60-57，然后查询 MAC 地址表，找到目的 MAC 地址连接的端口号 E0/5，将数据从端口 E0/5 转发出去。
MAC 地址表中的对应关系为：00-0B-2F-4B-60-26 对应端口 E0/1，00-0B-2F-4B-60-39 对应端口 E0/2，00-0B-2F-4B-60-57 对应端口 E0/5。$kp$, section = '' where id = 25493;
update t_knowledge_point set title = $kp$交换机与路由器的区别$kp$, content = $kp$交换机（又名交换式集线器）是一种用于电（光）信号转发的网络设备，它可以为接入交换机的任意两个网络节点提供独享的电信号通路，其作用可以理解为将一些机器连接起来组成一个局域网。
路由器与交换机有明显区别，它的作用在于连接不同的网段并且找到网络中数据传输最合适的路径。路由器产生于交换机之后，用以连接网络中各种不同设备，它会根据信道的情况自动选择和设定路由，以最佳路径按前后顺序发送信号。路由器主要克服了交换机不能路由转发数据包的不足。
路由器（Router）是连接因特网中各局域网、广域网的设备，它会根据信道的情况自动选择和设定路由，以最佳路径按前后顺序发送信号。$kp$, section = '' where id = 26768;
update t_knowledge_point set title = $kp$路由器至少有两个 IP 地址$kp$, content = $kp$路由器至少有两个 IP 地址。$kp$, section = '' where id = 27388;
update t_knowledge_point set title = $kp$路由器端口 IP 地址的网络号要求$kp$, content = $kp$当路由器某端口连接一个物理网络时，该端口的 IP 地址的网络号必须与所连接物理网络的网络号相同（如图 4-3）。$kp$, section = '' where id = 27389;
update t_knowledge_point set title = $kp$路由器用于连接异构网络$kp$, content = $kp$路由器用于连接异构网络。$kp$, section = '' where id = 28198;
update t_knowledge_point set title = $kp$路由器的基本功能$kp$, content = $kp$路由器的基本功能：选择路由、转发 IP 数据报、协议转换。$kp$, section = '' where id = 28199;
update t_knowledge_point set title = $kp$路由器的 IP 地址设置$kp$, content = $kp$路由器的 IP 地址设置：路由器某端口连接一个物理网络时，该端口分配一个 IP 地址，其网络号必须与所连接物理网络的网络号相同。$kp$, section = '' where id = 28200;
update t_knowledge_point set title = $kp$路由器至少有 2 个 IP 地址$kp$, content = $kp$路由器至少有 2 个 IP 地址。$kp$, section = '' where id = 28201;
update t_knowledge_point set title = $kp$交换机的两类端口$kp$, content = $kp$交换机有两类端口：低速端口用来连接计算机，高速端口则通过远程数字通信线路连接另一台交换机；每个端口既可输入也可输出。$kp$, section = '' where id = 28330;
update t_knowledge_point set title = $kp$路由器不负责可靠性$kp$, content = $kp$路由器不负责可靠性，只尽力而为地转发 IP 数据报，传输的可靠性由传输层的 TCP 协议保证。$kp$, section = '' where id = 28332;
update t_knowledge_point set title = $kp$网关是路由器面向网络一侧的 IP 地址$kp$, content = $kp$网关指的是面向网络的这一侧的路由器的 IP 地址。
若被访问的网页需要从数据库中获取信息，则需要使用动态网页。$kp$, section = '' where id = 28334;
update t_knowledge_point set title = $kp$路由器工作在网络互联层$kp$, content = $kp$路由器工作在网络互联层，尽力而为地传输 IP 包，不能保证正确性，正确性由传输层的 TCP 协议来保证。
路由器的 IP 地址设置：当路由器某端口连接一个物理网络时，该端口的 IP 地址，其网络号必须与所连接物理网络的网络号相同；该端口的 IP 地址同时也就是该子网的网关。$kp$, section = '' where id = 28342;
update t_knowledge_point set title = $kp$交换机利用缓冲机制解决冲突$kp$, content = $kp$交换机的转发端口有缓冲，交换机利用缓冲机制解决冲突。$kp$, section = '' where id = 28513;
update t_knowledge_point set title = $kp$路由器不负责可靠性$kp$, content = $kp$路由器不负责可靠性。
路由器工作在网络层（网络互联层），而不是物理层。$kp$, section = '' where id = 28536;
update t_knowledge_point set title = $kp$路由器至少连接两个异构网络$kp$, content = $kp$路由器至少连接两个异构网络，因此至少拥有两个 IP 地址。$kp$, section = '' where id = 28542;
update t_knowledge_point set title = $kp$网络互连设备$kp$, content = $kp$网络互连设备包括网卡、中继器（repeater）、集线器（hub）、路由器（router）、交换机等；需根据层次及性能要求选择适当的设备。$kp$, section = '' where id = 29205;
update t_knowledge_point set title = $kp$IP 数据报的组成与路由器$kp$, content = $kp$IP 数据报由头部和数据区组成：
1）头部：主要是为了确定在网络中进行数据传输的路由。
2）数据部分的长度可以改变，最大为 64KB。

路由器：
1）功能：连接异构网络，根据路由表转发 IP 数据报。
2）工作过程：路由选择、帧格式转换、IP 数据报的转发等。
3）每个路由器应分配 2 个或多个 IP 地址，路由器每个端口的 IP 地址必须与相连子网的 IP 地址具有相同的类型号和网络号。
4）路由器功能比普通分组交换机功能更强。$kp$, section = '' where id = 29215;
update t_knowledge_point set title = $kp$常见网络互连设备及其作用$kp$, content = $kp$网络互连设备有：
网卡（收发帧或数据报）；
中继器（最简单的网络互连设备，具有信号放大功能，可增加信号传输的距离）；
Hub（一种特殊的中继器，工作在局域网环境）；
Switch（典型的网桥，一般用于互连相同类型的 LAN，数据传输效率高）；
网桥（连接同构网络，可以是硬件设备也可以是软件产品）；
Router（连接异构网络，是不同协议之间网络互连的必要设备，具有路由选择功能）；
网关（实现不同协议网络之间的互连，一般是一种软件产品）。$kp$, section = '' where id = 29285;
update t_knowledge_point set title = $kp$连通帧格式不同的局域网应选用的设备$kp$, content = $kp$为了连通两个帧格式不相同的局域网，应选用的互连设备是：路由器（工作在网络层）或网关（工作在应用层）。$kp$, section = '' where id = 29309;
update t_knowledge_point set title = $kp$路由器的端口与 IP 地址$kp$, content = $kp$路由器有多个端口，每个端口可连接一个物理网络；但至少要给路由器分配两个 IP 地址。$kp$, section = '' where id = 29310;
update t_knowledge_point set title = $kp$常见网络设备及其特点$kp$, content = $kp$中继器：放大并转发信号，主要用于光纤中继。
集线器（HUB）：放大并转发信号，同时可以扩展网络，但不扩展网络带宽。
网桥：桥接两个同类但不同网段的网络，具备帧过滤功能。
交换机（Switch）：通过转发表实现数据帧传输，并且可以纠错，将有错误的数据帧重新发送。
路由器（Router）：连接异构网络，具备帧格式转换功能，可以将数据帧转为数据报，同时提供数据报转发服务和路由选择服务；路由器至少要配置两个或两个以上的 IP 地址。
考点：不同的网络其数据帧格式不相同。$kp$, section = '' where id = 29323;
update t_knowledge_point set title = $kp$交换机$kp$, content = $kp$交换机（Switch）可以为接入交换机的任意两个网络节点提供独享的电信号通路。常用的有计算机（电）交换机和光纤交换机。$kp$, section = '' where id = 29355;
update t_knowledge_point set title = $kp$路由器$kp$, content = $kp$路由器（Router）是连接两个或多个网络的硬件设备，在网络间起网关的作用，是读取每一个数据包中的地址然后决定如何传送的专用智能型网络设备。$kp$, section = '' where id = 29356;
update t_knowledge_point set title = $kp$交换机按目的 MAC 地址转发$kp$, content = $kp$MAC 帧中有发送方和接收方的 MAC 地址，交换机只看接收方的 MAC 地址（目的地址）。$kp$, section = '' where id = 29421;
update t_knowledge_point set title = $kp$路由器的功能$kp$, content = $kp$路由器的功能：实现 IP 包的存储和转发、MAC 帧格式的转换、路由选择。$kp$, section = '' where id = 29423;
update t_knowledge_point set title = $kp$路由器工作在网络互联层$kp$, content = $kp$路由器工作在网络互联层，尽力而为地传输 IP 包，不能保证正确性，正确性由传输层的 TCP 协议来保证。
路由器的 IP 地址设置：当路由器某端口连接一个物理网络时，该端口的 IP 地址，其网络号必须与所连接物理网络的网络号相同；该端口的 IP 地址同时也就是该子网的网关。$kp$, section = '' where id = 29440;
update t_knowledge_point set title = $kp$路由器与网桥的区别及异构网络互连$kp$, content = $kp$路由器：用于异构网络，解决数据包不兼容的中转格式问题。
网桥：连接两个同类型的网络。
网络互连的实质就是把相同或异构的局域网与局域网、局域网与广域网、广域网与广域网连接起来，实现这种连接起关键作用的设备是路由器。【2007 年真题】
异构网络的解决方案：统一采用 TCP/IP 协议，并使用互连设备路由器。
IP 数据报是中间格式，独立于其他网络，分为头部和数据区。
路由器的 IP 地址至少有 2 个；路由器的目的地是连接在路由器上的一个物理网络。$kp$, section = '' where id = 29474;
update t_knowledge_point set title = $kp$路由器是连接异构网络的关键设备$kp$, content = $kp$路由器是连接异构网络的关键设备，本质上也是一种分组交换机，可实现不同物理网络的无缝连接。$kp$, section = '' where id = 29497;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22724,22783,22798,22876,22961,23118,23119,23120,23121,25307,25492,25493,26768,27388,27389,28198,28199,28200,28201,28330,28332,28334,28342,28513,28536,28542,29205,29215,29285,29309,29310,29323,29355,29356,29421,29423,29440,29474,29497) and not deleted) <> 39 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
