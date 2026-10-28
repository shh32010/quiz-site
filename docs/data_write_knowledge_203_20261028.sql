-- 知识点 203 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_203
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_203 as
select * from t_knowledge_point where id in (23584,24253,24254,24261,24311,24382,26507,26508,26512,26513,26518,26874,26875,28456,30044);

update t_knowledge_point set title = $kp$Amazon 的 AWS$kp$, content = $kp$Amazon 的 AWS 包括弹性计算云 EC2（Elastic Compute Cloud）、简单存储服务 S3（Simple Storage Service）、SQS（Simple Queuing Service，简单消息队列服务）以及 SimpleDB，为企业提供计算和存储服务。收费的服务项目包括存储空间、带宽、CPU 资源以及月租费。

Amazon 平台的基础存储架构是 Dynamo。Dynamo 是一个完全分布式、无中心节点的存储系统，采用数据分布式存储架构。相比传统的集中式存储系统，Dynamo 在设计之初就被定位为一个高可靠、高可用且具有良好容错性的系统。它以简单的键/值（key-value）方式存储数据，因此并不支持复杂的查询，但这并不影响客户的使用；同时 Dynamo 不识别任何数据结构，使得它几乎可以处理所有的数据类型。

Amazon Simple Storage Service（S3）提供一个用于数据存储和获取的 Web 服务接口。数据可以是任何类型的，可以从 Internet 上的任何地方存储和访问数据。

Amazon EC2（Elastic Compute Cloud，可伸缩计算云）是一个 Web 服务，它让用户可以在几分钟内获得虚拟机，并根据需要轻松地扩展或收缩计算能力。

Amazon Simple Queue Service（SQS）允许访问 Amazon 提供的可靠的消息传递基础设施。可以使用简单的基于 REST 的 HTTP 请求在任何地方发送和接收消息。

Amazon SimpleDB（SDB）是一个用于存储、处理和查询结构化数据集的 Web 服务。它并不是传统意义上的关系数据库，而是一个高可用的模式（采用最终一致性数据模型），是云中的非结构化数据存储，可以使用它存储和获取包含键值的数据。$kp$, section = '' where id = 23584;
update t_knowledge_point set title = $kp$Microsoft Windows Azure$kp$, content = $kp$Microsoft Azure 是一组云技术的集合，每项技术为应用开发者提供一系列服务，Azure 既可用在云端，也可用在前端。

Microsoft Windows Azure 主机位于微软的数据中心，是一个基于 Internet 的云服务平台，提供操作系统和一系列开发服务，各种服务可自由组合。

Windows Azure 位于计算平台的最底层，是微软云计算技术的核心，是微软云计算操作系统。它提供了基于 Windows 的环境，用来在微软数据中心的服务器上运行应用和存储数据。

Microsoft .NET 服务为云端和本地的应用程序提供常用的基础功能模块，主要包括三种服务：访问控制服务、服务总线服务和工作流服务。SQL Azure 主要用于基于 SQL Server 在云中提供数据服务。Live 服务用于将 Windows Live 集成到 Windows Azure 上。Windows Azure Platform AppFabric 用于为运行在云端的应用提供连接。

Microsoft Azure 目前提供了三种主要的数据存储结构，即 Blob 类型、Table 类型和 Queue 类型。Blob 类型存储二进制数据，可以存储大型的无结构数据，容量巨大；Table 类型能够提供更加结构化的数据存储；Queue 类型用来支持 Microsoft Azure 应用程序组件之间的通信，与 Microsoft 消息队列的作用相近。$kp$, section = '' where id = 24253;
update t_knowledge_point set title = $kp$中国移动云$kp$, content = $kp$中国移动云提供云主机、云主机备份、云存储、弹性块存储、弹性公网 IP、带宽出租、云防火墙、云监控八项 IaaS 业务，以及应用托管、能力开放等 PaaS 业务，涵盖了 IT 系统建设必需的计算资源、存储资源、网络资源、安全资源和能力资源。$kp$, section = '' where id = 24254;
update t_knowledge_point set title = $kp$Amazon EC2 弹性计算云$kp$, content = $kp$亚马逊弹性计算云（EC2，Elastic Compute Cloud）是一个让使用者可以租用云端电脑运行所需应用的系统。EC2 借由提供 Web 服务的方式，让使用者可以弹性地运行自己的 Amazon 机器映像档，使用者可以在这个虚拟机器上运行任何自己想要的软件或应用程序，从而获得可调整的云计算能力。它旨在使开发者的网络规模计算变得更为容易。

