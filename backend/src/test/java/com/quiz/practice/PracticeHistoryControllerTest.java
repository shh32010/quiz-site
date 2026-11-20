package com.quiz.practice;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * 做题历史控制器单元测试：验证作答统计子查询过滤已软删除记录。
 */
class PracticeHistoryControllerTest {

    @Test
    void listExcludesSoftDeletedAnswersInSubqueries() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();

        when(jdbc.queryForObject(contains("from practice_session s"), eq(Integer.class), any(Object[].class)))
                .thenReturn(0);
        when(jdbc.queryForObject(contains("from practice_session where user_id = ?"), eq(Integer.class), eq(uid)))
                .thenReturn(0);
        ArgumentCaptor<String> listSqlCaptor = ArgumentCaptor.forClass(String.class);
        when(jdbc.queryForList(listSqlCaptor.capture(), any(Object[].class)))
                .thenReturn(List.of());
        when(jdbc.queryForList(contains("group by q.question_type"), eq(uid)))
                .thenReturn(List.of());

        PracticeHistoryController controller = new PracticeHistoryController(jdbc);
        Map<String, Object> res = controller.list(uid, null, 1, 20);

        assertThat(res.get("total")).isEqualTo(0);
        String sql = listSqlCaptor.getValue();
        assertThat(sql).contains("from practice_answer a where a.session_id = s.id and a.deleted_at is null");
        assertThat(sql).contains("from practice_answer a where a.session_id = s.id and a.is_correct and a.deleted_at is null");
    }
}
