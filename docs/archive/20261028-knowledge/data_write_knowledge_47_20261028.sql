-- 知识点 47 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_47
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_47 as
select * from t_knowledge_point where id in (21820,21993,22118,22126,22149,26700,26703,26704,26984,27216,27236,27265,28100,28244,28504,28612,28654,28660,28661,28676,28695,28709,28724,28731,28732,28772,28782,28792,28806,28809,28921,28927,29913,30119,30165,32099);

update t_knowledge_point set title = $kp$集成电路的特点与发展趋势$kp$, content = $kp$集成电路的特点：体积小、重量轻、可靠性高。

集成电路的工作速度主要取决于组成逻辑门电路的晶体管尺寸。晶体管尺寸越小，其极限工作频率越高，门电路的开关速度越快。

摩尔定律：单块集成电路的集成度平均每18～24个月翻一番。摩尔定律不可能永远成立。$kp$, section = '' where id = 21820;
update t_knowledge_point set title = $kp$常见内存条规格$kp$, content = $kp$① 单列直插式内存条（SIMM）：72线，数据线宽度32位。
② 双列直插式内存条（DIMM）：SDRAM为168线，数据线宽度64位；DDR SDRAM为184线，数据线宽度64位。
③ Rambus内存条模块（RIMM）。$kp$, section = '' where id = 21993;
update t_knowledge_point set title = $kp$PC机主存储器的物理结构$kp$, content = $kp$主存储器由1～4个内存条组成。内存条由若干片DRAM芯片焊装在一小条印制电路板上制成，必须插在主板的内存条插槽中才能使用。

目前流行的是DDR4和DDR3内存条，均采用双列直插式，触点分布在内存条的两面。DDR2和DDR3均有240个引脚，但不可互换使用。PC机主板一般配备2个或4个内存条插槽。$kp$, section = '' where id = 22118;
update t_knowledge_point set title = $kp$Windows 操作判断题$kp$, content = $kp$1. 在安装Windows过程中，应先创建Windows的启动盘。
2. 在Windows中，利用安全模式可以解决启动时的一些问题。
3. 启动Windows的同时可以加载指定常用程序。
4. 不支持即插即用的硬件设备能在Windows环境下使用。
5. Windows不支持面向对象的程序设计。
6. Windows本身带有文字处理程序。
7. 在Windows环境下，系统的一些属性是可以改变的。
8. 在Windows中，一个应用程序窗口被最小化后，该应用程序还在执行。
9. 文档窗口最大化后将不能占满整个桌面。
10. 在Windows中，双击未注册过的文件，则会出现一个“打开方式”对话框。
11. Windows不支持对象的链接和嵌入。
12. 在Windows 2000下，多个用户使用同一台电脑时，每个用户可以有不同的桌面背景。
13. 如果想要在Windows桌面设置一个Word应用程序的快捷图标，应首先用鼠标右键单击Windows桌面的任意位置。
14. 删除程序组图标时，会连同其所包含的程序项图标、注册表及程序文件一同删除。
15. 在Windows下，所有正在运行的应用程序都会在任务栏中出现相应图标。$kp$, section = '' where id = 22126;
update t_knowledge_point set title = $kp$内存带宽$kp$, content = $kp$内存带宽是指内存与北桥芯片（现代平台为CPU内置的内存控制器）之间的数据传输率，单位一般为MB/s或GB/s。

主板上通常有南桥和北桥两个芯片。靠近CPU的北桥芯片负责与CPU、内存、显卡通信，是它们之间的桥梁；815、845、865、915、945等是北桥芯片的名称。南桥芯片负责连接硬盘、USB接口、PCI接口等，南桥与北桥之间也有通道进行数据通信。

最高读写速率（带宽）（MB/s）=（数据通路宽度/8）×有效时钟频率（MHz）。

CPU带宽、内存带宽、总线带宽、显存带宽的计算方法相似，都是频率与数据通路宽度的乘积。

内存总线频率与CPU总线频率的对应关系：PC133—133MHz、PC100—100MHz、PC266—133MHz、PC200—100MHz、PC800—400MHz、PC1066—533MHz。

