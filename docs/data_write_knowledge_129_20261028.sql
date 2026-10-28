-- 知识点 129 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_129
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_129 as
select * from t_knowledge_point where id in (22160,22161,22162,23165,23179,23207,23226,23232,23239,23247,23248,23266,23301,23302,23324,23328,23357,23378,23379,23396,23399,23400,23401,23402,23426,23428,23430,23431,23432,23464,23676,24643,25168,25274,25997,25998,26802,26803,26804,27025,27515,27517,27518,27519,27520,27522,27523,27752,27753,28345,29534,29535,29536,29537,29564,29580,29638,29639,29656,29657);

update t_knowledge_point set title = $kp$声卡的几种类型$kp$, content = $kp$声卡分为独立声卡和集成声卡。

独立声卡：以扩展卡形式插在机箱中使用。

集成声卡：声卡的组成部分均集成在主板上，又分为软声卡和硬声卡。

- 软声卡：主板上仅有一块 CODEC 芯片，负责取样与量化处理；I/O 控制器部分集成在主板南桥芯片中，DSP 的功能需由 CPU 协助完成。
- 硬声卡：除 CODEC 芯片外，主板上还有一块音频主处理芯片，很多音效处理任务无需 CPU 参与即可独立完成。$kp$, section = '' where id = 22160;
update t_knowledge_point set title = $kp$声卡的物理实现$kp$, content = $kp$声卡主要由两块芯片组成：

- 主处理芯片：包括数字信号处理器、MIDI 控制、I/O 控制等。
- CODEC 芯片：负责多声道取样、A/D 与 D/A 转换、混音处理等。

当前 PC 机的声卡大多不再做成独立的插卡形式，而是与主板集成在一起，称为集成声卡。$kp$, section = '' where id = 22161;
update t_knowledge_point set title = $kp$声卡的组成$kp$, content = $kp$声卡以数字信号处理器（DSP）为核心，DSP 在完成数字声音的编码、解码及声音编辑操作中起着重要作用。声卡利用 PCI 总线与主机进行数据交换；混音器（mixer）将不同的声音信号进行混音，并提供音量控制功能。

PC 机的声卡较多已与主板集成在一起，不再做成独立的插卡。

利用声卡可在线（on-line）获取声音；使用数码录音笔可离线（off-line）获取声音，再通过 USB 接口将已经数字化的声音数据送入计算机。数码录音笔的原理与上述过程基本相同，但由于带宽的限制，一般适合于录制语音。$kp$, section = '' where id = 22162;
update t_knowledge_point set title = $kp$MPEG-1 声音压缩编码$kp$, content = $kp$MPEG-1 声音压缩编码是国际上第一个高保真声音数据压缩的国际标准，分为三个层次：

- 层 1（Layer 1）：编码简单，用于数字盒式录音磁带。
- 层 2（Layer 2）：算法复杂度中等，用于数字音频广播（DAB）和 VCD 等。
- 层 3（Layer 3）：编码复杂，用于互联网上的高质量声音传输，如 MP3 音乐可压缩约 10 倍。$kp$, section = '' where id = 23165;
update t_knowledge_point set title = $kp$数字声音的类型$kp$, content = $kp$数字声音分为波形声音和计算机合成声音两类。

波形声音（取样声音）：
- 语音（人的说话声音）：带宽约 300～3400Hz。
- 全频带声音（现实世界中的各种声音）：带宽约 20Hz～20kHz。

计算机合成声音：合成语音和合成音乐（MIDI）。$kp$, section = '' where id = 23179;
update t_knowledge_point set title = $kp$无法辨识的题目解析残片$kp$, content = $kp$该条目为 OCR 识别残片，文字错乱且内容不完整，无法还原为有效知识点。$kp$, section = '' where id = 23207;
update t_knowledge_point set title = $kp$全频带声音的压缩编码$kp$, content = $kp$数字声音的数据量很大。例如 CD 盘片上存储的立体声高保真全频带数字音乐，1 小时的数据量约为 635MB。

采用压缩编码的目的：降低存储成本和传输通信带宽，对数字波形声音进行数据压缩。$kp$, section = '' where id = 23226;
update t_knowledge_point set title = $kp$声音的播放与音箱$kp$, content = $kp$播放：将模拟音频信号经处理和放大后送到音箱（扬声器）。

音箱分类：
- 普通音箱：接收的是重建后的模拟声音信号。
- 数字音箱：直接接收数字声音信号，失真更小。$kp$, section = '' where id = 23232;
update t_knowledge_point set title = $kp$波形声音的获取设备$kp$, content = $kp$声音获取设备包括麦克风和声卡。

