# 44 组严格重复题逐组分析（2026-11-18）

> 分析方式：只读查询生产库 `quiz`（2026-11-18），未修改任何数据。
> 本文所有 SQL 均为**草案**，需确认后执行；执行前请先备份并在事务中 dry-run。

## 一、范围与口径

- 范围：`scratch/dupes44.csv` 的 **44 组 / 92 行**，均为未删除的严格重复（`trim(stem)`、`option_json`、`question_type` 一致）。
- 92 行均无做题记录（`practice_answer`）、错题（`wrong_question`）、收藏（`favorite_question`）、反馈（`feedback`）、AI 解析缓存（`ai_explain_cache`）。
- 仅 4 行有会话题目引用：
  - `334627`：会话 268（item 110）、281（item 72）；
  - `334669`：会话 268（item 123）；
  - `353153`：已删除会话 176（item 78）；
  - `368679`：已删除会话 171（item 5，保留组，不动）。
- 12 行有试卷引用：2011/2012/2013/2017/2018 真题回放（paper 264–268、272、273）。
- 1 组含金标：`577255c4ee`，金标题为 `353154`；触发器 `protect_gold_question` 禁止改/删金标内容。
- 结论：**12 组建议保留**（理论/实操两套课程各有独立章节和知识点），**4 组需先修正或裁定**，**27 组可直接合并**，**1 组暂缓**。

## 二、处置汇总

| 处置 | 组数 | 行数 | 预计软删 | 预计存活 | 说明 |
|---|---:|---:|---:|---:|---|
| 可直接合并 | 27 | 57 | 29 | 28 | 含 `a773179b4e` 每课程各留 1 份 |
| 先修/裁定后合并 | 4 | 9 | 5 | 4 | `18f5`、`95f9`、`a849`、`e36c` |
| 保留 | 12 | 24 | 0 | 24 | 理论/实操跨课程，KP 基本不相交 |
| 暂缓 | 1 | 2 | 0 | 2 | `4842` 选项 OCR 损坏 |
| **合计** | **44** | **92** | **34** | **58** | 全部完成后活跃题约 44,419 → 44,385 |

## 三、数据核对（CSV 与当前库的差异）

CSV 生成后库内发生过答案统一，以下 3 组以“当前答案”列为准：

| 组 | CSV 中的答案 | 当前库答案 |
|---|---|---|
| `0cbae9bb3f` | 364311=`书签`，368475=`锚点` | 两行均为 `锚点` |
| `81b1c2b4fd` | `高速缓冲存储器（或cache）` / `Cache` | 两行均为 `高速缓冲存储器（Cache）` |
| `d26a39bf11` | `…文语转换、文本压缩、TTS 等` / `…文本朗读、文本压缩等` | 两行均为 `字数统计、语法检查、文语转换（TTS）、文本压缩等` |

另有 4 组 CSV 的 `stem` 列在导出时被截断（`377356`、`363956`、`366703`、`361144`），但库内 stem 完整且组内完全相等。已按完整 stem + type + option_json 重新核对，未发现 CSV 之外的额外活跃重复行。

## 四、逐组结论

### A. 可直接合并（27 组 / 57 行 → 28 存活 + 29 软删）

