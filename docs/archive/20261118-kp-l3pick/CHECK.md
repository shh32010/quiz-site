# L3 下移与伞形删除：检查记录（2026-11-18）

## 数据库

| 检查 | 结果 |
|---|---|
| 6 个伞形 KP | 全部 `deleted=true` |
| 32729–32734 的 `t_question_kp` | **0 条** |
| 下移题 | **67 道** `chapter_id` 指向 `level=3`；64 道两轮 low 已撤回原 L2/L1 |
| 26 道冲突 + 64 道低置信 | 保留原 L2/L1 |
| `chapter_id` 为空 / 指向已删章节 | **0 / 0** |
| 活跃题 | 44,323 |
| `t_question_kp` | 107,687 |

## 接口

- `/api/questions?chapter=279`：返回下移后的题（如 334862），total 635。
- `/api/questions?kp=32721`：返回 9 道该具体 KP 的题，过滤正常。
- `/api/questions?kp=32729`（已删伞形 KP）：返回 0，无残留。
- `/api/questions/334862/knowledge`：返回 `S2-3.2 简单查询、连接查询`，练习页会显示新的 L3 章节。
- `/api/knowledge/section/277`：节点 279 的 `questionCount=635`，下移题已计入 L3。

## 前端口径确认

- 练习页“相关知识点”读 `/api/questions/{id}/knowledge`，实际返回 `q.chapter_id` 对应的三级章节；
- 节阅读器“练本节”传 `nodeId`（三级章节），按 `chapter_id` 取题；
- 学习报告“知识点掌握度”按 `q.chapter_id` 且 `level=3` 聚合。

因此本次不改代码，131 道下移后上述三处自然生效。

## 更正

`/api/knowledge/tree` 的 `kpCount` 是 **`kb_revision.blocks` 的块数**（`KnowledgeService.directCounts()`），不是 `t_knowledge_point` 条数；删除 6 个伞形 KP 不会改变该计数，之前把 kpCount 当作 KP 数是不准确的。

## 节阅读器与练习页复核（2026-11-18）

### 练习页章节

- `/api/questions?id=338013`：`chapterId=54`，`chapterPath=A1 计算机硬件 › A1-1.4 常用输入设备 › A1-1.4.2 键盘、鼠标的分类…`，练习页会显示新的 L3 章节。
- 下移题 334862：`chapterId=279`，`S2-3.2 简单查询、连接查询`。

### 节阅读器题目数

| 节 | L3 节点 | questionCount |
|---|---|---:|
| 277 SQL 数据操纵语言 | 279 简单查询、连接查询 | 635 |
| 52 常用输入设备 | 54 键盘、鼠标的分类 | 3 |
| 47 PC 机组成 | 51 I/O 总线 | 547 |
| 68 操作系统 | 72 常用操作系统 | 229 |

下移题已计入对应 L3 节点；旧 L2 的精确 `chapter_id` 计数相应减少。

### 撤回题

- 64 道两轮 low 的题已回到原 L2/L1；其中 26 道冲突题也在原 L2。
- 抽查发现部分题**原始章节本身错配**：367602（Excel 光标）在 S1-1 C 语言程序结构，366548（Skolem 函数）在 S1-7 函数定义与调用。这是历史分类问题，不是本次下移造成；需要跨章节重挂，暂未处理。