麦克风的作用是将声波转换为电信号，然后由声卡进行数字化。

声卡以数字信号处理器（DSP）为核心，既参与声音的获取，也负责声音的重建，控制并完成声音的输入与输出。主要功能包括：波形声音的获取与数字化、声音的重建与播放、MIDI 声音的输入、MIDI 声音的合成与播放。$kp$, section = '' where id = 23239;
update t_knowledge_point set title = $kp$声音获取设备$kp$, content = $kp$数字音频的获取设备包括麦克风（话筒）和声卡。麦克风的作用是将声波转换成电信号，然后由声卡进行数字化。

声卡既负责音频信号的获取，也负责音频信号的重建，控制并完成声音的输入与输出。$kp$, section = '' where id = 23247;
update t_knowledge_point set title = $kp$声音数据量计算$kp$, content = $kp$未压缩数据量 = 取样频率 × 量化位数 × 声道数 × 时间。

例如取样频率 22.05kHz、8 位量化、双声道、时长 120 秒，数据量约为 22.05 × 8/8 × 2 × 120 / 1024 ≈ 5.2MB。$kp$, section = '' where id = 23248;
update t_knowledge_point set title = $kp$麦克风与声卡$kp$, content = $kp$麦克风：将声波转换为电信号（模拟量）。

声卡（sound card）：进行模拟电信号的数字化。$kp$, section = '' where id = 23266;
update t_knowledge_point set title = $kp$波形声音的表示与压缩编码$kp$, content = $kp$波形声音的主要参数：取样频率、量化位数、声道数目、使用的压缩编码方法、数码率（bit rate，也称比特率、码率，指每秒钟的数据量）。

未压缩时：波形声音的码率 = 取样频率 × 量化位数 × 声道数。
压缩编码后：码率 = 压缩前的码率 / 压缩倍数。

几种常见数字声音的主要参数：

| 声音类型 | 带宽（Hz） | 取样频率（kHz） | 量化位数（bit） | 声道数 | 未压缩时的码率 | 压缩后的码率 |
| --- | --- | --- | --- | --- | --- | --- |
| 数字语音 | 300～3400 | 8 | 8 | 1 | 64kb/s | 2～64kb/s |
| CD 唱片 | 20～20000 | 44.1 | 16 | 2 | 176.4kB/s | 176.4kB/s |
| MP3 音乐 | 20～20000 | 44.1 | 16 | 2 | 176.4kB/s | 128～112kb/s |

全频带声音的压缩编码：
- 问题：数据量很大。如 CD 盘片上存储的立体声高保真全频带数字音乐，1 小时的数据量约为 635MB。
- 目的与办法：降低存储成本和传输通信带宽，对数字波形声音进行数据压缩。
- 压缩的可能性：声音信号中包含大量冗余信息，还可利用人的听觉感知特性，因此产生了许多压缩算法。
- 压缩算法的评价：压缩倍数高、声音失真小、算法简单、编码器/解码器成本低。

第 1 代编码技术——PCM（脉冲编码调制）编码：依据声音波形本身的信息相关性进行数据压缩，代表性应用是 CD 唱片。

第 2 代压缩编码——感知声音编码（perceptual audio coding）：既利用声音信息本身的相关性，又利用人耳的听觉特性，即使用“心理声学模型”来大幅度压缩数据。其编码过程为：
1. 通过时间/频率变换和心理声学分析，揭示原始声音中与人耳感知无关的信息。
2. 通过量化和编码予以抑制。
3. 使用熵编码消除声音信息中的统计冗余。

第 2 代全频带声音压缩编码标准：

| 名称 | 压缩后的码率（每个声道） | 声道数目 | 主要应用 |
| --- | --- | --- | --- |
| MPEG-1 层 1 | 384kb/s（压缩 4 倍） | 2 | 数字盒式录音带 |
| MPEG-1 层 2 | 256～192kb/s（压缩 6～8 倍） | 2 | DAB、VCD、DVD |
| MPEG-1 层 3 | 128～112kb/s（压缩 10～12 倍） | 2 | Internet、MP3 音乐 |
| MPEG-2 音频 | 与 MPEG-1 层 1、层 2、层 3 相同 | 5.1、7.0 | 同 MPEG-1 |
| Dolby AC-3 | 64kb/s | 5.1、7.1 | DVD、DTV、家庭影院 |

