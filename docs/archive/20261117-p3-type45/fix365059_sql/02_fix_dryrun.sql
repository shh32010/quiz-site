BEGIN;
UPDATE t_question SET question_type=1, option_json=$q${"A": "**3<br/>##4<br/>**5", "B": "##3<br/>**4<br/>##5", "C": "##3<br/>**4##5", "D": "**3##4<br/>**5"}$q$, correct='D', blank_count=1, stem=$q$下面程序段的运行结果是______。

for(x=3;x<6;x++) printf((x%2)?("**%d"):("##%d
"),x);$q$ WHERE id=365059 AND NOT is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question WHERE id=365059 AND question_type=1 AND correct='D' AND stem=$q$下面程序段的运行结果是______。

for(x=3;x<6;x++) printf((x%2)?("**%d"):("##%d
"),x);$q$;
 IF n<>1 THEN RAISE EXCEPTION '修复失败'; END IF;
END $$;
ROLLBACK;
