-- 365190/374903 转 type1
BEGIN;
CREATE TEMP TABLE m2(id integer PRIMARY KEY, options text NOT NULL, correct text NOT NULL, stem text) ON COMMIT DROP;
INSERT INTO m2 VALUES (365190,$q${"A": "数据传输速率达到 Gbps 级, 能更好地满足高清视频等数据传输需求", "B": "网络时延在 1 毫秒左右，能更好地满足自动驾驶、远程医疗等实时应用", "C": "超大网络容量，能更好地满足物联网的通信需求", "D": "5G信号频率高，穿透力强，相对4G技术所需基站数量较少"}$q$,'D',$q$关于 5G 的叙述，错误的是（）$q$),(374903,$q${"A": "用例图", "B": "顺序图", "C": "类图", "D": "状态图"}$q$,'D',NULL);
UPDATE t_question q SET question_type=1, option_json=e.options, correct=e.correct, blank_count=1, stem=coalesce(e.stem,q.stem)
FROM m2 e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN m2 e ON e.id=q.id WHERE q.question_type=1 AND q.correct=e.correct AND q.option_json=e.options AND (e.stem IS NULL OR q.stem=e.stem);
 IF n<>2 THEN RAISE EXCEPTION '转换应为2，实际%',n; END IF;
END $$;
ROLLBACK;
