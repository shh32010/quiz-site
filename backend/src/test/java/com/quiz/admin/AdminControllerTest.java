package com.quiz.admin;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

/**
 * 管理后台控制器单元测试（验证反馈筛选与标记处理）。
 */
class AdminControllerTest {

    @Test
    void feedbackFiltersPendingByDefaultAndSupportsAll() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        when(jdbc.queryForList(anyString())).thenReturn(List.of());

        AdminController controller = new AdminController(jdbc);
        controller.feedback("pending");
        controller.feedback("all");

        ArgumentCaptor<String> sqlCaptor = ArgumentCaptor.forClass(String.class);
        verify(jdbc, times(2)).queryForList(sqlCaptor.capture());

        List<String> sqls = sqlCaptor.getAllValues();
        assertThat(sqls.get(0)).contains("f.status = 'open'");
        assertThat(sqls.get(1)).doesNotContain("and f.status = 'open'");
    }

    @Test
    void resolveUpdatesStatusAndAdminNote() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        when(jdbc.update(anyString(), eq("已核实修正"), eq(57L))).thenReturn(1);

        AdminController controller = new AdminController(jdbc);
        Map<String, Object> res = controller.resolve(57L, Map.of("note", "已核实修正"));

        assertThat(res.get("updated")).isEqualTo(1);
    }
}
