-- 知识点 209 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_209
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_209 as
select * from t_knowledge_point where id in (22262,23614,24280,24295,24297,24303,24312,24316,24318,24321,24322,24323,24325,24326,24329,24330,24331,24332,24334,24343,24345,24346,24349,24366,24367,24371,26113,26337,26480,26490,26510,26534,26535,26536,26537,26538,26539,26574,26867,26883,26884,27103,28461,28466,28467,29589,30055,30056,30057,30058,30059,30061,30063);

update t_knowledge_point set title = $kp$Mahout 机器学习算法库$kp$, content = $kp$Apache Mahout 是一个由 Java 语言实现的开源、可扩展的机器学习算法库。Mahout 将机器学习算法构建于 MapReduce 并行计算模型之上，并将算法的输入、输出和中间结果构建于 HDFS 分布式文件系统之上，使其具有高吞吐、高并发、高可靠的特点，适合大规模数据的机器学习。$kp$, section = '' where id = 22262;
update t_knowledge_point set title = $kp$数据存储与管理$kp$, content = $kp$利用分布式文件系统、数据仓库、关系数据库、NoSQL 数据库、云数据库等，实现对结构化、半结构化和非结构化海量数据的存储和管理。$kp$, section = '' where id = 23614;
update t_knowledge_point set title = $kp$谷歌大数据技术的开源实现与虚拟化$kp$, content = $kp$谷歌提出的技术（左）与 Apache 开源实现（右）的对应关系：中间件 Chubby 对应 Zookeeper，分布式文件系统 GFS 对应 HDFS，结构化数据库 BigTable 对应按列存储的非结构化数据库 HBase，谷歌并行计算 MapReduce 对应 Hadoop 的 MapReduce 模型。

虚拟化之前，IT 资源相互独立，操作系统必须与硬件紧耦合。常见虚拟化软件：Xen（基于硬件）和 KVM 是开源免费的虚拟化软件，VMware 是付费的虚拟化软件，Hyper-V 是微软系统附带的虚拟化组件，Citrix 用于桌面虚拟化。

虚拟化的特点：1. 分区，在单一物理服务器上同时运行多个虚拟机；2. 隔离，同一服务器上的多个虚拟机之间相互隔离；3. 封装，整个虚拟机执行环境封装在独立文件中，可以通过移动文件的方式迁移虚拟机；4. 相对于硬件独立，虚拟机无需修改即可在任何服务器上运行。

IT 环境按逻辑分层，包括应用软件层、数据信息层，并对应 IaaS、PaaS、SaaS 三种服务模式。$kp$, section = '' where id = 24280;
update t_knowledge_point set title = $kp$MapReduce 并行计算框架$kp$, content = $kp$MapReduce 并行计算框架是一个并行化程序执行系统。它提供了包含 Map 和 Reduce 两阶段的并行处理模型和过程，提供并行化编程模型和接口，让程序员可以方便快速地编写出大数据并行处理程序。MapReduce 以键值对方式输入和处理数据，并能自动完成数据的划分和调度管理。程序执行时，MapReduce 框架负责调度和分配计算资源，划分和输入输出数据，调度并监控程序的执行状态，还负责各计算节点的同步以及中间结果的收集整理。该框架提供了一组完整的、供程序员开发 MapReduce 应用程序的编程接口。$kp$, section = '' where id = 24295;
update t_knowledge_point set title = $kp$数据查询分析计算系统$kp$, content = $kp$大数据时代，数据查询分析计算系统需要具备对大规模数据进行实时或准实时查询的能力，数据规模的增长已经超出了传统关系型数据库的承载和处理能力。目前主要的数据查询分析计算系统包括 HBase、Hive、Cassandra、Dremel、Shark、Hana 等。$kp$, section = '' where id = 24297;
update t_knowledge_point set title = $kp$分布式文件系统 HDFS$kp$, content = $kp$HDFS（Hadoop Distributed File System）是一个类似于 Google GFS 的开源分布式文件系统。它提供了可扩展、高可靠、高可用的大规模数据分布式存储管理系统，基于物理上分布在各个数据存储节点的本地 Linux 文件系统，为上层应用程序提供一个逻辑上成为整体的大规模数据存储文件系统。与 GFS 类似，HDFS 采用多副本（默认为 3 个副本）数据冗余存储机制，并提供了有效的数据出错检测和数据恢复机制，大大提高了数据存储的可靠性。用户写入文件时，HDFS 将数据分布存储到服务器 A、B、C、D 等多个节点上。$kp$, section = '' where id = 24303;
update t_knowledge_point set title = $kp$分布式数据库管理系统 HBase$kp$, content = $kp$为了克服 HDFS 难以管理结构化/半结构化海量数据的缺点，Hadoop 提供了一个大规模分布式数据库管理和查询系统 HBase。HBase 是建立在 HDFS 之上的分布式数据库，是一个分布式可扩展的 NoSQL 数据库，提供了对结构化、半结构化甚至非结构化大数据的实时读写和随机访问能力。HBase 提供基于行、列和时间戳的三维数据管理模型，每张表的记录数（行数）可以多达几十亿条甚至更多，每条记录可以拥有多达上百万个字段。

