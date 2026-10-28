-- 知识点 160 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_160
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_160 as
select * from t_knowledge_point where id in (22377,23607,23615,23616,23617,23675,23678,23679,23741,23756,23778,23871,23902,23923,24009,24011,24015,24016,24050,24068,24099,25050,25321,25322,25327,25330,26298,26300,26302,26303,26304,27360,27632,27633,27634,27635,27636,27637,27651,27652,27653,27654,27655,28361,28365,28366,28372,28379,28417,29665,29673,29707,29709,29710,29711,29713,29772,29774,29776,29777,29778,29779,29817,29891,29904,29905,29944,29961,29962,29980,29982,30247,30254,32053,32054,32055,32056);

update t_knowledge_point set title = $kp$数据库系统的特点$kp$, content = $kp$与文件系统相比，数据库系统具有以下特点：

1. 数据结构化。
2. 数据共享性高，冗余度低。
3. 数据独立于程序。
4. 统一管理和控制数据。

逻辑独立性是指用户的应用程序与数据库的逻辑结构相互独立。

物理独立性是指用户的应用程序与存储在数据库中的数据相互独立。$kp$, section = '' where id = 22377;
update t_knowledge_point set title = $kp$客户/服务器结构（C/S）$kp$, content = $kp$是一种网络处理系统。有多台用作客户机的计算机和一至多台用作服务器的计算机。客户机直接面向用户，接收并处理任务，将需要数据库操作的任务委托服务器执行；而服务器只接收这种委托，完成对数据库的查询和更新，并把查询结果返回给客户机。C/S 结构的数据库系统虽然处理上是分布的，但数据却是集中的，仍属于集中式数据库系统。

结构示意：多台客户机通过网络与数据库服务器相连，数据库服务器访问数据库。$kp$, section = '' where id = 23607;
update t_knowledge_point set title = $kp$数据库系统的特点$kp$, content = $kp$1. 数据结构化。
2. 数据共享性高，冗余度低。
3. 应用程序与数据相互独立。

逻辑独立性是指用户的应用程序与数据库的逻辑结构相互独立；物理独立性是指用户的应用程序与存储在数据库中的数据相互独立。

注意：不管是数据的物理存储结构改变，还是数据的逻辑结构改变，应用程序都不需改变。

4. 统一管理和控制数据。$kp$, section = '' where id = 23615;
update t_knowledge_point set title = $kp$数据库系统的组成$kp$, content = $kp$数据库系统由以下部分组成：

1. 应用程序。
2. 计算机支持系统（硬件支持环境、软件支持环境）。
3. 数据库。
4. 数据库管理系统（DBMS）。
5. 人员。

其中应用程序通过数据库管理系统访问数据库，数据库管理员通过计算机支持系统管理和维护数据库。图 6-3-2 表示 DBS 中应用程序与数据的关系。$kp$, section = '' where id = 23616;
update t_knowledge_point set title = $kp$数据库维护$kp$, content = $kp$由于数据库应用的特殊性，对数据库设计的评价、调整和修改等维护工作成为一项长期的任务，这些任务由数据库管理员（DBA）完成，包括：

1. 数据库的转储和恢复。
2. 数据库的安全控制。
3. 数据库完整性控制。
4. 数据库性能的监督、分析和改造。
5. 数据库的重组和重构。$kp$, section = '' where id = 23617;
update t_knowledge_point set title = $kp$数据库管理员（DBA）的职责和组织$kp$, content = $kp$数据库系统特别强调运行和维护过程中的组织和管理工作，在数据库系统设计和运行中设置了 DBA 的职责和组织，专门做好这一工作。

DBA 的主要职责如下：

1. 维护数据的完整性。
2. 综合运用 DBMS 所提供的各种措施，维护数据库安全。
3. 确定数据库的恢复策略，定期复制备份；当发生故障时，对数据库采取恢复措施。
4. 监视数据库性能，根据数据库的运行情况，确定数据库重组计划，并组织实施。
5. 在必要时进行数据库的重构。
6. 制定信息系统运行所必要的规章制度，并组织实施。

DBA 的任务十分繁重，大型信息系统的数据库管理和维护并不是一两个人所能完成的，DBA 是一个工作组。$kp$, section = '' where id = 23675;
update t_knowledge_point set title = $kp$物理结构设计$kp$, content = $kp$为给定的数据逻辑模式选取一个最适合应用要求的存储结构和存取路径，并把它用存储模式确定下来的过程，就是数据库的物理结构设计。

数据库物理结构设计有两个目标：

