-- 知识点 125 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_125
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_125 as
select * from t_knowledge_point where id in (22382,22493,23178,23217,23255,23258,23261,23265,23285,23286,23310,23322,23365,23383,23384,23385,23386,23387,23388,23389,23411,23417,23418,23452,23469,25139,25140,25141,25277,25529,25614,25708,25709,27018,27076,27499,27513,27547,27548,27549,27550,28208,28351,28352,28353,28407,29527,29528,29529,29530,29531,29603,29604,29605,29606,29632,29653);

update t_knowledge_point set title = $kp$文本输出与字形生成$kp$, content = $kp$文本输出是指在屏幕上显示文本、用打印机打印文本等操作。

文本输出的过程：首先对文本的格式描述进行解释，然后生成文字和图表的映像（bitmap），最后传送到显示器或打印机输出。

文本阅读器是承担文本输出任务的软件，也称为浏览器。它可以是嵌入在文本处理软件中的一个模块，如微软的 Word，也可以是独立软件，如 Adobe 公司的 Acrobat Reader、微软公司的 IE 等。

文字（汉字）字形的生成过程：先根据字符的字体确定相应的字型库（font），再按照该字符的代码从字型库中取出该字符的形状描述信息，然后按形状描述信息生成字形，并按照字号大小及有关属性（粗体、斜体、下划线）对字形作必要的变换，最后将变换得到的字形放置在页面的指定位置处。

字型库简称字库，是同一种字体的所有字符（例如 GB2312 中的 7000 多个字符）形状描述信息的集合。不同的字体（如宋体、仿宋、楷体、黑体等）对应不同的字库。

字符形状的描述方法有点阵描述和轮廓描述两种。$kp$, section = '' where id = 22382;
update t_knowledge_point set title = $kp$常用的图像编辑软件$kp$, content = $kp$常用的图像编辑软件包括：

- Word 和 PowerPoint 具有基本的图像编辑功能
- Windows 附件中的“画图”软件
- 微软 Office 工具中的 Picture Manager
- ACD Systems 公司的 ACDSee
- Adobe PhotoShop$kp$, section = '' where id = 22493;
update t_knowledge_point set title = $kp$数字图像处理$kp$, content = $kp$使用计算机对来自照相机、摄像机、传真机、扫描仪、医用 CT 机、X 光机等的图像，进行去噪、增强、复原、分割、提取特征、压缩、存储、检索等操作处理。$kp$, section = '' where id = 23178;
update t_knowledge_point set title = $kp$BMP 图像格式$kp$, content = $kp$微软公司在 Windows 操作系统下使用的一种标准图像文件格式，一个文件存放一幅图像，可以使用行程长度编码（RLE）进行无损压缩，也可不压缩。不压缩的 BMP 文件是一种通用的图像文件格式，几乎所有 Windows 应用软件都能支持。$kp$, section = '' where id = 23217;
update t_knowledge_point set title = $kp$BMP 图像格式$kp$, content = $kp$微软公司在 Windows 操作系统下使用的一种标准图像文件格式，每个文件存放一幅图像，可以使用行程长度编码（RLE）进行无损压缩，也可不压缩。不压缩的 BMP 文件是一种通用的图像文件格式，几乎所有 Windows 应用软件都能支持。$kp$, section = '' where id = 23255;
update t_knowledge_point set title = $kp$TIFF 图像文件格式$kp$, content = $kp$用于扫描仪和桌面出版，能支持多种压缩方法和多种不同类型的图像，有许多图像图形应用软件支持这种文件格式。文件由文件头、文件目录、目录条目三个部分组成。$kp$, section = '' where id = 23258;
update t_knowledge_point set title = $kp$常用图像文件格式$kp$, content = $kp$| 名称 | 压缩编码方法 | 性质 | 典型应用 | 开发组织/公司 |
| --- | --- | --- | --- | --- |
| BMP | RLE | 无损 | Windows 应用程序 | Microsoft |
| TIF | RLE, LZW | 无损 | 桌面出版 | Aldus, Microsoft |
| GIF | LZW | 无损 | Internet | CompuServe |
| JPEG | DCT, Huffman | 无损/有损 | Internet、数码相机等 | ISO/IEC |
| JPEG 2000 | 小波变换、算术编码 | 无损/有损 | Internet、数码相机等 | ISO/IEC |