MPEG-1 声音压缩编码是国际上第一个高保真声音数据压缩的国际标准，分为三个层次：层 1 编码简单，用于数字盒式录音磁带；层 2 算法复杂度中等，用于数字音频广播（DAB）和 VCD 等；层 3 编码复杂，用于互联网上的高质量声音传输，如 MP3 音乐压缩约 10 倍。

MPEG-2 的声音压缩编码采用与 MPEG-1 声音相同的编译码器，层 1、层 2 和层 3 的结构也相同，但能支持 5.1 声道和 7.1 声道的环绕立体声。$kp$, section = '' where id = 23301;
update t_knowledge_point set title = $kp$波形声音的编辑$kp$, content = $kp$声音编辑软件的功能：

基本编辑操作：声音的剪辑（删除、移动或复制一段声音，插入空白等）、音量调节（提高或降低音量，淡入、淡出处理等）、声音的反转、持续时间的压缩/拉伸、消除噪音、声音的频谱分析。

声音的效果处理：包括混响、回声、延迟、频率均衡、和声效果、动态效果、升降调、颤音等。

其他功能：格式转换、分轨录音、配音、刻录 CD 唱片等。$kp$, section = '' where id = 23302;
update t_knowledge_point set title = $kp$音频编辑软件的界面$kp$, content = $kp$音频编辑软件的典型界面包含左右声道信号波形、播放标尺、时间刻度、淡入与淡出标记以及数字音频参数等。

界面中显示的参数示例：取样频率 22.05kHz、8 位量化、立体声。$kp$, section = '' where id = 23324;
update t_knowledge_point set title = $kp$音箱分类$kp$, content = $kp$普通音箱：接收的是重建后的模拟声音信号。

数字音箱：可直接接收声卡输出的数字声音信号，避免信号在传输中发生畸变和受到干扰，音响效果更加突出。$kp$, section = '' where id = 23328;
update t_knowledge_point set title = $kp$码率定义与计算公式$kp$, content = $kp$数码率（bit rate）：指每秒钟的数据量，也称比特率、码率。

数字声音未压缩前：波形声音的码率（kb/s）= 取样频率 × 量化位数 × 声道数。

压缩编码以后：码率 = 压缩前的码率 / 压缩倍数。$kp$, section = '' where id = 23357;
update t_knowledge_point set title = $kp$声音压缩编码与流媒体技术$kp$, content = $kp$杜比数字 AC-3（Dolby Digital AC-3）：美国杜比公司开发的多声道全频带声音编码系统，其环绕立体声系统由 5 个全频带声道加一个超低音声道组成。6 个声道的信息在制作和还原过程中全部数字化，信息损失很少，细节丰富，具有真正的立体声效果，广泛用于数字电视、DVD 和家庭影院。

音（视）频媒体的传输要求：高带宽、连续实时传输、平稳传输并克服突发问题。

传输音（视）频媒体的方式：
- 先下载后播放：需要等待较长时间，并有较大的存储需求。
- 边下载边播放（流式传输）：不需要下载完整个文件，只需几秒或十数秒的启动延时即可播放。

流媒体技术：允许在窄带网上让用户一边下载一边收看（听）音视频连续媒体的技术。使用流式传输技术的音视频媒体称为流媒体。其优点：等待时间大大缩短、减少了对缓冲容量的需求、降低了对网络带宽的要求。

声音流媒体产品：RealNetworks 公司的 RA（RealAudio）、微软公司的 WMA（Windows Media Audio）、苹果公司的 QuickTime。

波形声音的文件格式：
- .wav：用于 PC。
- .pcm：使用 PCM 编码的声音文件。
- .voc：声霸卡使用的音频文件格式。
- .mp2：MPEG Layer I、II。
- .mp3：MPEG Layer III。
- .rm、.ra：RealNetworks 的流式声音文件。
- .wma：微软公司的流式声音文件。
- .aif：苹果机的音频交换文件格式。

数字语音的压缩编码：语音由空气通过声道引起声门振动产生，带宽只有 300～3400Hz。压缩方法包括：
- 波形编码：码率较高（64kb/s、32kb/s），语音质量高，算法简单、易实现；应用于固定电话通信系统、多媒体文档。
- 参数编码（模型编码）：码率很低，声音质量较差；应用于保密通信。
- 混合编码：中度码率（4.8～16kb/s），压缩比较高，语音质量较好；应用于移动通信、IP 电话。$kp$, section = '' where id = 23378;
update t_knowledge_point set title = $kp$音频编辑软件界面组成$kp$, content = $kp$音频编辑软件界面包含左右声道波形显示、时间刻度、播放标尺、淡入淡出控制及数字音频参数显示等。界面中显示的参数示例：取样频率 22.05kHz、8 位量化、立体声。$kp$, section = '' where id = 23379;
update t_knowledge_point set title = $kp$声卡的主要功能$kp$, content = $kp$声卡的主要功能：音频的获取与编码、音频的重建与播放、MIDI 消息的输入、MIDI 音乐的合成。