例1：双通道RDRAM的数据通路宽度为2×2Bytes，有效时钟频率为1066MHz，最高读写速率为4×1066=4264MB/s，即4.264GB/s。
例2：DDR SDRAM在总线时钟的上升沿和下降沿都传输数据，CPU总线时钟频率为133MHz、数据通路宽度为8Bytes时，带宽为133×2×8=2128MB/s，即2.128GB/s。
例3：SDRAM数据通路宽度为64位（8Bytes），CPU总线时钟频率为133MHz，带宽为8×133=1064MB/s，即1.064GB/s。
例4：DDR200的数据通路宽度为8Bytes，CPU总线时钟频率为100MHz，带宽为100×2×8=1600MB/s，即1.6GB/s。$kp$, section = '' where id = 22149;
update t_knowledge_point set title = $kp$PC 机组成$kp$, content = $kp$1. 输入单元（input unit）：计算机的“接收”部分，从各种输入设备接收信息（数据和计算机程序），并将这些信息放到其他单元中，使信息得以处理。如今大多数信息通过键盘和鼠标输入计算机，将来也可能通过语音输入或扫描图形获得。
2. 输出单元（output unit）：计算机的“发送”部分，将计算机处理过的信息送到不同输出设备中，向计算机外部提供所需的信息。如今大多数信息通过屏幕显示、书面打印或用于控制其他设备输出。
3. 内存单元（memory unit）：计算机中快速访问、低容量的“库存”部分。它保存通过输入单元输入的信息，以便在需要时立即提供这些信息进行处理；内存单元保存处理的信息，直到输出单元将信息送到输出设备中。内存单元也称为内存或主内存。
4. 算术/逻辑单元（arithmetic and logic unit，ALU）：计算机的“生产”部分，负责进行加、减、乘、除等运算，并包含判断机制，例如比较内存单元中的两个项目，确定其是否相等。
5. 中央处理单元（central processing unit，CPU）：计算机中的“管理”部分，是计算机的协调员，负责管理其他部分的操作。CPU告诉输入单元何时将信息读取到内存单元中，告诉ALU何时利用内存单元中的信息进行计算，告诉输出单元何时将内存单元中的信息发送到指定的输出设备中。
6. 辅助存储单元（secondary storage unit）：计算机长期的高容量“库存”部分。其他单元不经常使用的程序或数据通常放在辅助存储单元（如磁盘）中，直到几小时、几天、几月甚至几年后才需要。访问辅助存储单元中的信息要比访问主内存慢得多，辅助存储单元的单位成本也比主内存低得多。$kp$, section = '' where id = 26700;
update t_knowledge_point set title = $kp$DDR SDRAM 参数与带宽计算$kp$, content = $kp$内存有三种不同的频率指标：核心频率、时钟频率和有效数据传输频率。核心频率即内存Cell阵列的工作频率，是内存的真实运行频率；时钟频率即I/O Buffer（输入/输出缓存）的传输频率；有效数据传输频率是数据传送的频率。

DDR SDRAM的各项参数：以标称DDR3 1066的内存条为例，计算默认频率下的带宽。$kp$, section = '' where id = 26703;
update t_knowledge_point set title = $kp$DDR3 内存带宽计算$kp$, content = $kp$1066是指有效数据传输频率，除以8才是核心频率。一条内存只能采用单通道模式，位宽为64bit。

内存带宽=（1066/8）×64×8=68224Mbit/s。若内存工作在标称频率，可直接用标称频率×位宽简化计算。根据8bit=1Byte，68224/8=8528MByte=8.328125GB。

两条标称1066、超频到1200的DDR3内存组成双通道：核心频率为1200/8=150MHz，双通道位宽为128bit，带宽=150×128×8=153600Mbit/s=18.75GB/s。

数据传输率R=（1/T）×log2N（bps）。其中，T为一个数字脉冲信号的宽度（全宽码）或重复周期（归零码），单位为秒；一个数字脉冲称为一个码元，N为一个码元所取的有效离散值个数，也称调制电平数，N取2的整数次方。

内存条封装形式：DIP、TSOP、BGA、CSP、WLCSP。$kp$, section = '' where id = 26704;
update t_knowledge_point set title = $kp$Windows XP 的菜单$kp$, content = $kp$Windows XP中的菜单一般包括“开始”菜单、下拉菜单、级联菜单、快捷菜单、系统控制菜单等。