不同格式采用不同的压缩编码方法和数据组织方法，适合不同的应用。$kp$, section = '' where id = 23261;
update t_knowledge_point set title = $kp$数字图像的应用$kp$, content = $kp$数字图像的主要应用领域：

- 图像通信
- 遥感
- 医疗诊断
- 工业生产中的应用
- 机器人视觉
- 军事、公安、档案管理$kp$, section = '' where id = 23265;
update t_knowledge_point set title = $kp$GIF 图像格式$kp$, content = $kp$① 由 CompuServe 公司于 1987 年开发，基于 Lempel-Ziv Welch（LZW）压缩算法，使用特殊码，码长可变。
② 是互联网上广泛使用的一种图像文件格式，颜色数目较少（不超过 256 色），文件特别小，适合网络传输。
③ 由于颜色数目有限，GIF 适用于插图、剪贴画等色彩数目不多的应用场合。
④ 支持透明背景，具有在屏幕上渐进显示的功能。
⑤ 可以将许多张图像保存在同一个文件中，显示时按预先规定的时间间隔逐一显示，从而形成动画效果，因而在网页制作中大量使用。$kp$, section = '' where id = 23285;
update t_knowledge_point set title = $kp$TIF（TIFF）图像格式$kp$, content = $kp$大量使用于扫描仪和桌面出版，能支持多种压缩方法和多种不同类型的图像，有许多应用软件支持这种文件格式。$kp$, section = '' where id = 23286;
update t_knowledge_point set title = $kp$数字图像处理与应用$kp$, content = $kp$数字图像处理：使用计算机对来自照相机、摄像机、传真机、扫描仪、医用 CT 机、X 光机等的图像，进行去噪、增强、复原、分割、提取特征、压缩、存储、检索等操作处理。

对图像进行处理的主要目的：

- 提高图像的视感质量
- 图像复原与重建
- 图像分析
- 图像的存储、管理、检索，以及图像内容与知识产权的保护等$kp$, section = '' where id = 23310;
update t_knowledge_point set title = $kp$GIF 图像格式$kp$, content = $kp$GIF 是目前因特网上广泛使用的一种图像文件格式，颜色数目较少（不超过 256 色），文件特别小，适合因特网传输。由于颜色数目有限，GIF 适用于在色彩要求不高的场合作为插图、剪贴画等使用。GIF 支持透明背景，具有在屏幕上渐进显示的功能。它可以将多张图像保存在同一个文件中，显示时按预先规定的时间间隔逐一显示，形成动画效果，因而在网页制作中大量使用。$kp$, section = '' where id = 23322;
update t_knowledge_point set title = $kp$图像处理软件与 Photoshop$kp$, content = $kp$面向办公、出版与信息发布的图像处理软件也称为图像修饰（image retouching）或图像编辑软件，支持多种图像文件格式，提供多种图像编辑处理功能，可制作出生动形象的图像。此外还有与应用领域密切相关的专业软件，通常具有很强的专业性，如遥感图像处理软件、医学图像处理软件等。

美国 Adobe 公司的 PhotoShop 集图像扫描、图像编辑、绘图、图像合成及图像输出等多种功能于一体，是流行的图像处理工具。

PhotoShop 的主要功能包括：

- 图像的显示控制
- 图像区域的选择
- 图像的编辑操作
- 图像的滤镜操作
- 绘图功能
- 文字编辑功能
- 图层操作$kp$, section = '' where id = 23365;
update t_knowledge_point set title = $kp$图像增强$kp$, content = $kp$图像增强通过调整阴影、高光、对比度、锐度、色彩等参数改善图像的视觉效果。图示为增强前后的图像对比。$kp$, section = '' where id = 23383;
update t_knowledge_point set title = $kp$图像处理软件的滤镜与图层操作$kp$, content = $kp$滤镜操作：处理前图片上有划痕，处理后划痕被清除。

图层操作：将背景图与前景图复合，得到复合后的图像。

数字图像的应用：

- 图像通信
- 遥感
- 医疗诊断
- 工业生产中的应用
- 机器人视觉
- 军事、公安、档案管理$kp$, section = '' where id = 23384;
update t_knowledge_point set title = $kp$图像恢复$kp$, content = $kp$图像恢复示例：对陈旧的老照片进行处理，得到恢复后的照片。$kp$, section = '' where id = 23385;
update t_knowledge_point set title = $kp$BMP 格式$kp$, content = $kp$BMP 图像格式是 Windows 操作系统下使用的一种标准图像格式。