工作流程：声音输入后经取样、量化送入 DSP 处理；DSP 输出的数据经 D/A 转换、重建与滤波后送入混音器（mixer），再输出声音。音乐合成器通过 DMA 接口与 PC 总线交换数据，并通过 MIDI 接口接收 MIDI 消息。$kp$, section = '' where id = 23396;
update t_knowledge_point set title = $kp$声音的重建与播放$kp$, content = $kp$声音播放是计算机输出声音的过程。声音重建（reconstruction）把声音从数字形式转换成模拟信号形式，步骤为：

1. 解码：把压缩编码的数字音频恢复为压缩编码前的状态。
2. 数模转换：把声音样本从数字量转换为模拟量。
3. 插值处理：把时间上离散的一组样本转换成在时间上连续的模拟音频信号。

最后将模拟声音信号经过处理和放大送到扬声器发出声音。$kp$, section = '' where id = 23399;
update t_knowledge_point set title = $kp$声音重建与音箱$kp$, content = $kp$声音的重建由声卡完成，声卡输出的声音需送到音箱去发音。

音箱分类：
- 普通音箱：接收的是重建后的模拟声音信号。
- 数字音箱：可直接接收声卡输出的数字声音信号，避免信号在传输中发生畸变和受到干扰，音响效果更加突出。$kp$, section = '' where id = 23400;
update t_knowledge_point set title = $kp$声音编辑软件的界面$kp$, content = $kp$声音编辑软件的界面主要包括：左声道信号波形、右声道信号波形、时间刻度、播放标尺、淡入与淡出标记，以及数字声音的参数显示。$kp$, section = '' where id = 23401;
update t_knowledge_point set title = $kp$声音数据量与码率计算$kp$, content = $kp$数码率（bit rate）：指每秒钟的数据量，也称比特率、码率。

未压缩时：波形声音的码率（kb/s）= 取样频率（kHz）× 量化位数（bit）× 声道数。
压缩编码以后：码率 = 压缩前的码率 / 压缩倍数。

语音信号的取样频率通常在 8kHz，音乐信号的取样频率通常在 40kHz 以上。

练习：
1. 未压缩的波形声音码率为 64kb/s，取样频率为 8kHz，量化位数为 8 位，其声道数是多少？
2. 在某声音的数字化过程中，使用 44.1kHz 的取样频率、16 位量化位数，采集四声道声音一分钟所需的存储空间约为多少？
A. 165.375MB　B. 21.168MB　C. 20.672MB　D. 10.584MB$kp$, section = '' where id = 23402;
update t_knowledge_point set title = $kp$数字音频的数据压缩$kp$, content = $kp$数据压缩的必要性：降低存储成本，提高在网络上的传输效率。

数据压缩的可能性：声音中包含大量冗余信息；人耳灵敏度有限，允许有一定失真而不易察觉。

数字音频压缩编码的方法：全频带声音采用国际标准 MPEG 和工业标准 Dolby AC-3。

所谓“MP3 音乐”，是采用 MPEG-1 层 3 编码的高质量数字音频，压缩比约为 10～12 倍，使一张普通 CD 光盘可存储约 100 首 MP3 歌曲，连续播放约 10 小时。

数字音频的文件类型及其应用：