HBase 与 BigTable 的底层技术对应关系：

| 功能 | BigTable | HBase |
| --- | --- | --- |
| 文件存储系统 | GFS | HDFS |
| 海量数据处理 | MapReduce | Hadoop MapReduce |
| 协同服务管理 | Chubby | Zookeeper |$kp$, section = '' where id = 24312;
update t_knowledge_point set title = $kp$流式计算系统$kp$, content = $kp$流式计算具有很强的实时性，需要对应用源源不断产生的数据实时进行处理，使数据不积压、不丢失，常用于处理电信、电力等行业应用以及互联网行业的访问日志等。Facebook 的 Scribe、Apache 的 Flume、Twitter 的 Storm、Yahoo 的 S4、UC Berkeley 的 Spark Streaming 是常用的流式计算系统。$kp$, section = '' where id = 24316;
update t_knowledge_point set title = $kp$分布式数据仓库工具 Hive$kp$, content = $kp$Hive 是一个建立在 Hadoop 之上的数据仓库，用于管理存储于 HDFS 或 HBase 中的结构化/半结构化数据。$kp$, section = '' where id = 24318;
update t_knowledge_point set title = $kp$迭代计算系统$kp$, content = $kp$针对 MapReduce 不支持迭代计算的缺陷，人们对 Hadoop 的 MapReduce 进行了大量改进，HaLoop、iMapReduce、Twister、Spark 是典型的迭代计算系统。$kp$, section = '' where id = 24321;
update t_knowledge_point set title = $kp$数据流处理工具 Pig$kp$, content = $kp$Pig 是一个用来处理大规模数据集的平台，由 Yahoo! 贡献给 Apache 成为开源项目。$kp$, section = '' where id = 24322;
update t_knowledge_point set title = $kp$Hadoop 的核心设计$kp$, content = $kp$Hadoop 是一个开源的可运行于大规模集群上的分布式并行编程框架，其最核心的设计包括 HDFS 和 MapReduce。$kp$, section = '' where id = 24323;
update t_knowledge_point set title = $kp$GFS 与 HDFS 两种分布式存储系统$kp$, content = $kp$在当前的云计算领域，Google 的 GFS 和 Hadoop 开发的开源系统 HDFS 是比较流行的两种云计算分布式存储系统。

GFS 由 Google 设计并实现，是一个可扩展的分布式文件系统，适用于大型分布式计算密集型应用程序，能满足大量用户的需求，并行地为大量用户提供服务，使云计算的数据存储技术具有高吞吐率和高传输率的特点。

Hadoop 是 Apache 旗下的一个用 Java 语言实现的开源软件框架，是一个开发和运行处理大规模数据的软件平台，允许使用简单的编程模型在大量计算机集群上对大型数据集进行分布式处理。$kp$, section = '' where id = 24325;
update t_knowledge_point set title = $kp$MapReduce 编程模型$kp$, content = $kp$MapReduce 是 Hadoop 核心技术之一。MapReduce 是一种编程模型，用于大规模数据集（大于 1TB）的并行运算。$kp$, section = '' where id = 24326;
update t_knowledge_point set title = $kp$Hadoop 体系架构$kp$, content = $kp$| 组件 | 说明 |
| --- | --- |
| HDFS | Hadoop 分布式文件系统，被设计成适合运行在通用硬件（commodity hardware）上的分布式文件系统。它是一个高度容错性的系统，适合部署在廉价的机器上，能提供高吞吐量的数据访问，非常适合大规模数据集上的应用。 |
| MapReduce | 一种编程模型，是面向大数据并行处理的计算模型、框架和平台，隐含三层含义：1）基于集群的高性能并行计算平台（Cluster Infrastructure）；2）并行计算与运行软件框架（Software Framework）；3）并行程序设计模型与方法（Programming Model & Methodology）。 |
| 其他 | HBase：类似 Google BigTable 的分布式 NoSQL 列数据库；Hive：基于 Hadoop 的数据仓库工具，可以将结构化的数据文件映射为一张数据库表，提供完整的 SQL 查询功能，并可将 SQL 语句转换为 MapReduce 任务运行；Zookeeper：分布式锁，提供类似 Google Chubby 的功能。 |$kp$, section = '' where id = 24329;
update t_knowledge_point set title = $kp$Hadoop 与 Spark 的特点$kp$, content = $kp$Hadoop：目前大数据处理最主流的平台，是 Apache 基金会的开源软件项目，使用 Java 语言开发实现。Hadoop 平台使开发人员无需了解底层的分布式细节，即可开发出分布式程序，在集群中对大数据进行存储、分析。

