package com.quiz.config;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.BasicPolymorphicTypeValidator;
import com.fasterxml.jackson.databind.jsontype.PolymorphicTypeValidator;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;

import java.time.Duration;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Redis 缓存：JSON 序列化（支持 record / 非 Serializable 对象），默认 10 分钟过期。
 * 通过显式白名单限制多态反序列化类型，防止 Redis 被写入恶意 @class 触发反序列化漏洞。
 */
@Configuration
public class CacheConfig {

    @SuppressWarnings("deprecation")
    static GenericJackson2JsonRedisSerializer buildSerializer() {
        // 注意：不能调用 allowIfBaseType(Object.class)，否则会放行 Object 的所有子类
        PolymorphicTypeValidator ptv = BasicPolymorphicTypeValidator.builder()
                .allowIfSubType("com.quiz.")
                .allowIfSubType(List.class)
                .allowIfSubType(Map.class)
                .allowIfSubType(Set.class)
                .allowIfSubType(Number.class)
                .allowIfSubType(java.util.Date.class)
                .allowIfSubType(java.util.UUID.class)
                .allowIfSubType("java.time.")
                .build();

        ObjectMapper om = new ObjectMapper();
        om.registerModule(new JavaTimeModule());
        // ChapterNode / KnowledgeNode 为 final record，需启用 EVERYTHING 保留集合元素类型，由白名单 ptv 兜底安全
        om.activateDefaultTyping(ptv, ObjectMapper.DefaultTyping.EVERYTHING, JsonTypeInfo.As.PROPERTY);
        return new GenericJackson2JsonRedisSerializer(om);
    }

    @Bean
    public RedisCacheManager cacheManager(RedisConnectionFactory factory) {
        RedisCacheConfiguration cfg = RedisCacheConfiguration.defaultCacheConfig()
                .entryTtl(Duration.ofMinutes(10))
                .disableCachingNullValues()
                .serializeValuesWith(RedisSerializationContext.SerializationPair
                        .fromSerializer(buildSerializer()));

        return RedisCacheManager.builder(factory).cacheDefaults(cfg).build();
    }
}
