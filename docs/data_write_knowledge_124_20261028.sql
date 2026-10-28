-- 知识点 124 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_124
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_124 as
select * from t_knowledge_point where id in (23162,23163,23164,23173,23180,23220,23227,23228,23229,23231,23245,23251,23259,23277,23307,23380,23382,23391,23412,23415,23416,23419,23420,23449,23454,23465,25130,25134,25276,26793,26946,26947,26997,27079,27080,27081,27535,27536,27537,27538,27540,27541,27542,27543,27544,27545,27546,27572,27573,27574,27575,27576,28344,28347,28412,29540,29541,29543,29544,29547,29548,29555,29558,29560,29601,29602,29615,29616,29617,29628,29630,29631,32035,32036,32037,32038);

update t_knowledge_point set title = $kp$存储容量换算与可存照片张数$kp$, content = $kp$1 GB = 1024 MB。按每张照片 2.25 MB 计算，1024 ÷ 2.25 ≈ 455.1，即 1 GB 约可存放 455 张照片。$kp$, section = '' where id = 23162;
update t_knowledge_point set title = $kp$JPEG 压缩标准的特点$kp$, content = $kp$JPEG 支持有损压缩和无损压缩，实际应用中有损压缩更多。其特点是：适用范围广；能处理各种连续色调的彩色或灰度图像；算法复杂度适中；既可用硬件实现，也可用软件实现；图像的压缩比可控制。$kp$, section = '' where id = 23163;
update t_knowledge_point set title = $kp$JPEG 与 JPEG 2000 压缩标准$kp$, content = $kp$图像压缩编码方法的国际标准和工业标准：ISO 和 IEC 两个国际机构联合组成了一个专家组（Joint Photographic Experts Group，JPEG），制定了一个静止图像数据压缩编码的国际标准，称为 JPEG 标准。

JPEG 标准的特点：适用范围广；能处理各种连续色调的彩色或灰度图像；算法复杂度适中；既可用硬件实现，也可用软件实现；图像的压缩比可控制（压缩比越低，图像质量越好；压缩比越高，图像质量越差）。

JPEG 2000：适用于各种不同类型（黑白、灰度、彩色等）和不同特性（自然、医学、遥感、合成）的图像，可用于不同的应用模式（实时传输、检索、存档等）。它采用了小波分析等先进算法，提供了更好的图像质量、更低的码率，更适合在 WWW 网上传输，并且兼容 JPEG。

JPEG/JPEG 2000 压缩标准目前压缩率最高。$kp$, section = '' where id = 23164;
update t_knowledge_point set title = $kp$图像的表示方法$kp$, content = $kp$一幅取样图像由 M 行 × N 列个取样点组成，每个取样点称为像素（picture element，简写为 pixel）。彩色图像的像素由多个彩色分量组成，黑白图像的像素只有一个亮度值。

黑白图像：每个像素亮度取值为 0 或 1。
灰度图像：每个像素亮度取值有一个范围，如 0～255。
彩色图像：每个像素分为三个分量，如 R、G、B，三个分量的取值分别有一个范围。$kp$, section = '' where id = 23173;
update t_knowledge_point set title = $kp$数据压缩的类型$kp$, content = $kp$无损压缩：压缩以后的数据进行图像还原（也称解压缩）时，重建的图像与原始图像完全相同。例如行程长度编码（run length coding，RLC）；哈夫曼（Huffman）编码对出现概率高的符号编短码、概率低的编长码，属于变长码。

有损压缩：使用压缩后的数据进行图像重建时，重建后的图像与原始图像虽有一定的误差，但不影响人们对图像含义的正确理解。如变换编码、矢量编码等。$kp$, section = '' where id = 23180;
update t_knowledge_point set title = $kp$JPEG 2000 的特点$kp$, content = $kp$JPEG 2000 采用了小波分析等先进算法，提供了更好的图像质量、更低的码率，更适合在 WWW 网上传输，并且兼容 JPEG，压缩率更高。$kp$, section = '' where id = 23220;
update t_knowledge_point set title = $kp$压缩编码方法优劣的评价$kp$, content = $kp$评价压缩编码方法的优劣主要看三方面：压缩倍数的大小；重建图像的质量（有损压缩时）；压缩算法的复杂程度。$kp$, section = '' where id = 23227;
update t_knowledge_point set title = $kp$取样图像的属性$kp$, content = $kp$图像分辨率（包括垂直分辨率和水平分辨率）：图像在屏幕上的大小。
位平面的数目（矩阵的数目）：彩色分量的数目。
颜色模型：描述彩色图像所使用的颜色描述方法，也叫颜色空间的类型。常用颜色模型有 RGB（红、绿、蓝）、CMYK（青、品红、黄、黑）、HSV（色彩、饱和度、亮度）、YUV（亮度、色度）等。
像素深度：像素的所有颜色分量的二进制位数之和，它决定了不同颜色（亮度）的最大数目。$kp$, section = '' where id = 23228;
update t_knowledge_point set title = $kp$图像的主要参数$kp$, content = $kp$图像分辨率（用水平分辨率 × 垂直分辨率表示）：图像在屏幕上的大小。

