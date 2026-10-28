-- 知识点 122 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_122
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_122 as
select * from t_knowledge_point where id in (23234,23263,23305,23325,23468,25131,26791,27497,27498,27500,27501,27502,27514,28206,28207,28209,28210,28211,28212,28350,28405,29518,29523,29598,29599,29623,29624,29649,29650,29652);

update t_knowledge_point set title = $kp$数字图像获取设备$kp$, content = $kp$从现实世界获得数字图像过程中所使用的设备通称为数字图像获取设备。

其功能是将现实的景物输入到计算机内，并以取样图像的形式表示。

2D 图像获取设备（如扫描仪、数码相机等）只能对图片或景物的 2D 投影进行数字化；3D 扫描仪则能获取包括深度信息在内的 3D 景物信息。$kp$, section = '' where id = 23234;
update t_knowledge_point set title = $kp$扫描仪的主要性能指标$kp$, content = $kp$① 光学分辨率：反映扫描仪扫描图像的清晰程度，用每英寸的取样点（像素）数目（dpi）表示。普通家用扫描仪的分辨率在 1600～3200dpi 之间，有些甚至更高。

② 色彩位数（像素深度）：反映扫描仪对图像色彩的辨析能力，色彩位数越多，扫描仪反映的色彩越丰富，扫描得到的数字图像效果也越真实。色彩位数可以是 24 位、30 位、36 位、42 位、48 位等。

③ 扫描幅面：指允许被扫描原稿的最大尺寸，例如 A4、A3 等。

④ 与主机的接口：如 USB 接口或 IEEE-1394（火线）接口等。$kp$, section = '' where id = 23263;
update t_knowledge_point set title = $kp$图像的获取$kp$, content = $kp$图像的获取（capturing）是指从现实世界中获得数字图像的过程。图像获取的过程实质上是模拟信号的数字化过程，处理步骤依次为取样、分色、量化。

数字化流程：模拟图像 → 取样 → 分色（分解为 R、G、B 三个分量）→ 各分量分别量化 → 数字图像。

数字图像获取设备：从现实世界获得数字图像过程中所使用的设备通称为数字图像获取设备，其功能是将现实的景物输入到计算机内并以取样图像的形式表示。2D 图像获取设备（如扫描仪、数码相机等）只能对图片或景物的 2D 投影进行数字化；3D 扫描仪能获取包括深度信息在内的 3D 景物信息。$kp$, section = '' where id = 23305;
update t_knowledge_point set title = $kp$数码相机$kp$, content = $kp$① 作用：图像输入设备。不需要胶卷和暗房，能直接将数字形式的照片输入电脑进行处理，或通过打印机打印出来，或与电视机连接进行观看。

② 性能指标：CCD 像素的数目越高，成像效果越好；200 万像素可以满足基本要求。

③ 工作原理：镜头和快门与传统相机基本相同，不同之处是不使用光敏卤化银胶片成像，而是将影像聚焦在成像芯片（CCD 或 CMOS）上，由成像芯片转换成电信号，再经模数转换（A/D 转换）变成数字图像，经过必要的图像处理和数据压缩之后，存储在相机内部的存储器中。$kp$, section = '' where id = 23325;
update t_knowledge_point set title = $kp$光学分辨率$kp$, content = $kp$光学分辨率（dpi）反映扫描仪扫描图像的清晰程度，用每英寸生成的像素数目（dpi）表示，例如 600×1200 dpi、1200×2400 dpi。$kp$, section = '' where id = 23468;
update t_knowledge_point set title = $kp$数码相机$kp$, content = $kp$配图为数码相机实物照片，原文没有文字说明。$kp$, section = '' where id = 25131;
update t_knowledge_point set title = $kp$数字图像的获取与重现$kp$, content = $kp$数字图像的获取包括：图像数字化、图像灰度直方图、图像处理算法的形式、图像的数据结构与文件格式。$kp$, section = '' where id = 26791;
update t_knowledge_point set title = $kp$扫描仪得到的是图像而不是图形$kp$, content = $kp$扫描仪得到的是图像（TIF 格式），而不是图形。$kp$, section = '' where id = 27497;
update t_knowledge_point set title = $kp$扫描仪的性能指标$kp$, content = $kp$① 扫描仪的分辨率（决定图像的大小，分辨率越高图像越清晰）。

② 色彩位数（色彩逼真度）。

③ 扫描幅面，指被扫描图件的最大尺寸。

