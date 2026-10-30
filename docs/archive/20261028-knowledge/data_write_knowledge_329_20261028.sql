-- 知识点 329 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_329
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_329 as
select * from t_knowledge_point where id in (30274,30275,30276,30277,30279,30302,30303,30304,30305,30306,30307,30308,30311,30313,30315,30317,30319,30321,30322,30323,30325,30326,30327,30328,30330,30332,30338,30362,30378,30380,30383,30386,30391,30392,30393,30394,30395,30396,30399,30400,30408,30409,30410,30412,30413,30414,30415,30441,30530,30614,30640,30641,30642,30643,30644,30650,30651,30653,30654,30655,30670,30671,30672,30729,30732,30734,30742,30837,30838,30841,30843,30845,30850,30852,30960,30973,31034,31035,31047,31053,31054,31055,31056,31057,31058,31059,31060,31061,31062,31063,31064,31066,31067,31068,31069,31073,31074,31075,31076,31077,31079,31080,31082,31085,31086,31087,31088,31089,31090,31091,31092,31094,31095,31096,31097,31098,31099,31102,31103,31105,31106,31107,31108,31109,31112,31113,31114,31116,31117,31118,31119,31120,31123,31124,31125,31127,31130,31132,31133,31134,31135,31136,31137,31138,31139,31140,31141,31142,31143,31144,31145,31146,31147,31148,31149,31150,31151,31152,31153,31154,31155,31156,31157,31158,31159,31160,31161,31164,31165,31166,31167,31168,31171,31172,31173,31174,31176,31177,31178,31179,31181,31182,31183,31184,31185,31186,31187,31188,31190,31191,31192,31193,31194,31195,31200,31202,31204,31205,31206,31208,31209,31213,31215,31216,31217,31218,31219,31221,31222,31223,31224,31225,31226,31227,31228,31232,31234,31235,31236,31237,31239,31240,31241,31242,31243,31244,31245,31247,31248,31249,31250,31251,31252,31253,31254,31259,31260,31263,31264,31266,31267,31268,31269,31271,31273,31274,31275,31276,31277,31279,31280,31281,31283,31285,31286,31288,31289,31290,31291,31292,31293,31294,31296,31297,31298,31299,31535,31536,31537,31539,31540,31541,31542,31543,31596,31597,31598,31599,31610,31646,31647,31648,31650,31664,31722,31845,31846,31890,31902,31939,31940,32062,32594,32602,32603,32604,32605,32606,32607,32608,32615,32618,32624,32626,32627,32651,32656,32657,32658,32659,32661);

update t_knowledge_point set title = $kp$复制 initramfs 文件$kp$, content = $kp$进入测试目录并查看 initramfs 镜像的文件类型，再改名加上 .gz 后缀以便解压。

cd /tmp/initramfs/

file initramfs-2.6.32-279.el6.i686.img

mv initramfs-2.6.32-279.el6.i686.img initramfs-2.6.32-279.el6.i686.img.gz$kp$, section = '' where id = 30274;
update t_knowledge_point set title = $kp$复制 initramfs 镜像到测试目录$kp$, content = $kp$把 initramfs 镜像复制到测试目录 /tmp/initramfs 下再操作，避免破坏 /boot 下的原文件。

cp /boot/initramfs-2.6.32-279.el6.i686.img /tmp/initramfs/$kp$, section = '' where id = 30275;
update t_knowledge_point set title = $kp$buffer 与 cached 的区别$kp$, content = $kp$cached（缓存）：把读取出来的数据保存在内存当中，当再次读取时，不用读取硬盘而直接从内存当中读取，加速了数据的读取过程。

buffer（缓冲）：在写入数据时，先把分散的写入操作保存到内存当中，当达到一定程度再集中写入硬盘，减少了磁盘碎片和硬盘的反复寻道，加速了数据的写入过程。$kp$, section = '' where id = 30276;
update t_knowledge_point set title = $kp$查看系统中所有进程（ps aux，BSD 格式）$kp$, content = $kp$USER：该进程是由哪个用户产生的。
PID：进程的 ID 号。
%CPU：该进程占用 CPU 资源的百分比，占用越高，进程越耗费资源。
%MEM：该进程占用物理内存的百分比，占用越高，进程越耗费资源。
VSZ：该进程占用虚拟内存的大小，单位 KB。
RSS：该进程占用实际物理内存的大小，单位 KB。
TTY：该进程在哪个终端中运行。tty1-tty7 代表本地控制台终端，其中 tty1-tty6 是本地的字符界面终端，tty7 是图形终端；pts/0-255 代表虚拟终端。
STAT：进程状态，常见的状态有 R 运行、S 睡眠、T 停止、s 包含子进程、+ 位于前台。
START：该进程的启动时间。
TIME：该进程占用 CPU 的运算时间，注意不是系统时间。
COMMAND：产生此进程的命令名。$kp$, section = '' where id = 30277;
update t_knowledge_point set title = $kp$变量测试与内容替换$kp$, content = $kp$| 变量置换方式 | 变量 y 没有设置 | 变量 y 为空值 | 变量 y 设置值 |
| --- | --- | --- | --- |
| x=${y-新值} | x=新值 | x 为空 | x=$y |
| x=${y:-新值} | x=新值 | x=新值 | x=$y |
| x=${y+新值} | x 为空 | x=新值 | x=新值 |
| x=${y:+新值} | x 为空 | x 为空 | x=新值 |
| x=${y=新值} | x=新值，y=新值 | x 为空，y 值不变 | x=$y，y 值不变 |
| x=${y:=新值} | x=新值，y=新值 | x=新值，y=新值 | x=$y，y 值不变 |
| x=${y?新值} | 新值输出到标准错误输出（屏幕） | x 为空 | x=$y |
| x=${y:?新值} | 新值输出到标准错误输出 | 新值输出到标准错误输出 | x=$y |$kp$, section = '' where id = 30279;
update t_knowledge_point set title = $kp$grep 查找字符串与通配符、/sbin 目录的用途$kp$, content = $kp$进行字符串查找，使用 grep 命令。

使用 * 每次匹配若干个字符。

/sbin 目录用来存放系统管理员使用的管理程序。$kp$, section = '' where id = 30302;
update t_knowledge_point set title = $kp$bzip2 压缩文件示例$kp$, content = $kp$bzip2 /etc/smb.conf

将文件 smb.conf 压缩成 smb.conf.bz2。$kp$, section = '' where id = 30303;
update t_knowledge_point set title = $kp$vi 的删除、更改、取代与复制操作$kp$, content = $kp$删除

dd：删除当前行。

3dd：删除自游标算起的 3 行。

更改

cw：更改游标处到字尾的内容。

c3w：更改 3 个词。

取代

r：取代游标处的字符。

R：取代字符直到按 Esc 为止。

复制

yw：拷贝游标处到字尾的内容。

p：粘贴（put）到所要之处，yw 与 p 必须搭配使用。

跳至指定行

Ctrl+g：列出行号。$kp$, section = '' where id = 30304;
update t_knowledge_point set title = $kp$df 命令$kp$, content = $kp$语法：df [参数选项]

说明：df 命令可显示所有文件系统对 i 节点和磁盘块的使用情况，检查文件系统的磁盘空间占用情况，也可以获取硬盘已被占用了多少空间、目前还剩多少空间等信息。

| 选项 | 选项说明 |
| --- | --- |
| -i | 显示设备 i 节点数 inode 的使用情况 |
| -a | 显示所有文件系统的磁盘使用情况，包括 0 块（block）的文件系统，如 /proc 文件系统 |
| -t [ext3] | 显示各指定类型的文件系统的磁盘空间使用情况 |
| -T | 显示文件系统类型 |
| -x [ext3] | 列出不是某一指定类型文件系统的磁盘空间使用情况（与 -t 选项相反） |
| -h | 人性化统计设备空间使用情况 |$kp$, section = '' where id = 30305;
update t_knowledge_point set title = $kp$du 命令与 df 命令的区别$kp$, content = $kp$df 命令是从文件系统考虑的，不光要考虑文件占用的空间，还要统计被命令或程序占用的空间（最常见的就是文件已经删除，但是程序并没有释放空间）。

du 命令是面向文件的，只会计算文件或目录占用的空间。$kp$, section = '' where id = 30306;
update t_knowledge_point set title = $kp$find 命令$kp$, content = $kp$语法：find [搜索路径] [参数选项] [匹配表达式]

功能：在指定的搜索路径下搜索指定的目录或文件。

-name 字符：查找名称包含“字符”的文件和目录。
-perm 模式：匹配所有符合指定数值模式值的文件。
-size n[c]：匹配大小为 n 个块的文件，c 表示以字节为单位。
-user 用户名：搜索所有属主为用户名的文件。
-group 组名：搜索所有属组为组名的文件。
-atime n：搜索在 n 天前访问过的文件。
-mtime n：搜索在 n 天前内容被修改过的文件。
-ctime n：搜索在 n 天前状态被修改过的文件。
-exec 命令 {} \;：对每个匹配的文件执行该命令，{} 用于指定命令执行时文件名出现的位置，命令必须以 \; 结束。

例如查找所有空文件并将其删除：

find / -size 0 -exec rm -rf {} \;$kp$, section = '' where id = 30307;
update t_knowledge_point set title = $kp$grep 命令$kp$, content = $kp$语法：grep [参数选项] [-e PATTERN | -f FILE] [FILE...]

说明：在文件中搜索匹配的行并输出，一般用来过滤先前结果而避免显示太多不必要的信息。

| 选项 | 选项说明 |
| --- | --- |
| -A num | 输出匹配行后的 num 行 |
| -B num | 输出匹配行前的 num 行 |
| -n | 在输出行前标出行号 |
| -f FILE | 从文件中读入表达式 |
| -v | 反向查找，即寻找并显示所有不含指定字符串的内容 |
| -s | 不输出错误信息 |
| ^# | 查找以 # 开头的行 |
| conf$ | 查找以 conf 结尾的行 |
| ^$ | 查找空行 |
| -E | 接收扩展 grep 的正则表达式条件 |$kp$, section = '' where id = 30308;
update t_knowledge_point set title = $kp$Linux 的文件系统结构$kp$, content = $kp$Linux 的文件系统和 MS-Windows 有很大的不同。Linux 只有一个文件树，整个文件系统以一个树根“/”为起点，所有的文件和外部设备都以文件的形式挂接在这棵文件树上，包括硬盘、软盘、光驱、调制解调器等，这和以驱动器盘符为基础的 MS-Windows 系统大不相同。常见的 Linux 发行版本根目录大都是以下结构：

/bin /etc /lost+found /sbin /var /boot /root
/home /mnt /tmp /dev /lib /proc /usr

1. /bin 和 /sbin

使用和维护 UNIX 与 Linux 系统的大部分基本程序都包含在 /bin 和 /sbin 里，这两个目录名中包含 bin，是因为可执行的程序都是二进制文件（binary files）。

/bin 目录通常用来存放用户最常用的基本程序，如 login、各种 shell、文件操作实用程序、系统实用程序、压缩工具。

/sbin 目录通常存放基本的系统和系统维护程序，如 fsck、fdisk、mkfs、shutdown、lilo、init。

这两个目录中程序的主要区别是：/sbin 中的程序只能由 root（管理员）来执行。

2. /etc

一般用来存放程序所需的整个文件系统的配置文件，其中的一些重要文件如下：passwd、shadow、fstab、hosts、motd、profile、shells、services、lilo.conf。

3. /lost+found

这个目录专门用来存放那些在系统非正常宕机后重新启动时，不知道该从哪里恢复的“流浪”文件。

4. /boot

存放着和系统启动有关系的各种文件，包括系统的引导程序和系统核心部分。

5. /root

系统管理员（root）的主目录。

6. /home

系统中所有用户的主目录都存放在 /home 中，它包含实际用户（人）的主目录和其他用户的主目录。Linux 与 UNIX 的不同之处是，Linux 的 root 用户主目录通常是在 /root 或 /home/root，而 UNIX 通常是在 /。

7. /mnt

按照约定，CD-ROM、软盘、Zip 盘、Jaz 等可移动介质都应挂载在 /mnt 目录下，/mnt 目录通常包含一些子目录，每个子目录是某种特定设备类型的一个挂载点，例如 /cdrom、/floppy、/zip、/win。要使用这些设备，需要用 mount 命令从 /dev 目录中把外部设备挂接过来。如果 Windows 文件系统是 NTFS 格式，这种方式就不行了。

8. /tmp 和 /var

这两个目录用来存放临时文件和经常变动的文件。

9. /dev

存放各种外部设备的设备文件。例如第一个软盘驱动器的名字是 fd0；第一个硬盘的名字是 hda，硬盘中的第一个分区是 hda1，第二个分区是 hda2；第一个光盘驱动器的名字是 hdc；此外还有 modem 和其他外设的名字。

10. /usr

按照约定，这个目录用来存放与系统的用户直接相关的程序或文件。

11. /proc

这个目录下面的内容是当前在系统中运行的进程的虚拟镜像，可以看到由当前运行的进程号组成的一些目录，还有一个记录当前内存内容的 kernel 文件。

这些目录以及在它们下面应该存储什么内容，都应当很熟练地记下来，这对进一步使用系统很有帮助。$kp$, section = '' where id = 30311;
update t_knowledge_point set title = $kp$网络状态查询命令：man、who、w、ku$kp$, content = $kp$man 是手册（manual）的意思。UNIX 提供在线帮助（on-line help）功能，man 用来让使用者查询指令、系统调用、标准函数库函数、各种表格等的用法。

用法：

man [-M path] [[section] title] ...

man [-M path] -k keyword ...

-M path：man 所需的 manual database 的路径，也可以用设置环境变量 MANPATH 的方式取代 -M 选项。

title：所要查询的对象。

section：一个数字，表示 manual 的分类，通常 1 代表可执行指令，2 代表系统调用（system call），3 代表标准函数，等等。

例如要参考 eqnchar(7) 的资料，输入 man 7 eqnchar，便能取得所要的辅助信息。

-k keyword：将含有这个 keyword 的 title 列出来。

man 在 UNIX 上是一项非常重要的指令，这里所述只是比较常用的用法和简单说明，详细的用法还是要用 man 来查询。

who 指令用来查询目前有哪些人在线。

w 指令用来查询目前有哪些人在线，同时显示这些人目前的工作。

ku 可以用来搜索整个网络上的 user，不像 w 和 who 只是针对 local host 的查询；ku 还提供让使用者建立特定使用者名单的功能：可以建立一个 information-file，以条列的方式存放朋友的资料，再建立一个 hosts-file 来指定搜索的机器名称。ku 的指令格式可由 ku -h 得到。$kp$, section = '' where id = 30313;
update t_knowledge_point set title = $kp$通讯类命令：write、talk、mesg、mail$kp$, content = $kp$write：提供使用者传送信息给另一个使用者。用法：

write username [tty]

talk/ytalk/cytalk/ctalk：UNIX 专用的交谈程序，会将屏幕分隔为你的区域和交谈对象的区域，同时也可以和不同机器的使用者交谈。用法：

talk username[@host] [tty]

mesg：选择是否接受他人的 message，若为 mesg n 则他人的 message 将无法传送给你，同时他也无法干扰你的工作。用法：

mesg [-n|-y]

mail/elm：网络上的 email 程序，可经由此程序将信件寄给他人。用法：

mail [username]

mail -f mailboxfile

如有信件，直接键入 mail 即可读取。elm 提供比 mail 更为方便的界面，而且可做在线 alias；进入 elm 后可用上下左右键选择要读的信件，按 h 取得在线帮助文件。用法：

elm [username]

elm -f mailboxfile$kp$, section = '' where id = 30315;
update t_knowledge_point set title = $kp$Linux 的文件类型$kp$, content = $kp$Linux 的文件类型大致可分为五类，而且支持长文件名，不论是文件还是目录名，最长可以达到 256 个字节。

1. 一般文件

例如纯文本文件 mtv-0.0b4.README、配置文件 lilo.conf、记录文件 ftp.log 等等都是。一般类型的文件在控制台的显示下都没有颜色，系统默认的是白色。

2. 目录

用 cd 加目录名可以进入该目录，目录在控制台下显示的颜色是蓝色，非常容易辨认。用 ls -l 观看时，文件属性共 10 个字符，第一个字符是 d，表明它是一个目录。$kp$, section = '' where id = 30317;
update t_knowledge_point set title = $kp$Linux 上常用的应用软件$kp$, content = $kp$Linux 上有丰富的应用软件。

文本处理方面（控制台界面）：

vi：最令 UNIX 类操作系统初学者裹足不前的 editor，只要习惯于操作，会觉得它比任何的 editor 都好用，且功能强大。

pico：一种风格很像 Microsoft DOS 的 EDIT 的文本编辑器。

中文化方面：

XCIN+Crxvt：缺省的 Linux 系统不支持显示中文，这套汉化工具组合在控制台（console）方式和 X Window 方式下都可以显示和输入汉字信息。

Cxterm：可以很容易地自行设置输入法，或者修改现有的输入法表格。

视窗界面（window manager）方面：

KDE：X Window System 使用率最高的 Window Manager。

Fvwm：公认最为好用的 Window Manager 之一。

Fvwm95：拥有和 Microsoft Win95 同样界面的 Window Manager。

Afterstep：公认最好看的 Window Manager，但耗内存也很大。

Enlightenment：界面最华丽的 Window Manager，但耗内存太大，有点华而不实。

Icewm：又一个极富个性的 Window Manager。

视窗应用软件方面：

WWW 浏览器：Netscape 公司的 navigator 3.x 和 communicator 4.x 可用，使用方法和 MS Windows 上一样。

图像处理：GIMP 是类似于 Photoshop 的绘图软件，号称是 Linux 上最强的绘图软件。

MTV：可以播放 VCD 的软件，但它是共享软件（Shareware），不是免费软件，也得不到它的源代码。

Star Office：著名的办公软件，无论界面还是功能都强于 Microsoft Office，唯一的缺憾是不支持汉字，无论 GB 还是 BIG5。

Word Perfect：非常精彩的字处理软件，功能类似于 Microsoft Word。

文杰字处理系统：韩国人开发的字处理系统，功能强大，有专门的中文版推出，类似于 Microsoft Word。

编译环境：

gcc：公认的 C 语言世界中功能最为强大的编译器，但界面不是很友好。除此之外还有 FORTRAN、Pascal、GNU make、GNU debugger、GNU LISP、GNU PERL、TCL。

MS Windows 的模拟环境：

WINE：可以使绝大多数的 16 位 MS Windows 程序运行在这个模拟环境中，但是不支持 32 位的程序。$kp$, section = '' where id = 30319;
update t_knowledge_point set title = $kp$变量测试示例：清除变量 y$kp$, content = $kp$先用 unset 清除变量 y，再测试 ${y-新值} 等置换方式的效果。

[root@localhost ~]# unset y$kp$, section = '' where id = 30321;
update t_knowledge_point set title = $kp$字符串处理命令：echo、grep、fgrep$kp$, content = $kp$echo 用来显示一个字符串在终端机上，echo -n 则是显示完之后不会有跳行的动作。

grep 为一个过滤器，它可自一个或多个文件中过滤出具有某个字符串的行，或是自标准输入过滤出具有某个字符串的行。

fgrep 可将欲过滤的一群字符串放在某一个文件中，然后使用 fgrep 将包含有属于这一群字符串的行过滤出来。

用法：

grep [-nv] match_pattern file1 file2 ...

fgrep [-nv] -f pattern_file file1 file2 ...

-n：把所找到的行在行前加上行号列出。

-v：把不包含 match_pattern 的行列出。

-f：以 pattern_file 存放所要搜索的字符串。$kp$, section = '' where id = 30322;
update t_knowledge_point set title = $kp$lsof：列出进程打开的文件$kp$, content = $kp$lsof 用于列出进程调用或打开的文件的信息。

选项：

-c 字符串：只列出以字符串开头的进程打开的文件。
-u 用户名：只列出某个用户的进程打开的文件。
-p pid：列出某个 PID 进程打开的文件。$kp$, section = '' where id = 30323;
update t_knowledge_point set title = $kp$find 命令的常用参数$kp$, content = $kp$格式：find 目录 参数 文件名称。示例：find /usr/tmp/ -type d 查找 /usr/tmp 目录下的所有目录。