| 音频格式 | 文件扩展名 | 编码类型 | 效果 | 主要应用 | 开发者 |
| --- | --- | --- | --- | --- | --- |
| WAV | .wav | 未压缩 | 声音达到 CD 品质 | 支持多种采样频率和量化位数，获得广泛支持 | 微软公司 |
| FLAC | .flac | 无损压缩 | 压缩比约 2:1 | 高品质数字音乐 | Xiph.Org 基金会 |
| APE | .ape | 无损压缩 | 压缩比约 2:1 | 高品质数字音乐 | Matthew T. Ashland |
| M4A | .m4a | 无损压缩 | 压缩比约 2:1 | QuickTime、iTunes、iPod、Real Player | 苹果公司 |
| MP3 | .mp3 | 有损压缩 | MPEG-1 音频层 3，压缩比 8:1～12:1 | 因特网、MP3 音乐 | ISO |
| WMA | .wma | 有损压缩 | 压缩比高于 MP3，使用数字版权保护 | 因特网、音乐 | 微软公司 |
| AC3 | .ac3 | 有损压缩 | 压缩比可调，支持 5.1、7.1 声道 | DVD、数字电视、家庭影院等 | 美国 Dolby 公司 |
| AAC | .aac | 有损压缩 | 压缩比可调，支持 5.1、7.1 声道 | DVD、数字电视、家庭影院等 | ISO MPEG-2/MPEG-4 |$kp$, section = '' where id = 23426;
update t_knowledge_point set title = $kp$数字音频的文件类型及其应用$kp$, content = $kp$| 音频格式 | 文件扩展名 | 编码类型 | 效果 | 主要应用 | 开发者 |
| --- | --- | --- | --- | --- | --- |
| WAV | .wav | 未压缩 | 声音达到 CD 品质 | 支持多种采样频率和量化位数，获得广泛支持 | 微软公司 |
| FLAC | .flac | 无损压缩 | 压缩比约 2:1 | 高品质数字音乐 | Xiph.Org 基金会 |
| APE | .ape | 无损压缩 | 压缩比约 2:1 | 高品质数字音乐 | Matthew T. Ashland |
| M4A | .m4a | 无损压缩 | 压缩比约 2:1 | QuickTime、iTunes、iPod、Real Player | 苹果公司 |
| MP3 | .mp3 | 有损压缩 | MPEG-1 音频层 3，压缩比 8:1～12:1 | 因特网、MP3 音乐 | ISO |
| WMA | .wma | 有损压缩 | 压缩比高于 MP3，使用数字版权保护 | 因特网、音乐 | 微软公司 |
| AC3 | .ac3 | 有损压缩 | 压缩比可调，支持 5.1、7.1 声道 | DVD、数字电视、家庭影院等 | 美国 Dolby 公司 |
| AAC | .aac | 有损压缩 | 压缩比可调，支持 5.1、7.1 声道 | DVD、数字电视、家庭影院等 | ISO MPEG-2/MPEG-4 |$kp$, section = '' where id = 23428;
update t_knowledge_point set title = $kp$数字音频的获取设备$kp$, content = $kp$音频的联机获取设备是声卡：模拟音频经麦克风（microphone）转换为电信号，再由声卡（sound card）进行取样、量化和编码，形成数字音频。

音频的离线获取设备包括手机、数码录音笔等。$kp$, section = '' where id = 23430;
update t_knowledge_point set title = $kp$数字音频的表示及其参数$kp$, content = $kp$数字音频是使用二进制表示的一种串行比特流，其数据按时间顺序进行组织。

数字音频的主要参数：
- 取样频率：语音的取样频率低，一般为 8～16kHz；全频带声音（如音乐）取样频率高，一般为 44.1～48kHz。
- 量化位数：通常为 8 位、12 位或 16 位。
- 声道数目：单声道为 1，双声道为 2。
- 码率（比特率）：每秒钟的数据量。

未经压缩的数字音频最常用的文件扩展名为 .wav。$kp$, section = '' where id = 23431;
update t_knowledge_point set title = $kp$数字音频码率的计算$kp$, content = $kp$未压缩时数字音频的码率计算公式：码率 = 取样频率 × 量化位数 × 声道数（单位：bit/s）。

示例：

| 声音类型 | 信号带宽（Hz） | 取样频率（kHz） | 量化位数（bit） | 声道数 | 未压缩时的码率 |
| --- | --- | --- | --- | --- | --- |
| 数字语音 | 300～3400 | 8 | 8 | 1 | 64kb/s |
| CD 立体声 | 20～20000 | 44.1 | 16 | 2 | 1411.2kb/s |

压缩编码之后：压缩后的码率 = 未压缩时的码率 / 压缩比。

例：CD 立体声音乐压缩为 MP3 后，若压缩比为 12，则码率约为 1411.2 / 12 ≈ 118kb/s。$kp$, section = '' where id = 23432;
update t_knowledge_point set title = $kp$音频的重建与播放$kp$, content = $kp$计算机输出声音分为两步：声音的重建和声音的播放。$kp$, section = '' where id = 23464;
update t_knowledge_point set title = $kp$杜比数字 AC-3$kp$, content = $kp$杜比数字 AC-3（Dolby Digital AC-3）是美国杜比公司开发的多声道全频带声音编码系统。其环绕立体声系统由 5 个全频带声道加一个超低音声道组成，6 个声道的信息在制作和还原过程中全部数字化，信息损失很少，细节丰富，具有真正的立体声效果，广泛用于数字电视、DVD 和家庭影院。$kp$, section = '' where id = 23676;
update t_knowledge_point set title = $kp$具有杜比环绕声的声卡通道数$kp$, content = $kp$具有杜比环绕声的声卡通道数是（　）。

