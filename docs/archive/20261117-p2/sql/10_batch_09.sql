-- P2 第 9 批（25 道；html=0 colon=0 prefix=25）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(342572, NULL, NULL, $q$共享以太网是一种总线结构的局域网，所有的计算机通过以太网卡和电缆连接到一条总线上，并采用广播方式进行相互间的数据通信。$q$),(342573, NULL, NULL, $q$最常用的交换式局域网是使用交换式集线器构成的交换式以太网。$q$),(342574, NULL, NULL, $q$由于互联网中各子网结构相同便于互连，所以在短短几十年的时间就遍布全世界。$q$),(342575, NULL, NULL, $q$以太网通过路由器与FDDI网相连，自以太网发送的IP数据报经路由器传往FDDI网时，必须由路由器将数据报封装成FDDI帧格式才能在FDDI网上传输。$q$),(342576, NULL, NULL, $q$互联网上使用的网络协议是严格按ISO制定的OSI/RM来设计的。$q$),(342577, NULL, NULL, $q$在TCP/IP协议中，IP数据报实际上只需包含目的地地址，而不需要源IP地址。$q$),(342578, NULL, NULL, $q$互联网中的每一台计算机都有一个IP地址，路由器可以没有。$q$),(342579, NULL, NULL, $q$目前市场上提供多种家用无线路由器，如D-LINK、TP-LINK，组网时大多采用Web方式对其进行参数设置。$q$),(342580, NULL, NULL, $q$互联网中一台主机一旦申请了域名，那么就不能再使用IP地址对它进行访问。$q$),(342581, NULL, NULL, $q$在互联网中，一台主机从一物理网迁移到另一物理网，其IP地址必须更换，但域名可以保持不变。$q$),(342582, NULL, NULL, $q$域名为www.nju.edu.cn的服务器，若对应的IP地址为202.119.32.7，则通过域名和IP地址都可以实现对服务器的访问。$q$),(342583, NULL, NULL, $q$拨号上网的用户一般都有一个固定的IP地址。$q$),(342584, NULL, NULL, $q$家庭使用的固定电话线路是用来在打电话时传输语音信号的，它不能用来传输数据。$q$),(342585, NULL, NULL, $q$用户在使用Cable MODEM上网的同时可以收看电视节目。$q$),(342587, NULL, NULL, $q$用户安装ADSL时，可以专门为ADSL申请一条单独的线路，也可以改造已有电话线路。$q$),(342590, NULL, NULL, $q$网站中的起始网页称为主页，用户通过访问主页就可以直接或间接地访问其他网页。$q$),(342591, NULL, NULL, $q$一个完整的URL应包括所要访问的服务器提供的服务类型（协议）、服务器地址、端口号、路径和文件名。$q$),(342592, NULL, NULL, $q$通过Web浏览器不仅能下载和浏览网页，而且还能进行E-mail、Telnet、FTP等其它Internet服务。$q$),(342593, NULL, NULL, $q$浏览器可以下载安装一些插入式应用程序（插件），以扩展浏览器的功能，不会因此而感染计算机病毒。$q$),(342594, NULL, NULL, $q$互联网提供的FTP和Telnet服务都采用了客户机/服务器的工作方式。$q$),(342595, NULL, NULL, $q$网络信息安全只需要考虑信息使用者是否安全就可以了。$q$),(342596, NULL, NULL, $q$由于无线网络采用无线信道传输数据，所以更要考虑传输过程中的安全问题。$q$),(342597, NULL, NULL, $q$从理论上说，所有的密码都可以用穷举法破解，因此使用任何高强度的加密方法都是无效的。$q$),(342598, NULL, NULL, $q$数字签名在电子政务、电子商务等领域中应用越来越普遍，我国法律规定，它与手写签名或盖章具有同等的效力。$q$),(342599, NULL, NULL, $q$在ATM柜员机取款时，使用银行卡加口令进行身份认证，这种做法称为"双因素认证"，安全性较高。$q$)
;
UPDATE t_question q
SET option_json = coalesce(e.option_new, q.option_json),
    analysis = coalesce(e.analysis_new, q.analysis),
    stem = coalesce(e.stem_new, q.stem)
FROM p2_expected e
WHERE q.id = e.id AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.option_new IS NOT NULL AND q.option_json = e.option_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 9 批 HTML 更新数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 9 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 25 THEN RAISE EXCEPTION '第 9 批前缀修复数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 9 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 9 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
