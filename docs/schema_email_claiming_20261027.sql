-- 2026-10-27：邮箱防抢占（QQ 友好的折中方案）
-- 未验证邮箱允许重复，真实持有人可通过验证接管；已验证邮箱保持唯一
-- 执行前备份：sudo -u postgres pg_dump -d quiz -Fc -f /opt/quiz-backups/quiz_before_email_claiming_20261027.dump
begin;

-- 旧的全量唯一索引会让未验证邮箱永久占用；改为只约束已验证邮箱
drop index if exists ux_profiles_email;
create unique index if not exists ux_profiles_email_verified
    on profiles (lower(email))
    where email is not null and email_verified;

-- 邮箱登录/查找仍需普通索引
create index if not exists idx_profiles_email_lower on profiles (lower(email));

commit;