④ 与主机的接口：火线接口、USB 接口。$kp$, section = '' where id = 27498;
update t_knowledge_point set title = $kp$LCD 显示器的工作原理$kp$, content = $kp$利用液晶在电场作用下快速改变分子排列的特性，通过控制光线的透过与阻挡产生图像。液晶本身不发光，显示器依靠背光源照明。$kp$, section = '' where id = 27500;
update t_knowledge_point set title = $kp$显示卡的组成$kp$, content = $kp$显示卡主要由显示控制电路、图形处理器（GPU）、显存和接口电路四个部分组成。$kp$, section = '' where id = 27501;
update t_knowledge_point set title = $kp$显卡与显示器之间的接口$kp$, content = $kp$① VGA 接口：模拟接口。

② DVI 接口：数字接口。

③ HDMI 全高清多媒体接口：同时传送数字视频信号和多声道音频信号。$kp$, section = '' where id = 27502;
update t_knowledge_point set title = $kp$LCD 显示器的类型与参数$kp$, content = $kp$LCD 显示器按结构分为透射型（计算机显示器）、反射型、半穿透反射式。

LCD 显示器的参数：

① 显示器尺寸：对角线的长度。

② 分辨率：水平像素个数 × 垂直像素个数。

③ 刷新速率：显示图像每秒钟更新的次数，刷新速率越高，图像的稳定性越好。

④ 响应时间：响应时间小的显示器在观看高速运动画面时不会出现尾影拖拽的现象。

⑤ 背光源类型：计算机使用的 LCD 显示器采用透射显示，背光源主要有荧光灯管和白色发光二极管（LED）。LED 在显示效果、节能、环保等方面更优。$kp$, section = '' where id = 27514;
update t_knowledge_point set title = $kp$扫描仪得到的是图像而不是图形$kp$, content = $kp$扫描仪得到的是图像（TIF 格式），而不是图形。$kp$, section = '' where id = 28206;
update t_knowledge_point set title = $kp$扫描仪的性能指标$kp$, content = $kp$① 扫描仪的分辨率（决定图像的大小，分辨率越高越清楚）。

② 色彩位数（色彩逼真度，色彩位数越多，图像越真实）。

③ 扫描幅面，指被扫描图件的最大尺寸。

④ 与主机的接口：火线接口、USB 接口。$kp$, section = '' where id = 28207;
update t_knowledge_point set title = $kp$LCD 显示器的工作原理$kp$, content = $kp$LCD 工作原理：利用液晶在电场下快速扭曲的特性，通过控制光线的透过与阻挡产生图像。液晶本身不发光、无辐射，液晶显示器辐射小。$kp$, section = '' where id = 28209;
update t_knowledge_point set title = $kp$LCD 显示器的参数$kp$, content = $kp$① 显示器尺寸：对角线的长度。

② 分辨率：水平像素个数 × 垂直像素个数。

③ 刷新速率：显示图像每秒钟更新的次数，刷新速率越高图像的稳定性越好。

④ 响应时间：响应时间小的显示器在观看高速运动画面时不会出现尾影拖拽的现象。

⑤ 背光源类型：计算机使用的 LCD 显示器采用透射显示，背光源主要有荧光灯管和白色发光二极管（LED）。LED 在显示效果、节能、环保等方面更好，显示屏幕更轻薄。$kp$, section = '' where id = 28210;
update t_knowledge_point set title = $kp$显示卡的组成$kp$, content = $kp$显示卡主要由显示控制电路、图形处理器、显存和接口电路四个部分组成。$kp$, section = '' where id = 28211;
update t_knowledge_point set title = $kp$显卡与显示器之间的接口$kp$, content = $kp$① VGA 接口：模拟接口。

② DVI 接口：数字接口。

③ HDMI 全高清多媒体接口：同时传送数字视频信号和多声道音频信号。$kp$, section = '' where id = 28212;
update t_knowledge_point set title = $kp$LCD 显示器的参数与显卡接口$kp$, content = $kp$LCD 显示器的参数：

① 分辨率：水平像素个数 × 垂直像素个数。

② 刷新速率：显示图像每秒钟更新的次数，刷新速率越高图像的稳定性越好。

③ 响应时间：响应时间小的显示器在观看高速运动画面时不会出现尾影拖拽的现象。

显示器的 I/O 控制器就是显卡，显卡的核心是 GPU。

显卡与显示器之间的接口：

① VGA 接口：模拟接口。

② DVI 接口：数字接口。

③ HDMI 全高清多媒体接口：同时传送数字视频信号和多声道音频信号。$kp$, section = '' where id = 28350;
update t_knowledge_point set title = $kp$LCD 显示器的类型与参数$kp$, content = $kp$LCD 显示器按结构分为透射型（计算机显示器）、反射型、半穿透反射式。

LCD 显示器的参数：

① 显示器尺寸：对角线的长度。

② 分辨率：水平像素个数 × 垂直像素个数。