Spark：由加州伯克利大学 AMP 实验室开发，适合用于机器学习、数据挖掘等迭代运算较多的计算任务。Spark 引入了内存计算的概念，运行时服务器可以将中间数据存储在 RAM 内存中，大大加速数据分析结果的返回速度，可用于需要交互分析的场景。$kp$, section = '' where id = 24330;
update t_knowledge_point set title = $kp$Hadoop 的特性$kp$, content = $kp$高可靠性：采用冗余数据存储方式。

高效性：作为并行分布式计算平台，Hadoop 采用分布式存储和分布式处理两大核心技术，能够高效地处理 PB 级数据。

高可扩展性：可以扩展到数以千计的计算机节点上。

高容错性：能够自动将失败的任务重新分配。

成本低：采用廉价的计算机集群，普通用户也容易搭建 Hadoop 运行环境。

运行在 Linux 平台上：基于 Java 语言开发。

支持多种编程语言：Hadoop 上的应用程序也可以使用其他语言编写，如 C++。$kp$, section = '' where id = 24331;
update t_knowledge_point set title = $kp$Spark 与 Hadoop 的对比$kp$, content = $kp$Hadoop 虽然已成为大数据技术的事实标准，但本身还存在诸多缺陷，最主要的缺陷是 MapReduce 计算模型延迟过高，无法胜任实时、快速计算的需求，因而只适用于离线批处理的应用场景。

Spark 最大的特点是将计算数据、中间结果都存储在内存中，大大减少了 I/O 开销，因而更适合迭代运算比较多的数据挖掘与机器学习运算。

尽管 Spark 相对于 Hadoop 具有较大优势，但并不能完全替代 Hadoop，主要用于替代 Hadoop 中的 MapReduce 计算模型。$kp$, section = '' where id = 24332;
update t_knowledge_point set title = $kp$主要的大数据计算模式$kp$, content = $kp$大数据计算模式，是指根据大数据的不同数据特征和计算特征，从多样性的大数据计算问题和需求中提炼并建立的各种高层抽象和模型。$kp$, section = '' where id = 24334;
update t_knowledge_point set title = $kp$大数据处理架构 Hadoop$kp$, content = $kp$HDFS：Hadoop 分布式文件系统。

HBase：分布式的列式数据库。

MapReduce：用于大数据并行计算。

Hive：数据仓库工具。

Mahout：机器学习经典算法的实现。

Pig：大数据查询工具，可以用来查询大型半结构化数据集。

Flume：海量日志采集系统。

MapReduce 是一种并行编程模型，用于大规模数据集（大于 1TB）的并行运算，它将复杂的、运行于大规模集群上的并行计算过程高度抽象为两个函数：Map 和 Reduce。MapReduce 极大地方便了分布式编程工作，编程人员在不会分布式并行编程的情况下，也可以很容易地将自己的程序运行在分布式系统上，完成海量数据集的计算。

Spark 是一个可应用于大规模数据处理的快速、通用引擎，最初的设计目标是使数据分析更快——不仅运行速度快，也要能快速、容易地编写程序。为了使程序运行更快，Spark 提供了内存计算，减少了迭代计算时的 I/O 开销；为了使编写程序更为容易，Spark 使用简练优雅的 Scala 语言编写，基于 Scala 提供了交互式的编程体验。

虽然 Hadoop 已成为大数据的事实标准，但是 MapReduce 分布式计算模型仍存在诸多缺陷，而 Spark 不仅具备了 Hadoop MapReduce 的优点，而且解决了其缺陷。$kp$, section = '' where id = 24343;
update t_knowledge_point set title = $kp$数据管理的三个阶段$kp$, content = $kp$人工管理阶段：应用程序与数据集一一对应，程序 1 对应数据集 1，程序 2 对应数据集 2，程序 n 对应数据集 n，程序与数据之间缺乏独立性。

文件系统阶段：多个应用程序通过统一的存取方法访问文件 1、文件 2 直至文件 n，数据由文件系统管理。

