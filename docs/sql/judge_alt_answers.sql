-- 填空题判分支持「等价写法」
-- 标准答案的每个空可用 ¦ 分隔多个等价答案，如：z<min¦min>z
-- 同时把展示用的正确答案中的 ¦ 替换为「 或 」

BEGIN;

CREATE OR REPLACE FUNCTION public.judge_answer(p_question integer, p_answer text)
 RETURNS jsonb
 LANGUAGE plpgsql
 STABLE SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
declare
  q t_question%rowtype;
  v_ans text := upper(regexp_replace(coalesce(p_answer, ''), '[^A-Za-z]', '', 'g'));
  v_cor text;
  v_full boolean := false;
  got numeric := 0;
begin
  select * into q from t_question where id = p_question and not deleted and review_status = 'ok';
  if not found then
    raise exception '题目不存在或已下架';
  end if;

  v_cor := upper(regexp_replace(coalesce(q.correct, ''), '[^A-Za-z]', '', 'g'));

  if q.question_type in (1, 3) then
    v_full := (v_ans <> '' and v_ans = v_cor);
    got := case when v_full then q.score else 0 end;
  elsif q.question_type = 2 then
    declare
      ans_arr text[] := (select coalesce(array_agg(c order by c), '{}') from unnest(string_to_array(v_ans, null)) c);
      cor_arr text[] := (select coalesce(array_agg(c order by c), '{}') from unnest(string_to_array(v_cor, null)) c);
    begin
      if coalesce(array_length(ans_arr, 1), 0) = 0 then
        v_full := false; got := 0;
      elsif ans_arr = cor_arr then
        v_full := true; got := q.score;
      elsif ans_arr <@ cor_arr then
        v_full := false; got := floor(q.score / 2.0);
      else
        v_full := false; got := 0;
      end if;
    end;
  else
    declare
      cor_parts text[] := string_to_array(coalesce(q.correct, ''), '；');
      ans_parts text[] := string_to_array(coalesce(p_answer, ''), '；');
      n int := greatest(coalesce(array_length(cor_parts, 1), 1), 1);
      m int := 0;
    begin
      -- 用户按行输入时也视作分空（仅在分号分出的数量对不上时启用）
      if coalesce(array_length(ans_parts, 1), 1) <> n then
        ans_parts := regexp_split_to_array(coalesce(p_answer, ''), '[；\r\n]+');
      end if;
      if coalesce(array_length(ans_parts, 1), 1) = n then
        for i in 1 .. n loop
          -- 每个空可用 ¦ 分隔多个等价写法，命中任一即算对
          if norm_text(ans_parts[i]) <> '' and exists (
               select 1 from unnest(string_to_array(cor_parts[i], '¦')) alt
                where norm_text(alt) = norm_text(ans_parts[i])
             ) then
            m := m + 1;
          end if;
        end loop;
      end if;
      got := round(greatest(q.score, 0)::numeric * m / n);
      v_full := (m = n and m > 0);
    end;
  end if;

  return jsonb_build_object(
    'is_correct', v_full, 'score_got', got, 'max_score', q.score,
    'correct', replace(q.correct, '¦', ' 或 '), 'analysis', q.analysis);
end $function$;


CREATE OR REPLACE FUNCTION public.submit_answer(p_session bigint, p_question integer, p_answer text)
 RETURNS jsonb
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
declare
  v_user uuid := auth.uid();
  s practice_session%rowtype;
  q t_question%rowtype;
  v_ans text := upper(regexp_replace(coalesce(p_answer, ''), '[^A-Za-z]', '', 'g'));
  v_cor text;
  v_full boolean := false;
  got numeric := 0;
