-- 知识点 53 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_53
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_53 as
select * from t_knowledge_point where id in (21823,21869,21900,21975,22025,22031,22033,22170,22177,22179,22187,22213,22245,23212,23337,23435,23466,24233,24985,25217,25340,26707,27179,27181,27186,27295,27587,27628,27629,27702,28059,28062,28063,28413,28564,28615,28616,28646,28647,28684,28717,28740,28741,28742,28911,28950,29141,29701,29936,30120);

update t_knowledge_point set title = $kp$计算机的发展$kp$, content = $kp$| 代别 | 年代 | 主要元器件 | 配置的软件 | 主要应用 |
| --- | --- | --- | --- | --- |
| 第1代 | 20世纪40年代中期至50年代末 | CPU：电子管；内存：磁鼓 | 机器语言和汇编语言 | 科学计算和工程计算 |
| 第2代 | 20世纪50年代中后期至60年代中期 | CPU：晶体管；内存：磁芯 | FORTRAN等高级程序设计语言 | 开始广泛应用于数据处理 |
| 第3代 | 20世纪60年代中期至70年代初期 | CPU：SSI、MSI；内存：SSI、MSI半导体存储器 | 操作系统、数据库管理系统开始使用 | 科学计算、数据处理、工业控制 |
| 第4代 | 20世纪70年代中期以来 | CPU：LSI、VLSI；内存：LSI、VLSI半导体存储器 | 软件工程、分布式计算、网络软件广泛使用 | 深入各行各业，家庭和个人开始使用 |$kp$, section = '' where id = 21823;
update t_knowledge_point set title = $kp$输入设备概述$kp$, content = $kp$输入（input）有两重含义：一是把信息送入计算机的过程；二是向计算机输入的内容。

输入设备的功能是向计算机输入信息，常见的有：
- 键盘：输入文字、符号和命令；
- 鼠标：输入移动位置信息及按钮命令；
- 扫描仪：输入图片；
- 麦克风：输入声音；
- 条码、磁卡、IC卡等的扫描器/阅读器：输入文字符号。

输入设备的共性：不论信息的原始形态如何，输入到计算机中的信息都用二进制表示。$kp$, section = '' where id = 21869;
update t_knowledge_point set title = $kp$手写输入与触摸屏$kp$, content = $kp$背景：手写汉字比键盘输入汉字更符合习惯；平板电脑、智能手机、MP3播放器、GPS定位仪等便携式数字设备体积有限。

使用的设备：早期为手写板，当前为触摸屏。$kp$, section = '' where id = 21900;
update t_knowledge_point set title = $kp$外部设备包括输入设备和输出设备$kp$, content = $kp$外部设备包括输入设备和输出设备。扫描仪是输入设备，常见的输入设备还有鼠标、键盘、手写板等。$kp$, section = '' where id = 21975;
update t_knowledge_point set title = $kp$扫描仪的光电转换与模数转换$kp$, content = $kp$光线经原稿反射后通过透镜到达CCD芯片，并转换为模拟电流；模拟电流信号再经模数转换器（ADC）转换为数字信号。$kp$, section = '' where id = 22025;
update t_knowledge_point set title = $kp$扫描仪$kp$, content = $kp$作用：将图片（照片）或文字输入计算机的一种输入设备。

工作原理：接收从稿件上反射回来的光线，经光电转换成电信号，获得数字图像。CCD（Charge Coupled Device，电荷耦合器件）实现光电转换。

性能指标：
- 分辨率：用每英寸生成的像素数目（dpi）表示，一般为600×1200 dpi、1200×2400 dpi；
- 色彩位数：位数越多，反映的色彩越丰富，一般为24位、30位、36位；
- 幅面：原稿的最大尺寸，一般为A4、A3等。

