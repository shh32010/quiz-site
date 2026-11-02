-- 2026-10-27：第一方访问统计
-- 只记录页面路径、匿名访客 ID（浏览器本地生成）、来源域名、是否移动端；
-- 不记录 IP、原始 User-Agent，不做跨站追踪。
begin;

create table if not exists page_view (
  id            bigint generated always as identity primary key,
  path          varchar(200) not null,
  visitor_id    varchar(64) not null,
  referrer_host varchar(128),
  is_mobile     boolean not null default false,
  created_at    timestamptz not null default now()
);

create index if not exists idx_pv_created on page_view(created_at);
create index if not exists idx_pv_path_created on page_view(path, created_at);
create index if not exists idx_pv_visitor_created on page_view(visitor_id, created_at);

grant select, insert, delete on page_view to quiz_app;
grant usage, select on sequence page_view_id_seq to quiz_app;

commit;
