-- 2026-10-29：软删除两个空的 XA「未分类」重复根节点（id 18、37）
-- 备份：t_chapter_backup_20261029_xa_empty
-- 注意：X9 两个根节点分别挂有 47 道题和 18 条知识点，暂不删除
begin;

create table t_chapter_backup_20261029_xa_empty as
select * from t_chapter where id in (18, 37) and not deleted;

update t_chapter
   set deleted = true
 where id in (18, 37)
   and not deleted
   and not exists (select 1 from t_chapter c where c.parent_id = t_chapter.id and not c.deleted)
   and not exists (select 1 from t_knowledge_point k where k.node_id = t_chapter.id and not k.deleted)
   and not exists (select 1 from t_question q where q.chapter_id = t_chapter.id and not q.deleted);

do $$
declare
  alive int;
begin
  select count(*) into alive from t_chapter where id in (18, 37) and not deleted;
  if alive <> 0 then
    raise exception 'XA 空节点未全部软删，剩余 %', alive;
  end if;
end $$;

commit;