I/O接口：SCSI接口、USB接口、FireWire（IEEE 1394）接口。$kp$, section = '' where id = 22031;
update t_knowledge_point set title = $kp$数码相机$kp$, content = $kp$作用：图像输入设备。不需要使用胶卷，能直接将照片以数字形式记录下来，并输入电脑进行存储、处理和显示，或通过打印机打印，或与电视机连接观看。$kp$, section = '' where id = 22033;
update t_knowledge_point set title = $kp$平板式与滚筒式扫描仪$kp$, content = $kp$平板式扫描仪主要扫描反射式稿件，适用范围较广，扫描速度、精度和质量较好。滚筒式和胶片专用扫描仪属高分辨率专业扫描仪，技术性能很高，多用于专业印刷排版领域。$kp$, section = '' where id = 22170;
update t_knowledge_point set title = $kp$手持式扫描仪$kp$, content = $kp$扫描头较窄，只适用于扫描较小的图件。$kp$, section = '' where id = 22177;
update t_knowledge_point set title = $kp$扫描仪的作用$kp$, content = $kp$扫描仪是将原稿（图片、照片、底片、书稿）输入计算机的一种输入设备。扫描仪输入到计算机中的是原稿的“图像”（bitmap）。$kp$, section = '' where id = 22179;
update t_knowledge_point set title = $kp$数码相机的工作原理$kp$, content = $kp$工作流程：镜头→光信号→CMOS/CCD阵列→模拟电信号→A/D转换→数字信号→图像处理与数据压缩→图像数据→存储器→接口电路→PC机、打印机或电视机。

光信号聚焦在CCD或CMOS成像芯片上，并由成像芯片转换成电信号；成像芯片的像素数目越多，图像的分辨率就越高。使用嵌入式处理器和数字信号处理器（DSP）对图像进行色彩处理和数据压缩，图像以JPEG格式表示。存储器使用闪烁存储器做成的可插拔存储卡，如SD卡、xD卡、CF卡、Memory Stick卡和MMC卡；接口为USB接口或IEEE 1394接口。$kp$, section = '' where id = 22187;
update t_knowledge_point set title = $kp$触摸屏的原理与应用$kp$, content = $kp$应用：公共场所的多媒体电脑或查询终端、演播室或会议室使用的带触摸屏的显示器、带触摸屏的手机。

原理：触摸屏是在液晶面板上覆盖一层压力板，它对压力很敏感；当手指或笔尖施压其上时会产生电流以确定压力源的位置，并对其进行跟踪，然后通过软件识别出用户所输入的信息。$kp$, section = '' where id = 22213;
update t_knowledge_point set title = $kp$扫描仪的色彩位数（色彩深度）$kp$, content = $kp$反映扫描仪对图像色彩的辨析能力。位数越多，扫描仪所能反映的色彩越丰富，扫描的图像效果也越真实，例如24 bit、32 bit、36 bit、42 bit、48 bit。$kp$, section = '' where id = 22245;
update t_knowledge_point set title = $kp$输入与输入设备的基本概念$kp$, content = $kp$输入（input）：把信息送入计算机的过程；作名词使用时，指的是向计算机输入的内容。

输入设备：用来向计算机输入信息的设备，可用于向计算机输入命令、数据、文本、声音、图像和视频等信息。