打开下拉菜单：
方法1：单击菜单栏上相应的菜单名。
方法2：按Alt+字母键。
方法3：用Alt键或F10键激活菜单栏，按字母键。
方法4：激活菜单栏，用左、右箭头键选定所需菜单名，按Enter键或上、下箭头键。

快捷菜单：是关于某个对象的常用命令快速运行的弹出式菜单。
方法一：右击对象。
方法二：按Shift+F10。
方法三：按键盘上的“快捷菜单”键。

系统控制菜单：单击窗口左上角的控制图标，或右击标题栏均可打开。

级联菜单：命令右侧的“▶”标记所打开的子菜单，即下一级菜单。

关闭菜单：打开菜单后，用鼠标单击菜单以外的任何地方，或按Esc、Alt键即可关闭。

菜单中常用符号的含义：
暗色显示的命令表示该菜单命令在当前状态下不能执行。
命令后带有省略号（…）表示执行该命令将弹出对话框。
命令前有“√”标记表示该命令正在起作用，再次单击可删除标记，该命令将不再起作用。
命令前有“●”标记表示在并列的几项功能中，每次只能选择其中一项。
命令右侧的组合键表示在不打开菜单的情况下，使用该组合键可直接执行该命令。
命令右侧的“▶”标记表示执行该命令将打开一个级联菜单。
向下的双箭头表示菜单中还有许多命令没有显示，单击它会显示所有菜单命令。
带下划线的字母是该菜单命令的字母键，在鼠标指针指向该命令所在菜单的同时按下字母键，会执行该菜单命令。$kp$, section = '' where id = 26984;
update t_knowledge_point set title = $kp$前台任务与活动窗口$kp$, content = $kp$能接受用户输入（击键或单击鼠标）的窗口只能有一个，称为活动窗口，它所对应的任务称为前台任务。前台任务只能有1个。$kp$, section = '' where id = 27216;
update t_knowledge_point set title = $kp$硬件变更时的登记$kp$, content = $kp$系统增加、减少或更换硬件时，并非所有硬件都要登记参数；一般需要登记的是硬盘和光驱的个数。$kp$, section = '' where id = 27236;
update t_knowledge_point set title = $kp$控制面板的功能$kp$, content = $kp$在Windows操作系统中，控制面板允许修改计算机及其自身几乎所有部件的外观和行为，如添加/删除程序，设置显示器、键盘、鼠标的属性等。$kp$, section = '' where id = 27265;
update t_knowledge_point set title = $kp$前台任务与活动窗口$kp$, content = $kp$能接受用户输入（击键或单击鼠标）的窗口只能有一个，称为活动窗口，它所对应的任务称为前台任务。前台任务只能有1个。$kp$, section = '' where id = 28100;
update t_knowledge_point set title = $kp$内存容量与 CPU 性能$kp$, content = $kp$内存容量影响计算机的性能，但内存容量不影响CPU的性能。$kp$, section = '' where id = 28244;
update t_knowledge_point set title = $kp$网卡 MAC 地址$kp$, content = $kp$网络接口和硬件层使用MAC地址。网卡的MAC地址是标识主机的硬件地址，由48位二进制组成，通常用十六进制数表示。$kp$, section = '' where id = 28504;
update t_knowledge_point set title = $kp$设备分配$kp$, content = $kp$设备分配的基本任务是根据用户的I/O请求，为用户分配所需的设备。如果在I/O设备和CPU之间还存在设备控制器和通道，则还需为分配出去的设备分配相应的控制器和通道。$kp$, section = '' where id = 28612;
update t_knowledge_point set title = $kp$资源共享$kp$, content = $kp$资源共享是网络的根本目的。只要允许，用户可以共享网内其他计算机的硬件、软件和数据。例如从MP3网站下载音乐；打印机等硬件可共享，显示器、键盘、鼠标、网卡等不可共享。$kp$, section = '' where id = 28654;
update t_knowledge_point set title = $kp$DDR 与双通道$kp$, content = $kp$DDR（Double Data Rate）即双倍数据速率，一个时钟周期传输两次数据。双通道与DDR是两个不同概念，双通道通过增加数据通路宽度提高带宽。$kp$, section = '' where id = 28660;
update t_knowledge_point set title = $kp$内存带宽计算公式$kp$, content = $kp$内存带宽=数据总线位数/8×内存运行频率×周期数。

