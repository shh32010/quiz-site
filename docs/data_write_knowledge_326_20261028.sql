-- 知识点 326 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_326
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_326 as
select * from t_knowledge_point where id in (30271,30310,30312,30316,30324,30339,30361,30373,30376,30377,30398,30583,30842,30844,30847,30848,30930,31046,31051,31052,31070,31071,31072,31078,31081,31093,31101,31104,31110,31115,31122,31126,31128,31129,31162,31203,31210,31214,31256,31270,31282,31284,31295,31300,31523,31530,31532,31604,31613,31723,31746,32593,32596,32619,32620,32621,32622,32623,32647,32655,32704);

update t_knowledge_point set title = $kp$initramfs 内存文件系统$kp$, content = $kp$CentOS 6.x 使用 initramfs 内存文件系统取代了 CentOS 5.x 中的 initrd RAM Disk。二者作用类似：由启动引导程序加载到内存中，然后加载启动过程中所需的内核模块，例如 USB、SATA、SCSI 硬盘的驱动以及 LVM、RAID 文件系统的驱动。

```
mkdir /tmp/initramfs
```$kp$, section = '' where id = 30271;
update t_knowledge_point set title = $kp$VMware 的主要特点$kp$, content = $kp$◆ 不需要分区或重新开机，就能在同一台 PC 上使用两种以上的操作系统。
◆ 本机系统可以与虚拟机系统网络通信。
◆ 可以设定并随时修改虚拟机操作系统的硬件环境。$kp$, section = '' where id = 30310;
update t_knowledge_point set title = $kp$什么是 Linux$kp$, content = $kp$Linux 是以 Intel 系列 CPU（Cyrix、AMD 的 CPU 也可）为硬件平台、完全免费的 UNIX 兼容系统，完全适用于个人 PC。它本身就是一个完整的 32 位多用户多任务操作系统，因此不需要先安装 DOS 或其他操作系统（MS Windows、OS/2、MINIX 等）即可直接安装。

Linux 最早起源于 1991 年 10 月 5 日，芬兰大学生 Linus Torvalds 写出了 Linux 内核的 0.02 版，其后的发展几乎都是由互联网上的 Linux 社团交流完成。Linux 不属于任何一家公司或个人，任何人都可以免费取得甚至修改它的源代码。

Linux 上的大部分软件由 GNU 倡导发展而来，通常附有 GNU General Public License（GPL）而自由传播。GPL 是一种可以免费获得自由软件的许可证，因此 Linux 使用者的使用基本不受限制（只要不用于商业目的），不必像使用微软产品那样为购买许可证付出高价，还要受系统安装数量的限制。

常见的 Linux 发行版本有 Red Hat、Slackware、Caldera、Debian、Red Flag（红旗）、Blue Point（蓝点）、Xteam Linux（冲浪）、Happy Linux、Xlinux 等。$kp$, section = '' where id = 30312;
update t_knowledge_point set title = $kp$安装 Linux 的好处$kp$, content = $kp$Linux 的内核具有 Windows 无法比拟的稳定性和高效率；不使用 X Window 时占用系统资源较少，可使一台 Intel 486 成为高效工作站。对于想学习 UNIX 的用户，它是熟悉 UNIX 操作环境、通往高手境界的一大捷径。Linux 上有公认的 C 语言最好编译器 gcc，适合构建效率更高的开发环境（不一定最友好，但一定最强大）。$kp$, section = '' where id = 30316;
update t_knowledge_point set title = $kp$Linux 系列讲座前言$kp$, content = $kp$Linux 是 1991 年发展起来的与 UNIX 兼容的操作系统，可以免费使用，源代码可以自由传播并任人修改、充实、发展，开发者的初衷是共同创造一个完美、理想并可以免费使用的操作系统。

讲座的目的不是让听众成为 UNIX 类操作系统的高手，而是在听众中普及 Linux 基础知识，为今后更深入地了解 Linux 做一个好的开端。$kp$, section = '' where id = 30324;
update t_knowledge_point set title = $kp$重新挂载文件系统使修改生效$kp$, content = $kp$修改挂载相关配置后，需要重新挂载文件系统或重启系统，才能使修改生效。$kp$, section = '' where id = 30339;
update t_knowledge_point set title = $kp$内核启动参数 rhgb、quiet 与 vga$kp$, content = $kp$GRUB 内核行中的常用启动参数：

