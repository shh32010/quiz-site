# 题目配图试点：7 张上线（2026-11-18）

## 方法

1. 从 `docs/archive/20261117-p1-images/MISSING_IMAGES.csv` 取缺图题；
2. 在本地 OCR Markdown（`private/reference/md题库和知识点/_MD输出/...`）中定位题干最近的图片引用；
3. 人工核图，剔除错图、水印、装饰图；
4. 图片上传生产 `/opt/quiz-assets/qimg/q<id>.jpg`；
5. 在 `t_text_content.content` 的 `titleContent` 内追加 `<img src="/qimg/q<id>.jpg"/>`，并置 `t_question.has_image=true`。

## 已上线 7 张

| id | 内容 |
|---|---|
| 336356 | Intel Core i5 处理器 |
| 338655 | Windows“选择用户”对话框 |
| 340736 | 二叉树遍历图 |
| 354973 | 机器学习/深度学习嵌套关系图 |
| 364320 | 邮件收发示意图 |
| 364696 | 虚拟化架构图 |
| 365240 | 红外测温传感器 |

- 全部 URL `https://quiz.teacher-wishes.asia/qimg/q<id>.jpg` 实测 **200**。
- `t_text_content.content` JSON 合法；答案未改；活跃/可练/金标不变。
- 备份：`t_question_backup_20261118_imgpilot` / `imgpilot2`，`t_text_content_backup_20261118_imgpilot` / `imgpilot2`。

## 剔除的错图

365199、366516、366517、368847、370126 等：OCR 图片是相邻题图、水印或装饰图，未使用。

## 剩余

缺图 273 道中首批已补 7 道；后续第二批再补 5 道（见 [`../20261118-imgpilot3/`](../20261118-imgpilot3/)），累计 12 道，剩 **261 道**。OCR Markdown 自动匹配可覆盖一部分，但需要逐张人工核图；后续继续按“题干邻近图片 + 人工确认”处理。