1. 提高数据库的性能。
2. 有效地利用存储空间。$kp$, section = '' where id = 23678;
update t_knowledge_point set title = $kp$物理结构设计的任务$kp$, content = $kp$反映数据关系模式的基本表对应于计算机外的存储文件，物理设计的任务是选取相应的文件存储结构和文件存取路径。$kp$, section = '' where id = 23679;
update t_knowledge_point set title = $kp$数据库系统概述$kp$, content = $kp$数据库系统（DBS）以统一管理和共享数据为主要特征，数据不再仅仅服务于某个应用或用户，而是按一定的结构存储于数据库中，作为共享资源，由数据库管理系统（DBMS）统一管理，使数据能为更多的应用和更多的用户服务。$kp$, section = '' where id = 23741;
update t_knowledge_point set title = $kp$数据库系统的发展历程$kp$, content = $kp$20 世纪 70 年代，以数据的集中管理和共享为特征的数据库系统逐步取代了文件系统，成为数据管理的主要形式。

80～90 年代，随着计算机网络、数据库技术和个人计算机的发展与普及，以信息为中心的计算机信息系统成为主流的计算机应用系统。

进入 21 世纪以来，因特网成为计算机应用的重要基础设施，基于网络和数据库的计算机信息系统已经广泛应用于各个行业和领域的信息化建设。$kp$, section = '' where id = 23756;
update t_knowledge_point set title = $kp$C/S 模式的数据库访问$kp$, content = $kp$1. 数据库要为多用户（分散远程）服务，与数据库不在同一计算机上，必须通过网络访问数据库。
2. 相关查询的二维表存储在多台计算机的多个不同数据库中，要求用 SQL 命令访问不同的数据库。

查询过程：客户机向数据库服务器发送查询 SQL 语句，数据库服务器执行后把查询结果（如男学生选课表）返回给客户机。$kp$, section = '' where id = 23778;
update t_knowledge_point set title = $kp$C/S 模式的优点$kp$, content = $kp$1. 网络只传输查询语句和查询结果，不必将要使用的二维表传输到客户机，减少网络数据传输量，提高系统效率。
2. 客户机上可以独立存放各自的应用程序，对其修改不影响其他用户的使用。$kp$, section = '' where id = 23871;
update t_knowledge_point set title = $kp$数据库管理系统（DBMS）$kp$, content = $kp$1. 是信息系统资源管理层中的重要部分，是操纵和管理数据库的大型软件。
2. 任务：统一管理和控制数据库的建立、运用和维护，支持用户定义数据和操纵数据，并保证数据安全性、完整性、多用户并发使用及数据库恢复。
3. 功能：可使多个应用程序和用户建立、修改和查询数据库，包括定义数据库的结构、提供交互式查询、组织与存取数据库中的数据、生成用户事务的程序代码、管理数据库事务运行、为维护数据库提供工具。
4. 代表性产品：Oracle、DB2、SQL Server、Access、VFP，以及自由软件 MySQL 和 PostgreSQL 等。$kp$, section = '' where id = 23902;
update t_knowledge_point set title = $kp$数据库系统知识结构$kp$, content = $kp$本页为数据库系统的知识结构图，包含以下要点：

- 数据库管理员：负责数据库的更新与维护。
- 数据库（DB）由数据库管理系统（DBMS）管理。
- DBMS 是控制和管理数据库的大型软件，通过 ODBC 等接口与应用软件连接。
- DBMS 的任务是统一管理和控制数据库的建立和应用，保证数据的安全性、完整性及数据库的可靠性。
- DBMS 支持并发性，允许许多应用程序和用户同时使用数据库。
- 用户通过 SQL 查询命令获得结果数据。
- 代表产品：Oracle、DB2、SQL Server、Access、VFP 等。$kp$, section = '' where id = 23923;
update t_knowledge_point set title = $kp$数据库系统的特点$kp$, content = $kp$1. 数据结构化。
2. 数据共享性高，冗余度低。
3. 数据独立于程序。

数据的逻辑独立性：应用程序与数据库的逻辑结构相互独立。

数据的物理独立性：应用程序与数据库的存储结构相互独立。

4. 统一管理和控制数据。$kp$, section = '' where id = 24009;
update t_knowledge_point set title = $kp$数据库系统的组成$kp$, content = $kp$数据库系统（DBS）是用户可以定义、创建和维护数据库以及提供对数据库有限制的访问的软件系统，由以下部分组成：

