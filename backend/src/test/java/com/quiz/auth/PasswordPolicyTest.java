package com.quiz.auth;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * 密码长度策略测试：校验 BCrypt 72 字节上限。
 */
class PasswordPolicyTest {

    @Test
    void checksUtf8ByteLengthUpTo72() {
        assertThat(PasswordPolicy.tooLong(null)).isFalse();
        assertThat(PasswordPolicy.tooLong("a".repeat(72))).isFalse();
        assertThat(PasswordPolicy.tooLong("a".repeat(73))).isTrue();
        // 24 个中文字符 = 72 字节（UTF-8），25 个 = 75 字节 > 72
        assertThat(PasswordPolicy.tooLong("中".repeat(24))).isFalse();
        assertThat(PasswordPolicy.tooLong("中".repeat(25))).isTrue();
    }
}
