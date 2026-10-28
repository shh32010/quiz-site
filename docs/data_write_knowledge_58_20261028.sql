-- 知识点 58 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_58
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_58 as
select * from t_knowledge_point where id in (22133,24575,26712,26989,27014,27022,27205,27209,27222,27255,27257,27264,27277,28007,28082,28303,28630,28708,28710,28715,28866,28893,28900,28903,28923,29973);

update t_knowledge_point set title = $kp$使用硬盘的注意事项$kp$, content = $kp$- 正在对硬盘读写时不能关掉电源。
- 保持使用环境的清洁卫生，注意防尘；控制环境温度，防止高温、潮湿和磁场的影响。
- 防止硬盘受震动，工作时不要移动机器。
- 及时对硬盘内容进行整理，包括目录的整理、文件的清理、磁盘碎片整理等。
- 防止计算机病毒对硬盘的破坏，定期对硬盘进行病毒检测。$kp$, section = '' where id = 22133;
update t_knowledge_point set title = $kp$CD 与 DVD 的道间距和最小坑长$kp$, content = $kp$CD：道间距 1.6 μm，最小坑长 0.83 μm。
DVD：道间距 0.74 μm，最小坑长 0.4 μm。$kp$, section = '' where id = 24575;
update t_knowledge_point set title = $kp$外存储器的概念与常见类型$kp$, content = $kp$外存储器是指除计算机内存及 CPU 缓存以外的存储器，此类存储器一般断电后仍能保存数据。常见的外存储器有硬盘、软盘、光盘、U 盘等。PC 机常见的外存储器有软盘存储器、硬盘存储器、光盘存储器等。$kp$, section = '' where id = 26712;
update t_knowledge_point set title = $kp$文件与文件夹的组织方式$kp$, content = $kp$1）计算机系统中保存的数据是以文件的形式存放于外部存储介质上的。
2）为了便于文件的管理，文件通常放在文件夹中，构成一个树形结构。文件夹就是目录。
3）一个物理硬盘可以分成多个逻辑盘（如 C 盘、D 盘等）。
4）每一个逻辑盘只能有一个根文件夹，用反斜杠符号表示，如 C 盘、D 盘各有自己的根文件夹。
5）每一个文件夹下可以包含多个文件与子文件夹。
6）根文件夹不能被删除，也不能被改名，只能是反斜杠。
7）同一个文件夹中，文件或文件夹之间不能同名；不同的文件夹中，文件或文件夹之间可以同名。$kp$, section = '' where id = 26989;
update t_knowledge_point set title = $kp$打印机的安装、设置与管理$kp$, content = $kp$打印机是常见的输出设备，用户可以用它打印文档、图片等。

要在 Windows XP 中使用打印机，必须先将其安装到系统中。这里的“安装”主要是指装入打印机驱动程序，以使系统正确地识别和管理打印机。打印机按所处的地理位置划分，可分为本地打印机和网络打印机，其安装方法类似。

在开始安装之前，应了解打印机的生产厂商和类型，并使打印机与计算机正确连接。安装步骤如下：

（1）将打印机连接到计算机，打开打印机电源。
（2）若安装的是即插即用型打印机，Windows XP 将会自动识别；若系统找到该打印机的驱动程序，则自动安装；若没有找到，系统将提示放入驱动程序光盘或软盘，按提示步骤安装。
（3）对于非即插即用打印机，在“控制面板”窗口中双击“打印机和传真”图标，或单击【开始】按钮选择“打印机和传真”命令，打开“打印机和传真”窗口，单击左窗格中的“添加打印机”超链接，按向导要求操作即可安装。
（4）打印机正确安装后，在“打印机和传真”窗口中选定已安装的打印机图标，在“文件”菜单中选择“属性”命令，或右击该图标并在快捷菜单中选择“属性”命令，对打印机的共享、端口、高级、安全等属性进行设置。$kp$, section = '' where id = 27014;
update t_knowledge_point set title = $kp$数据的备份和还原$kp$, content = $kp$定期备份服务器或者本地硬盘上的数据是非常必要的。有了备份，在数据遭到破坏时就可以将它们还原。

使用备份或还原向导时，可以按照提示进行操作，直到完成文件的备份或还原。操作步骤如下：

（1）单击【开始】按钮，选择“所有程序”|“附件”|“系统工具”|“备份”命令，打开“备份或还原向导”对话框。
（2）按照向导提示进行操作，即可完成备份或还原。$kp$, section = '' where id = 27022;
update t_knowledge_point set title = $kp$存储器的速度排序$kp$, content = $kp$由快到慢：寄存器→Cache→主存储器→外存储器→后备存储器（磁带库、光盘库）。

