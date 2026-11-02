-- 2026-10-30：处理反馈 57-60，修正 4 道题干/选项/题型/解析
-- 备份：t_question_backup_20261030_feedback_57_60
begin;
create table t_question_backup_20261030_feedback_57_60 as
select * from t_question where id in (364975, 364976, 365467, 366238) and not deleted;

update t_question set question_type = 1, blank_count = null, stem = $q$下列四组选项中，均不是 C 语言关键字的选项是（ ）$q$, option_json = $q${"A": "define、IF、type", "B": "getc、char、printf", "C": "include、scanf、case", "D": "while、go、pow"}$q$, correct = $q$A$q$, analysis = $q$A 组中的 define、IF、type 都不是 C 语言关键字；B、C、D 组分别含有 char、case、while 等关键字，故选 A。$q$ where id = 364975;
update t_question set question_type = 1, blank_count = null, stem = $q$下列四组选项中，均是 C 语言关键字的选项是（ ）$q$, option_json = $q${"A": "auto、enum、include", "B": "switch、typedef、continue", "C": "signed、union、scanf", "D": "if、struct、type"}$q$, correct = $q$B$q$, analysis = $q$B 组 switch、typedef、continue 都是 C 语言关键字；其余各组分别含 include、scanf、type 等非关键字，故选 B。$q$ where id = 364976;
update t_question set stem = $q$下列不属于 C 语言特点的是（ ）$q$, option_json = $q${"A": "语言简洁、紧凑，使用方便、灵活", "B": "数据类型和运算符丰富", "C": "标准 C 语言有大量的嵌入式系统库函数可供调用，简化了程序设计工作", "D": "C 语言效率高，但移植性差"}$q$, correct = $q$C,D$q$, analysis = $q$嵌入式系统库函数和“移植性差”都不属于 C 语言特点：C 语言可移植性好，标准库主要面向通用程序设计，故选 C、D。$q$ where id = 365467;
update t_question set stem = $q$下列标识符中正确的一组是（ ）$q$, analysis = $q$A 组含关键字 char，D 组含关键字 double，均不合法；B、C 两组的标识符均符合命名规则，故选 B、C。$q$ where id = 366238;

update feedback set status='handled', admin_note='题干选项混排、题型标注错误，已重排选项并改为单选题。', handled_at=now() where id in (57,58) and status='open';
update feedback set status='handled', admin_note='选项 D 混入参考答案和解析，已清理并重写解析。', handled_at=now() where id=59 and status='open';
update feedback set status='handled', admin_note='补充解析：A/D 含关键字，B/C 标识符合法。', handled_at=now() where id=60 and status='open';
update feedback set status='handled', admin_note='测试提交，无具体内容。', handled_at=now() where id=61 and status='open';

do $$ declare n int; begin
  select count(*) into n from feedback where status='open';
  if n <> 0 then raise exception '仍有未处理反馈: %', n; end if;
  select count(*) into n from t_question where id in (364975,364976) and question_type=1 and blank_count is null;
  if n <> 2 then raise exception '题型未改为单选: %', n; end if;
end $$;
commit;