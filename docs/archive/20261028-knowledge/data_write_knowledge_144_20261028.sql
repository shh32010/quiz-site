-- 知识点 144 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_144
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_144 as
select * from t_knowledge_point where id in (23736,25499,26251,27579,27661,28544,29111,29585,29681);

update t_knowledge_point set title = $kp$通信系统模型、5G 场景与事务特性$kp$, content = $kp$## 光缆的特点

- 重量轻，便于铺设。
- 抗灾能力弱，建设费用高。

## 通信系统的模型

基本要素：信源、信道、信宿。

## 超高可靠低延迟通信

连接时延要达到 1 ms 级别，且支持高速移动（500 km/h）情况下的高可靠性（99.999%）连接，使过程自动化、配置自动化、自动驾驶、智能交通、远程医疗等应用成为现实。

## 事务的 ACID 特性

事务有四个特性，简称为 ACID，取自这四个特性英文名称的首字母。

- 原子性（Atomicity）：事务不可分割，原子是最小的单位，事务中的数据库操作要么全部成功，要么全部失败，不会出现一部分成功、一部分失败的情况。
- 一致性（Consistency）：事务操作确保数据库状态保持一致性。事务提交前后数据库状态会发生改变，但始终保持一致，例如购买商品，一旦完成一笔交易，数据库中的商品数必然减 1，同时商店收益必然增加。$kp$, section = '' where id = 23736;
update t_knowledge_point set title = $kp$光纤接入$kp$, content = $kp$光纤通信以光信息为载体，在光纤中传输信息。通信时需要将电信号转换成光信号，经光纤传输到目的地后，再将光信号转换成电信号。光纤入户（FTTH）强调的是光纤从运营商的机房直接连接到用户的居所。光纤通信有很多优点，如通信容量大、传输损耗低、中继距离长等。$kp$, section = '' where id = 25499;
update t_knowledge_point set title = $kp$无线传输$kp$, content = $kp$电磁波可以以有线方式在同轴电缆、双绞线、光纤中传输，也可以以无线方式在自由空间中传播。目前以无线方式进行通信的主要有无线电（Radio）、微波（Microwave）、红外（Infrared）和可见光（Visible Light）等。$kp$, section = '' where id = 26251;
update t_knowledge_point set title = $kp$光盘的存储原理$kp$, content = $kp$光盘基片是一种耐热的有机玻璃，用于记录数据的是一条由里向外的连续螺旋轨道。它通过在盘面上压制凹坑的方法来记录信息：凹坑边缘表示“1”，凹坑平坦部分表示“0”。$kp$, section = '' where id = 27579;
update t_knowledge_point set title = $kp$ADSL 的三个信息通道$kp$, content = $kp$ADSL 在电话线上得到三个信息通道：电话语音通道、上行通道（速率 640 kb/s ～ 1 Mb/s）、下行通道（速率 1 ～ 8 Mb/s）。下行速率大于上行速率。$kp$, section = '' where id = 27661;
update t_knowledge_point set title = $kp$光纤通信的光中继器$kp$, content = $kp$光信号在光纤中传输时会随距离衰减，因此光纤通信在长距离传输时需设置光中继器，对光信号进行放大和再生。$kp$, section = '' where id = 28544;
update t_knowledge_point set title = $kp$DVD 与 CD 的存储容量差异$kp$, content = $kp$DVD 光盘的道间距比 CD 盘小，信息凹坑更密集，它使用聚焦更细的红色激光进行信息的读取，盘片的存储容量更大。$kp$, section = '' where id = 29111;
update t_knowledge_point set title = $kp$RFID 的无障碍读取$kp$, content = $kp$无障碍读取：RFID 能够穿透纸张、木材和塑料等非金属或非透明的材质，进行无线通信。$kp$, section = '' where id = 29585;
update t_knowledge_point set title = $kp$同轴电缆$kp$, content = $kp$- 传输方式：用电信号来传递信息。
- 优点：良好的传输特性和屏蔽特性（比双绞线好）。
- 缺点：传输速率取决于电缆长度。
- 定位：用于主要传输干线，可以构成大容量的载波通信系统。
- 分类：基带（50 欧，数字信号）、宽带（75 欧，模拟信号）。
- 常见应用：有线电视系统（模拟信号）、局域网（数字信号）。$kp$, section = '' where id = 29681;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (23736,25499,26251,27579,27661,28544,29111,29585,29681) and not deleted) <> 9 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
