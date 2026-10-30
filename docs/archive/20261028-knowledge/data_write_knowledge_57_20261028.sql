-- 知识点 57 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_57
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_57 as
select * from t_knowledge_point where id in (21995,23333,23366,23413,23440,23441,26711,27195,27196,27248,28077,28078,28079,28080,28270,28289,28499,28743,28745,28830,28905);

update t_knowledge_point set title = $kp$打印机性能指标$kp$, content = $kp$① 打印精度：打印机的分辨率，用dpi（每英寸可打印的点数）表示，是衡量图像清晰程度最重要的指标。
② 打印速度：针式打印机用每秒钟打印的字符数目表示；激光打印机、喷墨打印机用每分钟打印的页数表示。
③ 色彩表现能力：打印机可打印的不同颜色的总数。
其他：打印成本、噪音、可打印的幅面大小、功耗及节能指标、可打印的拷贝数目、与主机的接口类型等。$kp$, section = '' where id = 21995;
update t_knowledge_point set title = $kp$显示器主要性能参数$kp$, content = $kp$显示屏尺寸：显示屏对角线的长度，如15寸、17寸、19寸、22寸等。传统显示屏宽高比一般为4:3，现在多数液晶显示器的宽高比为16:9或16:10。
分辨率：整屏最多可显示的像素数，用“水平分辨率×垂直分辨率”表示，如1024×768、1280×1024、1600×1200、1920×1080、1920×1200等。
刷新速率：所显示的图像每秒钟更新的次数。刷新频率越高，图像稳定性越好。PC机显示器的画面刷新速率一般在60Hz以上。
可显示的颜色数目：一个像素可显示多少种颜色，由表示该像素的二进制数的位数决定。
辐射和环保：显示器工作时产生的辐射对人体有不良影响，也会产生信息泄漏，影响信息安全。显示器必须达到国家显示器能效标准并通过MPRII和TCO认证（电磁辐射标准），以节约能源、保证人体安全和防止信息泄漏。$kp$, section = '' where id = 23333;
update t_knowledge_point set title = $kp$打印机主要性能指标（激光/喷墨）$kp$, content = $kp$打印精度（分辨率）：用每英寸多少点（像素）表示，单位为dpi，一般产品为400dpi、600dpi、800dpi，高的可达1000dpi以上。
打印速度：页/分（通常每分钟3～10页）。
色彩表现能力（彩色数目）。
可打印幅面大小：A3、A4等。
与主机的接口：并行口、SCSI口、USB接口。
其他：打印成本、噪音、功耗等。$kp$, section = '' where id = 23366;
update t_knowledge_point set title = $kp$打印精度（分辨率）的意义$kp$, content = $kp$打印精度越高，图像越清晰，边缘越光滑。$kp$, section = '' where id = 23413;
update t_knowledge_point set title = $kp$显卡的性能指标$kp$, content = $kp$绘图处理器（图形引擎）类型。
显存容量：128MB～2GB，大多采用DDR2、GDDR3或GDDR4存储器。
主机接口：PCI-E x16（4GB/s）；AGP x4、x8（已很少使用）。
显示器接口：VGA接口（D-Sub接口）为模拟接口；DVI接口为数字接口；HDMI为全高清多媒体接口，以无压缩方式传送1920×1200的数字视频信号和5.1声道音频信号。$kp$, section = '' where id = 23440;
update t_knowledge_point set title = $kp$显示器的性能参数$kp$, content = $kp$显示屏尺寸与屏幕宽高比：屏幕尺寸以对角线长度度量，如15吋、17吋、19吋、22吋等；宽高比方面，普通屏为4:3，宽屏为16:10或16:9。
显示分辨率：水平像素个数×垂直像素个数，如1920×1200、1280×1024、1024×768、800×600、640×480；在显卡的控制下，屏幕分辨率是可以设置的。
刷新速率：画面每秒钟更新的次数。刷新速率越高，图像稳定性越好。
响应时间：LCD像素点对输入信号的反应速度，响应时间越小越好。
亮度和对比度。
背光源类型：LED或荧光灯管。
辐射和环保。$kp$, section = '' where id = 23441;
update t_knowledge_point set title = $kp$常用输出设备的主要性能参数与接口$kp$, content = $kp$1) 绘图仪的性能指标主要有绘图笔数、图纸尺寸、分辨率、接口形式及绘图语言等。绘图仪一般还可选配多种与计算机连接的标准接口。
2) 显示器的参数包括点距、分辨率、扫描频率、刷新速度、功耗、电磁辐射等，接口主要有VGA、DVI、HDMI、USB、DP等。
3) 打印机的指标包括最高分辨率、打印速度、喷头配置、打印机内存、接口类型、支持的操作系统。目前市场上打印机的主要接口类型包括并行接口和USB接口。
4) 磁记录器件的主要性能参数：物理-机械性能、磁性能、电性能。$kp$, section = '' where id = 26711;
update t_knowledge_point set title = $kp$针式打印机打印速度的度量方式$kp$, content = $kp$针式打印机的打印速度通常以每秒钟可打印的字符个数或者行数来度量。$kp$, section = '' where id = 27195;
update t_knowledge_point set title = $kp$激光打印机和喷墨打印机的速度单位$kp$, content = $kp$激光打印机和喷墨打印机的速度单位是每分钟打印的页数（PPM）。打印机与主机连接的接口有USB、并口、火线接口。$kp$, section = '' where id = 27196;
update t_knowledge_point set title = $kp$VGA、DVI显示器接口$kp$, content = $kp$VGA、DVI均为显示器接口。$kp$, section = '' where id = 27248;
update t_knowledge_point set title = $kp$打印机的打印速度$kp$, content = $kp$打印速度是打印机的主要性能指标之一。$kp$, section = '' where id = 28077;
update t_knowledge_point set title = $kp$针式打印机的打印速度$kp$, content = $kp$针式打印机的打印速度通常以每秒钟可打印的字符个数或者行数来度量。$kp$, section = '' where id = 28078;
update t_knowledge_point set title = $kp$激光打印机和喷墨打印机的速度单位（PPM）$kp$, content = $kp$激光打印机和喷墨打印机的速度单位是每分钟打印的页数（PPM）。$kp$, section = '' where id = 28079;
update t_knowledge_point set title = $kp$打印机与主机连接的接口$kp$, content = $kp$打印机与主机连接的接口有USB、并口、火线接口。$kp$, section = '' where id = 28080;
update t_knowledge_point set title = $kp$显卡的接口$kp$, content = $kp$显卡的接口为PCI-E x16。$kp$, section = '' where id = 28270;
update t_knowledge_point set title = $kp$打印机的性能指标$kp$, content = $kp$打印机的性能指标包括打印精度、打印速度（喷墨和激光打印机用PPM表示）、色彩数目和打印成本。$kp$, section = '' where id = 28289;
update t_knowledge_point set title = $kp$显卡接口的发展$kp$, content = $kp$显卡的接口已经从AGP接口发展到PCI-E x16接口。$kp$, section = '' where id = 28499;
update t_knowledge_point set title = $kp$真彩色（24位）可显示的颜色数$kp$, content = $kp$彩色显示器的颜色由三基色R、G、B合成，若采用真彩色（24位）表示，则可显示出2^24种颜色（即1600多万种）。$kp$, section = '' where id = 28743;
update t_knowledge_point set title = $kp$打印机的类别与性能指标$kp$, content = $kp$打印机的类别有三种：针式、喷墨、激光。性能指标有打印精度（dpi）、打印速度（PPM）、色彩数目、耗材成本等；与主机的接口主要有并行口、USB接口和SCSI接口。$kp$, section = '' where id = 28745;
update t_knowledge_point set title = $kp$针式打印机的优点$kp$, content = $kp$针式打印机的优点是能多层套打，适用于票据打印；针式打印机用每秒打印的字符数或者行数来衡量打印速度。$kp$, section = '' where id = 28830;
update t_knowledge_point set title = $kp$显示器刷新频率$kp$, content = $kp$计算机必备的输出设备是显示器。显示器显示的图像每秒钟更新的次数称为刷新频率，它影响显示器显示信息的稳定性。$kp$, section = '' where id = 28905;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21995,23333,23366,23413,23440,23441,26711,27195,27196,27248,28077,28078,28079,28080,28270,28289,28499,28743,28745,28830,28905) and not deleted) <> 21 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