- 数据库（DB）。
- 数据库管理系统（DBMS）。
- 应用（Application）：使用数据库的应用程序。
- 人员：包括普通用户和数据库管理员（DBA）。
- 硬件。$kp$, section = '' where id = 24011;
update t_knowledge_point set title = $kp$数据库（DB）$kp$, content = $kp$1. 属于信息系统结构的资源管理层。
2. 是长期存放数据的“仓库”——外存储器。
3. 数据可以“共享”——供各类用户和程序使用。
4. 数据按一定方式组织——数据模型。$kp$, section = '' where id = 24015;
update t_knowledge_point set title = $kp$数据管理技术的发展阶段$kp$, content = $kp$数据管理技术的发展经历三个阶段：

1. 人工管理阶段（20 世纪 40 年代中至 50 年代中）。
2. 文件系统阶段（50 年代末至 60 年代中）。
3. 数据库系统阶段（60 年代末至今）。$kp$, section = '' where id = 24016;
update t_knowledge_point set title = $kp$基于数据库的信息系统的特点$kp$, content = $kp$1. 数据结构化，面向全局应用。
2. 数据共享，冗余度低，数据具有一致性。
3. 应用与数据相互独立。
4. 统一管理和控制。$kp$, section = '' where id = 24050;
update t_knowledge_point set title = $kp$数据库的定义$kp$, content = $kp$数据库是指按一定的数据模型组织、长期存放在外存上的一组可共享的相关数据集合。（判断：正确）$kp$, section = '' where id = 24068;
update t_knowledge_point set title = $kp$C/S 数据库查询过程$kp$, content = $kp$客户机面向用户，应用表现层和业务逻辑层（应用程序）均位于客户机中。客户机在屏幕上显示查询表单，接受用户的查询任务，然后执行相应的应用程序。当执行遇到 SQL 语句时，表示需要对数据库进行操作，客户机将该任务通过网络委托给数据库服务器执行，完成对数据库的查询（过程与单机以 SQL 命令直接访问数据库相同）。$kp$, section = '' where id = 24099;
update t_knowledge_point set title = $kp$数据库系统的组成$kp$, content = $kp$数据库系统由应用程序、计算机支持系统（硬件支持环境、软件支持环境，包括操作系统）、数据库、数据库管理系统和人员组成。

数据库（DB）：长期储存在计算机内、有组织、可共享的数据集合。数据库中还存放“元数据”，它们是有关数据库的定义信息，如数据类型、模式结构、使用权限等，这些数据的集合称为数据字典。

数据库管理系统（DBMS）：一种操纵和管理数据库的大型软件，其任务是统一管理和控制整个数据库的建立、运用和维护，使用户能方便地定义数据和操纵数据，并保证数据的安全性、完整性、多用户对数据的并发使用及发生故障后的数据库恢复。用户可以通过 DBMS 访问数据库中的数据，数据库管理员（DBA）也通过 DBMS 进行数据库的维护工作。对数据库的一切操作都是通过 DBMS 进行的。

现在流行使用的数据库管理系统有多种，比较具有代表性的有：Oracle、DB2、SQL Server、Access、VFP、MySQL（自由软件）和 PostgreSQL（自由软件）等。

人员：包括最终用户和数据库管理员（DBA）。$kp$, section = '' where id = 25050;
update t_knowledge_point set title = $kp$数据库及其特点$kp$, content = $kp$- 数据库：存放数据的仓库，是存储在计算机内有结构的数据集合，按一定的数据结构组织、存储和管理。
- 数据库的特点：较小的冗余度、数据独立性、数据完整性、共享性；所有操作都由 DBMS 进行。$kp$, section = '' where id = 25321;
update t_knowledge_point set title = $kp$数据库的体系结构：三级模式与两级映射$kp$, content = $kp$- 三级模式
  - 外模式（用户模式）：外模式/模式映像确定逻辑独立性。
  - 模式：描述全局数据的逻辑结构和特征。
  - 内模式：模式/内模式映像确定物理独立性。
- 两级映射：外模式/概念模式、概念模式/内模式。
- SQL 数据库的三级体系结构由外模式、模式和内模式构成：
  - 外模式 = 子模式 = 用户模式 = 局部模式 = 视图，一个数据库可以有多个外模式。
  - 模式 = 逻辑模式 = 基本表，一个数据库只有一个模式。
  - 内模式 = 存储模式 = 文件，一个数据库只有一个内模式。$kp$, section = '' where id = 25322;
update t_knowledge_point set title = $kp$数据库系统（DBS）$kp$, content = $kp$- 特点
  - 数据结构化（二维表结构，存储在数据库中）。
  - 数据共享性高。
  - 冗余度低。
  - 数据独立于程序，即数据独立性：包括逻辑独立性和物理独立性，物理独立性指应用程序独立于数据的物理结构。
  - 由 DBMS 统一管理和控制数据。
