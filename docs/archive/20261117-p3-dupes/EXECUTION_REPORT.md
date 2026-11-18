# P3 严格重复 214 组安全合并执行报告（2026-11-17）

## 一、范围

严格口径：`trim(stem)`、`option_json`、`question_type` 完全一致，且 `NOT deleted`。

- 当前命中：**299 组 / 624 行**
- 本次合并：**214 组 / 448 行 → 214 存活 + 234 软删**
- 未合并：**85 组 / 176 行**（跨章节 56、答案冲突 19、图像不一致 5、隔离 4、含金标 1）

安全组合并条件：同答案、同章节、同图像标记、全部 `review_status='ok'`、无金标。

## 二、备份

| 备份表 | 行数 |
|---|---:|
| `t_question_backup_20261117_dupes` | 448 |
| `t_question_kp_backup_20261117_dupes` | 1,154 |
| `practice_answer_backup_20261117_dupes` | 5 |
| `wrong_question_backup_20261117_dupes` | 4 |
| `favorite_question_backup_20261117_dupes` | 0 |
| `session_question_backup_20261117_dupes` | 21 |
| `exam_paper_question_backup_20261117_dupes` | 32 |
| `feedback_backup_20261117_dupes` | 2 |
| `ai_explain_cache_backup_20261117_dupes` | 0 |
| `t_question_notes_archive_backup_20261117_dupes` | 416 |

## 三、执行

SQL：`sql/01_backup.sql` + `sql/02_merge_dryrun.sql`（ROLLBACK）+ `sql/02_merge.sql`（COMMIT）+ `sql/99_final_assert.sql`。

先跑 dry-run，全部断言通过并回滚；随后正式提交。

| 操作 | 结果 |
|---|---:|
| 知识点链接：删除旧链接 | 1,154 |
| 知识点链接：重建去重后 | **608** |
| 做题记录迁移到 survivor | 1 |
| 错题记录迁移到 survivor | 1 |
| 会话题目迁移 | 5 |
| 试卷题目迁移 | 16 |
| 反馈改挂 survivor | 1 |
| 软删重复题 | **234** |
| 重算受影响已交卷会话 | 1 |

- 不物理删除题目；重复题仅 `deleted=true`。
- `t_question_notes_archive` 保留历史引用（归档表，不迁移）。
- 收藏 0、AI 解析缓存 0，无冲突。

## 四、写入后复核

| 指标 | 合并前 | 合并后 |
|---|---:|---:|
| 活跃题 | 44,696 | **44,462** |
| 可练题 | 44,451 | **44,217** |
| 金标 | 200 | **200** |
| `ok/error` | 125 | **125** |
| `ok/good/match` | 28,259 | **28,100** |
| `ok/error/uncertain` | 125 | **125** |
| `t_question_kp` 总链接 | 117,161 | **116,615** |
| 安全组存活 / 软删 | — | **214 / 234** |
| 剩余严格重复 | 299 组 / 624 行 | **85 组 / 176 行** |

所有指向 234 道软删题的活跃引用均为 0：

- `t_question_kp` 0
- `practice_answer`（`deleted_at IS NULL`）0
- `wrong_question`（`deleted_at IS NULL`）0
- `favorite_question` 0
- `session_question` 0
- `exam_paper_question` 0
- `feedback` 0
- `ai_explain_cache` 0

## 五、剩余人工组

| 类型 | 组数 | 行数 |
|---|---:|---:|
| 跨章节 | 56 | 116 |
| 答案冲突 | 19 | 39 |
| 图像不一致 | 5 | 11 |
| 隔离题 | 4 | 8 |
| 含金标 | 1 | 2 |
| **合计** | **85** | **176** |

这 85 组未动，后续按“先核答案冲突 → 再定跨章节归属 → 图像/隔离/金标”的顺序处理。
