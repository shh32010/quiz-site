package com.quiz.auth;

import java.nio.charset.StandardCharsets;

/**
 * 密码长度策略。
 * BCrypt 只处理前 72 字节；中文密码按字符限制 64 位仍可能超过 72 字节，
 * 因此所有 encode / matches 前必须先做字节数检查，避免直接抛异常。
 */
public final class PasswordPolicy {

    public static final int MAX_BYTES = 72;

    private PasswordPolicy() {
    }

    public static boolean tooLong(String password) {
        return password != null && password.getBytes(StandardCharsets.UTF_8).length > MAX_BYTES;
    }

    public static String tooLongMessage() {
        return "密码过长：UTF-8 编码不能超过 72 字节";
    }
}