数据库系统阶段：应用程序 A、B 直至应用程序 n 通过数据库管理系统访问数据库，实现数据的统一管理和共享。$kp$, section = '' where id = 24345;
update t_knowledge_point set title = $kp$大数据存储技术$kp$, content = $kp$大数据的出现，必将颠覆传统的数据管理方式，在数据来源、数据处理方式和数据思维等方面都会带来革命性的变化。必须清楚的是，从数据库（DB）到大数据（BD），不仅仅是规模的变大：随着互联网、云计算、移动互联网和物联网的迅猛发展，无所不在的移动设备、RFID、无线传感器每分每秒都在产生数据，数以亿计用户的互联网服务时时刻刻都在产生巨量的交互，要处理的数据量太大、增长太快，而业务需求和竞争压力对数据处理的实时性、有效性又提出了更高要求，传统的常规技术手段根本无法应付。在这种情况下，技术人员纷纷研发和采用了一批新技术，主要包括分布式文件系统、分布式数据库、云数据库等大数据存储方案。$kp$, section = '' where id = 24346;
update t_knowledge_point set title = $kp$大数据生态体系的分层结构$kp$, content = $kp$自下而上分为：数据来源层，包括数据库（结构化数据）、文件日志（半结构化数据）、音视频等（非结构化数据）；数据传输层，包括 Sqoop 数据转换、Flume 日志收集等；数据存储层，包括 HDFS 文件存储（核心）、HBase 非关系型数据库；资源管理层，由 YARN 负责资源管理；数据计算层，包括 MapReduce 离线计算（基于外存）、Spark 内存计算、Storm 实时计算；业务模型层，包括数据挖掘、数据分析、数据查询、实时计算；最上层为业务应用，包括业务模型、数据可视化、业务应用。$kp$, section = '' where id = 24349;
update t_knowledge_point set title = $kp$国内外 Hadoop 应用情况$kp$, content = $kp$国内外使用 Hadoop 的公司比较多。全球最大的 Hadoop 集群在雅虎，有大约 25000 个节点，主要用于支持广告系统与网页搜索。国内使用 Hadoop 的主要有百度、淘宝、网易、华为、中国移动等，其中淘宝的 Hadoop 集群属于较大的。$kp$, section = '' where id = 24366;
update t_knowledge_point set title = $kp$计算速度是大数据发展的关键$kp$, content = $kp$海量数据从原始数据源到产生价值，期间会经过存储、清洗、挖掘、分析等多个环节，如果计算速度不够快，很多事情是无法实现的，因此计算速度是大数据发展过程中非常关键的因素。

分布式系统基础架构 Hadoop 的出现，为大数据带来了新的曙光：HDFS 为海量的数据提供了存储，MapReduce 则为海量的数据提供了并行计算，从而大大提高了计算效率。此后，Spark、Storm、Impala 等各种各样的技术进入人们的视野。$kp$, section = '' where id = 24367;
update t_knowledge_point set title = $kp$大数据处理架构 Hadoop$kp$, content = $kp$Hadoop 是 Apache 软件基金会旗下的一个开源分布式计算平台，为用户提供了系统底层细节透明的分布式基础架构。Hadoop 基于 Java 语言开发，具有很好的跨平台特性，并且可以部署在廉价的计算机集群中。Hadoop 的核心是分布式文件系统（Hadoop Distributed File System，HDFS）和 MapReduce。

HDFS 是针对谷歌文件系统（Google File System，GFS）的开源实现，是面向普通硬件环境的分布式文件系统，具有较高的读写速度、很好的容错性和可伸缩性，支持大规模数据的分布式存储，其冗余数据存储的方式很好地保证了数据的安全性。

MapReduce 是针对谷歌 MapReduce 的开源实现，允许用户在不了解分布式系统底层细节的情况下开发并行应用程序，采用 MapReduce 整合分布式文件系统上的数据，可保证分析和处理数据的高效性。

Hadoop 生态系统不断完善和成熟，目前已经包含多个子项目。除核心的 HDFS 和 MapReduce 外，还包括 Zookeeper、HBase、Hive、Pig、Mahout、Sqoop、Flume、Ambari 等功能组件：

- Ambari：安装、部署、配置和管理
- Zookeeper：分布式协作服务
- HBase：实时分布式数据库
- Hive：数据仓库
- Pig：数据流处理
- Mahout：数据挖掘库
- MapReduce：分布式计算框架
- HDFS：分布式文件系统
- Sqoop：数据库 ETL 工具
- Flume：日志收集工具

Hadoop 虽然已成为大数据技术的事实标准，但其本身还存在诸多缺陷，最主要的缺陷是 MapReduce 计算模型延迟过高，无法胜任实时、快速计算的需求，因而只适用于离线批处理的应用场景。

Spark 最大的特点是将计算数据、中间结果都存储在内存中，大大减少了 I/O 开销，因而更适合迭代运算比较多的数据挖掘与机器学习运算。使用 Hadoop 进行迭代计算非常耗资源，因为每次迭代都需要从磁盘写入、读取中间数据，I/O 开销大；而 Spark 将数据载入内存后，之后的迭代计算都可以直接使用内存中的中间结果进行运算，避免了从磁盘中频繁读取数据。

Hadoop 需要编写不少相对底层的代码，不够高效；而 Spark 提供了多种简洁的 API。通常情况下，实现相同功能的应用程序，Hadoop 的代码量要比 Spark 多 2 到 5 倍。更重要的是，Spark 提供了实时交互式编程反馈，可以方便地验证、调整算法。

尽管 Spark 相对于 Hadoop 具有较大优势，但并不能完全替代 Hadoop，主要用于替代 Hadoop 中的 MapReduce 计算模型。