- 支持单色、16 色、256 色、真彩色图像
- 一个文件存放一幅图像，可以进行无损压缩，也可不压缩
- 非压缩的 BMP 文件是一种通用的图像文件格式，几乎所有 Windows 应用软件都能支持$kp$, section = '' where id = 23386;
update t_knowledge_point set title = $kp$GIF 图像格式$kp$, content = $kp$- 颜色数目不超过 256 色，适合用作插图、剪贴画等色彩数要求不高的场合；文件特别小，适合网络传输
- 具有累进显示功能，适合网络浏览器观看
- 能支持透明背景（JPEG 不支持）
- 能支持动画

缺点：不适合真彩色图片。$kp$, section = '' where id = 23387;
update t_knowledge_point set title = $kp$JPEG 图像格式$kp$, content = $kp$- JPEG 是静止图像数据压缩编码的国际标准，采用 JPEG 标准的图像文件扩展名是 .jpg
- 特别适合各种连续色调的彩色或灰度图像，在计算机和数码相机中得到广泛应用
- JPEG 的最新标准是 JPEG 2000（图像文件扩展名 .jp2），采用更先进的技术，可取得更好的效果，目前在医学图像处理中使用$kp$, section = '' where id = 23388;
update t_knowledge_point set title = $kp$图像的特效处理$kp$, content = $kp$图像特效处理是在原图基础上施加波浪、旋转、漩涡等效果。图中依次为原图、波浪效果、旋转效果和漩涡效果。$kp$, section = '' where id = 23389;
update t_knowledge_point set title = $kp$常用图像文件格式$kp$, content = $kp$| 名称 | 压缩编码方法 | 性质 | 典型应用 | 开发组织/公司 |
| --- | --- | --- | --- | --- |
| BMP | RLE | 无损 | Windows 应用程序 | Microsoft |
| TIF | RLE, LZW | 无损 | 桌面出版 | Aldus, Microsoft |
| GIF | LZW | 无损 | Internet | CompuServe |
| JPEG | DCT, Huffman | 无损/有损 | Internet、数码相机等 | ISO/IEC |
| JP2 | 小波变换、算术编码 | 无损/有损 | Internet、数码相机等 | ISO/IEC |

BMP（BitMaP-file）图像：微软公司在 Windows 操作系统下使用的一种标准图像文件格式，一个文件存放一幅图像，可以使用行程长度编码（RLE）进行无损压缩，也可不压缩。不压缩的 BMP 文件是一种通用的图像文件格式，几乎所有 Windows 应用软件都能支持。

TIFF（Tagged Image File Format）图像文件格式：用于扫描仪和桌面出版，能支持多种压缩方法和多种不同类型的图像，有许多图像图形应用软件支持这种文件格式。由文件头、文件目录、目录条目三个部分组成。

GIF（Graphics Interchange Format）：互联网上广泛使用的一种图像文件格式，颜色数目较少（不超过 256 色），文件特别小，适合网络传输。由于颜色数目有限，GIF 适用于插图、剪贴画等色彩数目不多的应用场合。GIF 支持透明背景，具有在屏幕上渐进显示的功能。尤为突出的是，它可以将许多张图像保存在同一个文件中，显示时按预先规定的时间间隔逐一显示，从而形成动画效果，因而在网页制作中大量使用。由 CompuServe 公司于 1987 年开发，基于 Lempel-Ziv Welch（LZW）压缩算法，使用特殊码，码长可变。$kp$, section = '' where id = 23411;
update t_knowledge_point set title = $kp$数字图像处理的应用$kp$, content = $kp$(1) 图像通信，包括图像传输、电视电话、电视会议等。
(2) 遥感。
(3) 医疗诊断。
(4) 工业生产中的应用，如产品质量检测、生产过程自动控制等。
(5) 机器人视觉。
(6) 军事、公安、档案管理等其他方面的应用。

图示例子包括 X 光图像、CT 图像、核磁共振图像和指纹图像。$kp$, section = '' where id = 23417;
update t_knowledge_point set title = $kp$数字图像的常用文件格式$kp$, content = $kp$常用的图像文件格式有：