begin
  if v_user is null then raise exception '未登录' using errcode = '28000'; end if;
  select * into s from practice_session where id = p_session;
  if not found or s.user_id <> v_user then raise exception '会话无效'; end if;
  if s.finished_at is not null then raise exception '会话已结束'; end if;

  select * into q from t_question where id = p_question and not deleted;
  if not found then raise exception '题目不存在或已下架'; end if;

  v_cor := upper(regexp_replace(coalesce(q.correct, ''), '[^A-Za-z]', '', 'g'));

  if q.question_type in (1, 3) then
    v_full := (v_ans <> '' and v_ans = v_cor);
    got := case when v_full then q.score else 0 end;
  elsif q.question_type = 2 then
    declare
      ans_arr text[] := (select coalesce(array_agg(c order by c), '{}') from unnest(string_to_array(v_ans, null)) c);
      cor_arr text[] := (select coalesce(array_agg(c order by c), '{}') from unnest(string_to_array(v_cor, null)) c);
    begin
      if coalesce(array_length(ans_arr, 1), 0) = 0 then
        v_full := false; got := 0;
      elsif ans_arr = cor_arr then
        v_full := true; got := q.score;                    -- 全对满分
      elsif ans_arr <@ cor_arr then
        v_full := false; got := floor(q.score / 2.0);      -- 少选（无错选）得一半
      else
        v_full := false; got := 0;                         -- 错选/不选 0 分
      end if;
    end;
  else                                                 -- 填空/综合：按中文分号分空，逐空比对
    declare
      cor_parts text[] := string_to_array(coalesce(q.correct, ''), '；');
      ans_parts text[] := string_to_array(coalesce(p_answer, ''), '；');
      n int := greatest(coalesce(array_length(cor_parts, 1), 1), 1);
      m int := 0;
    begin
      -- 用户按行输入时也视作分空（仅在分号分出的数量对不上时启用）
      if coalesce(array_length(ans_parts, 1), 1) <> n then
        ans_parts := regexp_split_to_array(coalesce(p_answer, ''), '[；\r\n]+');
      end if;
      if coalesce(array_length(ans_parts, 1), 1) = n then
        for i in 1 .. n loop
          -- 每个空可用 ¦ 分隔多个等价写法，命中任一即算对
          if norm_text(ans_parts[i]) <> '' and exists (
               select 1 from unnest(string_to_array(cor_parts[i], '¦')) alt
                where norm_text(alt) = norm_text(ans_parts[i])
             ) then
            m := m + 1;
          end if;
        end loop;
      end if;
      got := round(greatest(q.score, 0)::numeric * m / n);
      v_full := (m = n and m > 0);
    end;
  end if;

  insert into practice_answer (session_id, user_id, question_id, user_answer, is_correct, score_got)
  values (p_session, v_user, p_question, p_answer, v_full, got::smallint)
  on conflict (session_id, question_id) do update
    set user_answer = excluded.user_answer, is_correct = excluded.is_correct,
        score_got = excluded.score_got, answered_at = now();

  if v_full then
    update wrong_question
       set streak_correct = wrong_question.streak_correct + 1,
           next_review_at = now() + interval '3 days',
           resolved = (wrong_question.streak_correct + 1 >= 2)
     where user_id = v_user and question_id = p_question and not resolved;
  else
    insert into wrong_question (user_id, question_id)
    values (v_user, p_question)
    on conflict (user_id, question_id) do update
      set wrong_count = wrong_question.wrong_count + 1, last_wrong_at = now(),
          next_review_at = now() + interval '1 day', streak_correct = 0, resolved = false;
  end if;

  return jsonb_build_object('is_correct', v_full, 'score_got', got, 'max_score', q.score);
end $function$;


CREATE OR REPLACE FUNCTION public.get_answer(p_session bigint, p_question integer)
 RETURNS jsonb
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
declare
  v_user uuid := auth.uid();
  q t_question%rowtype;
begin
  if v_user is null then raise exception '未登录' using errcode = '28000'; end if;
  -- 受控复盘：仅限「本会话、已作答」的题
  if not exists (
    select 1 from practice_answer a
    join practice_session s on s.id = a.session_id
    where a.session_id = p_session and a.question_id = p_question and s.user_id = v_user
  ) then
    raise exception '仅可复盘本会话中已作答的题目';
  end if;
  select * into q from t_question where id = p_question;
  return jsonb_build_object('correct', replace(q.correct, '¦', ' 或 '), 'analysis', q.analysis);
end $function$;

COMMIT;
