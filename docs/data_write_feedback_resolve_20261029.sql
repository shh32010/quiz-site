-- 2026-10-29：处理错题反馈（重复题、题干/选项/解析修正）
-- 备份：t_question_backup_20261029_feedback
begin;
create table t_question_backup_20261029_feedback as
select * from t_question where id in (334598, 336121, 336420, 336939, 337309, 337353, 337619, 337722, 340422, 344977, 351459, 358668, 362046, 366650, 378536, 389274, 389566) and not deleted;

do $$ declare n int; begin
  select count(*) into n from t_question_backup_20261029_feedback;
  if n <> 17 then raise exception '备份题目数不是 17: %', n; end if;
end $$;

update t_question set stem = $q$芯片组主要由北桥芯片和南桥芯片组成。

I. 北桥芯片与 CPU 相连接
II. 北桥芯片与内存条相连接
III. 南桥芯片与 USB 接口、硬盘接口、局域网接口等相连接

其中，正确的是（ ）$q$, option_json = $q${"A": "仅 I", "B": "仅 I 和 II", "C": "仅 I、II 和 III", "D": "全部"}$q$, analysis = $q$I~III 关于芯片组的叙述全部正确，故选 D。$q$ where id = 336121;
update t_question set analysis = $q$栈是后进先出（LIFO）。逐项验证，只有 B（325641）能得到，其余选项都会出现违反栈序的出栈顺序，故选 B。$q$ where id = 340422;
update t_question set stem = $q$补码运算的基本规则是 [x]补 + [y]补 = [x+y]补，[15]补 + [-38]补 的运算结果用二进制补码表示为（ ）$q$, analysis = $q$15 + (-38) = -23，其 8 位补码为 11101001，故选 D。$q$ where id = 351459;
update t_question set stem = $q$互联网使用 TCP/IP 协议实现全球范围计算机网络的互连，连接在互联网上的每台主机都有一个 IP 地址。下面不能作为 IP 地址的是（ ）$q$, option_json = $q${"A": "201.256.39.68", "B": "120.34.0.18", "C": "21.18.33.48", "D": "37.250.68.0"}$q$, analysis = $q$201.256.39.68 中 256 超出 0~255 的范围，不能作为 IP 地址，故选 A。$q$ where id = 344977;
update t_question set stem = $q$设定数字显示格式后，以下说法正确的是（ ）$q$, option_json = $q${"A": "整个工作簿在显示数字时都会依照所设定的统一格式", "B": "整个工作表在显示数字时都会依照所设定的统一格式", "C": "被设定显示格式的单元格区域外的单元格，在显示数字时也会依照所设定的统一格式", "D": "被设定显示格式的单元格区域内的数字，在显示时依照该单元格所设定的格式"}$q$, analysis = $q$设定数字显示格式后，只有被设定格式的单元格区域内的数字按该格式显示，故选 D。$q$ where id = 378536;
update t_question set analysis = $q$3×3=9=1×7+2，得该进制为 7；5+6=11=1×7+4，所以在七进制下表示为 14，故选 C。$q$ where id = 389566;
update t_question set correct = $q$(n-1)/2$q$, analysis = $q$等概率删除下平均需移动 (n-1)/2 个元素。$q$ where id = 366650;

-- 9 个重复副本软删，保留 334598
update t_question set deleted = true where id in (336420, 336939, 337309, 337353, 337619, 337722, 358668, 362046, 389274) and not deleted;
update exam_paper_question set question_id = 334598 where question_id = 389274;

-- 合并重复副本的知识点关联到保留题
with base as (
  select coalesce(max(id), 0) as max_id from t_question_kp
), src as (
  select distinct on (kp_id) kp_id, coalesce(confidence, '中') as confidence
    from t_question_kp where question_id in (336420, 336939, 337309, 337353, 337619, 337722, 358668, 362046, 389274)
   order by kp_id, question_id
)
insert into t_question_kp (id, question_id, kp_id, match_source, confidence)
select base.max_id + row_number() over (order by src.kp_id), 334598, src.kp_id, 'dedup_20261029', src.confidence
  from src cross join base
on conflict (question_id, kp_id) do nothing;
delete from t_question_kp where question_id in (336420, 336939, 337309, 337353, 337619, 337722, 358668, 362046, 389274);

-- 反馈处理
update feedback set status='handled', admin_note=$q$重复题：保留 334598，软删 9 个重复副本，并迁移试卷/知识点引用。$q$, handled_at=now() where id=38 and status='open';
update feedback set status='handled', admin_note=$q$已修正题干序号、选项格式和解析。$q$, handled_at=now() where id=37 and status='open';
update feedback set status='handled', admin_note=$q$抽查发现解析与题干不匹配，已重写解析。$q$, handled_at=now() where id=33 and status='open';
update feedback set status='handled', admin_note=$q$解析结论与正确答案不一致，已修正为 D。$q$, handled_at=now() where id=32 and status='open';
update feedback set status='handled', admin_note=$q$题干缺少“IP 地址”表述，已补全并规范选项空格。$q$, handled_at=now() where id=29 and status='open';
update feedback set status='handled', admin_note=$q$题干和选项存在 OCR 残缺，已按题意补全。$q$, handled_at=now() where id=30 and status='open';
update feedback set status='handled', admin_note=$q$解析中“十四进制”表述错误，已改为七进制。$q$, handled_at=now() where id=36 and status='open';
update feedback set status='handled', admin_note=$q$答案存在重复备选写法，已整理为单一答案。$q$, handled_at=now() where id=34 and status='open';
update feedback set status='handled', admin_note=$q$已核对题目、选项、答案和解析，暂未发现需要修改的问题。$q$, handled_at=now() where id=31 and status='open';
update feedback set status='handled', admin_note=$q$已核对题目内容，暂未发现需要修改的问题。$q$, handled_at=now() where id=35 and status='open';
update feedback set status='handled', admin_note=$q$已核对题目内容，暂无问题。$q$, handled_at=now() where id=39 and status='open';
update feedback set status='handled', admin_note='测试或占位反馈，已核对题目，无需修改。', handled_at=now() where id in (31,35,39) and status='open';
update feedback set status='handled', admin_note='安全探测/无效内容，SQL 与 XSS 均按文本存储，未改动题目。', handled_at=now() where id in (42,43,44,45,46,47,48,50) and status='open';

do $$ declare n int; begin
  select count(*) into n from t_question where id in (336420, 336939, 337309, 337353, 337619, 337722, 358668, 362046, 389274) and not deleted;
  if n <> 0 then raise exception '重复题未全部软删: %', n; end if;
  select count(*) into n from feedback where status='open';
  if n <> 0 then raise exception '仍有未处理反馈: %', n; end if;
end $$;
commit;