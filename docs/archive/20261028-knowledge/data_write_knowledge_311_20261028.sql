-- 知识点 311 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_311
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_311 as
select * from t_knowledge_point where id in (27772,27773,27777,27778,27779,27780,27781,27782,27783,27784,27785,27786,27787,27788,27789,27790,27791,27792,27793,27794,27795,27796,27797,27798,27800,27932,27933,27934,27935,28569,28600,28601,28602,31511,31512,31616,31617,31621,31628,31629,31630,31631,31635,31721,31784,31794,31795,31796,31834,31835,31836,31837,31851,31854,31855,31856,31858,31861,31864,31936,32705);

update t_knowledge_point set title = $kp$关闭当前项目或退出当前程序$kp$, content = $kp$关闭当前项目或退出当前程序：按【Alt+F4】。$kp$, section = '' where id = 27772;
update t_knowledge_point set title = $kp$关闭没有响应的程序$kp$, content = $kp$关闭没有响应的程序：按【Alt+F4】。$kp$, section = '' where id = 27773;
update t_knowledge_point set title = $kp$U 盘删除的文件不进回收站$kp$, content = $kp$U 盘上的文件删除后即被彻底删除，不会被放入回收站，因为 U 盘没有回收站。$kp$, section = '' where id = 27777;
update t_knowledge_point set title = $kp$任务栏的作用$kp$, content = $kp$任务栏显示所有已打开的程序，通过任务栏上的按钮可以实现窗口之间的切换。$kp$, section = '' where id = 27778;
update t_knowledge_point set title = $kp$任务栏的位置$kp$, content = $kp$任务栏可以拖至屏幕的上、下、左、右，但不能停在屏幕中间。$kp$, section = '' where id = 27779;
update t_knowledge_point set title = $kp$任务栏高度的调整$kp$, content = $kp$任务栏的高度可以改变，但有一定限制。$kp$, section = '' where id = 27780;
update t_knowledge_point set title = $kp$任务栏可以隐藏$kp$, content = $kp$任务栏可以隐藏。$kp$, section = '' where id = 27781;
update t_knowledge_point set title = $kp$设备文件名不能作主文件名$kp$, content = $kp$CON、PRN 等属于设备文件名，不能作为主文件名。$kp$, section = '' where id = 27782;
update t_knowledge_point set title = $kp$文件名中的通配符$kp$, content = $kp$文件名中的通配符：“?”表示任意一个字符，“*”表示任意多个字符。$kp$, section = '' where id = 27783;
update t_knowledge_point set title = $kp$非正常关机会自动运行磁盘扫描$kp$, content = $kp$关闭和重新启动计算机之前，一定要先退出 Windows。如不正常关机，下次启动时系统将自动运行磁盘扫描程序。$kp$, section = '' where id = 27784;
update t_knowledge_point set title = $kp$记事本与“附件”程序$kp$, content = $kp$用 Windows“附件”中的“记事本”程序可以创建文本文件；“附件”中的程序快捷方式可以删除。$kp$, section = '' where id = 27785;
update t_knowledge_point set title = $kp$双击标题栏最大化窗口$kp$, content = $kp$双击标题栏可以最大化窗口。$kp$, section = '' where id = 27786;
update t_knowledge_point set title = $kp$双击控制菜单关闭窗口$kp$, content = $kp$双击窗口左上角的控制菜单图标，可以关闭当前窗口。$kp$, section = '' where id = 27787;
update t_knowledge_point set title = $kp$程序与窗口的对应关系$kp$, content = $kp$一个程序可以对应多个窗口，但一个窗口只对应一个程序。$kp$, section = '' where id = 27788;
update t_knowledge_point set title = $kp$活动窗口（前台窗口）$kp$, content = $kp$屏幕上打开的多个窗口中，只有一个窗口是活动窗口，即前台窗口。$kp$, section = '' where id = 27789;
update t_knowledge_point set title = $kp$窗口的排列与大小调整$kp$, content = $kp$打开的多个窗口可以重新排列，窗口的位置和大小也可以改变。$kp$, section = '' where id = 27790;
update t_knowledge_point set title = $kp$菜单命令带省略号表示弹出对话框$kp$, content = $kp$菜单命令后带有省略号（…）时，选中该命令会弹出一个对话框。$kp$, section = '' where id = 27791;
update t_knowledge_point set title = $kp$菜单命令带黑色三角表示有子菜单$kp$, content = $kp$菜单命令后带有黑色三角时，选中该命令会展开下一级子菜单。$kp$, section = '' where id = 27792;
update t_knowledge_point set title = $kp$单选按钮$kp$, content = $kp$带有●或○标记的是单选按钮，同一组中只能选中其中一个。$kp$, section = '' where id = 27793;
update t_knowledge_point set title = $kp$复选框（多选按钮）$kp$, content = $kp$带有☐和√标记的是复选框，可以同时选中多个选项。$kp$, section = '' where id = 27794;
update t_knowledge_point set title = $kp$快捷方式$kp$, content = $kp$快捷方式是Windows提供的一种快速启动程序、打开文件或文件夹的方法，是应用程序的快速连接，扩展名为.lnk，每个快捷方式都有自己的文件名。$kp$, section = '' where id = 27795;
update t_knowledge_point set title = $kp$删除快捷方式不影响程序本身$kp$, content = $kp$删除快捷方式不会删除程序本身。$kp$, section = '' where id = 27796;
update t_knowledge_point set title = $kp$窗口最小化后程序继续运行$kp$, content = $kp$在Windows环境下，将当前活动窗口最小化后，该窗口对应的程序转入后台继续运行。$kp$, section = '' where id = 27797;
update t_knowledge_point set title = $kp$Alt+F4关闭窗口并退出程序$kp$, content = $kp$按Alt+F4可以关闭当前窗口，退出程序。$kp$, section = '' where id = 27798;
update t_knowledge_point set title = $kp$双击控制菜单图标关闭窗口$kp$, content = $kp$双击窗口的控制菜单图标，可以关闭该窗口。$kp$, section = '' where id = 27800;
update t_knowledge_point set title = $kp$同一文件夹下可存在主文件名相同、扩展名不同的文件$kp$, content = $kp$在同一文件夹下，允许出现多个主文件名相同但扩展名不同的文件。$kp$, section = '' where id = 27932;
update t_knowledge_point set title = $kp$文件名中不能使用的符号$kp$, content = $kp$主文件名中不能出现下列符号：\、/、:、*、?、"、<、>、|。$kp$, section = '' where id = 27933;
update t_knowledge_point set title = $kp$设备文件名不能作主文件名$kp$, content = $kp$CON和PRN属于设备文件名，不能作为主文件名。$kp$, section = '' where id = 27934;
update t_knowledge_point set title = $kp$对话框的特点$kp$, content = $kp$对话框的标题栏没有最大化、最小化按钮，窗口的尺寸一般不能改变。$kp$, section = '' where id = 27935;
update t_knowledge_point set title = $kp$文件名的命名原则$kp$, content = $kp$① 文件名的组成：主文件名.扩展名，主文件名不可以省略，扩展名可以省略。
② 主文件名中不可以出现 :、?、*、\、/、| 等符号。
③ 不可以使用系统保留字CON、PRN。
④ 文件名最多有255个字符。
⑤ Windows中文件名不区分大小写。
⑥ 文件名中可以使用空格，但文件名开头不保留空格。$kp$, section = '' where id = 28569;
update t_knowledge_point set title = $kp$对话框的窗口特点$kp$, content = $kp$对话框的标题栏没有最大化、最小化按钮，其窗口尺寸不能随意调整。$kp$, section = '' where id = 28600;
update t_knowledge_point set title = $kp$复选框的标记$kp$, content = $kp$带有☐和√标记的是复选框，属于多选按钮，可以同时选中多个选项。$kp$, section = '' where id = 28601;
update t_knowledge_point set title = $kp$快捷方式删除后原程序仍保留$kp$, content = $kp$快捷方式只是指向原程序的链接，删除快捷方式不会删除程序本身。$kp$, section = '' where id = 28602;
update t_knowledge_point set title = $kp$打开 Windows 更新设置$kp$, content = $kp$在“设置”中依次打开“更新和安全”→“Windows 更新”，即可进入 Windows 更新设置页面。页面显示当前更新状态（如“你使用的是最新版本”）和上次检查时间，并提供“检查更新”“暂停更新 7 天”“更改使用时段”“查看更新历史记录”“高级选项”等入口。当存在可选的质量更新时，页面会列出更新名称（如 KB5003214），并提供“下载并安装”和“查看所有可选更新”。$kp$, section = '' where id = 31511;
update t_knowledge_point set title = $kp$点击检查更新并下载安装更新$kp$, content = $kp$单击“检查更新”后，系统会联网检查是否有需要修复的漏洞，并下载相应的补丁包或软件。下载过程中会显示更新名称和进度（如“正在下载 - 0%”）；页面同时列出可选的质量更新（如 KB5003214），可选择“下载并安装”或“查看所有可选更新”。$kp$, section = '' where id = 31512;
update t_knowledge_point set title = $kp$键盘的基本操作与常用快捷键$kp$, content = $kp$利用键盘可以实现 Windows XP 提供的一切操作功能。Windows XP 的常用快捷键如下：

