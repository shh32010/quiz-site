-- 知识点 128 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_128
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_128 as
select * from t_knowledge_point where id in (23146,23176,23177,23230,23237,23279,23319,23361,23447,25273,26800,26801,27516,27521,27554,27751,28356,29562,29563,29565,29578,29608,29609,29610,29634,29635,29636,29642,29654);

update t_knowledge_point set title = $kp$声音数字化的主要参数$kp$, content = $kp$声音数字化的主要参数包括采样频率、量化位数和声道数。

- 采样频率：每秒钟抽取声波样本的次数。采样频率越高，音质越好，数据量越大
- 量化位数：每个采样点用多少位二进制数表示数据范围。量化位数越多，音质越好，数据量越大
- 声道数：使用声音通道的个数。立体声比单声道的表现力丰富，但数据量翻倍

常见示例：采样频率 11.025kHz，量化位数 8 位（256 个等级），单声道。$kp$, section = '' where id = 23146;
update t_knowledge_point set title = $kp$声音信号数字化的过程$kp$, content = $kp$声音信号的数字化包括取样、量化、编码三个步骤。

- 取样：为了不产生失真，按照取样定理，取样频率不应低于声音信号最高频率的两倍。因此语言的取样频率一般为 8kHz，音乐的取样频率应在 40kHz 以上。
- 量化：取样得到的每个样本的量化精度一般为 8 位、12 位或 16 位。量化精度越高，声音的保真度越好；量化精度越低，声音的保真度越差。
- 编码：经过取样和量化后的声音，还必须按照一定的要求进行编码，即对它进行数据压缩以减少数据量，并按某种格式将数据进行组织，以便于计算机存储、处理和在网络上传输。$kp$, section = '' where id = 23176;
update t_knowledge_point set title = $kp$声音信号的数字化$kp$, content = $kp$声音信号的数字化是指将模拟声音信号转换成数字编码形式，以便于计算机进行处理的过程。$kp$, section = '' where id = 23177;
update t_knowledge_point set title = $kp$声音信号的数字化$kp$, content = $kp$声音信号的数字化是指将模拟声音信号转换成数字编码形式，以便于计算机进行处理的过程。$kp$, section = '' where id = 23230;
update t_knowledge_point set title = $kp$模拟声音信号转为数字形式处理的优点$kp$, content = $kp$以数字形式存储的声音重放性能好，复制时没有失真。

数字声音的可编辑性强，易于进行效果处理。

数字声音能进行数据压缩，传输时抗干扰能力强。

数字声音容易与其他媒体相互结合（集成）。

数字声音为自动提取“元数据”和实现基于内容的检索创造了条件。$kp$, section = '' where id = 23237;
update t_knowledge_point set title = $kp$数字声音的类型$kp$, content = $kp$波形声音（取样声音）：语音（人的说话声音）带宽 300～3400Hz；全频带声音（现实世界中的各种声音）带宽 20Hz～20kHz。

计算机合成声音：合成语音；合成音乐（MIDI）。$kp$, section = '' where id = 23279;
update t_knowledge_point set title = $kp$声音数字化的三个步骤$kp$, content = $kp$模拟音频通过取样、量化、编码得到数字音频。

- 取样：把时间上连续的信号转换成时间上离散的信号，得到时间上离散的一组样本
- 量化：把每个样本从模拟量转换为数字量（用 8 位或 16 位整数表示），得到一组二进制整数
- 编码：将所有样本的二进制代码组织在一起，并进行数据压缩，得到数字音频$kp$, section = '' where id = 23319;
update t_knowledge_point set title = $kp$两种音频$kp$, content = $kp$话音或语音（speech）：专指人的说话声音，带宽仅为 300～3400Hz。

全频带声音（如音乐声、风雨声、汽车声等）：带宽可达到 20Hz～20kHz。$kp$, section = '' where id = 23361;
update t_knowledge_point set title = $kp$声音数字化的步骤$kp$, content = $kp$声音数字化的步骤为取样、量化、编码。