颜色空间的类型：指彩色图像所使用的颜色描述方法，也叫颜色模型。通常，显示器使用 RGB（红、绿、蓝）模型，彩色打印机使用 CMYK（青、品红、黄、黑）模型，图像编辑软件使用 HSB（色彩、饱和度、亮度）模型，彩色电视信号传输时使用 YUV（亮度、色度）模型。从理论上讲，这些颜色模型都可以相互转换。

像素深度：像素的所有颜色分量的二进制位数之和，它决定了不同颜色（亮度）的最大数目。$kp$, section = '' where id = 23229;
update t_knowledge_point set title = $kp$数码相机的性能指标与工作原理$kp$, content = $kp$性能指标：

CCD 像素的数目。CCD 像素越多，影像分解的点就越多，最终所得到的影像的分辨率（清晰度）就越高，图像的质量也越好。

存储卡的容量。在图像分辨率和质量要求相同的情况下，存储容量越大，可存储的数字像片就越多。

工作原理：镜头和快门与传统相机基本相同，不同之处是它不使用光敏卤化银胶片成像，而是将影像聚焦在成像芯片（CCD 或 CMOS）上，由成像芯片转换成电信号，再经模数转换（A/D 转换）变成数字图像，经过必要的图像处理和数据压缩之后，存储在相机内部的存储器中。其中成像芯片是数码相机的核心。

CCD 上的影像信息是模拟信号形式，需要经过 A/D 转换部件转换为数字信号，方能存储在存储卡中。$kp$, section = '' where id = 23231;
update t_knowledge_point set title = $kp$压缩编码方法优劣的评价指标$kp$, content = $kp$评价压缩编码方法优劣的指标：压缩倍数（压缩比）的大小；重建图像的质量（有损压缩时）；压缩算法的复杂程度。$kp$, section = '' where id = 23245;
update t_knowledge_point set title = $kp$微信发送照片时的压缩$kp$, content = $kp$在微信中发送照片（JPEG 图像）时，由于照片原图的分辨率一般都很高，如果不选择以原图发送，微信 App 会把每张照片的分辨率降低到屏幕的分辨率再发送。$kp$, section = '' where id = 23251;
update t_knowledge_point set title = $kp$图像数据量的计算公式$kp$, content = $kp$以字节为单位：数据量 = 图像水平分辨率 × 图像垂直分辨率 × 像素深度 / 8。$kp$, section = '' where id = 23259;
update t_knowledge_point set title = $kp$计算机图形与矢量图形$kp$, content = $kp$为了区别于通常的取样图像，计算机合成图像称为矢量图形（图形），制作矢量图形的软件称为矢量绘图软件。用 Flash 软件制作的动画是矢量图形，这种动画文件（文件后缀为 .swf）很小，便于在因特网上传输。

图形文件中只记录生成图形的算法和图上的某些特征点，数据量很小。

计算机图形学：研究如何使用计算机描述景物并生成其图像的原理、方法与技术。$kp$, section = '' where id = 23277;
update t_knowledge_point set title = $kp$图像的表示与压缩编码$kp$, content = $kp$从取样图像的获取过程可以知道，一幅取样图像由 M（行）× N（列）个取样点组成，每个取样点是组成取样图像的基本单位，称为像素（picture element，简写为 pel）。彩色图像的像素是矢量，由多个彩色分量组成；黑白图像的像素只有 1 个亮度值。

取样图像在计算机中的表示方法：单色图像用一个矩阵来表示；彩色图像用一组（一般是 3 个）矩阵来表示，每个矩阵称为一个位平面。矩阵的行数称为图像的垂直分辨率，列数称为图像的水平分辨率，矩阵中的元素是像素颜色分量的亮度值，使用整数表示，一般是 8 位至 12 位。