常用参数：

-mount、-xdev：只检查和指定目录在同一个文件系统下的文件，避免列出其他文件系统中的文件。
-amin n：在过去 n 分钟内被读取过。
-anewer file：比文件 file 更晚被读取过的文件。
-atime n：在过去 n 天内被读取过的文件。
-cmin n：在过去 n 分钟内被修改过。
-cnewer file：比文件 file 更新的文件。
-ctime n：在过去 n 天内状态被修改过的文件。
-empty：空文件。
-gid n 或 -group name：gid 是 n 或是组名是 name。
-ipath p、-path p：路径名称符合 p 的文件，ipath 会忽略大小写。
-name name、-iname name：文件名称符合 name 的文件，iname 会忽略大小写。
-size n：文件大小是 n 个单位，b 代表 512 字节的块，c 表示字节数，k 表示千字节，w 表示两个字节。
-type c：文件类型是 c 的文件，d 目录、c 字符设备文件、b 块设备文件、p 具名管道、f 一般文件、l 符号链接、s socket。$kp$, section = '' where id = 30325;
update t_knowledge_point set title = $kp$按终端号强制结束进程（pkill -t）$kp$, content = $kp$pkill -t pts/1 结束从 pts/1 虚拟终端登录的所有进程。$kp$, section = '' where id = 30326;
update t_knowledge_point set title = $kp$killall：按进程名杀死进程$kp$, content = $kp$killall 按进程名杀死进程。

选项：

-i：交互式，询问是否要杀死某个进程。
-I：忽略进程名的大小写。$kp$, section = '' where id = 30327;
update t_knowledge_point set title = $kp$按终端号踢出用户（pkill -t）$kp$, content = $kp$pkill 可以按终端号踢出该终端上登录的用户。

选项：

-t 终端号：按照终端号踢出用户。$kp$, section = '' where id = 30328;
update t_knowledge_point set title = $kp$查看系统中所有进程（ps -le，Linux 标准格式）$kp$, content = $kp$ps -le 以 Linux 标准格式列出系统中所有进程的详细信息。

[root@localhost ~]# ps -le$kp$, section = '' where id = 30330;
update t_knowledge_point set title = $kp$top 命令输出信息说明$kp$, content = $kp$第一行：任务队列信息

| 内容 | 说明 |
| --- | --- |
| 12:26:46 | 系统当前时间 |
| up 1 day, 13:32 | 系统的运行时间，本机已经运行 1 天 13 小时 32 分钟 |
| 2 users | 当前登录了两个用户 |
| load average: 0.00, 0.00, 0.00 | 系统在之前 1 分钟、5 分钟、15 分钟的平均负载。一般认为小于 1 时负载较小，大于 1 则系统已经超出负荷 |

第二行：进程信息

| 内容 | 说明 |
| --- | --- |
| Tasks: 95 total | 系统中的进程总数 |
| 1 running | 正在运行的进程数 |
| 94 sleeping | 睡眠的进程 |
| 0 stopped | 正在停止的进程 |
| 0 zombie | 僵尸进程，如果不是 0，需要手工检查僵尸进程 |

第三行：CPU 信息

| 内容 | 说明 |
| --- | --- |
| 0.1%us | 用户模式占用的 CPU 百分比 |
| 0.1%sy | 系统模式占用的 CPU 百分比 |
| 0.0%ni | 改变过优先级的用户进程占用的 CPU 百分比 |
| 99.7%id | 空闲 CPU 的百分比 |
| 0.1%wa | 等待输入/输出的进程占用的 CPU 百分比 |
| 0.0%hi | 硬中断请求服务占用的 CPU 百分比 |
| 0.1%si | 软中断请求服务占用的 CPU 百分比 |
| 0.0%st | st（Steal time）虚拟时间百分比，即有虚拟机时虚拟 CPU 等待实际 CPU 的时间百分比 |

第四行：物理内存信息

| 内容 | 说明 |
| --- | --- |
| Mem: 625344k total | 物理内存的总量，单位 KB |
| 571504k used | 已经使用的物理内存数量 |
| 53840k free | 空闲的物理内存数量，本机是虚拟机，总共只分配了 628MB 内存，所以只有 53MB 的空闲内存 |
| 65800k buffers | 作为缓冲的内存数量 |

第五行：交换分区（swap）信息

| 内容 | 说明 |
| --- | --- |
| Swap: 524280k total | 交换分区（虚拟内存）的总大小 |
| 0k used | 已经使用的交换分区大小 |
| 524280k free | 空闲交换分区的大小 |
| 409280k cached | 作为缓存的交换分区大小 |$kp$, section = '' where id = 30332;
update t_knowledge_point set title = $kp$变量替换测试：echo $x$kp$, content = $kp$执行 echo $x 输出 old，说明变量 x 的值是 old。

[root@localhost ~]# echo $x

old$kp$, section = '' where id = 30338;
update t_knowledge_point set title = $kp$用 nmap 与 awk 提取 HTTP 服务端口$kp$, content = $kp$port=$(nmap -sT 192.168.1.156 | grep tcp | grep http | awk '{print $2}')

先用 nmap 以 TCP 连接方式扫描 192.168.1.156，再筛出 http 服务的行，用 awk 取出第二列即端口号，赋给变量 port。$kp$, section = '' where id = 30362;
update t_knowledge_point set title = $kp$网络命令：mail$kp$, content = $kp$命令名称：mail

命令所在路径：/bin/mail

执行权限：所有用户

语法：mail [用户名]

功能描述：查看、发送电子邮件

范例：# mail root$kp$, section = '' where id = 30378;
update t_knowledge_point set title = $kp$网络命令：ping$kp$, content = $kp$命令名称：ping

命令所在路径：/bin/ping

执行权限：所有用户

语法：ping 选项 IP 地址

-c 指定发送次数

功能描述：测试网络连通性

范例：# ping 192.168.1.156$kp$, section = '' where id = 30380;
update t_knowledge_point set title = $kp$网络命令：wall$kp$, content = $kp$命令名称：wall

命令英文原意：write all

命令所在路径：/usr/bin/wall

执行权限：所有用户

语法：wall [message]

功能描述：发广播信息

范例：# wall ShenChao is a honest man!$kp$, section = '' where id = 30383;
update t_knowledge_point set title = $kp$syslog 服务名称（facility）说明$kp$, content = $kp$安全和认证相关的日志记录在 /var/log/secure。

| 服务名称 | 说明 |
| --- | --- |
| auth | 安全和认证相关消息（不推荐使用，可用 authpriv 替代） |
| authpriv | 安全和认证相关消息（私有的） |
| cron | 系统定时任务 cron 和 at 产生的日志 |
| daemon | 和各个守护进程相关的日志 |
| ftp | ftp 守护进程产生的日志 |
| kern | 内核产生的日志（不是用户进程产生的） |
| local0-local7 | 为本地使用预留的服务 |
| lpr | 打印产生的日志 |
| mail | 邮件收发信息 |
| news | 与新闻服务器相关的日志 |
| syslog | 由 syslogd 服务产生的日志信息（服务名称已改为 rsyslogd，但很多配置仍沿用 syslogd 的，并没有修改服务名） |
| user | 用户等级类别的日志信息 |
| uucp | uucp 子系统的日志信息，uucp 是早期 Linux 系统进行数据传递的协议，后来也常用在新闻组服务中 |$kp$, section = '' where id = 30386;
update t_knowledge_point set title = $kp$bzip2、bunzip2 命令$kp$, content = $kp$语法：bzip2 [options] [files]

说明：压缩、解压缩文件。

bzip2 test：把 test 文件压缩成 test.bz2，替代原来的 test 文件。

bzip2 -k test：压缩时保留原来的文件 test。

bzip2 -d test.bz2：解压缩。

bzip2recover test.bz2：修复损坏的 .bz2 文件。

bunzip2：解压缩 .bz2 文件。$kp$, section = '' where id = 30391;
update t_knowledge_point set title = $kp$compress、uncompress 命令$kp$, content = $kp$语法：compress [参数选项] 文件

uncompress [参数选项] 文件.Z

说明：压缩或解压缩文件。

| 选项 | 选项说明 |
| --- | --- |
| -f | 强制压缩，即使文件不会变小或已存在同名 .Z 文件也照样覆盖 |
| -v | 显示压缩过程信息及压缩比率 |
| -b n | n 的范围是 9～16，控制压缩比率 |$kp$, section = '' where id = 30392;
update t_knowledge_point set title = $kp$gunzip 解压 .tgz 包$kp$, content = $kp$gunzip backup.tgz 用于解压 .tgz 包。

.bz2 包的压缩与解压缩使用 bzip2 和 bunzip2。$kp$, section = '' where id = 30393;
update t_knowledge_point set title = $kp$压缩解压命令：gunzip$kp$, content = $kp$命令名称：gunzip

命令英文原意：GNU unzip

命令所在路径：/bin/gunzip

执行权限：所有用户

语法：gunzip [压缩文件]

功能描述：解压缩 .gz 的压缩文件

范例：$ gunzip boduo.gz$kp$, section = '' where id = 30394;
update t_knowledge_point set title = $kp$压缩解压命令：unzip$kp$, content = $kp$命令名称：unzip

命令所在路径：/usr/bin/unzip

执行权限：所有用户

语法：unzip [压缩文件]

功能描述：解压 .zip 的压缩文件

范例：$ unzip test.zip$kp$, section = '' where id = 30395;
update t_knowledge_point set title = $kp$压缩解压命令：zip$kp$, content = $kp$命令名称：zip

命令所在路径：/usr/bin/zip

执行权限：所有用户

语法：zip 选项[-r] [压缩后文件名] [文件或目录]

-r 压缩目录

功能描述：压缩文件或目录

压缩后文件格式：.zip$kp$, section = '' where id = 30396;
update t_knowledge_point set title = $kp$解压 initramfs 镜像$kp$, content = $kp$用 file 确认镜像文件类型，改名并解压后，用 cpio -ivcdu 解包镜像内容。

file initramfs-2.6.32-279.el6.i686.img

cpio -ivcdu$kp$, section = '' where id = 30399;
update t_knowledge_point set title = $kp$文件权限的八进制表示与 chmod 数字设置$kp$, content = $kp$三位二进制数对应三位权限位：111 为 rwx，101 为 r-x，011 为 -wx，001 为 -x，100 为 r--。

这样一来，就可以用三个十进制数来表示文件权限的九个位，每一个十进制数大小等于代表每三位的那个三位二进制数。例如一个文件的属性是 rwxr--r--，就可以用 744 来代表它的权限属性；属性是 rwxrwxr--，对应的三个十进制数就是 774。

例如把一个文件 test.list 的属性设置为 rwxr-x---，只要执行：

chmod 750 test.list

改变后的权限用 ls -l 就可以看到。$kp$, section = '' where id = 30400;
update t_knowledge_point set title = $kp$dumpe2fs 命令的 -h 选项$kp$, content = $kp$dumpe2fs 用于查询指定分区的详细文件系统信息。

-h：仅显示超级块中的信息，不显示磁盘块组的详细信息。$kp$, section = '' where id = 30408;
update t_knowledge_point set title = $kp$ls、dir 命令及常用选项$kp$, content = $kp$语法：ls、dir [参数选项] [目录名]

说明：显示指定工作目录下的内容。

| 选项 | 说明 |
| --- | --- |
| -a | 显示所有文件和目录，包括隐藏文件 |
| -r | 按相反次序显示（默认按字母次序） |
| -F | 在文件名后加符号：可执行文件加“*”，目录加“/”，符号链接加“@” |
| -l | 详细列出文件名、类型、权限、拥有者、大小等信息 |
| -d | 显示指定目录本身的信息；不加 -d 则显示目录下的内容 |
| -i | 显示文件的 i 节点信息 |
| -h | 以人性化方式显示文件大小 |
| -R | 递归显示子目录中的内容 |$kp$, section = '' where id = 30409;
update t_knowledge_point set title = $kp$w、who、whoami、finger 命令$kp$, content = $kp$who：显示当前登录系统的用户，包括用户名、所用终端、登录来源、上线时间等。

w：与 who 类似，但显示的信息更详细，包含系统负载、CPU 占用和正在执行的命令。

whoami：显示当前登录的用户名。

finger：查找并显示用户信息，包括未登录的用户。

语法：finger [参数选项] [用户名]

-l：长格式输出，系统默认
-s：短格式输出$kp$, section = '' where id = 30410;
update t_knowledge_point set title = $kp$帮助命令 man$kp$, content = $kp$命令名称：man
英文原意：manual
所在路径：/usr/bin/man
执行权限：所有用户
语法：man [命令或配置文件]
功能：获得帮助信息

示例：
man ls —— 查看 ls 命令的帮助信息
man services —— 查看配置文件 services 的帮助信息$kp$, section = '' where id = 30412;
update t_knowledge_point set title = $kp$用 echo -e 输出带颜色的文字$kp$, content = $kp$示例：
echo -e "\e[1;31m abcd \e[0m"

\e[1;31m 设置颜色（1 为加粗，31 为红色），\e[0m 恢复默认属性。转义符也可写作 \033 或 \x1b，输出效果相同。$kp$, section = '' where id = 30413;
update t_knowledge_point set title = $kp$rsyslog 日志等级与连接符号$kp$, content = $kp$“*”代表所有日志等级，如 authpriv.* 表示记录 authpriv 认证信息服务的所有等级日志。
“.”后接等级表示记录该等级及比它高的日志，如 cron.info 表示记录 cron 服务 info 及以上等级的日志。
“.=”表示只记录指定等级，如 *.=emerg 表示只记录 emerg 等级的日志，用法少见。
“!”表示不等于，即除该等级外的日志都记录。

| 等级 | 说明 |
| --- | --- |
| debug | 一般调试信息 |
| info | 基本通知信息 |
| notice | 普通信息，但有一定重要性 |
| warning | 警告信息，还不影响服务或系统运行 |
| err | 错误信息，一般已影响服务或系统运行 |
| crit | 临界状态信息，比 err 严重 |
| alert | 警戒状态信息，比 crit 严重，必须立即处理 |
| emerg | 紧急信息，系统已无法使用 |$kp$, section = '' where id = 30414;
update t_knowledge_point set title = $kp$rpm -V 校验输出的 8 项信息$kp$, content = $kp$rpm -V 校验软件包时，输出中 8 个标记的含义：

S：文件大小是否改变
M：文件类型或权限（rwx）是否改变
5：文件 MD5 校验和是否改变（可视为内容是否改变）
D：设备的主、次设备号是否改变
L：文件路径是否改变
U：文件属主是否改变
G：文件属组是否改变
T：文件修改时间是否改变$kp$, section = '' where id = 30415;
update t_knowledge_point set title = $kp$awk 的条件表达式$kp$, content = $kp$语法：awk '条件1{动作1} 条件2{动作2} …' 文件名

条件一般使用关系表达式，如 x>10、x>=10、x==87。

示例：awk '$1=="Liming"{printf $2 "\n"}' student.txt —— 第一列等于 Liming 时输出第二列。$kp$, section = '' where id = 30441;
update t_knowledge_point set title = $kp$“$*”把所有参数视为一个整体$kp$, content = $kp$for i in "$*" 会把所有参数当成一个整体，因此循环只执行一次。

for i in "$*"
do
  echo "The parameters is: $i"
done$kp$, section = '' where id = 30530;
update t_knowledge_point set title = $kp$printf 按指定格式输出文件内容$kp$, content = $kp$printf '%s\t \n' $(cat student.txt)

按 %s 逐个输出 cat 得到的每个字段，字段之间用制表符分隔，每个字段后换行。$kp$, section = '' where id = 30614;
update t_knowledge_point set title = $kp$判断变量 file 是否为空$kp$, content = $kp$if [ -z "$file" ]
then
  echo "Error, please input a filename"
  exit 1
elif [ ! -e "$file" ]

-z 判断字符串是否为空，为空时提示错误并退出；! -e 判断文件是否不存在。$kp$, section = '' where id = 30640;
update t_knowledge_point set title = $kp$判断 file 是否为目录$kp$, content = $kp$elif [ -d "$file" ]
then
  echo "$file is a directory!"
else
  echo "$file is an other file!"
fi

-d 判断是否为目录，是则提示为目录，否则提示为其他文件。$kp$, section = '' where id = 30641;
update t_knowledge_point set title = $kp$判断 file 是否为普通文件$kp$, content = $kp$elif [ -f "$file" ]
then
  echo "Your input is not a file!"
  exit 2

-f 判断是否为普通文件，不是普通文件时提示并退出。$kp$, section = '' where id = 30642;
update t_knowledge_point set title = $kp$判断用户输入的是什么文件$kp$, content = $kp$read -p "Please input a filename:" file

读取键盘输入并赋给变量 file，随后按文件类型分别判断。$kp$, section = '' where id = 30643;
update t_knowledge_point set title = $kp$单分支 if 条件语句的注意事项$kp$, content = $kp$◆ if 语句以 fi 结尾，不同于一般语言用大括号结尾。
◆ [ 条件判断式 ] 使用 test 命令判断，中括号与条件之间必须有空格。
◆ then 后跟条件成立时执行的程序，可以写在 [] 之后用“;”分隔；换行写入时不需要“;”。$kp$, section = '' where id = 30644;
update t_knowledge_point set title = $kp$多分支 case 条件语句$kp$, content = $kp$case 与 if…elif…else 都是多分支语句，区别是 case 只能判断一种条件关系，if 可以判断多种条件关系。

case $变量名 in
  "值1")
    变量等于值1时执行程序1
    ;;
  "值2")
    变量等于值2时执行程序2
    ;;
  …其他分支…
  *)
    变量不等于以上任何值时执行此程序
    ;;
esac$kp$, section = '' where id = 30650;
update t_knowledge_point set title = $kp$while 循环求 1 到 100 的和$kp$, content = $kp$变量 i 小于等于 100 时执行循环：

while [ "$i" -le 100 ]
do
  s=$(( $s + $i ))
  i=$(( $i + 1 ))
done
echo "The sum is: $s"$kp$, section = '' where id = 30651;
update t_knowledge_point set title = $kp$until 循环：i 大于 100 时停止$kp$, content = $kp$循环直到变量 i 的值大于 100 才停止：

until [ "$i" -gt 100 ]
do
  s=$(( $s + $i ))
  i=$(( $i + 1 ))
done
echo "The sum is: $s"$kp$, section = '' where id = 30653;
update t_knowledge_point set title = $kp$for 循环打印时间段$kp$, content = $kp$for time in morning noon afternoon evening
do
  echo "This time is $time!"
done$kp$, section = '' where id = 30654;
update t_knowledge_point set title = $kp$读取键盘输入并判断 file 是否为空$kp$, content = $kp$read -p "Please input a filename:" file
if [ -z "$file" ]

先用 read 把键盘输入赋给变量 file，再用 -z 判断其是否为空。$kp$, section = '' where id = 30655;
update t_knowledge_point set title = $kp$awk 中的 print 与 printf$kp$, content = $kp$awk 的输出支持 print 和 printf。

print：每个输出后自动加一个换行符（Linux 本身没有 print 命令）。
printf：标准格式输出命令，不会自动加换行符，需要换行时要手工添加。$kp$, section = '' where id = 30670;
update t_knowledge_point set title = $kp$printf 的输出格式与示例$kp$, content = $kp$格式符：
\a 输出警告音
\b 退格键（Backspace）
\f 换页
\n 换行
\r 回车（Enter）
\t 水平制表符（Tab）
\v 垂直制表符

示例：
printf %s 1 2 3 4 5 6
printf %s %s %s 1 2 3 4 5 6
printf '%s %s %s' 1 2 3 4 5 6
printf '%s %s %s\n' 1 2 3 4 5 6
printf '%s' $(cat student.txt)

student.txt 内容：