| 组 | 行 | 当前答案 | 章节差异 | 关联/风险 | 结论 | 保留 | 删除 |
|---|---:|---|---|---|---|---|---|
| `0ad376eaa9` | 2 | 自定义放映 | 115 多媒体&gt;文本 / 65 软件&gt;基本概念 | KP 相同；无引用 | 合并 | 356288 | 356546 |
| `0cbae9bb3f` | 2 | 锚点 | 115 多媒体&gt;文本 / 106 互联网&gt;服务 | KP 各 3 条、完全不相交 | 合并 | 368475 | 364311 |
| `151850dbd9` | 3 | 资源池化 | 同 193 云计算&gt;基本概念 | KP 相同；2 份带二维码图 | 合并（留无图版） | 353446 | 354112、354129 |
| `1ace3e826f` | 2 | 排序 | 138 信息和信息技术 / 159 关系数据库 | KP 相同；试卷 265 | 合并 | 389342 | 389242 |
| `1c5ca414a2` | 2 | NULL | 同 274 MySQL&gt;建表 | 无 KP；373120 带二维码图 | 合并（留无图版） | 379735 | 373120 |
| `508debf79e` | 2 | SATA | 同 59 硬件&gt;外存 | KP 相同；334628 带二维码图 | 合并（留无图版） | 334670 | 334628 |
| `577255c4ee` | 2 | 互联网金融 | 189 移动互联网&gt;应用领域 / 190 子章 | KP 相同；353154 为金标 | 合并（仅删非金标） | 353154 | 353149 |
| `5c00a4e4b5` | 2 | 占位符 | 115 多媒体&gt;文本 / 65 软件&gt;基本概念 | KP 相同 | 合并 | 338442 | 356611 |
| `66eaad1703` | 2 | C | 119 多媒体&gt;文本处理 / 67 软件&gt;分类 | KP 相同 | 合并 | 358287 | 338199 |
| `81b1c2b4fd` | 2 | 高速缓冲存储器（Cache） | 42 硬件&gt;内存概述 / 60 硬件&gt;外存 | KP 相同；答案已在库内统一 | 合并 | 362087 | 367149 |
| `82922a46e7` | 2 | A,B,C | 92 网络基础 / 6 网络根章 | KP 相同；389519 隔离；试卷 268 | 合并 | 389419 | 389519 |
| `8c3f64a32f` | 2 | 5 | 267 C&gt;函数调用 / 260 C&gt;数组 | KP 相同；同为实操 | 合并 | 377356 | 377696 |
| `96c7de0ee3` | 2 | #include；main | 239 C&gt;程序构成 / 240 C&gt;头文件 | KP 相同；同为实操 | 合并 | 379326 | 366703 |
| `a773179b4e` | 4 | C类 | 104 理论 IP 地址 / 321 实操 IP 配置 | 理论 KP 3 条、实操 KP 1 条 | 每课程各留 1 | 364285、377424 | 364417、383645 |
| `a85a494edd` | 2 | 像素 | 124 多媒体&gt;数字图像 / 56 硬件&gt;输出设备 | KP 各 2 条、不相交 | 合并 | 369321 | 337159 |
| `aca5a36ca7` | 2 | 并行 | 71 软件&gt;OS 功能 / 41 硬件&gt;输入输出/CPU | KP 相同 | 合并 | 367089 | 337153 |
| `b58fdd1f08` | 2 | 数据报 | 104 互联网&gt;IP 地址 / 101 广域网&gt;分组交换 | KP 相同 | 合并 | 368424 | 364323 |
| `ba6d56f8d6` | 2 | 软件 | 146 信息系统 / 147 含义及特点（父子） | KP 相同 | 合并 | 347406 | 362648 |
| `d26a39bf11` | 2 | 文本处理功能（已统一） | 119 文本处理 / 115 多媒体&gt;文本 | KP 3 条 vs 2 条、不相交 | 合并 | 345588 | 369492 |
| `d26bad2421` | 2 | 客户/服务器 | 94 网络服务分类 / 106 互联网服务 | KP 相同 | 合并 | 364298 | 364431 |
| `d39627b123` | 2 | C/S | 94 网络服务分类 / 106 互联网服务 | KP 5 条 vs 2 条 | 合并 | 341998 | 345295 |
| `d7289d6321` | 2 | 文件扩展名 | 146 信息系统 / 138 信息和信息技术 | KP 相同 | 合并 | 347697 | 347764 |
| `e3a237614a` | 2 | net start mysql5 | 同 273 MySQL&gt;配置 | KP 相同；373048 带二维码/机构 logo | 合并（留无图版） | 373049 | 373048 |
| `ed6ad5e26f` | 2 | com | 106 互联网服务 / 103 互联网发展/TCP-IP | KP 相同 | 合并 | 364306 | 364439 |
| `f8acac6991` | 2 | 身份鉴别 | 107 信息安全 / 222 AI&gt;计算机视觉 | KP 共 1 条、各带 1 条独有 | 合并 | 383674 | 356653 |
| `fbc99ffe35` | 2 | 1FFFFFFFH | 同 42 硬件&gt;内存 | KP 相同；334627 带二维码图；会话 268 同时含两题 | 合并（留无图版） | 334669 | 334627 |
| `febdf0bc52` | 2 | CCD | 41 硬件&gt;输入设备 / 122 多媒体&gt;图像获取 | KP 4 条 vs 3 条 | 合并 | 366983 | 382781 |

补充说明（survivor 选择理由）：

- `0cbae9bb3f` 选 `368475`（ch115 多媒体 > 文本与文本处理）：题干明确是“超文本中的超链”，归多媒体文本比归互联网服务更贴切。
- `1ace3e826f` 选 `389342`（ch138 信息和信息技术）：`389242` 的 ch159 是“关系数据库系统”，与 Excel 分类汇总明显不符。
- `a85a494edd` 选 `369321`（ch56 常用输出设备）：CRT 显示器像素属于输出设备；`337159` 的 ch124 数字图像是误挂。
- `aca5a36ca7` 选 `367089`（ch41 输入输出设备/CPU）：I/O 与 CPU 并行属于硬件基础；`337153` 的 ch71 操作系统基本功能是误挂。
- `b58fdd1f08` 选 `368424`（ch101 分组交换与路由）：IP 数据报属于网络层/分组交换，不是 IP 地址分类。
- `f8acac6991` 选 `383674`（ch107 网络信息安全）：两行 KP 均为“身份认证/鉴别”，`356653` 的 ch222 计算机视觉是误挂。
- `febdf0bc52` 选 `366983`（ch41 输入设备）：扫描仪/CCD 属于输入设备，且 366983 的 KP 更全；`382781` 的 ch122 图像获取也可，但不是首选。
- `a773179b4e` 是唯一保留两份的合并组：理论（`364285`，ch104）与实操（`377424`，ch321）各留 1 份，KP 也按课程保留。
- 其余组按“金标 → 无二维码图 → `ok` → `good` → id 较小”的规则选择；带图版本的图经抽查为二维码或机构 logo（见 5.4），不作为优先项。`577255c4ee` 受金标保护，只能保留 `353154`、删除 `353149`。

### B. 先修正/裁定后合并（4 组 / 9 行 → 4 存活 + 5 软删）

| 组 | 行 | 当前答案 | 章节差异 | 关联/风险 | 结论 | 保留 | 删除 |
|---|---:|---|---|---|---|---|---|
| `18f5c2c173` | 2 | B | 73 程序设计语言 / 5 软件根章 | 选项 C 混入 D 文本；解析答非所问；试卷 272 | 先修选项/解析再合并 | 389934 | 389856 |
| `95f926cc46` | 2 | B→C | 同 1 硬件根章 | 答案与解析矛盾；两份隔离；试卷 267/268 | 改答案 C 后合并 | 389371 | 389471 |
| `a849365d0f` | 3 | 微基站 / 微基站/波束赋形 | 同 182 5G | 答案冲突；353148 qc=error；353153 有会话 | 裁定“微基站”后合并 | 353137 | 353148、353153 |
| `e36c2af5a4` | 2 | A→A,B,D | 同 1 硬件根章 | 答案与解析矛盾；题型应为多选；试卷 267/268 | 改多选 ABD/题型 2 后合并 | 389416 | 389516 |

逐组说明：

