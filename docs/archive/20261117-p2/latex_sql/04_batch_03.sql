-- LaTeX 第 3 批（25 道）
BEGIN;
CREATE TEMP TABLE latex_expected (id integer PRIMARY KEY, option_new text NOT NULL) ON COMMIT DROP;
INSERT INTO latex_expected (id, option_new) VALUES
(349972, $q${"A": "$16 ~KB$", "B": "512KB", "C": "8KB", "D": "9KB"}$q$),
(351318, $q${"A": "$7445 \\times 128 ~B$", "B": "$7445 \\times 1024B$", "C": "$6763 \\times 128B$", "D": "$6763 \\times 56 ~B$"}$q$),
(351341, $q${"A": "$1Mb / S = 10^{5}bit / s$", "B": "$1Mb / S = 10^{6}bit / s$", "C": "$1Gb / S = 10^{6}bit / s$", "D": "$1Gb / S = 10^{12}bit / s$"}$q$),
(351362, $q${"A": "B4F3H", "B": "$3546H$", "C": "73F3H", "D": "B10H"}$q$),
(351391, $q${"A": "n倍", "B": "$2n$ 倍", "C": "$2^{n}$ 倍", "D": "不变"}$q$),
(351503, $q${"A": "$16 ~KB$", "B": "512KB", "C": "8KB", "D": "9KB"}$q$),
(351553, $q${"A": "为HLMP", "B": "在集合 $\\{H,L,M,P\\}$ 中任选一个", "C": "在集合{HL, HM, HP, LM, LP, MP}中任选一个", "D": "在集合{HLM, ,HLP,HMP,LMP}中任选一个"}$q$),
(351717, $q${"A": "$7445 \\times 128B$", "B": "$7445 \\times 1024B$", "C": "$6763 \\times 128B$", "D": "$6763 \\times 256B$"}$q$),
(352020, $q${"A": "1:1联系", "B": "$1:m$ 联系", "C": "m:1联系", "D": "m:n联系"}$q$),
(352046, $q${"A": "$R - 1$", "B": "R", "C": "R+1", "D": "$2^{R}$"}$q$),
(352160, $q${"A": "$A \\wedge B = 10000000$", "B": "A ∨ B = 11011111", "C": "$\\overline{\\mathsf{A}}\\wedge \\overline{\\mathsf{B}}\\vee A\\wedge B = 01011001$", "D": "$A \\wedge B \\vee A \\wedge B = 10100000$"}$q$),
(352161, $q${"A": "使用苹果手机中的Apple Pay功能在超市进行支付消费", "B": "可进行双向通信，既可读数据也能写数据", "C": "通信距离约 $10cm$ 左右", "D": "三毛老师驾驶带有电子标签的汽车通过高速公路的 ETC 通道"}$q$),
(352237, $q${"A": "A $\\Lambda$ B=10000000", "B": "AVB=11011111", "C": "$\\overline{A}\\wedge BV\\wedge A\\overline{B} = 01011001$", "D": "$\\overline{A}\\Lambda \\overline{B}VA\\Lambda B = 10100000$"}$q$),
(352407, $q${"A": "-2n-1", "B": "-2n", "C": "2n-1", "D": "$2n$"}$q$),
(352418, $q${"A": "$7445 \\times 128B$", "B": "$7445 \\times 1024B$", "C": "$6763 \\times 128B$", "D": "$6763 \\times 256B$"}$q$),
(352454, $q${"A": "$800 MB$", "B": "635MB", "C": "400MB", "D": "1GB"}$q$),
(352487, $q${"A": "-2n-1", "B": "-2n", "C": "2n-1", "D": "$2 n$"}$q$),
(352490, $q${"A": "$7445 \\times 128B$", "B": "$7445 \\times 1024B$", "C": "$6763 \\times 128B$", "D": "$6763 \\times 256B$"}$q$),
(352492, $q${"A": "$7445 \\times 128B$", "B": "$7445 \\times 1024B$", "C": "$6763 \\times 128B$", "D": "$6763 \\times 256B$"}$q$),
(352943, $q${"A": "小于 $10cm$", "B": "1 ~ 20cm", "C": "3 ~ 8m", "D": "大于10m"}$q$),
(353416, $q${"A": "个人移动通信包括移动台、基站、移动电话交换中心", "B": "所有基站都通过微波与移动电话交换中心通信", "C": "第四代移动通信的传输速率理论上可达到 $100Mb / s$", "D": "个人移动通讯网也称为蜂窝式移动通信"}$q$),
(357213, $q${"A": "峰值速率 $20 Gb / s$", "B": "用户速率 $1Gb / s$", "C": "传输延迟 $100ms$", "D": "流量密度 $10Mb / s / m^2$"}$q$),
(357219, $q${"A": "$1000 ~b / s$", "B": "1000 字节/s", "C": "$1024 / s$", "D": "1024个字节/s"}$q$),
(357248, $q${"A": "=A1^5", "B": "=A2+1", "C": "$= A3 + 6X + 1$", "D": "$= A4 + 1$"}$q$),
(357249, $q${"A": "=sum(21, 43)", "B": "=sum(A1:A8)", "C": "$= sum(21,\\dots ,58)$", "D": "=sum(“a”,1)"}$q$)
;
UPDATE t_question q
SET option_json = e.option_new
FROM latex_expected e
WHERE q.id = e.id AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id
   WHERE q.option_json = e.option_new;
  IF n <> 25 THEN RAISE EXCEPTION '第 3 批更新数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_latex b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
