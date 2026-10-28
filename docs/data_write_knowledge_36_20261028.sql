-- 知识点 36 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_36
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_36 as
select * from t_knowledge_point where id in (27731,27732,27733,27749,27952,27953,27954,27955,30183,31724,31726,31735,31736,31737,31776,31778,31779,31780);

update t_knowledge_point set title = $kp$数据的特点：数据量大$kp$, content = $kp$数据量大，甚至是海量数据。$kp$, section = '' where id = 27731;
update t_knowledge_point set title = $kp$数据的特点：存储具有持久性$kp$, content = $kp$数据存储具有持久性，须长久保存在计算机系统中。$kp$, section = '' where id = 27732;
update t_knowledge_point set title = $kp$数据的特点：共享性、冗余少$kp$, content = $kp$数据资源的使用具有共享性，冗余少。$kp$, section = '' where id = 27733;
update t_knowledge_point set title = $kp$为用户提供友善的人机界面$kp$, content = $kp$为用户提供友善的人机界面。$kp$, section = '' where id = 27749;
update t_knowledge_point set title = $kp$保证数据可用性$kp$, content = $kp$保证数据可用性：保护数据在任何情况下（包括系统故障）不会丢失。$kp$, section = '' where id = 27952;
update t_knowledge_point set title = $kp$防止否认（不可抵赖性）$kp$, content = $kp$防止否认：防止接收方或发送方抵赖。$kp$, section = '' where id = 27953;
update t_knowledge_point set title = $kp$审计管理$kp$, content = $kp$审计管理：监督用户活动，记录用户操作等。$kp$, section = '' where id = 27954;
update t_knowledge_point set title = $kp$常用的入侵检测方法$kp$, content = $kp$常用的检测方法有特征检测、异常检测和数据采集等。$kp$, section = '' where id = 27955;
update t_knowledge_point set title = $kp$Excel 筛选：自动筛选与高级筛选$kp$, content = $kp$筛选分为自动筛选和高级筛选。高级筛选需要有数据区和条件区，且两个区域的字段名要一致；筛选后的数据可以放在原位置，也可以放到其他位置。$kp$, section = '' where id = 30183;
update t_knowledge_point set title = $kp$用户希望更换系统口令$kp$, content = $kp$用户希望更换系统口令。$kp$, section = '' where id = 31724;
update t_knowledge_point set title = $kp$提高计算机系统可靠性和可用性的方式$kp$, content = $kp$计算机出现故障时可互为后备；计算机负荷过重时，可将任务调配给空闲计算机。$kp$, section = '' where id = 31726;
update t_knowledge_point set title = $kp$该方案的缺点：运行效率低$kp$, content = $kp$缺点是运行效率低。$kp$, section = '' where id = 31735;
update t_knowledge_point set title = $kp$数据安全需要保护的对象$kp$, content = $kp$数据安全需要保护的是明文和私钥。$kp$, section = '' where id = 31736;
update t_knowledge_point set title = $kp$关系运算中的差运算$kp$, content = $kp$差运算记为 R-S，结果由属于 R 但不属于 S 的元素组成。差不满足交换律。$kp$, section = '' where id = 31737;
update t_knowledge_point set title = $kp$同一字符集下文本输出所用的字符集$kp$, content = $kp$只要是在同一个字符集下，文本输出所使用的字符集与输入时相同。$kp$, section = '' where id = 31776;
update t_knowledge_point set title = $kp$ASCII 码值示例：A、a 与 0$kp$, content = $kp$字符 A 的 ASCII 码为 65，字符 a 为 97，数字 0 为 48；a 与 A 的码值之差为 32，即十六进制 20H。$kp$, section = '' where id = 31778;
update t_knowledge_point set title = $kp$在 Windows 中执行保存操作$kp$, content = $kp$在 Windows 中执行保存操作。$kp$, section = '' where id = 31779;
update t_knowledge_point set title = $kp$Windows 4.0 的系统安全$kp$, content = $kp$在 Windows 4.0 中可以保障系统安全。$kp$, section = '' where id = 31780;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (27731,27732,27733,27749,27952,27953,27954,27955,30183,31724,31726,31735,31736,31737,31776,31778,31779,31780) and not deleted) <> 18 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