Spark 最初由美国加州大学伯克利分校（UC Berkeley）的 AMP（Algorithms，Machines and People）实验室于 2009 年开发，是基于内存计算的大数据并行计算框架，可用于构建大型的、低延迟的数据分析应用程序。$kp$, section = '' where id = 24371;
update t_knowledge_point set title = $kp$分布式计算的优点$kp$, content = $kp$① 可靠性、高容错性。一台服务器的系统崩溃不会影响到其他的服务器。
② 可扩展性。分布式计算系统可以根据需要增加更多的机器。
③ 灵活性。可以很容易地安装、实施和调试新的服务。
④ 计算速度快。分布式计算机系统可以拥有多台计算机的计算能力，比其他系统有更快的处理速度。
⑤ 开放性。由于是开放的系统，本地和远程都可以访问到该服务。
⑥ 高性能。相较于集中式计算机网络，集群可以提供更高的性能及更好的性价比。$kp$, section = '' where id = 26113;
update t_knowledge_point set title = $kp$数据仓库$kp$, content = $kp$数据仓库的英文名称为 Data Warehouse，可简写为 DW 或 DWH。数据仓库是为企业所有级别的决策制定过程提供支持的所有类型数据的战略集合，是出于分析性报告和决策支持的目的而创建的单个数据存储，为企业提供业务智能，以指导业务流程改进并监视时间、成本、质量和控制。$kp$, section = '' where id = 26337;
update t_knowledge_point set title = $kp$分布式计算的定义$kp$, content = $kp$分布式计算是一门计算机科学，主要研究对象是分布式系统。

- 分布式系统是由若干通过网络互联的计算机组成的软硬件系统，这些计算机互相配合以完成一个共同的目标（往往这个共同的目标称为“项目”）。
- 分布式计算指在分布式系统上执行的计算，即将一个大型计算任务分成很多部分分别交给其他的计算机处理，并将所有的计算结果合并为原问题的解决方案。

注意：与并行计算不同，并行计算是使用多个处理器并行执行单个计算。并行运算与分布式计算的区别在于，分布式计算强调任务的分布执行，而并行计算强调任务的并发执行。$kp$, section = '' where id = 26480;
update t_knowledge_point set title = $kp$分布式对象存储系统$kp$, content = $kp$对象存储系统是传统块设备的延伸，具有更高的“智能”，上层通过对象 ID 来访问对象，而不需要了解对象的具体空间分布情况。相对于 GFS，在支撑互联网服务时，分布式对象存储系统具有如下优势：

- 相对于文件系统的复杂 API，分布式对象存储系统仅提供基于对象的创建、读取、更新、删除的简单接口，使用更方便且语义没有歧义。
- 对象分布在一个平坦的空间中，而非文件系统那样的命名空间之中，这提供了很大的管理灵活性：既可以在所有对象之上构建树状逻辑结构，也可以直接使用平坦的空间，还可以只在部分对象之上构建树状逻辑结构，甚至可以在同一组对象之上构建多个命名空间。

Amazon 的 S3 就属于对象存储服务。$kp$, section = '' where id = 26490;
update t_knowledge_point set title = $kp$MapReduce 分布式编程环境$kp$, content = $kp$为了让没有分布式系统编程背景的程序员也有机会将应用程序建立在大规模集群基础之上，Google 设计并实现了一套大规模数据处理的编程规范 Map/Reduce 系统。这样，非分布式专业的程序编写人员也能够为大规模的集群编写应用程序，而不用去顾虑集群的可靠性、可扩展性等问题。应用程序编写人员只需要将精力放在应用程序本身，关于集群的处理问题则交由平台来处理。

Map/Reduce 通过“Map（映射）”和“Reduce（化简）”两个简单的概念来参与运算，用户只需要提供自己的 Map 函数以及 Reduce 函数，就可以在集群上进行大规模的分布式数据处理。$kp$, section = '' where id = 26510;
update t_knowledge_point set title = $kp$Hadoop 的概念$kp$, content = $kp$Google 是大数据技术的鼻祖，大数据的发展可以说是其他企业和学校联合起来追赶 Google 的过程，其中最重要的软件技术就是 Hadoop。

Hadoop 是基于 Java 的一款支持数据密集型分布式应用、以 Apache 2.0 许可协议发布的开源软件框架，根据 Google 公司发表的 MapReduce 和 Google 文件系统的论文制作而成。

Hadoop 这个名字不是缩写，而是一个虚构的名字。项目创建者道格·卡廷（Doug Cutting）解释其得名：“这个名字是我孩子给一个棕黄色的大象玩具命名的。我的命名标准就是简短、容易发音和拼写，没有太多的意义，并且不会被用于别处。小孩子恰恰是这方面的高手。”

Hadoop 是一个能够让用户轻松架构和使用的分布式计算平台，用户可以在其上开发和运行处理海量数据的应用程序。它主要有以下 5 个优点：

