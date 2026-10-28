-- 知识点 130 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_130
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_130 as
select * from t_knowledge_point where id in (23246,23280,23303,23317,23346,23347,23348,23360,23375,23459,23467,26186,26187,26805,27525,27526,27527,27528,27529,27530,28348,28409,29611,29641,32040);

update t_knowledge_point set title = $kp$音乐合成与 MIDI 的定义$kp$, content = $kp$MIDI（Musical Instrument Digital Interface，乐器数字接口）：计算机中描述乐谱的一种标准描述语言，规定了乐谱的数字表示方法（包括音符、定时、乐器等），以及演奏控制器、音源、计算机等相互连接时的通信规程。$kp$, section = '' where id = 23246;
update t_knowledge_point set title = $kp$图像数据压缩的可能性$kp$, content = $kp$图像数据压缩的可能性：数字图像中数据相关性很强、冗余度很大，因此对数字图像进行大幅度的数据压缩是完全可能的。此外，人眼的视觉有一定的局限性，只要压缩前后的失真限制在人眼允许的误差范围之内，也是允许的。$kp$, section = '' where id = 23280;
update t_knowledge_point set title = $kp$计算机合成声音：语音合成与音乐合成$kp$, content = $kp$## 语音合成

- 语音合成（Speech synthesis）：根据语言学和自然语言理解的知识，使计算机模仿人的发声，自动生成语音的过程。目前主要是按照文本（书面语言）进行语音合成，这一过程称为文语转换（Text-To-Speech，简称 TTS）。
- 文语转换过程：文本 → 文本分析 → 韵律处理 → 语音合成 → 合成语音。其中文本分析依据词典和发音规则，韵律处理依据韵律规则库，语音合成依据语音库。
- 语音库：存储大量预先录制的语音基元（单音、词组、短语或句子）波形，合成时读取语音基元的波形，进行拼接和韵律修饰，然后输出连续语音流。
- 对计算机合成语音的要求：发音清晰可懂、语气语调自然、说话人可选择、语速可变化等。
- 计算机合成语音的应用：股票交易、航班动态查询、电话报税等业务；有声 E-mail 服务；CAI 课件或游戏解说词的自动配音；文稿校对、语言学习、语音秘书、自动报警、残疾人服务等。

## 音乐合成

- 音乐由乐器演奏而成，基本单元是音符。音符的属性：音调（声波的基频）、音色（由声音的频谱决定，不同乐器音色不同）、音强（声音的强度）、旋律（乐曲中音符持续时间的变化）。
- 音源：也称音乐合成器（music synthesizer），能模仿许多乐器生成各种不同音色的音符，PC 机的声卡一般都带有音源。
- 声卡上的音源：
  - 调频合成器：一种受控的电子振荡器（波形发生器），能模拟生成许多乐器演奏的音符；特点是音色单调、效果较差。
  - 波表合成器：预先将每种乐器演奏的各个音符的波形数字化，组织成一张表（波表）存放在 ROM 中；播放时根据乐器类型、音符等参数访问 ROM，取出相应的波形数据，修饰成所要求的音强和时长后播放；特点是音色优美、效果好。