◆ rd_NO_LVM：不加载 LVM 相关模块
◆ rd_NO_DM：不加载 device-mapper 相关模块
◆ rhgb：以图形方式显示启动过程
◆ quiet：启动时不输出详细信息
◆ vga=791：设置控制台显示模式，791 对应 1024×768、16 位色深$kp$, section = '' where id = 30361;
update t_knowledge_point set title = $kp$生成 GRUB 加密密码串$kp$, content = $kp$用 grub-md5-crypt 生成 MD5 加密密码串，再把 password --md5 与该密码串写入 /boot/grub/grub.conf：

```
[root@localhost ~]# vi /boot/grub/grub.conf

default=0
timeout=5
password --md5 $1$Y84LB1$8tMY2PibScmuOCc8z8U35/
```$kp$, section = '' where id = 30373;
update t_knowledge_point set title = $kp$last 命令$kp$, content = $kp$命令名称：last
命令所在路径：/usr/bin/last
执行权限：所有用户
语法：last
功能描述：列出目前与过去登录系统的用户信息
范例：

```
# last
```$kp$, section = '' where id = 30376;
update t_knowledge_point set title = $kp$lastlog 命令$kp$, content = $kp$命令名称：lastlog
命令所在路径：/usr/bin/lastlog
执行权限：所有用户
语法：lastlog
功能描述：检查特定用户上次登录的时间
范例：

```
# lastlog
# lastlog -u 502
```$kp$, section = '' where id = 30377;
update t_knowledge_point set title = $kp$VGA 参数与内核分辨率支持$kp$, content = $kp$不同色深与分辨率对应的 vga 参数值：

| 色深 | 640×480 | 800×600 | 1024×768 | 1280×1024 |
| --- | --- | --- | --- | --- |
| 8 位 | 769 | 771 | 773 | 775 |
| 15 位 | 784 | 787 | 790 | 793 |
| 16 位 | 785 | 788 | 791 | 794 |
| 32 位 | 786 | 789 | 792 | 795 |

把对应数值加到 /boot/grub/grub.conf 的内核行末尾：

```
vi /boot/grub/grub.conf
kernel /vmlinuz-2.6.32-279.el6.i686 ro root=UUID=b9a7a1a8-767f-4a87-8a2b-a535edb362c9 rd_NO_LUKS KEYBOARDTYPE=pc KEYTABLE=us rd_NO_MD crashkernel=auto LANG=zh_CN.UTF-8
```$kp$, section = '' where id = 30398;
update t_knowledge_point set title = $kp$UNIX 发展历史与主要发行版本$kp$, content = $kp$1971 年，肯·汤普森的同事丹尼斯·里奇发明了 C 语言；1973 年，UNIX 系统的绝大部分源代码用 C 语言重写，为提高 UNIX 系统的可移植性打下基础。

UNIX 主要发行版本：