（1）高可靠性。Hadoop 按位存储和处理数据的能力值得人们信赖。
（2）高扩展性。Hadoop 在可用的计算机集簇间分配数据并完成计算任务，这些集簇可以方便地扩展到数以千计的节点中。
（3）高效性。Hadoop 能够在节点之间动态地移动数据，并保证各个节点的动态平衡，因此处理速度非常快。
（4）高容错性。Hadoop 能够自动保存数据的多个副本，并且能够自动将失败的任务重新分配。
（5）低成本。与一体机、商用数据仓库以及 QlikView、Yonghong Z-Suite 等数据集市相比，Hadoop 是开源的，软件成本大大降低。

Hadoop 带有用 Java 语言编写的框架，因此在 Linux 生产平台上运行非常理想；Hadoop 上的应用程序也可以使用其他语言编写，如 C++。

Hadoop 项目结构主要包括 Pig、Oozie、Hive、HBase、MapReduce、HDFS、ZooKeeper、Common、YARN。$kp$, section = '' where id = 26534;
update t_knowledge_point set title = $kp$Hadoop 平台的核心技术$kp$, content = $kp$Hadoop 核心技术基本上都依照 Google 的大数据系统，普遍认为整个 Apache Hadoop 平台包括 Hadoop 内核、MapReduce、Hadoop 分布式文件系统（HDFS）以及一些相关项目，如 Apache Hive 和 Apache HBase 等。$kp$, section = '' where id = 26535;
update t_knowledge_point set title = $kp$HDFS 分布式文件系统$kp$, content = $kp$如同 Windows 使用 NTFS 文件系统一样，Hadoop 的首要任务是存储分布式的文件数据。为实现稳定、可靠和性能较优良的文件存储，Hadoop 提供了自己的文件系统——分布式文件系统（Hadoop Distributed File System，HDFS）。

HDFS 位于 Hadoop 的底层，存储 Hadoop 集群中所有存储节点的文件。HDFS 是一个主/从（Master/Slave）体系结构，从最终用户的角度看，它就像传统的文件系统一样，可以通过目录路径对文件执行创建、读取、更新和删除（Create、Read、Update、Delete，CRUD）操作。但由于分布式存储的性质，HDFS 集群拥有一个 NameNode 和若干 DataNode，NameNode 管理系统的元数据，DataNode 存储实际的数据，客户端通过 NameNode 和 DataNode 的交互访问文件系统。

HDFS 具有以下特点：

① 可靠的数据存储。HDFS 中的任意一份数据，理论上都至少存放 3 份以上的副本，任何一份副本的失效都不影响数据访问。

② 处理超大文件。这里的超大文件通常是指几百 MB 甚至数百 TB 大小的文件，目前在实际应用中，HDFS 已经能用来存储管理 PB 级的数据。

③ 流式的访问数据。HDFS 的设计建立在更多地响应“一次写入、多次读取”任务的基础上，这意味着一个数据集一旦由数据源生成，就会被复制分发到不同的存储节点中，然后响应各种各样的数据分析任务请求。多数情况下分析任务都会涉及数据集中的大部分数据，也就是说，对 HDFS 来说，请求读取整个数据集要比读取一条记录更加高效。

④ 运行于廉价的商用机器集群上。Hadoop 对硬件需求比较低，只需运行在低廉的商用硬件集群上，而无需昂贵的高可用性机器。廉价的商用机也就意味着大型集群中出现节点故障的概率非常高，这就要求设计 HDFS 时充分考虑数据的可靠性、安全性及高可用性。$kp$, section = '' where id = 26536;
update t_knowledge_point set title = $kp$MapReduce 分布式计算框架$kp$, content = $kp$如果说 HDFS 解决了分布式存储的问题，那么 MapReduce 则解决了分布式计算问题。以 C++ 程序为主的传统分布式计算编程都非常复杂，对程序员的编程要求很高，使程序的编写和调试都有相当大的难度，而 MapReduce 的出现使这个问题得到了极大的解决。

Hadoop 的 MapReduce 模仿 Google 的 MapReduce 实现原理，是一个使用简易的分布式计算框架，基于它写出的应用程序能够运行在由上千个商用机器组成的大型集群上，并以一种可靠容错的方式并行处理 TB 级别的数据集。

例如，用户想数出一摞牌中有多少张黑桃，直观方式是一张一张检查并数出有多少张是黑桃，而 MapReduce 的方法如下：

Step1：给在座的所有玩家分配这摞牌；

Step2：让每个玩家数自己手中的牌有几张是黑桃，然后把这个数目汇报给用户；

Step3：用户把所有玩家说的数字加起来，得到最后的结论。

MapReduce 合并了两种经典函数——映射和化简。

映射（Mapping）对集合里的每个元素应用同一个操作，即每个玩家判断自己手中的牌是否为黑桃并计数。编写程序（函数）对自己手中的黑桃加一的操作就属于 Mapping，人越多数得越快，对应程序而言，机器越多则越快。

化简（Reducing）遍历集合中的元素来返回一个综合的结果，即将每个人的牌数进行汇总统计，这些操作都属于 Reducing。参与汇总的人较多也会加快汇总速度，当所有汇总完成后才能得到最终结果，此过程对机器也一样。

