BEGIN;
\copy (select id, chapter_id, subject_id, cat_l1 from t_question where id in (388739,388808,389850,390250,390255,390526) order by id) to '/tmp/paper6_backup.csv' with (format csv, header)
UPDATE t_question SET chapter_id=159, subject_id=4, cat_l1='B' WHERE id=388739;
UPDATE t_question SET chapter_id=39, subject_id=4, cat_l1='A' WHERE id=388808;
UPDATE t_question SET chapter_id=55, subject_id=4, cat_l1='A' WHERE id=389850;
UPDATE t_question SET chapter_id=320, subject_id=5, cat_l1='S5' WHERE id=390250;
UPDATE t_question SET chapter_id=242, subject_id=5, cat_l1='S1' WHERE id=390255;
UPDATE t_question SET chapter_id=92, subject_id=4, cat_l1='A' WHERE id=390526;
COMMIT;