| 名称 | 压缩编码方法 | 性质 | 典型应用 | 开发公司（组织） |
| --- | --- | --- | --- | --- |
| BMP | 不压缩 | 无损 | Windows 应用程序 | Microsoft |
| RAW | 不压缩或无损压缩 | 无损 | 高端数码相机等 |  |
| TIF | RLE, LZW（字典编码） | 无损 | 桌面出版 | Aldus, Microsoft |
| GIF | LZW | 无损 | 互联网 | CompuServe |
| JPEG | DCT（离散余弦变换）、Huffman 编码 | 大多为有损 | 互联网、数码相机等 | ISO/IEC |
| PNG | 由 LZ77 派生的压缩算法 | 无损 | 互联网等 | W3C |

不同的图像文件格式采用了不同的数据压缩技术和数据组织方法，适合不同的应用。$kp$, section = '' where id = 23418;
update t_knowledge_point set title = $kp$常见图像格式的特点$kp$, content = $kp$GIF 格式属于无损压缩，颜色数目不超过 256 色，文件很小，广泛适用于因特网上；尤为突出的是可以将多张图像保存到同一个文件中，显示时按预先规定的时间间隔顺序显示，形成动画效果。

JPEG 格式属于有损压缩，适用于因特网、数码相机，属于静态图像。

RAW 文件格式在数码相机中使用较多，其含义是未经加工的图像，包含了感光器件捕获到的未经处理的像素数据，还包含了拍摄照片时的很多参数。BMP 是微软 Windows 系统上的图像格式，TIF 是扫描仪或桌面出版文件格式。

PNG 是 W3C 开发的一种图像文件格式，它既保留了 GIF 文件的特性，又增加了许多 GIF 文件格式没有的功能，例如支持每个图像像素为 48 比特的真彩色图像，支持每个像素为 16 比特的灰度图像。PNG 主要在互联网上使用。$kp$, section = '' where id = 23452;
update t_knowledge_point set title = $kp$图像处理的目的$kp$, content = $kp$(1) 提高图像的视觉质量。
(2) 恢复与重建有失真和畸变的图像。
(3) 图像分析，包括图像的分类、识别和理解等。
(4) 图像数据的变换、编码和数据压缩。
(5) 图像的存储、管理与检索。
(6) 图像内容与知识产权的保护。$kp$, section = '' where id = 23469;
update t_knowledge_point set title = $kp$图像属性修改$kp$, content = $kp$图像属性修改包括：增加或降低对比度、增加或降低亮度、转换为灰度图像和黑白图像。$kp$, section = '' where id = 25139;
update t_knowledge_point set title = $kp$图像外形修改$kp$, content = $kp$图像外形修改包括缩小、放大、压扁、拉长等操作。$kp$, section = '' where id = 25140;
update t_knowledge_point set title = $kp$图像的裁剪与旋转$kp$, content = $kp$图像的裁剪与旋转包括：裁剪左部、裁剪底部、旋转 90 度、旋转任意角度。$kp$, section = '' where id = 25141;
update t_knowledge_point set title = $kp$图像与图形知识要点$kp$, content = $kp$- 图像与图形
  - 获取过程：从现实世界获得数字图像，即模拟信号数字化；获取设备有扫描仪、数码相机
  - 图像类型：黑白图像、灰度图像、彩色图像（24 位真彩色，可以表示一千多万种颜色）
  - 图像文件格式
    - BMP：微软为 Windows 应用程序制定的一种标准图像文件格式；支持单色、16 色、256 色、真彩色图像；可以无损压缩，也可以不压缩
    - RAW：高端数码相机使用
    - JPEG：静止图像；通常为有损压缩，压缩倍数可选择；是图像数据压缩的国际标准；文件扩展名 .jpg；适合连续色调的彩色或灰度图像
    - GIF：属于图片而不是动画；颜色数目不超过 256 色（不超过 8 位）；文件很小，适合因特网传输；具有累进显示功能，支持透明背景（PNG 可以，JPEG 不可以）；网页大量采用
    - TIFF：用于扫描仪、桌面出版领域，扫描仪得到的图像后缀为 .tif
    - PNG：无损压缩；支持透明背景，保留了 GIF 的所有特点；支持每个像素 16 位的真彩色，颜色丰富；主要用于互联网
    - JPEG 2000（JP2）：更先进，可有损也可无损，扩展名 .jp2，采用算术编码；用于因特网、数码相机、计算机、医学图像处理
  - 图像处理软件：Paint、ACDSee、Photo Editor、PhotoImpact；最著名的是 Adobe 公司的 PhotoShop
  - 数字图像处理与应用
    - 提高图像的视感质量：通过调整亮度和彩色、几何变换、特技效果处理来改善图像质量
    - 图像的复原与重建：图像姿态矫正、老照片消除图像退化影响、使用多个二维投影重建图像
    - 图像分析：提取图像特征或特殊信息
    - 图像数据的变换、编码与数据压缩
    - 图像的存储、管理、检索与内容产权保护
  - 图像合成软件
    - 图像处理软件：Paint、ACDSee、Photo Editor、PhotoImpact；最著名的是 PhotoShop（美国 Adobe）
    - 矢量绘图软件：AutoCAD、MAPinfo、ARCinfo、PROTEL（国产：SuperMap GIS、CAXA 电子图板）；流行的是 CorelDraw、Illustrator、FreeHand、Visio
  - 数字图像应用：图像通信、遥感、医疗诊断、机器人视觉、军事、公安$kp$, section = '' where id = 25277;
