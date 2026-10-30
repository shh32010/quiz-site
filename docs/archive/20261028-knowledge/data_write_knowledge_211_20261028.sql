-- 知识点 211 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_211
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_211 as
select * from t_knowledge_point where id in (22416,23518,23519,23557,23613,23680,23726,23957,24302,24309,24310,24315,24319,24320,24324,24355,24356,24357,24358,24359,25691,26341,26342,26343,26344,26345,26348,26541,26542,26543,26544,26547,26548,26549,26557,26558,26605,26896,27098,27099,27102,28465);

update t_knowledge_point set title = $kp$Mahout 数据挖掘工具库$kp$, content = $kp$Mahout 来源于 Apache Lucene 子项目，其主要目标是创建并提供经典的机器学习和数据挖掘并行化算法类库，以减轻需要使用这些算法进行数据分析挖掘的程序员的编程负担，使其不必自己再实现这些算法。$kp$, section = '' where id = 22416;
update t_knowledge_point set title = $kp$数据分析的定义$kp$, content = $kp$数据分析（Data Analysis）是指用适当的统计方法对收集来的大量数据资料进行分析，以最大化地开发数据资料的功能、发挥数据的作用，是为了提取有用信息和形成结论而对数据加以详细研究和概括总结的过程。

数据分析的目的是把隐没在一大批看来杂乱无章的数据中的信息集中、萃取和提炼出来，以找出所研究对象的内在规律。$kp$, section = '' where id = 23518;
update t_knowledge_point set title = $kp$数据可视化的定义$kp$, content = $kp$数据可视化是指将大型数据集中的数据以图形图像形式表示，并利用数据分析和开发工具发现其中未知信息的处理过程。

数据可视化技术的基本思想是将数据库中每一个数据项作为单个图元素表示，大量的数据集构成数据图像，同时将数据的各个属性值以多维数据的形式表示，可以从不同的维度观察数据，从而对数据进行更深入的观察和分析。$kp$, section = '' where id = 23519;
update t_knowledge_point set title = $kp$统计分析$kp$, content = $kp$统计分析是基于统计理论，运用数学方式建立数学模型，对通过调查获取的各种数据及资料进行数理统计和分析，形成定量的结论。$kp$, section = '' where id = 23557;
update t_knowledge_point set title = $kp$数据分析的分类$kp$, content = $kp$根据数据分析的深度，可将数据分析分为三个层次：

（1）描述性分析：基于历史数据描述发生了什么，通常应用于商业智能和可视化系统中。
（2）预测性分析：用于预测未来的概率和趋势。
（3）规则性分析：用于解决决策制定问题、提高分析效率。$kp$, section = '' where id = 23613;
update t_knowledge_point set title = $kp$百度迁徙数据图$kp$, content = $kp$这张图展示的是 2017 年春节前全国活动人口的迁出流向，人们从最亮的点涌向全国各地返乡过年。图中选出了迁出量最高的前 20 个城市，这 20 个城市承载了全国超过 40% 的人口迁出量。$kp$, section = '' where id = 23680;
update t_knowledge_point set title = $kp$上海地铁系统进站流量图$kp$, content = $kp$图中展示的是上海公交换乘地铁站点在工作日和休息日的乘客进站流量，分别对应工作日和休息日两种情形。$kp$, section = '' where id = 23726;
update t_knowledge_point set title = $kp$啤酒与尿布案例$kp$, content = $kp$配图为啤酒杯、绿色购物袋与白色容器的组合插画，对应“啤酒与尿布”这一购物篮关联分析的经典案例，原文未提供更多文字说明。$kp$, section = '' where id = 23957;
update t_knowledge_point set title = $kp$Spark MLlib 机器学习库$kp$, content = $kp$Spark 中的机器学习库 MLlib 是专为在集群上并行运行而设计的，只包含能够在集群上运行良好的并行算法，并不考虑一些虽然经典但不能并行执行的机器学习算法。$kp$, section = '' where id = 24302;
update t_knowledge_point set title = $kp$数据可视化的作用$kp$, content = $kp$在大数据时代，可视化技术可以支持实现多种不同的目标：

