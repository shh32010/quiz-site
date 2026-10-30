-- 知识点 210 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_210
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_210 as
select * from t_knowledge_point where id in (22608,22662,22912,23646,23697,24042,24114,24115,24300,24308,24327,24361,27101,28434,28464,28607,28608,30060);

update t_knowledge_point set title = $kp$深度优先策略$kp$, content = $kp$深度优先策略是指网络爬虫从起始页开始，沿着链接一个接一个地跟踪下去，直到不能再深入为止。爬虫完成一个爬行分支后，返回到上一链接节点进一步搜索其他链接；当所有链接遍历完后，爬行任务结束。这种策略比较适合垂直搜索或站内搜索，但在爬行页面内容层次较深的站点时会造成资源的巨大浪费。以图为例，遍历路径为 1→2→5→6→3→7→4→8。$kp$, section = '' where id = 22608;
update t_knowledge_point set title = $kp$互联网数据采集$kp$, content = $kp$通过网络爬虫或网站公开 API 等方式从网站上获取数据信息，该方法可以把数据从网页中抽取出来，并将其存储为统一的本地数据文件。$kp$, section = '' where id = 22662;
update t_knowledge_point set title = $kp$网络爬虫$kp$, content = $kp$网络爬虫又称“网络蜘蛛”（Web Spider）、“蚂蚁”（Ant）、“自动检索工具”（Automatic Indexer）。它是一种机器人程序，作用是自动采集所有可以到达的网页，并记录这些网页的内容，以便其他程序进行后续处理。例如，搜索引擎可以对已爬取的网页进行分拣、归类，使用户可以更快地检索。$kp$, section = '' where id = 22912;
update t_knowledge_point set title = $kp$APP 移动端数据采集$kp$, content = $kp$APP 是获取用户移动端数据的一种有效方法。APP 中的 SDK 插件可以将用户使用 APP 的信息汇总给指定服务器；即便用户没有访问，也能获知用户终端的相关信息，包括安装应用的数量和类型等。$kp$, section = '' where id = 23646;
update t_knowledge_point set title = $kp$与数据服务机构合作$kp$, content = $kp$数据服务机构通常具备规范的数据共享和交易渠道，人们可以在平台上快速、明确地获取自己所需的数据。$kp$, section = '' where id = 23697;
update t_knowledge_point set title = $kp$残缺数据$kp$, content = $kp$这类数据主要因部分信息缺失而产生，如公司名称、客户区域信息缺失，或业务系统中主表与明细表不能匹配等。应将这类数据过滤出来，按缺失内容分别填入对应的文档信息并提交给客户，在规定时间内补全后才可写入数据仓库。$kp$, section = '' where id = 24042;
update t_knowledge_point set title = $kp$重复数据$kp$, content = $kp$重复数据多出现在维护表中，可将重复数据记录的所有字段导出，让客户确认并整理。数据清理通过填写无效值和缺失值、平滑噪声数据、识别或删除离群点、解决不一致性来“清理”数据，主要达到格式标准化、异常数据消除、错误纠正、重复数据清除等目的；也就是将数据库中所存数据精细化，去除重复无用数据，并使剩余数据转化成标准可接受的格式。$kp$, section = '' where id = 24114;
update t_knowledge_point set title = $kp$错误数据$kp$, content = $kp$这类错误往往源于业务系统不够健全，在接收输入信息后未作判断就直接写入后台数据库，例如数值数据被输成全角数字字符、字符串数据后带有回车符、日期格式不正确等。此类数据也需分类处理：对于全角字符、数据前后存在不可见字符等问题，只能编写 SQL 语句查找出来，让客户修正后再抽取；日期格式错误会导致 ETL 运行失败，需要到业务系统数据库中用 SQL 挑出，修正后再抽取。$kp$, section = '' where id = 24115;
update t_knowledge_point set title = $kp$系统日志采集$kp$, content = $kp$可以使用海量数据采集工具进行系统日志采集，如 Hadoop 的 Chukwa、Cloudera 的 Flume、Facebook 的 Scribe 等。$kp$, section = '' where id = 24300;
update t_knowledge_point set title = $kp$广度优先策略$kp$, content = $kp$广度优先策略按照网页内容目录层次的深浅来爬行页面，处于较浅目录层次的页面首先被爬行；当同一层次中的页面爬行完毕后，爬虫再深入下一层继续爬行。仍以上图为例，遍历路径为 1→2→3→4→5→6→7→8。$kp$, section = '' where id = 24308;
update t_knowledge_point set title = $kp$日志数据收集工具 Flume$kp$, content = $kp$Flume 是由 Cloudera 开发维护的分布式、高可靠、高可用、适合复杂环境下大规模日志数据采集的系统。$kp$, section = '' where id = 24327;
update t_knowledge_point set title = $kp$数据预处理$kp$, content = $kp$获取数据后，一般要对原始数据进行清理、集成与变换等一系列预处理工作，才能达到获取数据价值的最低规范。常见方法有数据清洗、数据集成与数据变换。数据清洗（Data Cleaning）是数据预处理的首要方法，其过程一般包括填补遗漏的数据值、平滑有噪声的数据、识别或除去异常值，以及解决数据不一致等问题。数据集成（Data Integration）是将多个不同数据源的数据合并在一起形成一致的数据存储，例如将不同数据库中的数据集成到一个数据库中存储。数据变换（Data Transformation）是将数据转换或统一成适合挖掘的形式，通常包括平滑处理、聚集处理、数据泛化处理、规格化和属性构造等方式。$kp$, section = '' where id = 24361;
update t_knowledge_point set title = $kp$数据清洗的基本方法$kp$, content = $kp$数据清洗的基本方法：① 定义和确定错误的类型；② 搜寻并识别错误的实例；③ 纠正所发现的错误。$kp$, section = '' where id = 27101;
update t_knowledge_point set title = $kp$网络爬虫的作用$kp$, content = $kp$Web 网络爬虫可以自动采集所有能够访问到的页面内容，为搜索引擎和大数据分析提供数据来源。$kp$, section = '' where id = 28434;
update t_knowledge_point set title = $kp$不符合要求的数据类别$kp$, content = $kp$不符合要求的数据类别：① 不完整的数据；② 异常的数据；③ 重复的数据。

数据分析是整个大数据处理流程的核心，大数据的价值产生于分析过程。数据分析是指用准确适宜的分析方法和工具分析经过处理的数据，提取有价值的信息，进而形成有效结论并通过可视化技术展现出来的过程。

数据挖掘是在海量数据中找到有价值的数据，其价值通常包括相关性、趋势和特征。$kp$, section = '' where id = 28464;
update t_knowledge_point set title = $kp$爬虫的功能$kp$, content = $kp$爬虫一般具有数据采集、处理和存储 3 部分功能。$kp$, section = '' where id = 28607;
update t_knowledge_point set title = $kp$数据清洗$kp$, content = $kp$数据清洗是指消除数据中存在的噪声及纠正其不一致的错误。$kp$, section = '' where id = 28608;
update t_knowledge_point set title = $kp$建立数据挖掘库$kp$, content = $kp$建立数据挖掘库包括：数据收集、数据描述、选择、数据质量评估和数据清洗、合并与整合、构建元数据、加载数据挖掘库、维护数据挖掘库。$kp$, section = '' where id = 30060;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22608,22662,22912,23646,23697,24042,24114,24115,24300,24308,24327,24361,27101,28434,28464,28607,28608,30060) and not deleted) <> 18 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