- MIDI（Musical Instrument Digital Interface）：计算机中描述乐谱的一种标准描述语言，规定了乐谱的数字表示方法（包括音符、定时、乐器等）以及演奏控制器、音源、计算机等相互连接时的通信规程。
- MIDI 规定：乐谱中的音符及其定时、速度、音色（乐器）等采用 MIDI 消息（MIDI message）描述；每个 MIDI 消息描述一个音乐事件（如开始演奏某个音符、结束演奏某个音符、选择音符的音色、改变演奏速度等）；一首乐曲所对应的全部 MIDI 消息组成一个 MIDI 文件；MIDI 文件扩展名为 .MID，它是计算机合成音乐的交换标准，也是商业音乐作品发行的标准。
- MIDI 音乐的制作与播放：可由 MIDI 键盘实时演奏，或通过音序器软件输入乐谱，生成 MIDI 文件；播放时媒体播放器读入 MIDI 文件，把 MIDI 消息发送给声卡上的音乐合成器，由合成器解释执行并合成出音乐。
- 音序器（sequencer）软件：配合 MIDI 演奏器（如 MIDI 键盘）使用；还可对 MIDI 文件进行修改和编辑、生成并打印乐谱、管理与检索 MIDI 文件、播放 MIDI 乐曲等。典型软件有 Cakewalk、Encore。
- 在 Windows 系统中可用媒体播放器播放 MIDI 文件：媒体播放器软件从磁盘读入 MID 文件，把其中的一个个 MIDI 消息发送给声卡上的音乐合成器，由合成器解释并执行消息所规定的操作，合成出各种音色的音符，通过扬声器播放出乐曲。
- 由 PC 机、声卡、MIDI 演奏器和音序器软件构成的个人电脑音乐系统改变了传统音乐制作方式：原来需要多人完成的工作现在一人即可完成；记录音乐的方式由乐谱变为 MIDI 文件；音乐作品由修改困难变为可任意编辑修改；提高了音乐表现的精确性，降低了对演奏技术的依赖，使音乐制作成为大众化、个人化的活动。
- MIDI 音乐与高保真的波形声音相比：缺点是音质较差、无法合成出所有各种不同的声音（例如语音）；优点是数据量很少（比 CD-DA 少 3 个数量级，比 MP3 少 2 个数量级）、易于编辑修改、可以与波形声音同时播放。$kp$, section = '' where id = 23303;
update t_knowledge_point set title = $kp$WAV 与 MIDI 的区别$kp$, content = $kp$WAV 声音可达到 CD 品质，支持多种采样频率和量化位数，获得广泛支持；但 WAV 是未压缩的，数据量较大。MIDI 文件只记录数字乐器的弹奏行为或乐谱指令，而非声音的实际波形，因此 MIDI 文件不能用于解说。$kp$, section = '' where id = 23317;
update t_knowledge_point set title = $kp$MIDI 的不足$kp$, content = $kp$- 只能合成音乐，不能合成歌曲和语音；
- 音质与硬件设备相关。$kp$, section = '' where id = 23346;
update t_knowledge_point set title = $kp$MIDI 的优点$kp$, content = $kp$- 数据量极小（比 CD-DA 少 3 个数量级，比 MP3 少 2 个数量级）；
- 易于制作和编辑修改；
- 可以与波形声音同时播放。$kp$, section = '' where id = 23347;
update t_knowledge_point set title = $kp$MIDI 音乐与高保真波形声音的比较$kp$, content = $kp$缺点：

- 音质方面较差；
- 无法合成出所有各种不同的声音（例如语音）。

优点：

- 数据量很少（比 CD-DA 少 3 个数量级，比 MP3 少 2 个数量级）；
- 易于编辑修改；
- 可以与波形声音同时播放。$kp$, section = '' where id = 23348;
update t_knowledge_point set title = $kp$计算机合成音乐的三要素$kp$, content = $kp$计算机合成音乐需要三个要素：乐器、乐谱和“演奏员”。播放过程为：MIDI 文件 → 媒体播放器 → MIDI 消息 → 音乐合成器 → 音乐。$kp$, section = '' where id = 23360;
update t_knowledge_point set title = $kp$计算机合成音频的两类$kp$, content = $kp$计算机合成音频就是计算机模仿人说话或演奏音乐，分为两类：