图像的属性信息：图像大小，也称图像分辨率（包括垂直分辨率和水平分辨率）；位平面的数目，即矩阵的数目，也就是彩色分量的数目；颜色空间的类型，指彩色图像所使用的颜色描述方法，也叫颜色模型，常用 RGB（红、绿、蓝）、CMYK（青、品红、黄、黑）、HSV（色彩、饱和度、亮度）、YUV（亮度、色度）等；像素深度，即像素所有颜色分量的位数之和，它决定了不同颜色（亮度）的最大数目。

图像数据量的计算公式（以字节为单位）：图像数据量 = 图像水平分辨率 × 图像垂直分辨率 × 像素深度 / 8。$kp$, section = '' where id = 23307;
update t_knowledge_point set title = $kp$分辨率与图像显示尺寸的关系$kp$, content = $kp$在显示比例相同时，显示在屏幕上的图像尺寸与图像分辨率成正比：图像分辨率越高，在屏幕上显示的尺寸越大。$kp$, section = '' where id = 23380;
update t_knowledge_point set title = $kp$取样图像的属性与数据量计算$kp$, content = $kp$取样图像的属性（参数）：

- 图像分辨率（包括垂直分辨率和水平分辨率）：图像在屏幕上的大小。
- 位平面的数目（矩阵的数目）：彩色分量的数目。
- 颜色模型：描述彩色图像所使用的颜色描述方法，也叫颜色空间的类型。常用颜色模型：RGB（红、绿、蓝）、CMYK（青、品红、黄、黑）、HSV（色彩、饱和度、亮度）、YUV（亮度、色度）等。
- 像素深度：像素的所有颜色分量的二进制位数之和，它决定了不同颜色（亮度）的最大数目。如只有 1 个位平面的单色图像，若像素深度是 8 位，则不同亮度的数目为 2^8 = 256；又如由 R、G、B 三个位平面组成的彩色图像，若三个位平面中的像素位数分别为 4、4、4，则该图像的像素深度为 12，最大颜色数目为 2^12 = 4096。

图像的数据量：

- 图像数据量的计算公式（以字节为单位）：数据量（B）= 图像水平分辨率 × 图像垂直分辨率 × 像素深度（b）/ 8。
- 需要记住的几个计算结果：2^8 = 256，2^10 = 1024，2^12 = 4096，2^16 = 65536。$kp$, section = '' where id = 23382;
update t_knowledge_point set title = $kp$图像的表示方法与主要参数$kp$, content = $kp$一幅取样图像由 M 行 × N 列个取样点组成，每个取样点称为像素（picture element，简写为 pixel）。彩色图像的像素由多个彩色分量组成，黑白图像的像素只有一个亮度值。

黑白图像：每个像素亮度取值为 0 或 1。
灰度图像：每个像素亮度取值有一个范围，如 0～255。
彩色图像：每个像素分为三个分量，如 R、G、B，三个分量的取值分别有一个范围。$kp$, section = '' where id = 23391;
update t_knowledge_point set title = $kp$彩色图像的表示$kp$, content = $kp$彩色图像的每个像素有三个分量，分别表示三个基色的亮度。假设 3 个分量分别用 n、m、k 个二进位表示，则可表示 2^(n+m+k) 种不同的颜色。$kp$, section = '' where id = 23412;
update t_knowledge_point set title = $kp$数字（取样）图像的主要参数$kp$, content = $kp$图像大小（图像分辨率）：水平分辨率 × 垂直分辨率。用来表示组成该图像的行列数目，亦即图像所包含的像素数目，对图像清晰度和在屏幕上显示出来的大小有影响。

位平面数目：即像素的颜色分量的数目。

颜色空间的类型：指彩色图像所使用的颜色描述方法，如：

- RGB（红、绿、蓝）模型，显示器使用；
- CMYK（青、品红、黄、黑）模型，彩色打印机使用；
- HSB（色彩、饱和度、亮度）模型，用户界面中使用；
- YUV（亮度、色度）模型，彩色电视信号传输时使用。

像素深度：即像素的所有颜色分量的二进位数目之和。$kp$, section = '' where id = 23415;
update t_knowledge_point set title = $kp$数字（取样）图像的组成$kp$, content = $kp$数字取样图像由 M（列）× N（行）个取样点组成；取样点是组成数字取样图像的基本单位，称为像素；彩色图像的像素通常由 3 个彩色分量组成；灰度图像和黑白图像的像素只包含 1 个亮度分量。$kp$, section = '' where id = 23416;
update t_knowledge_point set title = $kp$数字图像的数据压缩$kp$, content = $kp$图像数据压缩的必要性：节省存储数字图像所需要的存储器容量；提高图像的传输速度，减少通信费用。

