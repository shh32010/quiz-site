-- 2026-11-13 修复 node 64 trap callout 中反引号包裹 ==-128 ~ +127== 导致红色标记未解析的问题，并转为行内数学公式
begin;

do $$
declare
  old_rev record;
  v_rev integer;
  v_blocks jsonb;
  v_search text;
  v_old_txt text := '设机器字长为 n 位： • n 位原码整数范围：\(-(2^{n-1} - 1) \sim +(2^{n-1} - 1)\)（如 8 位为 `-127 ~ +127`，0 有两种表示）； • n 位补码整数范围：\(-2^{n-1} \sim +(2^{n-1} - 1)\)（如 8 位为 `==-128 ~ +127==`，负数比正数多一个最小负数）；考试常考极限值边界，切勿混淆两者的取值范围！';
  v_new_txt text := '设机器字长为 n 位： • n 位原码整数范围：\(-(2^{n-1} - 1) \sim +(2^{n-1} - 1)\)（如 8 位为 \(-127 \sim +127\)，0 有两种表示）； • n 位补码整数范围：\(-2^{n-1} \sim +(2^{n-1} - 1)\)（如 8 位为 ==\(-128 \sim +127\)==，负数比正数多一个最小负数）；考试常考极限值边界，切勿混淆两者的取值范围！';
begin
  select r.rev_no, r.blocks, r.html, r.search_text, r.source_ref
    into old_rev
    from kb_entry e
    join kb_revision r on r.node_id = e.node_id and r.rev_no = e.published_rev
   where e.node_id = 64;

  if not found then
    raise exception 'node 64 找不到已发布 revision';
  end if;
  if old_rev.rev_no <> 8 then
    raise exception 'node 64 expected rev 8, got %', old_rev.rev_no;
  end if;
  if old_rev.blocks->6->>'id' <> 'a1-1-7-3-b7' then
    raise exception 'node 64 block[6] unexpected id %', old_rev.blocks->6->>'id';
  end if;
  if old_rev.blocks->6->>'text' <> v_old_txt then
    raise exception 'node 64 block[6] text mismatch: %', old_rev.blocks->6->>'text';
  end if;

  v_blocks := jsonb_set(old_rev.blocks, '{6,text}', to_jsonb(v_new_txt));
  v_search := replace(
    replace(old_rev.search_text, '`-127 ~ +127`', '-127 ~ +127'),
    '`-128 ~ +127`',
    '-128 ~ +127'
  );

  select coalesce(max(rev_no), 0) + 1 into v_rev
    from kb_revision
   where node_id = 64;

  insert into kb_revision (node_id, rev_no, blocks, html, search_text, source_ref)
  values (64, v_rev, v_blocks, old_rev.html, v_search, old_rev.source_ref);

  update kb_entry
     set published_rev = v_rev,
         updated_at = now()
   where node_id = 64;
end $$;

commit;
