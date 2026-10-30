-- 知识点 152 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_152
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_152 as
select * from t_knowledge_point where id in (23510,23640,23694,23779,23804,23805,23941,24072,24721,26266,26267,26268,26269,26366,26390,26396,26564,26565,26824,27686,29731,29732,29786,30194);

update t_knowledge_point set title = $kp$MRP 系统$kp$, content = $kp$物料需求计划系统（Material Requirement Planning，MRP）从产品的结构，即物料清单（Bill of Material，BOM）出发，保证既不出现物料短缺，又不积压物料库存，用于解决制造业中缺件与超储之间的矛盾。

在计算机集成制造系统（CIMS）中，技术信息系统包括计算机辅助设计（CAD）、计算机辅助工艺规划（CAPP）、计算机辅助制造（CAM）、计算机数字控制（CNC）、计算机辅助质量管理（CAQ）等；管理信息系统包括物料需求计划系统（MRP）、制造资源计划系统（MRPⅡ）、企业资源计划（ERP）等。$kp$, section = '' where id = 23510;
update t_knowledge_point set title = $kp$闭环 MRP$kp$, content = $kp$早期的 MRP 应用将生产能力作业计划、车间作业计划和采购作业计划纳入其中，在计划执行过程中加入来自车间、供应商和计划人员的反馈信息，利用这些信息平衡、调整计划，使生产的全过程围绕物料需求计划形成一个统一的系统，称为闭环 MRP（Closed Loop MRP）。$kp$, section = '' where id = 23640;
update t_knowledge_point set title = $kp$ERP 系统与计算机集成制造系统$kp$, content = $kp$美国信息分析咨询公司 Gartner Group 在 MRPⅡ 的基础上提出了企业资源计划（Enterprise Resources Planning，ERP）的概念。ERP 扩展了企业管理信息集成的范围，在 MRPⅡ 的基础上增加了许多新功能。

ERP 系统除制造、供销和财务外，还集成了企业其他管理功能，如质量管理、设备维护管理、仓库管理、运输管理、项目管理、市场信息管理、金融投资管理、法规及标准管理，以及电子商务、过程控制接口、数据采集接口等，成为覆盖整个企业的管理信息系统。在 ERP 系统基础上还衍生出很多系统，新的 ERP 系统都是基于 Web 环境的。

计算机集成制造系统（Computer Integrated Manufacturing System，CIMS）是把人、经营知识及能力与信息技术、制造技术综合应用的过程，其目的是提高制造企业的生产率和灵活性，并将企业所有的人员、功能、信息和组织诸方面集成为一个整体。

MRPⅡ 和 ERP 是计算机集成制造系统的重要组成部分。如果说它们是企业信息系统的第一次集成，那么 CIMS 则是企业信息系统的第二次集成。$kp$, section = '' where id = 23694;
update t_knowledge_point set title = $kp$ERP$kp$, content = $kp$企业资源计划（ERP）出现于 20 世纪 90 年代。ERP 在管理业务系统的基础上进一步与辅助技术系统集成，发展为计算机集成制造系统（CIMS）。$kp$, section = '' where id = 23779;
update t_knowledge_point set title = $kp$MRP$kp$, content = $kp$物料需求计划（MRP）以物料清单（BOM）为基础，解决制造业中缺件与超储的矛盾。在 MRP 基础上加入财务子系统，实现资金流与物质流的统一管理，把制造、财务、销售、采购以及工程技术等各子系统综合为一个系统，即发展为 MRPⅡ。$kp$, section = '' where id = 23804;
update t_knowledge_point set title = $kp$MRPⅡ$kp$, content = $kp$制造资源计划系统（Manufacturing Resources Planning，MRPⅡ）出现于 20 世纪 80 年代，在闭环 MRP 的基础上把制造、财务、销售、采购以及工程技术等各子系统综合为一个系统，并把财务子系统与生产子系统结合起来，实现资金流与物质流的统一管理。$kp$, section = '' where id = 23805;
update t_knowledge_point set title = $kp$制造业信息系统的分类$kp$, content = $kp$制造业信息系统可分为技术信息系统和管理业务系统两类。技术信息系统包括计算机辅助设计（CAD）、计算机辅助工艺规划（CAPP）、计算机辅助制造（CAM）、计算机数字控制（CNC）、计算机辅助质量控制（CAQC）等；管理业务系统包括制造资源计划系统（MRPⅡ）、企业资源计划（ERP）等。二者集成构成计算机集成制造系统（CIMS）。$kp$, section = '' where id = 23941;
update t_knowledge_point set title = $kp$管理业务系统的演变$kp$, content = $kp$MRP：物料需求计划系统，从产品结构（BOM）出发，解决缺件与超储的矛盾。

闭环 MRP：将生产能力作业计划、车间作业和采购计划整合，并加入来自车间、供应商和计划人员的反馈信息，以此平衡调整计划，使生产的全过程围绕物料需求计划形成一个统一的系统。

MRPⅡ（20 世纪 80 年代）：加入财务子系统，实现资金流与物质流的统一管理，把制造、财务、销售、采购以及工程技术等各子系统综合为一个系统。