为了获取好的性价比，计算机中各种存储器组成层状的塔式结构，取长补短、协调工作。$kp$, section = '' where id = 27205;
update t_knowledge_point set title = $kp$硬盘的作用$kp$, content = $kp$硬盘用于长期保存各类信息。$kp$, section = '' where id = 27209;
update t_knowledge_point set title = $kp$文件的概念$kp$, content = $kp$文件是存储在外存储器中的一组相关信息的集合。$kp$, section = '' where id = 27222;
update t_knowledge_point set title = $kp$Windows 中文件的操作：拖动与选择$kp$, content = $kp$① 相同磁盘：直接拖动→移动；按住【Ctrl】键不放再拖动→复制，鼠标指针后带有“(+)”。
② 不同磁盘：直接拖动→复制；按住【Shift】键不放再拖动→移动。
③ 创建快捷方式：按住【Ctrl】+【Shift】键不放再拖动（或按住【Alt】键拖动）。
④ 选定连续的多个文件：用【Shift】键。
⑤ 选定不连续的多个文件：用【Ctrl】键；再次单击已选中的文件可取消选定。$kp$, section = '' where id = 27255;
update t_knowledge_point set title = $kp$回收站$kp$, content = $kp$每一个逻辑硬盘都有一个回收站。被删除到回收站的文件仍占用磁盘空间，只有清空回收站才会真正删除。可以设置回收站的最大容量，也可以设置为删除文件时不放入回收站而直接删除。$kp$, section = '' where id = 27257;
update t_knowledge_point set title = $kp$Windows 的格式化$kp$, content = $kp$可以格式化硬盘、U 盘；可以选择快速格式化。$kp$, section = '' where id = 27264;
update t_knowledge_point set title = $kp$外设的组成$kp$, content = $kp$外设包括外存储器、输入设备、输出设备。$kp$, section = '' where id = 27277;
update t_knowledge_point set title = $kp$外设的构成（外存储器、输入设备、输出设备）$kp$, content = $kp$外设包括外存储器、输入设备、输出设备。$kp$, section = '' where id = 28007;
update t_knowledge_point set title = $kp$存储器的分类$kp$, content = $kp$存储器分为内存储器（主存）和外存储器（辅存）。$kp$, section = '' where id = 28082;
update t_knowledge_point set title = $kp$文件管理与程序设计语言$kp$, content = $kp$文件管理强调的是对外存的管理，例如 Windows 对外存的文件采用树状的目录管理方式，也就是文件夹的管理方式。

四、程序设计语言

程序设计语言就是人类和计算机交流的语言。计算机只认识二进制，所以只能识别二进制语言，也就是机器语言。BIOS 芯片里面存放的就是机器语言。高级语言程序和汇编语言程序都需要翻译成机器语言程序才能被计算机执行。$kp$, section = '' where id = 28303;
update t_knowledge_point set title = $kp$外围设备与计算机分类$kp$, content = $kp$外围设备（外设）：I/O 设备和外存储器等。

三、计算机分类

（一）按内部逻辑结构分类：单处理机、多处理机；16 位、32 位等。
（二）按计算机整体性能分类：巨型机、大型机、小型计算机、PC 机。$kp$, section = '' where id = 28630;
update t_knowledge_point set title = $kp$文件、文件属性与文件管理$kp$, content = $kp$文件是一组相关信息的集合，它存储在软盘、硬盘、光盘等外存储器上。Windows 系统中允许使用长文件名，最长可达 255 个字符。

文件说明信息包括：文件名、文件类型、文件物理位置、文件长度、文件时间（创建时间、最近修改时间、最近访问时间等）、文件创建者、文件属性等。

文件属性用于将文件标注为系统文件、隐藏文件、存档文件或只读文件。

文件目录的作用：通过文件名可以快速方便地获取文件的说明信息；提高文件的检索速度；允许文件在不同的目录中使用相同的名字；允许多个用户共享一个文件。

文件管理：文件系统在存储介质上为创建文件分配空间，为删除文件而回收空间，并对空闲空间进行管理。

文件说明信息保存在该文件的目录中，文件的内容（程序或数据）保存在磁盘的数据区中。

系统属性：表示该文件是 Windows 操作系统自身内部的文件，删除时会提出警告；在资源管理器中通常不显示（除非设置了“显示全部文件”）。

存档属性：由 Windows 的文件备份程序使用，用于决定文件是否需要备份。备份过后存档属性自动清除；若备份后又修改过文件，则存档属性又自动加上。

压缩属性：表示文件保存到磁盘上时，文件中的内容是否要进行压缩。