- 组成
  - 应用程序。
  - 操作系统。
  - 数据库（DB）。
  - 数据库管理系统（DBMS），是核心软件。
  - 数据库管理员（DBA），负责建设、维护、管理和恢复。
- DBS 操作的基本单位是事务，由若干有序的 SQL 语句组成。
- 层次：用户 → 应用程序 → 数据库管理系统 → 操作系统 → 数据库。$kp$, section = '' where id = 25327;
update t_knowledge_point set title = $kp$数据库管理系统（DBMS）与数据库访问模式$kp$, content = $kp$- DBMS 的作用：方便用户使用和管理数据库的系统软件；保证数据的安全性和完整性；故障后的数据恢复；支持多用户对数据的并发使用。
- DBMS 的功能：定义数据库的结构、组织和存取数据库中的数据；提供交互式查询；管理数据库事务运行；提供维护工具。
- 产品：Oracle、IBM DB2、Microsoft SQL Server、Access、VFP、自由软件 MySQL、PostgreSQL。
- 数据库的访问模式
  - C/S 模式（客户机/服务器模式）：客户机面向用户，应用表现层和业务逻辑层位于客户机，数据库服务在服务器端，适合客户机数量和应用程序固定的信息系统。
  - B/S 模式（浏览器/服务器模式）：第一层为客户层，由浏览器承担应用表现层的作用；中间层为业务逻辑层，包括 Web 服务器（接收浏览器请求、查询本地数据、返回动态数据给浏览器）和应用服务器（运行含应用程序的动态网页、生成动态数据）；第三层为数据库服务器层，接受 SQL 查询请求；ODBC/JDBC 是上层访问数据库的标准接口（应用程序接口 API）。
  - 混合模式：以上两种技术结合。$kp$, section = '' where id = 25330;
update t_knowledge_point set title = $kp$数据库（DB）$kp$, content = $kp$数据库是存放数据的仓库，只不过这个仓库是在计算机存储设备上，而且数据是按一定的格式存放的。

人们收集并抽取出一个应用所需要的大量数据之后，应将其保存起来，以供进一步加工处理，抽取有用信息。过去人们把数据存放在文件柜里，现在人们借助计算机和数据库技术科学地保存和管理大量复杂的数据，以便能方便而充分地利用这些宝贵的信息资源。

严格地讲，数据库是长期储存在计算机内、有组织的、可共享的大量数据的集合。数据库中的数据按一定的数据模型组织、描述和储存，具有较小的冗余度、较高的数据独立性和易扩展性，并可为各种用户共享。

概括地讲，数据库数据具有永久存储、有组织和可共享三个基本特点。$kp$, section = '' where id = 26298;
update t_knowledge_point set title = $kp$数据库系统的组成$kp$, content = $kp$数据库系统（DBS）是由数据库、数据库管理系统（及其应用开发工具）、应用程序和数据库管理员（DBA）组成的存储、管理、处理和维护数据的系统。数据库的建立、使用和维护等工作只靠一个数据库管理系统远远不够，还要有专门的人员来完成，这些人被称为数据库管理员。

其中数据库提供数据的存储功能，数据库管理系统提供数据的组织、存取、管理和维护等基础功能，数据库应用系统根据应用需求使用数据库，数据库管理员负责全面管理数据库系统。

在一般不引起混淆的情况下，人们常常把数据库系统简称为数据库。$kp$, section = '' where id = 26300;
update t_knowledge_point set title = $kp$数据的共享性高、冗余度低且易扩充$kp$, content = $kp$数据库系统从整体角度看待和描述数据，数据不再面向某个应用而是面向整个系统，因此数据可以被多个用户、多个应用共享使用。数据共享可以大大减少数据冗余，节约存储空间，还能够避免数据之间的不相容性与不一致性。

所谓数据的不一致性，是指同一数据不同副本的值不一样。采用人工管理或文件系统管理时，由于数据被重复存储，当不同的应用使用和修改不同的副本时就很容易造成数据的不一致。在数据库中，数据共享减少了由于数据冗余造成的不一致现象。

由于数据面向整个系统，是有结构的数据，不仅可以被多个应用共享使用，而且容易增加新的应用，这就使得数据库系统弹性大、易于扩充，可以适应各种用户的要求。可以选取整体数据的各种子集用于不同的应用系统，当应用需求改变或增加时，只要重新选取不同的子集或加上一部分数据便可以满足新的需求。$kp$, section = '' where id = 26302;
update t_knowledge_point set title = $kp$数据独立性高$kp$, content = $kp$数据独立性是借助数据库管理数据的一个显著优点，已成为数据库领域中的常用术语和重要概念，包括数据的物理独立性和逻辑独立性。

