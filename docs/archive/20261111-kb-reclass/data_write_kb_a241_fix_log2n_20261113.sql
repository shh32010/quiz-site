-- 2026-11-13 修复 A2-2.4.1 (node_id = 80) 中二分查找复杂度 log2n 为标准行内数学公式排版，并保留原文黑色字体
begin;
do $$
declare
  old_rev record;
  v_rev integer;
  v_old_item text;
  v_old_trap text;
  v_new_blocks jsonb;
  v_new_search text;
begin
  select rev_no, blocks, html, search_text, source_ref into old_rev
    from kb_revision
   where node_id = 80
     and rev_no = (select published_rev from kb_entry where node_id = 80);

  if not found then
    raise exception 'node 80 找不到已发布 revision';
  end if;

  v_old_item := old_rev.blocks #>> '{0,items,40}';
  if v_old_item is distinct from '==②、二分法查找：==二分法只适用于==顺序存储的有序表。==最坏比较次数为：log₂n 次。' then
    raise exception 'node 80 blocks[0].items[40] 内容与预期不符: %', v_old_item;
  end if;

  v_old_trap := old_rev.blocks #>> '{8,text}';
  if old_rev.blocks #>> '{8,id}' is distinct from 'a2-2-4-1-b9'
     or v_old_trap is distinct from '（1）==算法可以有 0 个输入，但必须至少有 1 个输出！==“程序可以是无穷的，算法必须是有穷的”。（2）==二分法查找只适用于顺序存储的有序表==（链式存储不可二分），最坏比较次数简记为 `log₂n`（严格上界为 `⌊log₂n⌋ + 1`）；^^时间复杂度不是程序实际运行的绝对秒数^^！' then
    raise exception 'node 80 blocks[8] (a2-2-4-1-b9) 内容与预期不符: %', v_old_trap;
  end if;

  v_new_blocks := jsonb_set(
    old_rev.blocks,
    '{0,items,40}',
    to_jsonb('==②、二分法查找：==二分法只适用于==顺序存储的有序表。==最坏比较次数为：\(\log_2 n\) 次。'::text)
  );
  v_new_blocks := jsonb_set(
    v_new_blocks,
    '{8,text}',
    to_jsonb('（1）==算法可以有 0 个输入，但必须至少有 1 个输出！==“程序可以是无穷的，算法必须是有穷的”。（2）==二分法查找只适用于顺序存储的有序表==（链式存储不可二分），最坏比较次数简记为 \(\log_2 n\)（严格上界为 \(\lfloor \log_2 n \rfloor + 1\)）；^^时间复杂度不是程序实际运行的绝对秒数^^！'::text)
  );

  v_new_search := replace(
    old_rev.search_text,
    '简记为 `log₂n`（严格上界为 `⌊log₂n⌋ + 1`）',
    '简记为 log₂n / log2n（严格上界为 ⌊log₂n⌋ + 1）'
  );

  select coalesce(max(rev_no), 0) + 1 into v_rev from kb_revision where node_id = 80;
  insert into kb_revision(node_id, rev_no, blocks, html, search_text, source_ref)
  values (80, v_rev, v_new_blocks, old_rev.html, v_new_search, old_rev.source_ref);

  update kb_entry set published_rev = v_rev, updated_at = now() where node_id = 80;
end $$;
commit;