Amazon S3 提供云存储服务，用于存储海量数据。$kp$, section = '' where id = 24261;
update t_knowledge_point set title = $kp$Google 的云计算$kp$, content = $kp$Google 云计算技术具体包括 Google 文件系统（GFS）、分布式计算编程模型（MapReduce）、分布式锁服务（Chubby）和分布式结构化数据表（BigTable）等。其中，GFS 提供了海量数据存储和访问的能力，MapReduce 使得海量信息的并行处理变得简单易行，Chubby 保证了分布式环境下并发操作的同步，BigTable 使得海量数据的管理和组织十分方便。

Google 文件系统（Google File System，GFS）是一个大型的分布式文件系统，位于所有核心技术的底层。GFS 将整个系统的节点分为三类：Client（客户端）、Master（主服务器）和 Chunk Server（数据块服务器）。

MapReduce 最早是由 Google 公司提出的一种面向大规模数据处理的并行计算模型和方法。Google 公司设计 MapReduce 的初衷主要是解决其搜索引擎中大规模网页数据的并行化处理问题。到 2018 年底，Google 公司已有上万个算法问题和程序使用 MapReduce 进行处理。

Chubby 是 Google 设计的提供粗粒度锁服务的一个文件系统，它基于松耦合分布式系统，解决了分布式一致性问题。Chubby 系统本质上是一个分布式的、存储大量小文件的文件系统，它所有的操作都是在文件的基础上完成的，其文件系统与 UNIX 类似。

BigTable 是一个分布式多维映射表，表中数据通过一个行关键字、一个列关键字和一个时间戳进行索引。$kp$, section = '' where id = 24311;
update t_knowledge_point set title = $kp$百度云$kp$, content = $kp$百度云已广泛应用在人们生活的各个方面，百度搜索、百度贴吧、百度云盘、百度知道、百度文库等产品大家最熟悉不过了，此外还有百度精算、百度基础设施服务和平台服务等。用户可以登录 cloud.baidu.com 尝试使用百度云服务。$kp$, section = '' where id = 24382;
update t_knowledge_point set title = $kp$AWS 的开发者服务$kp$, content = $kp$AWS 面向开发者提供的工具包、SDK、文档、社区和技术支持等服务也比较多，相对于 Google App Engine 和微软 Azure 要丰富不少，主要有：

- Java、PHP、Python、Ruby、Android、iOS、Windows .NET 共 7 大平台功能丰富的 SDK；
- Eclipse 和 Visual Studio 插件，包含应用模板、应用部署与调试等功能；
- 比较齐备的开发文档、教程、教学视频及丰富的范例；
- 比较活跃的开发者论坛，以及按月付费的一对一技术支持服务。

根据其页面介绍，AWS 已经为全球 190 个国家/地区内成百上千家企业提供了支持，是世界上最大的公有云平台服务提供商。$kp$, section = '' where id = 26507;
update t_knowledge_point set title = $kp$Google 云计算$kp$, content = $kp$Google 在硬件条件上的优势、大型数据中心和搜索引擎的支柱应用，促进了 Google 云计算的迅速发展。Google 的云计算主要由 MapReduce、Google 文件系统（GFS）、BigTable 组成，它们是 Google 内部云计算基础平台的三个主要部分。Google 还构建了其他云计算组件，包括一种领域描述语言以及分布式锁服务机制等。Sawzall 是一种建立在 MapReduce 基础上的领域语言，专门用于大规模的信息处理。Chubby 是一个高可用、分布式的数据锁服务，当有机器失效时，Chubby 使用 Paxos 算法来保证备份的一致性。$kp$, section = '' where id = 26508;
update t_knowledge_point set title = $kp$阿里云$kp$, content = $kp$阿里云（AliCloud）创立于 2009 年，是中国最大的云计算平台，是阿里巴巴集团旗下的云计算品牌，也是全球领先的云计算技术和服务提供商。至 2016 年，阿里云在中国公有云市场上占据绝对主导地位，市场份额是 AWS、Azure、腾讯云、百度云、华为云等市场追随者的总和。阿里巴巴正在搅动传统企业级 IT 市场，在中国市场上急速成长为 IT 巨头，同 Amazon、Microsoft 并称“3A”（AWS、AliCloud、Azure）。

