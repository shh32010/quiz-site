-- 空线 8 道高置信修复
BEGIN;
CREATE TEMP TABLE blank8(id integer PRIMARY KEY, stem text NOT NULL, blank_count integer NOT NULL, correct text NOT NULL) ON COMMIT DROP;
INSERT INTO blank8 VALUES (337155,$q$鼠标器最主要的技术指标是_____，用_____表示，它指鼠标每移动 距离光标在屏幕上所通过的_____的数目。$q$,3,'分辨率；dpi；像素'),(341721,$q$在线传输介质中，用于局域网络，成本低，易受外部高频电磁波干扰、传输距离有限的是_____；用于网络干线，传输损耗小、通讯距离长、容量大、屏蔽特性好、不易被窃听的是_____。$q$,2,'双绞线；光纤'),(347713,$q$人文教育实际上是一种_____，它以_____为最高目标，体现的主要是以个人发展需要为标准的教育价值观。$q$,2,'人性教育；个体的心性完善'),(370012,$q$想将学生表 2 表从数据库删除。请根据题意补全 SQL 语句。

____ ____ student2;$q$,2,'DROP；TABLE'),(370027,$q$若想在删除数据库之前判断数据库是否存在，请补全相关 SQL 语句
____ ____ ____ ____ school;$q$,4,'DROP；DATABASE；IF；EXISTS'),(373276,$q$查询产品表 products，查询产品价格(prod_price)在 10 及以上的且产品数量在 2 以上的数据，列出产品编号 (vend_id) 和产品数量。

SELECT vend_id,COUNT(*)
FROM products

WHERE ____
____ vend_id
____COUNT(*)>=2 ;$q$,3,'prod_price >= 10；GROUP BY；HAVING'),(376622,$q$CentOS7正在运行一段程序，需要先设置一下，15分钟以后重启一下系统。

shutdown - ____ ____$q$,2,'r；+15'),(381367,$q$局域网地址被定义在 MAC 层，称为_____，共_____位。$q$,2,'物理地址；48');
UPDATE t_question q SET stem=e.stem, blank_count=e.blank_count, correct=e.correct
FROM blank8 e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN blank8 e ON e.id=q.id WHERE q.stem=e.stem AND q.blank_count=e.blank_count AND q.correct=e.correct;
 IF n<>8 THEN RAISE EXCEPTION '更新应为8，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN blank8 e ON e.id=q.id WHERE q.is_golden;
 IF n<>0 THEN RAISE EXCEPTION '触及金标%',n; END IF;
END $$;
ROLLBACK;