| 快捷键 | 说明 | 快捷键 | 说明 |
| --- | --- | --- | --- |
| 【F1】 | 打开帮助 | 【Ctrl+C】 | 复制 |
| 【F2】 | 重命名文件（夹） | 【Ctrl+X】 | 剪切 |
| 【F3】 | 搜索文件或文件夹 | 【Ctrl+V】 | 粘贴 |
| 【F5】 | 刷新当前窗口 | 【Ctrl+Z】 | 撤销 |
| 【Delete】 | 删除 | 【Ctrl+A】 | 选定全部内容 |
| 【Shift+Delete】 | 永久删除所选项，不放入“回收站” | 【Ctrl+Esc】 | 打开开始菜单 |
| 【Alt+F4】 | 关闭当前项目或者退出当前程序 | 【Alt+Tab】 | 在打开的项目之间选择切换 |
| 【Ctrl+Alt+Delete】 | 打开 Windows 任务管理器 | 【Alt+Esc】 | 以项目打开的顺序循环切换 |$kp$, section = '' where id = 31616;
update t_knowledge_point set title = $kp$文件夹与路径$kp$, content = $kp$（1）文件夹

- 便于管理文件。
- 文件夹按树形结构组织和存放文件。
- 文件夹树的最高层称为根文件夹，用“\”表示。
- 一个逻辑磁盘驱动器只有一个根文件夹。
- 在根文件夹中建立的文件夹称为子文件夹，子文件夹中还可以再包含子文件夹。
- 除根文件夹外，所有文件夹都必须有文件夹名；文件夹的命名规则与文件类似，但一般不需要扩展名。