| ID | Name | PHP | Linux | MySQL | Average |
| --- | --- | --- | --- | --- | --- |
| 1 | Liming | 82 | 95 | 86 | 87.66 |
| 2 | Sc | 74 | 96 | 87 | 85.66 |
| 3 | Gao | 99 | 83 | 93 | 91.66 |$kp$, section = '' where id = 30671;
update t_knowledge_point set title = $kp$printf 的输出类型$kp$, content = $kp$%ns：输出字符串，n 为数字，表示输出几个字符。
%ni：输出整数，n 为数字，表示输出几位数字。
%m.nf：输出浮点数，m 为总位数，n 为小数位数，如 %8.2f 表示共输出 8 位，其中 2 位小数、6 位整数。$kp$, section = '' where id = 30672;
update t_knowledge_point set title = $kp$ntpdate 同步网络时间$kp$, content = $kp$ntpdate asia.pool.ntp.org &>/dev/null

从 asia.pool.ntp.org 同步系统时间，标准输出和错误输出都丢弃。$kp$, section = '' where id = 30729;
update t_knowledge_point set title = $kp$统计 MySQL 数据目录大小并赋给变量 size$kp$, content = $kp$size=$(du -sh /var/lib/mysql)

统计 /var/lib/mysql 的总占用空间并以人性化方式显示，结果赋给变量 size。$kp$, section = '' where id = 30732;
update t_knowledge_point set title = $kp$文件搜索命令 grep$kp$, content = $kp$命令名称：grep
所在路径：/bin/grep
执行权限：所有用户
语法：grep -iv [指定字串] [文件]
功能：在文件中搜寻匹配字串的行并输出

-i 不区分大小写
-v 排除指定字串

示例：grep mysql /root/install.log$kp$, section = '' where id = 30734;
update t_knowledge_point set title = $kp$备份 MySQL 数据库的 shell 脚本$kp$, content = $kp$if [ -d /tmp/dbbak ]
then
  echo "Date : $date!" > /tmp/dbbak/dbinfo.txt
  echo "Data size : $size" >> /tmp/dbbak/dbinfo.txt
  cd /tmp/dbbak
  tar -zcf mysql-lib-$date.tar.gz /var/lib/mysql dbinfo.txt &>/dev/null
  rm -rf /tmp/dbbak/dbinfo.txt
else
  mkdir /tmp/dbbak
  echo "Date : $date!" > /tmp/dbbak/dbinfo.txt
  echo "Data size : $size" >> /tmp/dbbak/dbinfo.txt
  cd /tmp/dbbak
  tar -zcf mysql-lib-$date.tar.gz /var/lib/mysql dbinfo.txt &>/dev/null
  rm -rf /tmp/dbbak/dbinfo.txt
fi

说明：备份目录存在时直接写入信息并打包，不存在时先创建目录再执行相同操作。$kp$, section = '' where id = 30742;
update t_knowledge_point set title = $kp$删除文件的所有 ACL 权限$kp$, content = $kp$setfacl -b 文件名

-b 选项会删除该文件上的全部 ACL 权限。$kp$, section = '' where id = 30837;
update t_knowledge_point set title = $kp$“$@”把每个参数视为独立$kp$, content = $kp$for y in "$@"
do
  echo "The parameter $x is: $y"
  x=$(( $x + 1 ))
done

"$@" 中每个参数相互独立，有几个参数就循环几次。$kp$, section = '' where id = 30838;
update t_knowledge_point set title = $kp$脚本首行 #!/bin/bash 与 read 超时输入$kp$, content = $kp$#!/bin/bash
read -t 30 -p "Please input your name: " name

#!/bin/bash 指定脚本使用的解释器；read -t 30 表示等待输入最多 30 秒，超时则不再等待。$kp$, section = '' where id = 30841;
update t_knowledge_point set title = $kp$/etc/default/useradd 默认配置$kp$, content = $kp$GROUP=100 #用户默认组
HOME=/home #用户家目录
INACTIVE=-1 #密码过期后的宽限天数
EXPIRE= #密码失效时间
SHELL=/bin/bash #默认 shell
SKEL=/etc/skel #模板目录
CREATE_MAIL_SPOOL=yes #是否建立邮箱$kp$, section = '' where id = 30843;
update t_knowledge_point set title = $kp$/etc/profile 的作用$kp$, content = $kp$主要定义或导入以下变量：