MapReduce 能使用广受欢迎的 Java 语言进行程序设计，大大降低了程序设计的门槛，规避了类似 C++ 语言容易出现各种内存问题的风险，从而获得了极为广泛的使用。$kp$, section = '' where id = 26537;
update t_knowledge_point set title = $kp$Hadoop 的其他子项目$kp$, content = $kp$一个完整的大数据框架内容是非常丰富的。就 Hadoop 而言，除了 HDFS 和 MapReduce 这两个核心项目外，还有以下一些广为人知的子项目：

① Hadoop Common。在 0.20 及以前的版本中，包含 HDFS、MapReduce 和其他项目的公共内容；从 0.21 开始，HDFS 和 MapReduce 被分离为独立的子项目，其余内容为 Hadoop Common。
② Hive。数据仓库工具，由 Facebook 贡献。
③ Zookeeper。分布式锁设施，提供类似 Google Chubby 的功能，由 Yahoo 贡献。
④ Avro。新的数据序列化格式与传输工具，将逐步取代 Hadoop 原有的 IPC 机制。
⑤ Pig。大数据分析平台，为用户提供多种接口。
⑥ Ambari。Hadoop 管理工具，可以快捷地监控、部署、管理集群。$kp$, section = '' where id = 26538;
update t_knowledge_point set title = $kp$NoSQL 数据库$kp$, content = $kp$传统的关系型数据库具有严格的设计定义，为保证强一致性而放弃性能，可扩展性差等问题在大数据分析中逐渐暴露出来，随之而来的是 NoSQL 数据存储模型的流行。NoSQL 也有人理解为 Not Only SQL，它并不是一种特定的数据存储模型，而是一类非关系型数据库的统称，其特点是没有固定的数据表模式，可以分布式和水平扩展。NoSQL 并不是单纯地反对关系型数据库，而是针对关系型数据库缺点的一种补充和扩展。典型的 NoSQL 数据存储模型有文档存储、键-值存储、图存储、对象数据库、列存储等。

NoSQL 是一种建立在云平台的新型数据处理模式，在很多情况下又叫作云数据库。由于其处理数据的模式完全分布于各种低成本服务器和存储磁盘，因此它可以帮助网页和各种交互应用快速处理过程中产生的海量数据，为 Zynga、AOL、Cisco 以及其他企业提供网页应用支持。正常的数据库需要将数据进行归类组织，类似于姓名和帐号，这些数据需要进行结构化和标签化处理；而 NoSQL 数据库则完全不关心这些，它能处理各种类型的文档，在处理海量数据并行请求时也不会有任何问题。比方说，有 1000 万人同时登录某个游戏，它会将这些数据分布到全世界的服务器并通过它们来进行数据处理，结果与 1 万人同时在线没什么两样。现今有多种类型的 NoSQL 模式：商业化的模式，如 Couchbase、10gen 的 MongoDB 以及 Oracle 的 NoSQL；开源免费的模式，如 CouchDB 和 Cassandra；还有亚马逊推出的 NoSQL 云服务等。$kp$, section = '' where id = 26539;
update t_knowledge_point set title = $kp$存储计算分离$kp$, content = $kp$在传统集群系统中，计算和存储是紧密耦合的。以 Hadoop 为例，存储与计算密不可分，而随着业务的发展，常常会为了扩存储而带来额外的计算扩容，这其实是一种浪费；同理，只为提升计算能力，也会带来一段时期的存储浪费。将计算和存储分离，可以更好地应对单方面的不足。$kp$, section = '' where id = 26574;
update t_knowledge_point set title = $kp$分布式计算的概念及特点$kp$, content = $kp$分布式计算的“分散”，指的是从一个节点出发，把指令或者数据传递到多个节点上运行，按照某种计算规则驱动这些节点生成计算结果；“聚合”是对结果数据的编排和汇总，根据不同的需求，聚合又分为对数据本身的聚合和对元数据的聚合。

特点：稀有资源可以共享，通过分布式计算可以在多台计算机上平衡计算负载，可以把程序放在最适合运行它的计算机上。$kp$, section = '' where id = 26867;
update t_knowledge_point set title = $kp$分布式数据处理$kp$, content = $kp$分布式数据处理技术一方面与分布式存储形式直接相关，另一方面也与业务数据的温度类型（冷数据、热数据）相关。目前主要的数据处理计算模型包括 MapReduce 计算模型、DAG 计算模型、BSP 计算模型等。$kp$, section = '' where id = 26883;
update t_knowledge_point set title = $kp$Hadoop、MapReduce 与 NoSQL 的基本功能$kp$, content = $kp$Hadoop 实现了一个分布式文件系统，其中一个组件是 HDFS（Hadoop Distributed File System）。HDFS 具有高容错性，设计用于部署在低廉的硬件上，并提供高吞吐量来访问应用程序的数据，适合有着超大数据集的应用程序。

