-- 金标 6 道 P2 修复：3 HTML 实体 / 1 解析冒号 / 2 判断前缀
BEGIN;
SET LOCAL session_replication_role = replica;
CREATE TEMP TABLE g6(id integer PRIMARY KEY, stem_new text, option_new text, analysis_new text) ON COMMIT DROP;
INSERT INTO g6 VALUES
(342936,NULL,NULL,$q$图像数据压缩的可能性:①、数字图像中有大量的数据冗余；②、人眼视觉有局限性，允许图像有一些失真。

压缩编码方法的评价:①、压缩倍数的高低（压缩比例）；②、重建图像的质量（有损压缩时）；③、压缩算法的复杂程度。

JPEG（大多数为有损）。①JPEG（静止图像压缩编码国际标准）∶特别适合各种连续色调的彩色或灰度图像，计算机网络和数码相机中已得到广泛应用。 ② 压缩算法复杂度适中，既可用硬件实现，也可用软件实现。③JPEG 图像压缩比可由用户控制，压缩比越高图像质量越差。

GIF（无损）。①、GIF 图像格式颜色数目不超过 256 色（色彩深度 8 位），适合用作插画、剪贴画等色彩要求不高的场合，文件特点小，适合网络传输。②、GIF 图像格式具有累进显示功能，适合网络浏览器观看。③、GIF 图像格式能支持透明背景（JPEG 不支持）。④、GIF图像格式能支持动画。⑤、不适合真彩色图片⑥、文件扩展名:.gif

根据上述内容可以得知选项 C 有错，JPEG 大多数为有损压缩。所以选择 ABD$q$),(345683,$q$大部分数码相机采用CCD成像芯片，CCD芯片中有大量的CCD像素，像素越多，得到的影像的分辨率（清晰度）就越高，生成的数字图像也越小。$q$,NULL,NULL),(371903,NULL,$q${"A": "10 10 |<br/>| --- | --- |<br/>| int main(){ |", "B": "9 9 |<br/>| int x = 10, y = 10; |", "C": "9 10 |<br/>| printf(\"%d %d\", x--, --y); |", "D": "10 9 |<br/><br/>}"}$q$,NULL),(373523,$q$在 PowerPoint 的普通视图中，右击幻灯片→删除，可以删除一张幻灯片。$q$,NULL,NULL),(373704,NULL,$q${"A": "&&", "B": "||", "C": "NOT", "D": "AND"}$q$,NULL),(382012,NULL,$q${"A": "CREATE VIFW V1 AS SELECT sno,sname FROM student; CREATE D VIFW v2(maior). AS SELECT DISTINCT(smajor) FROM student;", "B": "CREATE VIEW V2(maJor) AS aior scount) AS SELECT smajor,COUNT(*) FROM student GROUP BY smajor;", "C": "CREATF VIEW V3(major,scount) AS AS SELECT sname,age+5 FROM student where sno='101';", "D": "CREATE VIEW V4(sname,sage)"}$q$,NULL);
UPDATE t_question q SET
  stem = coalesce(e.stem_new, q.stem),
  option_json = coalesce(e.option_new, q.option_json),
  analysis = coalesce(e.analysis_new, q.analysis)
FROM g6 e WHERE q.id = e.id;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN g6 e ON e.id=q.id
  WHERE (e.stem_new IS NULL OR q.stem=e.stem_new)
    AND (e.option_new IS NULL OR q.option_json=e.option_new)
    AND (e.analysis_new IS NULL OR q.analysis=e.analysis_new);
 IF n<>6 THEN RAISE EXCEPTION '更新应为6，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN t_question_backup_20261118_golden6 b ON b.id=q.id
  WHERE q.correct IS DISTINCT FROM b.correct OR q.question_type IS DISTINCT FROM b.question_type
     OR q.blank_count IS DISTINCT FROM b.blank_count;
 IF n<>0 THEN RAISE EXCEPTION '答案/题型/空数被改%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n<>44419 THEN RAISE EXCEPTION '活跃应为44419，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n<>200 THEN RAISE EXCEPTION '金标应为200，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE id IN (342936,345683,371903,373523,373704,382012) AND (option_json ~ '&(amp|quot|lt|gt|#x27|#39);' OR analysis ~ '^[:：]'); IF n<>0 THEN RAISE EXCEPTION '仍有残留%',n; END IF;
END $$;
COMMIT;
