-- 清理空重复根章（2026-10-28）
-- 15 个节点均无子章/知识点/题，且存在同 code/name 的真实节点。
-- 备份表 t_chapter_backup_20261028_empty；回滚：update t_chapter set deleted=false where id in (...)。
begin;
create table if not exists t_chapter_backup_20261028_empty as
select * from t_chapter where id in (13,16,17,25,26,27,28,29,30,31,32,33,34,35,38);
do $$
declare bad int;
begin
  select count(*) into bad
  from t_chapter c
  where c.id in (13,16,17,25,26,27,28,29,30,31,32,33,34,35,38)
    and not c.deleted
    and (
      exists (select 1 from t_chapter ch where ch.parent_id=c.id and not ch.deleted)
      or exists (select 1 from t_knowledge_point k where k.node_id=c.id and not k.deleted)
      or exists (select 1 from t_question q where q.chapter_id=c.id and not q.deleted)
    );
  if bad <> 0 then
    raise exception '空节点校验失败：% 个节点仍有内容', bad;
  end if;
end $$;
update t_chapter set deleted=true
where id in (13,16,17,25,26,27,28,29,30,31,32,33,34,35,38);
commit;