加密属性：表示文件保存到磁盘上时，文件中的内容是否要进行加密，以便不让无关用户了解文件内容。

编制索引属性：帮助编制该文件的索引，以便快速进行检索。

Windows 中采用树状结构来组织文件夹。每一个逻辑盘（如 C 盘、D 盘等）只有一个根文件夹，根文件夹不能被删除，根文件夹中可以有文件和其他子文件夹。

物理盘与逻辑盘的区别：物理盘可能只有一个，但可以将物理盘分区，每一个分区对应一个逻辑盘（如 C 盘、D 盘等），因而一个物理盘可对应多个逻辑盘；用户看到的是逻辑盘。

文件夹的最大优点是对文件的共享和保护提供了方便。一个文件夹设置为“共享”，含义是文件夹中所有的文件都可以为网络上其他用户所共享使用。

提高类知识点：

① 硬盘采用的文件管理程序有 FAT16（用于 2GB 以下硬盘）、FAT32（2GB 以上硬盘，Windows XP 下最大 32GB，单个文件最大 4GB）、NTFS（硬盘最大 2TB）。
② CD-ROM 采用的是 CDFS 文件管理程序。
③ CD-RW 和 DVD 采用的是 UDF 文件管理程序。$kp$, section = '' where id = 28708;
update t_knowledge_point set title = $kp$数据库（DB）的含义与特点$kp$, content = $kp$数据库（DB）是永久存储在外存上的物理数据，这些数据按一定的数据模型进行组织、描述和存储，具有冗余度低（不可能完全消除冗余）、数据独立性高、易扩展、可共享等特点。$kp$, section = '' where id = 28710;
update t_knowledge_point set title = $kp$计算机硬件的逻辑组成$kp$, content = $kp$从逻辑上讲，计算机硬件主要有：中央处理器、内存储器、外存储器、输入设备、输出设备、总线。$kp$, section = '' where id = 28715;
update t_knowledge_point set title = $kp$存储器速度排序（含外存）$kp$, content = $kp$由快到慢：CPU→寄存器→Cache→外存储器（优盘、硬盘、光盘）→后备存储器。$kp$, section = '' where id = 28866;
update t_knowledge_point set title = $kp$存储器的层状塔式结构$kp$, content = $kp$内存储器和外存储器组成一个层状的塔式结构。

1）目的：优化存储器的性能价格比。
2）存储器按读写速度由高到低排列：Cache、RAM、硬盘、光盘。$kp$, section = '' where id = 28893;
update t_knowledge_point set title = $kp$主机、外围设备与总线$kp$, content = $kp$计算机的主机：CPU、内存储器、总线等。

计算机的外围设备：外存储器、输入设备、输出设备。

5. 总线：提供各部件之间相互交换各种信息的通道。

总线按连接方式分为：前端总线（CPU 总线），连接内存和 CPU；I/O 总线（PCI 总线），连接内存与 I/O 设备。

总线传输的内容（信号）：数据信号、地址信号、控制信号。$kp$, section = '' where id = 28900;
update t_knowledge_point set title = $kp$内存储器与外存储器的区别$kp$, content = $kp$存储器分为内存储器和外存储器。外存不直接影响计算机的运行速度，影响计算机速度的主要是 CPU 和内存。

内存：运行速度快，断电后信息消失，存储容量小，由半导体芯片构成，可直接与 CPU 交换数据。

外存：运行速度慢，断电后信息不丢失，存储容量大，由磁性介质、光学介质或闪存芯片构成，不能直接与 CPU 交换数据，需先调入内存。

存储器的存取时间是指从 CPU 给出存储器地址开始，到存储器读出数据并送到 CPU（或把 CPU 的数据写入存储器）所需要的时间。$kp$, section = '' where id = 28903;
update t_knowledge_point set title = $kp$Windows 格式化的功能$kp$, content = $kp$- 可以格式化硬盘。
- 可以格式化 U 盘。
- 可以选择快速格式化。$kp$, section = '' where id = 28923;
update t_knowledge_point set title = $kp$服务器与硬盘的绿色节能$kp$, content = $kp$服务器和硬盘的耗电量巨大，为提供全时段数据访问，存储服务器及硬盘不能停机。但为了节能减排、绿色环保，需要采用更合理的协议和存储模式，尽可能减少开启服务器和硬盘的次数。$kp$, section = '' where id = 29973;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22133,24575,26712,26989,27014,27022,27205,27209,27222,27255,27257,27264,27277,28007,28082,28303,28630,28708,28710,28715,28866,28893,28900,28903,28923,29973) and not deleted) <> 26 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