阿里云服务于制造、金融、政务、交通、医疗、电信和能源等众多领域的领军企业，客户包括中国联通、12306、中石化、中石油、飞利浦和华大基因等大型企业，以及微博、知乎、锤子科技等明星互联网公司。在天猫“双 11”全球狂欢节、12306 春运购票等极富挑战的应用领域中，阿里云保持着良好的运行记录。

阿里云提供弹性计算、数据库、存储、大数据、网络和安全等丰富的产品和服务，其网站展示了各类产品及服务。$kp$, section = '' where id = 26512;
update t_knowledge_point set title = $kp$华为云$kp$, content = $kp$华为云成立于 2005 年，隶属于华为公司，专注于云计算中公有云领域的技术研究与生态拓展，致力于为用户提供一站式云计算基础设施服务。

华为云立足于互联网领域，提供包括云主机、云托管、云存储等基础云服务，以及超算、内容分发与加速、视频托管与发布、企业 IT、云电脑、云会议、游戏托管、应用托管等服务和解决方案。华为云通过基于浏览器的云管理平台，以互联网线上自助服务的方式，为用户提供云计算 IT 基础设施服务。云计算的最大优势在于 IT 基础设施资源能够随用户业务的实际变化而弹性伸缩，用户需要多少资源就用多少资源，这种弹性计算的能力和按需计费的方式能有效帮助用户降低运维成本。$kp$, section = '' where id = 26513;
update t_knowledge_point set title = $kp$腾讯云$kp$, content = $kp$腾讯公司成立于 1998 年，第一个产品 QQ 就是一朵云。从 PC 时代第一版的 QQ 到现在，腾讯云一直在积极探索：从解决如何稳定服务、让用户的 QQ 不掉线，到解决如何满足用户越来越丰富的需求——更多的社交、更好玩的娱乐、更丰富的在线生活，再到如何开放、如何实现一个中国最大互联网生态平台的价值。

多年来，腾讯云基于 QQ、QQ 空间、微信、腾讯游戏等真正海量业务的技术锤炼，从基础架构到精细化运营，从平台实力到生态能力建设，将之整合并面向市场，为企业和创业者提供集云计算、云数据、云运营于一体的云端服务体验。

2013 年 9 月以来，腾讯云已全面开放，所有用户都有机会使用腾讯的云服务。其产品包括云服务器、云数据库、CDN、云安全、万象图片和云点播等。$kp$, section = '' where id = 26518;
update t_knowledge_point set title = $kp$阿里云与国外云服务平台的对比$kp$, content = $kp$阿里云拥有诸如虚拟主机、存储和虚拟网络等核心产品，但相比国外的云服务公司，其他产品线有待进一步完善。不过，阿里云的出口带宽和稳定性在国内的云服务公司中还是相当不错的。

另外，阿里云以一个数据中心的平面示意图来标注各个产品的作用和关系（见图 5），从而使用户能轻松理解并购买适合自己需求的云服务，而亚马逊的产品介绍则做得不够人性化。$kp$, section = '' where id = 26874;
update t_knowledge_point set title = $kp$华为云及亚马逊、谷歌的云服务产品线$kp$, content = $kp$华为云服务产品线如图 6 所示。

亚马逊刚开始是做电商的，购买了一批服务器搭建电商平台，由于服务器具备富余的计算资源，于是考虑对外出租这些资源，从此开展了云计算业务并越做越大。现在，亚马逊是世界上最大的云计算服务公司，产品线丰富，具体包括如图 1 所示的云服务。

谷歌公司的云计算服务产品线虽然没有亚马逊公司丰富，但也有其特色，如翻译、大数据、BigTable 等，如图 2 所示。$kp$, section = '' where id = 26875;
update t_knowledge_point set title = $kp$国内外主流云服务提供平台$kp$, content = $kp$国内外主流云服务提供平台包括 AWS、Google、阿里云、华为云、腾讯云等。$kp$, section = '' where id = 28456;
update t_knowledge_point set title = $kp$国内外主流云服务提供平台概述$kp$, content = $kp$AWS、Google、阿里云、华为云、腾讯云等平台构成了国内外主流的云服务提供阵营。$kp$, section = '' where id = 30044;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (23584,24253,24254,24261,24311,24382,26507,26508,26512,26513,26518,26874,26875,28456,30044) and not deleted) <> 15 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
