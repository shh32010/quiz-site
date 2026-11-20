-- 2026-11-20 反馈处理：4 道题干/解析修正 + 3 道核对无误 + 反馈闭环
-- 反馈 76-82（均来自 admin/shh32010）；修正后清理相关做题记录并重算会话 302
BEGIN;

CREATE TABLE IF NOT EXISTS t_question_backup_20261120_feedback AS
SELECT * FROM t_question WHERE id IN (337020, 337455, 361202, 367981);

CREATE TABLE IF NOT EXISTS feedback_backup_20261120 AS
SELECT * FROM feedback WHERE id BETWEEN 76 AND 82;

CREATE TABLE IF NOT EXISTS practice_answer_backup_20261120_feedback AS
SELECT * FROM practice_answer WHERE question_id IN (337020, 337455, 361202, 367981);

CREATE TABLE IF NOT EXISTS wrong_question_backup_20261120_feedback AS
SELECT * FROM wrong_question WHERE question_id IN (337020, 337455, 361202, 367981);

CREATE TABLE IF NOT EXISTS practice_session_backup_20261120_feedback AS
SELECT * FROM practice_session WHERE id = 302;

-- 1) 337020：解析残缺重写（答案 C 不变）
UPDATE t_question SET analysis = 'USB 采用串行方式传输数据，D 项“并行方式”错误；USB 2.0 理论速率 480 Mbps，约为 USB 1.1（12 Mbps）的 40 倍，B 项“快一倍”错误；USB 连接器与 PC 并口连接器外形差异明显，A 项错误；USB 可通过连接器引脚向外设供电，C 项正确。故选 C。'
 WHERE id = 337020;

-- 2) 337455：题干英文 OCR 图注替换为中文图注（答案 A 不变）
UPDATE t_question SET stem = '图 26 中所示的记录数据的特征属于（）

（图示：圆形盘片表面分布着同心圆状的磁道，中心有一个深色扇区）

图26'
 WHERE id = 337455;

-- 3) 361202：题干补空线（答案 A 不变）
UPDATE t_question SET stem = 'CPU 的接口种类很多，现在大多数 CPU 的接口为 ____ 接口。'
 WHERE id = 361202;

-- 4) 367981：题干去除 OCR 标记与格式错乱（答案不变）
UPDATE t_question SET stem = '（资料题，6 分）

【综合题】

功能：删除字符串中的空格。

程序代码如下：

main(){
    char s[100] = {"You can you up! No Can no BBI Eng"};
    int i, j;
    /*代码开始*/

    /*代码结束*/
    printf("%s\n", s);
}

运行输出结果：

Youcanyouup!NoCannoBBI'
 WHERE id = 367981;

-- 5) 清做题记录：按 question_id 全量硬删（所有用户）
DELETE FROM practice_answer WHERE question_id IN (337020, 337455, 361202, 367981);
DELETE FROM wrong_question WHERE question_id IN (337020, 337455, 361202, 367981);

-- 6) 重算受影响会话 302（分数=作答得分和，总分=作答题目分值和）
UPDATE practice_session s SET
  score = (SELECT coalesce(sum(pa.score_got), 0) FROM practice_answer pa WHERE pa.session_id = 302 AND pa.deleted_at IS NULL),
  correct_count = (SELECT count(*) FROM practice_answer pa WHERE pa.session_id = 302 AND pa.deleted_at IS NULL AND pa.is_correct),
  question_count = (SELECT count(*) FROM practice_answer pa WHERE pa.session_id = 302 AND pa.deleted_at IS NULL),
  total_score = (SELECT coalesce(sum(q.score), 0) FROM practice_answer pa JOIN t_question q ON q.id = pa.question_id WHERE pa.session_id = 302 AND pa.deleted_at IS NULL)
 WHERE s.id = 302;

-- 7) 反馈闭环与回复
UPDATE feedback SET status = 'handled', handled_at = now(),
  admin_note = '已核对并修正：题干缺少空线，已补为「现在大多数 CPU 的接口为 ____ 接口」；答案 A（针脚式）不变，并已清理该题所有人的做题记录。'
 WHERE id = 76;

UPDATE feedback SET status = 'handled', handled_at = now(),
  admin_note = '已核对：1MB = 1024 × 1024 字节，答案 A 与解析均正确，无需修改，已标记处理。'
 WHERE id = 77;

UPDATE feedback SET status = 'handled', handled_at = now(),
  admin_note = '已核对并修正：题干中夹杂英文 OCR 图注，已替换为中文图注（圆形盘片同心圆磁道）；答案 A（磁盘）不变，并已清理该题所有人的做题记录。'
 WHERE id = 78;

UPDATE feedback SET status = 'handled', handled_at = now(),
  admin_note = '已核对并修正：答案 C 正确，原解析残缺不通顺，已重写为完整的逐项解析；并已清理该题所有人的做题记录。'
 WHERE id = 79;

UPDATE feedback SET status = 'handled', handled_at = now(),
  admin_note = '已核对：判断题答案 B（错）与解析一致，题干无缺漏，无需修改，已标记处理。'
 WHERE id = 80;

UPDATE feedback SET status = 'handled', handled_at = now(),
  admin_note = '已核对：判断题答案「错」与解析一致，题干完整，无需修改，已标记处理。'
 WHERE id = 81;

UPDATE feedback SET status = 'handled', handled_at = now(),
  admin_note = '已核对并修正：题干残留 OCR 标记（javascript/txt）且代码格式错乱，已整理为干净的题干与运行结果；答案不变。'
 WHERE id = 82;

-- 8) 断言
DO $$
DECLARE
  v_open int;
  v_302 record;
BEGIN
  SELECT count(*) INTO v_open FROM feedback WHERE status = 'open';
  IF v_open <> 0 THEN
    RAISE EXCEPTION 'open 反馈未清零: %', v_open;
  END IF;
  IF (SELECT stem FROM t_question WHERE id = 361202) NOT LIKE '%____%' THEN
    RAISE EXCEPTION '361202 题干未更新';
  END IF;
  IF (SELECT analysis FROM t_question WHERE id = 337020) NOT LIKE '%40 倍%' THEN
    RAISE EXCEPTION '337020 解析未更新';
  END IF;
  IF (SELECT stem FROM t_question WHERE id = 337455) LIKE '%Circular diagram%' THEN
    RAISE EXCEPTION '337455 题干仍含英文 OCR';
  END IF;
  IF (SELECT stem FROM t_question WHERE id = 367981) LIKE '%javascript%' THEN
    RAISE EXCEPTION '367981 题干仍含 OCR 标记';
  END IF;
  SELECT score, total_score, correct_count, question_count INTO v_302
    FROM practice_session WHERE id = 302;
  IF v_302.score <> 83 OR v_302.total_score <> 144
     OR v_302.correct_count <> 46 OR v_302.question_count <> 77 THEN
    RAISE EXCEPTION '会话 302 重算不符: score=%, total=%, correct=%, count=%',
      v_302.score, v_302.total_score, v_302.correct_count, v_302.question_count;
  END IF;
END $$;

COMMIT;
