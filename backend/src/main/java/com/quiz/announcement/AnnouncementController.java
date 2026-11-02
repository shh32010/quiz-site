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
        out.put("version", "2026-11-02-2");
        out.put("title", "关于这个刷题站的几句说明");
        out.put("subtitle", "跟大家交个底，说说题库哪来的、怎么做的，还有平时怎么维护。");
        out.put("date", "2026 年 11 月 2 日");
        out.put("footnote", "题库仅用于学习交流，如果哪部分涉及版权问题，在站内「我的 → 联系作者」跟我说一声，会尽快处理。这个公告每天只提示一次，关掉后想再看，从页面底部的「站内公告」随时能点开。");
        out.put("items", List.of(
                Map.of("tag", "规则", "title", "每天 200 题，够用也留余地",
                        "desc", "普通账号每天最多做 200 道不同的题，同一道题重做不重复占额度；免限用户和管理员不受限。达到上限后，可以在刷题页直接联系作者申请免限。"),
                Map.of("tag", "更新", "title", "练习、反馈和历史又顺手了一点",
                        "desc", "随机组卷加了 100/50 分钟计时，试卷模式也和练习一样判分、答对自动下一题。游客退出会提醒保存进度；清空历史改为归档；题目反馈和联系作者反馈都可以不写描述；知识点目录按小节编号，S1-1 已先按三个大纲条目重排。"),
                Map.of("tag", "题库", "title", "公开资料整理，做过多轮清洗",
                        "desc", "里面的题目来自公开网络流传的机构资料 PDF，先用 MinerU 识别提取出来，再由 DeepSeek-V4.1-Flash（1017 版）一轮轮精读、清洗、去重，顺手把缺的答案和解析也补全了。"),
                Map.of("tag", "协作", "title", "按江苏考纲搭结构，三个模型一起写",
                        "desc", "题库结构和知识点目录都是参照江苏省计算机专转本考试大纲排的。网站开发、内容清洗和代码检查，由 DeepSeek-V4.1-Flash、Claude Opus 5.5 和 Gemini 4 Argon 一起完成。"),
                Map.of("tag", "部署", "title", "放在阿里云杭州节点，已经备案",
                        "desc", "站点部署在阿里云杭州节点，域名已完成 ICP 备案和公安联网备案，平时打开和切题基本是毫秒级响应。不用装软件，手机浏览器直接点开就能刷。")
        ));
        out.put("history", List.of(
                Map.of("date", "2026-11-02", "text", "「我的」新增反馈处理进度查看；错题本支持待复习/高频错题筛选，章节题表显示错题与收藏标记；复核清理 22 组重复题与冲突答案"),
                Map.of("date", "2026-11-02", "text", "公安联网备案通过，页脚已展示苏公网安备32132402000835号")
        ));
        return out;
    }
}
