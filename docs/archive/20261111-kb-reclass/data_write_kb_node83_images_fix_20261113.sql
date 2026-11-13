-- 2026-11-13 更新 node 83 (A2-2.4.4) 两张完整版线性表/栈示意图并修正“②、退栈运算”红标错位
begin;

insert into kb_asset (sha256, path, w, h, kind, license)
values
  ('6584dce1f1577f8c87c74535c8160b394e3ce546d39c3f8b7b76cf51ead293d4', '/kb-assets/theory/p40_r0_6584dce1f1577f8c.png', 2000, 688, 'figure', 'reference-digest'),
  ('6a1300234d7d81c9eb3e853b8e6bcfbcccabb011d824107790949f1fc8fb79ff', '/kb-assets/theory/p40_r1_6a1300234d7d81c9.png', 2000, 766, 'figure', 'reference-digest')
on conflict (sha256) do nothing;

do $$
declare
  old_rev record;
  v_rev integer;
  v_blocks jsonb;
begin
  select r.rev_no, r.blocks, r.html, r.search_text, r.source_ref
    into old_rev
    from kb_entry e
    join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
   where e.node_id = 83;

  if not found then
    raise exception 'node 83 找不到已发布 revision';
  end if;
  if old_rev.rev_no <> 6 then
    raise exception 'node 83 expected rev 6, got %', old_rev.rev_no;
  end if;
  if old_rev.blocks->1->>'id' <> 'a2-2-4-4-b8' then
    raise exception 'node 83 blocks[1] unexpected id %', old_rev.blocks->1->>'id';
  end if;
  if old_rev.blocks->2->>'id' <> 'a2-2-4-4-b9' then
    raise exception 'node 83 blocks[2] unexpected id %', old_rev.blocks->2->>'id';
  end if;
  if old_rev.blocks->2->'items'->>8 <> '②、==退栈运==算，删除元素(取出栈顶元素并赋给一个指定的变量)；' then
    raise exception 'node 83 blocks[2].items[8] unexpected text: %', old_rev.blocks->2->'items'->>8;
  end if;
  if old_rev.blocks->3->>'id' <> 'a2-2-4-4-b10' then
    raise exception 'node 83 blocks[3] unexpected id %', old_rev.blocks->3->>'id';
  end if;

  v_blocks := old_rev.blocks;
  v_blocks := jsonb_set(v_blocks, '{1,src}', '"/kb-assets/theory/p40_r0_6584dce1f1577f8c.png"'::jsonb);
  v_blocks := jsonb_set(v_blocks, '{1,w}', '2000'::jsonb);
  v_blocks := jsonb_set(v_blocks, '{1,h}', '688'::jsonb);
  v_blocks := jsonb_set(v_blocks, '{2,items,8}', to_jsonb('②、==退栈运算==，删除元素(取出栈顶元素并赋给一个指定的变量)；'::text));
  v_blocks := jsonb_set(v_blocks, '{3,src}', '"/kb-assets/theory/p40_r1_6a1300234d7d81c9.png"'::jsonb);
  v_blocks := jsonb_set(v_blocks, '{3,w}', '2000'::jsonb);
  v_blocks := jsonb_set(v_blocks, '{3,h}', '766'::jsonb);

  select coalesce(max(rev_no), 0) + 1 into v_rev
    from kb_revision
   where node_id = 83;

  insert into kb_revision (node_id, rev_no, blocks, html, search_text, source_ref)
  values (83, v_rev, v_blocks, old_rev.html, old_rev.search_text, old_rev.source_ref);

  update kb_entry
     set published_rev = v_rev,
         updated_at = now()
   where node_id = 83;
end $$;

commit;
