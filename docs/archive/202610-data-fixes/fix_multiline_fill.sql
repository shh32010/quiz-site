-- 修复程序输出类填空题的答案格式（2026-10-20）
-- 统一用中文分号「；」分隔多个输出/空位；去掉「填空一」「（换行）」等标注
-- 只调整答案编码，不改变正确答案内容

BEGIN;

-- 三种基本结构：3 个空
UPDATE t_question SET
  correct = '顺序结构；选择结构；循环结构', blank_count = 3
WHERE id IN (338149, 361335);
UPDATE t_question SET stem = '结构化程序设计所规定的三种基本控制结构是____、____、____。'
WHERE id = 361335;

-- 程序输出：两行输出用分号分隔
UPDATE t_question SET
  correct = 'x=1 y=2 *sum*=3；10 Squared is :100', blank_count = 2
WHERE id = 364984;
UPDATE t_question SET
  correct = '**1**；**3**', blank_count = 2
WHERE id = 365031;
-- 输出为 "#&"、空行、"*"；空行不作为独立空位，按两段处理
UPDATE t_question SET
  correct = '#&；*', blank_count = 2
WHERE id = 365061;

-- 单空题的「填空一」标注清理
UPDATE t_question SET correct = '分号', blank_count = 1 WHERE id = 366967;
UPDATE t_question SET correct = 'main', blank_count = 1 WHERE id = 366970;
UPDATE t_question SET correct = '结构化', blank_count = 1 WHERE id = 366971;
UPDATE t_question SET correct = '1', blank_count = 1 WHERE id = 366973;
UPDATE t_question SET correct = '40', blank_count = 1 WHERE id = 382544;

-- 两空题
UPDATE t_question SET correct = '{；}', blank_count = 2 WHERE id = 366968;

-- 381893 题干只有一个空，答案里混入了下一题内容
UPDATE t_question SET correct = 'CREATE', blank_count = 1 WHERE id = 381893;

-- 三空题
UPDATE t_question SET correct = '10；4；5', blank_count = 3 WHERE id = 382542;
UPDATE t_question SET correct = 'zero；one；one', blank_count = 3 WHERE id = 384747;

-- 382543：输出 17,21,11，兼容中英文逗号
UPDATE t_question SET
  correct = '17,21,11¦17，21，11', blank_count = 1
WHERE id = 382543;

COMMIT;
