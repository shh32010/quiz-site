# 空线最后 3 道处理（2026-11-18）

| id | 处理 |
|---|---|
| 366525 | 与 370025 严格重复；3 条知识点迁移到 370025 后软删。无作答/错题/试卷/会话引用 |
| 373370 | 金标题受控绕过：答案 `INDEX；ON` → `ALTER；ADD；INDEX；s_NameIdx`，`blank_count` 2→4，题干改为 `ALTER TABLE student ADD INDEX s_NameIdx (s_name)`，恢复 `review_status='ok'` |
| 379832 | 保持 `quarantined`；7 个索引小问 + 另一道综合题混排，未拆分 |

- 备份：`t_question_backup_20261118_final3`（2）、`t_text_content_backup_20261118_final3`（1）、`t_question_kp_backup_20261118_final3`（3）。
- 活跃题 44,390 → **44,389**；金标 200；type5 1,536 → **1,535**。
- 370025 知识点 3 → **6**；366525 无残留。

空线题最终：71 道中 **70 道已规范/移除**，仅 379832 隔离待拆分。
