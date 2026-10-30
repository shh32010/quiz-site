-- 知识点 306 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_306
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_306 as
select * from t_knowledge_point where id in (30366,30674,30831,30835,31506,31590,31591,31600,31716,31895,32004,32566,32571,32572,32573);

update t_knowledge_point set title = $kp$小型局域网组建任务要求$kp$, content = $kp$1. 使用一台交换机和 2 台 PC 互连，组建一个小型局域网。
2. 设置 PC 机的 IP 地址。
3. 验证 PC 机之间可以互通。$kp$, section = '' where id = 30366;
update t_knowledge_point set title = $kp$用 VLAN 隔离财务部与销售部$kp$, content = $kp$公司财务部、销售部的 PC 通过 2 台交换机实现通信。要求同一部门内的 PC 可以互通，但为了数据安全，销售部与财务部之间需要互相隔离，现需在交换机上做适当配置（划分 VLAN）来实现这一目标。

拓扑：4 台 PC（PC0～PC3）分别通过 Fa0 接口接入 2 台交换机，交换机之间级联。$kp$, section = '' where id = 30674;
update t_knowledge_point set title = $kp$查看交换机 VLAN 信息$kp$, content = $kp$1005 trnet-default active

VLAN  Type  SAID     MTU   Parent  RingNo  BridgeNo  Stp  BrdgMode  Trans1  Trans2
1     enet  100001   1500  -       -       -         -    -         0       0
2     enet  100002   1500  -       -       -         -    -         0       0
3     enet  100003   1500  -       -       -         -    -         0       0
1002  fddi  101002   1500  -       -       -         -    -         0       0$kp$, section = '' where id = 30831;
update t_knowledge_point set title = $kp$两台 PC 通过交换机互连的操作步骤$kp$, content = $kp$第一步：使用直通线连接 3 者。PC0 用 Fa0 接交换机 Fa0/1，PC1 用 Fa0 接交换机 Fa0/2。

第二步：设置 IP 地址。点击 PC0，选择【桌面】，点击【IP 地址配置】，配置如下：IP 地址 192.168.1.2，子网掩码 255.255.255.0，默认网关 192.168.1.1。点击 PC1，操作同上，把 IP 地址改为 192.168.1.3 即可。

第三步：验证 PC 机间互通。点击 PC0，选择【桌面】，点击【命令提示符】，输入命令 ping 192.168.1.3，得到 Reply 响应。

命令提示符输出示例：
C:\>ping 127.0.0.1
Pinging 127.0.0.1 with 32 bytes of data:
Reply from 127.0.0.1: bytes=32 time=6ms TTL=128
Reply from 127.0.0.1: bytes=32 time=1ms TTL=128
Reply from 127.0.0.1: bytes=32 time=2ms TTL=128
Reply from 127.0.0.1: bytes=32 time=2ms TTL=128
Ping statistics for 127.0.0.1: Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds: Minimum = 1ms, Maximum = 6ms, Average = 2ms

C:\>ping 192.168.1.1
Pinging 192.168.1.1 with 32 bytes of data:
Request timed out.（连续 4 次）$kp$, section = '' where id = 30835;
update t_knowledge_point set title = $kp$568A 线序$kp$, content = $kp$568A 标准线序（从左到右，1～8 脚）：绿白、绿、橙白、蓝、蓝白、橙、棕白、棕。$kp$, section = '' where id = 31506;
update t_knowledge_point set title = $kp$交叉线线序$kp$, content = $kp$交叉线一般用于连接同种设备，比如电脑之间直连。交叉线即同一根网线的两端使用不同的线序：一头是 568A 标准，另一头是 568B 标准。$kp$, section = '' where id = 31590;
update t_knowledge_point set title = $kp$568B 线序$kp$, content = $kp$568B 标准线序（从左到右，1～8 脚）：橙白、橙、绿白、蓝、蓝白、绿、棕白、棕。$kp$, section = '' where id = 31591;
update t_knowledge_point set title = $kp$双绞线$kp$, content = $kp$双绞线（Twisted-pair）由互相绝缘的一对铜导线绞扭在一起组成，对称均匀的绞扭可以减少线对之间的电磁干扰。每根线加绝缘层并用颜色来标记，只有将双绞线装上 RJ45（俗称水晶头）后，才能与设备相连。

