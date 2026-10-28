-- 知识点 319 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_319
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_319 as
select * from t_knowledge_point where id in (31519,31719,32578,32582,32583,32584,32585,32586,32587);

update t_knowledge_point set title = $kp$更新驱动程序的两种搜索方式$kp$, content = $kp$在设备管理器中右键单击需要更新的设备（如 HID-compliant mouse），选择“更新驱动程序”，再选择搜索方式：
① 自动搜索驱动程序：Windows 在计算机和 Windows 更新中搜索可用的最佳驱动程序并安装；
② 浏览我的电脑以查找驱动程序：手动指定驱动程序所在位置，由系统从该位置搜索并安装。$kp$, section = '' where id = 31519;
update t_knowledge_point set title = $kp$设备管理与驱动程序的作用$kp$, content = $kp$设备管理是对所有设备的管理，驱动程序是操作系统与硬件设备之间的接口。$kp$, section = '' where id = 31719;
update t_knowledge_point set title = $kp$从安装介质中搜索匹配的驱动程序$kp$, content = $kp$可从微软 Windows 安装介质中搜索匹配的驱动程序，例如驱动程序安装光盘。$kp$, section = '' where id = 32578;
update t_knowledge_point set title = $kp$驱动程序的 32 位与 64 位及 DriverStore 存储位置$kp$, content = $kp$驱动程序与操作系统对应，分为 32 位和 64 位。
① 32 位 Windows 10 中，32 位驱动程序存储于 %SystemRoot%\System32\DriverStore\FileRepository；
② 64 位 Windows 10 中，64 位驱动程序存储于 %SystemRoot%\System32\DriverStore\FileRepository，32 位驱动程序存储于 %SystemRoot%\SysWOW64\DriverStore\FileRepository。$kp$, section = '' where id = 32582;
update t_knowledge_point set title = $kp$STEP 3：在 DriverStore 中搜索匹配的驱动程序包$kp$, content = $kp$STEP 3：PnP 服务在 DriverStore 文件夹中搜索与硬件设备匹配的驱动程序包。
① 若找到匹配的驱动程序包，转到 STEP 8；
② 若未找到匹配的驱动程序包，转到 STEP 4；
③ 若找不到合适的驱动程序包，则自动停止安装过程。$kp$, section = '' where id = 32583;
update t_knowledge_point set title = $kp$STEP 4：系统搜索驱动程序包的位置$kp$, content = $kp$STEP 4：系统在以下位置搜索与硬件设备匹配的驱动程序包。
① 注册表指定位置：HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion；
② 微软 Windows Update 网站；
③ 指定的安装介质，例如驱动程序安装光盘。$kp$, section = '' where id = 32584;
update t_knowledge_point set title = $kp$STEP 5：检查用户是否具有管理员权限$kp$, content = $kp$STEP 5：系统检查当前用户是否具有管理员权限，以便向 DriverStore 文件夹中添加驱动程序包。$kp$, section = '' where id = 32585;
update t_knowledge_point set title = $kp$STEP 8：将驱动程序文件复制到设备安装位置$kp$, content = $kp$STEP 8：PnP 服务将驱动程序文件从 DriverStore 文件夹复制到设备安装的位置，该位置通常为 %SystemRoot%\System32\drivers。$kp$, section = '' where id = 32586;
update t_knowledge_point set title = $kp$更新驱动程序的方式与第三方驱动工具$kp$, content = $kp$在设备管理器中右键单击相应设备（如 HID-compliant mouse），选择“更新驱动程序”，可选：
① 自动搜索驱动程序：Windows 在计算机和 Windows 更新中搜索最佳可用驱动程序并自动安装；
② 浏览我的电脑以查找驱动程序：手动指定驱动程序所在位置后安装。

也可使用第三方软件（如 360 驱动大师）更新驱动：软件检测出可升级的设备驱动后，会列出设备类别、驱动名称、版本号和大小，并提供“稳定模式”和“最新模式”两种更新策略。$kp$, section = '' where id = 32587;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (31519,31719,32578,32582,32583,32584,32585,32586,32587) and not deleted) <> 9 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
