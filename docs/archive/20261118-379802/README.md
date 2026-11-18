# 379802 金标答案修正（2026-11-18）

- 源资料《智狐实操 2000 题》答案 B：`CREATE OR REPLACE VIEW` 表示“存在则修改，不存在则创建”。
- 库内原答案 D（无操作），且题干为 OCR 残片 `CREAN视图 A、...`。
- 事务内 `SET LOCAL session_replication_role=replica` 受控绕过，答案 D → **B**，题干改为 `CREATE OR REPLACE VIEW 的含义是（）`，解析同步。
- 备份：`t_question_backup_20261118_379802`、`t_text_content_backup_20261118_379802`。
- 触发器提交后仍为启用状态（`tgenabled='O'`）。
