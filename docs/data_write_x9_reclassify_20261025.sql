-- 2026-10-25：X9「未归入标准章节」15 道真题归位
-- 原则：不删除、不改题干/选项/答案，只改 subject_id / chapter_id / cat_* 分类字段
-- 归位后 X9 活跃题量为 0，/chapters 的“其他题目”块自动消失；活跃总数保持 44,570
-- 执行前自动备份原行到 t_question_x9_backup_20261025

begin;

create table if not exists t_question_x9_backup_20261025 as
select * from t_question
 where id in (388567,388600,388838,388843,389362,389644,389722,390063,
              390141,390142,390143,390144,390223,390378,390379);

do $$
declare
  n int;
begin
  select count(*) into n from t_question_x9_backup_20261025;
  if n <> 15 then
    raise exception 'X9 备份行数异常：期望 15，实际 %', n;
  end if;

  select count(*) into n
    from t_question
   where id in (388567,388600,388838,388843,389362,389644,389722,390063,
                390141,390142,390143,390144,390223,390378,390379)
     and not deleted and review_status = 'ok'
     and subject_id = 2 and chapter_id = 12;
  if n <> 15 then
    raise exception 'X9 待归位行数异常：期望 15，实际 %', n;
  end if;
end $$;

update t_question q
   set subject_id = v.subject_id,
       chapter_id = v.chapter_id,
       cat_l1 = v.cat_l1,
       cat_l2 = v.cat_l2,
       cat_l3 = v.cat_l3
  from (values
    -- Excel / Word 旧真题：与现有 Office 题一致，归入 A2-2.1 软件基本概念
    (388567, 4,  65, 'A', '2.1', null),          -- Excel 分类汇总
    (388600, 4,  65, 'A', '2.1', null),          -- Word 删除段落标记
    (388843, 4,  65, 'A', '2.1', null),          -- Excel 分类汇总（重复题）
    (389362, 4,  65, 'A', '2.1', null),          -- Word 页码只能从 1 开始
    (389644, 4,  65, 'A', '2.1', null),          -- Excel COUNTIF
    (390063, 4,  65, 'A', '2.1', null),          -- Word 首行/悬挂缩进
    (390143, 4,  65, 'A', '2.1', null),          -- Word 首字下沉
    (390144, 4,  65, 'A', '2.1', null),          -- Excel 税额计算
    (390223, 4,  65, 'A', '2.1', null),          -- Word 对齐方式
    -- Windows 基础操作：A2-2.2 操作系统
    (390142, 4,  68, 'A', '2.2', null),           -- PrintScreen
    -- 数据库理论：B1-1.5 关系数据库系统
    (388838, 4, 160, 'B', '1.5', '1.5.1'),        -- 数据逻辑独立性
    (390141, 4, 160, 'B', '1.5', '1.5.1'),        -- 物理/逻辑独立性
    (389722, 4, 161, 'B', '1.5', '1.5.2'),        -- E-R 图转关系模式
    -- MySQL 实操：S2 SQL 与视图
    (390378, 5, 279, 'S2', 'S2-3', 'S2-3.2'),     -- select 通配符 *
    (390379, 5, 284, 'S2', 'S2-4', 'S2-4.1')      -- drop view
  ) as v(id, subject_id, chapter_id, cat_l1, cat_l2, cat_l3)
 where q.id = v.id;

do $$
declare
  n int;
begin
  select count(*) into n
    from t_question
   where id in (388567,388600,388838,388843,389362,389644,389722,390063,
                390141,390142,390143,390144,390223,390378,390379)
     and subject_id in (4, 5)
     and chapter_id in (65, 68, 160, 161, 279, 284);
  if n <> 15 then
    raise exception 'X9 归位失败：期望 15，实际 %', n;
  end if;

  select count(*) into n
    from t_question
   where not deleted and review_status = 'ok' and chapter_id = 12;
  if n <> 0 then
    raise exception 'X9 仍有活跃题：%', n;
  end if;

  select count(*) into n
    from t_question
   where not deleted and review_status = 'ok';
  if n <> 44570 then
    raise exception '活跃题总数异常：期望 44570，实际 %', n;
  end if;
end $$;

commit;

-- 回滚（如确需）：
-- update t_question set subject_id = 2, chapter_id = 12,
--        cat_l1 = 'X9', cat_l2 = null, cat_l3 = 'belongs_to_other'
--  where id in (select id from t_question_x9_backup_20261025);
