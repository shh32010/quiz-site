package com.quiz.auth;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserRepository extends JpaRepository<User, UUID> {

    Optional<User> findByUsernameIgnoreCase(String username);

    boolean existsByUsernameIgnoreCase(String username);

    /** 未验证邮箱允许重复，按列表返回；登录时优先取已验证账号 */
    List<User> findByEmailIgnoreCase(String email);

    /** 已验证邮箱唯一，用于注册/绑定冲突检查和登录优先匹配 */
    Optional<User> findFirstByEmailIgnoreCaseAndEmailVerifiedTrue(String email);

    boolean existsByEmailIgnoreCase(String email);
}
