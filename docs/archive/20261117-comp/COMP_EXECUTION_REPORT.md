# 综合 10 道执行报告（2026-11-17）

## 一、范围与方法

- 范围：`review_status='ok'`、`qc_grade='error'`、`question_type=5`、排除 80 道人工题的 **10 道综合/操作题**。
- 方法：两轮独立盲答（A/B），再逐题对照本地源资料。
- 源资料确认：
  - 363951：源 schema 为 `SC(SId,CId,score)`，现答案 `NOT IN` 子查询正确；
  - 363959：源 schema 学生表姓名字段为 `name`，现答案 `WHERE name LIKE '李%'` 正确；
  - 370095：源答案已完整，现库答案并非截断（此前是导出预览截断），保留；
  - 384492：源 schema 为 `student(sno,sname,ssex,sage,deptno)`、`dept(deptno,deptname)`，现答案 `B.dname` 错误，改为 `B.deptname`；
  - 384946：源题给出完整建表结构，现答案存在 `snane`、`not aul1`、未闭合等错误，按源结构补全。

## 二、裁决结果

| 处理 | 数量 |
|---|---:|
| keep | **7** |
| change_answer | **2** |
| unresolved | **1** |
| **合计** | **10** |

### keep

342200（rm -rf files）、342210（dhcp）、366249（COUNT）、363951（SC 选课 SQL）、363959（LIKE 李%）、370095（两问 SQL）、390385（冒泡排序输出循环）。

### 2 道改答案

| id | 现答案问题 | 新答案 |
|---|---|---|
| 384492 | 系名称用了 `B.dname`，源 schema 为 `deptname` | `SELECT A.sno, A.sname, A.ssex, B.deptname FROM student A, dept B WHERE A.deptno = B.deptno;` |
| 384946 | `snane`、`not aul1`、语句未闭合 | `CREATE TABLE student (sno varchar(10) PRIMARY KEY, sname varchar(20) NOT NULL, ssex varchar(10) NOT NULL, sbirthday datetime, class varchar(20));` |

### 1 道保留

359347：题干只有“目前处于第几代？”，没有说明对象，缺上下文。

## 三、写入

- 备份表：`t_question_backup_20261117_comp`（10 行，0 道金标）。
- SQL：`sql/01_backup.sql` + `sql/02_batch_01.sql` + `sql/99_final_assert.sql`。
- 批次 `COMMIT`；最终断言通过。
- 2 道改答案题 `practice_answer`/`wrong_question` 均为 0，无需清记录。

## 四、写入后复核

| 指标 | 结果 |
|---|---:|
| 本批 `good/match` | **9** |
| 本批 `error/uncertain` | **1** |
| 本批答案变更 | **2** |
| `ok/error` | 134 → **125** |
| 全库 `qc_grade='error'`（含 quarantined） | 318 → **309** |
| `ok/good/match` | 28,250 → **28,259** |
| `ok/error/uncertain` | 124 → **125** |
| 活跃题 / 可练题 / 金标 | 44,696 / 44,451 / 200（不变） |

## 五、P0 收尾

原 P0 的 423 道非选择题已全部处理：

| 批次 | 数量 | keep/改答案 | 保留 uncertain |
|---|---:|---:|---:|
| 判断 | 193 | 179 | 14 |
| 填空 | 122 | 97 | 25 |
| 多选 | 98 | 85 | 13 |
| 综合 | 10 | 9 | 1 |
| **合计** | **423** | **370** | **53** |

加上 80 道人工题（8 keep / 72 uncertain），P0 `ok/error` 从 503 降到 **125**。剩余 125 道均为已复核但保留 `error/uncertain` 的题：

- 人工题 72
- 判断 14
- 填空 25
- 多选 13
- 综合 1

P0 首轮处理完成；后续按 P1（缺图/空线）→ P2（HTML 实体/冒号/前缀/OCR）→ P3（题型 4/5/重复）继续。
