package com.quiz.favorite;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 收藏夹。
 */
@RestController
@RequestMapping("/api/favorites")
public class FavoriteController {

    private final JdbcTemplate jdbc;

    public FavoriteController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    @GetMapping
    public Map<String, Object> list(@AuthenticationPrincipal UUID uid) {
        List<Map<String, Object>> rows = jdbc.queryForList("""
                select f.question_id as "questionId", f.created_at as "createdAt",
                       q.question_type as "questionType", q.stem,
                       kp.kps as "kps"
                  from favorite_question f
                  join t_question q on q.id = f.question_id
                  left join lateral (
                    select string_agg(k.title, '、' order by k.id) as kps
                      from t_question_kp x
                      join t_knowledge_point k on k.id = x.kp_id and not k.deleted
                     where x.question_id = q.id
                  ) kp on true
                 where f.user_id = ? and not q.deleted
                 order by f.created_at desc
                 limit 300
                """, uid);
        return Map.of("total", rows.size(), "rows", rows);
    }

    @PostMapping("/{questionId}")
    public Map<String, Object> add(@AuthenticationPrincipal UUID uid, @PathVariable int questionId) {
        jdbc.update("insert into favorite_question (user_id, question_id) values (?, ?) on conflict do nothing",
                uid, questionId);
        return Map.of("favorited", true);
    }

    @DeleteMapping("/{questionId}")
    public Map<String, Object> remove(@AuthenticationPrincipal UUID uid, @PathVariable int questionId) {
        jdbc.update("delete from favorite_question where user_id = ? and question_id = ?", uid, questionId);
        return Map.of("favorited", false);
    }

    @GetMapping("/{questionId}")
    public Map<String, Object> check(@AuthenticationPrincipal UUID uid, @PathVariable int questionId) {
        Integer n = jdbc.queryForObject(
                "select count(*) from favorite_question where user_id = ? and question_id = ?",
                Integer.class, uid, questionId);
        return Map.of("favorited", n != null && n > 0);
    }
}
