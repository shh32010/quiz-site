-- 知识点 338 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_338
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_338 as
select * from t_knowledge_point where id in (30890,30963,30985,31207,31211,31265,31558,31560,31561,32609,32610,32611,32612,32640,32641,32642,32643,32644,32645,32654);

update t_knowledge_point set title = $kp$挂载光盘$kp$, content = $kp$将光盘设备挂载到 `/mnt/cdrom` 目录：
```
[root@localhost ~]# mount /dev/cdrom /mnt/cdrom/
```$kp$, section = '' where id = 30890;
update t_knowledge_point set title = $kp$让网络 yum 源文件失效$kp$, content = $kp$进入 yum 源配置目录，把网络源配置文件改名备份，使其不再生效：
```
[root@localhost ~]# cd /etc/yum.repos.d/
[root@localhost yum.repos.d]# mv CentOS-Base.repo CentOS-Base.repo.bak
[root@localhost yum.repos.d]# mv CentOS-Debuginfo.repo CentOS-Debuginfo.repo.bak
[root@localhost yum.repos.d]# mv CentOS-Vault.repo CentOS-Vault.repo.bak
```$kp$, section = '' where id = 30963;
update t_knowledge_point set title = $kp$修改光盘 yum 源文件$kp$, content = $kp$编辑 `CentOS-Media.repo`，配置光盘仓库：
```
[root@localhost yum.repos.d]# vim CentOS-Media.repo

[c6-media]
name=CentOS-$releasever - Media
baseurl=file:///mnt/cdrom
```$kp$, section = '' where id = 30985;
update t_knowledge_point set title = $kp$启用光盘 yum 源$kp$, content = $kp$把 `enabled=0` 改为 `enabled=1`，让这个 yum 源配置文件生效。配置文件中还包含 GPG 公钥路径：
```
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS
```$kp$, section = '' where id = 31207;
update t_knowledge_point set title = $kp$从 RPM 包中提取文件$kp$, content = $kp$使用 `rpm2cpio` 配合 `cpio`，从 RPM 包中提取指定文件：
```
sh-4.1# rpm2cpio /mnt/cdrom/Packages/initscripts-8.45.3-1.i386.rpm | cpio -idv ./etc/inittab
```$kp$, section = '' where id = 31211;
update t_knowledge_point set title = $kp$注释仓库中不存在的地址$kp$, content = $kp$注释掉仓库配置中两个不存在的地址，保留 `gpgcheck` 与 `enabled` 配置：
```
gpgcheck=1
enabled=1
```$kp$, section = '' where id = 31265;
update t_knowledge_point set title = $kp$CentOS-Base.repo 配置与字段说明$kp$, content = $kp$CentOS-Base.repo 中以 centosplus 段为例：
```
[centosplus]
name=CentOS-$releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
```

仓库配置文件目录：
```
[root@zhangzhihu ~]# ll /etc/yum.repos.d/
总用量 28
-rw-r--r--. 1 root root 1664 8月 30 2017 CentOS-Base.repo
-rw-r--r--. 1 root root 1309 8月 30 2017 CentOS-CR.repo
-rw-r--r--. 1 root root  649 8月 30 2017 CentOS-Debuginfo.repo
-rw-r--r--. 1 root root  314 8月 30 2017 CentOS-fasttrack.repo
-rw-r--r--. 1 root root  630 8月 30 2017 CentOS-Media.repo
-rw-r--r--. 1 root root 1331 8月 30 2017 CentOS-Sources.repo
-rw-r--r--. 1 root root 3830 8月 30 2017 CentOS-Vault.repo
```

配置字段说明：

- 文件中以 `#` 开头的行是注释行。
- repositoryid：用于指定一个仓库，必须保证此值的唯一性，比如 base、updates、centosplus 等。
- name：用于指定易读的仓库名称。
- baseurl：用于指定本仓库的 URL，可以是 http（远程 HTTP 协议的源）、ftp（远程 FTP 协议的源）、file（本地镜像或 NFS 挂装文件系统）三种类型。
- mirrorlist：用于指定仓库的镜像站点列表。
- enabled：用于指定是否使用本仓库，默认值为 1，即可用。
- gpgcheck：用于指定是否检查软件包的 GPG 签名。
- gpgkey：用于指定 GPG 签名文件的 URL。$kp$, section = '' where id = 31558;
update t_knowledge_point set title = $kp$仓库的启用和禁用$kp$, content = $kp$方法一：修改配置文件中 `enabled` 的值，使用 vi 编辑器进行修改。