（1）观测、跟踪数据；
（2）分析数据；
（3）辅助理解数据；
（4）增强数据吸引力。$kp$, section = '' where id = 24309;
update t_knowledge_point set title = $kp$数据挖掘$kp$, content = $kp$数据挖掘可以认为是发现大数据集中数据模式的一种计算过程。许多数据挖掘算法已在人工智能、机器学习、模式识别、统计和数据库领域得到应用。$kp$, section = '' where id = 24310;
update t_knowledge_point set title = $kp$数据处理与分析$kp$, content = $kp$利用分布式并行编程模型和计算框架，结合机器学习和数据挖掘算法，实现对海量数据的处理和分析。数据分析可用于决策支持、商业智能、推荐系统、预测系统等。$kp$, section = '' where id = 24315;
update t_knowledge_point set title = $kp$可视化分析$kp$, content = $kp$利用可视化技术实时呈现当前分析结果，引导用户参与分析过程，并根据用户反馈信息执行后续分析操作，完成用户与分析算法的全程交互，实现数据分析算法与用户领域知识的完美结合。$kp$, section = '' where id = 24319;
update t_knowledge_point set title = $kp$数据呈现$kp$, content = $kp$对分析结果进行可视化呈现，帮助人们更好地理解数据、分析数据。使用可视化技术可以将处理结果以图形方式直观地呈现给用户，标签云（Tag Cloud）、历史流（History Flow）、空间信息流（Spatial Information Flow）等都是常用的可视化技术，用户可根据需求灵活使用；人机交互技术可以引导用户对数据进行逐步分析，使用户参与到数据分析过程中，从而深刻理解数据分析结果。$kp$, section = '' where id = 24320;
update t_knowledge_point set title = $kp$网络攻击地图$kp$, content = $kp$网络攻击地图显示了正在发生 DDoS 攻击的地区。DDoS 攻击是通过大量合法的服务请求占用过多的服务资源，从而使合法用户无法得到服务响应的攻击方式。$kp$, section = '' where id = 24324;
update t_knowledge_point set title = $kp$数据可视化工具$kp$, content = $kp$目前已有许多数据可视化工具，其中大部分可以免费使用，能够满足各种可视化需求，主要包括：

入门级工具：Excel。
信息图表工具：Google Chart API、D3、Visual.ly、Raphael、Flot、Tableau、大数据魔镜。
地图工具：Modest Maps、Leaflet、PolyMaps、OpenLayers、Kartograph、Google Fusion Tables、Quantum GIS。
时间线工具：Timetoast、Timeline、Timeslide、Dipity。
高级分析工具：Processing、NodeBox、R、Weka、Gephi。$kp$, section = '' where id = 24355;
update t_knowledge_point set title = $kp$数据挖掘的定义$kp$, content = $kp$数据挖掘（Data Mining）就是从大量的、不完全的、有噪声的、模糊的、随机的实际应用数据中，提取隐含在其中的、人们事先不知道但又是潜在有用的信息和知识的过程。$kp$, section = '' where id = 24356;
update t_knowledge_point set title = $kp$数据挖掘工具$kp$, content = $kp$根据适用范围，数据挖掘工具分为专用挖掘工具和通用挖掘工具两类。常见的数据挖掘软件包括：

（1）Weka；
（2）SPSS；
（3）Clementine；
（4）RapidMiner；
（5）其他数据挖掘软件。

近年来流行的数据挖掘软件还包括 Orange、KNIME、Keel 与 Tanagra 等。$kp$, section = '' where id = 24357;
update t_knowledge_point set title = $kp$数据挖掘的应用场景$kp$, content = $kp$按应用场景分类，数据挖掘的应用主要涉及通信、股票、金融、银行、交通、商品零售、生物医学、精确营销、地震预测、工业产品设计等领域。在这些领域中，众多数据挖掘方法得到广泛应用，并衍生出各自独特的算法。

数据挖掘在客户群体定向分析、数据营销、交叉销售、市场细分、满意度统计、欺诈与风险评估、商业风险分析等典型商业方面发挥着巨大作用。在数据挖掘应用中，不存在一种广泛适用于各种不同应用的数据挖掘方法，特定的应用场景往往需要针对该领域的专门数据挖掘方法。$kp$, section = '' where id = 24358;
update t_knowledge_point set title = $kp$数据挖掘的概念与技术$kp$, content = $kp$数据挖掘首先要搜集数据，数据越丰富、数据量越大越好。只有获得足够大量、高质量的数据，才能获得确定的判断、产生认知模型，这是从量变到质变的过程。