ERP（20 世纪 90 年代）：集成企业制造、供销、财务、质量、设备、仓库、运输、项目管理、市场信息、金融投资、法规标准等功能，以及电子商务、过程控制接口、数据采集接口等，成为覆盖整个企业的管理信息系统。

CIMS：管理业务系统进一步与辅助技术系统集成，发展为计算机集成制造系统。$kp$, section = '' where id = 24072;
update t_knowledge_point set title = $kp$MRPⅡ$kp$, content = $kp$20 世纪 80 年代，人们把制造、财务、销售、采购以及工程技术等各子系统综合为一个系统，称为制造资源计划系统（Manufacturing Resources Planning），记为 MRPⅡ。

MRPⅡ 把财务子系统与生产子系统结合到一起，实现资金流与物质流的统一管理。$kp$, section = '' where id = 24721;
update t_knowledge_point set title = $kp$制造业信息系统$kp$, content = $kp$信息产业的发展为信息技术的推广应用提供了物质装备和技术支持，信息技术在各行各业的应用又为信息产业发展开拓了市场，成为信息产业发展的动力源泉。通过多年来政府、行业组织和企业的共同努力，信息技术在传统产业中的应用也取得了显著进展：装备制造和工艺流程等企业信息技术应用进展迅速、作用显著。

计算机集成制造（Computer Integrated Manufacturing，CIM）用计算机将工厂中的自动化处理装置连接在一起，以减少设计时间、提高设备使用率、缩短制造周期、降低库存以及提高产品质量。$kp$, section = '' where id = 26266;
update t_knowledge_point set title = $kp$计算机辅助设计与制造$kp$, content = $kp$现在，计算机辅助设计（Computer Aided Design，CAD）和计算机辅助制造（Computer Aided Manufacturing，CAM）已经成为大多数制造系统的重要组成部分。使用 CAD 系统的产品设计人员和工程师们利用功能强大的计算机图形工作站工作。这种工作站配备了可以在显示器上绘制设计图的程序。通过操纵光笔、扫描仪或鼠标，设计人员可以定义产品的尺寸规格，并精确地显示它的线条、凹痕和其他特征。设计图上的每个元素都按照所定义的规格显示在屏幕上，可通过在设计图上添加、删除或修改细节来快速地做出修改。

CAD 工具通常以三维方式工作，设计人员可以在屏幕上定义并看到产品的长、宽、高。设计图可以被旋转、倾斜和颠倒，使设计人员从各个角度观察该产品。当完成了设计图之后，就把它存储到磁盘上，在任何时候都可以对其进行评审、编辑或打印。

CAD 设计图经常会输入到 CAM 系统中。CAM 系统借助信息技术实现了制造过程的自动化并对制造过程进行管理。CAM 软件通过 CAD 数据库来控制工厂中的工具和机器，制造出用 CAD 系统设计好的产品。$kp$, section = '' where id = 26267;
update t_knowledge_point set title = $kp$柔性制造$kp$, content = $kp$CAM 通过自动准备下一步工作所需要的机器，提高了整个制造过程的效率。将机器准备时间缩短 75%、同时使产品质量提高 75%~90% 的能力，就是柔性制造（Flexible Manufacturing）。更短的准备时间使较小的作业批量也能经济地生产，提供了更高的调度灵活性，同时还缩短了加工准备的时间。Flextronics（伟创力）作为全球第二大合同制造公司，即采用柔性制造模式组织生产。$kp$, section = '' where id = 26268;
update t_knowledge_point set title = $kp$机器人$kp$, content = $kp$机器人是一种由计算机控制、能够实际操纵周围环境的设备。在装配线上，抓放机器人（Pick-and-place Robots）通常可以设置为完成以下四个功能：移动到某个部件所在的位置，抓起该部件，移动到需要该部件的地方，放下该部件。目前正在研究的是更为复杂的机器人，能够通过各种传感器设备进行感知（直接从它们所处的环境中收集信息），并对信息进行分析，以确定应该采取的正确的行动路线。

计算机能力的提高和成本的下降，无疑会使机器人更先进、能力更强，但是还不能期望机器人会像在科幻电影中看到的那样神奇。目前业界还没有给机器人提供一个类似真人的外表，而且这样做起来也相当不容易。大多数机器人就像它们看上去的那样，是可编程的机器。有些机器人拥有操纵臂和抓爪（手臂和手指），另一些机器人有计算机视觉系统，但它们仍然是机器，既没有个性，也没有意志。$kp$, section = '' where id = 26269;
update t_knowledge_point set title = $kp$EPC 技术$kp$, content = $kp$电子产品代码（Electronic Product Code，EPC）系统在计算机、互联网和 RFID 技术的基础上，利用全球统一标识系统编码技术给每一个实体对象一个唯一的编码，构造了一个实现全球物品信息实时共享的实物互联网。

EPC 系统主要由 6 个方面组成：