方法二：使用 `yum-config-manager` 命令。
```
[root@zhangzhihu ~]# yum-config-manager --enable centosplus
[root@zhangzhihu ~]# yum-config-manager --disable centosplus
```

`--enable` 将仓库的 `enabled` 置为 1，`--disable` 将 `enabled` 置为 0。$kp$, section = '' where id = 31560;
update t_knowledge_point set title = $kp$配置仓库镜像站点$kp$, content = $kp$在仓库配置文件 CentOS-Base.repo 中默认配置了 mirrorlist 的 URL 地址，且默认安装启用了 yum-plugin-fastestmirror 插件，因此执行 yum 命令时默认会从镜像地址列表中选择一个速度最快的镜像地址，并从此地址获取软件包。

并非所有的国内镜像都在 CentOS 的镜像站点列表中，所以可以使用 baseurl 直接指定最近或最快的镜像仓库。为了加快更新，在确保更新服务器及线路良好的情况下，在 baseurl 中只指定一个 URL 即可。

使用 baseurl 配置仓库地址还用于如下情况：

- 指定局域网中的一个本地镜像地址。
- 在 yum 客户端配置了代理时，避免代理缓存更多不同镜像站点的相同内容。

为了加快更新，国内用户可以修改仓库配置文件，改用国内的镜像站点。$kp$, section = '' where id = 31561;
update t_knowledge_point set title = $kp$备份原始 base 配置文件$kp$, content = $kp$备份原始 base 配置文件（CentOS-Base.repo）：
```
cp CentOS-Base.repo CentOS-Base.repo.orig
```$kp$, section = '' where id = 32609;
update t_knowledge_point set title = $kp$注释 mirrorlist 配置行$kp$, content = $kp$将 mirrorlist 配置行批量注释：
```
sed -i "s/^mirrorlist/#mirrorlist/g" CentOS-Base.repo
```$kp$, section = '' where id = 32610;
update t_knowledge_point set title = $kp$启用 baseurl 配置行$kp$, content = $kp$将 baseurl 配置行批量取消注释：
```
sed -i "s/^#baseurl/baseurl/g" CentOS-Base.repo
```$kp$, section = '' where id = 32611;
update t_knowledge_point set title = $kp$修改镜像站 URL$kp$, content = $kp$把镜像站地址由 mirror.centos.org 替换为 mirrors.sohu.com：
```
sed -i "s|http://mirror.centos.org|http://mirrors.sohu.com|g" CentOS-Base.repo
```$kp$, section = '' where id = 32612;
update t_knowledge_point set title = $kp$repositoryid 字段$kp$, content = $kp$repositoryid：用于指定一个仓库，必须保证此值的唯一性，比如 base、updates、centosplus 等。$kp$, section = '' where id = 32640;
update t_knowledge_point set title = $kp$gpgkey 字段$kp$, content = $kp$gpgkey：用于指定 GPG 签名文件的 URL。$kp$, section = '' where id = 32641;
update t_knowledge_point set title = $kp$CentOS 的 YUM 仓库与仓库配置文件$kp$, content = $kp$CentOS 的 YUM 仓库：仓库配置文件 `/etc/yum.repos.d/*.repo` 配置了 yum 命令在安装和查询软件时连接的 YUM 仓库地址，而 CentOS 的 YUM 仓库存放在 CentOS 的镜像站点中。

http://www.centos.org/download/mirrors/ 提供了 CentOS 的镜像站点列表，并可在 http://mirror-status.centos.org/ 查看镜像站点的状态。

官方仓库有四个：base（发行包）、updates（基于 base 的升级包）、extras（扩展包）、centosplus（增强功能）。

仓库的启用和禁用：

方法一：修改配置文件中 `enabled`，使用 vi 编辑器进行修改。

方法二：使用 `yum-config-manager`。
```
[root@zhangzhihu ~]# yum-config-manager --enable centosplus
enabled = 1
[root@zhangzhihu ~]# yum-config-manager --disable centosplus
enabled = 0
```

配置仓库镜像站点：

