-- 知识点 54 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_54
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_54 as
select * from t_knowledge_point where id in (21824,21874,21893,21955,22006,22171,22239,23641,25216,26708,26985,27007,27180,27182,27183,27184,27185,27249,27267,27268,27270,27274,27585,27701,28057,28060,28061,28252,28386,28563,28644,28645,28681,28682,28683,28738,28739,28784,28819,28904,28929,28948,30141);

update t_knowledge_point set title = $kp$计算机中数据单位与字长$kp$, content = $kp$位（bit，比特）：表示信息的最小单位，1 bit 简写为 1b（小写字母 b）。

字节（Byte）：最常用的信息基本单位，1 Byte 简写为 1B（大写字母 B）。

字长：计算机一次能处理的二进制位数，或指运算器和寄存器的宽度。字长为 32 位的 CPU 所在计算机称为 32 位机，这里的 32 位就是字长，通常也可称为双字。

基本换算：1B = 8b。$kp$, section = '' where id = 21824;
update t_knowledge_point set title = $kp$键盘的作用与工作原理$kp$, content = $kp$键盘是计算机最常用、最主要的输入设备，必不可少。

键盘上的按键大多是电容式的。用户按下按键时，按键发出不同的信号，这些信号由键盘内部的电子线路转换成相应的二进制代码，再通过键盘接口（PS/2 或 USB）送入计算机。

无线键盘采用无线接口，与主机之间没有直接的物理连线，而是通过无线电波将输入信息传送给主机上安装的专用接收器。$kp$, section = '' where id = 21874;
update t_knowledge_point set title = $kp$计算机的存储程序控制工作原理$kp$, content = $kp$迄今为止，计算机按照美籍匈牙利数学家冯·诺依曼提出的“存储程序控制”原理工作：一个问题的运算步骤（程序）连同它所处理的数据都用二进制表示，并预先存放在存储器中。程序运行时，CPU 从内存中一条一条地取出指令和相应的数据，按指令操作码的规定对数据进行运算处理，直到程序执行完毕。$kp$, section = '' where id = 21893;
update t_knowledge_point set title = $kp$键盘的作用、工作原理与接口$kp$, content = $kp$① 作用：将字符或命令等输入到计算机中。

② 工作原理：用户按下按键时，键盘内的控制电路根据该键的位置把该字符信号转换为二进制码（键扫描码），通过电缆送给主机。

③ 按键个数：104 键盘（台式 PC 机普遍采用）、108 键盘。

④ I/O 接口：PS/2 接口、USB 接口、无线接口（用于无线键盘）。$kp$, section = '' where id = 21955;
update t_knowledge_point set title = $kp$鼠标器的作用、指标、分类与接口$kp$, content = $kp$① 作用：一种指示设备（pointing device），能方便地控制屏幕上的鼠标箭头准确地定位在指定位置，并通过按键完成各种操作或发出命令。

② 组成：左键、右键、滚轮等。

③ 分辨率：鼠标器最主要的技术指标，用 dpi（dot per inch，每英寸点数）表示，指鼠标每移动一英寸距离光标在屏幕上所通过的像素数目，目前多为 300～400 dpi。

④ 按结构分类：机械式鼠标结构简单、价格便宜，但准确性和灵敏度较差；光电式鼠标速度快、准确性和灵敏度高、寿命长，需要专用垫板；光机式鼠标精度较高，不需特殊衬垫。

⑤ 连接到主机的接口：RS-232 串行口（9 针 D 形）、PS/2 接口（6 针圆形）、USB 接口、无线接口。$kp$, section = '' where id = 22006;
update t_knowledge_point set title = $kp$平板式扫描仪工作原理$kp$, content = $kp$光源发出的光照射放在玻璃板上的被扫描原稿，原稿的反射光经反射镜反射后由镜头聚焦到 CCD 上，CCD（电荷耦合器件）进行光电转换，产生电流并输出；扫描臂沿扫描方向移动，逐行完成整幅原稿的扫描。$kp$, section = '' where id = 22171;
update t_knowledge_point set title = $kp$输入设备与主机的接口类型$kp$, content = $kp$手写板等输入设备与主机的接口主要有串行口和 USB 两种。手写板配手写笔，屏幕上可显示汉字、英文、数字及手写、拼音等输入状态，并设有选项、返回等功能键。$kp$, section = '' where id = 22239;
update t_knowledge_point set title = $kp$鼠标器的分类与工作原理$kp$, content = $kp$鼠标器最主要的技术指标是分辨率，用 dpi 表示，指鼠标移动中每移动一英寸能准确定位的最大信息数。