不论信息的原始形态如何，输入到计算机中的信息都使用二进制中的“0”和“1”两个符号来表示。$kp$, section = '' where id = 23212;
update t_knowledge_point set title = $kp$扫描仪的工作过程$kp$, content = $kp$1. 将待扫描的文档面朝下放在玻璃板上；
2. 明亮的光源在文档下方移动；
3. 文档图像反射到一组镜子中；
4. 光线由电荷耦合器件（CCD）转换为模拟电流；
5. 模拟信号由模数转换器（ADC）转换为数字信号；
6. 数字信息送入计算机软件，供绘图、桌面出版等软件使用；
7. 在屏幕上显示被扫描的图像。$kp$, section = '' where id = 23337;
update t_knowledge_point set title = $kp$数码相机的作用$kp$, content = $kp$作用：获取现实世界中景物的数字图像。与普通相机的区别是不使用胶卷，图像以数字形式记录和存储；与扫描仪的区别是直接拍摄景物，而不是扫描平面原稿。$kp$, section = '' where id = 23435;
update t_knowledge_point set title = $kp$CMOS/CCD像素数目$kp$, content = $kp$决定数字图像能够达到的最高分辨率。例如分辨率最高为1600×1200时，共有192万个像素（约200万像素）。$kp$, section = '' where id = 23466;
update t_knowledge_point set title = $kp$智能手机和平板电脑中的传感器$kp$, content = $kp$触摸屏、摄像头、微型话筒等设备的核心都是传感器，此外还有多种不同用途的传感器。$kp$, section = '' where id = 24233;
update t_knowledge_point set title = $kp$近距离传感器$kp$, content = $kp$通过红外线进行测距。当手机用户接听电话或手机装进口袋时，传感器可以判断出手机贴近了人脸或衣服，从而关闭屏幕的触控功能，以防止误操作。$kp$, section = '' where id = 24985;
update t_knowledge_point set title = $kp$输入设备：扫描仪、数码相机与传感器$kp$, content = $kp$- 扫描仪
  - 将原稿（图片、照片、底片、书稿）的图像输入计算机的输入设备
  - 基于光电转换原理：光学信号经CCD（电荷耦合器件）转为电信号，再经A/D（模数转换器）转为数字信号，经软件处理后得到图像（TIF或JPEG）
  - 分类：手持式适用于超市、书店，逐行扫描文字稿；平板式适用范围广，用于家用和办公室，可扫描单页纸或逐页扫描书本；胶片专用为高分辨率专业扫描仪，用于专业印刷排版、海报；另有滚筒式
  - 性能指标：光学分辨率反映清晰程度，用纵向和横向每英寸的取样点（像素）数目dpi表示；色彩位数（像素深度）如24位即2的24次方种颜色，可选择黑白、灰度、彩色工作模式，并设置灰度级数、色彩位数；扫描幅面为能扫描原稿的最大尺寸，常见A4、A3等；接口为USB、SCSI（SAS）、IEEE 1394
- 数码相机/摄像头
  - 不需要使用胶卷，直接将照片以数字形式记录下来
  - 不使用光敏卤化银胶片成像：影像聚集在成像芯片（CCD或CMOS）上并由其转换成电信号，再经模数转换器（A/D转换器）得到数字图像
  - 成像芯片CCD、CMOS是数码相机的核心；CCD像素排列的矩形图像宽高比为4:3或3:2
  - 性能指标：像素数目越多，影像分解的点越多，图像的分辨率越高，如1600×1200共有192万个像素（约200万像素）；存储器容量与存取速度，如CF卡、Memory Stick记忆棒、SD（miniSD）卡、Micro SD卡
