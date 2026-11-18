BEGIN;
CREATE TABLE backup_drop_manifest_20261118 AS
SELECT relname, n_live_tup, pg_total_relation_size(relid) AS bytes
FROM pg_stat_user_tables
WHERE (relname LIKE '%backup%' OR relname LIKE '%bak%')
  AND (relname LIKE '%20261102%' OR relname LIKE '%20261113%');
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM backup_drop_manifest_20261118;
 IF n <> 10 THEN RAISE EXCEPTION '待删备份应为10，实际%', n; END IF;
END $$;
DROP TABLE audit_fix_backup_20261102;
DROP TABLE kb_asset_backup_20261113_z24;
DROP TABLE kb_asset_bak_20261113_p0;
DROP TABLE kb_entry_backup_20261113_z24;
DROP TABLE kb_entry_bak_20261113_p0;
DROP TABLE kb_revision_backup_20261113_z24;
DROP TABLE kb_revision_bak_20261113_p0;
DROP TABLE t_kp_s1_backup_20261102;
DROP TABLE t_kp_s2_s6_backup_20261102;
DROP TABLE t_kp_theory_backup_20261102;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM pg_stat_user_tables
  WHERE (relname LIKE '%backup%' OR relname LIKE '%bak%')
    AND (relname LIKE '%20261102%' OR relname LIKE '%20261113%');
 IF n <> 0 THEN RAISE EXCEPTION '仍有旧备份%', n; END IF;
END $$;
COMMIT;