数据挖掘技术是指为了完成数据挖掘任务所需要的全部技术，是数据挖掘方法的集合。金融、零售等行业已广泛采用数据挖掘技术，分析用户的可信度和购物偏好等。$kp$, section = '' where id = 24359;
update t_knowledge_point set title = $kp$数据可视化的工具与图形类型$kp$, content = $kp$在大数据时代，有价值的商品是数据。大数据要对海量数据进行存储、计算、统计、分析等一系列处理，处理的数据量达 TB 级，甚至 PB 或 EB 级，是传统数据处理手段无法完成的。常用的分析工具有 Excel、R 语言、Python、Tableau、ECharts、Highcharts、魔镜、图表秀等。大数据技术为决策提供依据，在政府、企业、科研项目等决策中扮演着重要角色。

可视化的图形表示及其适用场景：

柱状图：展示多个数据之间的差异，适用于小规模数据。
折线图：反映数据的变化趋势，适用于二维数据或时间序列数据。
散点图：展示不同数据之间的相关关系，适用于二维数据或聚类分析。
雷达图：展示不同类别数据的等级差异，适用于小规模数据。
箱形图：反映数据的离散情况，包括最大值、最小值、中位数和四分位数。
饼图：展示各数据在整体中的占比，适用于分类较少的数据。
气泡图：展示三个变量之间的关系，适用于小规模数据。
词频图：展示数据出现的频率大小，适用于用户画像和标签。
桑基图：反映信息的变化和流动状态，适用于路径分析与流量分析。
热力图：展示数据的分布情况，适用于含位置信息的数据。
关系图：展示事物的相关性和关联性，适用于社交关系链、品牌传播。
漏斗图：展示业务流程中的转化情况，适用于用户转化分析，如 AARRR 漏斗模型。

标签云（文字云）是关键词的视觉化描述，用于汇总用户生成的标签或一个网站的文字内容。标签一般是独立的词汇，常按字母顺序排列，其重要程度通过改变字体大小或颜色来表现，因此标签云可以灵活地依照字序或热门程度来检索标签。大多数标签本身就是超链接，直接指向与标签相联的一系列条目。

常见数据可视化工具还有 Excel、BI 工具（PowerBI、Tableau、FineBI）、Python 可视化库（Matplotlib、Seaborn）等。$kp$, section = '' where id = 25691;
update t_knowledge_point set title = $kp$数据挖掘与知识发现$kp$, content = $kp$数据挖掘（Data Mining）又译为资料探勘、数据采矿，是数据库知识发现（Knowledge Discovery in Databases，KDD）中的一个步骤。数据挖掘一般是指从大量数据中通过算法搜索隐藏于其中信息的过程。数据挖掘通常与计算机科学有关，并通过统计、在线分析处理、情报检索、机器学习、专家系统（依靠过去的经验法则）和模式识别等诸多方法来实现上述目标。$kp$, section = '' where id = 26341;
update t_knowledge_point set title = $kp$数据挖掘与数据仓库的关系$kp$, content = $kp$若将 Data Warehousing（数据仓库）比作矿坑，Data Mining（数据挖掘）就是深入矿坑采矿的工作。数据挖掘不是无中生有的魔术，也不是点石成金的炼金术，若没有足够丰富完整的数据，很难期待数据挖掘能挖掘出有意义的信息。$kp$, section = '' where id = 26342;
update t_knowledge_point set title = $kp$数据挖掘的主要功能$kp$, content = $kp$数据挖掘的实际应用功能可分为三大类六分项：Classification（分类）和 Clustering（聚类）属于分类区隔类；Regression（回归）和 Time-series（时间序列）属于推算预测类；Association（关联）和 Sequence（序列）属于序列规则类。$kp$, section = '' where id = 26343;
update t_knowledge_point set title = $kp$数据挖掘的过程$kp$, content = $kp$数据挖掘以数据库中的数据为数据源，整个过程可分为数据集成、数据选择、预处理、数据挖掘、结果表达和解析等阶段。挖掘的范围可针对多媒体数据库、数据仓库、Web 数据库、主动型数据库、时间型及概率型数据库等；采用的技术有人工神经网络、决策树、遗传算法、规则归纳、分类、聚类、降维、模式识别、不确定性处理等；发现的知识有广义型知识、特征型知识、差异型知识、关联型知识、预测型知识、偏离型知识。

