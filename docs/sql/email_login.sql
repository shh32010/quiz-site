-- 邮箱登录 + 邮箱找回密码（2026-10-22）
-- 1) 用户表增加邮箱（唯一，不区分大小写）与令牌版本（改密后强制旧 token 失效）
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS email varchar(128);
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS token_version integer NOT NULL DEFAULT 0;

CREATE UNIQUE INDEX IF NOT EXISTS ux_profiles_email
    ON profiles (lower(email::text))
    WHERE email IS NOT NULL;

-- 2) 一次性重置令牌（只存 SHA-256，30 分钟过期）
CREATE TABLE IF NOT EXISTS password_reset_token (
    id          bigint generated always as identity primary key,
    profile_id  uuid        not null references profiles(id) on delete cascade,
    token_hash  char(64)    not null,
    expires_at  timestamptz not null,
    used_at     timestamptz,
    created_at  timestamptz not null default now()
);

CREATE UNIQUE INDEX IF NOT EXISTS ux_prt_token_hash
    ON password_reset_token (token_hash);

CREATE INDEX IF NOT EXISTS idx_prt_profile_created
    ON password_reset_token (profile_id, created_at DESC);

-- 3) 应用账号授权（缺这一步后端会报 permission denied）
GRANT SELECT, INSERT, UPDATE, DELETE ON password_reset_token TO quiz_app;
GRANT USAGE, SELECT ON SEQUENCE password_reset_token_id_seq TO quiz_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON password_reset_request TO quiz_app;
GRANT USAGE, SELECT ON SEQUENCE password_reset_request_id_seq TO quiz_app;