1. 取样（sampling）：把时间上连续的信号转换成时间上离散的信号，得到时间上离散的一组样本
2. 量化（quantization）：把每个样本从模拟量转换为数字量，一般用 8 位或 16 位整数表示，得到一组二进制整数
3. 编码（encoding）：将所有样本的二进制代码组织在一起，并进行数据压缩，形成数字音频$kp$, section = '' where id = 23447;
update t_knowledge_point set title = $kp$数字音频的获取与数字化$kp$, content = $kp$声音：人耳能听到的声音称为音频信号，简称音频，是模拟信号。声音的数字化就是把模拟信号转换成二进制编码。

数字化过程：

1. 取样：按一定的时间间隔取样，取样频率不应低于音频信号最高频率的两倍
2. 量化：取样得到的每个样本一般用 8 位、12 位或 16 位二进制整数表示（量化精度）。量化精度越高，声音保真度越好，音质越好，噪声越小
3. 编码：把量化后的样本数据组织成二进制代码，并进行压缩

数字音频的特点：复制和重放没有失真；抗干扰能力强；可编辑性强，易于特效处理；可进行数据压缩；易与文字、图像结合组成多媒体。

声源：麦克风（话筒）输入；线路输入，来自音响设备或 CD 唱机的输出。

数字音频的获取设备——声卡：以数字信号处理器 DSP 为核心，功能由 CPU 协助完成。分为独立声卡和集成声卡，集成声卡中软声卡只含 CODEC 芯片，硬声卡含 CODEC 芯片和一块音频主处理芯片。声卡负责音频信号的获取与重建，控制完成声音的输入和输出，完成音频信号的数字化，以及 MIDI 声音的输入、合成与播放。

声音的重建（数字音频的输出）：把音频从数字形式转换为模拟信号，是音频数字化的逆过程，步骤为解码→数模转换（由软件和 DSP 协调完成）→插值。声卡输出的波形信号需送到音响播放，普通音响接收的是重建后的模拟音频信号，数字音响直接接收数字音频信号并自己完成声音重建。

数字音频的码率＝取样频率（kHz）×量化位数（bit）×声道数，单位为 kb/s；声音数据量（B）＝取样频率（kHz）×10³×量化位数÷8×声道数×时间（s）。$kp$, section = '' where id = 25273;
update t_knowledge_point set title = $kp$模拟声音信号的数字化$kp$, content = $kp$当输入和输出端的信号为模拟信号时，由于系统传输和存储的是数字信号，需要对模拟信号进行数字化处理。$kp$, section = '' where id = 26800;
update t_knowledge_point set title = $kp$量化$kp$, content = $kp$取样的离散音频要转化为计算机能够表示的数据范围，这个过程称为量化。量化的等级取决于量化精度，也就是用多少位二进制数来表示一个音频数据，一般有 8 位、12 位或 16 位。量化精度越高，声音的保真度越高。

以 8 位为例：若一台计算机能够接收 8 位二进制数据，则相当于能够接受 256 个十进制的数，即有 256 个电平数，用这些数来代表模拟信号的电平可以有 256 种。但采样后某一时刻信号的电平不一定和 256 个电平中的某一个相等，此时只能用最接近的数字代码表示取样信号电平。$kp$, section = '' where id = 26801;
update t_knowledge_point set title = $kp$音频信号的获取$kp$, content = $kp$音频信号的获取过程为取样、量化、编码。$kp$, section = '' where id = 27516;
update t_knowledge_point set title = $kp$采样频率的要求$kp$, content = $kp$采样频率不低于声音信号最高频率的两倍。语音取样频率一般为 8kHz，全频带取样频率一般在 40kHz 以上。$kp$, section = '' where id = 27521;
update t_knowledge_point set title = $kp$声音的连续性与量化精度$kp$, content = $kp$声音的连续性是指声音在播放的时候具有时间参数，时间越长，数据量越大，因此声音在数字化的时候必须编码，也就是压缩。

