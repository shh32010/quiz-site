package com.quiz.question;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * 题目浏览服务单元测试：验证 ILIKE 通配符转义与真题排序参数化。
 */
class QuestionServiceTest {

    @Test
    void searchEscapesLikeWildcards() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        when(jdbc.queryForObject(contains("escape '\\'"), eq(Integer.class), any(Object[].class)))
                .thenReturn(0);
        ArgumentCaptor<Object[]> argsCaptor = ArgumentCaptor.forClass(Object[].class);
        when(jdbc.queryForList(contains("escape '\\'"), argsCaptor.capture()))
                .thenReturn(List.of());

        QuestionService service = new QuestionService(jdbc);
        service.search("100%_a\\b", null, 1, 20);

        Object[] args = argsCaptor.getValue();
        assertThat(args[0]).isEqualTo("%100\\%\\_a\\\\b%");
    }

    @Test
    void pageUsesParameterizedPaperOrderWithoutStringInterpolation() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        when(jdbc.queryForObject(contains("from v_question_public"), eq(Integer.class), any(Object[].class)))
                .thenReturn(0);
        when(jdbc.queryForList(contains("group by question_type"), any(Object[].class)))
                .thenReturn(List.of());
        ArgumentCaptor<String> sqlCaptor = ArgumentCaptor.forClass(String.class);
        when(jdbc.queryForList(sqlCaptor.capture(), any(Object[].class)))
                .thenReturn(List.of());

        QuestionService service = new QuestionService(jdbc);
        Map<String, Object> res = service.page(null, null, 280, null, null, null, 1, 20);

        assertThat(res.get("total")).isEqualTo(0);
        String sql = sqlCaptor.getValue();
        assertThat(sql).contains("e.paper_id = ?");
        assertThat(sql).doesNotContain("e.paper_id = 280");
    }
}
