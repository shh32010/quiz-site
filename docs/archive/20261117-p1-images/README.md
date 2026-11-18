# P1 缺图题分类（2026-11-17）

## 一、口径与数量

审计口径：`has_image=false` 且题干含“如图/下图/图为/图中/图所示/题图”。

- 审计时：280 道
- 当前仍命中：**277 道**
- 其中 4 道为误报（“DFD图为基础”“视图为”等，实际不需要配图）
- **实际需配图：273 道**

明细：

- [`MISSING_IMAGES.csv`](MISSING_IMAGES.csv)：273 道，含题干、来源、来源类型、题型、质检状态、建议动作
- [`FALSE_POSITIVES.csv`](FALSE_POSITIVES.csv)：4 道误报（338110、341366、373799、374104）

## 二、分布

### 来源类型

| 来源类型 | 数量 | 建议动作 |
|---|---:|---|
| PDF | 210 | 从源 PDF 提取/重绘 |
| JSON（真题回放） | 34 | 源 JSON 不在本地，需原始真题包/原卷 |
| DOCX | 20 | 从源 Word 提取/重绘 |
| DOC | 7 | 从源 Word 提取/重绘 |
| JPG | 1 | 从扫描页裁图 |
| 其他 | 1 | 人工确认 |
| **合计** | **273** | |

### 题型

| 题型 | 数量 |
|---|---:|
| 单选 | 162 |
| 填空 | 50 |
| 判断 | 37 |
| 综合 | 15 |
| 多选 | 9 |

### 质检/状态

- `review_status`：ok 269、quarantined 4
- `qc_grade`：good 148、warn 111、error 14
- 章节：S3 107、A 80、S2 40、B 32、S5 11、S1 2、S6 1

## 三、修复路径（确认）

前端题目图片不是独立字段，而是从 `t_text_content.content` 中的 `/qimg/...` 路径提取（`PracticeService` / `PracticeHistoryController` / `QuestionService`）。因此补图需要：

1. 把图片文件放到 `/qimg/` 对应的静态资源位置（生产服务器）；
2. 在对应题的 `t_text_content.content` 中补 `/qimg/<文件名>`；
3. 把 `t_question.has_image` 置为 `true`；
4. 清理相关 Redis 缓存（本轮未执行，需用户授权或手动执行）。

## 四、建议顺序

1. **先做 PDF/DOCX/DOC 的 237 道**：优先 S3（107）和 A（80），这两类占缺图题的大头；
2. **34 道真题 JSON**：本地没有原始 JSON，需要找回原卷/原题包；短期先保留“含图”提示或隔离；
3. **1 道 JPG + 1 道其他**：人工裁图/确认；
4. 4 道误报从 P1 清单移除，不需要补图。

本轮只做分类，未改数据库、未改前端。

## 五、二次误报清理（2026-11-18）

复核发现首轮关键词“图中”会命中“视图中/图形中”等词，导致部分 Word/PowerPoint 视图题、MySQL 视图题被误列入缺图清单。

- 新增 [`FALSE_POSITIVES2.csv`](FALSE_POSITIVES2.csv)：**52 道**，题干不依赖配图；
- 新增 [`MISSING_IMAGES_REFINED.csv`](MISSING_IMAGES_REFINED.csv)：剔除后实际需配图 **221 道**（截至 2026-11-18 已补 42 道，剩余 **179 道**待补）。