- **`18f5c2c173`（389934 / 389856）**：两行 `option_json` 相同，C 选项尾部混入了重复的 D 选项文本（“。D、机器语言和泛维语言都属于低俗语言”），`analysis` 讲的是数据结构，与本题无关。答案 B 本身正确。建议先修 `389934` 的 C 选项和解析，再软删隔离的 `389856`，并把 2017 卷 paper 272 item 31 迁挂到 `389934`。
- **`95f926cc46`（389371 / 389471）**：11 位无符号整数最大值为 `2^11-1=2047`，应选 C；两行当前均为 B，且 `analysis` 已写“本题选 C”，属于答案列错误。两份均在 2013 理论三/二年级卷第 26 题、section 2 单项选择题。建议改为 C 后合并；是否解除隔离另行确认。
- **`a849365d0f`（353137 / 353148 / 353153）**：`353137` 答案为“微基站”，解析正确；另两行为“微基站/波束赋形”，其中 `353148` 的解析误写成“移动互联网金融”，`qc_grade=error`，`353153` 的解析只说微基站。两份“微基站/波束赋形”来自同一套理论卷及其副本，不是独立证据。`353148` 的 `/qimg` 图经查看是二维码，不是题图，不能作为保留理由。建议规范答案取“微基站”，保留无图的 `353137`，软删 `353148`、`353153`；`353153` 的会话引用在已删除会话 176，按普通改挂处理即可。若最终裁定“微基站/波束赋形”，应保留无图的 `353153` 并把解析补成“毫米波覆盖/微基站”，不要保留 `353148`。
- **`e36c2af5a4`（389416 / 389516）**：两行答案 A、解析却写“选 ABD”，且两份所在试卷 section 均为 **多项选择题**。应改 `question_type=2`、`correct='A,B,D'`。历史备注中“多选→单选”的修正基于错误的单字母答案，应回退。修正后合并；是否解除隔离另行确认。
- **`48429e16b7`** 不在此表，见 C 类“暂缓”。

### C. 保留 / 暂缓（13 组 / 26 行）

| 组 | 行 | 当前答案 | 章节差异 | 关联/风险 | 结论 | 保留 | 删除 |
|---|---:|---|---|---|---|---|---|
| `19d0d9a27f` | 2 | A | 98 理论无线局域网 / 308 实操无线局域网 | KP 完全不相交 | 保留 | — | — |
| `4ad2844615` | 2 | 路由器 | 105 理论网络设备 / 306 实操有线局域网 | KP 不相交 | 保留 | — | — |
| `7753d3fed0` | 2 | 交换机 | 105 理论 / 305 实操 | KP 仅 1 条共享 | 保留 | — | — |
| `889e9798a5` | 2 | 自然连接 | 163 理论关系运算 / 279 实操 SQL | KP 不相交 | 保留 | — | — |
| `92047f65da` | 2 | SELECT … | 277 实操 SQL / 164 理论 SQL | 实操无 KP，理论 2 条 | 保留 | — | — |
| `942b9b80ac` | 2 | 光缆 | 97 理论有线局域网 / 303 实操有线局域网 | KP 1 条 vs 3 条 | 保留 | — | — |
| `a87d264d74` | 2 | 传输介质 | 97 理论 / 303 实操 | KP 3 条 vs 1 条 | 保留 | — | — |
| `baa215a6a1` | 2 | D | 161 理论 E-R / 271 实操 E-R | KP 不相交 | 保留 | — | — |
| `c3ee74cd23` | 2 | C | 161 理论 E-R / 271 实操 E-R | KP 不相交 | 保留 | — | — |
| `d26e407aa2` | 2 | 路由器 | 105 理论 / 303 实操 | KP 不相交 | 保留 | — | — |
| `db64d77606` | 2 | 成绩&lt;60 / 分数&lt;60 | 164 理论 SQL / 277 实操 SQL | 答案冲突；384540 解析与答案不自洽；实操 KP 疑误挂 | 保留（待核列名） | — | — |
| `e030fda51b` | 2 | CREATE DATABASE、CREATE TABLE、PRIMARY KEY | 164 理论 SQL / 274 实操建表 | KP 不相交 | 保留 | — | — |
| `48429e16b7` | 2 | B vs C | 同 6 网络根章 | 选项 OCR 损坏；两份隔离；试卷 264/267 | 暂缓 | — | — |

逐组说明：

- 前 12 组全部是 **理论题库（subject 4）与实操题库（subject 5）的并行副本**。两组课程树不同、章节不同、KP 链接基本不相交（见“关联/风险”列）。合并会让其中一套课程少一道题，并把另一套课程的 KP 链到本题上，破坏课程隔离。建议保留，并把 ID 对加入后续去重扫描白名单。
- **`db64d77606`（364208 / 384540）** 是保留组中唯一的答案冲突：题干只说“成绩表”，没有给出表结构；理论卷答案用 `成绩<60`，实操卷答案用 `分数<60`，无法判定谁对。且 `384540` 的解析写 `成绩<60`、答案写 `分数<60`，自身不一致。建议按各自教材的表结构核验后分别修正，不要跨课程合并。
- **`48429e16b7`（389064 / 389393）** 暂缓：两份都在 2011/2013 真题回放中且均已隔离；选项文本严重 OCR 损坏（B/C 语义不完整），现有数据无法判定 B/C。应先回源复原题干和四个选项，再决定答案与是否合并。

## 五、关键风险与迁移清单

### 5.1 金标

- `577255c4ee`：`353154` 是金标，`protect_gold_question` 会拦截对它的 `UPDATE`/`DELETE`。脚本只软删非金标 `353149`，不要更新 `353154` 的内容字段。
- 执行前金标数 199；执行后应保持不变。

### 5.2 会话