（2）路径

① 路径：在文件夹的树形结构中，从根文件夹开始到任何一个文件都有唯一一条通路，该通路上全部结点组成路径，即用“\”隔开的一组文件夹名及文件名。

② 当前文件夹：正在操作的文件所在的文件夹。

③ 绝对路径与相对路径：绝对路径是以根文件夹“\”开始的路径，即除盘符外第一个符号一定是“\”；相对路径是从当前文件夹开始的路径。$kp$, section = '' where id = 31617;
update t_knowledge_point set title = $kp$Windows XP 系统设置与控制面板$kp$, content = $kp$“控制面板”是用户对计算机系统进行配置的重要工具，可用来修改系统设置。控制面板中默认安装了许多管理程序；此外，一些应用程序和设备会安装自己的管理程序，以简化这些设备或应用程序的管理和配置任务。$kp$, section = '' where id = 31621;
update t_knowledge_point set title = $kp$字体设置$kp$, content = $kp$Windows XP 有一个字体文件夹，使用该文件夹可以方便地安装或删除字体。在“控制面板”中双击“字体”图标，即可打开“字体”窗口。$kp$, section = '' where id = 31628;
update t_knowledge_point set title = $kp$安装字体$kp$, content = $kp$具体操作步骤如下：

（1）选择“文件”菜单中的“安装新字体”命令，显示“添加字体”对话框。

