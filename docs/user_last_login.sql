-- 记录用户最近登录 IP / 时间（2026-10-22）
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS last_ip varchar(64);
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS last_login_at timestamptz;
