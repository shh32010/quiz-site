-- 知识点 337 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_337
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_337 as
select * from t_knowledge_point where id in (30278,30318,30331,30334,30335,30337,30369,30411,30731,30851,30853,30939,30990,31017,31043,31083,31084,31131,31163,31180,31189,31238,31255,31257,31258,31261,31262,31565,31578,31734,31892,32460,32634,32635,32636,32637,32646,32653,32660,32662);

update t_knowledge_point set title = $kp$configure 软件配置与检查$kp$, content = $kp$源码包安装前先执行 ./configure 完成配置与检查，主要做三件事：

- 定义需要的功能选项；
- 检测系统环境是否符合安装要求；
- 把定义好的功能选项和检测到的系统环境信息写入 Makefile 文件，供后续编译使用。

之后的编译与安装步骤：

- make：编译
- make clean：清除编译产生的临时文件
- make install：编译安装$kp$, section = '' where id = 30278;
update t_knowledge_point set title = $kp$二进制包的缺点$kp$, content = $kp$二进制包的缺点：

- 经过编译，不再可以看到源代码；
- 功能选择不如源码包灵活；
- 存在依赖性。$kp$, section = '' where id = 30318;
update t_knowledge_point set title = $kp$源码包的缺点$kp$, content = $kp$源码包的缺点：

- 安装过程步骤较多，尤其安装较大的软件集合时（如 LAMP 环境搭建），容易出现拼写错误；
- 编译过程时间较长，安装比二进制包安装时间长；
- 因为是编译安装，安装过程中一旦报错，新手很难解决。$kp$, section = '' where id = 30331;
update t_knowledge_point set title = $kp$make install 编译安装$kp$, content = $kp$编译安装，执行 make install 完成安装：

[root@localhost ntfs-3g_ntfsprogs-2013.1.13]# make install$kp$, section = '' where id = 30334;
update t_knowledge_point set title = $kp$make 编译$kp$, content = $kp$执行 make 编译源码。若 ./configure 时没有指定安装目录，软件将安装到默认位置。

[root@localhost ntfs-3g_ntfsprogs-2013.1.13]# make$kp$, section = '' where id = 30335;
update t_knowledge_point set title = $kp$进入解压目录执行 configure$kp$, content = $kp$进入解压后的源码目录，执行 ./configure 进行配置检查：

[root@localhost ntfs-3g_ntfsprogs-2013.1.13]# ./configure$kp$, section = '' where id = 30337;
update t_knowledge_point set title = $kp$支撑互联网的开源技术 LAMP$kp$, content = $kp$LAMP 是支撑互联网的经典开源技术组合：

- Linux：操作系统
- Apache：Web 服务器
- MySQL：数据库
- PHP：编程语言$kp$, section = '' where id = 30369;
update t_knowledge_point set title = $kp$二进制包的优点$kp$, content = $kp$二进制包的优点：

- 包管理系统简单，只通过几个命令就可以实现包的安装、升级、查询和卸载；
- 安装速度比源码包安装快得多。$kp$, section = '' where id = 30411;
update t_knowledge_point set title = $kp$安装服务需要备份的数据$kp$, content = $kp$安装服务需要备份的数据：

apache 需要备份的数据：

- 配置文件
- 网页主目录
- 日志文件

mysql 需要备份的数据：

- 源码包安装的 mysql：/usr/local/mysql/data/
- RPM 包安装的 mysql：/var/lib/mysql/$kp$, section = '' where id = 30731;
update t_knowledge_point set title = $kp$服务管理总结$kp$, content = $kp$Linux 服务分为 RPM 包默认安装的服务和源码包安装的服务，前者又分为独立的服务和基于 xinetd 的服务。

独立服务的启动：

- 使用 /etc/init.d/ 目录中的脚本启动，如 /etc/init.d/httpd start|stop|restart
- 使用 service 命令启动，如 service httpd start|stop|restart

独立服务的自启动：

- 使用 chkconfig 命令管理，如 chkconfig --level 2345 httpd on|off
- 修改 /etc/rc.d/rc.local 文件，如 vi /etc/rc.d/rc.local，加入 /etc/init.d/httpd start
- 使用 ntsysv 命令管理

基于 xinetd 服务的启动：

- 修改 /etc/xinetd.d/ 下的配置文件，如 vi /etc/xinetd.d/telnet，把 disable=yes 改为 disable=no，然后重启 xinetd 服务：service xinetd restart

基于 xinetd 服务的自启动：

- 使用 chkconfig 命令管理，如 chkconfig telnet on|off
- 使用 ntsysv 命令管理

源码包安装的服务：同样分为启动与自启动，通常使用安装目录中的启动脚本，并把启动命令写入 /etc/rc.d/rc.local 实现自启动。$kp$, section = '' where id = 30851;
update t_knowledge_point set title = $kp$RPM 包名各字段的含义$kp$, content = $kp$RPM 包文件名中各字段的含义：

- 15：软件发布的次数（release 号）
- el6.centos：适合的 Linux 平台
- i686：适合的硬件平台
- rpm：RPM 包扩展名$kp$, section = '' where id = 30853;
update t_knowledge_point set title = $kp$yum 安装软件$kp$, content = $kp$安装软件包：