◆ USER 变量
◆ LOGNAME 变量
◆ MAIL 变量
◆ PATH 变量
◆ HOSTNAME 变量
◆ HISTSIZE 变量
◆ umask
◆ 调用 /etc/profile.d/*.sh 文件$kp$, section = '' where id = 30845;
update t_knowledge_point set title = $kp$Linux 服务的分类：独立服务与 xinetd 服务$kp$, content = $kp$Linux 服务分为 RPM 包默认安装的服务和源码包安装的服务；RPM 包默认安装的服务又分为独立服务和基于 xinetd 的服务。

Linux 服务
├─ RPM 包默认安装的服务
│  ├─ 独立的服务
│  └─ 基于 xinetd 的服务
└─ 源码包安装的服务$kp$, section = '' where id = 30850;
update t_knowledge_point set title = $kp$取余运算：14 除以 3 余 2$kp$, content = $kp$cc=$((14%3))

% 为取余运算符，14 不能被 3 整除，余数为 2，因此 cc 的值为 2。$kp$, section = '' where id = 30852;
update t_knowledge_point set title = $kp$查看文件的命令 cat、more、less$kp$, content = $kp$cat：连续显示、查看文件内容
cat myfile

more：一次显示一屏；按空格翻下一屏，按回车翻下一行，按 q 或 Ctrl+C 退出
more file

less：分屏显示内容；用 PageUp、PageDown 前后浏览，按 q 退出
less file

重定向：把标准输出重定向到其他位置
cat > testfile4 —— 把键盘输入写入文件，按 Ctrl+D 结束
cat testfile1 testfile2 > testfile3 —— 合并多个文件的内容
cat f1 >> f2 —— 把 f1 的内容追加到 f2 末尾$kp$, section = '' where id = 30960;
update t_knowledge_point set title = $kp$cut 命令按列提取文本$kp$, content = $kp$cut -f 2 student.txt —— 提取第二列
cut -f 2,3 student.txt —— 提取第二、三列
cut -d ":" -f 1,3 /etc/passwd —— 以冒号为分隔符，提取第一、三列$kp$, section = '' where id = 30973;
update t_knowledge_point set title = $kp$Vim 使用技巧$kp$, content = $kp$◆ 导入命令执行结果：:r !命令
◆ 定义快捷键：:map 快捷键 触发命令
  例：:map ^P I#<ESC> —— 按 Ctrl+P 在行首插入 # 并回到命令模式
  :map ^B 0x —— 按 Ctrl+B 删除行首字符
◆ 连续行注释
  :n1,n2s/^/#/g —— 在第 n1 到 n2 行行首加 #
  :n1,n2s/^#//g —— 去掉第 n1 到 n2 行行首的 #
◆ 替换：:ab mymail samlee@lampbrother.net —— 输入 mymail 自动替换为邮箱地址$kp$, section = '' where id = 31034;
update t_knowledge_point set title = $kp$crontab 定时任务示例$kp$, content = $kp$5 5 * * 2 /sbin/shutdown -r now —— 每周二 5:05 重启系统
0 5 1,10,15 * * /root/sh/autobak.sh —— 每月 1、10、15 日 5:00 执行备份脚本$kp$, section = '' where id = 31035;
update t_knowledge_point set title = $kp$用户组管理命令$kp$, content = $kp$常用命令：groupadd 添加用户组、groupdel 删除用户组、groupmod 修改组属性、gpasswd 管理组成员；组信息保存在 /etc/group。$kp$, section = '' where id = 31047;
update t_knowledge_point set title = $kp$bunzip2 解压与 RPM 包管理$kp$, content = $kp$bunzip2 /etc/smb.conf.bz2 —— 在当前目录把 smb.conf.bz2 还原为 smb.conf；.bz2 格式不常用，可参考 man bzip2。

RPM 是 Red Hat 推出的软件包管理工具，全称 Redhat Package Manager。

1) 安装：rpm -ivh 包名
2) 升级：rpm -Uvh 包名
3) 卸载：rpm -e 包名
4) 安装参数：--force 即使覆盖其他包的文件也强制安装；--nodeps 忽略依赖强制安装
5) 查询是否安装：rpm -q 包名
6) 查看已安装包的信息：rpm -qi 包名
7) 列出包中的文件：rpm -ql 包名
8) 查询文件属于哪个包：rpm -qf 文件名$kp$, section = '' where id = 31053;
update t_knowledge_point set title = $kp$cat 命令$kp$, content = $kp$语法：cat [参数选项] 文件名

说明：把文件内容串接后输出到标准输出，也可以用 > 重定向到另一个文件。

| 选项 | 说明 |
| --- | --- |
| -E | 每行结束处显示 $ |
| -n | 对所有输出行编号 |
| -s | 将连续的多个空行替换为一个空行 |

示例：

cat -n /root/install.log | more$kp$, section = '' where id = 31054;
update t_knowledge_point set title = $kp$chgrp 命令$kp$, content = $kp$语法：chgrp [选项] 新组 文件…

说明：改变文件或目录的所属组，参数与 chown 相同。

示例：

chgrp root /home/test/test1$kp$, section = '' where id = 31055;
update t_knowledge_point set title = $kp$chmod 命令$kp$, content = $kp$chmod 有两种语法形式：

- chmod [选项] [who] 操作符 权限 文件…，其中 who 为 u、g、o、a，操作符为 +、-、=
- chmod [选项] 八进制权限 文件…

说明：改变文件或目录的权限模式。

示例：

chmod -R u=rwx,g=rw,o=rx /home/test
chmod -R 765 /home/test

765 表示所有者 rwx、所属组 rw-、其他用户 r-x。$kp$, section = '' where id = 31056;
update t_knowledge_point set title = $kp$chown 命令$kp$, content = $kp$语法：chown [选项] [新用户][.新组] 文件…

说明：改变文件或目录的所有者，也可同时改变所属组。

| 选项 | 说明 |
| --- | --- |
| -c | 显示更改的信息 |
| -v | 显示所有权变更 |
| -R | 连同目录下的子目录和文件一并更改 |

示例：

chown root:jake /root/install.log$kp$, section = '' where id = 31057;
update t_knowledge_point set title = $kp$cp 命令$kp$, content = $kp$语法：cp [选项] 源文件或目录 目标文件或目录

说明：把指定的源文件复制到目标文件，或把多个源文件复制到目标目录中。

| 选项 | 说明 |
| --- | --- |
| -f | 目标文件已存在时，先删除再复制 |
| -i | 覆盖已有目标文件前提示确认 |
| -p | 保留原文件的所有者、所属组、权限（包括 setuid 和 setgid 位）、修改时间和访问时间 |
| -R | 递归复制目录及其内容；FIFO 等特殊文件复制后仍为相应类型 |$kp$, section = '' where id = 31058;
update t_knowledge_point set title = $kp$cut 命令的局限$kp$, content = $kp$示例：df -h | cut -d ' ' -f 1,3

cut 以单个字符作为分隔符，而 df -h 输出中各列之间的空格数量并不固定。连续多个空格会被当作多个分隔符，从而产生空字段，导致按字段序号取到的列发生错位，这是 cut 的局限。$kp$, section = '' where id = 31059;
update t_knowledge_point set title = $kp$date、cal 命令$kp$, content = $kp$date

语法：date [选项] [+格式]
      date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]

说明：显示或设置系统日期和时间，-u 使用 UTC 时间，-s 用于设置时间。

cal

语法：cal [月] [年]

说明：显示指定年份的日历或指定月份的月历。

示例：cal 2007$kp$, section = '' where id = 31060;
update t_knowledge_point set title = $kp$Shell 算术运算的两种写法$kp$, content = $kp$算术运算可用“$((运算式))”或“$[运算式]”两种写法。

示例：

aa=11
bb=22
ff=$(( $aa+$bb ))
gg=$[ $aa+$bb ]

运算结果分别为 aa 与 bb 之和。注意：使用 expr 计算时，“+”号左右两侧必须有空格。$kp$, section = '' where id = 31061;
update t_knowledge_point set title = $kp$du 命令$kp$, content = $kp$语法：du [选项] [目录]

说明：逐级进入指定目录的每个子目录，显示其占用文件系统数据块（1024 字节）的情况；未指定目录时统计当前目录。

| 选项 | 说明 |
| --- | --- |
| -a | 递归显示指定目录及各子目录中每个文件占用的数据块数 |
| -k | 以 1024 字节为计数单位（-m 以 MB、-b 以字节为单位） |
| -s | 只显示占用的数据块总数 |
| -l | 对硬链接文件重复计算 |$kp$, section = '' where id = 31062;
update t_knowledge_point set title = $kp$fdisk、free 命令$kp$, content = $kp$fdisk

语法：fdisk [选项] 设备名

说明：对磁盘进行分区，或显示设备的分区情况。

示例：

fdisk -l /dev/hda
fdisk -l /dev/sda

free

语法：free [选项]

说明：显示内存的使用情况。

示例：free -k$kp$, section = '' where id = 31063;
update t_knowledge_point set title = $kp$file 命令$kp$, content = $kp$语法：file [选项] 文件…

说明：确定文件的类型。

| 选项 | 说明 |
| --- | --- |
| -b | 显示信息时省略文件名 |
| -s | 查看设备文件的类型 |
| -L | 追踪符号链接 |
| -f 列表文件 | 识别列表中列出的文件类型 |$kp$, section = '' where id = 31064;
update t_knowledge_point set title = $kp$gzip、gunzip 命令$kp$, content = $kp$gzip

语法：gzip [选项] 文件

说明：压缩或解压缩文件。

gunzip

说明：解压缩 .gz 文件。

| 选项 | 说明 |
| --- | --- |
| -v | 显示压缩比 |
| -l | 查看压缩文件的信息 |
| -d | 解压缩 |$kp$, section = '' where id = 31066;
update t_knowledge_point set title = $kp$tar.gz 文件的压缩与释放$kp$, content = $kp$压缩一组文件为 .tar.gz：

tar cvfz backup.tar.gz /etc

或先打包再压缩：

tar cvf backup.tar /etc
gzip -q backup.tar

释放 .tar.gz 文件：

tar xvfz backup.tar.gz

或

gunzip -c backup.tar.gz | tar xvf -$kp$, section = '' where id = 31067;
update t_knowledge_point set title = $kp$vi 末行模式指令与 tar 压缩$kp$, content = $kp$G：例如 44G 表示将光标移至第 44 行行首。

末行模式（Last line mode）常用指令：使用前先按 Esc 确认处于命令模式，按 :、/ 或 ? 进入末行模式。

- :set nu 列出行号（:set all 列出所有可设置项）
- /word 从文件首部向尾部查找字符串，?word 从尾部向首部查找

压缩工具 tar、gzip 的用法：

将一组文件压缩为 .tar.gz：

tar cvfz backup.tar.gz /etc$kp$, section = '' where id = 31068;
update t_knowledge_point set title = $kp$head、tail 命令$kp$, content = $kp$head

语法：head [选项] 文件名

说明：显示文件的前十行。

示例：head install.log 显示 install.log 的前十行；显示前十五行可用 head -n 15 install.log。

tail

语法：tail [选项] 文件名

说明：显示文件的后十行。

示例：tail install.log 显示 install.log 的后十行。$kp$, section = '' where id = 31069;
update t_knowledge_point set title = $kp$ls 命令的常用选项与输出$kp$, content = $kp$常用示例：

ls -a /root
ls -R /etc
ls -F /bin
ls -l /dev
ls -i /root
ls -dl /bin
ls -lh /root
ls --version
ls --help | more

ls -l 的输出格式：

-rw-r--r-- 1 root root 1132 Oct 31 03:16 anaconda-ks.cfg

各字段依次为：权限、硬链接数、所有者、所属组、文件大小、日期、文件名。

权限分为所有者、所属组、其他用户三组，r 为读、w 为写、x 为执行。

高级权限：

- suid：普通用户执行该文件时，以文件所有者的身份执行。
- sgid：目录设置 SGID 后，在其下新建的子目录会自动继承父目录的所属组。

Linux 支持多种文件类型，每种用一个字符表示：

| 字符 | 类型 |
| --- | --- |
| - | 常规文件 |
| d | 目录 |
| b | 块特殊设备 |
| c | 字符特殊设备 |
| p | 有名管道 |
| s | 套接字 |
| l | 符号链接 |$kp$, section = '' where id = 31073;
update t_knowledge_point set title = $kp$mkdir、rmdir 命令$kp$, content = $kp$mkdir

语法：mkdir [选项] 目录名

说明：创建一个空目录，要求用户在当前目录具有写权限。

| 选项 | 说明 |
| --- | --- |
| -m mode | 为新目录设置访问模式 |
| -p | 父目录不存在时，创建所有父目录 |

rmdir

语法：rmdir [选项] 目录名

说明：删除一个或多个空目录或空子目录，要求用户在当前目录具有写权限。$kp$, section = '' where id = 31074;
update t_knowledge_point set title = $kp$more、less 命令$kp$, content = $kp$more

语法：more [选项] [文件名]

说明：类似 cat，但会分页显示，便于逐页阅读。按空格键显示下一页，按 b 键返回上一页，并支持字符串查找（与 vi 相似）；在显示过程中按 h 查看帮助。

less

语法：less [选项] 文件名

说明：作用与 more 相似，但允许向前和向后翻页浏览已看过的内容；less 不会在启动时读入整个文件，打开大文件时比 vi 等编辑器更快。按 h 显示帮助。$kp$, section = '' where id = 31075;
update t_knowledge_point set title = $kp$mount、umount 命令$kp$, content = $kp$mount

语法：mount [选项] 设备名 挂载目录

说明：将某个文件系统挂载到指定目录，直到使用 umount 卸载为止。

示例：

mount /dev/cdrom /media/cdrom
mount /dev/sda1 /media/usb
mount -o loop 1.iso /mnt/iso

umount

语法：umount [设备名|挂载目录]

说明：卸载已挂载的文件系统。

示例：

umount /dev/cdrom
umount /media/cdrom$kp$, section = '' where id = 31076;
update t_knowledge_point set title = $kp$mv 命令$kp$, content = $kp$语法：mv [选项] 源文件或目录 目标文件或目录

说明：根据第二个参数是目标文件还是目标目录，mv 会重命名文件或将文件移动到新目录。

- 第二个参数为文件名时，完成重命名，此时源文件只能有一个（也可以是源目录）。
- 第二个参数为已存在的目录名时，源文件或目录可以有多个，均被移入该目录。
- 跨文件系统移动文件时，mv 先复制再删除原文件，指向该文件的链接会丢失。

| 选项 | 说明 |
| --- | --- |
| -f | 覆盖前不提示 |
| -i | 覆盖前提示 |$kp$, section = '' where id = 31077;
update t_knowledge_point set title = $kp$PS1 变量与提示符转义符$kp$, content = $kp$PS1 用于定义系统提示符，常用转义符如下：

- \d：显示日期，格式为“星期 月 日”
- \h：显示简写主机名，如 localhost
- \t：显示 24 小时制时间，格式为 HH:MM:SS
- \T：显示 12 小时制时间，格式为 HH:MM:SS
- \A：显示 24 小时制时间，格式为 HH:MM
- \u：显示当前用户名
- \w：显示当前所在目录的完整路径
- \W：显示当前所在目录的最后一级目录名
- \#：显示当前执行的是第几条命令
- \$：显示提示符，root 用户为 #，普通用户为 $$kp$, section = '' where id = 31079;
update t_knowledge_point set title = $kp$pwd、clear、man 命令$kp$, content = $kp$pwd

语法：pwd

说明：显示当前工作目录的绝对路径。

clear

语法：clear

说明：清除屏幕上的信息。

man

语法：man [选项] 帮助主题

说明：man 用于查看命令的用法，是 manual（手册）的缩写，说明非常详细，学习 UNIX 类操作系统时应掌握其基本用法。$kp$, section = '' where id = 31080;
update t_knowledge_point set title = $kp$rm 命令$kp$, content = $kp$语法：rm [选项] 文件…

说明：删除一个或多个文件或目录，也可以删除某个目录及其下的所有文件和子目录。对于符号链接，只删除链接本身，原文件保持不变。

| 选项 | 说明 |
| --- | --- |
| -f | 不作确认提示，强制删除；文件不存在时不报错 |
| -i | 删除前提示确认；同时给出 -f 和 -i 时，后面的选项生效 |
| -r、-R | 递归删除目录树，包括目录下的子目录 |$kp$, section = '' where id = 31082;
update t_knowledge_point set title = $kp$sed 命令$kp$, content = $kp$sed 是一种几乎包括在所有 UNIX 平台（包括 Linux）的轻量级流编辑器，主要用于对数据进行选取、替换、删除和新增。

常用格式：sed [选项] '编辑命令' 文件$kp$, section = '' where id = 31085;
update t_knowledge_point set title = $kp$sed 替换并写回文件$kp$, content = $kp$示例：sed -e 's/Liming//g; s/Gao//g' student.txt

该命令删除 student.txt 中所有的 Liming 和 Gao，并将结果输出到标准输出。若要直接修改原文件，需使用 -i 选项：

sed -i -e 's/Liming//g; s/Gao//g' student.txt$kp$, section = '' where id = 31086;
update t_knowledge_point set title = $kp$su、sudo、passwd 命令$kp$, content = $kp$su

语法：su [选项] [用户名]

说明：切换用户身份，未指定用户名时默认切换为超级用户 root。

sudo

说明：以另一个用户（通常是超级管理员）的身份执行命令。

passwd

语法：passwd [选项] [用户名]

说明：修改用户口令。只有超级用户可以用“passwd 用户名”修改其他用户的口令，普通用户只能用不带参数的 passwd 修改自己的口令。

gpasswd

说明：修改工作组口令。$kp$, section = '' where id = 31087;
update t_knowledge_point set title = $kp$tar 与 gzip 组合压缩与解压$kp$, content = $kp$用一个命令完成压缩：

tar cvf - /etc/ | gzip -qc > backup.tar.gz

用一个命令完成释放：

gunzip -c backup.tar.gz | tar xvf -

解开 .tar.Z 文件：

tar xvfZ backup.tar.Z

或先解压缩再解包：

uncompress backup.tar.Z
tar xvf backup.tar$kp$, section = '' where id = 31088;
update t_knowledge_point set title = $kp$tar 归档文件的释放$kp$, content = $kp$释放 .tar 文件：

tar xvf backup.tar

释放 .tar.gz 文件：

tar xvfz backup.tar.gz$kp$, section = '' where id = 31089;
update t_knowledge_point set title = $kp$tar 命令$kp$, content = $kp$语法：tar [选项] [归档文件] [文件或目录]

说明：将文件打包到归档文件中，或从归档文件中恢复文件。若对象是目录，则整个子目录一起处理；选项不必写在文件之前。

| 选项 | 说明 |
| --- | --- |
| -c | 建立新的归档文件 |
| -t | 显示归档文件的内容 |
| -u | 只追加比归档中文件更新的文件 |
| -x | 从归档文件中解开文件 |
| -v | 处理时显示文件名 |
| -z | 归档或解包时使用 gzip 压缩和解压缩 |
| -j | 归档或解包时使用 bzip2 压缩和解压缩 |
| -r | 向归档文件末尾追加文件 |$kp$, section = '' where id = 31090;
update t_knowledge_point set title = $kp$Shell 脚本 echo 输出示例$kp$, content = $kp$脚本开头注释：The first program；作者：shenchao（shenchao@lampbrother.net）。

输出命令：

echo -e "Mr. Shen Chao is the most honest man in LampBrother"$kp$, section = '' where id = 31091;
update t_knowledge_point set title = $kp$touch、ln 命令$kp$, content = $kp$touch

语法：touch [选项] 文件…

说明：修改文件的时间戳；不加参数时创建一个空白文件。

| 选项 | 说明 |
| --- | --- |
| -a | 将文件访问时间改为当前时间 |
| -m | 将文件修改时间改为当前时间 |

ln

语法：ln [选项] 源文件 链接文件

说明：创建链接文件，分为硬链接和软链接，加 -s 创建软链接。

| 选项 | 说明 |
| --- | --- |
| -b | 删除已存在的目标文件前先备份 |
| -d、-F | 指定源目录，用于链接目录 |
| -f | 强制创建链接 |
| -s | 创建符号链接 |$kp$, section = '' where id = 31092;
update t_knowledge_point set title = $kp$Vim 简介与基本操作$kp$, content = $kp$Vim 是 Linux/UNIX 上常用的全屏幕文本编辑器，用于建立、编辑和显示文本文件，没有菜单，只有命令。

Vim 有三种工作模式：

- 命令模式：启动 vi 文件名 后即处于命令模式，可移动光标、删除字符、复制粘贴，或切换到插入模式、末行模式。
- 插入模式：只有在此模式下才能输入文字，按 Esc 返回命令模式。
- 末行模式：用于保存文件、退出编辑器、查找字符串、显示行号等。

模式切换：命令模式下按 i、a、o 进入插入模式；按 : 进入末行模式；末行模式中按回车执行命令，:wq 保存并退出。

插入命令：

| 命令 | 作用 |
| --- | --- |
| a | 在光标所在字符后插入 |
| A | 在光标所在行行尾插入 |
| i | 在光标所在字符前插入 |
| I | 在光标所在行行首插入 |
| o | 在光标所在行下插入新行 |
| O | 在光标所在行上插入新行 |$kp$, section = '' where id = 31094;
update t_knowledge_point set title = $kp$SGID 权限设置方法$kp$, content = $kp$2 代表 SGID。

设置方法：

chmod 2755 文件名
chmod g+s 文件名$kp$, section = '' where id = 31095;
update t_knowledge_point set title = $kp$SUID 权限设置方法$kp$, content = $kp$4 代表 SUID。

设置方法：

chmod 4755 文件名
chmod u+s 文件名$kp$, section = '' where id = 31096;
update t_knowledge_point set title = $kp$Linux 不靠扩展名区分文件类型$kp$, content = $kp$Linux 不靠扩展名区分文件类型，但常见扩展名仍有约定含义：

- 压缩包：*.gz、*.bz2、*.tar.bz2、*.tgz 等
- 二进制软件包：*.rpm
- 网页文件：*.html、*.php
- 脚本文件：*.sh
- 配置文件：*.conf

Linux 的所有存储设备（包括硬盘、U 盘和光盘）都必须挂载后才能使用。

Windows 下的程序不能直接在 Linux 中安装和运行。$kp$, section = '' where id = 31097;
update t_knowledge_point set title = $kp$useradd 创建用户后的验证$kp$, content = $kp$创建用户 lamp 后，用以下命令查看相关配置文件和用户目录：

useradd lamp
grep "lamp" /etc/passwd
grep "lamp" /etc/shadow
grep "lamp" /etc/group
grep "lamp" /etc/gshadow
ll -d /home/lamp/
ll /var/spool/mail/lamp$kp$, section = '' where id = 31098;
update t_knowledge_point set title = $kp$文件的 i、a 属性$kp$, content = $kp$i 属性：对文件设置后，不允许删除、改名，也不能添加和修改数据；对目录设置后，只能修改目录下文件的数据，不允许建立和删除文件。

a 属性：对文件设置后，只能在文件中追加数据，不能删除或修改数据；对目录设置后，只允许在目录中建立和修改文件，不允许删除文件。$kp$, section = '' where id = 31099;
update t_knowledge_point set title = $kp$Linux 常用工具软件：vi、tar、gzip、rpm$kp$, content = $kp$Linux 中常用的工具软件包括 vi、tar、gzip 和 rpm。

1. 文字编辑

vi 是 Linux/UNIX 下最强大的文本编辑工具，有三种状态：

- 命令模式（Command mode）：控制光标移动，删除字符或整行，复制、移动某段内容，或进入插入模式、末行模式。
- 插入模式（Insert mode）：只有在此模式下才能输入文字，按 Esc 返回命令模式。
- 末行模式（Last line mode）：将文件写入或离开编辑器，也可设置编辑环境，如查找字符串、列出行号等。

vi 的基本操作：

- 进入 vi：在系统提示符下输入 vi 及文件名，进入全屏幕编辑画面，并处于命令模式。
- 切换到插入模式：在命令模式下按 i、a 或 o。
- 离开 vi 并保存：在命令模式下按 : 进入末行模式，然后执行：
  - :w 文件名：存入指定文件
  - :wq：写入并离开 vi
  - :q!：离开并放弃编辑的文件

命令模式下的功能键：

1. 进入插入模式

- i：从当前光标所在处插入输入的文字
- a：从当前光标所在的下一个字符开始输入文字
- o：从新的一行行首开始输入文字

2. 移动光标

- h、j、k、l：分别控制光标左、下、上、右移一格
- ^b：向后一页
- ^f：向前一页
- G：移到文件最后
- 0：移到文件开头

3. 删除

- x：删除一个字符$kp$, section = '' where id = 31102;
update t_knowledge_point set title = $kp$Linux 基本操作命令$kp$, content = $kp$控制台（console）是字符操作界面的人机接口。Linux 命令和文件名对大小写敏感，输入时大小写不对，系统不会给出预期响应。

1. ls

ls 相当于 DOS 下的 dir，最常用的参数是 -a、-l、-F。

- ls -a：显示所有文件，包括以 . 开头的隐藏文件。
- ls -l：以长格式显示文件详细信息（参数是字母 l，不是数字 1）。

长格式各字段依次为：文件属性、硬链接数、拥有者、所属组、文件大小、创建日期、文件名。

示例：

drwx------ 2 Guest users 1024 Nov 21 21:05 Mail
-rwx--x--x 1 root root 89080 Nov 7 22:41 tar*
-rwxr-xr-x 1 root bin 5013 Aug 15 9:32 uname*
lrwxrwxrwx 1 root root 4 Nov 24 19:30 zcat->gzip
-rwxr-xr-x 1 root bin 308364 Nov 29 7:43 zsh*
-rwsr-x--- 1 root bin 9853 Aug 15 5:46 su*

文件属性共 10 位：第 1 位表示文件类型，d 为目录、l 为符号链接、- 为普通文件；其余 9 位每 3 位一组，分别表示所有者、所属组和其他用户的权限。以 -rwxr-xr-x 为例，rwx 为所有者可读可写可执行，r-x 为同组用户可读可执行、不可写，r-x 为其他用户可读可执行、不可写。若执行位上出现 s，表示执行该程序的用户可临时获得文件所有者的权限，常见于系统管理命令，使普通用户以 root 身份执行。

- ls -F：在文件名后添加类型符号，* 表示可执行文件，/ 表示目录，@ 表示链接文件。多数发行版的 ls 已内置该功能。

2. cd

cd 用于切换目录，用法与 DOS 相同。Linux 目录区分大小写，大小写不正确时切换失败。直接输入 cd 会回到当前用户的 Home 目录，root 用户为 /root，效果与 cd ~ 相同。

3. mkdir、rmdir

mkdir 用于建立新目录，rmdir 用于删除已建立的空目录，用法与 DOS 下的 md、rd 基本相同。

4. cp

cp 相当于 DOS 下的 copy：

cp -r 源文件 目标文件

-r 表示连同源目录中的子目录一起复制。

5. rm

rm 用于删除文件，与 DOS 下的 del、rd 不同。常用参数为 -i、-r、-f。

rm -i test

系统会询问“rm: remove 'test'?”，输入 y 并回车后才删除。Linux 没有 undelete 命令，也没有 PCTools 之类的恢复工具，删除后无法恢复，因此删除前确认很有必要。

rm -r 目录名：连同目录下的子目录一起删除。

rm -f 文件名：强制删除，不再提示。

6. mv

mv 用于移动目录或文件，也可用于重命名。移动目录时会连同其子目录一起移动。Linux 没有 rename 命令，重命名可用：

mv 原文件名 新文件名

7. du、df

du 显示目录占用的磁盘空间，df 显示磁盘剩余空间。du 不加参数时统计当前目录，加上目录参数时统计该目录占用的空间。

8. cat

cat 用于显示或连接 ASCII 文本文件，是 concatenate 的缩写，类似 DOS 下的 type。

cat text：显示 text 文件
cat file1 file2：依次显示 file1、file2 的内容
cat file1 file2 > file3：将 file1、file2 的内容合并后重定向到 file3

> 表示向右重定向，把左边的结果写入右边的文件。若 file3 已存在，其内容会被覆盖为 file1 与 file2 的内容。

cat > file1：左边没有输入文件，系统等待用户输入，输入完成后按 Ctrl+C 或 Ctrl+D 结束，生成 file1，内容为刚输入的文字，效果与 DOS 下的 copy con file1 相同。

cat file1 >> file2：将 file1 的内容追加到 file2 末尾，file2 原有内容保留。>> 比重定向符 > 更常用。

9. more、less

more 和 less 用于分页显示文本文件。文件超过一屏时，more 会暂停显示，按键后继续；less 除具有 more 的功能外，还可以用方向键上下滚动，阅读长文件更方便。

10. clear

clear 用于清除屏幕，不需要参数，功能与 DOS 下的 cls 相同。

11. pwd

pwd 显示用户当前的工作路径。

12. ln

ln 用于在另一个位置为文件建立链接，最常用的参数是 -s：

ln -s 源文件 目标文件

需要在不同目录使用同一文件时，不必在每个目录都放一份副本，只需在固定目录放一份，再在其他目录建立链接，可避免重复占用磁盘空间。例如：

ln -s /bin/less /usr/local/bin/less

-s 表示 symbolic（符号）链接。注意两点：第一，链接文件与源文件保持同步，修改任意一处，其他位置同步变化；第二，链接分为软链接和硬链接，软链接使用 ln -s，只在指定位置生成源文件的镜像，不占用额外磁盘空间；硬链接不使用 -s，会在指定位置生成与源文件大小相同的文件。两者都保持同步变化。

用 ls 查看目录时，文件名后带 @ 的文件是用 ln 生成的链接文件；用 ls -l 可以看到链接指向的路径。

13. man

man 用于查看命令用法，是 manual（手册）的缩写，说明非常详细，但内容多为英文。学习 UNIX 类操作系统时应掌握 man 的基本用法。

14. logout

logout 用于退出系统。Linux 是多用户多任务系统，使用完毕后退出即可，关闭系统由管理员负责。即使是单机使用，logout 后也不能直接关机，因为它不是关机命令。

15. mount

Linux 沿袭 UNIX 将设备当作文件处理的方式，访问软盘、光盘前必须先将它们挂载到系统中，通常挂载到 /mnt 目录下。

格式：

mount -t 文件系统类型 设备名 挂载目录

常用文件系统类型：

- msdos：DOS 分区文件系统
- vfat：支持长文件名的 DOS/Windows 分区文件系统
- iso9660：光盘文件系统
- ext2：Linux 文件系统

设备名指要挂载的设备。软盘一般为 /dev/fd0、/dev/fd1；光盘根据光驱位置决定，通常装在第二硬盘主盘位置时为 /dev/hdc；DOS 分区如 /dev/hda1 表示第一块硬盘的第一个分区。挂载目录是设备的载入点。

- 挂载软盘：先 mkdir /mnt/floppy 建立空目录，再执行 mount -t msdos /dev/fd0 /mnt/floppy，之后可在 /mnt/floppy 下访问软盘内容。
- 挂载 Windows 的 C 盘：先 mkdir /mnt/c，再执行 mount -t vfat /dev/hda1 /mnt/c，之后可在 /mnt/c 下读写 C 盘根目录内容。
- 挂载光盘：先 mkdir /mnt/cdrom，再执行 mount -t iso9660 /dev/hdc /mnt/cdrom，之后可在 /mnt/cdrom 下访问光盘内容。部分 Linux 版本允许直接用 mount /dev/cdrom 或 mount /mnt/cdrom 挂载光盘。

注意：mount 挂载的是软盘、光盘，而不是软驱、光驱。更换盘片前必须先卸载，再对新盘重新挂载。

卸载格式：

umount 目录名

例如卸载软盘：umount /mnt/floppy。卸载光盘前，直接按光驱面板上的弹出键不会生效。$kp$, section = '' where id = 31103;
update t_knowledge_point set title = $kp$以 sudo 执行 useradd 添加用户$kp$, content = $kp$不切换为 root，用 sudo 临时取得管理员权限执行 useradd：

sudo useradd user1

这样即可添加用户 user1，当前用户需具有 sudo 权限。$kp$, section = '' where id = 31105;
update t_knowledge_point set title = $kp$test 与 [] 两种条件判断写法$kp$, content = $kp$test 与 [ ] 等价，都是条件判断，注意中括号内侧与表达式之间要有空格。

```bash
test -e /root/install.log
[ -e /root/install.log ]
[ -d /root ] && echo "yes" || echo "no"
```

-e 判断文件是否存在，-d 判断是否为目录；&& 表示前面成立才执行后面，|| 表示前面不成立才执行后面。$kp$, section = '' where id = 31106;
update t_knowledge_point set title = $kp$sar 查看 CPU 使用率$kp$, content = $kp$```bash
[root@rfgz ~]# sar 3 5
Linux 2.6.9-42.0.3.EL (rfgz.3322.org)  2007年01月17日  12时40分36秒

时间          CPU  %user  %nice  %system  %iowait  %idle
12时40分39秒  all   4.33   0.00    5.33    0.00   90.33
12时40分42秒  all   3.32   0.00    5.65    0.33   90.70
12时40分45秒  all   4.00   0.00    6.33    0.00   89.67
12时40分48秒  all   3.68   0.00    5.69    0.00   90.64
12时40分51秒  all   3.32   0.00    5.65    0.00   91.03
Average:      all   3.73   0.00    5.73    0.07   90.47
```

sar 3 5 表示每 3 秒采样一次、共采样 5 次，用于查看 CPU 各项占用率。$kp$, section = '' where id = 31107;
update t_knowledge_point set title = $kp$为组分配 ACL 权限$kp$, content = $kp$为组 tgroup2 分配 ACL 权限，格式为 g:组名:权限：

```bash
setfacl -m g:tgroup2:rx 文件名
```

m 表示修改 ACL 条目，g 表示对象是组，rx 为授予的权限。$kp$, section = '' where id = 31108;
update t_knowledge_point set title = $kp$PS1 提示符设置示例$kp$, content = $kp$```bash
[root@localhost ~]# PS1='[\u@\t \w]\$'
[root@04:50:08 /usr/local/src]# PS1='[\u@\@ \h \# \W]\$'
[root@04:53 上午 localhost 31 src]# PS1='[\u@\h \W]\$'
```

\u 用户名、\h 主机名、\w 完整路径、\W 当前目录名、\t 24 小时制时间、\@ 12 小时制时间、\# 命令序号、\$ 提示符。$kp$, section = '' where id = 31109;
update t_knowledge_point set title = $kp$ps 与 kill 进程处理指令$kp$, content = $kp$### ps

ps 用于显示当前 process 或系统 processes 的状况，常用选项：

- -a：列出包括其他 users 的 process 状况
- -u：显示 user-oriented 的 process 状况
- -x：显示包括没有 terminal 控制的 process 状况
- -w：使用较宽的显示模式

通过 ps 可取得目前 processes 的状况，如 pid、running state 等。

### kill

kill 的用途是送一个 signal 给某个 process，因为大部份送的都是用来杀掉 process 的 SIGKILL 或 SIGHUP，因此称为 kill。用法：

```bash
kill [ -SIGNAL ] pid ...
kill -l
```

SIGNAL 为 signal 的数字，从 0 到 31，其中 9 是 SIGKILL，一般用来杀掉无法正常 terminate 的进程，其余信号的用途可参考 sigvec(2)。也可以用 kill -l 查看可代替 signal 号码的名称，详细情形请参阅 man kill。$kp$, section = '' where id = 31112;
update t_knowledge_point set title = $kp$shell 脚本实现 1 加到 100$kp$, content = $kp$```bash
#!/bin/bash
# Author: shenchao (E-mail: shenchao@lampbrother.net)
s=0
for (( i=1; i<=100; i=i+1 ))
do
  s=$(( $s + $i ))
done
echo "The sum of 1+2+...+100 is: $s"
```

用 for 循环从 1 累加到 100，结果存入变量 s 后输出。$kp$, section = '' where id = 31113;
update t_knowledge_point set title = $kp$匹配 s 与 i 之间为 a 或 o$kp$, content = $kp$“[]”匹配中括号中指定的任意一个字符，且只匹配一个字符。

```bash
grep "s[ao]id" test_rule.txt
```

该表达式匹配 sid 或 sod。$kp$, section = '' where id = 31114;
update t_knowledge_point set title = $kp$使用 $* 代表所有参数$kp$, content = $kp$```bash
echo "The parameters is: $*"
```

$* 把命令行传入的所有参数作为一个整体看待。$kp$, section = '' where id = 31116;
update t_knowledge_point set title = $kp$使用 $@ 代表所有参数$kp$, content = $kp$```bash
echo "The parameters is: $@"
```

$@ 代表所有参数，加双引号时每个参数仍是独立的字符串。$kp$, section = '' where id = 31117;
update t_knowledge_point set title = $kp$$* 与 $@ 的区别$kp$, content = $kp$$* 把全部参数视为一个字符串，$@ 把每个参数视为独立的字符串。二者不加引号时表现相同，加双引号时才有区别：传入 a b c 时，"$*" 为 "a b c"，"$@" 为 "a" "b" "c"。$kp$, section = '' where id = 31118;
update t_knowledge_point set title = $kp$read -n 1 接收单个字符$kp$, content = $kp$```bash
read -n 1 -t 30 -p "Please input your sex: " gender
echo -e "\n"
echo "Sex is $gender"
```

-n 1 表示只接收一个输入字符就执行，不需要按回车；-t 30 为 30 秒超时，超时后继续执行。$kp$, section = '' where id = 31119;
update t_knowledge_point set title = $kp$nmap 检测 httpd 状态并自动启动$kp$, content = $kp$```bash
port=$(nmap -sT 服务器IP | grep tcp | grep http | awk '{print $2}')
if [ "$port" == "open" ]; then
  echo "$(date) httpd is ok!" >> /tmp/autostart-acc.log
else
  /etc/rc.d/init.d/httpd start &>/dev/null
  echo "$(date) restart httpd !!" >> /tmp/autostart-err.log
fi
```

用 nmap 扫描服务器，截取 apache 服务的状态赋给变量 port，为 open 时记录正常日志，否则启动 httpd 并记录错误日志。$kp$, section = '' where id = 31120;
update t_knowledge_point set title = $kp$gunzip 解压 .gz 文件$kp$, content = $kp$```bash
gunzip initramfs-2.6.32-279.el6.i686.img.gz
```

解压后得到 initramfs-2.6.32-279.el6.i686.img，原 .gz 文件被删除。$kp$, section = '' where id = 31123;
update t_knowledge_point set title = $kp$修改 ACL 的最大有效权限$kp$, content = $kp$```bash
setfacl -m m:rx 文件名
```

m: 表示 mask，用于设置 ACL 的最大有效权限，用户和组的实际权限不能超过 mask。$kp$, section = '' where id = 31124;
update t_knowledge_point set title = $kp$将用户加入附加组$kp$, content = $kp$```bash
usermod -G root lamp
```

把用户 lamp 加入 root 组（附加组）。-G 会覆盖原有附加组，需要保留原有附加组时用 -aG。$kp$, section = '' where id = 31125;
update t_knowledge_point set title = $kp$restore 还原完全备份$kp$, content = $kp$```bash
mkdir boot.test
cd boot.test/
restore -r -f /root/boot.bak.bz2
```

先进入一个空目录，再用 restore -r 从完全备份文件还原数据，-f 指定备份文件。$kp$, section = '' where id = 31127;
update t_knowledge_point set title = $kp$su -c 以 root 执行单条命令$kp$, content = $kp$```bash
su - root -c "useradd user3"
```

切换到 root 并执行单条命令 useradd user3，执行完仍回到原用户。$kp$, section = '' where id = 31130;
update t_knowledge_point set title = $kp$-ef 判断两个文件是否为硬链接$kp$, content = $kp$```bash
[ /root/student.txt -ef /tmp/stu.txt ] && echo "yes" || echo "no"
```

-ef 判断两个文件是否指向同一个 inode，输出 yes 说明二者是硬链接。$kp$, section = '' where id = 31132;
update t_knowledge_point set title = $kp$echo -e 输出制表符与换行符$kp$, content = $kp$```bash
echo -e "a\tb\tc\nd\te\tf"
```

\t 为制表符，\n 为换行符，输出为 a、b、c 三个以制表符分隔的字段，换行后是 d、e、f。$kp$, section = '' where id = 31133;
update t_knowledge_point set title = $kp$删除指定组的 ACL 权限$kp$, content = $kp$```bash
setfacl -x g:组名 文件名
```

删除指定组的 ACL 权限；setfacl -b 文件名 可删除全部 ACL 权限。$kp$, section = '' where id = 31134;
update t_knowledge_point set title = $kp$sed 在指定行后追加内容$kp$, content = $kp$```bash
sed '2a hello' student.txt
```

在第 2 行后追加一行 hello，只输出到屏幕，不修改文件本身；要写回文件需加 -i。$kp$, section = '' where id = 31135;
update t_knowledge_point set title = $kp$数值比较 -le 示例$kp$, content = $kp$```bash
[ 23 -le 22 ] && echo "yes" || echo "no"
```

-le 表示小于等于，23 -le 22 不成立，所以输出 no；大于等于是 -ge。$kp$, section = '' where id = 31136;
update t_knowledge_point set title = $kp$判断文件是否为普通文件$kp$, content = $kp$```bash
if [ -f "$file" ]; then
  echo "$file is a regular file!"
elif [ -d "$file" ]; then
  echo "$file is a directory!"
fi
```

-f 判断是否为普通文件，-d 判断是否为目录。$kp$, section = '' where id = 31137;
update t_knowledge_point set title = $kp$判断变量是否为空$kp$, content = $kp$```bash
[ -z "$name" ] && echo "yes" || echo "no"
```

-z 在变量为空时返回真，-n 在变量不为空时返回真。name 不为空，-z 不成立，所以输出 no。$kp$, section = '' where id = 31138;
update t_knowledge_point set title = $kp$判断当前系统的位数$kp$, content = $kp$```bash
file /bin/ls
```

输出中 ELF 32-bit 表示 32 位系统，ELF 64-bit 表示 64 位系统。$kp$, section = '' where id = 31139;
update t_knowledge_point set title = $kp$read 与 case 判断用户输入$kp$, content = $kp$```bash
read -p "Please choose yes/no: " -t 30 cho
case $cho in
  "yes")
    echo "Your choose is yes!"
    ;;
  "no")
    echo "Your choose is no!"
    ;;
  *)
    echo "Your choose is error!"
    ;;
esac
```

-t 30 表示 30 秒内未输入则超时；case 按输入内容分别处理，* 匹配其他所有情况。$kp$, section = '' where id = 31140;
update t_knowledge_point set title = $kp$echo -e 用十六进制转义输出字符$kp$, content = $kp$```bash
echo -e "\x61\t\x62\t\x63\n\x64\t\x65\t\x66"
```

\x61 等是十六进制 ASCII 码，分别对应 a 到 f；\t 为制表符，\n 为换行符。$kp$, section = '' where id = 31141;
update t_knowledge_point set title = $kp$关闭 swap 分区$kp$, content = $kp$```bash
swapoff /dev/sdb1
```

关闭 /dev/sdb1 的 swap；重新启用用 swapon /dev/sdb1。$kp$, section = '' where id = 31142;
update t_knowledge_point set title = $kp$sed 常用动作说明$kp$, content = $kp$- a：追加，在当前行后添加一行或多行；添加多行时，除最后一行外，每行末尾需用“\”表示数据未完结。
- c：行替换，用 c 后面的字符串替换原数据行；替换多行时，除最后一行外，每行末尾需用“\”表示数据未完结。
- i：插入，在当前行前插入一行或多行；插入多行时，除最后一行外，每行末尾需用“\”表示数据未完结。
- d：删除，删除指定的行。
- p：打印，输出指定的行。
- s：字串替换，用一个字符串替换另外一个字符串，格式为“行范围s/旧字串/新字串/g”，与 vim 中的替换格式类似。$kp$, section = '' where id = 31143;
update t_knowledge_point set title = $kp$匹配连续三个数字$kp$, content = $kp$```bash
grep "[0-9]\{3\}" test_rule.txt
```

\{3\} 表示其前面的字符恰好出现 3 次，即匹配包含连续三个数字的行。$kp$, section = '' where id = 31144;
update t_knowledge_point set title = $kp$匹配任意一个数字$kp$, content = $kp$```bash
grep "[0-9]" test_rule.txt
```

匹配包含任意一个数字的行。$kp$, section = '' where id = 31145;
update t_knowledge_point set title = $kp$匹配不以字母开头的行$kp$, content = $kp$```bash
grep "^[^a-zA-Z]" test_rule.txt
```

中括号内的 ^ 表示取反，该表达式匹配不以字母开头的行。$kp$, section = '' where id = 31146;
update t_knowledge_point set title = $kp$匹配以小写 n 结尾的行$kp$, content = $kp$```bash
grep "n$" test_rule.txt
```

$ 匹配行尾，该表达式匹配以小写 n 结尾的行。$kp$, section = '' where id = 31147;
update t_knowledge_point set title = $kp$匹配空白行$kp$, content = $kp$```bash
grep -n "^$" test_rule.txt
```

^$ 匹配空白行，-n 同时输出行号。$kp$, section = '' where id = 31148;
update t_knowledge_point set title = $kp$匹配以小写字母开头的行$kp$, content = $kp$```bash
grep "^[a-z]" test_rule.txt
```

^ 匹配行首，该表达式匹配以小写字母开头的行。$kp$, section = '' where id = 31149;
update t_knowledge_point set title = $kp$匹配 a 连续出现三次$kp$, content = $kp$```bash
grep "a\{3\}" test_rule.txt
```

“\{n\}”表示其前面的字符恰好出现 n 次，此处匹配 a 连续出现三次的行。$kp$, section = '' where id = 31150;
update t_knowledge_point set title = $kp$匹配至少三个数字开头后接小写字母的行$kp$, content = $kp$```bash
grep "^[0-9]\{3,\}[a-z]" test_rule.txt
```

“\{n,\}”表示其前面的字符出现不少于 n 次，此处匹配以至少三个数字开头、后接一个小写字母的行。$kp$, section = '' where id = 31151;
update t_knowledge_point set title = $kp$匹配所有内容$kp$, content = $kp$```bash
grep ".*" test_rule.txt
```

. 匹配任意单个字符，* 表示其前面的字符出现零次或多次，因此该表达式匹配所有行；若要匹配 s 与 d 之间的任意字符，写作 grep "s.*d" test_rule.txt。$kp$, section = '' where id = 31152;
update t_knowledge_point set title = $kp$匹配 s 与 i 之间 1 到 3 个 a$kp$, content = $kp$```bash
grep "sa\{1,3\}i" test_rule.txt
```

\{1,3\} 表示其前面的字符出现 1 到 3 次，即匹配 s 与 i 之间有最少一个、最多三个 a 的行。$kp$, section = '' where id = 31153;
update t_knowledge_point set title = $kp$匹配以大写 M 开头的行$kp$, content = $kp$```bash
grep "^M" test_rule.txt
```

^ 匹配行首，$ 匹配行尾，该表达式匹配以大写 M 开头的行。$kp$, section = '' where id = 31154;
update t_knowledge_point set title = $kp$匹配所有内容（包括空白行）$kp$, content = $kp$grep "a*" test_rule.txt

`a*` 表示字符 a 出现零次或多次，因此任意行（包括空白行）都能匹配。$kp$, section = '' where id = 31155;
update t_knowledge_point set title = $kp$字符重复次数匹配$kp$, content = $kp$`\{n,m\}` 匹配其前面的字符至少出现 n 次、最多 m 次。

grep "sa\{1,3\}i" test_rule.txt

匹配 s 与 i 之间有 1 到 3 个 a 的字符串，如 sai、saai、saaai。$kp$, section = '' where id = 31156;
update t_knowledge_point set title = $kp$匹配不以小写字母开头的行$kp$, content = $kp$`[^]` 匹配除中括号内字符以外的任意一个字符，`^` 表示行首。

grep "^[^a-z]" test_rule.txt

匹配行首不是小写字母的行。$kp$, section = '' where id = 31157;
update t_knowledge_point set title = $kp$匹配至少包含一个 a 的行$kp$, content = $kp$grep "aa*" test_rule.txt

匹配至少包含一个 a 的行。

grep "aaa*" test_rule.txt

匹配至少包含两个连续 a 的字符串。$kp$, section = '' where id = 31158;
update t_knowledge_point set title = $kp$点号匹配除换行符外的任意一个字符$kp$, content = $kp$grep "s..d" test_rule.txt

s..d 匹配 s 和 d 之间恰好有两个字符的单词。

grep "s.*d" test_rule.txt

s.*d 匹配 s 和 d 之间可以有任意个字符的单词。$kp$, section = '' where id = 31159;
update t_knowledge_point set title = $kp$有关打印的指令$kp$, content = $kp$以下为打印会用到的指令。本系打印机有 lp1、lp2（点阵打印机），lw、sp、ps、compaq（激光打印机），供使用者使用。

1. lpr

lpr 用于将文件送到打印机打印。用法：

lpr -P[printer] file1 file2 file3 ...$kp$, section = '' where id = 31160;
update t_knowledge_point set title = $kp$单引号与双引号$kp$, content = $kp$name=sc

echo '$name'　输出 $name，单引号内不解析变量

echo "$name"　输出 sc，双引号内解析变量

echo '$(date)'　输出 $(date)，单引号内不执行命令替换

echo "$(date)"　输出当前日期时间，双引号内执行命令替换$kp$, section = '' where id = 31161;
update t_knowledge_point set title = $kp$历史命令的调用$kp$, content = $kp$◆ 使用上、下箭头调用以前的历史命令
◆ 使用 “!n” 重复执行第 n 条历史命令
◆ 使用 “!!” 重复执行上一条命令
◆ 使用 “!字串” 重复执行最后一条以该字串开头的命令$kp$, section = '' where id = 31164;
update t_knowledge_point set title = $kp$压缩解压命令：bunzip2$kp$, content = $kp$命令名称：bunzip2

命令所在路径：/usr/bin/bunzip2

执行权限：所有用户

语法：bunzip2 选项 [-k] [压缩文件]

-k 解压缩后保留原文件

功能描述：解压缩

范例：bunzip2 -k boduo.bz2

tar -xjf Japan.tar.bz2$kp$, section = '' where id = 31165;
update t_knowledge_point set title = $kp$压缩解压命令：bzip2$kp$, content = $kp$命令名称：bzip2

命令所在路径：/usr/bin/bzip2

执行权限：所有用户

语法：bzip2 选项 [-k] [文件]

-k 产生压缩文件后保留原文件

功能描述：压缩文件

压缩后文件格式：.bz2

范例：bzip2 -k boduo

tar -cjf Japan.tar.bz2 Japan$kp$, section = '' where id = 31166;
update t_knowledge_point set title = $kp$压缩解压命令：gzip$kp$, content = $kp$命令名称：gzip

命令英文原意：GNU zip

命令所在路径：/bin/gzip

执行权限：所有用户

语法：gzip [文件]

功能描述：压缩文件

压缩后文件格式：.gz$kp$, section = '' where id = 31167;
update t_knowledge_point set title = $kp$打包压缩命令：tar$kp$, content = $kp$命令名称：tar

命令所在路径：/bin/tar

执行权限：所有用户

语法：tar 选项 [-zcf] [压缩后文件名] [目录]

-c 打包

-v 显示详细信息

-f 指定文件名

-z 打包同时压缩

功能描述：打包目录

压缩后文件格式：.tar.gz$kp$, section = '' where id = 31168;
update t_knowledge_point set title = $kp$按指定分隔符的列排序$kp$, content = $kp$sort -t ":" -k 3,3 /etc/passwd

以冒号为分隔符，按第 3 列排序；加 -r 选项则为反向排序。$kp$, section = '' where id = 31171;
update t_knowledge_point set title = $kp$反引号与 $()$kp$, content = $kp$反引号与 $() 都用于命令替换：先执行其中的命令，再用其输出替换。

echo `ls`

echo $(date)$kp$, section = '' where id = 31172;
update t_knowledge_point set title = $kp$同时把 Liming 和 Gao 替换为空$kp$, content = $kp$sed 's/Liming//g; s/Gao//g' student.txt

把 student.txt 中所有的 Liming 和 Gao 都替换为空。$kp$, section = '' where id = 31173;
update t_knowledge_point set title = $kp$启动与自启动$kp$, content = $kp$◆ 服务启动：就是在当前系统中让服务运行，并提供功能。
◆ 服务自启动：让服务在系统开机或重新启动之后，随着系统的启动而自动启动。$kp$, section = '' where id = 31174;
update t_knowledge_point set title = $kp$管道符：前一命令的输出作为后一命令的输入$kp$, content = $kp$命令1 | 命令2：把命令1的正确输出作为命令2的操作对象。

示例：

ll -a /etc/ | more

netstat -an | grep "ESTABLISHED"

grep 命令格式：grep [选项] "搜索内容" 文件名

-i 忽略大小写

-n 输出行号

-v 反向查找

--color=auto 搜索出的关键字用颜色显示$kp$, section = '' where id = 31176;
update t_knowledge_point set title = $kp$命令格式$kp$, content = $kp$命令格式：命令 [-选项] [参数]

例：ls -la /etc

说明：

1）个别命令使用不遵循此格式

2）当有多个选项时，可以写在一起

3）简化选项与完整选项：-a 等于 --all$kp$, section = '' where id = 31177;
update t_knowledge_point set title = $kp$查看软件安装目录结构$kp$, content = $kp$以 Google Earth 为例，安装目录 /usr/local/google-earth 下包含 information、kvw、lang、linux、res、resources.xml、manifest、drivers.ini、EULA-GoogleEarth-en.txt、googleearth、googleearth.xpm 等文件，可用文件浏览器逐层查看。$kp$, section = '' where id = 31178;
update t_knowledge_point set title = $kp$基本的系统管理命令$kp$, content = $kp$系统管理大致分为两类：一是 root（系统管理员）对 Linux 系统的管理，负责系统稳定运行、增加安全性、校验使用者身份、新增或删除用户、明确各使用者的权限；二是每个使用者（包括 root）对自己文件的权限管理。Linux 是多用户多任务系统，使用者可能把工作内容或机密文件放在工作站上，因此对每个文件或目录的归属和使用权都要有明确规定。下面按管理员和一般用户分类介绍基本的系统管理命令。

一、管理员使用的系统管理指令

1. adduser 命令

新增使用者账号。例如新增名为 jack 的用户：

adduser jack

用户名区分大小写。新增的用户没有口令，还应为用户设置口令，或让用户在第一次登录系统时自行设置。

2. passwd 命令

修改特定用户的口令，格式：

passwd 用户名

系统会提示输入新密码，需输入两遍确认。一般用户使用该命令只能修改自己的密码。

3. find、whereis、locate 命令

三者都用于查找文件，格式：

find 路径名称 -name 文件名 参数

whereis 文件名

locate 文件名

find 功能最强，但需要遍历硬盘，开销大；whereis 和 locate 从系统数据库中查找，速度很快。日常查找小文件用 whereis 或 locate 即可，系统管理时用 find 加参数。

4. su 命令

普通用户知道管理员密码后，可切换为具有管理员权限的超级用户。为避免 root 密码被他人知晓而危害系统安全，应避免直接用 root 身份登录做日常操作，尽量用 su 临时管理系统，并定期更换 root 密码。

su

输入管理员口令后即可获得全部管理员权限；执行完管理操作后输入 logout 退回原普通用户状态。

5. shutdown、halt 命令

用于关闭 Linux 系统。普通用户不能随意关机，关闭或重启系统只有管理员有权执行。系统运行时会用部分内存作缓存，若数据尚未写入硬盘就断电，可能对系统造成损害，建议关机前执行三次同步：

sync;sync;sync

shutdown 的常用格式：

shutdown　系统内置 2 分钟后关机，并向正在使用的用户发送消息

shutdown -h now　立即关机

shutdown -r now　立即重新启动，相当于 reboot

shutdown -h 20:25　今天 20:25 关机

shutdown -h +10　10 分钟后关机

关机前要给使用者发送信息，可加 -q 参数，输出系统内置的 shutdown 信息，通知他们离线。

halt 命令输入后系统即开始关闭过程，效果与 shutdown 类似。$kp$, section = '' where id = 31179;
update t_knowledge_point set title = $kp$逻辑与判断：变量非空且大于 23 时输出 yes$kp$, content = $kp$aa=24

[ -n "$aa" -a "$aa" -gt 23 ] && echo "yes" || echo "no"

yes

-n 判断变量值非空，-a 表示两个条件同时成立，-gt 判断大于。$kp$, section = '' where id = 31181;
update t_knowledge_point set title = $kp$变量为空时取默认值$kp$, content = $kp$x=${y:-new}

变量 y 不存在或为空时，${y:-new} 取默认值 new，因此 x=new。$kp$, section = '' where id = 31182;
update t_knowledge_point set title = $kp$把第二行替换为指定内容$kp$, content = $kp$sed '2c No such person' student.txt

c 为替换命令，把第 2 行整行替换为 No such person。$kp$, section = '' where id = 31183;
update t_knowledge_point set title = $kp$在第二行前插入两行内容$kp$, content = $kp$sed '2i hello\nworld' student.txt

i 为插入命令，在第 2 行前插入 hello 和 world 两行。$kp$, section = '' where id = 31184;
update t_knowledge_point set title = $kp$查看备份记录$kp$, content = $kp$cat /etc/dumpdates

执行完全备份（dump 加 -u 选项）后，可用该命令查看各文件系统的备份级别与时间。$kp$, section = '' where id = 31185;
update t_knowledge_point set title = $kp$备份 /boot 分区并压缩$kp$, content = $kp$dump -1uj -f /root/boot.bak1.bz2 /boot/

对 /boot 分区做 1 级备份：-u 更新 /etc/dumpdates，-j 以 bzip2 压缩，-f 指定备份文件。$kp$, section = '' where id = 31186;
update t_knowledge_point set title = $kp$字符串替换$kp$, content = $kp$sed 's/旧字串/新字串/g' 文件名

sed '3s/74/99/g' student.txt

把第 3 行中的 74 全部替换为 99。$kp$, section = '' where id = 31187;
update t_knowledge_point set title = $kp$学生成绩表$kp$, content = $kp$vi student.txt

| ID | Name | PHP | Linux | MySQL | Average |
| --- | --- | --- | --- | --- | --- |
| 1 | Liming | 82 | 95 | 86 | 87.66 |
| 2 | Sc | 74 | 96 | 87 | 85.66 |
| 3 | Gao | 99 | 83 | 93 | 91.66 |$kp$, section = '' where id = 31188;
update t_knowledge_point set title = $kp$vi 的定位、删除、复制与粘贴命令$kp$, content = $kp$定位命令

| 命令 | 作用 |
| --- | --- |
| :set nu | 设置行号 |
| :set nonu | 取消行号 |
| gg | 到第一行 |
| G | 到最后一行 |
| nG | 到第 n 行 |
| :n | 到第 n 行 |
| $ | 移至行尾 |
| 0 | 移至行首 |

删除命令

| 命令 | 作用 |
| --- | --- |
| x | 删除光标所在处字符 |
| nx | 删除光标所在处后 n 个字符 |
| dd | 删除光标所在行，ndd 删除 n 行 |
| dG | 删除光标所在行到文件末尾内容 |
| D | 删除光标所在处到行尾内容 |
| :n1,n2d | 删除指定范围的行 |

复制和剪切命令

| 命令 | 作用 |
| --- | --- |
| yy | 复制当前行 |
| nyy | 复制当前行以下 n 行 |
| dd | 剪切当前行 |
| ndd | 剪切当前行以下 n 行 |
| p、P | 粘贴在当前光标所在行下或行上 |$kp$, section = '' where id = 31190;
update t_knowledge_point set title = $kp$/etc/sudoers 中的授权格式$kp$, content = $kp$用 visudo 实际修改的是 /etc/sudoers 文件，授权格式为：用户 主机=(可切换用户) 可执行命令。

root ALL=(ALL) ALL$kp$, section = '' where id = 31191;
update t_knowledge_point set title = $kp$帮助命令：help$kp$, content = $kp$命令名称：help

命令所在路径：Shell 内置命令

执行权限：所有用户

语法：help 命令

功能描述：获得 Shell 内置命令的帮助信息

范例：help umask

查看 umask 命令的帮助信息$kp$, section = '' where id = 31192;
update t_knowledge_point set title = $kp$常用 Linux 命令（目录与帮助）$kp$, content = $kp$| 命令 | 说明 |
| --- | --- |
| ls | 显示指定工作目录下的内容 |
| dir | 同 ls 命令，方便 DOS 用户使用 |
| cd | 变换工作目录 |
| pwd | 显示当前活动目录的绝对路径 |
| clear | 清屏命令 |
| man | 查看指令、配置文件的帮助信息，相关信息：help、info、FAQ、internet |
| mkdir | 创建新目录 |
| rmdir | 删除空目录 |$kp$, section = '' where id = 31193;
update t_knowledge_point set title = $kp$常用 Linux 命令（文件查看）$kp$, content = $kp$| 命令 | 说明 |
| --- | --- |
| more | 分屏显示文件内容，按空格向文件末尾翻页，按 b 键向文件首部翻页，按 h 查看帮助 |
| less | 分屏显示文件内容，按 j、k 上下翻页，按 h 查看帮助 |
| head | 显示文件前 10 行内容 |
| tail | 显示文件后 10 行内容 |
| cat | 适合显示短小文件，或将几个文档连接后用重定向符 > 输出到文档 |$kp$, section = '' where id = 31194;
update t_knowledge_point set title = $kp$常用 Linux 命令（文件与权限操作）$kp$, content = $kp$| 命令 | 说明 |
| --- | --- |
| rm | 删除文档和目录 |
| touch | 创建一个空白文件或改变已有文件的时间戳 |
| cp | 复制文件（或者目录等） |
| mv | 移动目录或给文件改名 |
| ln | 创建软链接、硬链接 |
| chmod | 修改文件或目录的权限 |
| chown | 修改文件或目录所属的用户 |
| chgrp | 修改文件或目录所属的工作组 |$kp$, section = '' where id = 31195;
update t_knowledge_point set title = $kp$常用 Linux 命令（磁盘与压缩）$kp$, content = $kp$| 命令 | 说明 |
| --- | --- |
| du | 显示当前目录所占的磁盘空间 |
| df | 显示当前磁盘剩余的磁盘空间 |
| fdisk | 显示当前磁盘的分区情况 |
| mount | 将某个文件系统挂载到某个目录上 |
| umount | 卸载已挂载的文件系统 |
| tar | 打包和解包某个目录和文件 |
| gzip | 压缩某个文件和目录，gunzip 解压缩 |
| bzip2 | 压缩某个文件和目录，bunzip2 解压缩 |$kp$, section = '' where id = 31200;
update t_knowledge_point set title = $kp$挂载光盘$kp$, content = $kp$先建立挂载点目录 /mnt/cdrom，再执行：

mount -t iso9660 /dev/cdrom /mnt/cdrom/

以 iso9660 文件系统类型挂载光盘设备到该目录。$kp$, section = '' where id = 31202;
update t_knowledge_point set title = $kp$手工删除用户$kp$, content = $kp$◆ vi /etc/passwd
◆ vi /etc/shadow
◆ vi /etc/group
◆ vi /etc/gshadow
◆ rm -rf /var/spool/mail/lamp
◆ rm -rf /home/lamp/

依次删除用户账号、密码、组、组密码记录，以及其邮箱和家目录。$kp$, section = '' where id = 31204;
update t_knowledge_point set title = $kp$批量解压缩脚本$kp$, content = $kp$# Author: shenchao (E-mail: shenchao@lampbrother.net)

cd /lamp

ls *.tar.gz > ls.log

for i in $(cat ls.log)

do

tar -zxf $i &>/dev/null

done

rm -rf /lamp/ls.log$kp$, section = '' where id = 31205;
update t_knowledge_point set title = $kp$比较备份内容与当前文件$kp$, content = $kp$restore -C -f /root/boot.bak.bz2

-C 为比较模式，将备份内容与当前文件系统中的文件逐一比较。$kp$, section = '' where id = 31206;
update t_knowledge_point set title = $kp$锁定用户账号$kp$, content = $kp$usermod -L lamp

-L 锁定 lamp 用户的密码，使其无法登录；对应解锁命令为 usermod -U lamp。$kp$, section = '' where id = 31208;
update t_knowledge_point set title = $kp$根分区使用率超过阈值时告警$kp$, content = $kp$把根分区使用率赋给变量 rate 后判断是否超限：

```shell
if [ $rate -ge 80 ]
then
  echo "Warning! /dev/sda3 is full!!"
fi
```

当 rate 大于等于 80 时输出告警信息。$kp$, section = '' where id = 31209;
update t_knowledge_point set title = $kp$挂载命令 mount$kp$, content = $kp$命令名称：mount
命令位置：/bin/mount
执行权限：所有用户
命令语法：mount [-t 文件系统] 设备文件名 挂载点
范例：mount -t iso9660 /dev/sr0 /mnt/cdrom$kp$, section = '' where id = 31213;
update t_knowledge_point set title = $kp$按指定分隔符的第三字段排序$kp$, content = $kp$指定分隔符为冒号，只对第三个字段排序：

```shell
sort -n -t ":" -k 3,3 /etc/passwd
```

-n 按数值排序，-t 指定分隔符，-k 3,3 表示从第三字段开始到第三字段结束。$kp$, section = '' where id = 31215;
update t_knowledge_point set title = $kp$排序用户信息文件$kp$, content = $kp$```shell
sort -r /etc/passwd
```

-r 表示反向排序。$kp$, section = '' where id = 31216;
update t_knowledge_point set title = $kp$复制 inittab 文件到当前目录$kp$, content = $kp$```shell
cp /etc/inittab .
```

将 /etc/inittab 复制到当前目录，末尾的点代表当前目录。$kp$, section = '' where id = 31217;
update t_knowledge_point set title = $kp$read 限时读取用户输入$kp$, content = $kp$```shell
read -s -t 30 -p "Please enter your age: " age
echo -e "\n"
echo "Age is $age"
read -n 1 -t 30 -p "Please select your gender[M/F]: " gender
```

-t 30 表示等待 30 秒，-p 输出提示信息，-s 隐藏输入（年龄属于隐私），-n 1 表示只读取 1 个字符，读取结果分别存入变量 age 和 gender。$kp$, section = '' where id = 31218;
update t_knowledge_point set title = $kp$切换主目录并查询文件所属软件包$kp$, content = $kp$```shell
cd /root
rpm -qf /etc/inittab
```

cd /root 切换到 root 的主目录，rpm -qf 查询指定文件属于哪个已安装的软件包。$kp$, section = '' where id = 31219;
update t_knowledge_point set title = $kp$文件处理命令 cat$kp$, content = $kp$命令名称：cat
命令所在路径：/bin/cat
执行权限：所有用户
语法：cat [文件名]
功能描述：显示文件内容
-n 显示行号
范例：cat /etc/issue；cat -n /etc/services$kp$, section = '' where id = 31221;
update t_knowledge_point set title = $kp$文件处理命令 head$kp$, content = $kp$命令名称：head
命令所在路径：/usr/bin/head
执行权限：所有用户
语法：head [文件名]
功能描述：显示文件前面几行
-n 指定行数
范例：head -n 20 /etc/services$kp$, section = '' where id = 31222;
update t_knowledge_point set title = $kp$文件处理命令 less$kp$, content = $kp$命令名称：less
命令所在路径：/usr/bin/less
执行权限：所有用户
语法：less [文件名]
功能描述：分页显示文件内容，可向上翻页
范例：less /etc/services$kp$, section = '' where id = 31223;
update t_knowledge_point set title = $kp$文件处理命令 more$kp$, content = $kp$命令名称：more
命令所在路径：/bin/more
执行权限：所有用户
语法：more [文件名]
操作：空格或 f 翻页，Enter 换行，q 或 Q 退出
功能描述：分页显示文件内容
范例：more /etc/services$kp$, section = '' where id = 31224;
update t_knowledge_point set title = $kp$文件处理命令 rmdir$kp$, content = $kp$命令名称：rmdir
命令英文原意：remove empty directories
命令所在路径：/bin/rmdir
执行权限：所有用户
语法：rmdir [目录名]
功能描述：删除空目录
范例：rmdir /tmp/Japan/boduo$kp$, section = '' where id = 31225;
update t_knowledge_point set title = $kp$文件处理命令 tac$kp$, content = $kp$命令名称：tac
命令所在路径：/usr/bin/tac
执行权限：所有用户
语法：tac [文件名]
功能描述：反向显示文件内容
范例：tac /etc/issue$kp$, section = '' where id = 31226;
update t_knowledge_point set title = $kp$文件处理命令 tail$kp$, content = $kp$命令名称：tail
命令所在路径：/usr/bin/tail
执行权限：所有用户
语法：tail [文件名]
功能描述：显示文件后面几行
-n 指定行数
-f 动态显示文件末尾内容
范例：tail -n 18 /etc/services$kp$, section = '' where id = 31227;
update t_knowledge_point set title = $kp$文件处理命令 touch$kp$, content = $kp$命令名称：touch
命令所在路径：/bin/touch
执行权限：所有用户
语法：touch [文件名]
功能描述：创建空文件
范例：touch Japanlovestory.list$kp$, section = '' where id = 31228;
update t_knowledge_point set title = $kp$文件搜索命令 find$kp$, content = $kp$```shell
find /etc -size +163840 -a -size -204800
find /etc -name inittab -exec ls -l {} \;
```

第一条在 /etc 下查找大于 80MB 且小于 100MB 的文件，-a 表示两个条件同时满足，-o 表示满足任意一个即可。
第二条在 /etc 下查找 inittab 文件并显示其详细信息，-exec/-ok 命令 {} \; 表示对搜索结果执行操作。$kp$, section = '' where id = 31232;
update t_knowledge_point set title = $kp$文件搜索命令 locate$kp$, content = $kp$命令名称：locate
命令所在路径：/usr/bin/locate
执行权限：所有用户
语法：locate 文件名
功能描述：在文件资料库中查找文件
范例：locate inittab$kp$, section = '' where id = 31234;
update t_knowledge_point set title = $kp$文件搜索命令 whereis$kp$, content = $kp$命令名称：whereis
命令所在路径：/usr/bin/whereis
执行权限：所有用户
语法：whereis [命令名称]
功能描述：搜索命令所在目录及帮助文档路径
范例：whereis ls$kp$, section = '' where id = 31235;
update t_knowledge_point set title = $kp$文件搜索命令 which$kp$, content = $kp$命令名称：which
命令所在路径：/usr/bin/which
执行权限：所有用户
语法：which 命令
功能描述：搜索命令所在目录及别名信息
范例：which ls$kp$, section = '' where id = 31236;
update t_knowledge_point set title = $kp$文件与目录权限含义总结$kp$, content = $kp$| 代表字符 | 权限 | 对文件的含义 | 对目录的含义 |
| --- | --- | --- | --- |
| r | 读权限 | 可以查看文件内容 | 可以列出目录中的内容 |
| w | 写权限 | 可以修改文件内容 | 可以在目录中创建、删除文件 |
| x | 执行权限 | 可以执行文件 | 可以进入目录 |$kp$, section = '' where id = 31237;
update t_knowledge_point set title = $kp$expr 或 let 数值运算工具$kp$, content = $kp$```shell
[root@localhost ~]# aa=11
[root@localhost ~]# bb=22
```

expr 和 let 是 Shell 中的整数运算工具，使用前先给变量赋值。$kp$, section = '' where id = 31239;
update t_knowledge_point set title = $kp$日志记录位置$kp$, content = $kp$日志记录位置可以是：

- 日志文件的绝对路径，如 /var/log/secure
- 系统设备文件，如 /dev/lp0
- 转发给远程主机，如 @192.168.0.210:514
- 用户名，如 root
- 忽略或丢弃日志，如 ~$kp$, section = '' where id = 31240;
update t_knowledge_point set title = $kp$cpio 命令$kp$, content = $kp$cpio 是一个标准工具，用于创建软件档案文件和从档案文件中提取文件，基本用法为 cpio 选项。$kp$, section = '' where id = 31241;
update t_knowledge_point set title = $kp$普通用户执行 sudo 授权的命令$kp$, content = $kp$普通用户通过 sudo 执行管理员授权的命令，需先在 sudoers 文件中配置授权。$kp$, section = '' where id = 31242;
update t_knowledge_point set title = $kp$vi 的替换、搜索与保存退出命令$kp$, content = $kp$替换和取消命令

| 命令 | 作用 |
| --- | --- |
| r | 取代光标所在处字符 |
| R | 从光标所在处开始替换字符，按 Esc 结束 |
| u | 取消上一步操作 |

搜索和搜索替换命令

| 命令 | 作用 |
| --- | --- |
| /string | 搜索指定字符串，搜索时忽略大小写用 :set ic |
| n | 搜索指定字符串的下一个出现位置 |
| :%s/old/new/g | 全文替换指定字符串 |
| :n1,n2s/old/new/g | 在一定范围内替换指定字符串 |

保存和退出命令

| 命令 | 作用 |
| --- | --- |
| :w | 保存修改 |
| :w new_filename | 另存为指定文件 |
| :wq | 保存修改并退出 |
| ZZ | 快捷键，保存修改并退出 |
| :q! | 不保存修改退出 |
| :wq! | 保存修改并退出（文件所有者及 root 可使用） |$kp$, section = '' where id = 31243;
update t_knowledge_point set title = $kp$权限管理命令 chgrp$kp$, content = $kp$命令名称：chgrp
命令英文原意：change file group ownership
命令所在路径：/bin/chgrp
执行权限：所有用户
语法：chgrp [用户组] [文件或目录]
功能描述：改变文件或目录的所属组
范例：chgrp lampbrother fengjie，即把文件 fengjie 的所属组改为 lampbrother$kp$, section = '' where id = 31244;
update t_knowledge_point set title = $kp$权限管理命令 chmod$kp$, content = $kp$命令名称：chmod
命令英文原意：change the permissions mode of a file
命令所在路径：/bin/chmod
执行权限：所有用户
语法：chmod [{ugoa}{+-=}{rwx}] [文件或目录]；chmod [mode=421] [文件或目录]
-R 递归修改
功能描述：改变文件或目录权限$kp$, section = '' where id = 31245;
update t_knowledge_point set title = $kp$权限管理命令 chown$kp$, content = $kp$命令名称：chown
命令英文原意：change file ownership
命令所在路径：/bin/chown
执行权限：所有用户
语法：chown [用户] [文件或目录]
功能描述：改变文件或目录的所有者
范例：chown shenchao fengjie，即把文件 fengjie 的所有者改为 shenchao$kp$, section = '' where id = 31247;
update t_knowledge_point set title = $kp$权限管理命令 umask$kp$, content = $kp$命令名称：umask
命令英文原意：the user file-creation mask
命令所在路径：Shell 内置命令
执行权限：所有用户
语法：umask [-S]
-S 以 rwx 形式显示新建文件缺省权限
功能描述：显示、设置文件的缺省权限
范例：umask -S$kp$, section = '' where id = 31248;
update t_knowledge_point set title = $kp$挂载 U 盘$kp$, content = $kp$```shell
mount -t vfat /dev/sdb1 /mnt/usb/
```

以 vfat 文件系统挂载 U 盘设备 /dev/sdb1 到 /mnt/usb/。注意：Linux 默认不支持 NTFS 文件系统。$kp$, section = '' where id = 31249;
update t_knowledge_point set title = $kp$使用 sudo 执行重启命令$kp$, content = $kp$```shell
[lamp@localhost ~]$ sudo /sbin/shutdown -r now
```

普通用户 lamp 通过 sudo 获得授权，执行关机重启命令。$kp$, section = '' where id = 31250;
update t_knowledge_point set title = $kp$查看可用的进程信号$kp$, content = $kp$| 信号代号 | 信号名称 | 说明 |
| --- | --- | --- |
| 1 | SIGHUP | 让进程立即关闭，然后重新读取配置文件之后重启 |
| 2 | SIGINT | 程序终止信号，用于终止前台进程，相当于按下 Ctrl+C |
| 8 | SIGFPE | 发生致命算术运算错误时发出，包括浮点运算错误、溢出及除数为 0 等 |
| 9 | SIGKILL | 立即结束程序运行，不能被阻塞、处理和忽略，一般用于强制终止进程 |
| 14 | SIGALRM | 时钟定时信号，计算实际时间或时钟时间，alarm 函数使用该信号 |
| 15 | SIGTERM | 正常结束进程的信号，kill 命令的默认信号；进程异常时可能无法终止，此时才尝试信号 9 |
| 18 | SIGCONT | 让暂停的进程恢复执行，不能被阻断 |
| 19 | SIGSTOP | 暂停前台进程，相当于按下 Ctrl+Z，不能被阻断 |

```shell
[root@localhost ~]# kill -1 22354
```$kp$, section = '' where id = 31251;
update t_knowledge_point set title = $kp$复制文件到指定目录$kp$, content = $kp$```shell
cp install.log /boot/
```

将当前目录下的 install.log 复制到 /boot 目录。$kp$, section = '' where id = 31252;
update t_knowledge_point set title = $kp$sed 查看指定行与删除行$kp$, content = $kp$```shell
[root@localhost ~]# sed -n '2p' student.txt
[root@localhost ~]# sed '2,4d' student.txt
```

-n '2p' 只输出第二行；'2,4d' 删除第二至第四行后输出其余内容。$kp$, section = '' where id = 31253;
update t_knowledge_point set title = $kp$查看服务是否启动$kp$, content = $kp$```shell
chkconfig --list | grep rsyslog
```

列出所有服务的自启动状态并筛选 rsyslog。$kp$, section = '' where id = 31254;
update t_knowledge_point set title = $kp$查询已安装的服务$kp$, content = $kp$RPM 包安装的服务：

```shell
chkconfig --list
```$kp$, section = '' where id = 31259;
update t_knowledge_point set title = $kp$查询当前 Linux 系统的发行版本$kp$, content = $kp$```shell
[root@localhost ~]# lsb_release -a
```$kp$, section = '' where id = 31260;
update t_knowledge_point set title = $kp$mount -a 挂载所有设备$kp$, content = $kp$```shell
[root@localhost ~]# mount -a
```

依据 /etc/fstab 挂载所有设备；使用 mount -l 查询已挂载设备时，-l 会显示卷标名称。$kp$, section = '' where id = 31263;
update t_knowledge_point set title = $kp$重命名内核文件作为备份$kp$, content = $kp$```shell
mv /boot/vmlinuz-2.6.32-279.el6.i686 /boot/vmlinuz-2.6.32-279.el6.i686.bak
```

给内核文件改名并加上 .bak 后缀，便于比较备份数据与实际数据的变化。$kp$, section = '' where id = 31264;
update t_knowledge_point set title = $kp$sudoers 授权格式$kp$, content = $kp$sudoers 中的授权格式为：用户名 被管理主机的地址=（可使用的身份） 授权命令（绝对路径）

```shell
%wheel ALL=(ALL) ALL
```

%wheel 表示 wheel 用户组，ALL 表示所有主机、所有身份、所有命令。$kp$, section = '' where id = 31266;
update t_knowledge_point set title = $kp$passwd 设置用户密码$kp$, content = $kp$命令名称：passwd
命令所在路径：/usr/bin/passwd
执行权限：所有用户
语法：passwd 用户名
功能描述：设置用户密码
范例：$ passwd yangmi$kp$, section = '' where id = 31267;
update t_knowledge_point set title = $kp$useradd 添加新用户$kp$, content = $kp$命令名称：useradd
命令所在路径：/usr/sbin/useradd
执行权限：root
语法：useradd 用户名
功能描述：添加新用户
范例：$ useradd yangmi$kp$, section = '' where id = 31268;
update t_knowledge_point set title = $kp$w 查看登录用户详细信息$kp$, content = $kp$命令名称：w
命令所在路径：/usr/bin/w
执行权限：所有用户
语法：w
功能描述：查看登录用户详细信息
范例：$ w$kp$, section = '' where id = 31269;
update t_knowledge_point set title = $kp$cd 切换目录$kp$, content = $kp$命令名称：cd
命令英文原意：change directory
命令所在路径：shell 内置命令
执行权限：所有用户
语法：cd [目录]
功能描述：切换目录
范例：$ cd /tmp/Japan/boduo 切换到指定目录
$ cd .. 回到上一级目录$kp$, section = '' where id = 31271;
update t_knowledge_point set title = $kp$cp 复制文件或目录$kp$, content = $kp$范例：
$ cp -r /tmp/Japan/cangjing /root
将目录 /tmp/Japan/cangjing 复制到 /root 下。
$ cp -rp /tmp/Japan/boduo /tmp/Japan/longze /root
将 /tmp/Japan 下的 boduo 和 longze 两个目录复制到 /root 下，并保持目录属性。$kp$, section = '' where id = 31273;
update t_knowledge_point set title = $kp$ls 显示目录文件$kp$, content = $kp$命令名称：ls
命令英文原意：list
命令所在路径：/bin/ls
执行权限：所有用户
功能描述：显示目录文件
语法：ls 选项 [-ald] [文件或目录]
-a 显示所有文件，包括隐藏文件
-l 详细信息显示
-d 查看目录属性
权限位说明（如 -rw-r--r--）：
第一位表示文件类型：- 普通文件，d 目录，l 软链接文件。
后九位每三位一组，依次为 u 所有者、g 所属组、o 其他人，每组依次为 r 读、w 写、x 执行。$kp$, section = '' where id = 31274;
update t_knowledge_point set title = $kp$mkdir 创建新目录$kp$, content = $kp$命令名称：mkdir
命令英文原意：make directories
命令所在路径：/bin/mkdir
执行权限：所有用户
语法：mkdir -p [目录名]
功能描述：创建新目录
-p 递归创建
范例：$ mkdir -p /tmp/Japan/boduo
$ mkdir /tmp/Japan/longze /tmp/Japan/cangjing$kp$, section = '' where id = 31275;
update t_knowledge_point set title = $kp$mv 剪切文件或改名$kp$, content = $kp$命令名称：mv
命令英文原意：move
命令所在路径：/bin/mv
执行权限：所有用户
语法：mv [原文件或目录] [目标目录]
功能描述：剪切文件、改名$kp$, section = '' where id = 31276;
update t_knowledge_point set title = $kp$pwd 显示当前目录$kp$, content = $kp$命令名称：pwd
命令英文原意：print working directory
命令所在路径：/bin/pwd
执行权限：所有用户
语法：pwd
功能描述：显示当前目录
范例：$ pwd
/tmp/Japan$kp$, section = '' where id = 31277;
update t_knowledge_point set title = $kp$rm 删除文件或目录$kp$, content = $kp$范例：
$ rm /tmp/yum.log
删除文件 /tmp/yum.log。
$ rm -rf /tmp/Japan/longze
递归强制删除目录 /tmp/Japan/longze。$kp$, section = '' where id = 31279;
update t_knowledge_point set title = $kp$确认 rsyslogd 服务已启动$kp$, content = $kp$[root@localhost ~]# ps aux | grep rsyslogd
用 ps aux 结合 grep 查看 rsyslogd 进程是否存在，以确认服务已启动。$kp$, section = '' where id = 31280;
update t_knowledge_point set title = $kp$使用 & 把命令放入后台执行$kp$, content = $kp$& 的作用是把命令放入后台执行，工作管理在系统管理章节详细介绍。
echo "The last one Daemon process is $!"
其中 $! 表示最后一个后台进程的 PID。$kp$, section = '' where id = 31281;
update t_knowledge_point set title = $kp$Linux 文件系统与常用命令问答$kp$, content = $kp$什么是工作目录、当前目录、用户主目录？查看和切换的命令是什么？
pwd 查看工作目录，cd 切换工作目录，cd . 当前目录，cd .. 上级目录；~ 表示用户主目录。

当前目录和上层目录怎么表示？
当前目录用 . 表示，上层目录用 .. 表示。

Abc 和 ABC 是一个目录么？
不是，Linux 严格区分大小写。

文件类型有哪些？怎么判断？（目录是文件么？）
①普通文件：首字符 - 表示该文件是普通文件
②目录文件：首字符 d 表示该文件是目录文件
③设备文件：首字符 c 表示字符设备，b 表示块设备
④符号链接文件：首字符 l 表示该文件是符号链接文件

根据树形图，写出从一个目录到另外一个目录的命令。
圆圈代表目录，方框代表文件，当前目录为 n，用相对路径法和绝对路径法分别写出文件 e 的路径。$kp$, section = '' where id = 31283;
update t_knowledge_point set title = $kp$判断变量 name 是否为空$kp$, content = $kp$[ -z "$name" ] && echo "yes" || echo "no"
-z 判断变量内容是否为空，为空输出 yes，否则输出 no。
本例输出：no$kp$, section = '' where id = 31285;
update t_knowledge_point set title = $kp$声明整型变量并计算和值$kp$, content = $kp$[root@localhost ~]# declare -i cc=$aa+$bb
declare -i 将变量声明为整型，cc 直接得到 aa 与 bb 的数值之和。$kp$, section = '' where id = 31286;
update t_knowledge_point set title = $kp$比较变量 aa 与字符串 bb$kp$, content = $kp$[ "$aa" == "bb" ] && echo "yes" || echo "no"
条件成立输出 yes，否则输出 no。
本例输出：no$kp$, section = '' where id = 31288;
update t_knowledge_point set title = $kp$变量未设置时取默认值$kp$, content = $kp$[root@localhost ~]# x=${y-new}
${y-new} 表示 y 未设置时取默认值 new；y 已设置（即使为空）时取 y 的值。$kp$, section = '' where id = 31289;
update t_knowledge_point set title = $kp$sed 打印指定行$kp$, content = $kp$[root@localhost ~]# sed '2p' student.txt
2p 表示打印第 2 行；不加 -n 时，sed 仍会输出全部行。$kp$, section = '' where id = 31290;
update t_knowledge_point set title = $kp$chkconfig 添加服务$kp$, content = $kp$[root@localhost ~]# chkconfig --add apache
将 apache 服务加入 chkconfig 管理列表。$kp$, section = '' where id = 31291;
update t_knowledge_point set title = $kp$还原 /etc 目录的备份$kp$, content = $kp$restore -r -f etc.dump.bz2
-r 递归还原整个目录，-f 指定备份文件名，用于还原 /etc 目录的备份 etc.dump.bz2。$kp$, section = '' where id = 31292;
update t_knowledge_point set title = $kp$还原 etc.dump.bz2 备份$kp$, content = $kp$使用 restore 命令还原 etc.dump.bz2 备份文件，-r 递归还原整个目录，-f 指定备份文件名。$kp$, section = '' where id = 31293;
update t_knowledge_point set title = $kp$后台查找 hello.sh 脚本$kp$, content = $kp$find /root -name hello.sh &
在 /root 下按名称查找 hello.sh，末尾的 & 使该查找命令在后台执行。$kp$, section = '' where id = 31294;
update t_knowledge_point set title = $kp$crontab 时间格式与特殊符号$kp$, content = $kp$进入 crontab 编辑界面后会打开 vim 编辑当前用户的工作。格式为：
* * * * * 执行的任务

| 项目 | 含义 | 范围 |
| --- | --- | --- |
| 第一个 * | 一小时当中的第几分钟 | 0-59 |
| 第二个 * | 一天当中的第几小时 | 0-23 |
| 第三个 * | 一个月当中的第几天 | 1-31 |
| 第四个 * | 一年当中的第几月 | 1-12 |
| 第五个 * | 一周当中的星期几 | 0-7（0 和 7 都代表星期日） |

| 特殊符号 | 含义 |
| --- | --- |
| * | 代表任何时间。比如第一个 * 就代表一小时中每分钟都执行一次。 |
| , | 代表不连续的时间。比如 0 8,12,16 * * * 命令，代表每天的 8 点 0 分、12 点 0 分、16 点 0 分都执行一次命令。 |
| - | 代表连续的时间范围。比如 0 5 * * 1-6 命令，代表周一到周六的凌晨 5 点 0 分执行命令。 |
| */n | 代表每隔多久执行一次。比如 */10 * * * * 命令，代表每隔 10 分钟执行一遍命令。 |