A. 1.0　B. 2.0　C. 2.1　D. 5.1$kp$, section = '' where id = 24643;
update t_knowledge_point set title = $kp$数码录音笔按键标识（残片）$kp$, content = $kp$该条目为数码录音笔机身按键标识的 OCR 残片，仅可辨识 REC/STOP、MODE/PAUSE、FILE/REPEAT、ERASE 等标识，无法还原完整说明。$kp$, section = '' where id = 25168;
update t_knowledge_point set title = $kp$数字音频的压缩编码与文件格式$kp$, content = $kp$数字音频的特点：属于连续媒体，数据量大，对存储和传输要求高。

数字音频文件格式的主要类型：
- WAV：未压缩，微软公司，CD 品质。
- 无损压缩：FLAC、M4A、APE。
- 有损压缩：MP3（MPEG-1 层 3 算法）、WMA、AC3、AAC。

有损压缩格式中，AC3 与 AAC 均支持 5.1/7.1 声道，压缩比可调节。

数字音频压缩编码方法：
- 全频带音频：
  - MPEG-1：层 1（两个声道）用于数字盒式录音带；层 2 用于 VCD、DVD、DAB 的伴音；层 3 用于 Internet 和 MP3。
  - MPEG-2：用于 DVD 光盘视频伴音、数字卫星电视、数字有线电视。
  - MPEG-4 AAC：有损压缩，压缩比可调节，支持 5.1/7.1 声道。
- 数字语音：固定电话采用 PCM（.pcm/.wav）和 ADPCM（.wav）编码；移动电话采用 AMR（.amr）编码，如微信语音。
- 计算机合成语音（TTS）：计算机模仿人朗读文字。

补充：WAV 文件可用于解说，MIDI 文件可用作背景音乐；MIDI 记录的是乐谱，也属于音频文件；媒体播放器播放 MIDI 音乐时，必须通过声卡上的音乐合成器生成声音。$kp$, section = '' where id = 25274;
update t_knowledge_point set title = $kp$音频联机获取设备（声卡）$kp$, content = $kp$音频的联机获取流程：模拟音频经麦克风（microphone）转换为电信号，再送入声卡（sound card）进行取样、量化和编码，输出数字音频。$kp$, section = '' where id = 25997;
update t_knowledge_point set title = $kp$声音的重建过程$kp$, content = $kp$声音的重建是把音频信号从数字形式转换成模拟信号形式，由声卡完成。流程为：数字音频→解码→数模转换→插值→重建的模拟音频信号。

- 解码：把压缩编码的数字音频恢复为压缩编码前的状态。
- 数模转换：把声音样本从数字量转换为模拟量。
- 插值：把时间上离散的一组样本转换成在时间上连续的模拟音频信号。$kp$, section = '' where id = 25998;
update t_knowledge_point set title = $kp$声音的编码$kp$, content = $kp$对音频信号取样并量化成二进制，实际上就是对音频信号进行编码。用不同的取样频率和不同的量化位数记录声音，单位时间内所需的存储空间不同。

波形声音的主要参数包括取样频率、量化位数、声道数、压缩编码方案和数码率等。未压缩前，波形声音的码率计算公式为：波形声音的码率 = 取样频率 × 量化位数 × 声道数 / 8（单位为字节/秒）。波形声音的码率一般比较大，因此必须对转换后的数据进行压缩。$kp$, section = '' where id = 26802;
update t_knowledge_point set title = $kp$波形声音的数据率计算$kp$, content = $kp$如果取样频率为 8kHz、样本精度为 8 位，则数据率为：8bit × 8kHz = 64.0kb/s。

如果使用双声道，则要对两个通道上的声音同时取样和量化，数据量是单声道数字化的两倍，即：8bit × 8kHz × 2（声道数）× 60（秒）/ 8（bit/Byte）= 960kB。$kp$, section = '' where id = 26803;
update t_knowledge_point set title = $kp$数字音频文件大小的计算$kp$, content = $kp$数字音频文件大小的计算公式：数据量（Byte）= 采样频率（Hz）×（采样位数/8）× 声道数 × 时间（s）。