图像数据压缩的可能性：数字图像中有大量的数据冗余；人眼视觉有局限性，允许图像有一些失真。

图像数据压缩的两种类型：无损压缩，用压缩后的数据还原出来的图像没有任何误差；有损压缩，用压缩后的数据还原出来的图像有一定的误差。

压缩编码方法的评价：压缩倍数的高低（压缩比大小）、重建图像的质量（有损压缩时）、压缩算法的复杂程度。$kp$, section = '' where id = 23419;
update t_knowledge_point set title = $kp$数字图像的数据量$kp$, content = $kp$数字图像数据量的计算公式（以字节为单位）：数据量 = 水平分辨率 × 垂直分辨率 × 像素深度 / 8。

几种常用格式图像的数据量：

| 图像大小 | 8 位（256 色） | 16 位（65536 色） | 24 位（真彩色） |
| --- | --- | --- | --- |
| 640×480 | 300 KB | 600 KB | 900 KB |
| 1024×768 | 768 KB | 1.5 MB | 2.25 MB |
| 1280×1024 | 1.25 MB | 2.5 MB | 3.75 MB |

压缩之后数字图像的数据量计算（以字节为单位）：数据量 = (水平分辨率 × 垂直分辨率 × 像素深度 / 8) / 压缩比。$kp$, section = '' where id = 23420;
update t_knowledge_point set title = $kp$灰度图像的表示$kp$, content = $kp$灰度图像的每个像素也只有一个分量，一般用 8～12 个二进位表示，其取值范围是 0～2^n − 1，可表示 2^n 个不同的亮度。$kp$, section = '' where id = 23449;
update t_knowledge_point set title = $kp$取样图像的表示方法$kp$, content = $kp$取样图像在计算机中的表示方法是：灰度图像用一个矩阵来表示；彩色图像用一组（一般是 3 个）矩阵来表示，每个矩阵称为一个位平面。矩阵的行数为图像的垂直分辨率，列数称为图像的水平分辨率，矩阵中的元素是像素颜色分量的亮度值，通常是一个 8～12 位的二进制整数。$kp$, section = '' where id = 23454;
update t_knowledge_point set title = $kp$黑白图像的表示$kp$, content = $kp$黑白图像的每个像素只有一个分量，且只用 1 个二进位表示，其取值仅有 0（黑）和 1（白）两种。$kp$, section = '' where id = 23465;
update t_knowledge_point set title = $kp$20 dpi 的取样密度$kp$, content = $kp$20 dpi 即每英寸 20 个像素，取样密度较低，图像细节较少、颗粒感较明显。$kp$, section = '' where id = 25130;
update t_knowledge_point set title = $kp$72 dpi 的取样密度$kp$, content = $kp$72 dpi 即每英寸 72 个像素，是常见的屏幕显示分辨率，图像细节比 20 dpi 更丰富。$kp$, section = '' where id = 25134;
update t_knowledge_point set title = $kp$数据压缩的分类与必要性$kp$, content = $kp$数据压缩的分类：

- 无损压缩：数据可完整还原；
- 有损压缩：数据有损失。

压缩的必要性：本地存储和网络传输的需要。图像、声音等媒体数据量大，而网络带宽有限。

压缩的可行性：数据中存在大量冗余，且人的视觉、听觉有局限性。

数据冗余的常见形式，以及 JPEG 图像、音频信号、声音信号、视频信号的压缩。$kp$, section = '' where id = 25276;
update t_knowledge_point set title = $kp$数字图像的性能指标$kp$, content = $kp$数字图像的数据量 = 图像的分辨率 × 图像深度 / 8。

图像分辨率是指一幅图像横向和纵向像素点数的乘积；图像位深度是指一个像素能表示的色彩范围，如明度范围、饱和度范围、色相表示等。

换算单位：1 B = 8 bit，如果要换算成 KB 就继续除以 1024。