- `fbc99ffe35`：保留无图的 `334669`，删除带二维码图的 `334627`。`334627` 在 **会话 268**（item 110）和会话 281（item 72）；`334669` 在会话 268（item 123）。改挂后会话 268 出现两行 `334669`，删除 `item_order` 较大的 123；会话 268 是 OPEN、0 作答，建议同步把 `question_count` 从 39 改为 38。
- `a849365d0f`：`353153` 在已删除会话 176（0 作答）；改挂 `353137` 或删除该行均可，脚本按改挂处理。
- `368679` 在已删除会话 171，但该组保留，不动。

### 5.3 试卷

| 组 | 原题 → 存活题 | 试卷 / item |
|---|---|---|
| `1ace3e826f` | 389242 → 389342 | paper 265 / item 97 |
| `18f5c2c173` | 389856 → 389934 | paper 272 / item 31 |
| `82922a46e7` | 389519 → 389419 | paper 268 / item 74 |
| `95f926cc46` | 389471 → 389371 | paper 268 / item 26 |
| `e36c2af5a4` | 389516 → 389416 | paper 268 / item 71 |

迁移只改 `question_id`，不改 `paper_id`、`item_order`、`section_no`、`section_name`；试卷题号和顺序不变。

### 5.4 图像

- 5 个“图像不一致”组（`151850dbd9`、`1c5ca414a2`、`508debf79e`、`fbc99ffe35`、`e3a237614a`）的带图版本在题干末尾追加了 `/qimg/...` 图片。抽查 `353148`、`354112`、`334627` 的图均为二维码；`373048` 是“复航网校”logo 与“预测”残片。这些图不是题目示意图，因此应保留**无图版本**，不要按旧规则优先保留带图版本。
- 对应地，`151850dbd9` 留 `353446`、`1c5ca414a2` 留 `379735`、`508debf79e` 留 `334670`、`fbc99ffe35` 留 `334669`、`e3a237614a` 留 `373049`。
- `353148`（`a849365d0f` 的候选）图也是二维码，不能作为保留理由；该组保留无图的 `353137`。
- 合并后这 5 个二维码/logo 图不再挂在活跃题上；`t_text_content` 不删除，图片文件保留，便于回滚。

### 5.5 知识点

- 合并脚本按“survivor 现有链接优先 + 被删行链接并集”重建；直接合并批预计 `t_question_kp` 从 106,864 降到 **106,807**（-57）；修正批再 -9，最终约 **106,798**。
- 部分 KP 已 `deleted=true`（如 21895、22122、23252、22402、22904、25478、25776、25782、25796、25948、26027、29723、30348、32565）；脚本按原样保留，不新增清理。
- 合并后检查 `(question_id, kp_id)` 无重复。

### 5.6 其他

- `t_question_notes_archive`：每个被删行都有历史备注；按既有惯例不迁移、不删除，保留作审计。
- `t_text_content`：不删除；被删行的内容会变成孤儿，但本次 92 行的 `info_text_content_id` 没有共享，保留便于回滚。
- `practice_answer` / `wrong_question` / `favorite_question` / `feedback` / `ai_explain_cache` 本批均为 0 行，无需迁移。
- `cat_l1/l2/l3`、`cat_alt` 不迁移，survivor 保留自身分类。`0cbae9bb3f`（368475）和 `f8acac6991`（383674）的 cat 是 `belongs_to_other`，虽然章节更贴题；若 cat 用于筛选/统计，合并前需先补分类或改选另一行。
- 执行后需清 Redis 的题目/章节/随机抽题缓存（或等 TTL）；本次不涉及收藏/错题缓存。
- 所有操作只软删（`deleted=true`），不物理删除。
- 被保留题自身的 OCR 残留（如 `334669` 题干开头的“回转”、`373049` 的“##”）不在本次去重范围，建议另开清理批次处理，避免与删除/迁移混在一起。

## 六、SQL 草案（不执行）

### 6.0 执行原则

1. 先执行 6.1 建立辅助表和 6.2 备份。
2. 6.3 先在事务中 dry-run（最后 `ROLLBACK`），断言通过后改 `COMMIT`。
3. 6.4 的修正语句仅在人工确认后执行；执行完再跑 6.5 的 `after_fix` 合并。
4. 6.6 断言全部通过后再清缓存、刷新前端。
5. 本文所有 SQL 均未执行。

### 6.1 辅助表（92 行 ID + 合并映射）