例：DDR400内存运行频率为200MHz，数据总线位数为64位，周期数为2，则200×（64/8）×2=3200MB/s=3.2GB/s（PC3200）。

DDR266的频率为133MHz，DDR333的频率为166MHz。$kp$, section = '' where id = 28661;
update t_knowledge_point set title = $kp$内存容量与存取时间$kp$, content = $kp$内存编址单位为B（字节），内存采用连续编址。CPU总线上的信号种类包括地址信号、控制信号和数据信号。

访问内存空间的大小：
最大访问内存空间=2的地址线根数次方B。
最大访问内存空间=2的最大末地址位数次方B。
例如CPU访问内存，最大末地址为3FFFFFFFH，则CPU能够访问到的最大内存空间为1024MB。
从首地址开始访问到某个地址结束时，访问内存空间=地址码十进制值+1B。

存取周期：从上一次存取到下一次存取的时间间隔。

存取时间：从CPU送出地址码后，到内存中取到（存入）数据并送回到CPU所花费的时间。$kp$, section = '' where id = 28676;
update t_knowledge_point set title = $kp$内存条与 CPU 的封装形式$kp$, content = $kp$内存芯片的封装形式包括单列直插式（SIP）、双列直插式（DIP）、阵列式（PGA）等。目前的DIMM内存条采用双列直插式结构，CPU多采用PGA封装。$kp$, section = '' where id = 28695;
update t_knowledge_point set title = $kp$设备管理$kp$, content = $kp$设备管理的任务是协调I/O设备与CPU和内存的工作，为用户提供使用外部设备的最佳接口，方便用户使用计算机。在Windows系统中，设备管理程序的结构自底向上为：设备驱动程序、I/O系统组件（含I/O管理程序）、与应用程序的接口、应用程序。Windows中的设备管理程序还支持“即插即用”（PnP）功能。$kp$, section = '' where id = 28709;
update t_knowledge_point set title = $kp$PC 配置参数含义$kp$, content = $kp$Core 2/3.2GHz/1GB/160GB依次表示CPU型号、主频、内存条容量、硬盘容量。$kp$, section = '' where id = 28724;
update t_knowledge_point set title = $kp$内存条最大存储容量$kp$, content = $kp$若内存条的地址访问线（地址访问位数）为32根，则该内存条的最大存储容量为2的32次方Byte，即4GB。$kp$, section = '' where id = 28731;
update t_knowledge_point set title = $kp$SDRAM 与 DDR 内存条的区别$kp$, content = $kp$SDRAM通常采用168线的DIMM内存条，DDR、DDR2、DDR3也采用双列直插式DIMM内存条，触点分布在内存条的两面。一个时钟周期内，SDRAM只能传送1次数据，DDR为2次，DDR2为4次，DDR3为8次。$kp$, section = '' where id = 28732;
update t_knowledge_point set title = $kp$存取时间$kp$, content = $kp$存取时间：地址被选定后，读出数据并将数据送入CPU的时间，或CPU向内存写入数据的时间。$kp$, section = '' where id = 28772;
update t_knowledge_point set title = $kp$窗口的构成与操作$kp$, content = $kp$窗口的构成：标题栏（图标、名称、最小化、最大化/还原、关闭按钮）、菜单栏、工具栏、地址栏、操作区和任务窗格、状态栏、滚动条。

关闭：单击关闭按钮、双击标题栏图标、通过控制菜单（Alt+Space）中的关闭命令，或按Alt+F4。

移动：按住左键拖动标题栏。

缩放：将鼠标置于窗口边缘，按住左键拖动。

最小化：单击最小化按钮，最小化后的窗口在后台运行。

最大化与还原：双击标题栏。

切换：单击任务栏上的窗口图标，或按Alt+Tab、Alt+Esc。

注：可以同时打开多个窗口，但活动窗口只有一个。

