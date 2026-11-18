-- 综合 10 道最终断言
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question WHERE id IN (342200,342210,359347,363951,363959,366249,370095,384492,384946,390385);
  IF n <> 10 THEN RAISE EXCEPTION '题目数应为 10，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE id IN (342200,342210,359347,363951,363959,366249,370095,384492,384946,390385) AND qc_grade = 'good' AND answer_check = 'match';
  IF n <> 9 THEN RAISE EXCEPTION 'good/match 应为 9，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE id IN (342200,342210,359347,363951,363959,366249,370095,384492,384946,390385) AND qc_grade = 'error' AND answer_check = 'uncertain';
  IF n <> 1 THEN RAISE EXCEPTION 'error/uncertain 应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN t_question_backup_20261117_comp b ON b.id = q.id WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 2 THEN RAISE EXCEPTION '答案变更数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE id = 370095 AND correct LIKE '%UPDATE School SET schstunum = schstunum + 1%';
  IF n <> 1 THEN RAISE EXCEPTION '370095 未补全'; END IF;
  SELECT count(*) INTO n FROM t_question WHERE id = 384492 AND correct LIKE '%B.deptname%';
  IF n <> 1 THEN RAISE EXCEPTION '384492 未改为 deptname'; END IF;
  SELECT count(*) INTO n FROM t_question WHERE id = 384946 AND correct LIKE '%sbirthday datetime%';
  IF n <> 1 THEN RAISE EXCEPTION '384946 未补全建表'; END IF;

  SELECT count(*) INTO n FROM practice_answer WHERE question_id IN (370095,384492,384946);
  IF n <> 0 THEN RAISE EXCEPTION '改答案题仍有 practice_answer % 条，需先清记录', n; END IF;
  SELECT count(*) INTO n FROM wrong_question WHERE question_id IN (370095,384492,384946);
  IF n <> 0 THEN RAISE EXCEPTION '改答案题仍有 wrong_question % 条，需先清记录', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE id IN (342200,342210,359347,363951,363959,366249,370095,384492,384946,390385) AND is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '本批含金标 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE NOT deleted;
  IF n <> 44696 THEN RAISE EXCEPTION '活跃题应为 44696，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status = 'ok';
  IF n <> 44451 THEN RAISE EXCEPTION '可练题应为 44451，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status = 'ok' AND qc_grade = 'error';
  IF n <> 125 THEN RAISE EXCEPTION 'ok/error 应为 125，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status = 'ok' AND qc_grade = 'good' AND answer_check = 'match';
  IF n <> 28259 THEN RAISE EXCEPTION 'ok/good/match 应为 28259，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status = 'ok' AND qc_grade = 'error' AND answer_check = 'uncertain';
  IF n <> 125 THEN RAISE EXCEPTION 'ok/error/uncertain 应为 125，实际 %', n; END IF;
END $$;
