-- 历史数据 HTML 清理（2026-10-20）
-- 仅做机械转换，不改题目内容：
--   <br/>、<br>、<br /> → 换行
--   &quot; → "，&#x27; → '，&lt; → <，&gt; → >，&amp; → &
-- 处理列：stem、analysis、correct（option_json 是 JSON，动了会破坏格式，保持原样由前端展示层处理）

BEGIN;

UPDATE t_question SET
  stem = replace(replace(replace(replace(replace(
           regexp_replace(stem, '<br\s*/?>', E'\n', 'gi'),
           '&quot;', '"'), '&#x27;', ''''), '&lt;', '<'), '&gt;', '>'), '&amp;', '&'),
  analysis = replace(replace(replace(replace(replace(
           regexp_replace(analysis, '<br\s*/?>', E'\n', 'gi'),
           '&quot;', '"'), '&#x27;', ''''), '&lt;', '<'), '&gt;', '>'), '&amp;', '&'),
  correct = replace(replace(replace(replace(replace(
           regexp_replace(correct, '<br\s*/?>', E'\n', 'gi'),
           '&quot;', '"'), '&#x27;', ''''), '&lt;', '<'), '&gt;', '>'), '&amp;', '&')
WHERE stem ~* '<br|&(quot|#x27|lt|gt|amp);'
   OR analysis ~* '<br|&(quot|#x27|lt|gt|amp);'
   OR correct ~* '<br|&(quot|#x27|lt|gt|amp);';

-- 校验：残留应为 0
SELECT
  count(*) FILTER (WHERE stem ~* '<br|&(quot|#x27|lt|gt|amp);')     AS stem_left,
  count(*) FILTER (WHERE correct ~* '<br|&(quot|#x27|lt|gt|amp);')  AS correct_left,
  count(*) FILTER (WHERE analysis ~* '<br|&(quot|#x27|lt|gt|amp);') AS analysis_left
FROM t_question;

COMMIT;
