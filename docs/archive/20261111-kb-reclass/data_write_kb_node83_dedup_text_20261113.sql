-- 2026-11-13 去掉 node 83 (A2-2.4.4) 中 #a2-2-4-4-b10 栈示意图下方 a2-2-4-4-b11 首条重复说明“top=0，表示栈空，top=m 表示栈满”
begin;

do $$
declare
  old_rev record;
  v_rev integer;
  v_items jsonb;
  v_blocks jsonb;
  v_search text;
begin
  select r.rev_no, r.blocks, r.html, r.search_text, r.source_ref
    into old_rev
    from kb_entry e
    join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
   where e.node_id = 83;

  if not found then
    raise exception 'node 83 找不到已发布 revision';
  end if;
  if old_rev.rev_no <> 7 then
    raise exception 'node 83 expected rev 7, got %', old_rev.rev_no;
  end if;
  if old_rev.blocks->4->>'id' <> 'a2-2-4-4-b11' then
    raise exception 'node 83 blocks[4] unexpected id %', old_rev.blocks->4->>'id';
  end if;
  if old_rev.blocks->4->'items'->>0 <> 'top=0，表示栈空，top=m 表示栈满' then
    raise exception 'node 83 blocks[4].items[0] unexpected text: %', old_rev.blocks->4->'items'->>0;
  end if;
  if old_rev.blocks->4->'items'->>1 <> '3、==队列==' then
    raise exception 'node 83 blocks[4].items[1] unexpected text: %', old_rev.blocks->4->'items'->>1;
  end if;

  v_items := (old_rev.blocks->4->'items') - 0;
  v_blocks := jsonb_set(old_rev.blocks, '{4,items}', v_items);
  v_search := replace(old_rev.search_text, ' top=0，表示栈空，top=m 表示栈满', '');

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