在仓库配置文件 CentOS-Base.repo 中默认配置了 mirrorlist 的 URL 地址，且默认安装启用了 yum-plugin-fastestmirror 插件，因此执行 yum 命令时默认会从镜像地址列表中选择一个速度最快的镜像地址，并从此地址获取软件包。

并非所有的国内镜像都在 CentOS 的镜像站点列表中，所以可以使用 baseurl 直接指定最近或最快的镜像仓库。为了加快更新，在确保更新服务器及线路良好的情况下，在 baseurl 中只指定一个 URL 即可。

使用 baseurl 配置仓库地址还用于如下情况：

- 指定局域网中的一个本地镜像地址。
- 在 yum 客户端配置了代理时，避免代理缓存更多不同镜像站点的相同内容。

为了加快更新，国内用户可以修改仓库配置文件，改用国内的镜像站点。$kp$, section = '' where id = 32642;
update t_knowledge_point set title = $kp$搜狐镜像站$kp$, content = $kp$常用国内镜像站点：搜狐镜像站 http://mirrors.sohu.com/。$kp$, section = '' where id = 32643;
update t_knowledge_point set title = $kp$注释 mirrorlist 配置行（sed 替换）$kp$, content = $kp$注释 mirrorlist 配置行：
```
sed -i "s/^mirrorlist/#mirrorlist/g" CentOS-Base.repo
```$kp$, section = '' where id = 32644;
update t_knowledge_point set title = $kp$修改镜像站 URL 与 yum 常用命令$kp$, content = $kp$修改镜像站的 URL：修改配置文件的内容也可以用 vi 编辑器进行，建议使用 `sed -i` 命令替换字符串。

yum 是 YUM 系统的字符界面管理工具，语法格式为 `yum 【全局参数】命令【命令参数】`。

常用全局参数：

- `-y`：对 yum 命令的所有提问回答“是（yes）”。
- `-C`：只利用本地缓存，不从远程仓库下载文件。
- `--enablerepo=REPO`：临时启用指定的名为 REPO 的仓库。
- `--disablerepo=REPO`：临时禁用指定的名为 REPO 的仓库。
- `--installroot=PATH`：指定安装软件时的根目录，主要用于为 chroot 环境安装软件。

yum 命令常见用法：

- `yum check-update`：检查可更新的所有软件包。
- `yum update`：下载更新系统已安装的所有软件包。
- `yum upgrade`：大规模的版本升级（旧包淘汰也升级）。
- `yum install`：安装新软件包。
- `yum update`：更新指定的软件包。
- `yum remove`：移除指定的软件包。
- `yum list installed`：列出资源库中已经安装的 rpm 包。$kp$, section = '' where id = 32645;
update t_knowledge_point set title = $kp$仓库配置文件 /etc/yum.repos.d/*.repo$kp$, content = $kp$YUM 使用仓库配置文件（文件名以 .repo 结尾）配置仓库的镜像站点地址等信息。默认情况下，CentOS 7 在 /etc/yum.repos.d/ 目录下包含 7 个配置文件，主要的仓库配置文件为 CentOS-Base.repo，其余配置文件中的仓库默认均未启用。配置文件采用分段形式，每一段配置一个软件仓库。

```
[root@zhangzhihu ~]# ll /etc/yum.repos.d/
总用量 28
-rw-r--r--. 1 root root 1664 8月 30 2017 CentOS-Base.repo
-rw-r--r--. 1 root root 1309 8月 30 2017 CentOS-CR.repo
-rw-r--r--. 1 root root  649 8月 30 2017 CentOS-Debuginfo.repo
-rw-r--r--. 1 root root  314 8月 30 2017 CentOS-fasttrack.repo
-rw-r--r--. 1 root root  630 8月 30 2017 CentOS-Media.repo
-rw-r--r--. 1 root root 1331 8月 30 2017 CentOS-Sources.repo
-rw-r--r--. 1 root root 3830 8月 30 2017 CentOS-Vault.repo
```

CentOS-Base.repo 的配置示例（centosplus 段）：
```
[centosplus]
name=CentOS-$releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
```$kp$, section = '' where id = 32654;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30890,30963,30985,31207,31211,31265,31558,31560,31561,32609,32610,32611,32612,32640,32641,32642,32643,32644,32645,32654) and not deleted) <> 20 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