update t_knowledge_point set title = $kp$数字图像的常用文件格式与压缩编码$kp$, content = $kp$（1）JPEG（JPG，大多为有损压缩）

① JPEG 是静态图像压缩编码的国际标准，特别适合各种连续色调的彩色或灰度图像，在计算机网络和数码相机中得到广泛应用。
② 压缩算法复杂度适中，既可用硬件实现，也可用软件实现。
③ 压缩比可由用户控制（一般为 8～10），压缩比越高图像质量越差。
④ JPEG 标准的图像文件扩展名是 .jpg。
⑤ JPEG 标准既支持有损压缩也支持无损压缩，实际应用中有损压缩更多。JPEG 2000 采用小波分析等先进算法，可提供更好的图像质量、更低的码率，更适合在 WWW 网上传输；它兼容 JPEG，压缩率更高，两者的压缩编码算法不同。
⑥ JPEG 特别适合处理各种连续色调的彩色或灰度图像，在互联网和数码相机中被广泛采用。

（2）BMP（无损压缩，也可以不压缩）

① BMP 图像格式是 Windows 操作系统下使用的一种标准图像格式。
② 一个文件一幅图像，可以进行无损压缩，也可不压缩。
③ 支持单色、16 色、256 色、真彩色图像。
④ 非压缩的 BMP 文件是一种通用的图像文件格式，几乎所有 Windows 应用软件都能支持。
⑤ 文件扩展名 .bmp。

（3）GIF（无损压缩）

① 颜色数目不超过 256 色（色彩深度 8 位），适合用作插画、剪贴画等色彩要求不高的场合；文件特别小，适合网络传输。
② 具有累进显示功能，适合网络浏览器观看。
③ 能支持透明背景（JPEG 不支持）。
④ 能支持动画。
⑤ 不适合真彩色图片。
⑥ 文件扩展名 .gif。

（4）PNG（无损压缩）

① PNG 是 W3C 开发的一种图像文件格式，保留了 GIF 文件的特性并扩充了其功能，主要用于互联网。
② 文件扩展名 .png。

（5）TIF（或 TIFF，无损压缩）

TIF 或 TIFF 图像文件格式大多使用于扫描仪和桌面出版，能支持多种压缩方法和多种不同类型的图像，有许多应用软件支持这种文件格式。

压缩编码方法：

① 无损压缩（熵编码）：用压缩后的数据还原出来的图像没有任何误差。
② 有损压缩（变换编码、矢量编码）：用压缩后的数据还原出来的图像有一定的误差。

压缩编码方法的评价：压缩倍数的高低（压缩比例）、重建图像的质量（有损压缩时）、压缩算法的复杂程度。

| 名称 | 压缩编码方法 | 性质 | 典型应用 | 开发公司（组织） |
| --- | --- | --- | --- | --- |
| BMP | 不压缩 | 无损 | Windows 应用程序 | Microsoft |
| RAW | 不压缩或无损压缩 | 无损 | 高端数码相机等 |  |
| TIF | RLE, LZW（字典编码） | 无损 | 桌面出版 | Aldus, Microsoft |
| GIF | LZW | 无损 | 互联网 | CompuServe |
| JPEG | DCT（离散余弦变换）、Huffman 编码 | 大多为有损 | 互联网、数码相机等 | ISO/IEC |
| PNG | 由 LZ77 派生的压缩算法 | 无损 | 互联网等 | W3C |
| WebP | VP8 帧内编码方法 | 有损/无损 | 互联网网页 | Google |$kp$, section = '' where id = 25529;
update t_knowledge_point set title = $kp$条形码码制与二维码功能$kp$, content = $kp$常用一维条形码码制：

