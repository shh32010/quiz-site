-- 金标防误改触发器（2026-10-25）
-- 放行 chapter_id / cat_l1 / cat_l2 / cat_l3；锁住内容与审核字段。
-- 在事务中创建并自测；任何断言失败会整体回滚。
BEGIN;

CREATE OR REPLACE FUNCTION protect_gold_question() RETURNS trigger
LANGUAGE plpgsql AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.is_golden THEN
            RAISE EXCEPTION 'gold question % cannot be deleted', OLD.id USING ERRCODE = '42501';
        END IF;
        RETURN OLD;
    END IF;

    IF OLD.is_golden THEN
        IF NEW.is_golden IS DISTINCT FROM OLD.is_golden
           OR NEW.stem IS DISTINCT FROM OLD.stem
           OR NEW.option_json IS DISTINCT FROM OLD.option_json
           OR NEW.correct IS DISTINCT FROM OLD.correct
           OR NEW.analysis IS DISTINCT FROM OLD.analysis
           OR NEW.question_type IS DISTINCT FROM OLD.question_type
           OR NEW.score IS DISTINCT FROM OLD.score
           OR NEW.blank_count IS DISTINCT FROM OLD.blank_count
           OR NEW.review_status IS DISTINCT FROM OLD.review_status
           OR NEW.deleted IS DISTINCT FROM OLD.deleted
        THEN
            RAISE EXCEPTION 'gold question % content is protected', OLD.id USING ERRCODE = '42501';
        END IF;
    END IF;
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_protect_gold_question ON t_question;
CREATE TRIGGER trg_protect_gold_question
BEFORE UPDATE OR DELETE ON t_question
FOR EACH ROW EXECUTE FUNCTION protect_gold_question();

DO $$
DECLARE
    gid integer;
    blocked boolean := false;
BEGIN
    SELECT id INTO gid FROM t_question WHERE is_golden LIMIT 1;
    IF gid IS NULL THEN
        RAISE EXCEPTION 'no golden question found';
    END IF;

    -- 允许调整章节/分类
    UPDATE t_question SET chapter_id = chapter_id, cat_l1 = cat_l1 WHERE id = gid;

    -- 改题干必须被拦
    BEGIN
        UPDATE t_question SET stem = stem || 'x' WHERE id = gid;
    EXCEPTION WHEN insufficient_privilege THEN
        blocked := true;
    END;
    IF NOT blocked THEN
        RAISE EXCEPTION 'trigger did not block stem update';
    END IF;

    -- 删除必须被拦
    blocked := false;
    BEGIN
        DELETE FROM t_question WHERE id = gid;
    EXCEPTION WHEN insufficient_privilege THEN
        blocked := true;
    END;
    IF NOT blocked THEN
        RAISE EXCEPTION 'trigger did not block delete';
    END IF;
END;
$$;

COMMIT;
