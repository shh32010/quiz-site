-- 判断题第 3 批（25 道：22 keep + 1 change + 2 unresolved）
BEGIN;
CREATE TEMP TABLE judge_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO judge_expected (id, analysis, correct, stem, action) VALUES
(348799, $q$五次信息技术革命中，第五次指计算机的普及应用及计算机与现代通信技术（含互联网）的有机结合，互联网的出现与普及属于这一阶段。$q$, NULL, NULL, 'keep'),(348800, $q$计算机技术扩展的是思维器官、负责信息处理，机器人等控制技术才扩展效应器官；把计算机归入控制与显示技术不正确。$q$, NULL, NULL, 'keep'),(348860, $q$信息与物质、能量并列称为三大资源，它是非物质（派生）的信息资源，不能说成是新的物质资源。$q$, NULL, NULL, 'keep'),(348884, $q$GBK 和 GB18030 都向下兼容 GB2312，常用汉字在这三种标准中的编码位置相同，只是收录范围扩大。$q$, NULL, NULL, 'keep'),(352642, $q$蓝牙的典型有效传输距离约10m，ZigBee 可达10～100m 且能通过组网扩展，因此蓝牙的传输距离并不大于 ZigBee。$q$, NULL, NULL, 'keep'),(352683, $q$RFID 电子标签按工作方式可分为主动式、被动式和半被动式（也称半主动式），区别在于是否自带电源及响应方式。$q$, NULL, NULL, 'keep'),(352684, $q$RFID 俗称电子标签，源于雷达技术，属非接触式自动识别，可识别高速运动物体并同时识别多个标签，操作快捷。$q$, NULL, NULL, 'keep'),(352685, $q$ZigBee 协议基于 IEEE 802.15.4 标准，其物理层和 MAC 层由 802.15.4 定义，并非 IEEE 802.11（无线局域网标准）。$q$, NULL, NULL, 'keep'),(353176, $q$移动互联网应用可归为生活、娱乐、商务等类别，网易云音乐这类音乐类 App 属于娱乐方面的应用。$q$, NULL, NULL, 'keep'),(353186, $q$10 Gb/s 折合下载速度约为 1.25 GB/s，而不是 5 GB/s，题干中的单位换算错误。$q$, NULL, NULL, 'keep'),(353190, $q$移动互联网为移动网购、移动支付等应用提供了网络和终端基础，其快速发展确实带动了这些业务的发展，表述正确。$q$, NULL, NULL, 'keep'),(353193, $q$支付宝 App 的移动支付属于移动互联网在金融（移动支付）领域的典型应用，判断正确。$q$, NULL, NULL, 'keep'),(353478, $q$虚拟化本身是一个广义概念，其核心含义正是以透明方式把物理计算资源抽象后提供给使用者，两句话均符合定义。$q$, NULL, NULL, 'keep'),(353479, $q$虚拟化是对计算机资源的逻辑抽象，抽象后的资源可按访问原资源的方式访问，且不受实现方式、地理位置和底层物理配置限制，表述正确。$q$, NULL, NULL, 'keep'),(353487, $q$虚拟化的目标就是简化基础设施、系统和软件等 IT 资源的表示、访问与管理，并通过标准接口完成输入输出，符合其定义。$q$, NULL, NULL, 'keep'),(353488, $q$虚拟化资源的使用者不限于人，最终用户、应用程序和服务都可以是虚拟化的使用者。$q$, NULL, NULL, 'keep'),(353493, $q$隔离使同一物理机上的虚拟机彼此不可感知、数据不泄露、故障不扩散，是保障虚拟化服务可用的关键手段。$q$, 'A', NULL, 'change_answer'),(353495, $q$独立性即硬件无关性，虚拟机以标准化的虚拟设备获得资源，可在不同物理平台上不加修改地运行和迁移，是数据中心管理的重要特性。$q$, NULL, NULL, 'keep'),(353524, $q$私有云即内部云，建立在私有网络上，为单一用户专用，能对数据、安全性和服务质量实施最有效控制，题干符合其定义。$q$, NULL, NULL, 'keep'),(353527, $q$私有云平台的作用就是向用户提供各类私有云计算服务、资源及相应的管理系统，表述正确。$q$, NULL, NULL, 'keep'),(353629, $q$百度网盘是典型的云计算存储服务，为用户提供一定容量的免费存储空间，超出或增值功能需付费，符合云存储服务的常见模式。$q$, NULL, NULL, 'keep'),(353635, $q$私有云可由组织自行管理和运营，也可委托第三方托管运维，其核心特征是专供单一组织使用，而非管理主体唯一。$q$, NULL, NULL, 'keep'),(353666, NULL, NULL, NULL, 'unresolved'),(354345, NULL, NULL, NULL, 'unresolved'),(354346, $q$该表述与大数据通行定义一致，强调常规软件工具难以在限定时间内处理、需采用新处理模式，属于海量、高增长率、多样化的信息资产。$q$, NULL, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    stem = coalesce(e.stem, q.stem),
    qc_grade = 'good',
    answer_check = 'match'
FROM judge_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM judge_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.stem IS NULL OR q.stem = e.stem);
  IF n <> 23 THEN RAISE EXCEPTION '第 3 批写入数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 2 THEN RAISE EXCEPTION '第 3 批保留数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '第 3 批改答案数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN judge_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
