package com.quiz.stats;

import jakarta.servlet.http.HttpServletRequest;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * 访问统计控制器单元测试：验证路径净化、敏感路由拦截与爬虫过滤。
 */
class StatsControllerTest {

    @Test
    void blocksAdminAndVerifyEmailPathsAndBots() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        HttpServletRequest req = mock(HttpServletRequest.class);
        when(req.getHeader("User-Agent")).thenReturn("Mozilla/5.0 (Windows NT 10.0; Win64; x64)");

        StatsController controller = new StatsController(jdbc);

        // 敏感路径不入库
        controller.collect(new StatsController.CollectReq("/admin", "visitor_12345678", null, false), req);
        controller.collect(new StatsController.CollectReq("/verify-email?token=abc", "visitor_12345678", null, false), req);

        // 爬虫 UA 不入库
        when(req.getHeader("User-Agent")).thenReturn("Googlebot/2.1");
        controller.collect(new StatsController.CollectReq("/chapters", "visitor_12345678", null, false), req);

        verify(jdbc, never()).update(anyString(), any(), any(), any(), any());
    }

    @Test
    void recordsValidPageViewAfterStrippingQueryAndHash() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        HttpServletRequest req = mock(HttpServletRequest.class);
        when(req.getHeader("User-Agent")).thenReturn("Mozilla/5.0 (Windows NT 10.0; Win64; x64)");
        when(jdbc.queryForList(anyString(), anyString(), anyString())).thenReturn(List.of());
        when(jdbc.queryForObject(anyString(), eq(Integer.class), any(), any())).thenReturn(0);

        StatsController controller = new StatsController(jdbc);
        Map<String, Object> res = controller.collect(
                new StatsController.CollectReq("/chapters/40?type=1#top", "visitor_12345678", "https://www.baidu.com/s?wd=x", true),
                req);

        assertThat(res.get("ok")).isEqualTo(true);
        verify(jdbc).update(anyString(), eq("/chapters/40"), eq("visitor_12345678"), eq("www.baidu.com"), eq(true));
    }
}