鼠标按结构分为机械鼠标、光电鼠标、无线鼠标。

光电鼠标：使用一个微型镜头不断拍摄鼠标下方的图像，经过专用微处理器（数字信号处理器 DSP）对图像颜色或纹理的变化进行分析，判定鼠标移动的方向和距离。

无线鼠标：通过红外线或无线电波将输入信息传送给主机上安装的专用接收器。红外线型无线鼠标有严格的方向性，对水平位置非常敏感；采用无线电波的鼠标灵活得多，因为无线电波是辐射状传播的。$kp$, section = '' where id = 23641;
update t_knowledge_point set title = $kp$键盘、鼠标器与触摸屏的特点$kp$, content = $kp$一、键盘

- 键盘是 PC 的标准输入设备，按键包括数字键、字母键、符号键、运算键以及若干控制键和功能键。
- 按键大多是电容式，采用密封组装，键体不可拆卸。
- 接口：PS/2、RS-232、USB、蓝牙。

控制键的作用：

- Alt、Ctrl：含义由正在运行的程序决定。
- F1～F12：12 个功能键，功能由操作系统及运行的应用程序决定。
- Insert：切换字符输入的覆盖方式与插入方式。
- Num Lock：切换数字小键盘与光标控制键。
- Delete 删除；Home 光标移到文档起始位置或行首；End 移到行尾；Esc；Page Up；Page Down；Print Screen。

特殊控制键：电源控制键、多媒体控制键（声音）、因特网控制键。

二、鼠标器

- 借助机电或光学原理，将移动的距离和方向转换为脉冲信号输入计算机，再由鼠标驱动程序把脉冲信号转换为位移量。
- 鼠标按键的按下与释放（左键、右键）均以电信号传送给主机。
- 光电鼠标由微型镜头和发光二极管组成，微型镜头拍摄图像后交由数字信号处理器 DSP 计算移动距离和方向。
- 接口：PS/2、RS-232、USB、蓝牙。
- 1984 年发明。
- 可代替鼠标的输入装置：轨迹球、指点杆、触摸板、手写笔、光笔、操纵杆、触摸屏。

三、触摸屏

- 受压产生电流。
- 是平板电脑、智能手机等数码产品上广泛使用的一种输入/输出设备。
- 基于电容传感器原理，可同时感知多个触控点。
- 手写笔的工作原理为电磁感应原理或电容式触控技术。$kp$, section = '' where id = 25216;
update t_knowledge_point set title = $kp$键盘与鼠标的分类、原理、操作及接口$kp$, content = $kp$一、键盘

分类：按外形尺寸和键区组成，可分为全尺寸键盘（含主键区、功能键区、编辑键区、数字键区四个键区）等类别。

工作原理：实时监视按键，将按键信息送入计算机。键盘内部的键位扫描电路定位被按键的位置，编码电路产生被按键的代码，接口电路将代码送入计算机，这些电路统称为键盘控制电路。

正确操作方法：左手食指、中指、无名指、小指和右手食指、中指、无名指、小指分别放在 8 个基本键位“ASDFJKL;”上。

接口：键盘与主机连接的接口方式，常见有老式 AT 接口、PS/2 接口和 USB 接口三种。

二、鼠标

分类：按键数可分为两键鼠标、三键鼠标、五键鼠标和新型的多键鼠标。

工作原理：光电鼠标内部有一个发光二极管，其发出的光线照亮鼠标底部表面；底部表面反射回的一部分光线通过一组光学透镜，传输到光感应器件（微成像器）内成像，据此判断移动。

基本操作：指向、单击、双击、右击、拖动五种。

接口：常见有串口、PS/2、USB 三种。$kp$, section = '' where id = 26708;
update t_knowledge_point set title = $kp$鼠标的基本操作$kp$, content = $kp$鼠标的基本操作有以下几种：

（1）指向：用于激活对象或显示提示信息。

（2）单击（左键）：用于选定某个对象、某个选项或按钮等。

（3）右击（单击右键）：弹出对象的快捷菜单或帮助提示。

（4）双击：用于启动程序或打开窗口。

（5）拖曳：常用于滚动条操作、标尺滑块操作，或复制、移动对象。$kp$, section = '' where id = 26985;
update t_knowledge_point set title = $kp$输入法的使用$kp$, content = $kp$（1）启动和关闭输入法：按 Ctrl+Space 键。

（2）输入法切换：按 Ctrl+Shift 键，或单击“输入法指示器”，在弹出的输入法菜单中选择一种汉字输入法。