```sql
-- 00_helper_20261118.sql
CREATE TABLE IF NOT EXISTS dupe44_ids_20261118 (
  qid integer PRIMARY KEY
);

INSERT INTO dupe44_ids_20261118 (qid) VALUES
(334627),(334628),(334669),(334670),(337153),(337159),(338199),(338442),
(341865),(341998),(342168),(344352),(344354),(345295),(345588),(347406),
(347622),(347624),(347697),(347764),(353137),(353148),(353149),(353153),
(353154),(353446),(354112),(354129),(356288),(356496),(356546),(356611),
(356653),(358287),(361144),(362087),(362648),(363956),(364208),(364213),
(364285),(364298),(364306),(364311),(364323),(364325),(364375),(364417),
(364431),(364439),(366319),(366703),(366983),(367089),(367149),(368397),
(368424),(368475),(368622),(368646),(368648),(368679),(369321),(369492),
(370396),(370399),(373048),(373049),(373120),(375854),(377356),(377424),
(377696),(379326),(379735),(380076),(382781),(383645),(383674),(384540),
(389064),(389242),(389342),(389371),(389393),(389416),(389419),(389471),
(389516),(389519),(389856),(389934)
ON CONFLICT DO NOTHING;

CREATE TABLE IF NOT EXISTS dupe44_map_20261118 (
  dup_id integer PRIMARY KEY,
  survivor_id integer NOT NULL,
  batch text NOT NULL CHECK (batch IN ('direct','after_fix')),
  grp text NOT NULL
);

INSERT INTO dupe44_map_20261118 (dup_id, survivor_id, batch, grp) VALUES
-- direct：27 组 / 29 软删
(356546,356288,'direct','0ad376eaa9'),
(364311,368475,'direct','0cbae9bb3f'),
(354112,353446,'direct','151850dbd9'),
(354129,353446,'direct','151850dbd9'),
(389242,389342,'direct','1ace3e826f'),
(373120,379735,'direct','1c5ca414a2'),
(334628,334670,'direct','508debf79e'),
(353149,353154,'direct','577255c4ee'),
(356611,338442,'direct','5c00a4e4b5'),
(338199,358287,'direct','66eaad1703'),
(367149,362087,'direct','81b1c2b4fd'),
(389519,389419,'direct','82922a46e7'),
(377696,377356,'direct','8c3f64a32f'),
(366703,379326,'direct','96c7de0ee3'),
(364417,364285,'direct','a773179b4e'),
(383645,377424,'direct','a773179b4e'),
(337159,369321,'direct','a85a494edd'),
(337153,367089,'direct','aca5a36ca7'),
(364323,368424,'direct','b58fdd1f08'),
(362648,347406,'direct','ba6d56f8d6'),
(369492,345588,'direct','d26a39bf11'),
(364431,364298,'direct','d26bad2421'),
(345295,341998,'direct','d39627b123'),
(347764,347697,'direct','d7289d6321'),
(373048,373049,'direct','e3a237614a'),
(364439,364306,'direct','ed6ad5e26f'),
(334627,334669,'direct','fbc99ffe35'),
(382781,366983,'direct','febdf0bc52'),
(356653,383674,'direct','f8acac6991'),
-- after_fix：4 组 / 5 软删
(389856,389934,'after_fix','18f5c2c173'),
(389471,389371,'after_fix','95f926cc46'),
(353148,353137,'after_fix','a849365d0f'),
(353153,353137,'after_fix','a849365d0f'),
(389516,389416,'after_fix','e36c2af5a4')
ON CONFLICT DO NOTHING;
```

### 6.2 备份

> 备份表只建一次；若要重跑，请先把旧备份表改名或确认其内容，不要直接复用 `IF NOT EXISTS` 的空表。

```sql
-- 01_backup_20261118.sql
BEGIN;

CREATE TABLE IF NOT EXISTS t_question_backup_20261118_dupes AS
SELECT q.* FROM t_question q WHERE q.id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS t_question_kp_backup_20261118_dupes AS
SELECT k.* FROM t_question_kp k WHERE k.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS practice_answer_backup_20261118_dupes AS
SELECT a.* FROM practice_answer a WHERE a.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS wrong_question_backup_20261118_dupes AS
SELECT w.* FROM wrong_question w WHERE w.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS favorite_question_backup_20261118_dupes AS
SELECT f.* FROM favorite_question f WHERE f.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS session_question_backup_20261118_dupes AS
SELECT s.* FROM session_question s WHERE s.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS exam_paper_question_backup_20261118_dupes AS
SELECT e.* FROM exam_paper_question e WHERE e.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS feedback_backup_20261118_dupes AS
SELECT f.* FROM feedback f WHERE f.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS ai_explain_cache_backup_20261118_dupes AS
SELECT c.* FROM ai_explain_cache c WHERE c.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS t_question_notes_archive_backup_20261118_dupes AS
SELECT n.* FROM t_question_notes_archive n WHERE n.question_id IN (SELECT qid FROM dupe44_ids_20261118);

CREATE TABLE IF NOT EXISTS dupes44_baseline_20261118 AS
SELECT now() AS captured_at,
       (SELECT count(*) FROM t_question WHERE NOT deleted) AS active_q,
       (SELECT count(*) FROM t_question WHERE NOT deleted AND is_golden) AS golden_q,
       (SELECT count(*) FROM t_question_kp) AS kp_links;

DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question_backup_20261118_dupes;
  IF n <> 92 THEN RAISE EXCEPTION 't_question 备份应为 92，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question_backup_20261118_dupes WHERE is_golden;
  IF n <> 1 THEN RAISE EXCEPTION '备份金标应为 1，实际 %', n; END IF;
END $$;

COMMIT;
```

### 6.3 直接合并批（27 组 / 29 软删）