- 39 码：可以是数字，也可以包含字母，主要应用于工业生产线领域、图书管理等。
- 93 码：是一种类似于 39 码的条码，密度较高，能够替代 39 码。
- 25 码：主要应用于包装、运输以及国际航空系统的机票顺序编号等。
- Codabar 码：应用于血库、图书馆、包裹等的跟踪管理。
- ISBN：用于图书管理。

二维条形码常用的码制有 Data Matrix、MaxiCode、Aztec、QR Code（日本发明）、Vericode、PDF417、Ultracode、Code 49、Code 16K 等。

QR Code 在 QQ、微信、支付宝等中广泛使用。

二维码分为堆叠式（行排式）和矩阵式两类：

① 有代表性的行排式二维条码有 Code 16K、Code 49、PDF417、MicroPDF417 等。
② 有代表性的矩阵式二维条码有 Code One、MaxiCode、QR Code、Data Matrix、Han Xin Code、Grid Matrix 等。

二维码的功能：

① 信息获取（名片、地图、WIFI 密码、资料）
② 网站跳转（跳转到微博、手机网站、网站）
③ 广告推送（用户扫码直接浏览商家推送的视频、音频广告）
④ 手机电商（用户扫码、手机直接购物下单）
⑤ 防伪溯源（用户扫码即可查看生产地，同时后台可以获取最终消费地）
⑥ 优惠促销（用户扫码下载电子优惠券、抽奖）
⑦ 会员管理（用户在手机上获取电子会员信息、VIP 服务）
⑧ 手机支付（扫描商品二维码，通过银行或第三方支付通道完成支付）
⑨ 账号登录（扫描二维码进行各个网站或软件的登录）$kp$, section = '' where id = 25614;
update t_knowledge_point set title = $kp$图像语义分割$kp$, content = $kp$图像语义分割是将图像像素按照表达的语义含义的不同进行分组、分割。

图像语义是指对图像内容的理解，例如能够描绘出什么物体在哪里做了什么事情等；分割是指对图片中的每个像素点进行标注，标注其属于哪一类别。近年来用于无人车驾驶技术中分割街景以避让行人和车辆、医学影像分析中辅助诊断等。

分割任务主要分为实例分割和语义分割，实例分割是物体检测与语义分割的综合体。$kp$, section = '' where id = 25708;
update t_knowledge_point set title = $kp$场景文字识别、图像生成与人体关键点检测$kp$, content = $kp$场景文字识别：许多场景图像中包含丰富的文本信息，对理解图像信息有重要作用，能极大帮助人们认知和理解场景图像的内容。场景文字识别是在图像背景复杂、分辨率低下、字体多样、分布随意等情况下，将图像信息转化为文字序列的过程，可认为是一种特别的翻译过程：将图像输入翻译为自然语言输出。该技术的发展促进了新型应用的产生，如通过自动识别路牌中的文字帮助街景应用获取更准确的地址信息。

场景文字识别可将基于 CNN 的图像特征提取与基于 RNN 的序列翻译技术结合，免除人工定义特征，避免字符分割，使用自动学习到的图像特征完成字符识别，主要有 CRNN-CTC 模型和基于注意力机制的序列到序列模型。

图像生成：根据输入向量生成目标图像，输入向量可以是随机的噪声或用户指定的条件向量。应用场景有手写体生成、人脸合成、风格迁移、图像修复、超分重建等，当前主要借助生成对抗网络（GAN）实现。

生成对抗网络由生成器和判别器两种子网络组成：生成器的输入是随机噪声或条件向量，输出是目标图像；判别器是一个分类器，输入是一张图像，输出是该图像是否真实。训练过程中，生成器和判别器通过不断相互博弈提升各自的能力。

人体关键点检测：通过人体关键节点的组合和追踪来识别人的运动和行为，对描述人体姿态、预测人体行为至关重要，是动作分类、异常行为检测、自动驾驶等计算机视觉任务的基础，也为游戏、视频等提供新的交互方式。$kp$, section = '' where id = 25709;
update t_knowledge_point set title = $kp$画图程序$kp$, content = $kp$“画图”程序是一种位图绘图软件，具有绘制、编辑图形、文字处理以及打印图形文档等功能。