例：采样频率为 44.1kHz，分辨率为 16 位，立体声，录音时间为 10s，则数据量 = 44100Hz ×（16/8）× 2 × 10s = 1764KByte，再按需要换算单位。$kp$, section = '' where id = 26804;
update t_knowledge_point set title = $kp$录音机$kp$, content = $kp$录音机用于录制和剪辑音频，可以实时地将用户通过音频输入接口输入的信息录制保存，也可以将一个音频媒体中某一段的内容剪辑保存下来。$kp$, section = '' where id = 27025;
update t_knowledge_point set title = $kp$全频带声音$kp$, content = $kp$全频带声音（如音乐声、风雨声、汽车声等）的带宽可覆盖人耳可听的全部频率范围，约为 20Hz～20kHz。$kp$, section = '' where id = 27515;
update t_knowledge_point set title = $kp$声音的重建与播放$kp$, content = $kp$声音的重建与播放过程：解码 → 数模转换（D/A 转换）→ 插值。$kp$, section = '' where id = 27517;
update t_knowledge_point set title = $kp$声卡的分类与功能$kp$, content = $kp$声卡分为集成声卡和独立声卡，目前以集成声卡为主。声卡的功能包括音频信号的获取与数字化、音频信号的重建与播放、MIDI 声音的合成与播放。$kp$, section = '' where id = 27518;
update t_knowledge_point set title = $kp$声卡的功能$kp$, content = $kp$声卡的功能：音频信号的获取与数字化、音频处理、语音处理、声音的输入与输出、MIDI 声音的合成与播放。$kp$, section = '' where id = 27519;
update t_knowledge_point set title = $kp$数字音频的主要参数$kp$, content = $kp$数字音频的参数包括取样频率（kHz）、量化位数（bit）和声道数。波形声音的码率 = 取样频率 × 量化位数 × 声道数。$kp$, section = '' where id = 27520;
update t_knowledge_point set title = $kp$数字音频压缩的原因$kp$, content = $kp$数字音频压缩的原因：降低存储成本，提高网络传输效率。$kp$, section = '' where id = 27522;
update t_knowledge_point set title = $kp$常见的音频文件格式$kp$, content = $kp$日常使用的音频文件：

① MP3：即 MPEG-1 第 3 层，属于有损压缩，并不存在 MPEG-3 编码。

② WAV：未压缩的数字音频。

③ FLAC、APE、M4A：采用无损压缩，数据量比 WAV 大约少一半，音质保持不变。

④ WMA：有损压缩，压缩比高于 MP3，音质与 MP3 相当，并增加了数字版权保护措施，防止未经授权的下载和拷贝。$kp$, section = '' where id = 27523;
update t_knowledge_point set title = $kp$麦克风的作用$kp$, content = $kp$麦克风将声波转换为电信号，再交由数字信号处理器（DSP）处理。$kp$, section = '' where id = 27752;
update t_knowledge_point set title = $kp$麦克风的作用$kp$, content = $kp$麦克风将声波转换为电信号，再交由数字信号处理器（DSP）处理。$kp$, section = '' where id = 27753;
update t_knowledge_point set title = $kp$MP3 音乐$kp$, content = $kp$MP3 音乐是一种采用 MPEG-1 第 3 层编码的高质量数字声音，并不存在 MPEG-3 标准。$kp$, section = '' where id = 28345;
update t_knowledge_point set title = $kp$波形声音的码率$kp$, content = $kp$音箱一般通过声卡与主机相连接。波形声音的码率 = 取样频率 × 量化位数 × 声道数。$kp$, section = '' where id = 29534;
update t_knowledge_point set title = $kp$CD 唱片的数据量$kp$, content = $kp$CD 唱片 1 小时的数据量 = 176.4KB/s × 60 × 60 = 635040KB ≈ 635MB。$kp$, section = '' where id = 29535;
update t_knowledge_point set title = $kp$MPEG 音频编码的码率与应用$kp$, content = $kp$通过专门的软件可以将 WAV 文件转换成 MP3 格式。

