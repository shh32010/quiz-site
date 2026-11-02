-- 游客判分：与 submit_answer 相同的规则，但**不落库、不需要登录、不改错题本**。
-- 仅用于未登录试做；注册后走正常会话（submit_answer）。
CREATE OR REPLACE FUNCTION public.judge_answer(p_question integer, p_answer text)
RETURNS jsonb
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path TO 'public'
AS $fn$
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
      if coalesce(array_length(ans_parts, 1), 1) = n then
        for i in 1 .. n loop
          if norm_text(ans_parts[i]) <> '' and norm_text(ans_parts[i]) = norm_text(cor_parts[i]) then
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
    'correct', q.correct, 'analysis', q.analysis);
end $fn$;
