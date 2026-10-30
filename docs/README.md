# quiz-v2 文档与脚本索引

**最后整理**：2026-10-30

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
| `schema_email_claiming_20261027.sql` | 邮箱防抢占：未验证邮箱允许重复，唯一索引只约束已验证邮箱 |
| `schema_page_view_20261027.sql` | 匿名访问统计：`page_view` 表（路径/匿名访客 ID/来源域名/是否移动端），不存 IP/UA |
| `knowledge_audit_20261028.sql` | 知识点内容只读审计（重复标题/短正文/HTML/表格），不写库 |
| `data_write_c_question_text_20261028.sql` | C 语言 S1 题目文本清洗：969 题题干/选项/解析；答案/题型/分值不动，金标题跳过；备份表 `t_question_backup_20261028_c_text` |
| `data_write_code_question_text_20261028.sql` | 非 S1 代码类题目文本清洗：96 题；备份表 `t_question_backup_20261028_code_text` |
| `data_write_c_question_spotfix_20261028.sql` | 抽检高置信度修正：8 处题干/选项/解析/题型；备份表 `t_question_backup_20261028_spotfix` |
| `data_write_knowledge_remaining_20261028.sql` | 最后 326 条零散知识点清洗；备份表 `t_knowledge_point_backup_20261028_remaining` |
| `data_write_chapter_empty_20261028.sql` | 软删除 15 个空重复根章（13/16/17/25–35/38 中的空节点）；备份表 `t_chapter_backup_20261028_empty` |
| `data_write_knowledge_40_20261028.sql` | A1-1.1.1 清洗（75 条）；备份表 `t_knowledge_point_backup_20261028_40` |
| `data_write_knowledge_48_20261028.sql` | A1-1.3.1 清洗（58 条）；备份表 `t_knowledge_point_backup_20261028_48` |
| `data_write_knowledge_80_20261028.sql` | A2-2.4.1 清洗（67 条）；备份表 `t_knowledge_point_backup_20261028_80` |
| `data_write_knowledge_98_20261028.sql` | A3-3.2.3 清洗（82 条）；备份表 `t_knowledge_point_backup_20261028_98` |
| `data_write_knowledge_162_20261028.sql` | B1-1.5.3 清洗（83 条）；备份表 `t_knowledge_point_backup_20261028_162` |
| `data_write_knowledge_270_20261028.sql` | S2-1 清洗（64 条）；备份表 `t_knowledge_point_backup_20261028_270` |
| `data_write_knowledge_87_20261028.sql` | A2-2.5.1 清洗（39 条）；备份表 `t_knowledge_point_backup_20261028_87` |
| `data_write_knowledge_103_20261028.sql` | A3-3.4.1 清洗（66 条）；备份表 `t_knowledge_point_backup_20261028_103` |
| `data_write_knowledge_105_20261028.sql` | A3-3.4.3 清洗（39 条）；备份表 `t_knowledge_point_backup_20261028_105` |
| `data_write_knowledge_111_20261028.sql` | A3-3.5.4 清洗（41 条）；备份表 `t_knowledge_point_backup_20261028_111` |
| `data_write_knowledge_122_20261028.sql` | A4-4.2.2 清洗（30 条）；备份表 `t_knowledge_point_backup_20261028_122` |
| `data_write_knowledge_125_20261028.sql` | A4-4.2.5 清洗（57 条）；备份表 `t_knowledge_point_backup_20261028_125` |
| `data_write_knowledge_129_20261028.sql` | A4-4.3.2 清洗（60 条）；备份表 `t_knowledge_point_backup_20261028_129` |
| `data_write_knowledge_139_20261028.sql` | B1-1.1.1 清洗（61 条）；备份表 `t_knowledge_point_backup_20261028_139` |
| `data_write_knowledge_140_20261028.sql` | B1-1.1.2 清洗（68 条）；备份表 `t_knowledge_point_backup_20261028_140` |
| `data_write_knowledge_146_20261028.sql` | B1-1.3 清洗（145 条）；备份表 `t_knowledge_point_backup_20261028_146` |
| `data_write_knowledge_230_20261028.sql` | B7-7.1.2 清洗（53 条）；备份表 `t_knowledge_point_backup_20261028_230` |
| `data_write_knowledge_283_20261028.sql` | S2-4 清洗（45 条）；备份表 `t_knowledge_point_backup_20261028_283` |
| `data_write_knowledge_287_20261028.sql` | S3-1 清洗（44 条）；备份表 `t_knowledge_point_backup_20261028_287` |
| `data_write_knowledge_311_20261028.sql` | S5-1 清洗（61 条）；备份表 `t_knowledge_point_backup_20261028_311` |
| `data_write_knowledge_73_20261028.sql` | A2-2.3 清洗（140 条）；备份表 `t_knowledge_point_backup_20261028_73` |
| `data_write_knowledge_42_20261028.sql` | A1-1.1.3 清洗（81 条）；备份表 `t_knowledge_point_backup_20261028_42` |
| `data_write_knowledge_43_20261028.sql` | A1-1.1.4 清洗（117 条）；备份表 `t_knowledge_point_backup_20261028_43` |
| `data_write_knowledge_44_20261028.sql` | A1-1.2 清洗（112 条）；备份表 `t_knowledge_point_backup_20261028_44` |
| `data_write_knowledge_49_20261028.sql` | A1-1.3.2 清洗（79 条）；备份表 `t_knowledge_point_backup_20261028_49` |
| `data_write_knowledge_56_20261028.sql` | A1-1.5.1 清洗（74 条）；备份表 `t_knowledge_point_backup_20261028_56` |
| `data_write_knowledge_100_20261028.sql` | A3-3.3.1 清洗（115 条）；备份表 `t_knowledge_point_backup_20261028_100` |
| `data_write_knowledge_124_20261028.sql` | A4-4.2.4 清洗（76 条）；备份表 `t_knowledge_point_backup_20261028_124` |
| `data_write_knowledge_160_20261028.sql` | B1-1.5.1 清洗（77 条）；备份表 `t_knowledge_point_backup_20261028_160` |
| `data_write_knowledge_272_20261028.sql` | S2-2 清洗（80 条）；备份表 `t_knowledge_point_backup_20261028_272` |
| `data_write_knowledge_277_20261028.sql` | S2-3 清洗（88 条）；备份表 `t_knowledge_point_backup_20261028_277` |
| `data_write_knowledge_51_20261028.sql` | A1-1.3.4 清洗（86 条）；备份表 `t_knowledge_point_backup_20261028_51` |
| `data_write_knowledge_60_20261028.sql` | A1-1.6.2 清洗（53 条）；备份表 `t_knowledge_point_backup_20261028_60` |
| `data_write_knowledge_61_20261028.sql` | A1-1.7 清洗（249 条，含子节）；备份表 `t_knowledge_point_backup_20261028_61` |
| `data_write_knowledge_65_20261028.sql` | A2-2.1 清洗（836 条，含子节）；备份表 `t_knowledge_point_backup_20261028_65` |
| `data_write_knowledge_68_20261028.sql` | A2-2.2 清洗（330 条，含子节）；备份表 `t_knowledge_point_backup_20261028_68` |
| `data_write_knowledge_92_20261028.sql` | A3-3.1 清洗（260 条，含子节；93 由此覆盖）；备份表 `t_knowledge_point_backup_20261028_92` |
| `data_write_knowledge_97_20261028.sql` | A3-3.2.2 清洗（102 条）；备份表 `t_knowledge_point_backup_20261028_97` |
| `data_write_knowledge_104_20261028.sql` | A3-3.4.2 清洗（163 条）；备份表 `t_knowledge_point_backup_20261028_104` |
| `data_write_knowledge_106_20261028.sql` | A3-3.4.4 清洗（186 条）；备份表 `t_knowledge_point_backup_20261028_106` |
| `data_write_knowledge_117_20261028.sql` | A4-4.1.2 清洗（54 条）；备份表 `t_knowledge_point_backup_20261028_117` |
| `data_write_knowledge_238_20261028.sql` | C 语言 S1-1 清洗（82 条，含子节）；备份表 `t_knowledge_point_backup_20261028_238` |
| `data_write_knowledge_242_20261028.sql` | C 语言 S1-2 清洗（175 条，含子节）；备份表 `t_knowledge_point_backup_20261028_242` |
| `data_write_knowledge_247_20261028.sql` | 知识点 247 节清洗：49 条标题/正文/段落 + 子节 31875；备份表 `t_knowledge_point_backup_20261028_247` |
| `data_write_knowledge_250_20261028.sql` | C 语言 S1-4 清洗（38 条，含子节）；备份表 `t_knowledge_point_backup_20261028_250` |
| `data_write_knowledge_254_20261028.sql` | C 语言 S1-5 清洗（37 条，含子节）；备份表 `t_knowledge_point_backup_20261028_254` |
| `data_write_knowledge_259_20261028.sql` | C 语言 S1-6 清洗（100 条，含子节）；备份表 `t_knowledge_point_backup_20261028_259` |
| `data_write_knowledge_264_20261028.sql` | C 语言 S1-7 清洗（96 条，含子节）；备份表 `t_knowledge_point_backup_20261028_264` |