（2）选择字体所在的驱动器和文件夹，系统将自动检索字体类型并显示字体列表框。

（3）在列表框中选择要安装的新字体。

（4）单击【确定】按钮，完成字体安装。$kp$, section = '' where id = 31629;
update t_knowledge_point set title = $kp$磁盘管理$kp$, content = $kp$磁盘管理可以实现对磁盘的格式化、空间管理、碎片处理、磁盘扫描和查看磁盘属性等功能。$kp$, section = '' where id = 31630;
update t_knowledge_point set title = $kp$安装应用程序$kp$, content = $kp$（1）自动安装

将含有自动安装程序的光盘放入光盘驱动器，安装程序会自动运行，按屏幕提示操作即可完成安装。这类程序安装完毕后，通常在“开始”菜单中自动添加相应的程序命令。

（2）手动安装

使用 Windows XP 的“安装程序向导”安装应用程序，操作步骤如下：

① 在“控制面板”中双击“添加或删除程序”。

② 单击【添加新程序】按钮，切换到安装应用程序界面。

③ 将应用程序安装盘放入驱动器。

④ 单击【CD 或软盘】按钮，打开“从软盘或光盘安装程序”对话框。

⑤ 按安装向导提示操作，完成安装。$kp$, section = '' where id = 31631;
update t_knowledge_point set title = $kp$磁盘清理$kp$, content = $kp$“磁盘清理”程序可以将磁盘中无用的文件删除，以留出更多空间保存需要保存的文件或安装新程序，同时还可以删除一些不再指向应用程序的快捷方式。

操作步骤：

（1）单击【开始】按钮，选择“所有程序”→“附件”→“系统工具”→“磁盘清理”命令，打开“选择驱动器”对话框。

（2）在对话框中选择要清理的磁盘驱动器，单击【确定】按钮。

（3）“磁盘清理”程序首先对系统进行分析，然后在“磁盘清理”对话框中显示报告。

（4）如果要删除某个类别中的文件，选定该类别前的复选框，单击【确定】按钮，在弹出的警告对话框中单击【是】按钮，即可删除选中类别的文件。$kp$, section = '' where id = 31635;
update t_knowledge_point set title = $kp$卸载已在注册表中注册的应用程序$kp$, content = $kp$在 Windows 中，若要卸载已安装并在注册表中注册了的应用程序，可通过控制面板中的“添加/删除程序”完成删除。$kp$, section = '' where id = 31721;
update t_knowledge_point set title = $kp$窗口的组成$kp$, content = $kp$Windows 窗口主要由标题栏、菜单栏、工具栏、工作区和状态栏等部分组成。$kp$, section = '' where id = 31784;
update t_knowledge_point set title = $kp$开始菜单与“运行”命令$kp$, content = $kp$打开开始菜单：按 Windows 徽标键或 Ctrl+Esc。

打开“运行”对话框：Windows+R。

将程序的快捷方式放入“开始菜单/程序/启动”文件夹，该程序即可在开机时自动运行。$kp$, section = '' where id = 31794;
update t_knowledge_point set title = $kp$搜索文件与通配符$kp$, content = $kp$按 Windows+F 或 F3 打开搜索窗口。

可以利用文件名、文件中的内容以及大小和修改时间来搜索文件或文件夹。

可以使用通配符“*”和“?”帮助搜索：“*”表示任意多个字符，“?”表示有且仅有一个字符。$kp$, section = '' where id = 31795;
update t_knowledge_point set title = $kp$Windows 资源管理器$kp$, content = $kp$按 Windows+E 打开 Windows 资源管理器。