| 时间 | 含义 |
| --- | --- |
| 45 22 * * * 命令 | 在 22 点 45 分执行命令 |
| 0 17 * * 1 命令 | 每周 1 的 17 点 0 分执行命令 |
| 0 5 1,15 * * 命令 | 每月 1 号和 15 号的凌晨 5 点 0 分执行命令 |
| 40 4 * * 1-5 命令 | 每周一到周五的凌晨 4 点 40 分执行命令 |
| */10 4 * * * 命令 | 每天的凌晨 4 点，每隔 10 分钟执行一次命令 |
| 0 0 1,15 * 1 命令 | 每月 1 号和 15 号、每周 1 的 0 点 0 分都会执行命令。注意：星期几和几号最好不要同时出现，因为它们定义的都是天，非常容易让管理员混乱。 |$kp$, section = '' where id = 31296;
update t_knowledge_point set title = $kp$sed 常用选项$kp$, content = $kp$-n：一般 sed 命令会把所有数据都输出到屏幕，加入此选项后只把经过 sed 处理的行输出到屏幕。
-e：允许对输入数据应用多条 sed 命令编辑。
-i：用 sed 的修改结果直接修改读取数据的文件，而不是由屏幕输出。$kp$, section = '' where id = 31297;
update t_knowledge_point set title = $kp$逻辑与运算规则$kp$, content = $kp$逻辑与运算只有参与与运算的两边都是 1，结果才是 1，否则结果为 0。$kp$, section = '' where id = 31298;
update t_knowledge_point set title = $kp$重新挂载 /home 分区并设置 exec 权限$kp$, content = $kp$[root@localhost sh]# cd /home
[root@localhost boot]# vi hello.sh
[root@localhost boot]# chmod 755 hello.sh
[root@localhost boot]# ./hello.sh
[root@localhost boot]# mount -o remount,exec /home
提示：记得改回来，否则会影响系统启动。$kp$, section = '' where id = 31299;
update t_knowledge_point set title = $kp$sudo 临时获取 root 权限$kp$, content = $kp$sudo 是为所有想使用 root 权限的普通用户设计的，可以让普通用户具有临时使用 root 权限的权利，只需输入自己账户的密码即可，需要配置相关文件。
[zhangzhihu@192 etc]$ sudo -i$kp$, section = '' where id = 31535;
update t_knowledge_point set title = $kp$vi 编辑器的三种模式$kp$, content = $kp$（1）命令模式（command mode）：控制屏幕光标的移动，字符、字或行的删除，查找，移动复制某区段，以及进入插入模式或底行模式。
命令行模式下的常用命令：
【1】控制光标移动：↑、↓、←、→、j（下一行）
【2】删除当前行：dd
【3】查找：/字符
【4】进入编辑模式：i、o、a、Insert 键
【5】进入底行模式：:（shift + ;）

