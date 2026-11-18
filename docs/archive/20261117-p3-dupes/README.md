# P3 严格重复题 dry-run（2026-11-17）

## 一、口径

`trim(stem)`、`option_json`、`question_type` 完全一致，且 `NOT deleted`。

当前结果：

- **299 组 / 624 行**
- 其中同答案组的多余行 **306 行**

明细：[`STRICT_DUPLICATES.csv`](STRICT_DUPLICATES.csv)，每行含 `group`、`survivor_id`、`action`、`reason`。

## 二、分组处置

| 处置 | 组数 | 行数 | 多余行 | 说明 |
|---|---:|---:|---:|---|
| `merge_safe` | 214 | 448 | **234** | 同答案、同章节、同图像标记、全部 ok、无金标 |
| `manual_cross_chapter` | 56 | 116 | 60 | 同题出现在不同章节，需决定保留章节 |
| `manual_conflict` | 19 | 39 | 20 | 同题干/选项但答案不同，先核答案 |
| `manual_image_diff` | 5 | 11 | 6 | 一有一无配图，需选择带图版本 |
| `manual_quarantine` | 4 | 8 | 4 | 含隔离题，需先解除/保留 |
| `manual_golden` | 1 | 2 | 1 | 组内含金标，需受控处理 |
| **合计** | **299** | **624** | **325** | |

## 三、安全合并规则（待确认后执行）

1. 每组保留 1 道 survivor：
   - 优先金标 → 有图 → `review_status='ok'` → `qc_grade='good'` → id 较小。
2. 其余行 `deleted=true` 软删，不物理删除。
3. 合并前把重复行的关联迁到 survivor：
   - `t_question_kp`（知识点关联，去重）；
   - `practice_answer` / `wrong_question`（用户作答/错题，改 question_id 后去重）；
   - 试卷关联（如 `t_exam_paper_question`，改挂 survivor）；
   - 反馈 `feedback.question_id`（如引用重复题，改挂 survivor）。
4. 保留 survivor 的 `correct`/`analysis`/`stem`/`option_json` 不变。
5. 合并后重算受影响会话分数；清 Redis 缓存需用户授权或手动执行。

## 四、当前状态

- 初始 dry-run 已完成；后续已执行 `merge_safe` 214 组，软删 234 行（详见 [`EXECUTION_REPORT.md`](EXECUTION_REPORT.md)）。
- 剩余 44 组 / 92 行：答案冲突 6、跨章节 28、图像不一致 5、隔离 4、金标 1。
- 本轮未物理删除任何题目。

## 六、19 组答案冲突处理（2026-11-17）

- 两路独立复核：14 组答案一致，5 组仅格式/单位差异，其余不确定。
- 已对 **16 组 / 29 行**统一 `correct`（不合并、不删题）：首批 12 组/24 行（备份 `t_question_backup_20261117_conflict`），二批 4 组/5 行（`0-255`→`0~255`、文本朗读/文语转换、文档表述、`16KB`→`16`；备份 `t_question_backup_20261117_conflict2`）。
- 另有 2 组原本已一致；最终 **18/19 组答案一致**。其中 13 组同章节、同图像的已合并（软删 13 行）；剩 6 组：4 组跨章节、1 组图像不一致、1 组选项截断。
- 已统一答案的组仍保留重复行；后续可并入跨章节/安全合并流程。

## 七、跨章节 56 组复核（2026-11-17）

- 全量复核建议：42 组 merge / 10 组 keep / 4 组 verify。
- 28 组第二路复核中，与全量建议 **13 组不一致**（同一组一边判 merge、一边判 keep，或 survivor 不同）。
- 结论：**跨章节 56 组暂不合并**，保留原样；跨章节归属需要人工按章节语义定，不能自动删。

### 三路复核汇总（2026-11-17 补充）

- 全量：42 merge / 10 keep / 4 verify。
- A 半 28 组：21 merge / 6 keep / 1 verify。
- B 半 28 组：16 merge / 11 keep / 1 verify。
- 全量与第二路动作一致 **43/56**，不一致 13 组。
- **三路完全一致且 survivor 相同：28 组**；三路一致 keep：8 组。
- 仍未执行任何跨章节合并；28 组可作为候选，13 组冲突 + 其余保留。