左侧窗口显示文件夹的树形结构，不显示文件；右侧窗口显示左侧窗口中被选中文件夹里的内容。$kp$, section = '' where id = 31796;
update t_knowledge_point set title = $kp$应用程序安装的通用流程$kp$, content = $kp$安装应用程序的实际过程通常并不复杂，大多数应用程序都通过安装向导将其安装到系统中。通用流程如下：$kp$, section = '' where id = 31834;
update t_knowledge_point set title = $kp$启动安装程序$kp$, content = $kp$启动安装程序：安装文件的名称通常为“Setup.exe”或“Install.exe”。$kp$, section = '' where id = 31835;
update t_knowledge_point set title = $kp$通过下载图标进入“下载和更新”$kp$, content = $kp$点击下载图标“↓”或更多图标“…”中的“下载和更新”。$kp$, section = '' where id = 31836;
update t_knowledge_point set title = $kp$系统操作的权限限制$kp$, content = $kp$本系统只能进行内部设置和内部常规操作，不能进行可能影响系统稳定和安全的操作。$kp$, section = '' where id = 31837;
update t_knowledge_point set title = $kp$菜单项的显示约定$kp$, content = $kp$在 Windows 菜单中，若菜单选项字符呈灰色，表示该选项当前不能执行；带省略号表示会弹出对话框；带黑色三角表示有子菜单；字符为黑色表示可以操作。【2006、2008、2013】$kp$, section = '' where id = 31851;
update t_knowledge_point set title = $kp$快捷方式$kp$, content = $kp$快捷方式是 Windows 提供的一种快速启动程序、打开文件或文件夹的方法，是应用程序的快速连接，扩展名为 .lnk。每个快捷方式都有自己独立的文件名。【2006、2008、2009、2010】$kp$, section = '' where id = 31854;
update t_knowledge_point set title = $kp$退出 Windows 与磁盘扫描$kp$, content = $kp$关闭和重新启动计算机之前，一定要先退出 Windows。如不正常关机，下次启动时系统将自动运行磁盘扫描程序。【2009】$kp$, section = '' where id = 31855;
update t_knowledge_point set title = $kp$“文档”菜单显示最近访问文档的数量$kp$, content = $kp$Windows 中“开始菜单→文档”默认显示最近访问的文档 6 个，最多为 15 个。打开开始菜单的快捷键是 Ctrl+Esc。$kp$, section = '' where id = 31856;
update t_knowledge_point set title = $kp$任务栏位置的改变$kp$, content = $kp$任务栏的位置是可以改变的，通过拖动任务栏可以将它移动到桌面四个边缘的任一位置。【2011】$kp$, section = '' where id = 31858;
update t_knowledge_point set title = $kp$窗口和菜单操作的学习要求$kp$, content = $kp$窗口和菜单操作（要求掌握）。

后续内容：Windows 基本概念；文件和文件夹。$kp$, section = '' where id = 31861;
update t_knowledge_point set title = $kp$图标的作用$kp$, content = $kp$Windows 系统中采用图标（icon）来形象地表示系统中的文件、程序和设备等对象。$kp$, section = '' where id = 31864;
update t_knowledge_point set title = $kp$启用或关闭 Windows 功能$kp$, content = $kp$在“启用或关闭 Windows 功能”对话框中可以查看各功能的启用状态，例如“Microsoft Print to PDF”默认为未启用；Windows 功能有的全部启用，有的部分启用。

方法一：从“开始”菜单打开“系统设置”界面，在其中选择“启用或关闭 Windows 功能”。$kp$, section = '' where id = 31936;
update t_knowledge_point set title = $kp$查看 Windows 功能的启用状态$kp$, content = $kp$Windows 10 系统安装完成后，若想查看 Windows 功能列表及各功能的启用状态，可右击“开始菜单”图标，或按 Win+X 调出菜单列表，再从中选择相应选项。$kp$, section = '' where id = 32705;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (27772,27773,27777,27778,27779,27780,27781,27782,27783,27784,27785,27786,27787,27788,27789,27790,27791,27792,27793,27794,27795,27796,27797,27798,27800,27932,27933,27934,27935,28569,28600,28601,28602,31511,31512,31616,31617,31621,31628,31629,31630,31631,31635,31721,31784,31794,31795,31796,31834,31835,31836,31837,31851,31854,31855,31856,31858,31861,31864,31936,32705) and not deleted) <> 61 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
