-- 忘记密码申请（2026-10-22）
-- 本站无邮件服务：用户提交申请，管理员在后台生成临时密码并人工联系
CREATE TABLE IF NOT EXISTS password_reset_request (
    id          bigint generated always as identity primary key,
    username    varchar(32)  not null,
    contact     varchar(128) not null,
    note        text,
    status      varchar(16)  not null default 'open'
                check (status in ('open', 'handled', 'rejected')),
    admin_note  text,
    created_at  timestamptz  not null default now(),
    handled_at  timestamptz
);

CREATE INDEX IF NOT EXISTS idx_prr_status_created
    ON password_reset_request (status, created_at DESC);