- 计算机合成话音（语音）：计算机模仿人把一段文字朗读出来，即把文字转换为说话声音（简称 TTS）。应用：有声查询、文稿校对、语言学习、语音秘书、自动报警、残疾人服务等。
- 计算机合成音乐（MIDI）：计算机模拟各种乐器发声并按照乐谱演奏音乐。应用：计算机作曲、配器等。$kp$, section = '' where id = 23375;
update t_knowledge_point set title = $kp$计算机合成音乐（MIDI）的播放原理$kp$, content = $kp$计算机合成音乐需要三个要素：乐器、乐谱和“演奏员”。播放 MIDI 音乐时，媒体播放器软件相当于“演奏员”，它先从磁盘读入 .MID 文件并解释其内容，再以 MIDI 消息的形式向声卡上的音乐合成器发出各种指令；音乐合成器能像电子琴一样模仿几十种不同的乐器发声，按照 MIDI 消息合成出不同音色和音调的音符，通过扬声器播放出音乐。$kp$, section = '' where id = 23459;
update t_knowledge_point set title = $kp$MIDI 的局限$kp$, content = $kp$- 只能合成音乐，不能合成歌曲和语音；
- 音质与硬件设备相关。$kp$, section = '' where id = 23467;
update t_knowledge_point set title = $kp$计算机合成话音（语音）$kp$, content = $kp$计算机模仿人把一段文字朗读出来，即把文字转换为说话声音（简称 TTS）。应用：有声查询、文稿校对、语言学习、语音秘书、自动报警、残疾人服务等。$kp$, section = '' where id = 26186;
update t_knowledge_point set title = $kp$计算机合成音乐（MIDI）$kp$, content = $kp$计算机模拟各种乐器发声并按照乐谱演奏音乐。应用：计算机作曲、配器等。$kp$, section = '' where id = 26187;
update t_knowledge_point set title = $kp$计算机合成声音的两类$kp$, content = $kp$计算机合成声音有两类：一类是计算机合成的语音，另一类是计算机合成的音乐。$kp$, section = '' where id = 26805;
update t_knowledge_point set title = $kp$MIDI 与 MIDI 音乐$kp$, content = $kp$MIDI 是乐谱的二进制编码表示方法，使用 MIDI 描述的音乐称为 MIDI 音乐。$kp$, section = '' where id = 27525;
update t_knowledge_point set title = $kp$MIDI 文件$kp$, content = $kp$MIDI 文件：保存演奏一首乐曲所对应的全部 MIDI 消息的文件。$kp$, section = '' where id = 27526;
update t_knowledge_point set title = $kp$MIDI 消息$kp$, content = $kp$MIDI 消息：播放器发给声卡上音乐合成器的指令，用于描述一个音乐事件。$kp$, section = '' where id = 27527;
update t_knowledge_point set title = $kp$MIDI 音乐音质较差但数据量很小$kp$, content = $kp$MIDI 音乐相对数字音频而言音质较差，但数据量很小。$kp$, section = '' where id = 27528;
update t_knowledge_point set title = $kp$MIDI 音乐数据量小且易于编辑$kp$, content = $kp$MIDI 音乐的数据量很小，易于编辑修改。$kp$, section = '' where id = 27529;
update t_knowledge_point set title = $kp$文语转换（TTS）$kp$, content = $kp$文语转换（TTS）让计算机模仿人将文字朗读出来。$kp$, section = '' where id = 27530;
update t_knowledge_point set title = $kp$文语转换（TTS）及其应用$kp$, content = $kp$① TTS 将文本转换成语音，朗读出来。
② 应用：股票交易、文稿校对、有声 E-mail。
③ Office 中的【读出】功能可以进行文语转换。
④ 智能手机支持 TTS。$kp$, section = '' where id = 28348;
update t_knowledge_point set title = $kp$MIDI 不能合成所有声音$kp$, content = $kp$MIDI 是计算机合成音乐的技术，只能合成出各种乐器音色的音符，不能合成出所有声音（如语音、歌曲）。$kp$, section = '' where id = 28409;
update t_knowledge_point set title = $kp$计算机合成音乐（MIDI 音乐）要点$kp$, content = $kp$① MIDI 是计算机中表示乐谱的音乐描述语言。
② 使用 MIDI 描述的音乐就是 MIDI 音乐，文件扩展名为 .MID 或 .MIDI。
③ MIDI 消息：播放器发给声卡的指令，描述一个音乐事件，是数字式电子乐器的乐谱指令。
④ MIDI 文件：保存演奏一首乐曲所对应的全部 MIDI 消息。
⑤ MIDI 不能合成出歌曲，只能合成音乐（乐曲）；WAV 适合解说，MIDI 适合做背景音乐。
⑥ MIDI 音乐是声卡中的音乐合成器演奏出来的，同一个 MIDI 文件，不同档次的声卡合成出的音质不同。$kp$, section = '' where id = 29611;
update t_knowledge_point set title = $kp$计算机合成声音的两类与 MIDI 的特点$kp$, content = $kp$计算机合成的声音有两类：计算机合成语音和计算机合成音乐。

合成音乐（MIDI）的要素是乐器、乐谱和“演奏员”，不能合成歌声。

优点：易于编辑修改，可以与波形声音同时播放，保存的是指令因而存储空间小，可以达到乐器无法演奏的效果。$kp$, section = '' where id = 29641;
update t_knowledge_point set title = $kp$计算机合成声音：MIDI 音乐与语音合成$kp$, content = $kp$计算机合成音乐（MIDI 音乐）：

① MIDI 是计算机中表示乐谱的音乐描述语言，用 MIDI 描述的音乐即 MIDI 音乐，文件扩展名为 .MID 或 .MIDI。
② MIDI 消息：播放器发给声卡的指令，描述一个音乐事件，是数字式电子乐器的乐谱指令。
③ MIDI 文件：保存演奏一首乐曲所对应的全部 MIDI 消息。
④ MIDI 音乐不能合成出歌曲，只能合成乐曲（音乐）；WAV 适合解说，MIDI 适合做背景音乐。
⑤ 同一个 MIDI 文件，由不同档次声卡中的音乐合成器合成，音质是不同的。

计算机合成语音：将文本转换成语音朗读出来，称为文语转换（TTS）。$kp$, section = '' where id = 32040;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (23246,23280,23303,23317,23346,23347,23348,23360,23375,23459,23467,26186,26187,26805,27525,27526,27527,27528,27529,27530,28348,28409,29611,29641,32040) and not deleted) <> 25 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
