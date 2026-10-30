-- 知识点 182 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_182
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_182 as
select * from t_knowledge_point where id in (22776,23942,24213,24224,24230,24248,26095,26096,26199,26434,26435,26439,26440,26853,27040,27041,27042,28440,28441,28443,28469);

update t_knowledge_point set title = $kp$5G基本特点与关键技术$kp$, content = $kp$5G的主要特点：高速率、泛在网、低功耗、低时延。

5G的关键技术：超密集异构网络、网络的自组织、网络切片、内容分发网络、设备到设备通信、边缘计算、软件定义网络和网络虚拟化。$kp$, section = '' where id = 22776;
update t_knowledge_point set title = $kp$前几代通信技术$kp$, content = $kp$该条目原文仅有图表占位内容，无有效文字信息，无法还原具体内容。$kp$, section = '' where id = 23942;
update t_knowledge_point set title = $kp$5G的容量、标准版本与使用频段$kp$, content = $kp$5G的容量是4G的1000倍，峰值速率10Gbps~20Gbps；4G为100Mb/s，5G比4G快达100倍。5G发展的主要驱动力是移动互联网和物联网。

5G标准方面，2017年R15版本协议主要聚焦增强型移动宽带eMBB业务场景；2020年R16（第二版规范）对大规模物联网mMTC、高可靠低时延通信uRLLC（超可靠低延迟通信）业务场景的技术标准进行了定义。

5G使用FR1：450MHz~6000MHz（Sub-6GHz）为低频频段，是主要使用频段；FR2为毫米波高频频段，24250MHz~52600MHz范围属于扩展频段。$kp$, section = '' where id = 24213;
update t_knowledge_point set title = $kp$LTE关键技术与5G概述$kp$, content = $kp$LTE关键技术：载波聚合技术、多点协作传输技术、无线中继技术、上/下行多天线增强技术。

5G概述：5G称为IMT-2020，即第五代移动通信标准，目前已进入全面研发测试与标准化阶段。$kp$, section = '' where id = 24224;
update t_knowledge_point set title = $kp$ITU定义的5G三大应用场景$kp$, content = $kp$国际电信联盟（ITU）定义了5G的三大类应用场景：

- eMBB：3D/超高清视频等大流量移动宽带业务。
- mMTC：大规模物联网业务。
- URLLC：无人驾驶、工业自动化等需要低时延、高可靠连接的业务。$kp$, section = '' where id = 24230;
update t_knowledge_point set title = $kp$第五代移动通信系统（5G）$kp$, content = $kp$5G是4G网络的真正升级版：

- 下行峰值速率可达10Gb/s，能以1Gb/s的速率支持数以千万计的用户同时工作。
- 频谱效率比4G显著增强，覆盖率比4G提高，延迟时间显著低于4G。
- 2018年美国、中国、日本和韩国开始试验组网。
- 媒体宣传热度高，运营商和设备制造商不断宣传造势。$kp$, section = '' where id = 24248;
update t_knowledge_point set title = $kp$Massive MIMO（大规模天线）$kp$, content = $kp$①4G基站只有十几根天线，而5G基站可以支持上百根天线。
②这些天线通过Massive MIMO技术形成大规模天线阵列，可以同时向更多的用户发送和接收信号，从而将移动网络的容量提升数十倍甚至更大。$kp$, section = '' where id = 26095;
update t_knowledge_point set title = $kp$波束成形$kp$, content = $kp$①Massive MIMO技术为5G大幅增加容量的同时，其多天线的特点也势必会带来更多干扰，波束成形是解决这一问题的关键。
②通过有效控制这些天线，使其发出的电磁波在空间上互相抵消或增强，可形成一个很窄的波束，从而使有限的能量集中在特定方向上传输，不仅传输距离更远，而且避免了信号干扰。
③波束成形还可以提升频谱利用率，通过该技术可同时从多个天线传输更多的信息。
④波束成形可以解决毫米波信号被障碍物阻挡、远距离衰减的问题。$kp$, section = '' where id = 26096;
update t_knowledge_point set title = $kp$小基站$kp$, content = $kp$①毫米波技术的缺陷是穿透力差、衰减大，因此要让毫米波频段下的5G通信在高楼林立的环境中传输并不容易，小基站可解决这一问题。
②毫米波频率很高、波长很短，意味着天线尺寸可以做得很小，这是部署小基站的基础。
③小基站单个规模小于宏基站，功耗也大为降低，但所需基站数目比4G多。$kp$, section = '' where id = 26199;
update t_knowledge_point set title = $kp$高频段传输$kp$, content = $kp$移动通信传统工作频段主要集中在3GHz以下，频谱资源十分拥挤；而高频段（如毫米波、厘米波频段）可用频谱资源丰富，能够有效缓解频谱资源紧张的现状，可实现极高速短距离通信，支持5G在容量和传输速率等方面的需求。

高频段在移动通信中的应用是未来的发展趋势，业界对此高度关注。足够量的可用带宽、小型化的天线和设备、较高的天线增益是高频段毫米波移动通信的主要优点，但也存在传输距离短、穿透和绕射能力差、容易受气候环境影响等缺点，射频器件、系统设计等方面的问题也有待进一步研究和解决。$kp$, section = '' where id = 26434;
update t_knowledge_point set title = $kp$新型多天线传输$kp$, content = $kp$多天线技术经历了从无源到有源、从二维（2D）到三维（3D）、从高阶MIMO到大规模阵列的发展，有望实现频谱效率提升数十倍甚至更高，是目前5G技术重要的研究方向之一。