物理独立性是指用户的应用程序与数据库中数据的物理存储是相互独立的。也就是说，数据在数据库中怎样存储由数据库管理系统管理，用户程序不需要了解，应用程序要处理的只是数据的逻辑结构，这样当数据的物理存储改变时应用程序不用改变。

逻辑独立性是指用户的应用程序与数据库的逻辑结构是相互独立的。也就是说，数据的逻辑结构改变时用户程序也可以不变。

数据独立性是由数据库管理系统提供的二级映像功能来保证的。数据与程序的独立把数据的定义从程序中分离出去，加上存取数据的方法又由数据库管理系统负责提供，从而简化了应用程序的编制，大大减少了应用程序的维护和修改。$kp$, section = '' where id = 26303;
update t_knowledge_point set title = $kp$数据由数据库管理系统统一管理和控制$kp$, content = $kp$数据库的共享会带来安全隐患，而数据库的共享是并发共享，即多个用户可以同时存取数据库中的数据，甚至可以同时存取同一个数据，这又会带来不同用户间相互干扰的隐患。另外，数据库中数据的正确与一致也必须得到保障。为此，数据库管理系统还必须提供以下几方面的数据控制功能。

1. 数据的安全性保护：保护数据以防止不合法使用造成的数据泄密和破坏，每个用户只能按规定对某些数据以某些方式进行使用和处理。
2. 数据的完整性检查：数据的完整性指数据的正确性、有效性和相容性，完整性检查将数据控制在有效的范围内，并保证数据之间满足一定的关系。
3. 并发控制：当多个用户的并发进程同时存取、修改数据库时，可能会发生相互干扰而得到错误的结果，或使数据库的完整性遭到破坏，因此必须对多用户的并发操作加以控制和协调。
4. 数据库恢复：计算机系统的硬件故障、软件故障、操作员的失误以及故意破坏也会影响数据库中数据的正确性，甚至造成数据库部分或全部数据的丢失，数据库管理系统必须具有将数据库从错误状态恢复到某一已知的正确状态（完整状态或一致状态）的功能。

综上所述，数据库是长期存储在计算机内有组织、大量、共享的数据集合，可以供各种用户共享，具有最小冗余度和较高的数据独立性。数据库管理系统在数据库建立、运用和维护时对数据库进行统一控制，以保证数据的完整性和安全性，并在多用户同时使用数据库时进行并发控制，在发生故障后对数据库进行恢复。