1. EPC 编码标准；
2. EPC 标签；
3. 识读器；
4. 神经网络软件（如 Savant）；
5. 对象名解析服务（Object Naming Service，ONS）；
6. 实体标记语言（Physical Markup Language，PML）。$kp$, section = '' where id = 26366;
update t_knowledge_point set title = $kp$智能制造$kp$, content = $kp$智能工业是将具有环境感知能力的各类终端、基于泛在技术的计算模式、移动通信等不断融入工业生产的各个环节，大幅提高制造效率，改善产品质量，降低产品成本和资源消耗，将传统工业提升到智能化的新阶段。工业和信息化部制定的《物联网“十二五”发展规划》将智能工业应用示范工程归纳为：生产过程控制、生产环境监测、制造供应链跟踪、产品全生命周期监测，促进安全生产和节能减排。$kp$, section = '' where id = 26390;
update t_knowledge_point set title = $kp$货运管理系统$kp$, content = $kp$以高速道路网和信息管理系统为基础，利用物流理论进行管理的智能化物流管理系统。它综合利用卫星定位、地理信息系统、物流信息及网络技术有效组织货物运输，提高货运效率。$kp$, section = '' where id = 26396;
update t_knowledge_point set title = $kp$基于数字孪生的智慧研发$kp$, content = $kp$如今我国工业正向产业的高价值链环节迈进，工业产品的复杂度和集成度越来越高，设计更改频繁，模型一经修改，改变的内容还会影响到分析测试模型、生产模型、工程图等其他相关模型。利用数字孪生技术进行可视化建模，通过数字化模型的虚拟现实交互、仿真、快速成型，可及早发现设计缺陷，优化产品外形、尺寸和结构，克服以往被动、静态、单纯依赖人的经验的缺点，实现产品制造行业研发设计与生产过程在虚拟空间的实时监控和动态优化，促进制造资源的智能物联及共享协同，并有利于制造知识积累及高效重用。$kp$, section = '' where id = 26564;
update t_knowledge_point set title = $kp$基于柔性生产的大规模个性化定制$kp$, content = $kp$柔性生产是指让系统在制造过程中根据产品加工状况的改变自动进行调整，在原有自动化基础上实现系统的自适应功能，实现制造过程的最优智能决策。企业通过外部平台采集客户个性化需求数据，与工业企业生产数据、外部环境数据相融合，将产品的共性特征数据与收集到的客户定制化数据结合，转换成个性化的产品模型；并将产品方案、物料清单、工艺方案等数据信息通过制造执行系统快速传递给生产现场，据此进行生产线调整和物料准备，保证样式、颜色、尺寸、物料等产品全生命周期各个环节都满足个性化定制需求，快速生产出符合个性化需求的定制化产品。$kp$, section = '' where id = 26565;
update t_knowledge_point set title = $kp$制造业信息系统$kp$, content = $kp$制造信息系统是为生产职能提供信息的管理信息系统。这些信息中大部分由组织中的会计信息系统提供，如存货统计和成本信息；其他信息必须从组织的环境中收集，环境信息包括原材料数据、潜在的新供应商资料和新生产技术的信息。$kp$, section = '' where id = 26824;
update t_knowledge_point set title = $kp$完善性维护与 CIMS$kp$, content = $kp$完善性维护包括数据转储，以及为提高系统性能对系统和应用程序所做的修改等。

CIMS 即计算机集成制造系统。$kp$, section = '' where id = 27686;
update t_knowledge_point set title = $kp$CIMS 是企业各类信息系统的集成$kp$, content = $kp$计算机集成制造系统（CIMS）是企业各类信息系统的集成（技术信息系统和管理信息系统），也是企业活动全过程中各功能的整合。$kp$, section = '' where id = 29731;
update t_knowledge_point set title = $kp$MRPⅡ、ERP 是第一次集成，CIMS 是第二次集成$kp$, content = $kp$MRPⅡ、ERP 是企业信息系统的第一次集成，CIMS 是企业信息系统的第二次集成。$kp$, section = '' where id = 29732;
update t_knowledge_point set title = $kp$CIMS 的组成$kp$, content = $kp$CIMS（计算机集成制造系统）包含两部分：

1. 技术信息系统，包括 CAD（计算机辅助设计）、CAPP（计算机辅助工艺规划）、CAM（计算机辅助制造）等；
2. 管理信息系统，包括 MRPⅡ（制造资源计划系统）、ERP（企业资源计划）。$kp$, section = '' where id = 29786;
update t_knowledge_point set title = $kp$业务管理系统的构成$kp$, content = $kp$业务管理系统包括 MRP（物料需求计划系统）、MRPⅡ（制造资源计划系统，在 MRP 基础上加入了财务子系统）、ERP（企业资源计划系统）。技术信息系统则包括计算机数字控制（CNC）、计算机辅助质量管理（CAQ）等，二者共同构成计算机集成制造系统（CIMS）。$kp$, section = '' where id = 30194;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (23510,23640,23694,23779,23804,23805,23941,24072,24721,26266,26267,26268,26269,26366,26390,26396,26564,26565,26824,27686,29731,29732,29786,30194) and not deleted) <> 24 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