图像压缩编码的分类：根据压缩过程有无信息损失，可分为有损编码和无损编码；按压缩技术所依据和采用的数学理论和计算方法，可分为统计编码、预测编码和变换编码。$kp$, section = '' where id = 26793;
update t_knowledge_point set title = $kp$图像在计算机中的表示$kp$, content = $kp$把图像离散成为 M 列、N 行，这个过程称为图像的取样。经过取样之后，图像就分解成为 M×N 个取样点，每个取样点称为图像的一个像素。

如果是黑白图像，每个像素只有 2 个值：黑（0）、白（1），因此一幅黑白图像可使用一个矩阵表示。

灰度图像和彩色图像的表示比较复杂一些。$kp$, section = '' where id = 26946;
update t_knowledge_point set title = $kp$黑白图像的表示举例$kp$, content = $kp$每个像素使用 1 个比特表示：0 表示黑，1 表示白。把各像素的比特按行排列，就得到该黑白图像的二进制矩阵。

例如某图像两行像素的位串为 01010110101101001001000111110000、01101001011010010110010100000110。$kp$, section = '' where id = 26947;
update t_knowledge_point set title = $kp$显示属性设置$kp$, content = $kp$Windows XP 提供了比较灵活的人机交互界面，用户可以方便地设置它的外观，包括改变桌面的背景以及设置屏幕保护程序、窗口外观、色彩模式和分辨率等。

打开“控制面板”窗口，双击“显示”图标，或右击桌面空白处，在快捷菜单中选择“属性”命令，即可打开“显示属性”对话框。$kp$, section = '' where id = 26997;
update t_knowledge_point set title = $kp$图像分辨率的计算$kp$, content = $kp$图像分辨率 = 水平分辨率 × 垂直分辨率。$kp$, section = '' where id = 27079;
update t_knowledge_point set title = $kp$像素深度与可表示的颜色数目$kp$, content = $kp$像素深度：像素所有颜色分量的二进制位数之和。

① 像素深度为 24 位，一共可以表示 2^24 种颜色，称为真彩色；
② 像素深度为 16 位，一共可以表示 2^16 种颜色；
③ 像素深度为 8 位，一共可以表示 2^8 种颜色。$kp$, section = '' where id = 27080;
update t_knowledge_point set title = $kp$图像数据量计算的常见题型$kp$, content = $kp$彩色显示器使用 RGB 颜色模型，RGB 每个分量的二进制位数之和就是像素深度。

图像数据量计算的三类常见题型：

第一类：根据数码相机拍摄出的相片的分辨率，计算数码相机的最少像素。求解方法：图像分辨率 = 水平分辨率 × 垂直分辨率，数码相机的分辨率一定要大于图像分辨率且最接近。

第二类：图像具有的颜色数目和图像的像素深度之间的互相推算。求解方法：像素所有颜色分量的二进制位数之和为像素深度，2^像素深度 = 图像具有的最大颜色数目。牢记 2^8 = 256、2^16 = 65536、2^24 = 16777216（真彩色，约一千六百万色）。

第三类：根据图像的分辨率和像素深度（一般需要自行计算出），计算数字图像的数据量。求解方法：图像数据量 = 水平分辨率 × 垂直分辨率 × 像素深度 / 8（字节）。$kp$, section = '' where id = 27081;
update t_knowledge_point set title = $kp$彩色图像与黑白图像的像素分量$kp$, content = $kp$黑白图像的像素只有1个亮度分量，无须分色；彩色图像的像素通常包含红、绿、蓝3个颜色分量，需要分色。$kp$, section = '' where id = 27535;
update t_knowledge_point set title = $kp$图像的大小与位平面数目$kp$, content = $kp$图像的大小也就是图像分辨率。黑白图像有1个位平面，彩色图像有3个或更多位平面。$kp$, section = '' where id = 27536;
update t_knowledge_point set title = $kp$位平面的数目$kp$, content = $kp$黑白图像只有1个位平面，彩色图像有3个或更多位平面。$kp$, section = '' where id = 27537;
update t_knowledge_point set title = $kp$像素深度$kp$, content = $kp$像素深度是每个像素的二进制位数，等于该像素所有颜色分量的二进制位数之和。$kp$, section = '' where id = 27538;
update t_knowledge_point set title = $kp$图像数据量的计算公式$kp$, content = $kp$图像数据量 = 水平分辨率 × 垂直分辨率 × 像素深度 ÷ 8，单位为字节。$kp$, section = '' where id = 27540;
update t_knowledge_point set title = $kp$像素深度的含义$kp$, content = $kp$像素深度是一个像素所有颜色分量使用的二进制位数目之和。$kp$, section = '' where id = 27541;
update t_knowledge_point set title = $kp$图像数据压缩的必要性$kp$, content = $kp$① 节省存储数字图像所需的存储器容量。