数据库系统的出现使信息系统从以加工数据的程序为中心转向围绕共享的数据库为中心的新阶段，既便于数据的集中管理，又能简化应用程序的研制和维护，提高了数据的利用率和相容性，提高了决策的可靠性。$kp$, section = '' where id = 26304;
update t_knowledge_point set title = $kp$DBMS 是数据库系统的核心系统软件$kp$, content = $kp$DBMS 是数据库系统的核心系统软件。$kp$, section = '' where id = 27360;
update t_knowledge_point set title = $kp$DBMS 的任务$kp$, content = $kp$DBMS 的任务就是统一管理和控制整个数据库的建立、运行和维护，使用户能方便地定义数据和操纵数据，并保证数据的安全性、完整性、多用户的并发控制和发生故障后的数据恢复。$kp$, section = '' where id = 27632;
update t_knowledge_point set title = $kp$常用的数据库管理系统$kp$, content = $kp$现在流行的数据库管理系统有：Oracle、DB2、Microsoft SQL Server、Access、VFP、PostgreSQL（自由软件）等。$kp$, section = '' where id = 27633;
update t_knowledge_point set title = $kp$数据库管理员（DBA）的职责$kp$, content = $kp$数据库的更新和维护、数据库的监护和安全控制，须由 DBA 负责，必要时还要进行数据库的重组甚至重构。$kp$, section = '' where id = 27634;
update t_knowledge_point set title = $kp$数据库系统的特点$kp$, content = $kp$数据库系统的特点是统一管理和共享数据。$kp$, section = '' where id = 27635;
update t_knowledge_point set title = $kp$数据的逻辑独立性$kp$, content = $kp$数据的逻辑独立性：应用程序独立于数据库的逻辑结构。$kp$, section = '' where id = 27636;
update t_knowledge_point set title = $kp$数据的物理独立性$kp$, content = $kp$数据的物理独立性：应用程序独立于数据的物理存储结构（磁盘中的数据库）。$kp$, section = '' where id = 27637;
update t_knowledge_point set title = $kp$DBMS 在数据库系统中的地位$kp$, content = $kp$DBMS（数据库管理系统）是数据库系统的核心软件，用户和应用程序通过 DBMS 访问数据库中的数据。$kp$, section = '' where id = 27651;
update t_knowledge_point set title = $kp$数据库的三级体系结构$kp$, content = $kp$数据库的三级体系结构由外模式、模式和内模式构成。$kp$, section = '' where id = 27652;
update t_knowledge_point set title = $kp$外模式$kp$, content = $kp$外模式也称子模式、用户模式或视图。① 外模式是数据库用户能够看见和使用的局部数据的逻辑结构。② 外模式通常是模式的子集。③ 一个数据库通常可以有多个外模式。$kp$, section = '' where id = 27653;
update t_knowledge_point set title = $kp$模式$kp$, content = $kp$模式也称逻辑模式或基本表。① 一个数据库只有一个模式。② 模式是数据库中全体数据的逻辑结构和特征的描述，是所有用户的公共数据视图。③ 数据库模式以某一种数据模型为基础，统一综合地考虑所有用户的需求，有机地结合成一个逻辑整体。$kp$, section = '' where id = 27654;
update t_knowledge_point set title = $kp$内模式$kp$, content = $kp$内模式也称存储模式。① 一个数据库只有一个内模式。② 内模式是数据物理结构和存储方式的描述，是数据在数据库内部的表示方式。$kp$, section = '' where id = 27655;
update t_knowledge_point set title = $kp$常见的数据库管理系统$kp$, content = $kp$数据库管理系统（DBMS）的常见产品：ORACLE、Visual FoxPro、Access、SQL Server。$kp$, section = '' where id = 28361;
update t_knowledge_point set title = $kp$模式与内模式映像保证物理独立性$kp$, content = $kp$模式与内模式之间的映像保证了数据的物理独立性。$kp$, section = '' where id = 28365;
update t_knowledge_point set title = $kp$数据字典$kp$, content = $kp$数据字典（DD）是系统中各类数据的定义和描述的集合，对数据流程图中的数据项、数据结构、数据流、处理逻辑、数据存储和外部实体等做出定义。$kp$, section = '' where id = 28366;
update t_knowledge_point set title = $kp$数据库系统的组成$kp$, content = $kp$数据库系统（DBS）由数据库（DB）、数据库管理系统（DBMS）、数据库管理员（DBA）、应用程序和计算机支持系统等组成，即 DBS = DB + DBMS + DBA + …。$kp$, section = '' where id = 28372;
update t_knowledge_point set title = $kp$数据库系统的二级映像技术$kp$, content = $kp$内模式也称存储模式，与文件相对应。数据库系统的二级映像技术包括外模式与模式之间的映像、模式与内模式之间的映像；它不仅在三级数据模式之间建立联系，同时保证了数据的独立性。$kp$, section = '' where id = 28379;
update t_knowledge_point set title = $kp$数据库的整理与重组$kp$, content = $kp$DBA 负责数据库的整理、重组甚至重构等运行维护工作。$kp$, section = '' where id = 28417;
update t_knowledge_point set title = $kp$外模式/模式映像与逻辑独立性$kp$, content = $kp$外模式/模式映像保证数据的逻辑独立性：用户的应用程序与数据库的逻辑结构相互独立，当数据的逻辑结构发生改变时，应用程序不需要改变。逻辑独立性存在于外模式和模式之间。$kp$, section = '' where id = 29665;
update t_knowledge_point set title = $kp$数据共享性高、冗余度低$kp$, content = $kp$数据共享性高、冗余度低。例如学校信息系统中的学生信息只需一处存放，学校的各个部门（教务处、学生处、财务处等）都可以查询和使用，既节省了存储空间，又保证了数据的一致性。$kp$, section = '' where id = 29673;
update t_knowledge_point set title = $kp$数据库管理系统（DBMS）$kp$, content = $kp$数据库管理系统（DBMS）：1）是数据库系统的核心软件；2）基本功能包括数据定义、数据操作和数据库管理等；3）数据库的一切操作都通过 DBMS 进行。$kp$, section = '' where id = 29707;
update t_knowledge_point set title = $kp$数据独立性$kp$, content = $kp$数据独立于程序。1）逻辑独立性：用户的应用程序与数据库的逻辑结构相互独立，数据逻辑结构改变时应用程序不需要改变。2）物理独立性：用户的应用程序与存储在数据库中的数据相互独立，数据的物理存储改变不影响用户的应用程序。$kp$, section = '' where id = 29709;
update t_knowledge_point set title = $kp$数据库系统的用户接口与数据库控制$kp$, content = $kp$数据库系统具有良好的用户接口。数据库控制主要包括数据库系统的安全性、完整性和并发控制。$kp$, section = '' where id = 29710;
update t_knowledge_point set title = $kp$数据库系统的安全性$kp$, content = $kp$安全措施：1）用户标识与鉴别（用户名和口令）；2）访问控制（授权）；3）审计功能（追踪和监视）；4）数据加密（加密算法）；5）视图保护（对无权限的人隐藏数据）。数据库的备份和恢复：数据库系统使用冗余技术进行故障恢复；金融系统将本地数据传输到异地的数据中心备份，有利于信息安全和灾难恢复。$kp$, section = '' where id = 29711;
update t_knowledge_point set title = $kp$并发冲突的产生原因$kp$, content = $kp$在多用户共享的数据库系统中，多个事务可能同时对同一数据进行操作，这就不可避免地产生冲突。$kp$, section = '' where id = 29713;
update t_knowledge_point set title = $kp$数据库的特点$kp$, content = $kp$① 数据量大，属于海量信息、数据密集型应用。② 持久性：数据不随程序运行的结束而消失，永久保存在硬盘或光盘等外存中，而不是内存中。③ 共享性：数据可为许多应用程序或用户共享。④ 提供多种信息服务，如信息检索、统计报表、分析、控制、预测、决策等。$kp$, section = '' where id = 29772;
update t_knowledge_point set title = $kp$数据库管理员（DBA）$kp$, content = $kp$DBA 负责保护数据库系统的正常运行与服务质量，经常性的数据更新与维护、数据库的监护、安全控制等工作都由 DBA 完成，责任非常重大。$kp$, section = '' where id = 29774;
update t_knowledge_point set title = $kp$数据库管理系统的性质与产品$kp$, content = $kp$DBMS 是一个系统软件，是操纵、管理大型数据库的大型软件。用户只有通过 DBMS 才能访问数据库中的数据；DBA 也只有通过 DBMS 才能对数据库进行管理与维护，不允许绕过 DBMS 直接访问数据。DBMS 不一定都是关系数据库系统；关系数据库系统（RDBMS）是采用关系模型的数据库。常见的关系型数据库系统有 ORACLE、DB2、Microsoft SQL Server、Access、VFP、Sybase、MySQL、PostgreSQL 等。$kp$, section = '' where id = 29776;
update t_knowledge_point set title = $kp$应用程序、DBMS、操作系统与数据库的关系$kp$, content = $kp$基于数据库的信息系统中，应用程序、DBMS、操作系统（OS）与数据库（DB）之间是逐层调用关系：应用程序 → DBMS → OS → DB，箭头表示访问或调用。$kp$, section = '' where id = 29777;
update t_knowledge_point set title = $kp$基于数据库的信息系统的特点$kp$, content = $kp$① 数据结构化，用二维表格来描述与定义数据。② 数据共享性高、冗余度低，但不能完全消除冗余，只能减少或降低冗余。③ 应用程序与数据相互独立。④ 数据由 DBMS 统一管理与控制。$kp$, section = '' where id = 29778;
update t_knowledge_point set title = $kp$数据库管理系统的功能$kp$, content = $kp$① 数据库定义功能：通过 DDL（数据定义语言）定义数据库的结构。② 数据库存取功能：通过 DML（数据操作语言）查询、插入、删除、更新数据。③ 数据库管理功能：对数据进行安全控制、完整性控制和故障恢复。$kp$, section = '' where id = 29779;
update t_knowledge_point set title = $kp$数据库系统（DBS）的组成$kp$, content = $kp$数据库系统（DBS）由应用程序、计算机支持系统、数据库、数据库管理系统和数据库管理员组成。$kp$, section = '' where id = 29817;
update t_knowledge_point set title = $kp$数据库的物理结构设计$kp$, content = $kp$物理结构设计：确定数据库在外存上的存储结构和存取方法，依赖硬件，目标是提高数据库性能并有效利用存储空间。设计阶段涉及三个模型：概念模型、逻辑模型和物理模型；E-R 图独立于后续的一切设计。$kp$, section = '' where id = 29891;
update t_knowledge_point set title = $kp$数据库系统的构成要素$kp$, content = $kp$数据库管理员（DBA）是数据库系统的重要组成部分，DBS = DB + DBMS + DBA + …。$kp$, section = '' where id = 29904;
update t_knowledge_point set title = $kp$并发控制$kp$, content = $kp$并发控制：处理多用户对数据的并发使用，以及发生故障后数据库的恢复。常见的数据库管理系统有 ORACLE、DB2、Microsoft SQL Server、MySQL（自由软件）、Access、VFP、PostgreSQL（自由软件）等。$kp$, section = '' where id = 29905;
update t_knowledge_point set title = $kp$数据库系统的分析与设计方法$kp$, content = $kp$系统分析方法：数据流程图（DFD）和数据字典。数据字典除存储用户直接使用的数据外，还存储另一类“元数据”，即有关数据库的定义信息，如数据类型、模式结构、使用权限等。系统设计：概念结构设计、逻辑结构设计和物理结构设计。系统实施：数据库和应用程序的调试、系统测试和数据库的运行。系统测试：模块测试、组装测试（系统测试）和确认测试（验收测试）。数据库运行和维护的内容：纠正性维护、适应性维护和完善性维护。系统开发采用自顶向下规划分析、自底向上规划实现。$kp$, section = '' where id = 29944;
update t_knowledge_point set title = $kp$DBMS 支持多用户共享访问$kp$, content = $kp$DBMS 提供多种功能，可使多个应用程序和用户用不同的方法在同一时刻或不同时刻建立、修改和查询数据库。$kp$, section = '' where id = 29961;
update t_knowledge_point set title = $kp$数据冗余度的控制$kp$, content = $kp$在数据库中降低数据存储冗余度可以节省存储空间、保证数据的一致性，但数据库的数据冗余度不能完全消除，只能减少或降低，不必也不应追求零冗余。$kp$, section = '' where id = 29962;
update t_knowledge_point set title = $kp$数据库系统的人员$kp$, content = $kp$① 数据库管理员（DBA）：解决系统设计、运行中出现的问题，并对数据库进行有效管理和控制的专门人员。② 系统分析设计员。③ 用户。$kp$, section = '' where id = 29980;
update t_knowledge_point set title = $kp$数据库系统的用户接口$kp$, content = $kp$数据库系统具有良好的用户接口。数据库控制包括数据库系统的安全性、完整性和并发控制等方面。$kp$, section = '' where id = 29982;
update t_knowledge_point set title = $kp$二级映像与数据独立性$kp$, content = $kp$内模式也称存储模式，与文件相对应。数据库系统的二级映像技术包括外模式与模式之间的映像、模式与内模式之间的映像；它不仅在三级模式之间建立联系，同时保证了数据的独立性。$kp$, section = '' where id = 30247;
update t_knowledge_point set title = $kp$DBMS 的数据控制功能$kp$, content = $kp$DBMS 一般都具有数据安全性、完整性、并发控制和故障恢复功能，由此实现对数据的统一管理和控制。$kp$, section = '' where id = 30254;
update t_knowledge_point set title = $kp$常用的数据库管理系统$kp$, content = $kp$现在流行的数据库管理系统有：Oracle、DB2、Microsoft SQL Server、MySQL（自由软件）、Access、VFP、PostgreSQL（自由软件）等。

