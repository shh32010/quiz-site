package com.quiz.announcement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 站内公告公开读取与管理端热更新接口。
 * 优先从 site_announcement 单行表读取；表未就绪或为空时回退内置默认配置。
 */
@RestController
public class AnnouncementController {

    private static final Logger log = LoggerFactory.getLogger(AnnouncementController.class);

    private final JdbcTemplate jdbc;
    private final ObjectMapper mapper;
    private volatile Map<String, Object> cached;

    public AnnouncementController(JdbcTemplate jdbc, ObjectMapper mapper) {
        this.jdbc = jdbc;
        this.mapper = mapper;
    }

    /** 公开获取当前站内公告 */
    @GetMapping("/api/announcement")
    public Map<String, Object> getAnnouncement() {
        Map<String, Object> local = cached;
        if (local != null) {
            return local;
        }
        try {
            List<Map<String, Object>> rows = jdbc.queryForList("""
                    select version, title, subtitle, date_label as "date", footnote,
                           items_json::text as "itemsJson", history_json::text as "historyJson"
                      from site_announcement
                     where id = 1
                    """);
            if (!rows.isEmpty()) {
                Map<String, Object> r = rows.getFirst();
                Map<String, Object> out = new LinkedHashMap<>();
                out.put("version", String.valueOf(r.getOrDefault("version", "")));
                out.put("title", String.valueOf(r.getOrDefault("title", "")));
                out.put("subtitle", String.valueOf(r.getOrDefault("subtitle", "")));
                out.put("date", String.valueOf(r.getOrDefault("date", "")));
                out.put("footnote", String.valueOf(r.getOrDefault("footnote", "")));
                out.put("items", parseList(String.valueOf(r.getOrDefault("itemsJson", "[]"))));
                out.put("history", parseList(String.valueOf(r.getOrDefault("historyJson", "[]"))));
                cached = out;
                return out;
            }
        } catch (Exception e) {
            log.debug("读取 site_announcement 回退默认配置: {}", e.getMessage());
        }
        return defaultAnnouncement();
    }

    /** 管理端在线保存站内公告（无需重新发版） */
    @PutMapping("/api/admin/announcement")
    public Map<String, Object> updateAnnouncement(@RequestBody Map<String, Object> body) {
        String version = trim(body == null ? null : body.get("version"));
        String title = trim(body == null ? null : body.get("title"));
        if (version.isEmpty() || title.isEmpty()) {
            throw new IllegalArgumentException("公告版本号与标题不能为空");
        }
        String subtitle = trim(body.get("subtitle"));
        String date = trim(body.get("date"));
        String footnote = trim(body.get("footnote"));
        Object itemsObj = body.get("items") instanceof List<?> list ? list : List.of();
        Object historyObj = body.get("history") instanceof List<?> list ? list : List.of();

        try {
            String itemsJson = mapper.writeValueAsString(itemsObj);
            String historyJson = mapper.writeValueAsString(historyObj);
            jdbc.update("""
                    insert into site_announcement (id, version, title, subtitle, date_label, footnote, items_json, history_json, updated_at)
                    values (1, ?, ?, ?, ?, ?, ?::jsonb, ?::jsonb, now())
                    on conflict (id) do update set
                      version = excluded.version,
                      title = excluded.title,
                      subtitle = excluded.subtitle,
                      date_label = excluded.date_label,
                      footnote = excluded.footnote,
                      items_json = excluded.items_json,
                      history_json = excluded.history_json,
                      updated_at = now()
                    """, version, title, subtitle, date, footnote, itemsJson, historyJson);
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            throw new IllegalStateException("保存公告失败：" + e.getMessage());
        }

        Map<String, Object> updated = new LinkedHashMap<>();
        updated.put("version", version);
        updated.put("title", title);
        updated.put("subtitle", subtitle);
        updated.put("date", date);
        updated.put("footnote", footnote);
        updated.put("items", itemsObj);
        updated.put("history", historyObj);
        cached = updated;
        return updated;
    }