| 名称 | 压缩后的码率（每个声道） | 声道数目 | 主要应用 |
| --- | --- | --- | --- |
| MPEG-1 audio 层 1 | 384 kbps | 2 | 数字盒式录音带 |
| MPEG-1 audio 层 2 | 192～256 kbps | 2 | DAB、VCD |
| MPEG-1 audio 层 3 | 112～128 kbps（压缩 10～12 倍） | 2 | Internet、MP3 音乐 |
| MPEG-2 audio | 与 MPEG-1 层 1、层 2、层 3 相同 | 5.1、7.1 | 同 MPEG-1 |
| Dolby AC-3 | 64 kbps | 5.1、7.1 | DVD、DTV、家庭影院 |$kp$, section = '' where id = 29536;
update t_knowledge_point set title = $kp$语音压缩编码的应用场景$kp$, content = $kp$在移动通信和 IP 电话中，由于信道的带宽较窄，需要采用更有效的语音压缩编码方法。$kp$, section = '' where id = 29537;
update t_knowledge_point set title = $kp$声卡的核心部件$kp$, content = $kp$声卡的核心部件是数字信号处理器（DSP），负责完成数字声音的编码、解码及声音编辑。$kp$, section = '' where id = 29564;
update t_knowledge_point set title = $kp$声音压缩的性能指标与相关基础知识$kp$, content = $kp$压缩声音的性能指标：压缩倍数、声音失真、算法复杂度、编码器和解码器的成本。

MPEG-1 音频：第 1 层用于数字盒式磁带，第 2 层用于 VCD，第 3 层即 MP3。

MPEG-2 音频：用于数字电视、DVD 和环绕立体声。

MPEG-4 音频：面向交互式多媒体应用和流媒体。

AC-3（杜比数字）：用于数字电视、DVD 和家庭影院。

计算机合成声音：MIDI 记录演奏指令而非波形采样，与 WAV 不同。MIDI 音乐合成需要声卡（音源）、乐谱（MIDI 文件）和播放三个要素，可以合成各种乐器声音，但不能模仿语音；其音质较差、文件小、便于修改，可与 WAV 音乐一起播放。

数字视频：采用 YUV 色彩空间表示，传送到电视机后转换为 RGB 模式。

进制转换：二进制 B 使用 0、1；八进制 O 使用 0～7；十进制 D 使用 0～9；十六进制 H 使用 0～9、A～F。

635.217 = 6.35217×10²，其中 2 为阶码，6.35217 为尾数，阶码决定小数点的位置。

按位权展开：6×10² + 3×10¹ + 5×10⁰ + 2×10⁻¹ + 1×10⁻² + 7×10⁻³。

数值 = 数码 × 基数^(位数−1)，基数^(位数−1) 称为该位的位权。$kp$, section = '' where id = 29580;
update t_knowledge_point set title = $kp$数字波形声音的参数与数据量计算$kp$, content = $kp$数字波形声音使用二进制位表示，文件扩展名通常为 wav。

取样频率：一般为 44.1kHz。

量化位数：位数越高，声音保真度越好。

声道数：声道越多，层次感越明显。

波形声音的码率（kb/s）= 取样频率 × 量化位数 × 声道数。

例题：采样频率为 44.1kHz、量化精度为 16 位、持续时间为 2 分钟的双声道声音，未压缩时数据量为 20.67MB。

解析：(44.1×16×2×120)/8/1024 ≈ 20.67MB。$kp$, section = '' where id = 29638;
update t_knowledge_point set title = $kp$MP3 音乐的特点$kp$, content = $kp$MPEG-1 第 3 层即 MP3 音乐。MP3 采用有损压缩，压缩倍数约为 10～12 倍，优点是文件容量小，便于在小容量存储器中保存。$kp$, section = '' where id = 29639;
update t_knowledge_point set title = $kp$MP3 采用的压缩标准$kp$, content = $kp$MP3 是目前流行的一种音频文件格式，它采用 MPEG-1 第 3 层标准对数字音频进行有损压缩编码，并不存在 MPEG-3 标准。$kp$, section = '' where id = 29656;
update t_knowledge_point set title = $kp$声音重建的原理与过程$kp$, content = $kp$声音重建的原理是将数字声音转换为模拟声音信号，其工作过程是解码、D/A 转换和插值处理。$kp$, section = '' where id = 29657;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22160,22161,22162,23165,23179,23207,23226,23232,23239,23247,23248,23266,23301,23302,23324,23328,23357,23378,23379,23396,23399,23400,23401,23402,23426,23428,23430,23431,23432,23464,23676,24643,25168,25274,25997,25998,26802,26803,26804,27025,27515,27517,27518,27519,27520,27522,27523,27752,27753,28345,29534,29535,29536,29537,29564,29580,29638,29639,29656,29657) and not deleted) <> 60 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