数据库系统（DBS）由应用程序、计算机支持系统、数据库、数据库管理系统和人员组成。$kp$, section = '' where id = 32053;
update t_knowledge_point set title = $kp$数据库（DB）$kp$, content = $kp$数据库（DB）：按一定数据模型组织并长期存放在外存上的可共享的相关数据的集合。$kp$, section = '' where id = 32054;
update t_knowledge_point set title = $kp$数据库管理系统（DBMS）$kp$, content = $kp$数据库管理系统（DBMS）是系统软件，是数据库系统的核心软件；数据库的一切操作都是通过 DBMS 进行的。$kp$, section = '' where id = 32055;
update t_knowledge_point set title = $kp$B/S 模式的数据库访问$kp$, content = $kp$B/S 模式的数据库访问：浏览器—Web 服务器—数据库服务器。$kp$, section = '' where id = 32056;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22377,23607,23615,23616,23617,23675,23678,23679,23741,23756,23778,23871,23902,23923,24009,24011,24015,24016,24050,24068,24099,25050,25321,25322,25327,25330,26298,26300,26302,26303,26304,27360,27632,27633,27634,27635,27636,27637,27651,27652,27653,27654,27655,28361,28365,28366,28372,28379,28417,29665,29673,29707,29709,29710,29711,29713,29772,29774,29776,29777,29778,29779,29817,29891,29904,29905,29944,29961,29962,29980,29982,30247,30254,32053,32054,32055,32056) and not deleted) <> 77 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