排列窗口：横向平铺、纵向平铺、层叠。$kp$, section = '' where id = 28782;
update t_knowledge_point set title = $kp$SELECT 查询与投影$kp$, content = $kp$可以使用SELECT（投影）显示列。例如执行SELECT * FROM t_students;，结果包含id、name、sex、age、bdate五列，以及多行学生记录。$kp$, section = '' where id = 28792;
update t_knowledge_point set title = $kp$总线型拓扑结构$kp$, content = $kp$总线型拓扑结构采用单根传输线作为传输介质，所有站点都通过相应的硬件接口直接连接到传输介质或总线上。任何一个站点发送的信号都可以沿着介质传播，并能被其他所有站点接收。$kp$, section = '' where id = 28806;
update t_knowledge_point set title = $kp$硬件设备与驱动程序的安装$kp$, content = $kp$在计算机中安装硬件设备与安装硬件设备的驱动程序通常密不可分，是否正确安装硬件设备及其驱动程序对操作系统的性能及稳定性至关重要。$kp$, section = '' where id = 28809;
update t_knowledge_point set title = $kp$控制面板的功能$kp$, content = $kp$在Windows操作系统中，控制面板允许修改计算机及其自身几乎所有部件的外观和行为，如添加/删除程序，设置显示器、键盘、鼠标的属性等。$kp$, section = '' where id = 28921;
update t_knowledge_point set title = $kp$SDRAM、DDR SDRAM 与 RDRAM 的参数$kp$, content = $kp$当前流行的SDRAM、DDR SDRAM、RDRAM的主要参数、数据传输率计算及内存条封装形式。$kp$, section = '' where id = 28927;
update t_knowledge_point set title = $kp$杀毒软件的局限性$kp$, content = $kp$杀毒软件对计算机病毒的检测与消除能力通常滞后于病毒的出现，杀毒软件、防病毒卡等都不是100%可靠。$kp$, section = '' where id = 29913;
update t_knowledge_point set title = $kp$DDR 各代速率关系$kp$, content = $kp$DDR2的数据传输率是DDR的2倍；采用双通道时带宽再翻倍，因此为单条DDR内存的4倍。DDR3是DDR2的2倍，双通道后为单条DDR内存的8倍。DDR4是DDR3的2倍，双通道后为单条DDR内存的16倍。$kp$, section = '' where id = 30119;
update t_knowledge_point set title = $kp$数据传输速度计算$kp$, content = $kp$FSB频率越高，数据传输速度越快。数据传输速度=工作频率×位宽/8（B/s）。DDR为双倍数据速率，需在计算结果上乘以2。$kp$, section = '' where id = 30165;
update t_knowledge_point set title = $kp$Word 样式、模板与文本编辑$kp$, content = $kp$设置样式：选择“格式”菜单中的“样式和格式”菜单项，或单击“格式”工具栏上的“样式和格式窗格”按钮，打开“样式和格式”任务窗格，单击指定样式名称即可应用。

模板：模板是一个或多个文件，其中包含的结构和工具构成已完成文件的样式和页面布局等元素。模板是文档样式的基础，作为独立文件存在，但与文档结合运行，且始终在后台运行。例如新建空白文档时，该文档的所有默认格式都由其模板normal.dot指定（.dot是模板文件的扩展名）。

注意：若更改了模板中的格式，只有在选中“自动更新文档样式”复选框的情况下，打开已有文档时Word才会更新修改过的样式。可在打开已有文档前，在空白文档中通过“工具”菜单的“模板和加载项”设置此选项。

宏：可用于自动执行任务的一项或一组操作，可用Visual Basic for Applications（VBA）编程语言录制。宏只能在宿主Office程序中运行，不能单独运行。

脚注和尾注：用于对名词或事件加以注释。脚注和尾注都是注释，区别是脚注位于每一页面的底部，尾注位于文档结尾。操作为“插入”→“引用”→“脚注与尾注”。

插入另一个文档：利用Word的插入文件功能，选择“插入”→“文件”命令，在“插入文件”对话框中可以将几个文档连接成一个文档。

插入点的移动：用鼠标时，将“I”形指针移到指定位置并单击左键；用键盘时，左、右光标键分别左移、右移一个字符或汉字，上、下光标键分别上移、下移一行，Home移到当前行开头，End移到当前行末尾，Ctrl+Page Up移到上页顶端，Ctrl+Page Down移到下页顶端，Ctrl+Home移到文档开头，Ctrl+End移到文档末尾。$kp$, section = '' where id = 32099;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21820,21993,22118,22126,22149,26700,26703,26704,26984,27216,27236,27265,28100,28244,28504,28612,28654,28660,28661,28676,28695,28709,28724,28731,28732,28772,28782,28792,28806,28809,28921,28927,29913,30119,30165,32099) and not deleted) <> 36 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