② 提高图像的传输速度，减少通信费用。$kp$, section = '' where id = 27542;
update t_knowledge_point set title = $kp$图像数据压缩的可能性$kp$, content = $kp$① 数字图像中存在大量数据冗余。

② 人眼视觉有局限性，允许图像有一定失真。$kp$, section = '' where id = 27543;
update t_knowledge_point set title = $kp$图像数据压缩的两种类型$kp$, content = $kp$无损压缩：用压缩后的数据还原出的图像没有任何误差。

有损压缩：用压缩后的数据还原出的图像有一定误差。$kp$, section = '' where id = 27544;
update t_knowledge_point set title = $kp$图像压缩编码方法的评价$kp$, content = $kp$① 压缩倍数的高低（压缩比）。

② 重建图像的质量（有损压缩时）。

③ 压缩算法的复杂程度。$kp$, section = '' where id = 27545;
update t_knowledge_point set title = $kp$JPEG图像压缩标准$kp$, content = $kp$JPEG是静止图像压缩编码的国际标准，特别适合各种连续色调的彩色或灰度图像，在计算机网络和数码相机中已得到广泛应用。

其压缩算法复杂度适中，既可用硬件实现，也可用软件实现；压缩比可由用户控制。$kp$, section = '' where id = 27546;
update t_knowledge_point set title = $kp$图像分辨率的计算$kp$, content = $kp$图像分辨率 = 水平分辨率 × 垂直分辨率。$kp$, section = '' where id = 27572;
update t_knowledge_point set title = $kp$图像数据量的计算$kp$, content = $kp$图像数据量 = 水平分辨率 × 垂直分辨率 × 像素深度 / 8，单位为字节。$kp$, section = '' where id = 27573;
update t_knowledge_point set title = $kp$题型一：由相片分辨率推算数码相机的最少像素$kp$, content = $kp$根据数码相机拍摄出的相片分辨率，计算数码相机的最少像素。

求解方法：图像分辨率 = 水平分辨率 × 垂直分辨率，数码相机的分辨率应大于图像分辨率且最接近。$kp$, section = '' where id = 27574;
update t_knowledge_point set title = $kp$题型二：图像颜色数目与像素深度的互相推算$kp$, content = $kp$像素所有颜色分量的二进制位数之和为像素深度，图像具有的最大颜色数目为 2 的像素深度次方。

常用数值：2的8次方 = 256，2的16次方 = 65536，2的24次方 = 16777216（真彩色，约一千六百万色）。$kp$, section = '' where id = 27575;
update t_knowledge_point set title = $kp$题型三：由分辨率和像素深度计算图像数据量$kp$, content = $kp$根据图像的分辨率和像素深度（一般须自行计算出）计算数字图像的数据量。

求解方法：图像数据量 = 水平分辨率 × 垂直分辨率 × 像素深度 / 8，单位为字节。$kp$, section = '' where id = 27576;
update t_knowledge_point set title = $kp$图像（取样图像、点阵图像、位图图像）$kp$, content = $kp$从现实世界中通过数字化设备获取的数字图像称为取样图像、点阵图像或位图图像，它通过描述画面中每一个像素的亮度或颜色来表示其内容。$kp$, section = '' where id = 28344;
update t_knowledge_point set title = $kp$灰度图像和黑白图像的亮度分量$kp$, content = $kp$灰度图像和黑白图像的像素只包含1个亮度分量。$kp$, section = '' where id = 28347;
update t_knowledge_point set title = $kp$数码相机压缩比推算（题干残缺）$kp$, content = $kp$题干残缺，仅存“一架数码相机……可以推算出图像数据的压缩比是 40”“1024 的彩色相片 1250 张”等片段，无法还原完整题意。$kp$, section = '' where id = 28412;
update t_knowledge_point set title = $kp$像素深度与各类图像的表示$kp$, content = $kp$像素深度：黑白、灰度图像指亮度的变化范围，彩色图像指各颜色分量二进制位数之和。

黑白图像：1位，0表示黑，1表示白。

灰度图像：8～12位（n 位），0表示黑，2的n次方减1表示白。

彩色图像：三个颜色分量的位数之和。$kp$, section = '' where id = 29540;
update t_knowledge_point set title = $kp$最大颜色数目的计算$kp$, content = $kp$最大颜色数目即亮度的变化范围。