```sql
-- 02_merge_direct_20261118.sql
-- 先 dry-run：保留最后的 ROLLBACK；断言通过后改为 COMMIT。
BEGIN;

CREATE TEMP TABLE dupe_map ON COMMIT DROP AS
SELECT dup_id, survivor_id FROM dupe44_map_20261118 WHERE batch = 'direct';
CREATE INDEX ON dupe_map (survivor_id);

CREATE TEMP TABLE affected_sessions ON COMMIT DROP AS
SELECT DISTINCT pa.session_id
FROM practice_answer pa
JOIN dupe_map m ON pa.question_id = m.dup_id
WHERE pa.deleted_at IS NULL;

CREATE TEMP TABLE affected_sessions_sq ON COMMIT DROP AS
SELECT DISTINCT sq.session_id
FROM session_question sq
JOIN dupe_map m ON sq.question_id = m.dup_id;

CREATE TEMP TABLE affected_papers ON COMMIT DROP AS
SELECT DISTINCT ep.paper_id
FROM exam_paper_question ep
JOIN dupe_map m ON ep.question_id = m.dup_id;

-- 1) 知识点链接：survivor 现有链接优先，重复链接去重后重建
CREATE TEMP TABLE kp_target ON COMMIT DROP AS
SELECT DISTINCT ON (question_id, kp_id) question_id, kp_id, match_source, confidence
FROM (
  SELECT k.question_id, k.kp_id, k.match_source, k.confidence, 0 AS pri
  FROM t_question_kp k
  JOIN (SELECT DISTINCT survivor_id FROM dupe_map) s ON s.survivor_id = k.question_id
  UNION ALL
  SELECT m.survivor_id, k.kp_id, k.match_source, k.confidence, 1 AS pri
  FROM t_question_kp k
  JOIN dupe_map m ON k.question_id = m.dup_id
) x
ORDER BY question_id, kp_id, pri, match_source NULLS LAST, confidence NULLS LAST;

DELETE FROM t_question_kp
WHERE question_id IN (SELECT survivor_id FROM dupe_map UNION SELECT dup_id FROM dupe_map);

WITH base AS MATERIALIZED (SELECT coalesce(max(id),0) AS max_id FROM t_question_kp)
INSERT INTO t_question_kp (id, question_id, kp_id, match_source, confidence)
SELECT (base.max_id + row_number() OVER (ORDER BY t.question_id, t.kp_id))::int,
       t.question_id, t.kp_id, t.match_source, t.confidence
FROM kp_target t CROSS JOIN base;

-- 2) 做题记录：同会话已有 survivor 则软删重复，否则改挂
UPDATE practice_answer pa
SET deleted_at = now()
FROM dupe_map m
WHERE pa.question_id = m.dup_id AND pa.deleted_at IS NULL
  AND EXISTS (SELECT 1 FROM practice_answer s
              WHERE s.session_id = pa.session_id AND s.question_id = m.survivor_id);

UPDATE practice_answer pa
SET question_id = m.survivor_id
FROM dupe_map m
WHERE pa.question_id = m.dup_id AND pa.deleted_at IS NULL;

-- 3) 错题本：同用户已有 survivor 则合并计数并软删重复，否则改挂
UPDATE wrong_question w
SET wrong_count = w.wrong_count + s.wrong_count,
    last_wrong_at = greatest(w.last_wrong_at, s.last_wrong_at),
    next_review_at = least(w.next_review_at, s.next_review_at),
    streak_correct = greatest(w.streak_correct, s.streak_correct),
    resolved = w.resolved AND s.resolved
FROM dupe_map m, wrong_question s
WHERE w.question_id = m.dup_id AND w.deleted_at IS NULL
  AND s.user_id = w.user_id AND s.question_id = m.survivor_id;

UPDATE wrong_question w
SET deleted_at = now()
FROM dupe_map m
WHERE w.question_id = m.dup_id AND w.deleted_at IS NULL
  AND EXISTS (SELECT 1 FROM wrong_question s
              WHERE s.user_id = w.user_id AND s.question_id = m.survivor_id);

UPDATE wrong_question w
SET question_id = m.survivor_id
FROM dupe_map m
WHERE w.question_id = m.dup_id AND w.deleted_at IS NULL;

-- 4) 收藏
DELETE FROM favorite_question f
USING dupe_map m
WHERE f.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM favorite_question s
              WHERE s.user_id = f.user_id AND s.question_id = m.survivor_id);

UPDATE favorite_question f
SET question_id = m.survivor_id
FROM dupe_map m
WHERE f.question_id = m.dup_id;

-- 5) 会话题目：先改挂，再删同会话重复
DELETE FROM session_question sq
USING dupe_map m
WHERE sq.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM session_question s
              WHERE s.session_id = sq.session_id AND s.question_id = m.survivor_id);

UPDATE session_question sq
SET question_id = m.survivor_id
FROM dupe_map m
WHERE sq.question_id = m.dup_id;

DELETE FROM session_question sq
USING session_question s
WHERE sq.session_id = s.session_id
  AND sq.question_id = s.question_id
  AND sq.item_order > s.item_order
  AND sq.session_id IN (SELECT session_id FROM affected_sessions_sq);

-- 6) 试卷题目
DELETE FROM exam_paper_question ep
USING dupe_map m
WHERE ep.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM exam_paper_question s
              WHERE s.paper_id = ep.paper_id AND s.question_id = m.survivor_id);

UPDATE exam_paper_question ep
SET question_id = m.survivor_id
FROM dupe_map m
WHERE ep.question_id = m.dup_id;

DELETE FROM exam_paper_question ep
USING exam_paper_question s
WHERE ep.paper_id = s.paper_id
  AND ep.question_id = s.question_id
  AND ep.item_order > s.item_order
  AND ep.paper_id IN (SELECT paper_id FROM affected_papers);

-- 7) 反馈
UPDATE feedback f
SET question_id = m.survivor_id
FROM dupe_map m
WHERE f.question_id = m.dup_id;

-- 8) AI 解析缓存
DELETE FROM ai_explain_cache c
USING dupe_map m
WHERE c.question_id = m.dup_id
  AND EXISTS (SELECT 1 FROM ai_explain_cache s
              WHERE s.question_id = m.survivor_id AND s.mode = c.mode);

UPDATE ai_explain_cache c
SET question_id = m.survivor_id
FROM dupe_map m
WHERE c.question_id = m.dup_id;

-- 9) 软删重复题（不物理删除；金标保护）
UPDATE t_question q
SET deleted = true
FROM dupe_map m
WHERE q.id = m.dup_id
  AND NOT q.is_golden;

-- 10) 会话计数与已交卷会话分数
UPDATE practice_session s
SET question_count = (SELECT count(*) FROM session_question sq WHERE sq.session_id = s.id)
WHERE s.id IN (SELECT session_id FROM affected_sessions_sq);

UPDATE practice_session s
SET score = coalesce((SELECT sum(a.score_got) FROM practice_answer a
                      WHERE a.session_id = s.id AND a.deleted_at IS NULL), 0),
    correct_count = coalesce((SELECT count(*) FROM practice_answer a
                              WHERE a.session_id = s.id AND a.deleted_at IS NULL AND a.is_correct), 0)
WHERE s.id IN (SELECT session_id FROM affected_sessions)
  AND s.finished_at IS NOT NULL;

-- 11) 事务内断言
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question q
  JOIN dupe_map m ON q.id = m.dup_id
  WHERE NOT q.deleted;
  IF n <> 0 THEN RAISE EXCEPTION '仍有未软删的重复题 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q
  JOIN (SELECT DISTINCT survivor_id FROM dupe_map) s ON q.id = s.survivor_id
  WHERE q.deleted;
  IF n <> 0 THEN RAISE EXCEPTION 'survivor 被软删 %', n; END IF;

  SELECT count(*) INTO n FROM t_question_kp k
  JOIN dupe_map m ON k.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION 'dup KP 残留 %', n; END IF;

  SELECT count(*) INTO n FROM (
    SELECT question_id, kp_id FROM t_question_kp GROUP BY 1,2 HAVING count(*) > 1
  ) x;
  IF n <> 0 THEN RAISE EXCEPTION 'KP 重复 %', n; END IF;

  SELECT count(*) INTO n FROM session_question sq JOIN dupe_map m ON sq.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION '会话引用残留 %', n; END IF;

  SELECT count(*) INTO n FROM exam_paper_question ep JOIN dupe_map m ON ep.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION '试卷引用残留 %', n; END IF;
END $$;

ROLLBACK;
-- 断言通过后：COMMIT;
```