量化精度越高，声音的质量越好，也就是保真度越高。$kp$, section = '' where id = 27554;
update t_knowledge_point set title = $kp$声波到数字音频的转换$kp$, content = $kp$麦克风将声波转换为电信号，声卡再对电信号进行数字化。$kp$, section = '' where id = 27751;
update t_knowledge_point set title = $kp$采样频率的要求$kp$, content = $kp$采样频率不低于声音信号最高频率的两倍。语音取样频率一般为 8kHz，全频带取样频率一般在 40kHz 以上。$kp$, section = '' where id = 28356;
update t_knowledge_point set title = $kp$全频带声音与语音的频率范围$kp$, content = $kp$全频带声音的频率范围是 20Hz 至 20000Hz；人的语音（speech）的频率范围是 300Hz 至 3400Hz。$kp$, section = '' where id = 29562;
update t_knowledge_point set title = $kp$声音信号数字化的过程$kp$, content = $kp$声音信号数字化的过程是：取样（取样频率不应低于声音信号最高频率的两倍）、量化、编码。$kp$, section = '' where id = 29563;
update t_knowledge_point set title = $kp$声音的重建过程$kp$, content = $kp$声音的重建（即声音的播放）是声音信号数字化的逆过程，分为 3 步：解码、数模（D/A）转换、插值处理。$kp$, section = '' where id = 29565;
update t_knowledge_point set title = $kp$声音的获取：取样、量化与编码$kp$, content = $kp$取样：采样频率语言类为 8kHz，音乐类为 40kHz；采样频率一般是声音原频率的两倍，采样频率越高，声音保真度越好。

量化：一般用 8 位、16 位等，量化精度越高，声音保真度越好。

编码：对数字信号进行压缩。$kp$, section = '' where id = 29578;
update t_knowledge_point set title = $kp$语音（话音）的带宽$kp$, content = $kp$话音或语音（speech）专指人的说话声音，带宽仅为 300～3400Hz。$kp$, section = '' where id = 29608;
update t_knowledge_point set title = $kp$全频带声音的带宽$kp$, content = $kp$全频带声音（如音乐声、风雨声、汽车声等）的带宽可达到 20Hz～20kHz，即人耳可听到的声音范围。$kp$, section = '' where id = 29609;
update t_knowledge_point set title = $kp$采样频率的要求$kp$, content = $kp$采样频率不低于声音信号最高频率的两倍。语音取样频率一般为 8kHz，全频带取样频率一般在 40kHz 以上。$kp$, section = '' where id = 29610;
update t_knowledge_point set title = $kp$人耳可听声音、语音与全频带声音的频率范围$kp$, content = $kp$人耳可听到的声音：20Hz～20kHz。

语音：人说话的声音，300～3400Hz。

全频带声音：一切大自然的声音，20Hz～20kHz。高保真要求采样频率高于声音最高频率的 2 倍。$kp$, section = '' where id = 29634;
update t_knowledge_point set title = $kp$声音信号数字化的顺序$kp$, content = $kp$声音信号的数字化顺序为取样→量化→编码。量化就是把模拟量转换为数字量，编码就是用二进制表示。$kp$, section = '' where id = 29635;
update t_knowledge_point set title = $kp$麦克风与声卡的功能$kp$, content = $kp$麦克风的功能：把声波转换成电信号。

声卡的功能：取样、量化、编码，以 DSP 数字信号处理器为核心。$kp$, section = '' where id = 29636;
update t_knowledge_point set title = $kp$数字音频采集过程与视频压缩标准$kp$, content = $kp$数字音频采集过程：滤波→取样→量化→编码。

Y 表示亮度信号，UV 表示色度信号。视频数据可压缩的依据：信息冗余、相邻内容有高度的连贯性、允许有一定失真。

- MPEG-1：适用于 VCD，质量一般（普通单面 650MB）
- MPEG-2：用于 DVD（单面 4.7GB）和高清电视，画质好
- MPEG-4：用于移动多媒体如手机等，画质差，文件数据小

iPhone 手机采用的数字视频压缩标准是 MPEG-4 AVC。$kp$, section = '' where id = 29642;
update t_knowledge_point set title = $kp$量化精度与声音保真度$kp$, content = $kp$声音信号的量化精度一般为 8 位、12 位或 16 位。量化精度越高，声音的保真度越好、量化噪声越小；量化精度越低，声音的保真度越差、噪声越大。$kp$, section = '' where id = 29654;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (23146,23176,23177,23230,23237,23279,23319,23361,23447,25273,26800,26801,27516,27521,27554,27751,28356,29562,29563,29565,29578,29608,29609,29610,29634,29635,29636,29642,29654) and not deleted) <> 29 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
