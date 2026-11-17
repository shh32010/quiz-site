-- 2026-11-17 题库反馈批量修复
-- 范围：
--   1) 反馈 63-75（13 条，全部来自 shh32010 的 80 题自测 session 301）
--   2) 同错题 336533（解析误用“共享软件”内容）
--   3) 金标分类异常 381199（cat_l1 由“实操”改为“A”，只改分类，触发器允许）
--   4) 存储器层次结构同题簇去重：保留 335286，软删 337276/337377/359508/389762
-- 执行：
--   scp 本文件到服务器 /tmp/，然后
--   ssh aliyun "sudo -u postgres psql -d quiz -v ON_ERROR_STOP=1 -f /tmp/data_write_feedback_20261117.sql"
-- 说明：
--   - 备份表在本事务内创建；任何断言失败整体回滚
--   - 按“修题必清记录”规则，对题干/选项/答案有实质修改的题硬删作答与错题，并重算受影响会话
--   - 仅改解析/仅去“（ ）”前缀/仅改 cat_l1 的题不清记录

BEGIN;

-- ============================================================================
-- 1. 备份
-- ============================================================================
CREATE TABLE t_question_backup_20261117_feedback AS
SELECT * FROM t_question WHERE id IN (
  384101,367498,367313,336059,337377,337036,369468,335453,390047,
  335187,335169,359732,334683,336533,381199,337276,359508,389762,335286
);

CREATE TABLE feedback_backup_20261117 AS
SELECT * FROM feedback WHERE id BETWEEN 63 AND 75;

CREATE TABLE practice_answer_backup_20261117_feedback AS
SELECT * FROM practice_answer WHERE question_id IN (
  384101,367498,367313,337036,369468,335453,390047,359732,334683,337377
);

CREATE TABLE wrong_question_backup_20261117_feedback AS
SELECT * FROM wrong_question WHERE question_id IN (
  384101,367313,337036,335453,390047,337377,334683
);

CREATE TABLE practice_session_backup_20261117_feedback AS
SELECT * FROM practice_session WHERE id IN (281,301);

CREATE TABLE exam_paper_question_backup_20261117 AS
SELECT * FROM exam_paper_question WHERE paper_id=271 AND question_id=389762;

CREATE TABLE t_question_kp_backup_20261117_storage AS
SELECT * FROM t_question_kp WHERE question_id IN (337276,337377,359508,389762);

CREATE TABLE dup_storage_cluster_map_20261117 (
  keeper integer NOT NULL,
  deleted integer NOT NULL,
  note text NOT NULL,
  PRIMARY KEY (keeper, deleted)
);

INSERT INTO dup_storage_cluster_map_20261117 VALUES
  (335286, 337276, '答案 D 错误，无图'),
  (335286, 337377, '无图，反馈 67'),
  (335286, 359508, 'OCR 乱，重复'),
  (335286, 389762, '重复，试卷 271 引用改挂 335286');

-- ============================================================================
-- 2. 备份数量与前置条件断言
-- ============================================================================
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question_backup_20261117_feedback;
  IF n <> 19 THEN RAISE EXCEPTION '题目备份数应为 19，实际 %', n; END IF;
  SELECT count(*) INTO n FROM feedback_backup_20261117;
  IF n <> 13 THEN RAISE EXCEPTION '反馈备份数应为 13，实际 %', n; END IF;
  SELECT count(*) INTO n FROM practice_answer_backup_20261117_feedback;
  IF n <> 11 THEN RAISE EXCEPTION '作答备份数应为 11，实际 %', n; END IF;
  SELECT count(*) INTO n FROM wrong_question_backup_20261117_feedback;
  IF n <> 7 THEN RAISE EXCEPTION '错题备份数应为 7，实际 %', n; END IF;
  SELECT count(*) INTO n FROM practice_session_backup_20261117_feedback;
  IF n <> 2 THEN RAISE EXCEPTION '会话备份数应为 2，实际 %', n; END IF;
  SELECT count(*) INTO n FROM exam_paper_question_backup_20261117;
  IF n <> 1 THEN RAISE EXCEPTION '试卷引用备份数应为 1，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question_kp_backup_20261117_storage;
  IF n <> 11 THEN RAISE EXCEPTION '知识点关联备份数应为 11，实际 %', n; END IF;
  SELECT count(*) INTO n FROM feedback WHERE status='open';
  IF n <> 13 THEN RAISE EXCEPTION 'open 反馈应为 13，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标应为 200，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE id IN (
    384101,367498,367313,336059,337036,369468,335453,390047,335187,335169,359732,334683,336533
  ) AND is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '待改内容题中含金标 % 道', n; END IF;
