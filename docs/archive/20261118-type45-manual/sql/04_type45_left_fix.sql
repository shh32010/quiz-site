-- 题型 4/5 剩余人工题：342185/359513/377437/389898（2026-11-18）
BEGIN;
CREATE TEMP TABLE t45fix(
  id integer PRIMARY KEY,
  new_type integer NOT NULL,
  new_stem text NOT NULL,
  new_options text,
  new_correct text,
  new_analysis text,
  new_blank integer NOT NULL,
  content text,
  new_has_image boolean NOT NULL
) ON COMMIT DROP;
INSERT INTO t45fix VALUES
(342185,1,$q$若交换机和 PC 之间传输介质采用 5 类 UTP，如果 PC 端采用线序满足 EIA/TIA 568B 标准，则交换机端线序满足________。$q$,$q${"A": "EIA/TIA 568B", "B": "EIA/TIA 568A"}$q$,'A',$q$交换机与 PC 直连使用直通线，两端线序标准应一致；PC 端为 EIA/TIA 568B，交换机端也应采用 EIA/TIA 568B。故选 A。$q$,1,$q${"titleContent": "若交换机和 PC 之间传输介质采用 5 类 UTP，如果 PC 端采用线序满足 EIA/TIA 568B 标准，则交换机端线序满足________。", "analyze": "交换机与 PC 直连使用直通线，两端线序标准应一致；PC 端为 EIA/TIA 568B，交换机端也应采用 EIA/TIA 568B。故选 A。", "correct": null, "questionItemObjects": []}$q$,false),
(359513,4,$q$某计算机网络拓扑结构及 IP 配置如题 73 图所示，已知路由器接口 A 和 B 的 IP 地址中主机号相同。
(1) 路由器右侧网络属于________类网络，其子网掩码是________，接口 B 的主机号是________；
(2) 图中★标记处路由器接口 A 的 IP 地址是________。$q$,NULL,NULL,NULL,4,$q${"titleContent": "某计算机网络拓扑结构及 IP 配置如题 73 图所示，已知路由器接口 A 和 B 的 IP 地址中主机号相同。<br/>(1) 路由器右侧网络属于________类网络，其子网掩码是________，接口 B 的主机号是________；<br/>(2) 图中★标记处路由器接口 A 的 IP 地址是________。<br/><img src=\"/qimg/q359513.jpg\"/>", "analyze": "第 1 小题的第 1 空:路由器右侧主机的 IP 地址为“192.18.6.10”，IP 地址首字节为“192”， 可以判断出这是 C 类 IP 地址。第 1 小题的第 2 空:子网掩码是一个 32 位的代码，其中与 IP 地址中网络号对应位置处的二进位是“1”，与主机号对应位置处的进位是“0”。对于 A 类地址来说， 默认的子网掩码是 255.0.0.0;对于 B 类地址来说，默认的子网掩码 255.255.0.0; 对于C 类地址来说，默认的子网掩码是 255.255.255.0。第 1 小题的第 3 空:一个 IP 地址包含“网络号”和“主机号”两个部分，对于 C 类 IP 地址而言，前 3 个字节是“网络号”，最后 1 个字节是“主机号”，接口 B 的 IP 地址为“192.18.0.254&quot;，属于 C 类 IP 地址，因此主机号是“254”。第 2 小题:路由器端口的 IP 地址与相连子网的 IP 地址具有相同的网络号。与路由器接口 A 相连的主机 A 的 IP 地址为“192.18.26.10”，属于 C 类 IP 地址，前 3 个字节是网络号，另外题目中已经说明“路由器接口 A 和 B 的 IP 地址中主机号相同”，所以路由器接口A 的 IP 地址为“192.18.26.254”。因此，本题填“C”、“255.255.255.0、“254”、“192.18.26.254”。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "C", "itemUuid": "cd61caeacaf74865a3dfbae06274b275", "score": null}, {"prefix": "2", "content": "255.255.255.0", "itemUuid": "5e288ee47e9a4efaaffb8b5e65b3c6c9", "score": null}, {"prefix": "3", "content": "254", "itemUuid": "d1195cf8956b4973870c29cf56d9729b", "score": null}, {"prefix": "4", "content": "192.18.26.254", "itemUuid": "39b02e9548434de794a06d46aea5bd50", "score": null}]}$q$,true),
(377437,1,$q$关系 R 和关系 S 有相同的模式，且各有 20 个元组，若这两个关系进行“并”运算，运算后所产生的元组个数为（ ）个。$q$,$q${"A": "20", "B": "任意", "C": "40", "D": "大于等于 20，小于等于 40"}$q$,'D',$q$并运算的结果包含 R 与 S 的全部元组：两者元组完全相同时为 20 个，完全不同时最多为 40 个，因此结果个数为 20~40。故选 D。$q$,1,$q${"titleContent": "关系 R 和关系 S 有相同的模式，且各有 20 个元组，若这两个关系进行“并”运算，运算后所产生的元组个数为（ ）个。", "analyze": "并运算的结果包含 R 与 S 的全部元组：两者元组完全相同时为 20 个，完全不同时最多为 40 个，因此结果个数为 20~40。故选 D。", "correct": null, "questionItemObjects": []}$q$,false),
(389898,4,'题 73 图为计算机软件系统关系图。图中★标识的软件是____。',NULL,NULL,NULL,1,NULL,true);
UPDATE t_question q SET
  question_type=e.new_type,
  stem=e.new_stem,
  option_json=e.new_options,
  correct=coalesce(e.new_correct,q.correct),
  analysis=coalesce(e.new_analysis,q.analysis),
  blank_count=e.new_blank,
  has_image=e.new_has_image
FROM t45fix e WHERE q.id=e.id AND NOT q.is_golden;
UPDATE t_text_content t SET content=e.content FROM t45fix e WHERE e.content IS NOT NULL AND t.id=(SELECT info_text_content_id FROM t_question WHERE id=e.id);
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN t45fix e ON e.id=q.id
   WHERE q.question_type=e.new_type AND q.stem=e.new_stem AND q.blank_count=e.new_blank AND q.has_image=e.new_has_image
     AND (e.new_options IS NULL OR q.option_json=e.new_options)
     AND (e.new_correct IS NULL OR q.correct=e.new_correct)
     AND (e.new_analysis IS NULL OR q.analysis=e.new_analysis);
  IF n<>4 THEN RAISE EXCEPTION '更新应为4，实际%',n; END IF;
  SELECT count(*) INTO n FROM t_question q JOIN t45fix e ON e.id=q.id WHERE q.info_text_content_id IS NULL; IF n<>0 THEN RAISE EXCEPTION '缺文本ID'; END IF;
  SELECT count(*) INTO n FROM t_text_content t JOIN t45fix e ON t.id=(SELECT info_text_content_id FROM t_question WHERE id=e.id)
   WHERE e.content IS NOT NULL AND t.content=e.content AND pg_input_is_valid(t.content,'json');
  IF n<>3 THEN RAISE EXCEPTION '文本同步应为3，实际%',n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type=1; IF n<>23981 THEN RAISE EXCEPTION 'type1 应为23981，实际%',n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type=4; IF n<>8144 THEN RAISE EXCEPTION 'type4 应为8144，实际%',n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type=5; IF n<>1538 THEN RAISE EXCEPTION 'type5 应为1538，实际%',n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n<>44419 THEN RAISE EXCEPTION '活跃应为44419，实际%',n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n<>200 THEN RAISE EXCEPTION '金标应为200，实际%',n; END IF;
END $$;
COMMIT;
