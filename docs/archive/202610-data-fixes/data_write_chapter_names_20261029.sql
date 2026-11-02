-- 2026-10-29：S5/S6 课程根节点名称与考试大纲对齐
-- 备份：t_chapter_backup_20261029_s5s6
begin;

create table t_chapter_backup_20261029_s5s6 as
select * from t_chapter where code in ('S5', 'S6') and not deleted;

update t_chapter
   set name = '操作系统配置与管理（Windows 10）'
 where code = 'S5' and not deleted;

update t_chapter
   set name = 'Linux 配置与管理（CentOS7）'
 where code = 'S6' and not deleted;

do $$
declare
  s5 text;
  s6 text;
begin
  select name into s5 from t_chapter where code = 'S5' and not deleted;
  select name into s6 from t_chapter where code = 'S6' and not deleted;
  if s5 <> '操作系统配置与管理（Windows 10）' then
    raise exception 'S5 名称未更新: %', s5;
  end if;
  if s6 <> 'Linux 配置与管理（CentOS7）' then
    raise exception 'S6 名称未更新: %', s6;
  end if;
end $$;

commit;
