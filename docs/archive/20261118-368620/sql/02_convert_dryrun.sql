-- 368620：type4 -> type1，按四个防火墙配置截图重建文字选项（2026-11-18）
BEGIN;
CREATE TEMP TABLE m368620(id integer PRIMARY KEY, stem text NOT NULL, options text NOT NULL, analysis text NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO m368620 VALUES (
  368620,
  $q$在 Windows 10 上，如果对计算机的安全要求很高，则可以阻止所有入站连接，如下哪个是正确的配置（）$q$,
  $q${"A": "专用网络：启用 Windows Defender 防火墙，“阻止所有传入连接”未勾选；公用网络：启用 Windows Defender 防火墙，“阻止所有传入连接”未勾选。", "B": "专用网络：启用 Windows Defender 防火墙，“阻止所有传入连接”已勾选；公用网络：防火墙未启用，“阻止所有传入连接”未勾选。", "C": "专用网络：启用 Windows Defender 防火墙，“阻止所有传入连接”已勾选；公用网络：启用 Windows Defender 防火墙，“阻止所有传入连接”未勾选。", "D": "专用网络：启用 Windows Defender 防火墙，“阻止所有传入连接”已勾选；公用网络：启用 Windows Defender 防火墙，“阻止所有传入连接”已勾选。"}$q$,
  $q$应在【专用网络设置】和【公用网络设置】中都勾选【阻止所有传入连接，包括位于允许应用列表中的应用】。故选 D。$q$,
  $q${"titleContent": "在 Windows 10 上，如果对计算机的安全要求很高，则可以阻止所有入站连接，如下哪个是正确的配置（）", "analyze": "应在【专用网络设置】和【公用网络设置】中都勾选【阻止所有传入连接，包括位于允许应用列表中的应用】。故选 D。", "correct": null, "questionItemObjects": []}$q$
);
UPDATE t_question q SET question_type = 1, stem = e.stem, option_json = e.options, analysis = e.analysis, blank_count = 1
FROM m368620 e WHERE q.id = e.id AND NOT q.is_golden;
UPDATE t_text_content t SET content = e.content FROM m368620 e WHERE t.id = 368860;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN m368620 e ON e.id = q.id
   WHERE q.question_type = 1 AND q.stem = e.stem AND q.option_json = e.options AND q.analysis = e.analysis AND q.correct = 'D' AND q.blank_count = 1;
  IF n <> 1 THEN RAISE EXCEPTION '转换应为1，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_text_content WHERE id = 368860 AND pg_input_is_valid(content,'json') AND content::jsonb->>'titleContent' = (SELECT stem FROM m368620);
  IF n <> 1 THEN RAISE EXCEPTION '文本未同步'; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type = 1; IF n <> 23982 THEN RAISE EXCEPTION 'type1 应为23982，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type = 4; IF n <> 8143 THEN RAISE EXCEPTION 'type4 应为8143，实际%', n; END IF;
END $$;
ROLLBACK;
