# P3 题型 4/5 带选项分类（2026-11-17）

## 一、范围

- `option_json` 带选项：196 道（type4 131 / type5 65，含 3 道金标）
- 题干自带选项：26 道（其中 10 道其实是 IP 地址 A/B/C/D/E 五类填空，已识别为误报）
- 合并去重后：**222 道**

## 二、分类结果

| category | 数量 | 说明 |
|---|---:|---|
| single_choice | 183 | 真单选，可转 type=1 |
| multi_choice | 1 | 真多选，可转 type=2 |
| malformed_options | 12 | 选项被合并/嵌在题干，需先拆选项再转 |
| wordbank_fill | 9 | 选项是词库，保持填空 |
| not_a_choice | 10 | 字母只是填空答案（多为 IP 类别），保持原题型 |
| verify | 7 | 选项/题干错位或 OCR 不可靠，留人工 |

## 三、处置建议

| action | 数量 | 说明 |
|---|---:|---|
| convert_choice | 164 | 高置信真选择题，直接转 type 1/2 |
| convert_after_extract | 11 | 高置信，先写入拆好的 A-D 选项再转 |
| manual_review | 25 | 中低置信/题干错位，人工复核 |
| leave | 19 | 词库填空/非选择题，保持原题型 |
| manual_golden | 3 | 金标题，触发器保护，需受控处理 |

明细：

- [`TYPE45_CLASSIFICATION.csv`](TYPE45_CLASSIFICATION.csv)：222 道全量分类与建议
- [`CONVERT_CANDIDATES.csv`](CONVERT_CANDIDATES.csv)：175 道转换候选
- 10% QA：抽 18 道（全部 11 道 `convert_after_extract` + 7 道随机 `convert_choice`）
  - 15 ok / 3 个选项 OCR 问题
  - 334864：D 选项补右引号
  - 364991：A/B 的 `= =` 还原为 `==`
  - 334991：D `1000K6` → `1000Kb`
  - 三处已写入候选的 `proposed_options`，答案字母不变

> 转换尚未执行。下一步生成“备份 + 题型转换 + 清记录 + 重算会话 + 断言”的 SQL，先 dry-run（ROLLBACK），确认后再提交。

## 六、Dry-run 结果（2026-11-17）

- 备份：`t_question_backup_20261117_type45` 175 行、practice_answer 2 行、wrong_question 2 行、practice_session 1 行。
- dry-run 事务内：175 道 `UPDATE`；清 2 条做题记录、2 条错题记录；1 个未交卷会话无需重算。
- 断言通过：type1 23,965 / type2 3,369 / type3 7,388 / type4 8,191 / type5 1,549；活跃 44,462、可练 44,217、金标 200。
- 最后 `ROLLBACK`，生产数据未变。
- 转换不触及 `t_question_kp`，与另一终端补挂无冲突。

## 七、正式执行（2026-11-17）

用户确认后执行 `sql/02_convert.sql`（COMMIT）：

| 指标 | 结果 |
|---|---:|
| 转换题数 | **175** |
| 其中 4→1 | 114 |
| 其中 4→2 | 1 |
| 其中 5→1 | 60 |
| 清理做题记录 | 2 |
| 清理错题记录 | 2 |
| 重算已交卷会话 | 0（受影响会话未交卷） |
| type1 | **23,965** |
| type2 | **3,369** |
| type3 | 7,388 |
| type4 | **8,191** |
| type5 | **1,549** |
| 活跃 / 可练 / 金标 | 44,462 / 44,217 / 200 |

- 备份：`t_question_backup_20261117_type45`（175）、`practice_answer_backup_20261117_type45`（2）、`wrong_question_backup_20261117_type45`（2）、`practice_session_backup_20261117_type45`（1）。
- 未转换：25 道 `manual_review`、19 道 `leave`、3 道金标 `manual_golden`。
- 7 道 `verify`：341857、347283、359513、389898、365059、365190、368620。
- 未改 `t_question_kp`。

## 八、转换后留意

- **351410**：已转 type1，答案 B 正确；但原题 C/D 都是 `21`，属 OCR 重复干扰项，建议 P2 选项清洗时修掉一个。
- **367896**：题干“终止一个前台进程能用到的命令和操作”为复数，`kill` 与 `Ctrl+C` 均正确，已转 type2（A,B）。
- 342185、342247、342251、367047、367057 均为 medium，停在 `manual_review`，未转换。
- 368620、389898 停在 `verify`，未转换；377703、379088、380619 词库填空和 388620、388913 IP 类别填空均保留原题型。

## 九、25 道人工复核结果（2026-11-17）

- **16 道**两轮一致，已追加转 type1：338116、338302、341916、342251、364977、364978、365839、367047、367057、367349、369423、369782、369953、370736；后续又修复 365190、374903 两道。
- **2 道**清选项/修题干后保持填空：341857（清掉错配的远程桌面选项）、347283（把误放进选项的题干后半段并回）。
- **7 道**保留原题型：342185、342247、359513、365059、368620、377437、389898。
- 剩余清单：[`MANUAL_REVIEW_LEFT.csv`](MANUAL_REVIEW_LEFT.csv)；明细：[`MANUAL25_RESULT.md`](MANUAL25_RESULT.md)。
- 最终已转换合计 **191 道**（175 + 16）；题型：type1 **23,977** / type2 **3,369** / type3 7,387 / type4 **8,155** / type5 **1,544**（跨章节合并后计数）。

## 四、转换规则（待 QA 后执行）

1. 只处理 `action in ('convert_choice','convert_after_extract')` 且非金标；
2. `question_type` 改为 `proposed_type`（1 或 2）；
3. `option_json`：
   - `convert_choice` 保留原选项；
   - `convert_after_extract` 写入 `proposed_options`；
4. `correct` 改为 `proposed_correct` 字母；
5. `blank_count` 置 1（单选）或按多选实际，`has_image` 保留；
6. 清该题做题记录（答案/选项/题型实质变更），重算受影响会话；
7. `wordbank_fill`/`not_a_choice`/`verify`/金标一律不动。

## 五、注意

- 10 道 IP 类别填空被正确识别为 `not_a_choice`，不能因为题干有 “A/B/C/D/E 五类” 就误转选择题。
- 7 道 `verify` 包含 341857、347283、359513、389898、365059、365190、368620：选项与题干错位或 OCR 严重，先修题再转。
