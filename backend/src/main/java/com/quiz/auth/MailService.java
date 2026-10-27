package com.quiz.auth;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * 发信服务（阿里云邮件推送 SMTP）。
 * 账号密码全部来自环境变量；未配置时 enabled() 为 false，由调用方转管理员兜底。
 */
@Service
public class MailService {

    private static final Logger log = LoggerFactory.getLogger(MailService.class);

    private final ObjectProvider<JavaMailSender> senderProvider;
    private final String host;
    private final String username;
    private final String password;
    private final String from;
    private final String siteUrl;

    public MailService(ObjectProvider<JavaMailSender> senderProvider,
                       @Value("${spring.mail.host:}") String host,
                       @Value("${spring.mail.username:}") String username,
                       @Value("${spring.mail.password:}") String password,
                       @Value("${quiz.mail.from:}") String from,
                       @Value("${quiz.site-url:}") String siteUrl) {
        this.senderProvider = senderProvider;
        this.host = host.trim();
        this.username = username.trim();
        this.password = password;
        this.from = from.trim();
        this.siteUrl = siteUrl.trim().replaceAll("/+$", "");
    }

    /** 发信配置是否完整 */
    public boolean enabled() {
        return !host.isEmpty() && !username.isEmpty() && !password.isEmpty() && !from.isEmpty();
    }

    /**
     * 发送重置密码链接。
     * @return true=已交给 SMTP；false=未配置或发送失败，调用方应转人工处理
     */
    public boolean sendResetLink(String to, String nickname, String token) {
        if (!enabled()) {
            return false;
        }
        JavaMailSender sender = senderProvider.getIfAvailable();
        if (sender == null) {
            return false;
        }
        try {
            SimpleMailMessage msg = new SimpleMailMessage();
            msg.setFrom(from);
            msg.setTo(to);
            msg.setSubject("找回密码 - 专转本计算机题库");
            msg.setText("""
                    %s，你好：

                    我们收到了你的密码重置请求。请在 30 分钟内打开下面的链接设置新密码：
                    %s/reset?token=%s

                    如果这不是你本人的操作，请忽略这封邮件，你的密码不会被修改。
                    """.formatted(nickname == null || nickname.isBlank() ? "同学" : nickname, siteUrl, token));
            sender.send(msg);
            return true;
        } catch (Exception e) {
            // 不记录令牌和邮箱，避免敏感信息进日志
            log.warn("重置密码邮件发送失败: {}", e.getMessage());
            return false;
        }
    }

    /**
     * 发送邮箱归属验证链接。
     * @return true=已交给 SMTP；false=未配置或发送失败
     */
    public boolean sendVerificationLink(String to, String nickname, String token) {
        if (!enabled()) {
            return false;
        }
        JavaMailSender sender = senderProvider.getIfAvailable();
        if (sender == null) {
            return false;
        }
        try {
            SimpleMailMessage msg = new SimpleMailMessage();
            msg.setFrom(from);
            msg.setTo(to);
            msg.setSubject("验证邮箱 - 专转本计算机题库");
            msg.setText("""
                    %s，你好：

                    请在 24 小时内打开下面的链接完成邮箱验证：
                    %s/verify-email?token=%s

                    验证后该邮箱可用于登录和找回密码。如果这不是你本人的操作，请忽略这封邮件。
                    """.formatted(nickname == null || nickname.isBlank() ? "同学" : nickname, siteUrl, token));
            sender.send(msg);
            return true;
        } catch (Exception e) {
            // 不记录令牌和邮箱，避免敏感信息进日志
            log.warn("邮箱验证邮件发送失败: {}", e.getMessage());
            return false;
        }
    }
}