END $$;

-- ============================================================================
-- 3. 逐题修复
-- ============================================================================

-- 反馈 63：384101 改为精确单选
UPDATE t_question SET
  stem='十进制数 89.625 转换成二进制数是____。',
  option_json='{"A": "1011001.101", "B": "1011011.1", "C": "1011001", "D": "1010011.1"}',
  correct='A',
  analysis='89=1011001B，0.625=0.101B，所以 89.625=1011001.101B，故选 A。',
  qc_grade='good', answer_check='match'
WHERE id=384101 AND NOT is_golden;

-- 反馈 64：367498 补填空线
UPDATE t_question SET
  stem='打印机与主机的连接目前除使用并行口之外，还广泛采用________接口。',
  qc_grade='good', answer_check='match'
WHERE id=367498 AND NOT is_golden;

-- 反馈 65：367313 去掉题干末尾重复的 KB，选项去掉 LaTeX
UPDATE t_question SET
  stem='在微机中，若主存储器的地址编号为 0000H 到 7FFFH，则该存储器容量为________。',
  option_json='{"A": "32KB", "B": "7FFFB", "C": "1MB", "D": "8000B"}',
  correct='A',
  analysis='地址编号 0000H～7FFFH 共 8000H=32768 字节=32KB，故选 A。',
  qc_grade='good', answer_check='match'
WHERE id=367313 AND NOT is_golden;

-- 反馈 66：336059 解析与题干无关；同错的 336533 一并修正
UPDATE t_question SET
  analysis='计算机存储容量的基本单位是字节（Byte），故选 B。',
  qc_grade='good', answer_check='match'
WHERE id IN (336059,336533) AND NOT is_golden;

-- 反馈 68：337036 补填空线，重写自相矛盾的解析
UPDATE t_question SET
  stem='下列各数都是五进制数，其中____对应的十进制数是偶数。',
  correct='B',
  analysis='101₅=1×25+0×5+1=26，是偶数；111₅=31、131₅=41、100₅=25 均为奇数，故选 B。',
  qc_grade='good', answer_check='match'
WHERE id=337036 AND NOT is_golden;

-- 反馈 69：369468 题干已有 ms，选项统一为数字
UPDATE t_question SET
  option_json='{"A": "10", "B": "5", "C": "15", "D": "20"}',
  correct='B', qc_grade='good', answer_check='match'
WHERE id=369468 AND NOT is_golden;

-- 反馈 70：335453 选项 B 的 H 应为 J，答案恢复为 B,C
UPDATE t_question SET
  stem='以下有关键盘的叙述，正确的有____。',
  option_json='{"A": "键盘是计算机必不可少的输入设备，目前主流的键盘大多数是电容式的按键", "B": "键盘上的盲打定位键是“F”和“J”两个键", "C": "无线键盘采用蓝牙、红外线等无线通信技术，与主机相连", "D": "电容式键盘的特点是击键声音大，无触点，不存在磨损和接触不良问题，寿命较长，手感好"}',
  correct='B,C',
  analysis='盲打定位键是 F 和 J，B 正确；无线键盘采用蓝牙、红外线等无线技术，C 正确。A 中键盘并非必不可少的输入设备，且主流键盘多为薄膜式；D 中电容式键盘击键声音小，故 A、D 错误。',
  answer_ai='B,C｜盲打定位键为 F 和 J，故 B 正确；无线键盘用蓝牙/红外，C 正确；A、D 错误。',
  qc_grade='good', answer_check='match'
WHERE id=335453 AND NOT is_golden;

-- 反馈 71：390047 清理选项 A 的 HTML 实体
UPDATE t_question SET
  option_json='{"A": "字长", "B": "存储容量", "C": "时延", "D": "运算速度"}',
  correct='A,B,D', qc_grade='good', answer_check='match'
