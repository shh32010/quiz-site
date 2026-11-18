# P2 金标 6 道受控修复（2026-11-18）

## 范围

| id | 问题 | 处理 |
|---|---|---|
| 345683 | 判断题题干前缀 `（ ）` | 去前缀 |
| 373523 | 判断题题干前缀 `( )` | 去前缀 |
| 342936 | 解析以 `:` 开头 | 去冒号 |
| 371903 | 选项 C 含 `&quot;` | 解码为 `"` |
| 373704 | 选项 A `&amp;&amp;` | 解码为 `&&` |
| 382012 | 选项 C `&#x27;` | 解码为 `'` |

## 执行方式

- 备份：`t_question_backup_20261118_golden6`（6 行，全部金标）。
- 事务内 `SET LOCAL session_replication_role = replica` 受控绕过 `trg_protect_gold_question`，提交后触发器仍为启用状态（`tgenabled='O'`）。
- 只改 `stem` / `option_json` / `analysis` 三列；答案、题型、`blank_count` 均未变。
- 活跃 44,419、金标 200 不变；6 道残留断言为 0。
- SQL：`sql/01_backup.sql`、`sql/02_fix.sql`、`sql/02_fix_dryrun.sql`。
