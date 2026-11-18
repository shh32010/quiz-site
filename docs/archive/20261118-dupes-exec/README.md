# 27 组严格重复合并执行（2026-11-18）

## 范围

按 [`../20261118-dupes-analysis/REPORT.md`](../20261118-dupes-analysis/REPORT.md) 的 6.1–6.3，执行 **27 组 / 29 行软删**；4 组 after_fix 与 12 组保留、1 组暂缓未动。

## 执行

- 辅助表：`dupe44_ids_20261118`（92 行）、`dupe44_map_20261118`（29 direct + 5 after_fix）。
- 备份：`t_question_backup_20261118_dupes`（92）、`t_question_kp_backup_20261118_dupes`（206）、`session_question_backup`（5）、`exam_paper_question_backup`（12）、`t_question_notes_archive_backup`（86）、其余关联表 0 行。
- 先 dry-run（ROLLBACK），断言通过后 COMMIT。
- 知识点：删 132、重建 75；会话题删 1、改挂 1；试卷题改挂 2；软删 29 行。

## 结果

| 指标 | 合并前 | 合并后 |
|---|---:|---:|
| 活跃题 | 44,419 | **44,390** |
| 可练题 | 44,174 | 44,147 |
| 金标 | 200 | 200 |
| `t_question_kp` | 106,864 | 106,807 |

- `t_question_kp` 无重复、无 dup 残留；direct 批 29 行全部软删；survivor 无一被删。
- 5 条 after_fix 映射仍保留（179 等 4 组待内容裁定）。

SQL：`sql/00_helper.sql`、`01_backup.sql`、`02_merge_dryrun.sql`、`02_merge.sql`。