[root@localhost yum.repos.d]# yum -y install 包名

选项：

- install：安装
- -y：自动回答 yes$kp$, section = '' where id = 30939;
update t_knowledge_point set title = $kp$yum 升级软件$kp$, content = $kp$升级软件包：

[root@localhost yum.repos.d]# yum -y update 包名

选项：

- update：升级
- -y：自动回答 yes$kp$, section = '' where id = 30990;
update t_knowledge_point set title = $kp$yum 卸载软件$kp$, content = $kp$卸载软件包：

[root@localhost yum.repos.d]# yum -y remove 包名

选项：

- remove：卸载
- -y：自动回答 yes$kp$, section = '' where id = 31017;
update t_knowledge_point set title = $kp$源码包安装过程$kp$, content = $kp$源码包安装的一般过程：解压源码包 → 进入解压目录 → 执行 ./configure 配置检查 → make 编译 → make install 安装。$kp$, section = '' where id = 31043;
update t_knowledge_point set title = $kp$rpm 查询文件所属的软件包$kp$, content = $kp$rpm -qf 文件名称：查询指定文件属于哪个 RPM 包。

可以综合多个参数一起使用，例如 rpm -qil 包名，同时列出该包的信息和文件列表。

列出所有被安装的 rpm 包：

# rpm -qa$kp$, section = '' where id = 31083;
update t_knowledge_point set title = $kp$RPM 包与源码包安装位置的区别$kp$, content = $kp$RPM 安装服务和源码包安装服务的区别就是安装位置的不同：

- 源码包安装在指定位置，一般是 /usr/local/
- RPM 包安装在默认位置中$kp$, section = '' where id = 31084;
update t_knowledge_point set title = $kp$yum 安装指定软件组$kp$, content = $kp$安装指定的软件组，组名可以由 yum grouplist 查询出来：

[root@localhost ~]# yum groupinstall 软件组名$kp$, section = '' where id = 31131;
update t_knowledge_point set title = $kp$yum 卸载指定软件组$kp$, content = $kp$卸载指定软件组，组名可以由 yum grouplist 查询出来：

[root@localhost ~]# yum groupremove 软件组名$kp$, section = '' where id = 31163;
update t_knowledge_point set title = $kp$源码包管理$kp$, content = $kp$源码包管理：包括源码包的安装（./configure、make、make install）以及源码包安装服务的启动与自启动。$kp$, section = '' where id = 31180;
update t_knowledge_point set title = $kp$yum 卸载指定软件组$kp$, content = $kp$卸载指定的软件组，组名可以由 yum grouplist 查询出来：

[root@localhost ~]# yum groupremove 软件组名$kp$, section = '' where id = 31189;
update t_knowledge_point set title = $kp$RPM 包中文件的类型标记$kp$, content = $kp$RPM 包中文件的类型标记：

- c：配置文件（config file）
- d：普通文档（documentation）
- g：“鬼”文件（ghost file），很少见，指该文件不应该被这个 RPM 包包含
- l：授权文件（license file）
- r：描述文件（read me）$kp$, section = '' where id = 31238;
update t_knowledge_point set title = $kp$查看服务自启动状态$kp$, content = $kp$查看服务自启动状态，可以看到所有 RPM 包安装的服务。

源码包安装的服务不会显示在这里，需要查看其安装位置，一般在 /usr/local/ 下。$kp$, section = '' where id = 31255;
update t_knowledge_point set title = $kp$查询文件属于哪个 RPM 包$kp$, content = $kp$查询 /etc/inittab 文件属于哪个包：

# rpm -qf /etc/inittab$kp$, section = '' where id = 31257;
update t_knowledge_point set title = $kp$查询软件包是否安装$kp$, content = $kp$查询指定软件包是否安装：

# rpm -q 包名

选项：

- -q：查询（query）$kp$, section = '' where id = 31258;
update t_knowledge_point set title = $kp$yum 搜索软件包$kp$, content = $kp$按关键字搜索软件包：

[root@localhost yum.repos.d]# yum search 关键字$kp$, section = '' where id = 31261;
update t_knowledge_point set title = $kp$查询所有已安装的 RPM 包$kp$, content = $kp$查询所有已经安装的 RPM 包：

# rpm -qa

选项：

- -a：所有（all）$kp$, section = '' where id = 31262;
update t_knowledge_point set title = $kp$yum 全局参数与常用命令$kp$, content = $kp$常用的 yum 全局参数：

- -y：对 yum 命令的所有提问回答“是（yes）”
- -C：只利用本地缓存，不从远程仓库下载文件
- --enablerepo=REPO：临时启用指定的名为 REPO 的仓库
- --disablerepo=REPO：临时禁用指定的名为 REPO 的仓库
- --installroot=PATH：指定安装软件时的根目录，主要用于为 chroot 环境安装软件

yum 命令的常见用法：

