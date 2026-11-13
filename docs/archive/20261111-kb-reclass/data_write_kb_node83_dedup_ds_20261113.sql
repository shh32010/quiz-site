-- 2026-11-13 修正 node 83 (A2-2.4.4) 中 a2-2-4-4-b15 的重复前缀“5、数据结构化：数据结构化：”
begin;

do $$
declare
  old_rev record;
  v_rev integer;
  v_blocks jsonb;
  v_search text;
  v_old_item text := '5、==数据结构化==：^^数据结构化^^：==数据库系统中的数据面向整个单位的全局应用==，采用一定的数据模型（关系模型）进行描述和定义，因而数据具有整体结构化的特征。';
  v_new_item text := '5、==数据结构化==：==数据库系统中的数据面向整个单位的全局应用==，采用一定的数据模型（关系模型）进行描述和定义，因而数据具有整体结构化的特征。';
begin
  select r.rev_no, r.blocks, r.html, r.search_text, r.source_ref
    into old_rev
    from kb_entry e
    join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
   where e.node_id = 83;

  if not found then
    raise exception 'node 83 找不到已发布 revision';
  end if;
  if old_rev.rev_no <> 8 then
    raise exception 'node 83 expected rev 8, got %', old_rev.rev_no;
  end if;
  if old_rev.blocks->8->>'id' <> 'a2-2-4-4-b15' then
    raise exception 'node 83 blocks[8] unexpected id %', old_rev.blocks->8->>'id';
  end if;
  if old_rev.blocks->8->'items'->>5 <> v_old_item then
    raise exception 'node 83 blocks[8].items[5] unexpected text: %', old_rev.blocks->8->'items'->>5;
  end if;

  v_blocks := jsonb_set(old_rev.blocks, '{8,items,5}', to_jsonb(v_new_item));
  v_search := replace(old_rev.search_text, '5、数据结构化：数据结构化：', '5、数据结构化：');

  select coalesce(max(rev_no), 0) + 1 into v_rev
    from kb_revision
   where node_id = 83;

  insert into kb_revision (node_id, rev_no, blocks, html, search_text, source_ref)
  values (83, v_rev, v_blocks, old_rev.html, v_search, old_rev.source_ref);

  update kb_entry
     set published_rev = v_rev,
         updated_at = now()
   where node_id = 83;
end $$;

commit;
