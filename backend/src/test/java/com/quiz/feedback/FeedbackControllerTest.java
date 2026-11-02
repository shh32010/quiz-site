package com.quiz.feedback;

import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

/**
 * 用户反馈控制器单元测试（验证反馈闭环 /api/feedback/mine）。
 */
class FeedbackControllerTest {

    @Test
    void mineReturnsCurrentUserFeedbackWithStatusAndAdminNote() {
        JdbcTemplate jdbc = mock(JdbcTemplate.class);
        UUID uid = UUID.randomUUID();
        List<Map<String, Object>> fakeRows = List.of(
                Map.of(
                        "id", 101L,
                        "questionId", 364975,
                        "type", "answer",
                        "content", "答案应为 B",
                        "status", "handled",
                        "adminNote", "已修正选项与答案，并清空错题记录",
                        "createdAt", "2026-10-30T10:00:00Z"
                )
        );
        when(jdbc.queryForList(anyString(), eq(uid))).thenReturn(fakeRows);

        FeedbackController controller = new FeedbackController(jdbc);
        Map<String, Object> res = controller.mine(uid);

        assertThat(res.get("rows")).isEqualTo(fakeRows);
        verify(jdbc).queryForList(anyString(), eq(uid));
    }
}