WHERE id=390047 AND NOT is_golden;

-- 反馈 72：335187 去掉题干开头的“（ ）”
UPDATE t_question SET
  stem='针式打印机是一种击打式打印机，噪音大，速度慢，且打印质量低，目前已经完全被淘汰。',
  qc_grade='good'
WHERE id=335187 AND NOT is_golden;

-- 反馈 73：335169 去掉题干开头的“（ ）”
UPDATE t_question SET
  stem='PC机主板上的芯片组（chipset）是各组成部分的枢纽，Pentium4 CPU 所使用的芯片组只包括 BIOS 和CMOS两个集成电路。',
  qc_grade='good'
WHERE id=335169 AND NOT is_golden;

-- 反馈 74：359732 按同题 335383 补全被 OCR 截断的题干
UPDATE t_question SET
  stem='显示屏的尺寸是显示器的主要参数之一，目前常用的显示器有 15 英寸、17 英寸、19 英寸等，CRT 显示屏的水平与垂直方向之比一般为 4:3。',
  analysis='传统 CRT 显示屏的水平与垂直方向之比一般为 4:3，故该说法正确。',
  qc_grade='good', answer_check='match'
WHERE id=359732 AND NOT is_golden;

-- 反馈 75：334683 修复残缺填空线，解析去掉开头冒号
UPDATE t_question SET
  stem='CPU 通常由寄存器组、____等 3 个部分组成。',
  analysis='CPU 通常由寄存器组、运算器和控制器 3 个部分组成。',
  qc_grade='good', answer_check='match'
WHERE id=334683 AND NOT is_golden;

-- 金标分类异常：381199 只改 cat_l1，金标触发器允许
UPDATE t_question SET cat_l1='A' WHERE id=381199 AND is_golden;

-- ============================================================================
-- 4. 存储器层次结构同题簇去重
-- ============================================================================
UPDATE t_question SET deleted=true
WHERE id IN (337276,337377,359508,389762) AND NOT is_golden AND NOT deleted;

-- 试卷 271 的引用改挂保留题 335286；题面/选项/答案一致，卷面题量分值不变
UPDATE exam_paper_question SET question_id=335286
WHERE paper_id=271 AND question_id=389762;

-- 合并被删题的知识点关联到 335286，重复的不再插入
WITH base AS MATERIALIZED (
  SELECT coalesce(max(id),0) AS max_id FROM t_question_kp
), src AS (
  SELECT question_id, kp_id, match_source, confidence
  FROM t_question_kp
  WHERE question_id IN (337276,337377,359508,389762)
)
INSERT INTO t_question_kp (id, question_id, kp_id, match_source, confidence)
SELECT base.max_id + row_number() OVER (ORDER BY src.question_id, src.kp_id),
       335286, src.kp_id, src.match_source, src.confidence
FROM src CROSS JOIN base
ON CONFLICT (question_id, kp_id) DO NOTHING;

-- ============================================================================
-- 5. 清理做题记录（按“修题必清记录”规则）
-- ============================================================================
DELETE FROM practice_answer WHERE question_id IN (
  384101,367498,367313,337036,369468,335453,390047,359732,334683,337377
);

DELETE FROM wrong_question WHERE question_id IN (
  384101,367313,337036,335453,390047,337377,334683
);

-- ============================================================================
-- 6. 重算受影响会话
-- ============================================================================
-- 只重算已交卷会话；未结束会话在下次交卷时由 finish_session 统一重算
UPDATE practice_session s
SET score=coalesce((SELECT sum(a.score_got) FROM practice_answer a WHERE a.session_id=s.id),0),
    correct_count=coalesce((SELECT count(*) FROM practice_answer a WHERE a.session_id=s.id AND a.is_correct),0)
WHERE s.id IN (281,301) AND s.finished_at IS NOT NULL;