（3）全角/半角切换：按 Shift+Space 键，或单击输入法状态窗口中的“全角/半角切换”按钮。

（4）中英文标点切换：按 Ctrl+. 键，或单击“输入法指示器”中的“中英文标点切换”按钮。

（5）特殊字符（如希腊字母、数学符号）的输入：通过输入法指示器上的“软键盘”输入较为方便。单击“软键盘”可打开或关闭软键盘（不是按 Esc 键）；右击“软键盘”，可从中选择一种软键盘（共 13 种）。$kp$, section = '' where id = 27007;
update t_knowledge_point set title = $kp$键盘的分类$kp$, content = $kp$键盘有机械式和电容式，目前主流的键盘属于电容式键盘。$kp$, section = '' where id = 27180;
update t_knowledge_point set title = $kp$鼠标的分类$kp$, content = $kp$鼠标按结构可分为机械鼠标和光电鼠标。$kp$, section = '' where id = 27182;
update t_knowledge_point set title = $kp$光电鼠标的识别方式$kp$, content = $kp$光电鼠标通过激光器发出的光照射鼠标底部表面，识别鼠标移动的方向和距离。$kp$, section = '' where id = 27183;
update t_knowledge_point set title = $kp$光电鼠标的识别方式$kp$, content = $kp$光电鼠标通过激光或红外线识别鼠标移动的方向和距离。$kp$, section = '' where id = 27184;
update t_knowledge_point set title = $kp$鼠标的分辨率$kp$, content = $kp$鼠标的分辨率指鼠标每移动 1 英寸光标在屏幕上通过的点数，单位为 dpi（dot per inch，每英寸点数）。$kp$, section = '' where id = 27185;
update t_knowledge_point set title = $kp$串口 RS-232 连接鼠标$kp$, content = $kp$串口 RS-232 可以连接鼠标。$kp$, section = '' where id = 27249;
update t_knowledge_point set title = $kp$文档中选定文本的鼠标操作$kp$, content = $kp$在文档中：Ctrl+单击鼠标左键选择一个句子；双击鼠标左键选择一个词组；三击鼠标左键选择一个段落。$kp$, section = '' where id = 27267;
update t_knowledge_point set title = $kp$在选定区用鼠标选定文本$kp$, content = $kp$在文档左侧的选定区：单击鼠标左键选择一行；双击鼠标左键选择一段；三击鼠标左键选择整个文档。$kp$, section = '' where id = 27268;
update t_knowledge_point set title = $kp$用鼠标调整行高与列宽$kp$, content = $kp$将鼠标移到行（或列）的边框上，光标变为双向箭头时按住左键拖动，可调整行高（或列宽）；也可右击，在弹出的快捷菜单中选择“行高”或“列宽”。$kp$, section = '' where id = 27270;
update t_knowledge_point set title = $kp$在选定区选定行、段与全文$kp$, content = $kp$在文档左侧的选定区：单击鼠标左键选择一行；双击鼠标左键选择一段；三击鼠标左键选择整个文档。$kp$, section = '' where id = 27274;
update t_knowledge_point set title = $kp$字音编码$kp$, content = $kp$字音编码：以汉字的读音为编码依据，如智能 ABC、微软拼音、搜狗拼音等。$kp$, section = '' where id = 27585;
update t_knowledge_point set title = $kp$键盘上的定位键$kp$, content = $kp$为便于盲打，键盘上有两个定位键，分别是 F 键和 J 键。$kp$, section = '' where id = 27701;
update t_knowledge_point set title = $kp$键盘和鼠标的常用接口$kp$, content = $kp$键盘和鼠标的常用接口：USB、PS/2（专用接口）。$kp$, section = '' where id = 28057;
update t_knowledge_point set title = $kp$键盘的分类$kp$, content = $kp$键盘有机械式和电容式，目前主流的键盘属于电容式键盘。$kp$, section = '' where id = 28060;
update t_knowledge_point set title = $kp$光电鼠标的识别方式$kp$, content = $kp$光电鼠标通过激光或红外线识别鼠标器移动的方向和距离。$kp$, section = '' where id = 28061;
update t_knowledge_point set title = $kp$键盘和鼠标的常用接口$kp$, content = $kp$键盘和鼠标的常用接口：USB、PS/2（键盘和鼠标的专用接口）。$kp$, section = '' where id = 28252;
update t_knowledge_point set title = $kp$键盘的分类$kp$, content = $kp$键盘有机械式和电容式，目前主流的键盘属于电容式键盘。$kp$, section = '' where id = 28386;
update t_knowledge_point set title = $kp$键盘上的定位键$kp$, content = $kp$为便于盲打，键盘上有两个定位键，分别是 F 键和 J 键。$kp$, section = '' where id = 28563;
update t_knowledge_point set title = $kp$键盘与主机的接口$kp$, content = $kp$键盘与主机的接口：AT 接口（早期）、PS/2 接口、USB 接口、无线接口（红外线传输范围小，无线电波传输较灵活）。$kp$, section = '' where id = 28644;
update t_knowledge_point set title = $kp$鼠标器的分类与光电鼠标特点$kp$, content = $kp$鼠标器分类：