例：某灰度图像用12位表示，其亮度变化范围为 2的12次方减1 = 4095。

例：某彩色图像 RGB 三种颜色各用4位表示，最大颜色数目为 2的(4+4+4)次方 = 2的12次方 = 4096。$kp$, section = '' where id = 29541;
update t_knowledge_point set title = $kp$扫描仪的性能指标$kp$, content = $kp$分辨率：以 dpi 为单位。

色彩位数：位数越高，颜色分辨能力越强；每个像素可显示的颜色数目为 2 的像素色彩位数次方。

扫描幅面：扫描仪允许的最大尺寸。

接口：如 USB。$kp$, section = '' where id = 29543;
update t_knowledge_point set title = $kp$数码相机的标注像素$kp$, content = $kp$数码相机标注的像素一般比真正能够拍摄的照片像素大一些。

例如：能够拍摄 1600×1200 照片的数码相机，一般标注为200万像素。$kp$, section = '' where id = 29544;
update t_knowledge_point set title = $kp$压缩后图像数据量的计算$kp$, content = $kp$压缩数据量 =（水平分辨率 × 垂直分辨率 × 像素深度 / 8）/ 压缩比。$kp$, section = '' where id = 29547;
update t_knowledge_point set title = $kp$图像压缩的种类$kp$, content = $kp$无损压缩：还原出来的图像与原始图像一致，没有任何误差。

有损压缩：还原出来的图像与原始图像有一定误差，如有损格式 JPG、JP2。$kp$, section = '' where id = 29548;
update t_knowledge_point set title = $kp$图像与图形的别称$kp$, content = $kp$图像（image）又称取样图像、点阵图像、位图图像；图形（graphics）又称矢量图形。$kp$, section = '' where id = 29555;
update t_knowledge_point set title = $kp$图像数据量计算公式$kp$, content = $kp$图像数据量的计算公式：图像水平分辨率 × 图像垂直分辨率 × 像素深度 / 8，单位为字节。$kp$, section = '' where id = 29558;
update t_knowledge_point set title = $kp$压缩编码方法的评价标准$kp$, content = $kp$评价一种压缩编码方法的优劣主要看三个方面：压缩倍数、重建图像的质量、压缩算法的复杂程度。$kp$, section = '' where id = 29560;
update t_knowledge_point set title = $kp$图像分辨率与图像清晰度$kp$, content = $kp$图像分辨率 = 水平分辨率 × 垂直分辨率。同样大小的一幅图像，分辨率越高，图像越清晰。$kp$, section = '' where id = 29601;
update t_knowledge_point set title = $kp$像素深度与颜色数目$kp$, content = $kp$像素深度是一个像素所有颜色分量的二进制位数目之和。2的16次方 = 65536，2的24次方 = 16777216。$kp$, section = '' where id = 29602;
update t_knowledge_point set title = $kp$像素与分辨率$kp$, content = $kp$照片分辨率达 1600×1200 时，共有 1920000 个像素（约200万像素），这样的数码相机能满足一般应用要求。

500万像素的数码相机，所拍摄图像的最高分辨率可达 2592×1944。$kp$, section = '' where id = 29615;
update t_knowledge_point set title = $kp$像素深度的定义与图像数据量$kp$, content = $kp$黑白或灰度图像用1个矩阵表示，彩色图像用多个（一般为3个）矩阵表示。

像素深度是像素所有颜色分量的二进制位数之和，它决定了不同颜色（亮度）的最大数目。若 R、G、B 各用4位，则最大颜色数目为 4096。

图像数据量 = 图像水平分辨率 × 图像垂直分辨率 × 像素深度 / 8。$kp$, section = '' where id = 29616;
update t_knowledge_point set title = $kp$图像压缩方法与评价标准$kp$, content = $kp$图像压缩方法很多，不同方法适用于不同的应用，一台计算机能使用多种压缩方法。

优劣评价标准：适用范围、压缩倍数的大小、重建图像的质量（有损压缩时）、压缩算法的复杂程度。$kp$, section = '' where id = 29617;
update t_knowledge_point set title = $kp$图像的像素组成$kp$, content = $kp$一幅图像由 M 行 × N 列取样点组成，组成图像的基本单位称为像素。