（2）插入模式（Insert mode）：只有在插入模式下才可以做文字输入，按 ESC 键可回到命令行模式。
编辑模式下常用命令：
【1】ESC 退出编辑模式回到命令行模式

（3）底行模式（last line mode）：将文件保存或退出 vi，也可以设置编辑环境，如寻找字符串、列出行号等。
底行模式下常用命令：
【1】退出编辑：:q
【2】强制退出：:q!
【3】保存并退出：:wq$kp$, section = '' where id = 31536;
update t_knowledge_point set title = $kp$vi 打开文件与 vim 的特点$kp$, content = $kp$命令：vi 文件名
示例：打开当前目录下的 a.c 文件，可用 vi a.c 或 vim a.c。
注意：使用 vi 编辑器打开文件后并不能直接编辑，因为此时处于命令模式，需按 i/a/o/Insert 进入编辑模式。

vim 相对 vi 的特点：
（1）多级撤消：vi 中按 u 只能撤消上次命令，vim 中可以无限制地撤消。
（2）易用性：vi 只能运行于 unix，vim 还可用于 windows、mac 等多操作平台。
（3）语法加亮：vim 可以用不同的颜色加亮代码。
（4）可视化操作：vim 不仅可以在终端运行，也可以运行于 windows、mac os。
（5）对 vi 完全兼容：可以把 vim 当成 vi 来使用。$kp$, section = '' where id = 31537;
update t_knowledge_point set title = $kp$cat 查看文件内容$kp$, content = $kp$示例：使用 cat 查看 /etc/sudo.conf 文件，只能显示最后一屏内容。
cat sudo.conf$kp$, section = '' where id = 31539;
update t_knowledge_point set title = $kp$less 翻页查看文件$kp$, content = $kp$示例：使用 less 查看 /etc/sudo.conf 文件，可用键盘上的 PgUp 和 PgDn 向上、向下翻页，按 q 结束查看。
less sudo.conf$kp$, section = '' where id = 31540;
update t_knowledge_point set title = $kp$tail 查看文件末尾指定行$kp$, content = $kp$示例：使用 tail -10 查看 /etc/sudo.conf 文件的后 10 行，按 Ctrl+C 结束。
tail -10 sudo.conf$kp$, section = '' where id = 31541;
update t_knowledge_point set title = $kp$tar 打包与压缩$kp$, content = $kp$Windows 压缩文件的扩展名：.zip、.rar
Linux 中的打包文件：aa.tar
Linux 中的压缩文件：bb.gz
Linux 中打包并压缩的文件：.tar.gz
Linux 的打包文件一般以 .tar 结尾，压缩命令一般以 .gz 结尾；一般情况下打包和压缩一起进行，后缀名一般为 .tar.gz。

