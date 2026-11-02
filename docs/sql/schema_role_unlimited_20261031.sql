-- 新增免限用户角色：unlimited
-- 仅跳过每日 200 题限制；不具备管理员权限；不提供申请入口，只由管理员手动授权。
-- 执行：sudo -u postgres psql -d quiz -f schema_role_unlimited_20261031.sql

begin;
alter table profiles drop constraint if exists profiles_role_check;
alter table profiles add constraint profiles_role_check
  check (role in ('user', 'admin', 'unlimited'));
commit;

-- 手动授权（确认用户名后再取消注释执行）：
-- update profiles set role = 'unlimited' where lower(username) = lower('用户名');
--
-- 收回免限角色：
-- update profiles set role = 'user' where lower(username) = lower('用户名');