单击【开始】按钮，选择“所有程序”的“附件”级联菜单中的“画图”命令，即可打开“画图”窗口。

在“画图”窗口中，中间部分是画布，左边是工具栏，提供 16 种基本的绘图工具；工具栏下面是颜料盒，可以设置前景颜色和背景颜色，并提供 28 种基本颜色的调色板；窗口底部是状态栏，显示鼠标所选工具的提示信息和鼠标指针在画布上的坐标。

使用这 16 种绘图工具可以方便地对图像进行编辑处理，程序还提供多种特殊效果的实用命令，可使绘制的图像更漂亮。通过剪切和粘贴等操作，可将用户创作的图像添加到 Word 文档及许多其他类型的文档中。$kp$, section = '' where id = 27018;
update t_knowledge_point set title = $kp$计算机视觉$kp$, content = $kp$计算机视觉是一门研究如何使机器“看”的科学，指用摄影机和电脑代替人眼对目标进行识别、跟踪和测量，并进一步做图形处理，使电脑处理成为更适合人眼观察或传送给仪器检测的图像。$kp$, section = '' where id = 27076;
update t_knowledge_point set title = $kp$数码相机的图片格式$kp$, content = $kp$数码相机的图片格式是 JPEG；高端数码相机还支持 RAW 等格式。$kp$, section = '' where id = 27499;
update t_knowledge_point set title = $kp$数码相机的图片格式$kp$, content = $kp$数码相机的图片格式是 JPEG；高端数码相机还支持 RAW 等格式。$kp$, section = '' where id = 27513;
update t_knowledge_point set title = $kp$BMP 格式（无损）$kp$, content = $kp$① BMP 图像格式是 Windows 操作系统下使用的一种标准图像格式。非压缩的 BMP 文件是一种通用的图像文件格式，几乎所有 Windows 应用软件都能支持。
② 一个文件存放一幅图像。$kp$, section = '' where id = 27547;
update t_knowledge_point set title = $kp$GIF 格式（无损）$kp$, content = $kp$① GIF 图像格式颜色数目不多（不超过 256 色），文件特别小，适合网络传输。
② GIF 图像格式具有累进显示功能，适合网络浏览器观看。
③ GIF 图像格式能支持透明背景（JPEG 不支持）。$kp$, section = '' where id = 27548;
update t_knowledge_point set title = $kp$PNG 格式（无损）$kp$, content = $kp$PNG 是 W3C 开发的一种图像文件格式，保留了 GIF 文件的特性并扩充了其功能，主要用于互联网。

常见图像处理软件：Paint、Photo Editor、PhotoImpact、ACDSee、Photoshop 等。$kp$, section = '' where id = 27549;
update t_knowledge_point set title = $kp$图像通信的应用$kp$, content = $kp$图像通信包括传真、可视电话、视频会议等。$kp$, section = '' where id = 27550;
update t_knowledge_point set title = $kp$数码相机的图像格式$kp$, content = $kp$数码相机的图片格式是 JPEG。高端数码相机的图片格式还有 RAW，是一种无损压缩的图像格式。$kp$, section = '' where id = 28208;
update t_knowledge_point set title = $kp$GIF 格式的颜色数$kp$, content = $kp$GIF 图像格式颜色数目不超过 256 色，色彩不够鲜艳，适合用作插图、剪贴画等对色彩数要求不高的场合。$kp$, section = '' where id = 28351;
update t_knowledge_point set title = $kp$GIF 格式支持动画$kp$, content = $kp$GIF 图像格式能支持动画效果、透明背景和渐进显示，适合网络传输。$kp$, section = '' where id = 28352;
update t_knowledge_point set title = $kp$PNG 图像格式$kp$, content = $kp$PNG 格式保留了 GIF 的主要特点（无损压缩、透明背景等），颜色支持每个像素 48 比特的真彩色，主要用于互联网。$kp$, section = '' where id = 28353;
update t_knowledge_point set title = $kp$GIF 格式的三个特点$kp$, content = $kp$GIF（无损压缩）：① GIF 图像格式颜色数目不多，文件特别小，适合网络传输；② GIF 图像格式具有累进显示功能，适合网络浏览器观看；③ GIF 图像格式能支持透明背景（JPEG 不支持）。$kp$, section = '' where id = 28407;
update t_knowledge_point set title = $kp$BMP 图像格式$kp$, content = $kp$BMP 是 Windows 使用的标准图像格式，几乎所有 Windows 应用软件都支持。$kp$, section = '' where id = 29527;
update t_knowledge_point set title = $kp$GIF 图像格式的特点$kp$, content = $kp$GIF：压缩比（无损压缩）可调，文件特别小；颜色数较少（不超过 256 色），常用于对色彩数要求不高的场合，如插图、剪贴画等；支持透明背景，具有渐进显示功能，可形成动画效果，适合网络传输。$kp$, section = '' where id = 29528;
update t_knowledge_point set title = $kp$JP2 图像格式$kp$, content = $kp$JP2：特别采用了小波分析等先进算法，效果比 JPEG 更好，更适合网上传输。$kp$, section = '' where id = 29529;
update t_knowledge_point set title = $kp$通用图像处理软件的基本功能$kp$, content = $kp$通用图像处理软件的基本功能：图像的缩放显示、调整图像的亮度与对比度、在图片上制作文字并与图像融为一体等。$kp$, section = '' where id = 29530;
update t_knowledge_point set title = $kp$数字图像处理软件$kp$, content = $kp$数字图像处理软件：Photoshop、Microsoft Photo Editor、PhotoImpact 等。