目前数据挖掘的研究和应用所面临的主要挑战是：对大型数据库的数据挖掘方法；对非结构化和无结构数据库中的数据挖掘操作；用户参与的交互挖掘；对挖掘所得知识的证实技术；知识的解释和表达机制；数据库更新后原有知识的修正；挖掘所得知识库的建立、使用和维护。$kp$, section = '' where id = 26344;
update t_knowledge_point set title = $kp$联机分析处理$kp$, content = $kp$联机分析处理（OLAP）系统是数据仓库系统最主要的应用，专门设计用于支持复杂的分析操作，侧重对决策人员和高层管理人员的决策支持，可以根据分析人员的要求快速、灵活地进行大数据量的复杂查询处理，并以直观易懂的形式将查询结果提供给决策人员，以便他们准确掌握企业经营状况、了解对象需求、制定正确方案。$kp$, section = '' where id = 26345;
update t_knowledge_point set title = $kp$数据仓库与联机分析处理的体系结构$kp$, content = $kp$数据仓库与 OLAP 的关系是互补的。现代 OLAP 系统一般以数据仓库作为基础，即从数据仓库中抽取详细数据的一个子集，经过必要的聚集后存储到 OLAP 存储器中，供前端分析工具读取。$kp$, section = '' where id = 26348;
update t_knowledge_point set title = $kp$大数据分析$kp$, content = $kp$数据分析技术是大数据技术的核心，在数据处理过程中占据十分重要的位置。大数据的价值体现在对大规模数据集合的智能处理方面，即从大规模数据中获取有用的信息。要实现这一功能，就必须对数据进行分析和挖掘，而数据的采集、存储和管理都是开展数据分析的基础，通过数据分析得到的结果将应用于大数据相关的各个领域。未来大数据技术的进一步发展与数据分析技术密切相关。数据分析技术意味着对海量数据进行分析以实时得出答案，涵盖可视化分析、数据挖掘算法、预测分析能力等多个方面。$kp$, section = '' where id = 26541;
update t_knowledge_point set title = $kp$可视化分析$kp$, content = $kp$数据可视化无论对于普通用户还是数据分析专家，都是最基本的功能。数据图像化可以让数据自己“说话”，让用户直观地感受到结果。$kp$, section = '' where id = 26542;
update t_knowledge_point set title = $kp$数据挖掘算法$kp$, content = $kp$图像化是将机器语言翻译给人看，而数据挖掘算法处理的是机器语言。分割、集群、孤立点分析以及各种算法让我们可以精炼数据、挖掘价值。这些算法必须能够应付大数据巨大的数据量，同时还要具有很高的处理速度。$kp$, section = '' where id = 26543;
update t_knowledge_point set title = $kp$预测分析能力$kp$, content = $kp$数据挖掘可以让分析师更快更好地消化理解数据所承载的信息，进而提升判断的准确性；预测性分析则可以让分析师根据图像化分析和数据挖掘的结果做出前瞻性判断。$kp$, section = '' where id = 26544;
update t_knowledge_point set title = $kp$大数据挖掘$kp$, content = $kp$大数据挖掘（Data Mining）是从大量的、不完全的、有噪声的、模糊的、随机的数据中，提取隐含在其中的、人们事先不知道但又是潜在有用的信息和知识的过程。数据挖掘通常与计算机科学有关，并通过统计分析、在线分析处理、情报检索、机器学习算法、专家系统和模式识别等诸多方式实现上述目标。$kp$, section = '' where id = 26547;
update t_knowledge_point set title = $kp$数据挖掘流程$kp$, content = $kp$数据挖掘流程包括四个阶段：