- yum check-update：检查可更新的所有软件包
- yum update：下载更新系统已安装的所有软件包
- yum upgrade：大规模的版本升级（已淘汰的旧包也一并升级）
- yum install <packages>：安装新软件包
- yum update <packages>：更新指定的软件包
- yum remove <packages>：移除指定的软件包
- yum list installed：列出资源库中已经安装的 rpm 包$kp$, section = '' where id = 31565;
update t_knowledge_point set title = $kp$软件按知识产权分类$kp$, content = $kp$按知识产权分为四类：

① 商品软件：须先购买后使用，受到版权和许可证保护。例如 Windows 操作系统等。

② 共享软件（试用软件）：具有版权，可免费试用一段时间，允许拷贝和散发（但不可修改），试用期满后需交费才能继续使用。例如微软 Visio 等。

③ 自由软件（开源软件）：用户可共享，并允许随意拷贝、修改其源代码，允许销售和自由传播。例如 Linux（CentOS）、Linux（Ubuntu）等。

④ 免费软件：无需付费即可获得的软件，例如 PDF 阅读器、Flash 播放器、QQ、微信等。自由软件很多是免费软件，但免费软件不全是自由软件。$kp$, section = '' where id = 31578;
update t_knowledge_point set title = $kp$源程序、翻译程序与目标程序$kp$, content = $kp$源程序 → 翻译程序 → 目标程序。$kp$, section = '' where id = 31734;
update t_knowledge_point set title = $kp$RPM 简介$kp$, content = $kp$RPM 是一个开放的软件包管理系统，最初的全称是 Red Hat Package Manager。$kp$, section = '' where id = 31892;
update t_knowledge_point set title = $kp$YUM 简介$kp$, content = $kp$YUM 是“Yellow dog Updater, Modified”的简称，最早由 Yellow dog 发行版的开发者 Terra Soft 研发，用 Python 写成，那时叫做 YUP（Yellow dog Updater），后经杜克大学的 Linux@Duke 开发团队改进，遂有此名。$kp$, section = '' where id = 32460;
update t_knowledge_point set title = $kp$RPM 包名称格式$kp$, content = $kp$RPM 包的名称格式为 name-version.type.rpm，例如 linuxqq-v1.0.2-beta1.i386.rpm。

- name：软件的名称，如 linuxqq
- version：软件的版本号，如 v1.0.2-beta1
- type：包的类型，如 i386
- rpm：文件扩展名$kp$, section = '' where id = 32634;
update t_knowledge_point set title = $kp$RPM 常用命令$kp$, content = $kp$RPM 常用命令：

- rpm -i：安装指定的 .rpm 文件
- rpm -U：升级同名包
- rpm -V：校验指定的软件包
- rpm -e：删除指定的软件包$kp$, section = '' where id = 32635;
update t_knowledge_point set title = $kp$YUM 的宗旨$kp$, content = $kp$YUM 的宗旨是自动化地升级、安装/移除 RPM 包，收集 RPM 包的相关信息，检查依赖性并自动提示用户解决。$kp$, section = '' where id = 32636;
update t_knowledge_point set title = $kp$YUM 的特点$kp$, content = $kp$YUM 的特点：

① 自动解决包的依赖性问题，能更方便地添加/删除/更新 RPM 包；
② 便于管理大量系统的更改问题；
③ 可以同时配置多个仓库（repository）；
④ 配置文件简洁（/etc/yum.conf）；
⑤ 保持与数据库的一致性；
⑥ 有比较详细的日志，可以查看何时升级安装了什么软件包等。$kp$, section = '' where id = 32637;
update t_knowledge_point set title = $kp$卸载指定的软件包$kp$, content = $kp$卸载指定的软件包：

[root@zhangzhihu yum.repos.d]# yum remove git lftp

查看已安装的 git 软件包（输出显示其版本与来源仓库 @base）：

[root@zhangzhihu yum.repos.d]# yum list installed git | grep git$kp$, section = '' where id = 32646;
update t_knowledge_point set title = $kp$YUM 的组成$kp$, content = $kp$YUM 包含如下组件：

① yum 命令：使用其提供的众多功能；
② YUM 插件：用于扩展 YUM 的功能；
③ YUM 仓库：软件仓库；
④ YUM 缓存：下载的缓存放在 /var/cache/yum 目录中。$kp$, section = '' where id = 32653;
update t_knowledge_point set title = $kp$检查并安装 DHCP 服务$kp$, content = $kp$是否安装了 DHCP 服务，没有安装的时候要安装 DHCP 服务（Samba 服务同理）：

- 检查是否已安装：rpm -qa | grep dhcp
- 安装 DHCP 服务：yum install -y dhcp$kp$, section = '' where id = 32660;
update t_knowledge_point set title = $kp$检查并安装 dhcp 服务$kp$, content = $kp$查找是否安装了 dhcp 服务：rpm -qa | grep dhcp。如果没有安装，则安装 dhcp 服务：yum install -y dhcp。$kp$, section = '' where id = 32662;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30278,30318,30331,30334,30335,30337,30369,30411,30731,30851,30853,30939,30990,31017,31043,31083,31084,31131,31163,31180,31189,31238,31255,31257,31258,31261,31262,31565,31578,31734,31892,32460,32634,32635,32636,32637,32646,32653,32660,32662) and not deleted) <> 40 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