-- ============================================================================
-- 7. 反馈处理
-- ============================================================================
UPDATE feedback f
SET status='handled', admin_note=v.note, handled_at=now()
FROM (VALUES
  (63, '89.625 的精确二进制为 1011001.101；已将本题改为精确单选，选项 A 改为 1011001.101，题干去掉“大约”。'),
  (64, '题干缺少填空线，已补为“还广泛采用________接口”。'),
  (65, '题干末尾“KB”与选项单位重复，已改为“容量为________”，选项统一为 32KB/7FFFB/1MB/8000B。'),
  (66, '原解析误用了“共享软件”内容，已重写为存储容量单位解析；同错的 336533 一并修正。'),
  (67, '题干缺配图；同题簇已整理，保留带图的 335286，337276/337377/359508/389762 已软删，试卷 271 改挂 335286，知识点已合并。'),
  (68, '题干补填空线；解析原来自相矛盾，已按 101₅=26（偶数）重写，答案 B。'),
  (69, '题干已有“ms”，选项又带单位；已统一为 10/5/15/20。'),
  (70, '选项 B 的盲打定位键应为 F 和 J（原误写 H），已改正；答案恢复为 B,C，解析重写。'),
  (71, '选项 A 的 HTML 实体已清理为“字长”。'),
  (72, '判断题答案 B 核对无误；已去掉题干开头的“（ ）”前缀。'),
  (73, '判断题答案 B 核对无误；已去掉题干开头的“（ ）”前缀。'),
  (74, '题干 OCR 截断，已按同题 335383 补全为完整表述。'),
  (75, '填空题空线残缺，已改为“寄存器组、____等 3 个部分组成”；解析去掉开头冒号。')
) AS v(id, note)
WHERE f.id=v.id AND f.status='open';

-- ============================================================================
-- 8. 事后断言
-- ============================================================================
DO $$
DECLARE n int; sc int; cc int;
BEGIN
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted;
  IF n <> 44696 THEN RAISE EXCEPTION '活跃题应为 44696，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status='ok';
  IF n <> 44451 THEN RAISE EXCEPTION '可练题应为 44451，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE deleted;
  IF n <> 9520 THEN RAISE EXCEPTION '软删题应为 9520，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标应为 200，实际 %', n; END IF;
  SELECT count(*) INTO n FROM feedback WHERE status='open';
  IF n <> 0 THEN RAISE EXCEPTION '仍有 open 反馈 %', n; END IF;
  SELECT count(*) INTO n FROM practice_answer WHERE question_id IN (
    384101,367498,367313,337036,369468,335453,390047,359732,334683,337377);
  IF n <> 0 THEN RAISE EXCEPTION '仍有作答 %', n; END IF;
  SELECT count(*) INTO n FROM wrong_question WHERE question_id IN (
    384101,367313,337036,335453,390047,337377,334683);
  IF n <> 0 THEN RAISE EXCEPTION '仍有错题 %', n; END IF;
  SELECT score, correct_count INTO sc, cc FROM practice_session WHERE id=301;
  IF sc <> 91 OR cc <> 47 THEN RAISE EXCEPTION 'session 301 应为 91/47，实际 %/%', sc, cc; END IF;
  SELECT score, correct_count INTO sc, cc FROM practice_session WHERE id=281;
  IF sc <> 0 OR cc <> 0 THEN RAISE EXCEPTION 'session 281 应为 0/0，实际 %/%', sc, cc; END IF;
  SELECT count(*) INTO n FROM exam_paper_question WHERE paper_id=271 AND question_id=335286;
  IF n <> 1 THEN RAISE EXCEPTION '试卷 271 未挂 335286'; END IF;
  SELECT count(*) INTO n FROM exam_paper_question WHERE paper_id=271 AND question_id=389762;
  IF n <> 0 THEN RAISE EXCEPTION '试卷 271 仍挂 389762'; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status='ok' AND cat_l1='实操';
  IF n <> 0 THEN RAISE EXCEPTION '仍有实操分类异常 %', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status='ok' AND qc_grade='error';
  IF n <> 850 THEN RAISE EXCEPTION 'qc error 应为 850，实际 %', n; END IF;
  SELECT sum(cnt) INTO n FROM v_course_counts;
  IF n <> 44451 THEN RAISE EXCEPTION '课程合计应为 44451，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question_kp WHERE question_id=335286;
  IF n < 3 THEN RAISE EXCEPTION '335286 知识点关联异常 %', n; END IF;
END $$;

COMMIT;
