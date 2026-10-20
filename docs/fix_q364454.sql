-- 修复填空题 364454（C 语言：求三个数最小值）
-- 问题：
--   1) 题干是原始 HTML（<br/>、&gt;），无法阅读
--   2) 标准答案带【1】【2】标签，判分函数逐空精确比对，永远填不对
--   3) blank_count 标成 3，实际 2 空
-- 处理：题干还原为多行代码并标出空位；答案改为纯空内容，第二空接受 min>z 等价写法（¦ 分隔备选答案）

BEGIN;

UPDATE t_question SET
  stem = '以下程序输出 x, y, z 三个数中的最小值，请完善程序。

int main()
{ int x,y,z,min ;
  scanf("%d %d %d", &x, &y, &z);
  if(x > y)
    【1】
  else
    min = x;
  if(【2】)
    min = z;
  printf("%d", min);
  return 0;
}',
  correct = 'min=y;；z<min¦min>z',
  analysis = '第一空：if(x>y) 成立说明 y 更小，应把 y 赋给 min，故填 min=y;。第二空：此时 min 已是 x、y 中的较小者，若 z 比 min 还小则把 z 赋给 min，故填 z<min（也可写成 min>z）。',
  blank_count = 2
WHERE id = 364454;

COMMIT;
