# quiz-v2 文档与脚本索引

**最后整理**：2026-10-27

## 数据库变更 SQL（按需手工执行）

| 文件 | 用途 |
|---|---|
| `email_login.sql` | `profiles.email`、token_version、`password_reset_token` 表与授权 |
| `forgot_password.sql` | 管理员兜底的 `password_reset_request` 表 |
| `single_practice.sql` | `practice_session.mode` 扩展 single/course |
| `user_last_login.sql` | `profiles.last_ip`、`last_login_at` |
| `judge_alt_answers.sql` | 判分函数（备选答案 `¦`、多行填空、错题本节奏） |
| `guest_judge.sql` | 游客判分函数 |
| `clean_html_text.sql` | 历史 HTML 清洗 |
| `fix_multiline_fill.sql`、`fix_q364454.sql`、`fix_paper_gaps.sql`、`move_golden3.sql` | 历史一次性修复 |
| `paper6_20261021/` | 6 套真题卷修复记录 |

### 2026-10-25 / 10-26 批次（均已执行于生产）

| 文件 | 用途 |
|---|---|
| `data_write_w2_20261025.sql` | W2 落库：6 道选项严格无损修正、7 道答案修正、8 道隔离；执行前备份到 `/opt/quiz-backups/w2_data_before_20261025.csv` |
| `data_write_w5_20261025.sql` | W5 收口：5 道冲突题（3 道隔离、366988 改 B+单选、381036 改 A,C）；备份 `w5_data_before_20261025.csv` |
| `data_write_compose_unseen_20261025.sql` | 随机组卷优先未做过的题：重写 `pick_questions_for_user`，同桶内按 `exists(practice_answer)` 排序；依赖 `idx_answer_user_q` |
| `data_write_x9_reclassify_20261025.sql` | X9「未归入标准章节」15 道真题归位到 A2/B1/S2；不改题干/答案；备份表 `t_question_x9_backup_20261025` |
| `ops_gold_trigger_20261025.sql` | 金标防误改触发器 `trg_protect_gold_question`：锁内容与审核列，放行章节/分类列；长期生效 |
| `data_write_chapter_random_20261026.sql` | `practice_session.mode` 新增 `chapter_random`（章节随机组卷） |
| `data_write_compose_score_20261026.sql` | 全站随机组卷只抽大纲标准分值题，理论稳定 150/150、实操 80/80 |
| `data_write_exact_dup_choice_20261026.sql` | 85 组原文一致选择题去重：软删重复侧、64 条试卷引用改挂保留题、知识点关联合并；依赖映射表 `exact_dup_choice_map_20261026` |
| `data_write_feedback_20261026.sql` | 题目反馈 25/26/28：334440 C 选项、335849 B 选项修正，335757 测试反馈关闭 |
| `data_write_feedback_20261026_duplicate.sql` | 题目反馈 27：OCR 重复副本 336899 软删，保留 335843 |

### 2026-10-27 批次（均已执行于生产）

| 文件 | 用途 |
|---|---|
| `schema_email_verification_20261027.sql` | 邮箱归属验证：`profiles.email_verified`/`pending_email` 与 `email_verification_token`；历史邮箱标记已验证 |
| `schema_page_view_20261027.sql` | 匿名访问统计：`page_view` 表（路径/匿名访客 ID/来源域名/是否移动端），不存 IP/UA |

> 新环境按依赖顺序执行；已有库不要重复跑破坏性脚本，先备份 `/opt/quiz-backups/`。

## SQL 命名与登记约定（自 2026-10-26 起）

1. **命名**
   - 结构变更 / 约束 / 函数：`schema_<主题>_<YYYYMMDD>.sql`
   - 数据写入 / 修复 / 软删：`data_write_<主题>_<YYYYMMDD>.sql`
   - 长期运维对象（触发器、定时函数等）：`ops_<主题>_<YYYYMMDD>.sql`
   - 同批次补充文件加子主题：`data_write_feedback_20261026_duplicate.sql`
   - 历史文件（`email_login.sql`、`fix_*.sql` 等）保留原名，不再重命名
   - 例外：2026-10-26 批次的 `data_write_compose_score_20261026.sql`、`data_write_chapter_random_20261026.sql` 同批包含函数/约束，沿用 `data_write_` 前缀不改名；自 2026-10-27 起，结构变更与数据变更分文件命名
2. **文件头必须写明**：目的、依赖（表/函数/映射表）、影响行数或 ID 白名单、备份路径、回滚方式
3. **执行纪律**：DML 必须事务包裹；执行前做行级 CSV 或 `pg_dump` 备份；带行数/不变量断言；金标题目不得被自动修改；写库后清 Redis 的 `chapterTree` / `courseCounts` / `paperList` / `paperSections` / `knowledgeTree`
4. **登记**：执行后在本页对应批次表格登记；未执行或待复核的 SQL 必须标注状态，不得只留文件不登记
5. **一次性过程记录**：放 `docs/<用途>_<YYYYMMDD>/README.md`，在其中写明执行顺序与校验结果；大批量原始数据（dump、逐题结果）放 `private/`，不进 Git

## nginx / 运维配置

| 文件 | 用途 |
|---|---|
| `quiz-site.nginx.live.conf` | 线上 nginx 站点配置（HTTPS/跳转/静态/代理） |
| `quiz-proxy.conf` | 反代头、超时、隐藏上游头 |
| `quiz-security-headers.conf` | HSTS / nosniff / X-Frame-Options / Referrer-Policy / Permissions-Policy |
| `nginx-quiz-rate.conf`、`nginx-quiz-rate-locations.conf` | 限流区与 location |
| `backup-cron.sh` | 每日 DB + 每周图片备份（700/600 权限） |
| `ops_20261024.md` | 2026-10-24 索引/权限/pg_stat_statements/旧数据/依赖加固记录 |

## 数据工程 / 复核记录

| 目录 | 内容 |
|---|---|
| `maintenance_20261021/assoc/` | 知识点↔题目关联补全（候选、buddy 结果、落库） |
| `maintenance_20261021/deep_map/` | 知识点章节深层映射 |
| `maintenance_20261021/audit_fix_20261023/` | 审查小批量修复（试卷冲突/选项/答案格式） |
| `maintenance_20261021/round2_20261023/` | 第二轮补挂（软删关联/无题知识点/跨学科/C4） |
| `other_reclass_20261020/` | 「其他题目」1,598 道归位 |
| `direct_reclass_20261021/` | 章直属题 6,939 道归节 |
| `knowledge_20261021/` | 知识点映射脚本与映射表 |

## 校验脚本

- `verify_data.py`：题数/知识点/章节一致性核对
- `final_check.sh`、`test_practice.sh`：部署后冒烟
- 当前项目结论见 `project/项目状态与待办_20261021.md` 与 `project/项目交接_20261026.md`（本机保留，不进 Git）
