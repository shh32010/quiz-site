-- W2 数据落库 2026-10-25：6 选项严格无损 + 7 答案修正 + 8 隔离
\set ON_ERROR_STOP on
BEGIN;
\copy (select id,question_type,correct,option_json,review_status,is_golden from t_question where id in (343475,343534,346250,349889,354641,355345,351653,354064,354390,357245,358445,361326,390314,334820,341916,369806,369996,370761,372412,373176,382827) order by id) to '/opt/quiz-backups/w2_data_before_20261025.csv' with (format csv, header true)
CREATE TEMP TABLE w2_opt(id int, option_json text);
INSERT INTO w2_opt VALUES (343475, '{"A":"输入门、遗忘门、输出门","B":"生成网络和判别网络","C":"卷积层、池化层、全连接层","D":"前向传播和反向传播"}');
INSERT INTO w2_opt VALUES (343534, '{"A":"群体智慧","B":"集中控制","C":"注重互动和交互","D":"用户创造内容"}');
INSERT INTO w2_opt VALUES (346250, '{"A":"WAV格式","B":"JPG格式","C":"DAT格式","D":"MIC格式"}');
INSERT INTO w2_opt VALUES (349889, '{"A":"版本号","B":"产品域名管理","C":"产品分类部分","D":"行号"}');
INSERT INTO w2_opt VALUES (354641, '{"A":"数据标准化","B":"数据插补","C":"数据编码","D":"数据采样"}');
INSERT INTO w2_opt VALUES (355345, '{"A":"文本分类","B":"词嵌入","C":"文本生成","D":"图像识别"}');
CREATE TEMP TABLE w2_ans(id int, correct text);
INSERT INTO w2_ans VALUES (351653, 'D');
INSERT INTO w2_ans VALUES (354064, 'A');
INSERT INTO w2_ans VALUES (354390, 'B');
INSERT INTO w2_ans VALUES (357245, 'B,C,D');
INSERT INTO w2_ans VALUES (358445, 'A');
INSERT INTO w2_ans VALUES (361326, 'A');
INSERT INTO w2_ans VALUES (390314, 'A');
CREATE TEMP TABLE w2_quar(id int);
INSERT INTO w2_quar VALUES (334820),(341916),(369806),(369996),(370761),(372412),(373176),(382827);
UPDATE t_question q SET option_json=f.option_json FROM w2_opt f WHERE q.id=f.id AND NOT q.is_golden;
UPDATE t_question q SET correct=f.correct FROM w2_ans f WHERE q.id=f.id AND NOT q.is_golden;
UPDATE t_question q SET review_status='quarantined' FROM w2_quar f WHERE q.id=f.id AND NOT q.is_golden;
DO $$ DECLARE n int; g int; BEGIN
 SELECT count(*) INTO g FROM t_question WHERE is_golden; IF g<>200 THEN RAISE EXCEPTION 'gold count changed: %',g; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN w2_opt f ON f.id=q.id WHERE q.option_json=f.option_json; IF n<>6 THEN RAISE EXCEPTION 'option update mismatch: %',n; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN w2_ans f ON f.id=q.id WHERE q.correct=f.correct; IF n<>7 THEN RAISE EXCEPTION 'answer update mismatch: %',n; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN w2_quar f ON f.id=q.id WHERE q.review_status='quarantined'; IF n<>8 THEN RAISE EXCEPTION 'quarantine mismatch: %',n; END IF;
END $$;
COMMIT;