命令：tar -zcvf 打包压缩后的文件名 要打包的文件
其中：z 调用 gzip 压缩命令进行压缩；c 打包文件；v 显示运行过程；f 指定文件名。

示例：打包并压缩当前目录下的所有文件，压缩包指定名称为 a.tar
tar -zcvf a.tar a.c a.h
或：tar -zcvf a.tar *

执行结果示例：
[root@192 myfiles]# ll
-rwxr-xr-x  1 root root 137 Apr 24 19:52 a.c
-rw-r--r--  1 root root   0 Apr 24 22:32 a.h
[root@192 myfiles]# tar -zcvf a.tar a.c a.h
a.c
a.h
[root@192 myfiles]# ll
-rwxr-xr-x  1 root root 137 Apr 24 19:52 a.c
-rw-r--r--  1 root root   0 Apr 24 22:32 a.h
-rw-r--r--  1 root root 258 Apr 24 22:35 a.tar$kp$, section = '' where id = 31542;
update t_knowledge_point set title = $kp$文件类型与权限位$kp$, content = $kp$"-"：普通文件
"d"：目录，directory 的缩写
"l"：link 的缩写，链接文件（2 种：软链接和硬链接）
"b"：块设备文件（block），如硬盘、光盘等
"c"：字符设备文件（character），如键盘、字符终端等
"p"：命名管道文件，与 shell 编程有关（通信方式）
"s"：socket 文件，与 shell 编程有关（通信方式）

其他位表示文件或目录的权限：
r 表示读（Read）、w 表示写（Write）、x 表示执行（eXecute）。
前三个：文件拥有者的权限；
中间三个：文件所属组拥有的权限；
最后三个：其他用户拥有的权限。$kp$, section = '' where id = 31543;
update t_knowledge_point set title = $kp$man 查看命令手册$kp$, content = $kp$man shutdown
注意：man shutdown 打开命令说明书之后，使用按键 q 退出。
手册页末尾提示：Manual page shutdown(8) line 1 (press h for help or q to quit)。
手册中列出的选项包括：--help 显示简短帮助并退出；-H, --halt 关机；-P, --poweroff 断电关机（默认）。$kp$, section = '' where id = 31596;
update t_knowledge_point set title = $kp$more 分页查看文件$kp$, content = $kp$示例：使用 more 查看 /etc/sudo.conf 文件，可以显示百分比，回车向下一行，空格向下一页，q 退出查看。
more sudo.conf$kp$, section = '' where id = 31597;
update t_knowledge_point set title = $kp$chmod 修改文件权限$kp$, content = $kp$权限字母法：
chmod +x a.c
[root@192 myfiles]# chmod +x a.c
[root@192 myfiles]# ls -l
-rwxr-xr-x  1 root root 137 Apr 24 19:52 a.c