定义问题：清晰地定义业务问题，确定数据挖掘的目的。
数据准备：包括选择数据，即在大型数据库和数据仓库中提取数据挖掘的目标数据集；以及数据预处理，即进行数据再加工，包括检查数据的完整性和一致性、去噪声、填补丢失的域、删除无效数据等。
数据挖掘：根据数据功能的类型和数据的特点选择相应的算法，在净化和转换过的数据集上进行数据挖掘。
结果分析：对数据挖掘的结果进行解释和评价，转换为能够最终被用户理解的知识。$kp$, section = '' where id = 26548;
update t_knowledge_point set title = $kp$数据挖掘的分类$kp$, content = $kp$直接数据挖掘：目标是利用可用的数据建立一个模型，用这个模型对剩余的数据、对一个特定的变量（可以理解为数据库中表的属性，即列）进行描述。

间接数据挖掘：目标中没有选出某一具体的变量用模型进行描述，而是在所有的变量之间建立起某种关系。$kp$, section = '' where id = 26549;
update t_knowledge_point set title = $kp$大数据可视化$kp$, content = $kp$根据数据的特点（如时间信息和空间信息）建立数据可视化，例如图表（Chart）、图（Diagram）和地图（Map）等，将数据直观地展现出来，帮助人们理解数据，同时发现海量数据中包含的规则或信息。数据可视化是大数据生命周期管理的最后一步，也是重要的一步。

数据可视化起源于图形学、计算机图形学、人工智能、科学可视化以及用户界面等领域的相互促进和发展，是当前计算机科学的一个重要研究方向，它利用计算机对抽象信息进行直观表示，以利于快速检索信息和增强认知能力。

数据可视化系统并不是为了展示用户已知数据之间的规律，而是为了帮助用户通过认知数据获得新的发现，发现数据所反映的实质。$kp$, section = '' where id = 26557;
update t_knowledge_point set title = $kp$大数据可视化的基本概念$kp$, content = $kp$大数据可视化涉及以下基本概念：

（1）数据空间：由 n 维属性、m 个元素共同组成的数据集构成的多维信息空间。
（2）数据开发：利用一定的工具及算法对数据进行定量推演及计算。
（3）数据分析：对多维数据进行切片、块、旋转等操作来剖析数据，从而多角度、多侧面地观察数据。
（4）数据可视化：将大型数据集中的数据通过图形图像方式表示，并利用数据分析和开发工具发现其中未知信息。

从技术上看，大数据可视化的实施步骤主要有四项：需求分析，建设数据仓库或数据集市模型，数据抽取、清洗、转换、加载（ETL），建立可视化分析场景。$kp$, section = '' where id = 26558;
update t_knowledge_point set title = $kp$数据挖掘的常用算法$kp$, content = $kp$目前，数据挖掘的算法主要包括神经网络法、决策树法、遗传算法、粗糙集法、模糊集法、关联规则法等。$kp$, section = '' where id = 26605;
update t_knowledge_point set title = $kp$数据挖掘算法的概念$kp$, content = $kp$数据挖掘算法是根据数据创建数据挖掘模型的一组试探法和计算。为了创建模型，算法首先分析所提供的数据，查找特定类型的模式和趋势；然后使用分析结果定义用于创建挖掘模型的最佳参数，并将这些参数应用于整个数据集，以提取可行模式和详细统计信息。$kp$, section = '' where id = 26896;
update t_knowledge_point set title = $kp$数据挖掘与数据分析的关系$kp$, content = $kp$数据挖掘属于数据分析的一种方法。$kp$, section = '' where id = 27098;
update t_knowledge_point set title = $kp$数据挖掘的含义$kp$, content = $kp$数据挖掘就是从大数据中找到有用的信息。$kp$, section = '' where id = 27099;
update t_knowledge_point set title = $kp$数据可视化工具应具备的特性$kp$, content = $kp$大数据时代，数据可视化工具必须具有以下特性：实时性、操作简单、更丰富的展现、多种数据集成支持方式。$kp$, section = '' where id = 27102;
update t_knowledge_point set title = $kp$数据可视化工具应具备的特性$kp$, content = $kp$大数据时代，数据可视化工具必须具有以下特性：实时性、操作简单、更丰富的展现、多种数据集成支持方式。$kp$, section = '' where id = 28465;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22416,23518,23519,23557,23613,23680,23726,23957,24302,24309,24310,24315,24319,24320,24324,24355,24356,24357,24358,24359,25691,26341,26342,26343,26344,26345,26348,26541,26542,26543,26544,26547,26548,26549,26557,26558,26605,26896,27098,27099,27102,28465) and not deleted) <> 42 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