> 新环境按依赖顺序执行；已有库不要重复跑破坏性脚本，先备份到 `/opt/quiz-backups/`。
> 2026-10-30 已清空 `/opt/quiz-backups/`，当前唯一恢复点是本机 `D:\Backups\quiz-aliyun\quiz-20261030-manual.dump`；下方历史 SQL 中提到的备份表均已删除，仅作执行记录。


### 2026-10-29 批次（已执行于生产）

| 文件 | 用途 |
|---|---|
| `schema_soft_delete_20261029.sql` | `practice_session` / `practice_answer` / `wrong_question` 增加 `deleted_at`；清空历史改为软删除；错题再次答错时触发器恢复错题行 |
| `data_write_chapter_names_20261029.sql` | S5/S6 根章名称改为「操作系统配置与管理（Windows 10）」「Linux 配置与管理（CentOS7）」；备份表 `t_chapter_backup_20261029_s5s6` |
| `data_write_chapter_xa_empty_20261029.sql` | 软删除两个空的 XA「未分类」根节点（id 18、37）；备份表 `t_chapter_backup_20261029_xa_empty`；X9 两个节点有题/知识点，暂留 |
| `data_write_knowledge_s1_1_outline_20261029.sql` | S1-1 按大纲三个三级条目重排：82 条保留 55（239:34 / 240:18 / 241:3），移出 23、软删 4；备份表 `t_knowledge_point_backup_20261029_s1_1` |
| `data_write_feedback_resolve_20261029.sql` | 处理 19 条待处理反馈：修正 7 道题题干/选项/解析，合并 9 个重复题并迁移引用，扩展 8 条探测反馈；备份表 `t_question_backup_20261029_feedback` |


