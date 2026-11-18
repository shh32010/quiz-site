BEGIN;
CREATE TABLE practice_session_backup_20261118_stale AS
SELECT * FROM practice_session
WHERE finished_at IS NULL AND deleted_at IS NULL AND started_at < now() - interval '7 days';
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM practice_session_backup_20261118_stale;
 IF n <> 62 THEN RAISE EXCEPTION '陈旧会话应为62，实际%', n; END IF;
END $$;
UPDATE practice_session SET deleted_at = now()
WHERE id IN (SELECT id FROM practice_session_backup_20261118_stale);
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM practice_session WHERE finished_at IS NULL AND deleted_at IS NULL;
 IF n <> 22 THEN RAISE EXCEPTION '剩余未交卷应为22，实际%', n; END IF;
END $$;
ROLLBACK;
