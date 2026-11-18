# 题目配图第二批：5 张上线（2026-11-18）

## 本轮上线

| id | 图片内容 | 来源 |
|---|---|---|
| 375284 | UML 顺序图（对象间消息调用） | 智狐实操试卷 |
| 375595 | 同上（同题跨来源） | 智狐实操试卷 |
| 375565 | UML 类图（Shop—Magazine—Page） | 2022 第 4 次模拟卷 II |
| 376032 | 系统属性【远程】+ 远程协助设置双图 | 智弧实操习题 |
| 377847 | Windows【设置】→【系统】→【关于】界面 | 智弧实操习题 |

- 全部 URL `https://quiz.teacher-wishes.asia/qimg/q<id>.jpg` 实测 **200**。
- `titleContent` 内追加 `<img src="/qimg/q<id>.jpg"/>`，`has_image=true`。
- 答案、题型、活跃数、金标数均未变。
- 备份：`t_question_backup_20261118_imgpilot3` / `t_text_content_backup_20261118_imgpilot3`（各 5 行）。

## 本轮跳过

- **376028**：金标题，且 `titleContent` 已有完整的两个对话框文字转写，按金标保护规则不改动；
- **375284/375595 的候选图** 最初误判为总线图，核对 OCR Markdown 的 mermaid 转写后确认是 **UML 顺序图**（Student/Message/TranscriptionBuffer…），与题干「UML 图」及答案「顺序图」一致，已采用。

## 累计与剩余

- 缺图 273 道：首批 7 张 + 本批 5 张，累计 **12 张**，剩 261 道；第三批再补 28 张后累计 **40 张**，剩 **233 道**（见 [`../20261118-imgpilot4/`](../20261118-imgpilot4/)）。
- 下一批继续按「OCR 题干邻近图片 → 逐张核图 → 只上线确认匹配的图」处理。