| 操作系统 | 公司 | 硬件平台 |
| --- | --- | --- |
| AIX | IBM | PowerPC |
| HP-UX | HP | PA-RISC |
| Solaris | Sun | SPARC |
| Linux | Red Hat Linux、Ubuntu Linux 等 | IA（Intel、AMD、Cyrix、RISE 等） |$kp$, section = '' where id = 30583;
update t_knowledge_point set title = $kp$/etc/bashrc 的作用$kp$, content = $kp$◆ 设置 PS1 变量
◆ 设置 umask
◆ 设置 PATH 变量
◆ 调用 /etc/profile.d/*.sh 文件$kp$, section = '' where id = 30842;
update t_knowledge_point set title = $kp$/etc/login.defs 主要配置项$kp$, content = $kp$```
PASS_MAX_DAYS 99999    # 密码有效期
PASS_MIN_DAYS 0        # 密码修改间隔
PASS_MIN_LEN 5         # 密码最小长度（由 PAM 控制）
PASS_WARN_AGE 7        # 密码到期警告天数
UID_MIN 500            # 最小 UID
GID_MAX 60000          # 最大 GID
ENCRYPT_METHOD SHA512  # 加密模式
```$kp$, section = '' where id = 30844;
update t_knowledge_point set title = $kp$其他配置文件和登录信息$kp$, content = $kp$登录时读取的配置文件：/etc/profile、/etc/profile.d/*.sh、~/.bash_profile、~/.bashrc、/etc/bashrc。

加载顺序：

```
/etc/profile → ~/.bash_profile → ~/.bashrc → /etc/bashrc → 命令提示符
```

其中 /etc/profile 还会调用 /etc/profile.d/*.sh，例如 lang.sh 读取 /etc/sysconfig/i18n。$kp$, section = '' where id = 30847;
update t_knowledge_point set title = $kp$虚拟机配置信息$kp$, content = $kp$虚拟机磁盘大小 10 GB，网络连接采用桥接模式，状态为挂起，配置文件位于 D:\虚拟机和6.3\CentOS，硬件兼容性为 Workstation。$kp$, section = '' where id = 30848;
update t_knowledge_point set title = $kp$Linux 的其他嵌入式应用$kp$, content = $kp$◆ 智能家电：机顶盒、游戏机、数码相机等
◆ 智能卡系统
◆ 航空系统
◆ 银行系统
◆ 卡拉 OK 点歌系统$kp$, section = '' where id = 30930;
update t_knowledge_point set title = $kp$分区规划与文件系统结构$kp$, content = $kp$挂载与分区规划：

◆ 必须分区
/（根分区）
swap 分区（交换分区，内存的 2 倍，不超过 2 GB）

◆ 推荐分区
/boot（启动分区，200 MB）

文件系统结构：

```
/
├── boot
├── etc
│   ├── passwd
│   ├── shadow
│   └── group
└── home
```

分区与设备对应关系：

```
/boot  → /dev/sda1
/home  → /dev/sda2
/      → /dev/sda3
```$kp$, section = '' where id = 31046;
update t_knowledge_point set title = $kp$~/.bash_profile 的作用$kp$, content = $kp$◆ 调用 ~/.bashrc 文件。
◆ 在 PATH 变量后面加入 :$HOME/bin 目录。$kp$, section = '' where id = 31051;
update t_knowledge_point set title = $kp$~/.bashrc 的作用$kp$, content = $kp$◆ 定义默认别名
◆ 调用 /etc/bashrc$kp$, section = '' where id = 31052;
update t_knowledge_point set title = $kp$Linux 主要发行版本$kp$, content = $kp$Red Hat、CentOS、SuSE、Fedora、Gentoo、红旗 Linux、Mandriva、TurboLinux、Debian、Ubuntu、KNOPPIX。$kp$, section = '' where id = 31070;
update t_knowledge_point set title = $kp$Linux 内核官网$kp$, content = $kp$Linux 内核官网：www.kernel.org$kp$, section = '' where id = 31071;
update t_knowledge_point set title = $kp$Linux 发展历史$kp$, content = $kp$Linux 系统诞生于 1991 年，由芬兰大学生 Linus Torvalds（李纳斯）和后来陆续加入的众多爱好者共同开发完成。Linux 是开源软件，是源代码开放的 UNIX。$kp$, section = '' where id = 31072;
update t_knowledge_point set title = $kp$GRUB 整体设置中的 password 选项$kp$, content = $kp$password 选项放在 grub.conf 的整体设置处，对该文件中的所有启动项生效。

```
password --md5 <加密密码串>
splashimage=(hd0,0)/grub/splash.xpm.gz
hiddenmenu
…省略部分内容…
```$kp$, section = '' where id = 31078;
update t_knowledge_point set title = $kp$reboot、shutdown 等关机命令$kp$, content = $kp$◆ shutdown
语法：shutdown [参数选项] [时间] [警告信息]
说明：安全地将系统关机，该命令只能由超级用户使用。

◆ reboot
语法：reboot
说明：终止系统并重新引导系统。

◆ halt、poweroff
语法：halt、poweroff
说明：停机命令。

◆ init
语法：init 运行级
说明：改变运行级别。$kp$, section = '' where id = 31081;
update t_knowledge_point set title = $kp$grub.conf 配置说明$kp$, content = $kp$```
vi /boot/grub/grub.conf

default=0
timeout=5
splashimage=(hd0,0)/grub/splash.xpm.gz
hiddenmenu
title CentOS (2.6.32-279.el6.i686)
    root (hd0,0)
    kernel /vmlinuz-2.6.32-279.el6.i686 ro root=UUID=b9a7a1a8-767f-4a87-8a2b-a535edb362c9 rd_NO_LUKS KEYBOARDTYPE=pc KEYTABLE=us rd_NO_MD crashkernel=auto LANG=zh_CN.UTF-8 rd_NO_LVM rd_NO_DM rhgb quiet
    initrd /initramfs-2.6.32-279.el6.i686.img
```

◆ default=0：默认启动第一个系统
◆ timeout=5：菜单等待时间，默认 5 秒
◆ splashimage：指定 GRUB 启动时背景图像文件的保存位置
◆ hiddenmenu：隐藏菜单
◆ title：启动项标题
◆ root (hd0,0)：指定启动程序所在分区
◆ kernel：指定内核文件及其加载选项，root=UUID=… 指定根分区，rd_NO_LUKS、KEYBOARDTYPE、KEYTABLE、rd_NO_MD、crashkernel、LANG、rd_NO_LVM、rd_NO_DM、rhgb、quiet 均为内核加载选项
◆ initrd：指定 initramfs 内存文件系统镜像文件的位置$kp$, section = '' where id = 31093;
update t_knowledge_point set title = $kp$Linux 安装过程$kp$, content = $kp$安装是初学者最容易卡住的环节，新手常遇到系统屡装不成的情况，几乎每个人都会经历。由于篇幅有限，讲义正文不展开这部分内容，而把它放在附文 2 中详细说明，课堂上也会演示一遍安装过程。$kp$, section = '' where id = 31101;
update t_knowledge_point set title = $kp$如何获取 Linux$kp$, content = $kp$大多数 Linux 发行版本和内核都可以从网上下载，但内核就有几十 MB，完整的发行版本约 1 GB，下载耗时较长。建议直接到软件商店购买发行版光盘，价格低廉，也省去下载后还要刻盘的麻烦。$kp$, section = '' where id = 31104;
update t_knowledge_point set title = $kp$几种重要的配置文件$kp$, content = $kp$Linux 下的配置文件很多，初学者只需知道最常用的几个。这里介绍四个经典的配置文件：lilo.conf、passwd、inittab、fstab，其中重点介绍 lilo.conf。

1. lilo.conf

这是 Linux loader（lilo）的配置文件，直接关系到系统能否正确引导到 Linux。下面以它为例说明如何在一台机器上安装多个操作系统。

第一次安装 Linux 后，默认引导的系统是 Linux，但多数用户使用 Windows 的时间多于 Linux，最好把默认引导项改为 Windows，省去每次启动敲一串字符的麻烦。要修改引导顺序，就要修改 /etc/lilo.conf。用 vi 打开后内容如下：

```
boot=/dev/hda
map=/boot/map
install=/boot/boot.b
prompt
timeout=100
linear
default=xlinux
image=/boot/vmlinuz-2.2.14-5.0
    read-only
    root=/dev/hda4
other=/dev/hda1
    label=win
```

这个文件按从前到后的顺序引用，修改它就可以改变 lilo 执行时的一些特性。

第 5 行 timeout=100 设置在引导默认系统之前等待用户输入系统别名的时长，其单位并非秒级，可按实际需要设置。

第 7 行 default=xlinux 指明默认引导的系统别名是 xlinux，要改变默认引导顺序就要修改这里。

第 8 行到第 10 行指明引导 Linux 的细节：image=/boot/vmlinuz-2.2.14-5.0 指明内核所在位置，便于引导程序装载内核；read-only 表示以只读方式挂载；root=/dev/hda4 指明到第一块硬盘的第四个分区寻找 init 过程，并把引导控制权交给该分区的 init。

最后两行中，other=/dev/hda1 说明除 Linux 外还安装了别的操作系统（位于第一块硬盘的第一个分区），该路径一般在安装时已设置好，无需手工修改；label=win 指明该系统引导时使用的别名为 win。由于 lilo 按顺序引用，若要让默认引导的系统变成 Windows，需要把这两行移到 image=… 之前，建议放在 image=… 之前、default=… 之后。

完成上述两步后，还要把 default=… 改成 default=win。

改动结束后退出 vi，执行 lilo -v -v -v 更新 LILO，重启后在 lilo: 提示符处回车，系统就会默认引导到 Windows。

2. passwd

这个文件与用户口令有关。管理员一次新增大量用户时，逐个使用 adduser 相当麻烦，可以直接修改 /etc/passwd。利用 passwd 文件可以控制用户的口令状态及一些个人配置。普通单机用户使用不多，主要是多用户环境下的管理员使用。

3. inittab 和 fstab

这两个文件都存放在 /etc 目录下。inittab 用来配置 Linux 初始化的一些动作，最常用的是设定启动方式。fstab 用来设定启动时的挂接动作，主要是文件系统或外设的挂接，例如希望系统一开始就能使用光盘驱动器，可以把 mount 指令加到这个文件中。$kp$, section = '' where id = 31110;
update t_knowledge_point set title = $kp$SSH 会话选项分类$kp$, content = $kp$远程连接工具（192.168.17.2）的会话选项分类树：

```
连接 → 登录脚本 → SSH2 → SFTP 标签/高级 → 端口转发/远程/X11 → 终端 → 仿真 → 模式/Emacs/映射键/高级 → 外观 → 窗口/日志文件 → 打印 → 高级/Xmodem/Zmodem
```$kp$, section = '' where id = 31115;
update t_knowledge_point set title = $kp$查询并踢出已登录用户$kp$, content = $kp$先用 w 命令查询本机已登录的用户及其所在终端，再用 pkill 按终端强制终止该会话：

```
[root@localhost ~]# pkill -t -9 pts/1
```$kp$, section = '' where id = 31122;
update t_knowledge_point set title = $kp$修改系统默认运行级别$kp$, content = $kp$编辑 /etc/inittab，修改 initdefault 一行即可设定默认运行级别，例如设为 3：

```
id:3:initdefault:
```

查看当前运行级别：

```
[root@localhost ~]# runlevel
```$kp$, section = '' where id = 31126;
update t_knowledge_point set title = $kp$UNIX 网络指令$kp$, content = $kp$UNIX 提供网络连接功能，可以在不同机器上完成特定工作：在图形工作站上做图形处理、在 Sun 上读 News、到计算中心找别系的同学 talk 等。利用 UNIX 的网络指令，在自己的位置上就能连到各台机器工作，不必守在机房。

1. rlogin 与 rsh

rlogin 即 remote login，经由网络登录到另一台机器。格式：

```
rlogin host [-l username]
```

当远端机器上的用户名与本机不同时，必须用 -l username 指定，否则 rlogin 会假定两端用户名相同，第一次登录必然出错。

rsh 在远端机器上执行命令并把结果传回本机。格式：

```
rsh host [-l username] [command]
```

-l username 同样用于指定远端用户名；command 是要在远端执行的命令。若不指定 command，rsh 会去执行 rlogin。

rsh 执行时不会像一般登录程序那样询问密码，若没有设置信任表，远端将拒绝请求。因此需要在每台可能作为远端的机器上设置 .rhosts 文件，每行分两部分：允许登录的主机名和允许登录的用户名。例如本机 home 下的 .rhosts 中有一行：

```
ccsun6.cc.nctu.edu.tw u8217529
```

则 ccsun6.cc.nctu.edu.tw 上的用户 u8217529 可以用以下方式执行 rsh：

```
% rsh ccsun7.csie.nctu.edu.tw -l ysjuang cat mbox
```

这样就把远端 mbox 文件的内容显示在本机上了；有了这行记录，该用户不必输入密码即可通过 rsh 或 rlogin 登录。

注意：.rhosts 是设定可信任登录者的表格，设置不当会给入侵者留下机会。阅读 man 5 rhosts 可以看到，第一栏可用 + 代替任何主机名，第二栏可用 + 代替任何用户名。用 “+ username” 代替一长串主机名，会使任何机器上的同名用户都获得信任而侵入系统；第二栏写成 + 则允许某台机器上的所有用户免密进入账号，更加危险，应避免。

2. telnet

telnet 让用户经由网络连接到远端主机。格式：

```
telnet [hostname | ip-address] [port]
```

hostname 形如 ccsun1 或 ccsun1.cc.nctu.edu.tw；ip-address 是由四段小于 255 的数字组成的地址，例如 ccsun1 的地址为 140.113.17.173。port 是某些特殊程序对外提供的通信端口，例如 MUD 服务器会提供若干端口供用户进入。

3. ftp

ftp 即 File Transfer Program，常用于网络文件传输。格式：

```
ftp [hostname | ip-address]
```

连接成功后，ftp 会询问用户名与密码，输入正确即可传输文件。常用命令：

◆ ascii：设为 ascii 传输模式，通常用于文本文件
◆ binary：设为 binary 传输模式，通常用于可执行文件、压缩文件与影像文件
◆ cd remote-directory：切换远端工作目录
◆ lcd [directory]：切换本地工作目录
◆ ls [remote-directory] [local-file]：列出远端文件
◆ get remote-file [local-file]：取得远端文件
◆ mget remote-files：用通配符一次取得多个文件
◆ put local-file [remote-file]：把本地文件送到远端
◆ mput local-files：用通配符一次上传多个文件
◆ help [command]：在线帮助
◆ mkdir directory-name：在远端建立目录
◆ prompt：切换交互模式，为 on 时 mput、mget 每传输一个文件都会询问
◆ quit/bye：退出 ftp

借助 ftp 可以在不同机器之间转移资料，一些站点存放大量资料供各地用户抓取。许多 ftp 服务器提供 anonymous 用户，供外来访问者取得公共资料；询问密码时应按要求输入自己的电子邮件地址，并遵守各服务器的使用规则。$kp$, section = '' where id = 31128;
update t_knowledge_point set title = $kp$分区类型$kp$, content = $kp$◆ 主分区：最多只能有 4 个。
◆ 扩展分区：最多只能有 1 个；主分区加扩展分区最多 4 个；扩展分区不能写入数据，只能包含逻辑分区。
◆ 逻辑分区：在扩展分区内划分。$kp$, section = '' where id = 31129;
update t_knowledge_point set title = $kp$单用户模式常见的错误修复$kp$, content = $kp$◆ 遗忘 root 密码
◆ 修改系统默认运行级别$kp$, section = '' where id = 31162;
update t_knowledge_point set title = $kp$磁盘分区与挂载流程总结$kp$, content = $kp$◆ 分区：把大硬盘分为小的逻辑分区
◆ 格式化：写入文件系统
◆ 分区设备文件名：给每个分区定义设备文件名
◆ 挂载：给每个分区分配挂载点$kp$, section = '' where id = 31203;
update t_knowledge_point set title = $kp$将源码包 Apache 加入 chkconfig 管理$kp$, content = $kp$源码编译安装的 Apache 默认不受 chkconfig 管理，需要在其启动脚本头部加入 chkconfig 和 description 两行注释，再用 chkconfig --add httpd 将其加入管理。$kp$, section = '' where id = 31210;
update t_knowledge_point set title = $kp$chkconfig 脚本头格式$kp$, content = $kp$要让 httpd 脚本被 chkconfig 命令管理，需在脚本头部按以下格式添加两行注释：

```
# chkconfig: 运行级别 启动顺序 关闭顺序
# description: source package apache
```$kp$, section = '' where id = 31214;
update t_knowledge_point set title = $kp$init 切换运行级别$kp$, content = $kp$使用 init 命令切换运行级别：

```
[root@localhost ~]# init 运行级别
```$kp$, section = '' where id = 31256;
update t_knowledge_point set title = $kp$who 命令$kp$, content = $kp$命令名称：who
命令所在路径：/usr/bin/who
执行权限：所有用户
语法：who
功能描述：查看登录用户信息
范例：

```
$ who
```$kp$, section = '' where id = 31270;
update t_knowledge_point set title = $kp$Linux 运行级别及切换$kp$, content = $kp$Linux 是真正的多任务多用户系统。

Linux 的运行级别有哪些？如何更改默认运行级别？字符界面的运行级别是 3，图形界面是 5。

0：关机。不能将系统默认运行级别设置为 0，否则无法启动。
1：单用户模式，只允许 root 用户对系统进行维护。
2：多用户模式，但不能使用 NFS（相当于 Windows 下的网上邻居）。
3：字符界面的多用户模式。
4：没有用到。
5：图形界面的多用户模式。
6：重启。不能将系统默认运行级别设置为 6，否则会一直重启。

查看运行级别命令：runlevel，先后显示系统上一次和当前运行级别，如果不存在上一次运行级别，则用 N 表示。

改变运行级别命令：init [0123456]。$kp$, section = '' where id = 31282;
update t_knowledge_point set title = $kp$系统开机后进入的默认运行级别$kp$, content = $kp$原文为截图，无可提取的文字说明。系统开机后进入的默认运行级别由配置指定：CentOS 6 及以前在 /etc/inittab 中用 initdefault 项设定，CentOS 7 由 systemd 的 default.target 决定。$kp$, section = '' where id = 31284;
update t_knowledge_point set title = $kp$用户首次登录强制修改密码$kp$, content = $kp$原文为截图，无可提取的文字说明。让用户一登录就修改密码，可用 chage -d 0 用户名（或 passwd -e 用户名）把该用户密码的最后修改日期置为 0，登录后即被要求修改密码。$kp$, section = '' where id = 31295;
update t_knowledge_point set title = $kp$重要系统文件丢失导致系统无法启动$kp$, content = $kp$系统重要文件丢失导致无法启动时，进入救援模式后执行 chroot /mnt/sysimage 切换到原系统的根目录，再进行修复。

bash-4.1# chroot /mnt/sysimage$kp$, section = '' where id = 31300;
update t_knowledge_point set title = $kp$Linux 操作系统概述$kp$, content = $kp$Linux 是一种操作系统，同时是一个自由软件，是免费的、源代码开放的；编制它的目的是建立不受任何商品化软件版权制约的、全世界都能自由使用的 UNIX 兼容产品。Linux 有商业版（Red Hat）和社区版（CentOS、Ubuntu）之分。$kp$, section = '' where id = 31523;
update t_knowledge_point set title = $kp$root 本地登录示例$kp$, content = $kp$root 登录示例：

CentOS Linux 7 (Core)
Kernel 3.10.0-693.el7.x86_64 on an x86_64

192 login: root
Password:
Last login: Sat Apr 24 00:17:30 on tty1
[root@192 ~]# _$kp$, section = '' where id = 31530;
update t_knowledge_point set title = $kp$ssh 远程登录过程示例$kp$, content = $kp$ssh 登录过程示例：

# ssh root@192.168.0.19
The authenticity of host '192.168.0.19 (192.168.0.19)' can't be established.
RSA key fingerprint is 51:11:9c:e3:fa:d5:c7:e5:fc:0b:76:f1:c4:9e:03:fd.
Are you sure you want to continue connecting (yes/no)? yes

第一次使用该主机进行 ssh 登录需确认密钥，选择 yes 才能继续登录。

Warning: Permanently added '192.168.0.19' (RSA) to the list of known hosts.
root@192.168.0.19's password:

在此输入用户口令，输入过程中没有回显。

Last login: Wed Apr 30 02:15:08 2010 from 192.168.0.19

正确登录后出现 Shell 提示符。$kp$, section = '' where id = 31532;
update t_knowledge_point set title = $kp$Android 的 Linux 内核层$kp$, content = $kp$Android 的核心系统服务依赖于 Linux 2.6 内核，如安全性、内存管理、进程管理、网络协议栈和驱动模型。Linux 内核同时作为硬件和软件栈之间的抽象层。$kp$, section = '' where id = 31604;
update t_knowledge_point set title = $kp$Android 内核与 Linux 内核的关系$kp$, content = $kp$Android 内核是基于 Linux 内核修改的内核版本，它提供了用于支持 Android 平台的设备驱动。$kp$, section = '' where id = 31613;
update t_knowledge_point set title = $kp$硬盘转速$kp$, content = $kp$目前硬盘的转速为 5400rpm、7200rpm。$kp$, section = '' where id = 31723;
update t_knowledge_point set title = $kp$计算机运算速度的单位$kp$, content = $kp$计算机的运算速度单位：MIPS（百万条定点指令/秒）、MFLOPS（百万条浮点指令/秒）。$kp$, section = '' where id = 31746;
update t_knowledge_point set title = $kp$提高主频以提升电路速度$kp$, content = $kp$提高电路速度（主频）：从 1.5GHz 提高到 3GHz 以上，目前最高已经接近 4GHz。$kp$, section = '' where id = 32593;
update t_knowledge_point set title = $kp$运算速度的定量衡量指标$kp$, content = $kp$定量衡量指标：

MIPS：每秒百万条定点数指令数目。

MFLOPS：每秒百万条浮点数指令数目。$kp$, section = '' where id = 32596;
update t_knowledge_point set title = $kp$Linux 的应用程序$kp$, content = $kp$应用程序：标准的 Linux 系统都有一套称为应用程序的程序集，包括文本编辑器、编程语言、X Window、办公套件、Internet 工具、数据库等。$kp$, section = '' where id = 32619;
update t_knowledge_point set title = $kp$Linux 内核版本号规则$kp$, content = $kp$内核版（免费）分为稳定版和开发版。Linux 内核版本号由三组数字组成：

① 第一组数字：目前发布的内核主版本号。
② 第二组数字：偶数表示稳定版本，奇数表示开发中的版本。
③ 第三组数字：错误修补的次数。$kp$, section = '' where id = 32620;
update t_knowledge_point set title = $kp$Linux 发行版与 CentOS 7 安装$kp$, content = $kp$发行版（不一定免费）：商业公司发行（Red Hat），社区发行（CentOS）。

安装 CentOS 7（基于虚拟机 VM）：（1）创建新虚拟机，选择好镜像文件；（2）启动新建的虚拟机；（3）按安装提示进行操作。$kp$, section = '' where id = 32621;
update t_knowledge_point set title = $kp$重启与关闭 Linux 系统$kp$, content = $kp$通过已启动的系统进行重启操作（操作系统内命令行）：

① shutdown -r now：立刻重启。
② shutdown -r 5：5 分钟后重启。
③ reboot：立刻重启。
④ init 6：将系统运行级别切换为 6，即重新启动。$kp$, section = '' where id = 32622;
update t_knowledge_point set title = $kp$本地登录与 SSH 远程登录$kp$, content = $kp$root 登录提示符为 # 符号。

CentOS Linux 7 (Core)
Kernel 3.10.0-693.el7.x86_64 on an x86_64
192 login: root
Password:
Last login: Sat Apr 24 00:17:30 on tty1
[root@192 ~]# _

普通用户登录：

192 login: zhangzhihu
Password:
Last login: Sat Apr 24 00:01:25 on :0
[zhangzhihu@192 ~]$

普通用户登录提示符为 $ 符号。

远程登录：使用 ssh（SSH，Secure Shell，安全外壳协议）协议登录远程 Linux 系统。ssh 命令是 OpenSSH 的客户端，要登录远程 Linux 系统，必须保证远程系统上启动了 sshd 服务，CentOS 默认开启了这项服务。

查看 ssh 服务是否启动：

[root@192 ~]# netstat -tnl
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address
tcp        0      0 0.0.0.0:111
tcp        0      0 192.168.122.1:53
tcp        0      0 0.0.0.0:22
tcp        0      0 127.0.0.1:631
tcp6       0      0 :::111
tcp6       0      0 :::22
tcp6       0      0 :::1:631

[root@192 ~]# systemctl status sshd.service
● sshd.service - OpenSSH server daemon
   Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
   Active: active (running) since Sat 2021-04-24 00:18:22 PDT; 22min ago
     Docs: man:sshd(8)
           man:sshd_config(5)
 Main PID: 972 (sshd)
   CGroup: /system.slice/sshd.service
           └─972 /usr/sbin/sshd -D

Apr 24 00:18:22 192.168.177.132 systemd[1]: Starting OpenSSH server daemon...
Apr 24 00:18:22 192.168.177.132 sshd[972]: Server listening on 0.0.0.0 port 22.
Apr 24 00:18:22 192.168.177.132 sshd[972]: Server listening on :: port 22.
Apr 24 00:18:22 192.168.177.132 systemd[1]: Started OpenSSH server daemon.$kp$, section = '' where id = 32623;
update t_knowledge_point set title = $kp$Linux 网络配置与软件安装的考查内容$kp$, content = $kp$掌握 Linux 操作系统的网络配置和软件安装。

【考查内容】

1. Linux 的安装（CentOS 7）$kp$, section = '' where id = 32647;
update t_knowledge_point set title = $kp$链接命令 ln$kp$, content = $kp$文件处理命令：ln

命令名称：ln
命令英文原意：link
命令所在路径：/bin/ln
执行权限：所有用户
语法：ln -s [原文件] [目标文件]，-s 创建软链接
功能描述：生成链接文件

范例：

$ ln -s /etc/issue /tmp/issue.soft

创建文件 /etc/issue 的软链接 /tmp/issue.soft

$ ln /etc/issue /tmp/issue.hard

创建文件 /etc/issue 的硬链接 /tmp/issue.hard

软链接特征：类似 Windows 快捷方式。$kp$, section = '' where id = 32655;
update t_knowledge_point set title = $kp$内核版本号示例 2.6.18-128.ELsmp$kp$, content = $kp$以 2.6.18-128.ELsmp 为例：

第一组数字 2：主版本号。
第二组数字 6：次版本号，表示稳定版本（因为为偶数）。
第三组数字 18：修订版本号，表示修改的次数。$kp$, section = '' where id = 32704;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30271,30310,30312,30316,30324,30339,30361,30373,30376,30377,30398,30583,30842,30844,30847,30848,30930,31046,31051,31052,31070,31071,31072,31078,31081,31093,31101,31104,31110,31115,31122,31126,31128,31129,31162,31203,31210,31214,31256,31270,31282,31284,31295,31300,31523,31530,31532,31604,31613,31723,31746,32593,32596,32619,32620,32621,32622,32623,32647,32655,32704) and not deleted) <> 61 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