黑白图像和灰度图像只有一个亮度分量，没有色彩分量（一个位平面）；彩色图像的每个像素分为三个分量。$kp$, section = '' where id = 29628;
update t_knowledge_point set title = $kp$图像数据量计算与压缩倍数例题$kp$, content = $kp$数据量 = 图像水平分辨率 × 图像垂直分辨率 × 像素深度 / 8，单位为字节。

例题：一部数码相机使用的 Flash 存储器容量为 1GB，一次可以连续拍摄 65536 色的 2048×1024 彩色相片 1280 张，该相机的图像压缩倍数是多少？

解答：65536 色即像素深度 16 位，2048×1024×16/8 = 4194304B = 4MB；4MB×1280 = 5120MB = 5GB；压缩倍数 = 5GB / 1GB = 5 倍。$kp$, section = '' where id = 29630;
update t_knowledge_point set title = $kp$图像压缩的必要性、可能性与评价指标$kp$, content = $kp$必要性：节省存储容量，提高传输速度，减少通信费用。

可能性：图像数据存在大量冗余（重复），且压缩前后允许一定失真。

压缩类型：无损压缩和有损压缩。

评价压缩编码方法优劣的指标：压缩倍数的大小、重建图像的质量、压缩算法的复杂程度。$kp$, section = '' where id = 29631;
update t_knowledge_point set title = $kp$彩色图像与灰度图像的像素组成$kp$, content = $kp$彩色图像的像素通常由 3 个彩色分量组成；灰度图像和黑白图像的像素只包含 1 个亮度分量。$kp$, section = '' where id = 32035;
update t_knowledge_point set title = $kp$像素深度与颜色数目$kp$, content = $kp$像素深度：表示一个像素所有颜色分量使用的二进制位数目之和。2^16 = 65536，2^24 = 16777216。$kp$, section = '' where id = 32036;
update t_knowledge_point set title = $kp$压缩编码方法的评价指标$kp$, content = $kp$压缩编码方法的评价：压缩倍数的高低（压缩比）、重建图像的质量（有损压缩时）、压缩算法的复杂程度。$kp$, section = '' where id = 32037;
update t_knowledge_point set title = $kp$JPEG 标准与常见图像文件格式$kp$, content = $kp$静止图像压缩编码国际标准——JPEG（大多数为有损）：

① JPEG 特别适合各种连续色调的彩色或灰度图像，在计算机和数码相机中得到广泛应用；
② 压缩算法复杂度适中，既可用硬件实现，也可用软件实现；
③ JPEG 图像压缩比可由用户控制，压缩比越高图像质量越差。

BMP（无损）：BMP 图像格式是 Windows 操作系统下使用的一种标准图像格式。非压缩的 BMP 文件是一种通用的图像文件格式，几乎所有 Windows 应用软件都能支持。

GIF（无损）：

① GIF 图像格式颜色数目不超过 256 色，文件特别小，适合网络传输；
② GIF 具有累进显示功能，适合网络浏览器观看；
③ GIF 支持透明背景（JPEG 不支持）；
④ GIF 支持动画。

图形：

① 矢量图形的特点：放大不失真、数据量小、不够真实、方便编辑；
② 景物建模的两种方法：几何建模技术、过程建模技术；
③ 显卡中的绘图处理器 GPU 能承担绘制过程中的大部分计算任务；
④ 常见图像处理软件：Paint、Photo Editor、PhotoImpact、ACDSee、PhotoShop 等；
⑤ 数字图像的应用：图像通信、遥感、医疗诊断、工业生产、机器人视觉、军事、公安、档案管理；
⑥ 计算机合成图像应用：计算机辅助设计（CAD）、地形图、交通图、天气图、作战指挥、军事训练、计算机艺术和计算机动画（Flash）；
⑦ 常见的图形处理软件：AutoCAD、PROTEL、CorelDraw、Visio；
⑧ Office 可以编辑简单的二维图形。$kp$, section = '' where id = 32038;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (23162,23163,23164,23173,23180,23220,23227,23228,23229,23231,23245,23251,23259,23277,23307,23380,23382,23391,23412,23415,23416,23419,23420,23449,23454,23465,25130,25134,25276,26793,26946,26947,26997,27079,27080,27081,27535,27536,27537,27538,27540,27541,27542,27543,27544,27545,27546,27572,27573,27574,27575,27576,28344,28347,28412,29540,29541,29543,29544,29547,29548,29555,29558,29560,29601,29602,29615,29616,29617,29628,29630,29631,32035,32036,32037,32038) and not deleted) <> 76 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