    private List<Map<String, Object>> parseList(String json) {
        try {
            return mapper.readValue(json, new TypeReference<>() {});
        } catch (Exception e) {
            return List.of();
        }
    }

    private static String trim(Object v) {
        return v == null ? "" : String.valueOf(v).trim();
    }

    private static Map<String, Object> defaultAnnouncement() {
        Map<String, Object> out = new LinkedHashMap<>();
        out.put("version", "2026-11-11-1");
        out.put("title", "站内更新与使用说明");
        out.put("subtitle", "江苏计算机专转本考纲题库与结构化知识讲义 · 近期重要更新及使用须知");
        out.put("date", "2026 年 11 月 11 日");
        out.put("footnote", "本站内容仅用于学习交流。如涉及版权或题目勘误，可通过「我的 → 联系作者」反馈。公告仅在版本更新时提示一次；关闭后可从页脚「站内公告」再次查看。");
        // 固定 4 条：最新两条 + 两条常驻（部署说明、题库来源）；其余更新只进 history
        out.put("items", List.of(
                Map.of("tag", "重磅", "date", "2026-11-11", "title", "全考纲 232 篇讲义尾部上线「复习提示」与「易错陷阱」",
                        "desc", "覆盖考纲全部 232 个三级考点（理论 155 篇、技能 77 篇），每目末尾统一配置「考向复习提示」（考向脉络与背诵要点）与「高频易错陷阱」（历年真题常见失分点）。卡片采用胶囊式版式与三色标记，章节考情与正文分离置顶，便于集中复习。"),
                Map.of("tag", "升级", "date", "2026-11-10", "title", "知识库二期全量升级，题目关联全部切至新版讲义",
                        "desc", "两本复习教程 PDF（理论 135 页、操作技能 168 页）正文、红/绿/黄三色重点标记、18 张表格与 431 张经旋转校正并去水印的高清配图已完整收录，并在每节末尾补充真题独有要点。刷题解析、错题本、收藏夹与学习报告已全部切换至新版 232 个考纲三级讲义节点。"),
                Map.of("tag", "部署", "date", "2026-11-02", "title", "部署于阿里云杭州节点，已完成备案",
                        "desc", "站点部署于阿里云杭州节点，域名已完成 ICP 备案与公安联网备案（苏公网安备32132402000835号）。页面打开与切题响应为毫秒级；无需安装客户端，手机浏览器可直接使用。"),
                Map.of("tag", "题库", "date", "2026-10-29", "title", "公开资料整理，已完成多轮清洗",
                        "desc", "题库与讲义来源于公开复习资料 PDF，经 MinerU 与 PyMuPDF 提取后，由多模型协同完成精读、清洗、去重与编译校验，并补全答案解析与结构化排版。")
        ));
        out.put("history", List.of(
                Map.of("date", "2026-11-11", "text", "全考纲 232 篇三级讲义尾部统一上线「考向复习提示」与「高频易错陷阱」专属微质感卡片；章节考情说明解耦置顶，移除冗余标识；物理清理重复题目并优化三级节点关联"),
                Map.of("date", "2026-11-10", "text", "知识库二期全量升级：两本复习教程 PDF 正文、红/绿/黄三色重点标记、18 张矢量表格与 431 张正向去水印高清配图 100% 无损收录，融合真题补充要点；统一新版讲义视图，题目关联全面切换至考纲三级节点；公告仅在有更新变动时提示且每条说明均标注日期"),
                Map.of("date", "2026-11-02", "text", "「我的」新增反馈处理进度查看；错题本支持待复习/高频错题筛选，章节题表显示错题与收藏标记；复核清理 22 组重复题与冲突答案"),
                Map.of("date", "2026-11-02", "text", "公安联网备案通过，页脚已展示苏公网安备32132402000835号")
        ));
        return out;
    }
}