③ 刷新速率：显示图像每秒钟更新的次数，刷新速率越高，图像的稳定性越好。

④ 响应时间：响应时间小的显示器在观看高速运动画面时不会出现尾影拖拽的现象。

⑤ 背光源类型：计算机使用的 LCD 显示器采用透射显示，背光源主要有荧光灯管和白色发光二极管（LED）。LED 在显示效果、节能、环保等方面更优。$kp$, section = '' where id = 28405;
update t_knowledge_point set title = $kp$常见扫描仪的类型$kp$, content = $kp$常见扫描仪有平板式、滚筒式、胶片专用和手持式等类型。

① 平板式扫描仪：主要扫描反射式稿件，适用范围较广，扫描速度、精度、质量比较好，适用于家庭、办公。分辨率在 300～8000dpi，色彩为 24～48 位真彩色，成像器件是 CCD（电荷耦合器件）。

② 滚筒式和胶片专用扫描仪。胶片专用（即底片式或接触式）扫描仪是高分辨率的专业扫描仪，技术性能很高，多用于专业印刷排版领域，价格比较贵，扫描透明胶片，分辨率最低在 1000dpi，一般在 2700dpi 以上。滚筒式扫描仪的光学分辨率为 300dpi，有彩色和灰度两种，彩色型号一般为 24 位彩色，也有极少数滚筒式扫描仪采用 CCD 技术。

③ 手持式扫描仪：扫描头较窄，只适用于扫描较小的图件。$kp$, section = '' where id = 29518;
update t_knowledge_point set title = $kp$图像获取的基本原理$kp$, content = $kp$基本原理：通过光敏器件（CMOS 或 CCD）将光的强弱转换为电流的强弱，然后经过取样、分色、量化等步骤，进而得到数字图像。$kp$, section = '' where id = 29523;
update t_knowledge_point set title = $kp$LCD 显示器的参数$kp$, content = $kp$① 分辨率：水平像素个数 × 垂直像素个数。

② 刷新速率：显示图像每秒钟更新的次数，刷新速率越高图像的稳定性越好。

③ 响应时间：响应时间小的显示器在观看高速运动画面时不会出现尾影拖拽的现象。$kp$, section = '' where id = 29598;
update t_knowledge_point set title = $kp$显卡与显示器之间的接口$kp$, content = $kp$① VGA 接口：模拟接口。

② DVI 接口：数字接口。

③ HDMI 全高清多媒体接口：同时传送数字视频信号和多声道音频信号。$kp$, section = '' where id = 29599;
update t_knowledge_point set title = $kp$扫描仪的性能指标与显示器刷新率$kp$, content = $kp$扫描仪是将图片或文字输入计算机的一种输入设备。

性能指标：分辨率（决定图像的大小，分辨率越高越清楚）、色彩位数（色彩逼真度，色彩位数越多，图像越真实）、扫描幅面（被扫描图件的最大尺寸）、与主机的接口（火线接口、USB 等）。

对显示器而言，分辨率与刷新速率相互独立，分辨率提高时刷新速率可以保持不变。$kp$, section = '' where id = 29623;
update t_knowledge_point set title = $kp$显示器的类型与参数$kp$, content = $kp$显示器的类型有阴极射线管显示器（CRT）和液晶显示器（LCD）。

显示器尺寸：对角线的长度。

分辨率：水平像素个数 × 垂直像素个数。

刷新速率：显示图像每秒钟更新的次数，刷新速率越高图像的稳定性越好。$kp$, section = '' where id = 29624;
update t_knowledge_point set title = $kp$扫描仪的主要性能指标$kp$, content = $kp$扫描仪的主要性能指标有分辨率、色彩位数等，其中色彩位数越多，扫描仪所能反映的色彩就越丰富，扫描的图像效果也越真实。$kp$, section = '' where id = 29649;
update t_knowledge_point set title = $kp$数码相机的成像芯片$kp$, content = $kp$大部分数码相机采用 CCD 或 CMOS 成像芯片，芯片中像素越多，可拍摄相片的清晰度（分辨率）就越高。$kp$, section = '' where id = 29650;
update t_knowledge_point set title = $kp$图像获取设备的原理$kp$, content = $kp$大多数图像获取设备的原理基本相同，都是通过光敏器件将光的强弱转换为电流的强弱，然后通过取样、分色、量化，进而得到数字图像。$kp$, section = '' where id = 29652;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (23234,23263,23305,23325,23468,25131,26791,27497,27498,27500,27501,27502,27514,28206,28207,28209,28210,28211,28212,28350,28405,29518,29523,29598,29599,29623,29624,29649,29650,29652) and not deleted) <> 30 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
