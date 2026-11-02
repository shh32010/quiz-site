-- 目的：新增站内公告配置表 site_announcement，支持后台 /admin 免发版热更新公告
-- 依赖：profiles（管理员鉴权由后端 SecurityConfig 控制）
-- 执行日期：2026-11-02

CREATE TABLE IF NOT EXISTS site_announcement (
  id         int PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  version    varchar(40)  NOT NULL,
  title      varchar(200) NOT NULL,
  subtitle   varchar(300) NOT NULL DEFAULT '',
  date_text  varchar(60)  NOT NULL DEFAULT '',
  footnote   varchar(500) NOT NULL DEFAULT '',
  items      jsonb        NOT NULL DEFAULT '[]'::jsonb,
  history    jsonb        NOT NULL DEFAULT '[]'::jsonb,
  updated_at timestamptz  NOT NULL DEFAULT now(),
  updated_by bigint
);

GRANT SELECT, INSERT, UPDATE ON site_announcement TO quiz_app;
