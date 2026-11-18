# 空线题 + 368620 并行处理（2026-11-18）

## 368620

- type4 → type1，按四个防火墙配置截图重建 A-D 文字选项；`correct=D` 不变。
- 题干清掉 OCR 混入的配置文字；解析同步。
- 备份：`t_question_backup_20261118_368620`、`t_text_content_backup_20261118_368620`。
- 当前 type1 23,982 / type4 8,143 / type5 1,538。

## 空线题 12 道已修

| 批次 | id | 处理 |
|---|---|---|
| blank6 | 369578 | 4 空：扫描；分色；取样；量化 |
| blank6 | 370025 | 6 空：ALTER；ADD；ADD；FOREIGN；KEY；REFERENCES |
| blank6 | 370432 | 6 空：ALTER；DROP；DEFAULT；ALTER；SET；DEFAULT |
| blank6 | 374604 | 4 空：DELETE；v_student；LIKE；'_签%' |
| blank6 | 378661 | 4 空：操作状态；提示信息；控制键；状态 |
| blank6 | 378666 | 2 空：Sheet1；在工作表名上单击鼠标右键 |
| blank7 | 371191 | 3 空：a[n]；MaxValue(a,n-1)；return |
| blank7 | 373366 | 4 空：MAX(grade)；Score；HAVING；AVG（补表结构） |
| blank7 | 373421 | 2 空：HAVING；COUNT（清题干 OCR 噪声） |
| blank7 | 379686 | 6 空：DROP；TABLE；TRUNCATE；TABLE；DROP；DATABASE |
| blank7 | 384888 | 3 空：&&；j++；j（重写 LaTeX 题干） |
| blank7 | 384892 | 3 空：1；k=8-i-j；&&（blank_count 5→3） |

- 12 道均无作答/错题记录，未清记录。
- 备份：`t_question_backup_20261118_blank6` / `_blank7`，文本备份同名。
- 空线题累计 **68/71 已修**。

## 仍保留 3 道

| id | 原因 |
|---|---|
| 366525 | 与 370025 重复，建议软删并迁移关联；属破坏性操作，待确认 |
| 373370 | 金标题，建议答案 INDEX；ON → ALTER；ADD；INDEX；s_NameIdx，需受控绕过 |
| 379832 | OCR 严重损坏，含 7 个小问并拼接另一道综合题，建议隔离/拆分，待确认 |