计算机图形：使用计算机合成制作的图，又称矢量图形；其过程是使用计算机描述真实（或假想）景物的结构、形状与外貌，在需要显示图像时，再根据描述、用户的观察位置及光线设定生成该景物的图像。计算机图形学（CG）研究如何使用计算机描述景物并生成其图像的原理、方法与技术。过程模型（算法模型）是根据景物生成规律并用相应算法描述其规律所建立的模型，如描述树木、花草、烟火、毛发、山脉等。$kp$, section = '' where id = 29531;
update t_knowledge_point set title = $kp$JPEG2000$kp$, content = $kp$JPEG 的最新标准是 JPEG2000，采用小波变换与算术编码（图像文件扩展名是 .jp2），技术更先进，可取得更好的效果。$kp$, section = '' where id = 29603;
update t_knowledge_point set title = $kp$非压缩的 BMP 文件$kp$, content = $kp$非压缩的 BMP 文件是一种通用的图像文件格式，几乎所有 Windows 应用软件都能支持。$kp$, section = '' where id = 29604;
update t_knowledge_point set title = $kp$GIF 与真彩色格式的区别$kp$, content = $kp$GIF 图像格式能支持动画效果，但颜色数不超过 256 色；支持每像素 48 比特真彩色的是 PNG 格式。两者都主要用于互联网。$kp$, section = '' where id = 29605;
update t_knowledge_point set title = $kp$数字图像的应用$kp$, content = $kp$数字图像的应用：① 图像通信；② 遥感；③ 医疗诊断；④ 工业生产；⑤ 机器人视觉；⑥ 军事、公安、档案管理。$kp$, section = '' where id = 29606;
update t_knowledge_point set title = $kp$常用图像格式对比$kp$, content = $kp$常用图像格式：
BMP：无损压缩，Windows 标准格式，用于画图。
GIF：无损压缩，支持动画，用于 Internet，最高颜色数不超过 256 色。
TIF：无损压缩，用于排版。
JPEG：有损压缩，用于静态图片，不支持动画。
数码相机常用 JPEG，高端机型可用无损的 RAW。
真彩色为 24 位。$kp$, section = '' where id = 29632;
update t_knowledge_point set title = $kp$BMP 图像文件格式$kp$, content = $kp$BMP 是微软公司提出的一种通用图像文件格式，几乎所有 Windows 应用软件都能支持它。$kp$, section = '' where id = 29653;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22382,22493,23178,23217,23255,23258,23261,23265,23285,23286,23310,23322,23365,23383,23384,23385,23386,23387,23388,23389,23411,23417,23418,23452,23469,25139,25140,25141,25277,25529,25614,25708,25709,27018,27076,27499,27513,27547,27548,27549,27550,28208,28351,28352,28353,28407,29527,29528,29529,29530,29531,29603,29604,29605,29606,29632,29653) and not deleted) <> 57 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