由于引入了有源天线阵列，基站侧可支持的协作天线数量将达到128根。此外，原来的2D天线阵列拓展成为3D天线阵列，形成新颖的3D-MIMO技术，支持多用户波束智能赋型，减少用户间干扰；结合高频段毫米波技术，将进一步改善无线信号覆盖性能。$kp$, section = '' where id = 26435;
update t_knowledge_point set title = $kp$新型网络架构$kp$, content = $kp$目前LTE接入网采用网络扁平化架构，减小了系统时延，降低了建网成本和维护成本。未来5G可能采用C-RAN（云接入网）接入网架构。

C-RAN是基于集中化处理、协作式无线电和实时云计算构架的绿色无线接入网构架。其基本思想是通过充分利用低成本高速光传输网络，直接在远端天线和集中化的中心节点间传送无线信号，以构建覆盖上百个基站服务区域、甚至上百平方公里的无线接入系统。

C-RAN架构适于采用协同技术，能够减小干扰、降低功耗、提升频谱效率，同时便于实现动态使用的智能化组网；集中处理有利于降低成本、便于维护、减少运营支出。$kp$, section = '' where id = 26439;
update t_knowledge_point set title = $kp$5G主要优势及应用场景$kp$, content = $kp$作为新一代信息通信发展的主要方向，5G将渗透到未来社会的各个领域，以用户为中心构建全方位的信息生态系统。面向2020年及未来，5G将解决多样化应用场景下差异化性能指标带来的挑战，不同应用场景面临的性能挑战有所不同，用户体验速率、流量密度、时延、能效和连接数都可能成为不同场景的挑战性指标。从移动互联网和物联网的主要应用场景、业务需求及挑战出发，5G技术主要应用场景可归纳为（也即主要优势）：连续广域覆盖、热点高容量、低功耗大连接和低时延高可靠四个主要技术场景。

- 连续广域覆盖场景：移动通信最基本的覆盖方式，以保证用户的移动性和业务连续性为目标，为用户提供无缝的高速业务体验。主要挑战在于随时随地（包括小区边缘、高速移动等恶劣环境）为用户提供100Mbps以上的用户体验速率。
- 热点高容量场景：主要面向局部热点区域，为用户提供极高的数据传输速率，满足网络极高的流量密度需求。1Gbps用户体验速率、几十Gbps峰值速率和几十Tbps/km²的流量密度需求是该场景面临的主要挑战。
- 低功耗大连接场景：主要面向智慧城市、环境监测、智能农业、森林防火等以传感和数据采集为目标的应用场景，具有小数据包、低功耗、海量连接等特点。这类终端分布范围广、数量众多，不仅要求网络具备超千亿连接的支持能力，满足每平方米100万个连接数密度指标要求，而且还要保证终端的超低功耗和超低成本。
- 低时延高可靠场景：主要面向车联网、工业控制等垂直行业的特殊应用需求，这类应用对时延和可靠性具有极高的指标要求，需要为用户提供毫秒级的端到端时延和接近100%的业务可靠性保证。$kp$, section = '' where id = 26440;
update t_knowledge_point set title = $kp$5G关键技术和主要优势$kp$, content = $kp$5G的关键技术包括：基于OFDM优化的波形和多址接入、实现可扩展的OFDM间隔参数配置、OFDM加窗提高多路传输效率、灵活的框架设计、超密集异构网络、网络的自组织、网络切片、内容分发网络、设备到设备通信、边缘计算、软件定义网络和网络虚拟化。

主要优势：高速率、泛在网、低能耗、低时延、万物互联、重构安全。$kp$, section = '' where id = 26853;
update t_knowledge_point set title = $kp$连接密度$kp$, content = $kp$定义：单位面积内满足特定QoS的最大连接终端数量，单位为设备/km²。这里的QoS指终端能在99%的可靠性下10s内成功收到32字节的数据包。
使用场景：mMTC。
指标：连接密度大于1000000设备/km²。$kp$, section = '' where id = 27040;
update t_knowledge_point set title = $kp$能效$kp$, content = $kp$定义：数据传输的效率，以及无数据传输时尽量小的能量消耗。
使用场景：eMBB。
指标：终端应支持高休眠率以及长休眠时间。$kp$, section = '' where id = 27041;
update t_knowledge_point set title = $kp$区域吞吐量$kp$, content = $kp$定义：单位面积能够达到的用户业务速率，单位为bit/s/m²。
使用场景：eMBB。
指标：室内区域吞吐量大于10Mbit/s/m²。$kp$, section = '' where id = 27042;
update t_knowledge_point set title = $kp$5G技术的主要特点$kp$, content = $kp$5G技术的特点包括毫米波、高速率、低时延、大连接（原文“纳米波”为“毫米波”之误）。$kp$, section = '' where id = 28440;
update t_knowledge_point set title = $kp$5G基站与覆盖范围$kp$, content = $kp$5G通信采用微基站（小基站）组网，单站覆盖范围更小、部署数量更多，以提升容量和速率，并非覆盖范围更大。$kp$, section = '' where id = 28441;
update t_knowledge_point set title = $kp$5G的三大应用场景$kp$, content = $kp$5G的三大应用场景指eMBB（增强移动宽带）、mMTC（海量机器类通信）、URLLC（超可靠低时延通信）。$kp$, section = '' where id = 28443;
update t_knowledge_point set title = $kp$波束赋形的适用端$kp$, content = $kp$波束赋形既可用于信号发射端，也可用于信号接收端。$kp$, section = '' where id = 28469;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22776,23942,24213,24224,24230,24248,26095,26096,26199,26434,26435,26439,26440,26853,27040,27041,27042,28440,28441,28443,28469) and not deleted) <> 21 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