### 6.4 内容修正（仅在人工确认后执行）

```sql
-- 03_fix_content_20261118.sql
-- 先 dry-run，确认后再 COMMIT。4842 不在此脚本内。
-- audit_json 保留历史审计，不重写；如需同步可另行更新。
BEGIN;

-- 18f5c2c173：389934 的 C 选项混入 D 文本，解析答非所问
UPDATE t_question
SET option_json = $json${"A": "高级语言程序有解释与编译两种执行方式", "B": "用于辅助编写汇编语言程序的编辑软件称为汇编程序", "C": "机器语言与计算机硬件关系密切,用它编写的程序可移植性较差。", "D": "机器语言和汇编语言都属于低级语言"}$json$,
    analysis = $txt$汇编程序（汇编器）是把汇编语言源程序翻译成机器语言目标程序的翻译程序，不是用于辅助编写汇编语言程序的编辑软件，故 B 叙述错误。$txt$,
    qc_grade = 'good'
WHERE id = 389934;

-- 95f926cc46：11 位无符号整数最大值为 2^11-1=2047，选 C
UPDATE t_question
SET correct = 'C',
    answer_check = 'match',
    qc_grade = 'good',
    quality_flags = array_remove(quality_flags, 'answer_conflict')
WHERE id IN (389371, 389471);

-- e36c2af5a4：试卷 section 为多项选择题，答案应为 A,B,D
UPDATE t_question
SET question_type = 2,
    correct = 'A,B,D',
    answer_check = 'match',
    qc_grade = 'good',
    quality_flags = array_remove(quality_flags, 'answer_conflict')
WHERE id IN (389416, 389516);

-- a849365d0f：353137 已是“微基站”，无需改答案；直接走 after_fix 合并。
-- 353148 的 /qimg 图是二维码，不是题图，不要以“带图”为由保留。
-- 备选（不推荐）：若裁定“微基站/波束赋形”，保留无图的 353153 并把解析补成
-- “毫米波覆盖/微基站”，不要保留 353148（解析错误且图为二维码）。

-- 可选，需另行确认：解除隔离
-- UPDATE t_question SET review_status = 'ok' WHERE id IN (389371, 389416);

COMMIT;
```

### 6.5 修正后合并批（4 组 / 5 软删）

复用 6.3 的脚本，只改一处：

```sql
-- 04_merge_after_fix_20261118.sql
-- 前置：6.4 已提交；本脚本先 dry-run，断言通过后 COMMIT。
CREATE TEMP TABLE dupe_map ON COMMIT DROP AS
SELECT dup_id, survivor_id FROM dupe44_map_20261118 WHERE batch = 'after_fix';
-- 其余步骤与 6.3 完全相同（知识点并集、会话/试卷迁移、软删、断言）。
```

注意：`a849365d0f` 的两条映射共用 survivor `353137`；知识点并集会在 `kp_target` 中自动去重。

### 6.6 执行后断言

```sql
-- 05_assert_20261118.sql
DO $$
DECLARE
  n int;
  base_active int;
  base_golden int;
BEGIN
  SELECT active_q, golden_q INTO base_active, base_golden
  FROM dupes44_baseline_20261118;

  SELECT count(*) INTO n FROM t_question q
  JOIN dupe44_map_20261118 m ON q.id = m.dup_id
  WHERE NOT q.deleted;
  IF n <> 0 THEN RAISE EXCEPTION '仍有未软删的重复题 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q
  JOIN (SELECT DISTINCT survivor_id FROM dupe44_map_20261118) s ON q.id = s.survivor_id
  WHERE q.deleted;
  IF n <> 0 THEN RAISE EXCEPTION 'survivor 被软删 %', n; END IF;

  SELECT count(*) INTO n FROM t_question_kp k
  JOIN dupe44_map_20261118 m ON k.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION 'dup KP 残留 %', n; END IF;

  SELECT count(*) INTO n FROM (
    SELECT question_id, kp_id FROM t_question_kp GROUP BY 1,2 HAVING count(*) > 1
  ) x;
  IF n <> 0 THEN RAISE EXCEPTION 'KP 重复 %', n; END IF;

  SELECT count(*) INTO n FROM session_question sq
  JOIN dupe44_map_20261118 m ON sq.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION '会话引用残留 %', n; END IF;

  SELECT count(*) INTO n FROM exam_paper_question ep
  JOIN dupe44_map_20261118 m ON ep.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION '试卷引用残留 %', n; END IF;

  SELECT count(*) INTO n FROM practice_answer a
  JOIN dupe44_map_20261118 m ON a.question_id = m.dup_id
  WHERE a.deleted_at IS NULL;
  IF n <> 0 THEN RAISE EXCEPTION '做题记录残留 %', n; END IF;

  SELECT count(*) INTO n FROM wrong_question w
  JOIN dupe44_map_20261118 m ON w.question_id = m.dup_id
  WHERE w.deleted_at IS NULL;
  IF n <> 0 THEN RAISE EXCEPTION '错题记录残留 %', n; END IF;

  SELECT count(*) INTO n FROM favorite_question f
  JOIN dupe44_map_20261118 m ON f.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION '收藏残留 %', n; END IF;

  SELECT count(*) INTO n FROM feedback fb
  JOIN dupe44_map_20261118 m ON fb.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION '反馈残留 %', n; END IF;

  SELECT count(*) INTO n FROM ai_explain_cache c
  JOIN dupe44_map_20261118 m ON c.question_id = m.dup_id;
  IF n <> 0 THEN RAISE EXCEPTION 'AI 缓存残留 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden AND NOT deleted;
  IF n <> base_golden THEN RAISE EXCEPTION '金标数变化：% → %', base_golden, n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE NOT deleted;
  IF n <> base_active - (SELECT count(*) FROM dupe44_map_20261118) THEN
    RAISE EXCEPTION '活跃题数不符：期望 %，实际 %',
      base_active - (SELECT count(*) FROM dupe44_map_20261118), n;
  END IF;
END $$;
```