### 2026-10-30 批次（已执行于生产）

| 文件 | 用途 |
|---|---|
| `data_write_probe_cleanup_20261030.sql` | 清理 8 个探测账号（qz_probe/qz_idor/jwtma/rst/race/bfla/vpw/vd）及其 51 个会话、15 条答案、11 条错题、2 条收藏、8 条反馈；备份表 `t_probe_backup_20261030_*` |
| `data_write_feedback_382823_20261030.sql` | 处理反馈 51：补全 382823 题干填空标记和解析；备份表 `t_question_backup_20261030_feedback` |
| `schema_feedback_question_nullable_20261030.sql` | `feedback.question_id` 允许为空，联系作者反馈不关联具体题目 |
| `data_write_feedback_57_60_20261030.sql` | 处理反馈 57–61：364975/364976 改为单选题并重排选项，365467 清理混入的答案/解析，366238 补解析，测试作者消息关闭；备份表 `t_question_backup_20261030_feedback_57_60` |

> **2026-10-30 备份清理**：本页登记的所有 `*_backup_*` 表（143 张）已删除；服务器 `/opt/quiz-backups`、本地旧 dump/CSV/assets、`/tmp` 旧归档、`/opt/quiz-migrate/supabase.dump` 已清理。仅保留本机 `D:\Backups\quiz-aliyun\quiz-20261030-manual.dump`，并已通过临时库恢复演练。该 dump 是清理前快照，包含当时 143 张备份表；恢复它会回到清理前状态。历史 SQL 里的“备份表”只表示当时执行时创建的对象，现已不存在。

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
| `backup-cron.sh` | 每日 DB + 每周图片备份（700/600 权限）；2026-10-30 已清空备份目录，cron 保留 |
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
- 当前项目结论见 `project/项目状态与待办_20261030.md`；待办见 `project/待办_20261030.md`（本机保留，不进 Git）；`project/archive/20261027/项目交接_20261027.md` 为历史交接
- 知识点内容质量见 `project/知识点内容审计_20261028.md`；AI 重建/改动较大的待复核清单见 `project/知识点清洗待复核_20261028.md`
- 历史状态/交接见 `project/archive/`；过程评审见 `private/delivery-20261026/`（历史参考，不作为当前结论）
