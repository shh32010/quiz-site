-- 2026-10-29：S1-1「C 语言程序的结构」按大纲三个三级条目重排
-- 备份：t_knowledge_point_backup_20261029_s1_1
-- 82 条 = 保留 55（239:34 / 240:18 / 241:3）+ 移出 23 + 软删 4
begin;
create table t_knowledge_point_backup_20261029_s1_1 as
select * from t_knowledge_point where node_id in (238,239,240,241) and not deleted;

do $$ declare n int; begin
  select count(*) into n from t_knowledge_point_backup_20261029_s1_1;
  if n <> 82 then raise exception 'S1-1 备份条数不是 82: %', n; end if;
end $$;

-- 保留内容：挂到三个三级大纲条目
update t_knowledge_point k set node_id = v.node, item_order = v.ord
  from (values
    (30280, 239, 1),
    (30281, 239, 2),
    (30329, 239, 3),
    (30431, 239, 4),
    (30442, 239, 5),
    (30447, 239, 6),
    (30460, 239, 7),
    (30465, 239, 8),
    (30467, 239, 9),
    (30469, 239, 10),
    (30478, 239, 11),
    (30499, 239, 12),
    (30509, 239, 13),
    (30517, 239, 14),
    (30531, 239, 15),
    (30536, 239, 16),
    (30543, 239, 17),
    (30546, 239, 18),
    (30551, 239, 19),
    (30593, 239, 20),
    (30604, 239, 21),
    (30635, 239, 22),
    (30637, 239, 23),
    (30652, 239, 24),
    (30666, 239, 25),
    (30667, 239, 26),
    (30673, 239, 27),
    (31747, 239, 28),
    (31797, 239, 29),
    (31921, 239, 30),
    (32078, 239, 31),
    (32081, 239, 32),
    (32082, 239, 33),
    (32257, 239, 34),
    (30314, 240, 35),
    (30333, 240, 36),
    (30518, 240, 37),
    (30532, 240, 38),
    (30630, 240, 39),
    (31331, 240, 40),
    (31332, 240, 41),
    (31798, 240, 42),
    (31876, 240, 43),
    (31924, 240, 44),
    (32070, 240, 45),
    (32076, 240, 46),
    (32080, 240, 47),
    (32114, 240, 48),
    (32211, 240, 49),
    (32212, 240, 50),
    (32258, 240, 51),
    (32259, 240, 52),
    (31335, 241, 53),
    (31881, 241, 54),
    (32111, 241, 55)
  ) as v(id, node, ord)
 where k.id = v.id and not k.deleted;

-- 移出 S1-1：按主题归到其他课程/章节
update t_knowledge_point k
   set node_id = v.node, chapter_id = v.root, subject_id = v.subject, course_name = v.course, item_order = null
  from (values
    (30472, 242, 19, 5, 'C语言'),
    (30888, 242, 19, 5, 'C语言'),
    (30446, 73, 5, 4, '计算机软件'),
    (30432, 73, 5, 4, '计算机软件'),
    (31305, 73, 5, 4, '计算机软件'),
    (31665, 73, 5, 4, '计算机软件'),
    (31666, 73, 5, 4, '计算机软件'),
    (31667, 73, 5, 4, '计算机软件'),
    (31729, 73, 5, 4, '计算机软件'),
    (31742, 73, 5, 4, '计算机软件'),
    (31743, 73, 5, 4, '计算机软件'),
    (31878, 73, 5, 4, '计算机软件'),
    (31879, 73, 5, 4, '计算机软件'),
    (31893, 73, 5, 4, '计算机软件'),
    (32105, 73, 5, 4, '计算机软件'),
    (31619, 68, 5, 4, '计算机软件'),
    (31620, 68, 5, 4, '计算机软件'),
    (31659, 115, 7, 4, '多媒体技术'),
    (32103, 115, 7, 4, '多媒体技术'),
    (31657, 86, 5, 4, '计算机软件'),
    (32220, 299, 23, 5, 'UML建模'),
    (32221, 299, 23, 5, 'UML建模'),
    (27750, 79, 5, 4, '计算机软件')
  ) as v(id, node, root, subject, course)
 where k.id = v.id and not k.deleted;

-- 明确无知识价值/损坏内容：软删
update t_knowledge_point set deleted = true where id in (30584, 31605, 31938, 32614) and not deleted;

do $$ declare n int; begin
  select count(*) into n from t_knowledge_point k where not k.deleted and k.node_id in (select id from t_chapter c where c.id=238 or c.parent_id=238);
  if n <> 55 then raise exception 'S1-1 保留条数不是 55: %', n; end if;
  select count(*) into n from t_knowledge_point where node_id=239 and not deleted;
  if n <> 34 then raise exception '239 条数不是 34: %', n; end if;
  select count(*) into n from t_knowledge_point where node_id=240 and not deleted;
  if n <> 18 then raise exception '240 条数不是 18: %', n; end if;
  select count(*) into n from t_knowledge_point where node_id=241 and not deleted;
  if n <> 3 then raise exception '241 条数不是 3: %', n; end if;
end $$;
commit;