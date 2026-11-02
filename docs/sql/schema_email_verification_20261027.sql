-- 2026-10-27：邮箱归属验证
-- 1) profiles 增加 email_verified / pending_email
-- 2) 新增一次性邮箱验证令牌表（存 SHA-256，24 小时有效）
-- 3) 历史已有邮箱视为已验证，避免现有用户被锁；新注册/修改邮箱需验证
-- 执行前备份：sudo -u postgres pg_dump -d quiz -Fc -f /opt/quiz-backups/quiz_before_email_verify_20261027.dump
begin;

alter table profiles add column if not exists email_verified boolean not null default false;
alter table profiles add column if not exists pending_email varchar(128);

create table if not exists email_verification_token (
  id          bigint generated always as identity primary key,
  profile_id  uuid not null references profiles(id) on delete cascade,
  token_hash  text not null,
  email       varchar(128) not null,
  expires_at  timestamptz not null,
  used_at     timestamptz,
  created_at  timestamptz not null default now()
);

create index if not exists idx_evt_profile on email_verification_token(profile_id);
create index if not exists idx_evt_hash on email_verification_token(token_hash);

grant select, insert, update, delete on email_verification_token to quiz_app;
grant usage, select on sequence email_verification_token_id_seq to quiz_app;

-- 历史邮箱视为已验证；新注册/修改邮箱走验证流程
update profiles set email_verified = true where email is not null and email_verified = false;

commit;