- 传感器：一种检测装置，将被测信息转换为电信号，供计算机测量、转换、存储、显示和传输$kp$, section = '' where id = 25217;
update t_knowledge_point set title = $kp$输入设备：键盘、鼠标、扫描仪、数码相机$kp$, content = $kp$- 键盘
- 鼠标：类型有机械鼠标、光电鼠标、无线鼠标；分辨率为dpi
- 扫描仪：分辨率为dpi；色彩位数为24位/36位/48位，决定色彩表现能力；类型有手持式（超市）、平板式（办公室）、滚筒式（专业）
- 数码相机：像素由CCD决定，如500万、1000万像素；原理为CCD/CMOS成像芯片完成光电转换，再经A/D模数转换把模拟信号变为数字信号$kp$, section = '' where id = 25340;
update t_knowledge_point set title = $kp$键盘、鼠标、笔输入设备、扫描仪、数字摄像头概述$kp$, content = $kp$1）键盘：用于操作计算机设备运行的指令和数据输入装置，也指经过系统安排操作一台机器或设备的一组功能键（如打字机、电脑键盘）。
2）鼠标：计算机的一种外接输入设备，也是计算机显示系统纵横坐标定位的指示器。
3）笔输入设备：主要有手写板、手写笔。
4）扫描仪：一种捕获影像的装置，作为光机电一体化的电脑外设产品，可将影像转换为计算机可以显示、编辑、存储和输出的数字格式。
5）数字摄像头：可以将视频采集设备产生的模拟视频信号转换成数字信号，进而将其储存在计算机里。$kp$, section = '' where id = 26707;
update t_knowledge_point set title = $kp$计算机必备的输入设备$kp$, content = $kp$计算机必备的输入设备是键盘。$kp$, section = '' where id = 27179;
update t_knowledge_point set title = $kp$最常用的输入设备$kp$, content = $kp$鼠标是最常用的输入设备。$kp$, section = '' where id = 27181;
update t_knowledge_point set title = $kp$数码相机的成像芯片$kp$, content = $kp$数码相机的成像芯片是CCD或CMOS。$kp$, section = '' where id = 27186;
update t_knowledge_point set title = $kp$传感器属于输入设备$kp$, content = $kp$传感器属于输入设备。$kp$, section = '' where id = 27295;
update t_knowledge_point set title = $kp$形音编码$kp$, content = $kp$形音编码吸取了字音和字形的优点。$kp$, section = '' where id = 27587;
update t_knowledge_point set title = $kp$数字编码$kp$, content = $kp$数字编码使用一串数字表示汉字，并转换为汉字输入码。$kp$, section = '' where id = 27628;
update t_knowledge_point set title = $kp$字音编码$kp$, content = $kp$字音编码如智能ABC、微软拼音、搜狗拼音等。$kp$, section = '' where id = 27629;
update t_knowledge_point set title = $kp$扫描仪的工作原理$kp$, content = $kp$扫描仪的工作原理是光电转换。$kp$, section = '' where id = 27702;
update t_knowledge_point set title = $kp$键盘与鼠标$kp$, content = $kp$计算机必备的输入设备是键盘，鼠标是最常用的输入设备。$kp$, section = '' where id = 28059;
update t_knowledge_point set title = $kp$扫描仪$kp$, content = $kp$扫描仪是将图片或文字输入计算机的一种输入设备。$kp$, section = '' where id = 28062;
update t_knowledge_point set title = $kp$数码相机的成像芯片$kp$, content = $kp$数码相机的成像芯片是CCD或者CMOS。$kp$, section = '' where id = 28063;
update t_knowledge_point set title = $kp$形音编码$kp$, content = $kp$形音编码吸取了字音和字形的优点。$kp$, section = '' where id = 28413;
update t_knowledge_point set title = $kp$数码相机与传统相机的相同点$kp$, content = $kp$数码相机与传统相机的镜头、快门设备基本相同。$kp$, section = '' where id = 28564;
update t_knowledge_point set title = $kp$扫描仪输入的是图像而非图形$kp$, content = $kp$扫描仪输入到计算机中的是原稿的“图像”（bitmap，格式如TIF），不是图形。$kp$, section = '' where id = 28615;
update t_knowledge_point set title = $kp$扫描仪的主要性能指标$kp$, content = $kp$1）光学分辨率（dpi）：反映图像大小，分辨率越高，扫描后的图像越大、越清晰，例如1200×2400 dpi；扫描仪的分辨率决定了扫描仪的档次和价格。
2）色彩位数（色彩深度）：反映色彩逼真度，色彩位数越多，图像越真实，例如32 bit。
3）扫描幅面：指被扫描原稿的最大尺寸，例如A3、A4等。
4）与主机的接口类型：SCSI、USB、IEEE 1394接口。$kp$, section = '' where id = 28616;
update t_knowledge_point set title = $kp$扫描仪的分类$kp$, content = $kp$手持式扫描仪、平板式扫描仪（家用和办公自动化领域广泛应用）、胶片专用扫描仪和滚筒式扫描仪（专业印刷排版领域）。$kp$, section = '' where id = 28646;
update t_knowledge_point set title = $kp$扫描仪的性能指标$kp$, content = $kp$1）分辨率（dpi）；
2）色彩位数（色彩深度）：色彩位数越多，能反映的色彩越丰富，扫描效果也越真实；
3）最大扫描幅面；
4）与主机的接口：SCSI、USB、IEEE 1394等。$kp$, section = '' where id = 28647;
update t_knowledge_point set title = $kp$数码相机的核心部件$kp$, content = $kp$成像芯片：CCD（高端相机）、CMOS（低端相机）；A/D转换器：把模拟信号转换成数字信号；DSP：数字信号处理器，用于调整图像质量、压缩图片。$kp$, section = '' where id = 28684;
update t_knowledge_point set title = $kp$输入设备的主要类型$kp$, content = $kp$输入设备主要有：键盘、鼠标（含触摸屏、指点杆、轨迹球）、扫描仪、麦克风、光笔、DC（数码相机）、DV（数码摄像机）。$kp$, section = '' where id = 28717;
update t_knowledge_point set title = $kp$扫描仪的分类$kp$, content = $kp$扫描仪分为三种：手持式（用于超市、书店）、平板式（用于办公室）、胶片专用滚筒式（用于专业印刷排版领域）。$kp$, section = '' where id = 28740;
update t_knowledge_point set title = $kp$扫描仪的核心器件与性能指标$kp$, content = $kp$扫描仪的核心器件是CCD（电荷耦合器件），性能指标有分辨率、色彩深度、扫描幅面和接口类型。$kp$, section = '' where id = 28741;
update t_knowledge_point set title = $kp$数码相机的核心器件与存储介质$kp$, content = $kp$DC（数码相机）的核心器件是CCD（旧）或CMOS（新）；存储介质是Flash ROM；像素数目在200万～300万的已能满足一般使用。$kp$, section = '' where id = 28742;
update t_knowledge_point set title = $kp$数码相机的成像与存储特点$kp$, content = $kp$数码相机的成像在成像芯片（CCD或CMOS）上，与传统相机的镜头、快门设备基本相同；能储存相片的多少与存储容量、图片尺寸和像素等有关。$kp$, section = '' where id = 28911;
update t_knowledge_point set title = $kp$其他指点设备$kp$, content = $kp$其他指点设备：1）触摸屏，适用于服务性公共场所；2）操纵杆，经常用于游戏控制。$kp$, section = '' where id = 28950;
update t_knowledge_point set title = $kp$扫描仪的性能指标$kp$, content = $kp$性能指标：1）分辨率（dpi），每英寸上所包含的点数；2）色彩位数（色彩深度），色彩位数越多，能反映的色彩就越丰富，扫描效果也越真实；3）最大扫描幅面；4）与主机的接口，如SCSI、USB、IEEE-1394等。$kp$, section = '' where id = 29141;
update t_knowledge_point set title = $kp$汉字输入编码与内码$kp$, content = $kp$用不同的输入编码方法输入同一个汉字，其内码是一样的。联机手写汉字识别使用笔输入设备；印刷体汉字识别输入使用扫描仪和OCR。$kp$, section = '' where id = 29701;
update t_knowledge_point set title = $kp$汉字输入编码的分类$kp$, content = $kp$汉字输入编码分为：数字编码（如电报码）、字音编码（如搜狗拼音）、字形编码（如五笔字型）、形音编码（如自然码）。$kp$, section = '' where id = 29936;
update t_knowledge_point set title = $kp$扫描仪的核心设备$kp$, content = $kp$核心设备：CCD（电荷耦合器件）把光转换成电；A/D（模数转换器）把模拟电流信号转换成数字信号。$kp$, section = '' where id = 30120;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21823,21869,21900,21975,22025,22031,22033,22170,22177,22179,22187,22213,22245,23212,23337,23435,23466,24233,24985,25217,25340,26707,27179,27181,27186,27295,27587,27628,27629,27702,28059,28062,28063,28413,28564,28615,28616,28646,28647,28684,28717,28740,28741,28742,28911,28950,29141,29701,29936,30120) and not deleted) <> 50 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