Hadoop 框架最核心的设计是 HDFS 和 MapReduce：HDFS 为海量数据提供存储，MapReduce 为海量数据提供计算。

HBase（Hadoop Database）是一个高可靠性、高性能、面向列、可伸缩的分布式存储系统，利用 HBase 技术可在廉价 PC Server 上搭建大规模结构化存储集群。

Hadoop 是集分布式存储和分布式计算于一体的平台，核心组件为 HDFS、YARN、MapReduce。

MapReduce 是一个基于集群的高性能并行计算平台，是并行计算与运行软件框架，也是一种并行程序设计模型与方法。

NoSQL 泛指非关系型数据库，开源的 NoSQL 数据库软件有 Membase、MongoDB 等。$kp$, section = '' where id = 26884;
update t_knowledge_point set title = $kp$Hadoop 是分布式处理软件框架$kp$, content = $kp$Hadoop 是一个能够对大量数据进行分布式处理的软件框架。

Hadoop 是用 Java 语言实现的开源软件，通常运行在 Linux 平台上。

Hadoop 框架最核心的设计是 HDFS 和 MapReduce：HDFS 为海量数据提供存储，MapReduce 为海量数据提供计算。$kp$, section = '' where id = 27103;
update t_knowledge_point set title = $kp$分布式计算与云计算的区别$kp$, content = $kp$分布式计算是将数据分块放置在计算机节点上进行计算、最后进行整合的计算方式；分布式计算的构建一般是为了完成某个特定任务，通用性较差。

云计算一般都是为通用应用而设计的，通用性更强。$kp$, section = '' where id = 28461;
update t_knowledge_point set title = $kp$大数据系统结构：Google 与 Hadoop 体系对比$kp$, content = $kp$大数据系统体系分为计算框架、文件系统、数据存储系统三层。

Google 体系：计算框架为 MapReduce，文件系统为 GFS，数据存储系统为 BigTable。$kp$, section = '' where id = 28466;
update t_knowledge_point set title = $kp$Hadoop 是分布式处理软件框架$kp$, content = $kp$Hadoop 是一个能够对大量数据进行分布式处理的软件框架。$kp$, section = '' where id = 28467;
update t_knowledge_point set title = $kp$HDFS 按固定大小把文件切分为数据块$kp$, content = $kp$HDFS 在对文件存储时，首先把文件按照一定的大小分割成一个或多个数据块，数据块默认大小为 64 MB。在计算过程中只允许读、不允许写。$kp$, section = '' where id = 29589;
update t_knowledge_point set title = $kp$Hadoop 伪分布式模式$kp$, content = $kp$伪分布式模式：Hadoop 守护进程运行在本地机器上，模拟一个小规模的集群。换句话说，可以配置一台机器的 Hadoop 集群，伪分布式是完全分布式的一个特例。$kp$, section = '' where id = 30055;
update t_knowledge_point set title = $kp$Hadoop 完全分布式模式$kp$, content = $kp$完全分布式模式：Hadoop 守护进程运行在一个集群上。$kp$, section = '' where id = 30056;
update t_knowledge_point set title = $kp$Hadoop 的高扩展性$kp$, content = $kp$高扩展性：Hadoop 是在可用的计算机集簇间分配数据并完成计算任务的，这些集簇可以方便地扩展到数以千计的节点中。$kp$, section = '' where id = 30057;
update t_knowledge_point set title = $kp$Hadoop 的高效性$kp$, content = $kp$高效性：Hadoop 能够在节点之间动态地移动数据，并保证各个节点的动态平衡，因此处理速度非常快。$kp$, section = '' where id = 30058;
update t_knowledge_point set title = $kp$Hadoop 的高容错性$kp$, content = $kp$高容错性：Hadoop 能够自动保存数据的多个副本，并且能够自动将失败的任务重新分配。$kp$, section = '' where id = 30059;
update t_knowledge_point set title = $kp$NoSQL 数据库用于存储半结构化数据$kp$, content = $kp$NoSQL 数据库是非关系型数据库，主要用来解决半结构化数据的存储问题，代表产品有 MongoDB、Redis、HBase。$kp$, section = '' where id = 30061;
update t_knowledge_point set title = $kp$Bigtable 是基于 GFS、MapReduce 与 Chubby 的分布式存储系统$kp$, content = $kp$Bigtable 是 Google 公司开发的基于 GFS、MapReduce 以及 Chubby 的分布式存储系统。$kp$, section = '' where id = 30063;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22262,23614,24280,24295,24297,24303,24312,24316,24318,24321,24322,24323,24325,24326,24329,24330,24331,24332,24334,24343,24345,24346,24349,24366,24367,24371,26113,26337,26480,26490,26510,26534,26535,26536,26537,26538,26539,26574,26867,26883,26884,27103,28461,28466,28467,29589,30055,30056,30057,30058,30059,30061,30063) and not deleted) <> 53 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