双绞线分为屏蔽双绞线和无屏蔽双绞线。无屏蔽双绞线电缆（Unshielded Twisted Pair，UTP）由不同颜色（橙、绿、蓝、棕）的四对双绞线组成。屏蔽双绞线（Shielded Twisted Pair，STP）电缆的外层由铝箔包裹，价格相对高一些，并且需要支持屏蔽功能的特殊连接器和适当的安装技术，但是传输速率比相应的无屏蔽双绞线高。$kp$, section = '' where id = 31600;
update t_knowledge_point set title = $kp$网线接口 RJ45$kp$, content = $kp$网线接口为 RJ45。$kp$, section = '' where id = 31716;
update t_knowledge_point set title = $kp$查看主机 MAC 地址的命令$kp$, content = $kp$获得主机 MAC 地址的方法是使用 winipcfg 命令（适用于 Windows 9x）或 ipconfig /all 命令（适用于 Windows 2000/XP）。$kp$, section = '' where id = 31895;
update t_knowledge_point set title = $kp$设置计算机名、工作组并检测连通性$kp$, content = $kp$右击桌面【我的电脑】，在弹出的快捷菜单中选择【属性】，在【系统属性】对话框中单击【网络标识】标签，单击【属性】按钮，打开【标识更改】对话框。

在【计算机名称】中输入唯一的标识名称，如 student-01、student-02、student-03、student-04；在【工作组】中填入本机所在的工作组名称，如 workgroup。单击【确定】按钮后弹出提示对话框，按提示重启计算机，使标识与工作组的修改生效。

IP 地址规划：Student-01 为 192.168.0.1，Student-02 为 192.168.0.2，Student-03 为 192.168.0.3，Student-04 为 192.168.0.4，子网掩码均为 255.255.255.0。

检测网络连通性：选择网中的一台计算机，在该机“开始”菜单的“查找”中选择“计算机”，进入“查找计算机”对话框，输入要查找的计算机名（如 student-01），单击“开始查找”按钮。把网中的计算机逐一查找，全部能找到后，说明网络没有问题；也可使用 ping 命令测试连通性。$kp$, section = '' where id = 32004;
update t_knowledge_point set title = $kp$组网硬件清单$kp$, content = $kp$① 交换机 1 台（端口速率 10/100Mb/s，24 个端口）；
② 网卡若干块（RJ-45 接口，带宽 10/100Mb/s）；
③ 5 类或超 5 类非屏蔽双绞线若干；
④ 水晶头若干（每台计算机至少 2 个）；
⑤ 网线钳 1 把；
⑥ 测线仪 1 个。$kp$, section = '' where id = 32566;
update t_knowledge_point set title = $kp$直通线与交叉线的用法$kp$, content = $kp$① 直通线：一般用于连接不同设备，比如电脑与交换机（或 Hub）、路由器与交换机（或 Hub）。即同一根网线的两端使用同样的线序，要么都是 568A 标准，要么都是 568B 标准。

② 交叉线：一般用于连接同种设备，比如电脑之间直连。即同一根网线的两端使用不同的线序，一头是 568A 标准，另一头是 568B 标准。

标准线序：
568A：绿白、绿、橙白、蓝、蓝白、橙、棕白、棕。
568B：橙白、橙、绿白、蓝、蓝白、绿、棕白、棕。

选用原则：主机到交换机/集线器、路由器到交换机/集线器用直通线；主机到主机、路由器到路由器、交换机到交换机、集线器到集线器、路由器到主机用交叉线。$kp$, section = '' where id = 32571;
update t_knowledge_point set title = $kp$传输介质：有线介质与无线介质$kp$, content = $kp$传输介质分为有线介质和无线介质。

有线介质（长距离传输需要中继器放大信号）：
双绞线：即 RJ-45 水晶头网线，如 5 类线，用于建筑物内部，价格低廉，传输距离有限。
同轴电缆：如有线电视线，在建筑物内部使用。
光纤：价格昂贵、成本高，通信距离长，可达万米以上。
中继器的作用是放大信号并继续传递。

无线介质：使用最多的是微波，可以直接传播，例如手机 WiFi 上网使用的就是微波。蓝牙是一种短距离、低速率、低成本的无线通信技术，是个人无线区域网协议（802.15）的基础。

载波信号是频率比被传输信号高得多的正弦波。$kp$, section = '' where id = 32572;
update t_knowledge_point set title = $kp$由子网号位数推算子网掩码$kp$, content = $kp$划分子网时，子网掩码前三个字节为默认子网掩码，第四个字节的前三个比特为 1、后五个比特为 0，因此子网掩码为 255.255.255.11100000，即 255.255.255.224。$kp$, section = '' where id = 32573;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30366,30674,30831,30835,31506,31590,31591,31600,31716,31895,32004,32566,32571,32572,32573) and not deleted) <> 15 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