预期数量（以 2026-11-18 基线为准）：

| 阶段 | 活跃题 | t_question_kp |
|---|---:|---:|
| 执行前 | 44,419 | 106,864 |
| 直接合并后 | 44,390 | 106,807 |
| 修正后合并完成 | 44,385 | 106,798 |

### 6.7 回滚

```sql
-- 06_rollback_20261118.sql
-- 仅在需要整体回滚时执行；建议执行前先做一次数据库快照。
BEGIN;

-- 1) 恢复软删标记
UPDATE t_question q
SET deleted = b.deleted
FROM t_question_backup_20261118_dupes b
WHERE q.id = b.id;

-- 2) 知识点链接：删掉涉及题的全部链接，按备份恢复
DELETE FROM t_question_kp
WHERE question_id IN (SELECT qid FROM dupe44_ids_20261118);
INSERT INTO t_question_kp
SELECT * FROM t_question_kp_backup_20261118_dupes;

-- 3) 会话题目：按备份的 (session_id,item_order) 恢复
DELETE FROM session_question
WHERE (session_id, item_order) IN (
  SELECT session_id, item_order FROM session_question_backup_20261118_dupes
);
INSERT INTO session_question
SELECT * FROM session_question_backup_20261118_dupes;

-- 4) 试卷题目：按备份的 (paper_id,item_order) 恢复
DELETE FROM exam_paper_question
WHERE (paper_id, item_order) IN (
  SELECT paper_id, item_order FROM exam_paper_question_backup_20261118_dupes
);
INSERT INTO exam_paper_question
SELECT * FROM exam_paper_question_backup_20261118_dupes;

-- 5) 做题/错题/收藏/反馈/AI 缓存本批备份为 0 行，无需恢复。
-- 若其他批次有数据，按主键/唯一键从对应备份表恢复后再提交。

COMMIT;
```

## 七、待确认事项

1. **`a849365d0f` 的规范答案**：取“微基站”（本文推荐，353137 解析正确、qc=good、无图）还是“微基站/波束赋形”（应保留无图的 353153 并补解析，不要保留带二维码图的 353148）？
2. **`95f926cc46` / `e36c2af5a4` 修正后是否解除隔离**：本文建议先修答案并合并，`review_status` 暂保持 `quarantined`；若要解除，另行确认。
3. **章节选择**：`1ace`（389342/ch138）、`b58`（368424/ch101）、`a85a`（369321/ch56）、`f8ac`（383674/ch107）、`0cb`（368475/ch115）是按语义选的 survivor，未按“id 较小”规则；请确认是否接受。
4. **`db64d77606` 的列名**：理论卷用“成绩”、实操卷用“分数”，题干未给表结构；建议分别按教材核验，不强行统一。
5. **保留组白名单**：是否把 12 个 keep 组的 ID 对写入下一轮去重扫描白名单，避免重复报警。
6. **`48429e16b7` 的回源**：需要从 2011/2013 真题原件恢复题干和 B/C 选项后，才能裁定答案。

## 附录 A：保留组白名单（建议）

```text
19d0d9a27f: 342168 / 368679
4ad2844615: 344354 / 368648
7753d3fed0: 341865 / 368622
889e9798a5: 356496 / 366319
92047f65da: 363956 / 364213
942b9b80ac: 364375 / 375854
a87d264d74: 364325 / 368397
baa215a6a1: 347622 / 370396
c3ee74cd23: 347624 / 370399
d26e407aa2: 344352 / 368646
db64d77606: 364208 / 384540（待核答案，暂不合并）
e030fda51b: 361144 / 380076
```

## 附录 B：执行检查清单

- [ ] 已确认 6.4 的三条修正和 `a849` 的裁定。
- [ ] 已执行 6.1、6.2，备份行数断言通过（92 行 / 1 金标）。
- [ ] 6.3 dry-run 通过，事务内断言全部为 0。
- [ ] 6.3 正式提交，活跃题 44,419 → 44,390，KP 106,864 → 106,807。
- [ ] 6.4 修正提交。
- [ ] 6.5 after_fix dry-run + 提交，活跃题 → 44,385，KP → 106,798。
- [ ] 6.6 断言通过，金标数仍为 199。
- [ ] 清理 Redis 题目/章节/随机抽题缓存。
- [ ] 前端抽查：2012/2013/2017 试卷题号与题目显示正常；被删题不再出现在章节练习中。
