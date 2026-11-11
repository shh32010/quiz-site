-- 公告卡片固定为 4 条：最新两条 + 两条常驻（部署说明、题库来源）
-- 其余更新只保留在 history_json；本次不改变公告版本号，避免重复弹窗。
-- 执行：sudo -u postgres psql -d quiz -v ON_ERROR_STOP=1 -f data_write_announcement_20261111.sql

begin;

update site_announcement
   set items_json = $json$[
  {
    "tag": "重磅",
    "date": "2026-11-11",
    "title": "全考纲 232 篇讲义尾部上线「复习提示」与「易错陷阱」",
    "desc": "覆盖考纲全部 232 个三级考点（理论 155 篇、技能 77 篇），每目末尾统一配置「考向复习提示」（考向脉络与背诵要点）与「高频易错陷阱」（历年真题常见失分点）。卡片采用胶囊式版式与三色标记，章节考情与正文分离置顶，便于集中复习。"
  },
  {
    "tag": "升级",
    "date": "2026-11-10",
    "title": "知识库二期全量升级，题目关联全部切至新版讲义",
    "desc": "两本复习教程 PDF（理论 135 页、操作技能 168 页）正文、红/绿/黄三色重点标记、18 张表格与 431 张经旋转校正并去水印的高清配图已完整收录，并在每节末尾补充真题独有要点。刷题解析、错题本、收藏夹与学习报告已全部切换至新版 232 个考纲三级讲义节点。"
  },
  {
    "tag": "部署",
    "date": "2026-11-02",
    "title": "部署于阿里云杭州节点，已完成备案",
    "desc": "站点部署于阿里云杭州节点，域名已完成 ICP 备案与公安联网备案（苏公网安备32132402000835号）。页面打开与切题响应为毫秒级；无需安装客户端，手机浏览器可直接使用。"
  },
  {
    "tag": "题库",
    "date": "2026-10-29",
    "title": "公开资料整理，已完成多轮清洗",
    "desc": "题库与讲义来源于公开复习资料 PDF，经 MinerU 与 PyMuPDF 提取后，由多模型协同完成精读、清洗、去重与编译校验，并补全答案解析与结构化排版。"
  }
]$json$::jsonb,
       updated_at = now()
 where id = 1;

do $$
declare
  n integer;
  fixed_n integer;
begin
  select jsonb_array_length(items_json) into n from site_announcement where id = 1;
  if n <> 4 then
    raise exception '公告卡片必须为 4 条，当前为 % 条', n;
  end if;

  select count(*) into fixed_n
    from site_announcement s,
         jsonb_array_elements(s.items_json) item
   where s.id = 1
     and item->>'date' in ('2026-11-02', '2026-10-29');
  if fixed_n <> 2 then
    raise exception '两条常驻公告缺失，当前命中 % 条', fixed_n;
  end if;
end $$;

commit;