8421 法：
chmod 755 a.c
[root@192 myfiles]# chmod 755 a.c
[root@192 myfiles]# ls -l
-rwxr-xr-x  1 root root 137 Apr 24 19:52 a.c$kp$, section = '' where id = 31598;
update t_knowledge_point set title = $kp$tar 解压$kp$, content = $kp$命令：tar -xvf 压缩文件
其中 x 代表解压。

示例：将当前目录下的 a.tar 解压到当前目录下
tar -xvf a.tar

示例：将当前目录下的 a.tar 解压到上一级目录下的 myfiles1 中，-C 代表指定解压的位置
tar -xvf a.tar -C ../myfiles1$kp$, section = '' where id = 31599;
update t_knowledge_point set title = $kp$逻辑位运算$kp$, content = $kp$与运算：1 & 2 = 0，即 00000001 & 00000010 = 00000000 = 0
或运算：1 | 2 = 3，即 00000001 | 00000010 = 00000011 = 3
按位求反（~）运算、异或（^）运算略。
移位运算（<< 左移，>> 右移）略。$kp$, section = '' where id = 31610;
update t_knowledge_point set title = $kp$su 用户切换$kp$, content = $kp$su 用于用户之间的切换，但切换前的用户依然保持登录状态。root 向普通用户或虚拟用户切换不需要密码，反之普通用户切换到其他任何用户都需要密码验证。
su 的不足：如果某个用户需要使用 root 权限，就必须把 root 密码告诉此用户。
退出返回之前的用户：exit
su test：切换到 test 用户，但路径还是 /root 目录
su - test：切换到 test 用户，路径变为 /home/test
su：切换到 root 用户，但路径还是原来的路径
su -：切换到 root 用户，并且路径是 /root$kp$, section = '' where id = 31646;
update t_knowledge_point set title = $kp$保存文件$kp$, content = $kp$第一步：按 Esc 进入命令行模式。

第二步：输入 :（Shift + ;）进入底行模式。

第三步：输入 wq 保存并退出编辑。$kp$, section = '' where id = 31647;
update t_knowledge_point set title = $kp$取消编辑$kp$, content = $kp$第一步：按 Esc 进入命令行模式。

第二步：输入 :（Shift + ;）进入底行模式。

第三步：输入 q! 放弃本次修改并退出编辑。$kp$, section = '' where id = 31648;
update t_knowledge_point set title = $kp$删除文件$kp$, content = $kp$rm 文件名：删除当前目录下的文件。

rm -f 文件名：删除当前目录下的文件，不再询问确认。

示例：

```
[root@192 myfiles]# ls
myCpro.c
[root@192 myfiles]# rm -f myCpro.c
[root@192 myfiles]# ls
[root@192 myfiles]#
```$kp$, section = '' where id = 31650;
update t_knowledge_point set title = $kp$传统的集合运算：并、差、交$kp$, content = $kp$传统的集合运算包括并、差、交。参与运算的两个关系必须具有相同的关系模式，即属性个数相同、对应属性取自同一域。

集合 R 与集合 S 如图 6-3 所示：

| 学号 | 姓名 |
| --- | --- |
| 1001 | 宋俊平 |
| 1002 | 张明辉 |
| 1003 | 王程程 |
| 1004 | 刘敏 |
| 1005 | 李文杰 |

| 学号 | 姓名 |
| --- | --- |
| 1004 | 刘敏 |
| 1005 | 李文杰 |
| 1006 | 胡晓明 |
| 1007 | 刘荣 |

① 并（R∪S）：R 后接 S，去掉重复的元组，结果为 1001～1007 共 7 个元组。

② 交（R∩S）：取 R 和 S 中相同的元组，结果为 1004 刘敏、1005 李文杰。

③ 差（R−S）：取属于 R 但不属于 S 的元组，结果为 1001 宋俊平、1002 张明辉、1003 王程程。$kp$, section = '' where id = 31664;
update t_knowledge_point set title = $kp$PowerPoint 可保存的文件类型$kp$, content = $kp$PowerPoint 文件可保存为 pptx、potx（模板文件）、pps、ppsx（放映文件）、网页文件等类型。$kp$, section = '' where id = 31722;
update t_knowledge_point set title = $kp$目录$kp$, content = $kp$目录是文件存储的一种组织结构，相当于 Windows 中的文件夹。目录中可以包含若干目录文件。$kp$, section = '' where id = 31845;
update t_knowledge_point set title = $kp$插入模式$kp$, content = $kp$插入模式（Insert mode）：只有在插入模式下才能进行文字输入，按 Esc 键可回到命令行模式。常用操作：按 Esc 退出编辑模式，回到命令行模式。$kp$, section = '' where id = 31846;
update t_knowledge_point set title = $kp$cd 命令与 Linux 常用目录$kp$, content = $kp$cd 命令用于切换目录：

| 命令 | 说明 |
| --- | --- |
| cd / | 切换到根目录 |
| cd /usr | 切换到根目录下的 usr 目录 |
| cd ../ 或 cd .. | 切换到上一级目录 |
| cd ~ | 切换到当前用户的主目录 |
| cd - | 切换到上次访问的目录 |

常用的目录：

| 目录 | 说明 |
| --- | --- |
| / | 根目录，最高一级目录，包含整个 Linux 系统的所有目录和文件 |
| /bin | bin 是 Binary（二进制）的缩写，存放最经常使用的命令 |
| /boot | 存放启动 Linux 时使用的一些核心文件，如系统内核、引导配置文件 |
| /dev | dev 是 Device（设备）的缩写，存放 Linux 的外部设备文件 |
| /etc | 存放系统管理所需要的配置文件和子目录 |
| /home | 用户的主目录，如使用 xisai 账户登录时，默认进入 /home/xisai |
| /root | 系统管理员（超级权限者）root 账户的主目录，root 登录时默认以 /root 为工作目录 |
| /lib | 存放系统最基本的动态链接共享库，作用类似 Windows 的 DLL 文件，不能随意删除 |
| /mnt | 临时挂载其他文件系统的目录 |
| /opt | 给主机额外安装软件所放置的目录，如安装 Oracle 数据库 |
| /sbin | s 是 Super User 的意思，存放系统管理员使用的系统管理程序 |
| /sys | 文件系统 sysfs 的挂载目录 |
| /tmp | 存放临时文件 |
| /var | 存放经常被修改的目录和文件，包括各种日志文件 |
| /proc | 虚拟文件目录，数据都在内存中，如系统核心、外部设备、网络状态，不占用磁盘空间 |
| /lost+found | 系统意外崩溃或机器意外关机时，产生的文件碎片存放在这里 |$kp$, section = '' where id = 31890;
update t_knowledge_point set title = $kp$实例：斐波那契数列与阶乘$kp$, content = $kp$示例程序声明了斐波那契数列函数 long fabonacci_1(int num1) 和阶乘函数 long factorial_1(int num2)，main 函数中定义 num = 10、i = 1，随后用 for 循环处理（后续代码缺失）。$kp$, section = '' where id = 31902;
update t_knowledge_point set title = $kp$并运算$kp$, content = $kp$并操作记为 R∪S，其元素由关系 R 的元素加上关系 S 的元素组成，重复的元组只保留一个。$kp$, section = '' where id = 31939;
update t_knowledge_point set title = $kp$交运算$kp$, content = $kp$交操作记为 R∩S，其元素由关系 R 和关系 S 的相同元素组成。交运算可以用差运算表示：R∩S = R − (R − S) = S − (S − R)。$kp$, section = '' where id = 31940;
update t_knowledge_point set title = $kp$实例：斐波那契数列与阶乘$kp$, content = $kp$示例程序声明了斐波那契数列函数 long fabonacci_1(int num1) 和阶乘函数 long factorial_1(int num2)，main 函数中定义 num = 10、i = 1，随后用 for 循环处理（后续代码缺失）。$kp$, section = '' where id = 32062;
update t_knowledge_point set title = $kp$C 程序的编译链接与标识符$kp$, content = $kp$每个 C 语言程序写完后，都是先编译、后链接、最后运行（.c → .obj → .exe）。其中 .c 和 .obj 文件无法运行，只有 .exe 文件才可以运行。

标识符：合法的标识符由字母、数字、下划线组成，且第一个字符必须是字母或下划线；以数字开头或含其他字符均不合法。$kp$, section = '' where id = 32594;
update t_knowledge_point set title = $kp$cat 命令的三个作用$kp$, content = $kp$cat 命令有三个作用：查看文件内容；创建新文件；合并文件。$kp$, section = '' where id = 32602;
update t_knowledge_point set title = $kp$ls、cd、pwd、mkdir、rmdir 命令$kp$, content = $kp$ls：列出目录内容。
- ls：显示当前目录下不被隐藏的所有文件与文件夹。
- ls -a：显示当前目录下的所有文件和文件夹，包括隐藏文件。
- ls -l：以列表形式显示不被隐藏的文件和文件夹的详细信息。
- ls -al：以列表形式显示所有文件和文件夹（含隐藏文件）的详细信息。

cd：切换目录。
- cd ~：切换到用户当前目录。
- cd /：切换到根目录。
- cd -：切换到上一次访问的目录。
- cd ..：切换到上一级目录。

pwd：显示当前工作目录。

mkdir：创建目录。

rmdir：删除空目录。$kp$, section = '' where id = 32603;
update t_knowledge_point set title = $kp$文件管理命令 cat、cp、mv、rm、find$kp$, content = $kp$cat：显示文本文件内容。

cp：复制文件或目录，cp -r [源文件或目录] [目标文件或目录]。

mv：移动或重命名现有的文件或目录，mv [源文件或目录] [目标文件或目录]。

rm：删除文件或目录，rm -rf [文件或目录]。

find：查找文件或目录，find /root/ -name 'test'。$kp$, section = '' where id = 32604;
update t_knowledge_point set title = $kp$grep 命令$kp$, content = $kp$grep -i control /root/install.log：查看 install.log 文件中是否含有 control 字符的内容，-i 表示忽略大小写。$kp$, section = '' where id = 32605;
update t_knowledge_point set title = $kp$ps 命令$kp$, content = $kp$ps 命令提供对进程的一次性查看，例如 ps -ef | grep -i ping。$kp$, section = '' where id = 32606;
update t_knowledge_point set title = $kp$tar 备份压缩$kp$, content = $kp$压缩：tar -zcvf aaa.tar ./aaa/

解压：tar -zxvf aaa.tar -C [目标位置]$kp$, section = '' where id = 32607;
update t_knowledge_point set title = $kp$chmod 与常用命令、rpm/yum 包管理$kp$, content = $kp$文件权限 chmod 命令：chmod 777 xxx

常用命令：
- ls：列出当前工作目录的内容。
- pwd：显示当前工作目录。
- cd：切换目录。
- rm：删除一个或多个文件。
- rmdir：删除空目录。
- mkdir：创建目录。
- ps：列出当前正在运行的进程。
- cp：复制文件。
- mv：移动文件，也用于重命名文件。
- grep：全局正则表达式打印程序，可在文件或另一程序的输出中搜索。
- find：在文件系统中查找文件，结果准确但速度较慢。
- locate：从缓存列表中查找文件，速度快但不完全准确。
- man：显示大多数命令的手册。
- clear：清屏。
- less：查看文件内容。
- nano：文本编辑器。
- sudo：以超级用户身份执行命令。
- su：切换用户，默认切换到 root。
- view：以只读模式打开文件，避免误写，也可用 -R 参数实现。

rpm -q xxx：列出 xxx 的安装信息。
rpm -qa | grep xxx：列出所有包含 xxx 字段的软件信息。前者完全匹配软件名，后者不完全匹配软件名。

yum -y install 包名（支持 *）：自动选择 y，全自动安装。
yum install 包名（支持 *）：手动选择 y 或 n。
yum remove 包名（不支持 *）：卸载软件包。

rpm -ivh 包名（支持 *）：安装 rpm 包。
rpm -e 包名（不支持 *）：卸载 rpm 包。

yum remove 会检查依赖，如果要移除的包被其他软件包需要，会连同其他软件包一起移除；rpm -e 则会直接提示该包被其他包需要，无法移除。

rpm 是由红帽公司开发的软件包管理方式，使用 rpm 可以方便地进行软件的安装、查询、卸载、升级等工作，但 rpm 软件包之间的依赖性问题往往很繁琐，尤其是软件由多个 rpm 包组成时。

yum（全称为 Yellow dog Updater, Modified）是 Fedora、RedHat 以及 SUSE 中的 Shell 前端软件包管理器，基于 RPM 包管理，能够从指定的服务器自动下载 RPM 包并且安装，可以自动处理依赖关系，一次安装所有依赖的软件包，无须一次次下载、安装。

简而言之，rpm 只能安装已经下载到本地机器上的 rpm 包；yum 能在线下载并安装 rpm 包、更新系统，还能自动处理包与包之间的依赖问题，这是 rpm 工具所不具备的。$kp$, section = '' where id = 32608;
update t_knowledge_point set title = $kp$TRUNCATE 语句$kp$, content = $kp$TRUNCATE 用于删除表中的全部记录。注意该语句不属于 DML，而属于 DDL。

语法：TRUNCATE TABLE 表名；

实例：TRUNCATE TABLE tb1;$kp$, section = '' where id = 32615;
update t_knowledge_point set title = $kp$Shell$kp$, content = $kp$Shell 是系统的用户界面，提供了用户与内核进行交互操作的一种接口，接收用户输入的命令并送入内核中执行。$kp$, section = '' where id = 32618;
update t_knowledge_point set title = $kp$相对路径$kp$, content = $kp$相对路径的写法不是由根目录“/”写起。例如用户首先进入 /，然后再进入 home，命令为 cd /home，接着执行 cd test，此时用户所在的路径为 /home/test。第二个 cd 命令后跟 test，没有斜杠，这个 test 是相对于 /home 目录来讲的，所以叫做相对路径。$kp$, section = '' where id = 32624;
update t_knowledge_point set title = $kp$vi 与 vim 的适用平台$kp$, content = $kp$vi 编辑器只能运行于 Unix 中，而 vim 不仅可以运行于 Unix，还可用于 Windows、macOS 等多种操作平台。$kp$, section = '' where id = 32626;
update t_knowledge_point set title = $kp$vim 的可视化操作$kp$, content = $kp$vim 不仅可以在终端中运行，也可以运行于 Windows、macOS 等平台。$kp$, section = '' where id = 32627;
update t_knowledge_point set title = $kp$底行模式与打开文件$kp$, content = $kp$底行模式（last line mode）：用于保存或退出 vi，也可以设置编辑环境，如查找字符串、列出行号等。

底行模式常用命令：
【1】:q 退出编辑
【2】:q! 强制退出
【3】:wq 保存并退出

文件操作——打开文件

命令：vi 文件名

示例：打开当前目录下的 a.c 文件，vi a.c 或者 vim a.c。

注意：使用 vi 编辑器打开文件后并不能编辑，因为此时处于命令模式，按 i、a、o 或 Insert 键进入编辑模式。$kp$, section = '' where id = 32651;
update t_knowledge_point set title = $kp$CPU 性能指标 MIPS 与 MFLOPS$kp$, content = $kp$度量 CPU 性能实用的指标有 MIPS（百万条定点指令/秒）和 MFLOPS（百万条浮点指令/秒）。$kp$, section = '' where id = 32656;
update t_knowledge_point set title = $kp$文件与目录操作命令$kp$, content = $kp$新建目录：mkdir 目录名（如 mkdir a1）。

递归创建目录：mkdir -p /home/x3/x4（在 /home 下递归创建 x3、x4）。

创建空文件：touch 文件名（如 touch touch.txt）。

复制文件：cp（详细写法见书 P31—32）。

文件改名：mv aa.txt bb.txt。

移动文件：mv（详细写法见书 P32）。

合并文件：cat（详细写法见书 P28）。

删除文件：rm 文件名。

递归删除目录：rm -R /home/a3/a4（在 /home 下递归删除 a3、a4）。$kp$, section = '' where id = 32657;
update t_knowledge_point set title = $kp$用户与用户组管理命令$kp$, content = $kp$新建用户：useradd 用户名（如 useradd bobby）。

设置密码：passwd（详细写法见书 P51）。

新建用户组：groupadd 组名（如 groupadd bobby）。

将用户加入用户组：gpasswd -a user1 testgroup（详细写法见书 P55）。$kp$, section = '' where id = 32658;
update t_knowledge_point set title = $kp$修改文件权限$kp$, content = $kp$修改文件权限使用 chmod 命令。例如把 a1 文件的权限设置为 662：chmod 662 a1。$kp$, section = '' where id = 32659;
update t_knowledge_point set title = $kp$其他常用系统命令$kp$, content = $kp$查看本机内存情况：free

查看系统当前的日期和时间：date

查看当前系统的进程：ps -aux

清除屏幕内容：clear

指定时间重启系统：shutdown -r hh:mm（hh 表示小时，mm 表示分钟）

停止系统并关闭电源：poweroff

关闭防火墙：systemctl stop firewalld

重新启动某一项服务（如 DHCP 服务）：systemctl restart dhcpd

修改系统时间（如改为 2016 年 10 月 2 日）：date -s "2016-10-02"

查看本机的系统信息：uname -a

显示日历：cal

中断全部进程：killall

关闭防火墙服务：service iptables stop

启动 Samba 服务：systemctl start smb$kp$, section = '' where id = 32661;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30274,30275,30276,30277,30279,30302,30303,30304,30305,30306,30307,30308,30311,30313,30315,30317,30319,30321,30322,30323,30325,30326,30327,30328,30330,30332,30338,30362,30378,30380,30383,30386,30391,30392,30393,30394,30395,30396,30399,30400,30408,30409,30410,30412,30413,30414,30415,30441,30530,30614,30640,30641,30642,30643,30644,30650,30651,30653,30654,30655,30670,30671,30672,30729,30732,30734,30742,30837,30838,30841,30843,30845,30850,30852,30960,30973,31034,31035,31047,31053,31054,31055,31056,31057,31058,31059,31060,31061,31062,31063,31064,31066,31067,31068,31069,31073,31074,31075,31076,31077,31079,31080,31082,31085,31086,31087,31088,31089,31090,31091,31092,31094,31095,31096,31097,31098,31099,31102,31103,31105,31106,31107,31108,31109,31112,31113,31114,31116,31117,31118,31119,31120,31123,31124,31125,31127,31130,31132,31133,31134,31135,31136,31137,31138,31139,31140,31141,31142,31143,31144,31145,31146,31147,31148,31149,31150,31151,31152,31153,31154,31155,31156,31157,31158,31159,31160,31161,31164,31165,31166,31167,31168,31171,31172,31173,31174,31176,31177,31178,31179,31181,31182,31183,31184,31185,31186,31187,31188,31190,31191,31192,31193,31194,31195,31200,31202,31204,31205,31206,31208,31209,31213,31215,31216,31217,31218,31219,31221,31222,31223,31224,31225,31226,31227,31228,31232,31234,31235,31236,31237,31239,31240,31241,31242,31243,31244,31245,31247,31248,31249,31250,31251,31252,31253,31254,31259,31260,31263,31264,31266,31267,31268,31269,31271,31273,31274,31275,31276,31277,31279,31280,31281,31283,31285,31286,31288,31289,31290,31291,31292,31293,31294,31296,31297,31298,31299,31535,31536,31537,31539,31540,31541,31542,31543,31596,31597,31598,31599,31610,31646,31647,31648,31650,31664,31722,31845,31846,31890,31902,31939,31940,32062,32594,32602,32603,32604,32605,32606,32607,32608,32615,32618,32624,32626,32627,32651,32656,32657,32658,32659,32661) and not deleted) <> 311 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