1）机械式鼠标。

2）光机式鼠标。

3）光学（电）鼠标：工作速度快，准确性和灵敏度高，分辨率可达 800 dpi，没有机械磨损，很少需要维护，也不需要鼠标垫。$kp$, section = '' where id = 28645;
update t_knowledge_point set title = $kp$键盘接口与鼠标技术指标$kp$, content = $kp$键盘接口：PS/2、USB、无线接口。

鼠标：左右键功能可以互换；主要技术指标为分辨率，单位为 dpi。$kp$, section = '' where id = 28681;
update t_knowledge_point set title = $kp$鼠标的种类$kp$, content = $kp$鼠标种类：机电鼠标（早期使用）、光电鼠标（现在使用）。光电鼠标由发光二极管和微型镜头（记录轨迹）构成。$kp$, section = '' where id = 28682;
update t_knowledge_point set title = $kp$鼠标接口与手写板、扫描仪$kp$, content = $kp$鼠标接口：RS-232（现已不使用）、PS/2、USB、无线接口（必须在主机上插接收器）。

手写板：兼有鼠标和键盘的功能。OCR（文字识别软件）能把像素文本转换成数字文本。

此外还有扫描仪等输入设备。$kp$, section = '' where id = 28683;
update t_knowledge_point set title = $kp$键盘的接口$kp$, content = $kp$键盘是计算机系统的标准配置，必须有；它的接口有 AT（RS-232）、PS/2、USB、无线接口。$kp$, section = '' where id = 28738;
update t_knowledge_point set title = $kp$鼠标器的发明、种类与接口$kp$, content = $kp$鼠标器是 1984 年发明的，种类有机械式、光电式等，如指点杆、触摸屏、轨迹球、手柄、光笔等；接口主要有 PS/2、RS-232、USB、无线接口。$kp$, section = '' where id = 28739;
update t_knowledge_point set title = $kp$文件的选择操作$kp$, content = $kp$单选：鼠标左键单击。

框选：按住鼠标左键拖出矩形框。

连续选择：先选择第一个文件，按住 Shift 再点选最后一个。

不连续选择：按住 Ctrl 键，依次点选每一个。

全选：Ctrl+A。$kp$, section = '' where id = 28784;
update t_knowledge_point set title = $kp$键盘与鼠标概述$kp$, content = $kp$本节介绍键盘、鼠标的分类、工作原理、基本操作以及所采用的接口类型；下一节为常用输出设备。$kp$, section = '' where id = 28819;
update t_knowledge_point set title = $kp$输入设备：键盘与鼠标$kp$, content = $kp$计算机必备的输入设备是键盘（2006、2012 年考过）。为便于盲打，键盘上有两个定位键，分别是 F 键和 J 键（2013 年考过）。光电鼠标通过激光或红外线识别鼠标器移动的方向和距离（2012 年考过）。$kp$, section = '' where id = 28904;
update t_knowledge_point set title = $kp$键盘与鼠标的分类、工作原理、基本操作及接口类型$kp$, content = $kp$键盘和鼠标的分类、工作原理、基本操作以及所采用的接口类型，属于了解内容。$kp$, section = '' where id = 28929;
update t_knowledge_point set title = $kp$鼠标的工作原理$kp$, content = $kp$用户移动鼠标时，鼠标把移动的速度和方向变换成脉冲信号输入计算机，从而控制屏幕上鼠标箭头的运动。$kp$, section = '' where id = 28948;
update t_knowledge_point set title = $kp$功能键F1～F12的作用由前台程序决定$kp$, content = $kp$键盘上的12个功能键（F1～F12）的具体功能，由正在前台执行的程序决定。$kp$, section = '' where id = 30141;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21824,21874,21893,21955,22006,22171,22239,23641,25216,26708,26985,27007,27180,27182,27183,27184,27185,27249,27267,27268,27270,27274,27585,27701,28057,28060,28061,28252,28386,28563,28644,28645,28681,28682,28683,28738,28739,28784,28819,28904,28929,28948,30141) and not deleted) <> 43 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
