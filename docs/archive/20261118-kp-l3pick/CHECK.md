# L3 下移与伞形删除：检查记录（2026-11-18）

## 数据库

| 检查 | 结果 |
|---|---|
| 6 个伞形 KP | 全部 `deleted=true` |
| 32729–32734 的 `t_question_kp` | **0 条** |
| 131 道下移题 | 全部 `chapter_id` 指向 `level=3` 节点 |
| 26 道冲突题 | 保留原 L2 |
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
