BEGIN;
CREATE TEMP TABLE l2(id integer PRIMARY KEY, options text NOT NULL) ON COMMIT DROP;
INSERT INTO l2 VALUES (349537,$q${"A": "10011100B", "B": "176D", "C": "176Q", "D": "CBH"}$q$),(350003,$q${"A": "KB/s", "B": "Kb/s", "C": "Mb/s", "D": "Gb/s"}$q$),(350570,$q${"A": "30MHz~1GHz", "B": "1GHz~10GHz", "C": "2GHz~40GHz", "D": "1GHz~100GHz"}$q$),(352212,$q${"A": "它的传输速率可达 10~100Mb/s，传输距离可达几十千米甚至更远", "B": "它既可以用于传输模拟信号，也可以用于传输数字信号", "C": "与同轴电缆相比，双绞线易受外部电磁波的干扰，线路本身也产生噪声，误码率较高", "D": "双绞线大多用作局域网通信介质"}$q$),(358232,$q${"A": "<ESC>", "B": "<ALT>", "C": "<SHIFT>", "D": "<CTRL>"}$q$),(378552,$q${"A": "F1", "B": "F2", "C": "F3", "D": "F5"}$q$),(385730,$q${"A": "cd/J 是切换到根目录", "B": "cd~ 是切换到 home 目录", "C": "cd-是切换到上一级目录", "D": "cd/usr 是切换到根目录的 usr 目录"}$q$);
UPDATE t_question q SET option_json=e.options FROM l2 e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN l2 e ON e.id=q.id WHERE q.option_json=e.options;
 IF n<>7 THEN RAISE EXCEPTION '更新应为7，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN t_question_backup_20261117_latex2 b ON b.id=q.id WHERE q.correct IS DISTINCT FROM b.correct;
 IF n<>0 THEN RAISE EXCEPTION '不应改答案%',n; END IF;
END $$;
ROLLBACK;
