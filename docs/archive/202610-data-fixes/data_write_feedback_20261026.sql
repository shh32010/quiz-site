-- 2026-10-26：处理题目反馈
-- 25 / 334440：C 选项与 D 选项同时为错误项，把 C 改为正确的 CISC 表述，保留答案 D
-- 28 / 335849：B 选项“数值最多由8字节组成”改为“一次最多能并行处理8字节（64位）的数据”
-- 26 / 335757：反馈内容为“111”，题目与答案核对无误，不改题
-- 27 / 335843：重复题 336899，待用户确认软删，暂不处理
-- 备份：/opt/quiz-backups/feedback_questions_20261026.csv、feedback_20261026_before.csv
begin;

update t_question
   set option_json = jsonb_set(
         option_json::jsonb, '{B}',
         to_jsonb('一次最多能并行处理 8 字节（64 位）的数据'::text)
       )::text,
       analysis = '字长指 CPU 一次能并行处理的二进制位数；64 位 = 8 字节。B 选项表述为“一次最多能并行处理 8 字节（64 位）的数据”，故选 B。'
 where id = 335849 and not is_golden;

update t_question
   set option_json = jsonb_set(
         option_json::jsonb, '{C}',
         to_jsonb('目前大多数 PC 机的 CPU 指令系统属于 CISC 类型'::text)
       )::text,
       analysis = 'A、B、C 均正确；CISC 芯片设计通常更复杂，D 说“复杂度更低”错误，故选 D。'
 where id = 334440 and not is_golden;

do $$
declare
  n int;
begin
  select count(*) into n from t_question
   where id = 335849
     and option_json::jsonb ->> 'B' = '一次最多能并行处理 8 字节（64 位）的数据';
  if n <> 1 then raise exception '335849 选项 B 更新失败'; end if;

  select count(*) into n from t_question
   where id = 334440
     and option_json::jsonb ->> 'C' = '目前大多数 PC 机的 CPU 指令系统属于 CISC 类型';
  if n <> 1 then raise exception '334440 选项 C 更新失败'; end if;
end $$;

update feedback
   set status = 'handled',
       admin_note = 'B 选项已改为“一次最多能并行处理 8 字节（64 位）的数据”，答案仍为 B。',
       handled_at = now()
 where id = 28 and status = 'open';

update feedback
   set status = 'handled',
       admin_note = 'C 选项已改为“目前大多数 PC 机的 CPU 指令系统属于 CISC 类型”，D 仍为唯一错误项。',
       handled_at = now()
 where id = 25 and status = 'open';

update feedback
   set status = 'handled',
       admin_note = '反馈内容为测试字符“111”，题目与答案核对无误，无需改题。',
       handled_at = now()
 where id = 26 and status = 'open';

do $$
declare
  n int;
begin
  select count(*) into n from feedback where id in (28, 25, 26) and status = 'handled';
  if n <> 3 then raise exception '反馈状态更新失败：%', n; end if;
end $$;

commit;
