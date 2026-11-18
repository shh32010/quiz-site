BEGIN;
CREATE TEMP TABLE b7(id integer PRIMARY KEY, tc_id integer NOT NULL, stem text NOT NULL, correct text NOT NULL, analysis text NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO b7 VALUES
(371191,371431,$q$设有整数数列 a0, a1, a2, ..., an-1，给出求解最大值的递归程序。请补全代码。

MaxValue 函数的功能就是返回数组中最大值。

例如：整数数列是 12,44,1,5,8,99,23,20,33,76，返回结果是 99。

代码如下：

#include <stdio.h>

int MaxValue(int a[], int n){
    int max;
    if(n==0)
        max = a[0];
    else if(a[n] > MaxValue(a,n-1))
        max = ________;
    else
        max = ________;
    ________ max;
}

main(){
    int aa[10] = { 12,44,1,5,8,99,23,20,33,76};
    int max = MaxValue(aa,9);
    printf("max = %d\n",max);
    system("pause");
}$q$,$q$a[n]；MaxValue(a,n-1)；return$q$,$q$三个空依次填 a[n]、MaxValue(a,n-1)、return，完整语句为 max=a[n];、max=MaxValue(a,n-1);、return max;。$q$,$q${"titleContent": "设有整数数列 a0, a1, a2, ..., an-1，给出求解最大值的递归程序。请补全代码。<br/><br/>MaxValue 函数的功能就是返回数组中最大值。<br/><br/>例如：整数数列是 12,44,1,5,8,99,23,20,33,76，返回结果是 99。<br/><br/>代码如下：<br/><br/>#include &lt;stdio.h&gt;<br/><br/>int MaxValue(int a[], int n){<br/>    int max;<br/>    if(n==0)<br/>        max = a[0];<br/>    else if(a[n] &gt; MaxValue(a,n-1))<br/>        max = ________;<br/>    else<br/>        max = ________;<br/>    ________ max;<br/>}<br/><br/>main(){<br/>    int aa[10] = { 12,44,1,5,8,99,23,20,33,76};<br/>    int max = MaxValue(aa,9);<br/>    printf(&quot;max = %d\\n&quot;,max);<br/>    system(&quot;pause&quot;);<br/>}", "analyze": "三个空依次填 a[n]、MaxValue(a,n-1)、return，完整语句为 max=a[n];、max=MaxValue(a,n-1);、return max;。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "a[n]", "itemUuid": "00371191000000000000000000000000", "score": null}, {"prefix": "2", "content": "MaxValue(a,n-1)", "itemUuid": "00371191010000000000000000000000", "score": null}, {"prefix": "3", "content": "return", "itemUuid": "00371191020000000000000000000000", "score": null}]}$q$),
(373366,373606,$q$数据库 newtest 中现有学生表和成绩表，表结构如下：
Student(stuid, name, sex)（学号、姓名、性别）
Score(id, stuid, cname, grade)（编号、学号、课程名、分数）

编写 SQL 语句，按课程名进行分组，并从组内平均分高于 85 分的分组中、找出该课程的最高分，分别以“课程名”和“最高分数”为别名输出查询结果。

SELECT cname AS '课程名', ________ AS '最高分'
FROM ________
GROUP BY cname
________ ________ (grade) > 85;$q$,$q$MAX(grade)；Score；HAVING；AVG$q$,$q$依次填 MAX(grade)、Score、HAVING、AVG；完整语句：SELECT cname AS '课程名', MAX(grade) AS '最高分' FROM Score GROUP BY cname HAVING AVG(grade) > 85;$q$,$q${"titleContent": "数据库 newtest 中现有学生表和成绩表，表结构如下：<br/>Student(stuid, name, sex)（学号、姓名、性别）<br/>Score(id, stuid, cname, grade)（编号、学号、课程名、分数）<br/><br/>编写 SQL 语句，按课程名进行分组，并从组内平均分高于 85 分的分组中、找出该课程的最高分，分别以“课程名”和“最高分数”为别名输出查询结果。<br/><br/>SELECT cname AS &#x27;课程名&#x27;, ________ AS &#x27;最高分&#x27;<br/>FROM ________<br/>GROUP BY cname<br/>________ ________ (grade) &gt; 85;", "analyze": "依次填 MAX(grade)、Score、HAVING、AVG；完整语句：SELECT cname AS &#x27;课程名&#x27;, MAX(grade) AS &#x27;最高分&#x27; FROM Score GROUP BY cname HAVING AVG(grade) &gt; 85;", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "MAX(grade)", "itemUuid": "00373366000000000000000000000000", "score": null}, {"prefix": "2", "content": "Score", "itemUuid": "00373366010000000000000000000000", "score": null}, {"prefix": "3", "content": "HAVING", "itemUuid": "00373366020000000000000000000000", "score": null}, {"prefix": "4", "content": "AVG", "itemUuid": "00373366030000000000000000000000", "score": null}]}$q$),
(373421,373661,$q$已知关系：student(sno, sname, ssex, saddress, classno)、course(cno, cname)、sc(sno, cno, degree)。

查询选修了 3 门以上课程的学生学号和课程数。

SELECT sno, COUNT(cno) FROM sc GROUP BY sno ________ ________ (cno) > 3;$q$,$q$HAVING；COUNT$q$,$q$依次填 HAVING、COUNT；完整语句：SELECT sno, COUNT(cno) FROM sc GROUP BY sno HAVING COUNT(cno) > 3;$q$,$q${"titleContent": "已知关系：student(sno, sname, ssex, saddress, classno)、course(cno, cname)、sc(sno, cno, degree)。<br/><br/>查询选修了 3 门以上课程的学生学号和课程数。<br/><br/>SELECT sno, COUNT(cno) FROM sc GROUP BY sno ________ ________ (cno) &gt; 3;", "analyze": "依次填 HAVING、COUNT；完整语句：SELECT sno, COUNT(cno) FROM sc GROUP BY sno HAVING COUNT(cno) &gt; 3;", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "HAVING", "itemUuid": "00373421000000000000000000000000", "score": null}, {"prefix": "2", "content": "COUNT", "itemUuid": "00373421010000000000000000000000", "score": null}]}$q$),
(379686,379926,$q$现有数据库 school 中有学生表 1（student1）、学生表 2（student2）等若干张表。

(1) 想将学生表 2 从数据库删除。请根据题意补全 SQL 语句。
________ ________ student2;

(2) 想快速清除 student1 中数据。
________ ________ student1;

(3) 想将数据库 school 删除。
________ ________ school;$q$,$q$DROP；TABLE；TRUNCATE；TABLE；DROP；DATABASE$q$,$q$（1）DROP TABLE student2；（2）TRUNCATE TABLE student1；（3）DROP DATABASE school。依次填 DROP、TABLE、TRUNCATE、TABLE、DROP、DATABASE。$q$,$q${"titleContent": "现有数据库 school 中有学生表 1（student1）、学生表 2（student2）等若干张表。<br/><br/>(1) 想将学生表 2 从数据库删除。请根据题意补全 SQL 语句。<br/>________ ________ student2;<br/><br/>(2) 想快速清除 student1 中数据。<br/>________ ________ student1;<br/><br/>(3) 想将数据库 school 删除。<br/>________ ________ school;", "analyze": "（1）DROP TABLE student2；（2）TRUNCATE TABLE student1；（3）DROP DATABASE school。依次填 DROP、TABLE、TRUNCATE、TABLE、DROP、DATABASE。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "DROP", "itemUuid": "00379686000000000000000000000000", "score": null}, {"prefix": "2", "content": "TABLE", "itemUuid": "00379686010000000000000000000000", "score": null}, {"prefix": "3", "content": "TRUNCATE", "itemUuid": "00379686020000000000000000000000", "score": null}, {"prefix": "4", "content": "TABLE", "itemUuid": "00379686030000000000000000000000", "score": null}, {"prefix": "5", "content": "DROP", "itemUuid": "00379686040000000000000000000000", "score": null}, {"prefix": "6", "content": "DATABASE", "itemUuid": "00379686050000000000000000000000", "score": null}]}$q$),
(384888,385128,$q$以下代码中，函数 funDel 的功能是：从给定的字符串 str 中删除全部字母 'f' 或 'F'。请根据已知的代码填空。

#include <stdio.h>

void funDel(char *str)
{
    int i, j;
    for (i = j = 0; str[i] != '\0'; i++)
        if (str[i] != 'f' ________ str[i] != 'F')
            str[________] = str[i];
    str[________] = '\0';
}

main()
{
    char str[100];
    printf("请输入一个字符串：");
    gets(str);
    printf("原字符串：");
    puts(str);
    funDel(str);
    printf("删除后的字符串：");
    puts(str);
    printf("\n\n");
    system("pause");
}$q$,$q$&&；j++；j$q$,$q$依次填 &&、j++、j：条件同时排除 f 和 F；只有保留字符时才写入并后移 j；最后补字符串结束符。$q$,$q${"titleContent": "以下代码中，函数 funDel 的功能是：从给定的字符串 str 中删除全部字母 &#x27;f&#x27; 或 &#x27;F&#x27;。请根据已知的代码填空。<br/><br/>#include &lt;stdio.h&gt;<br/><br/>void funDel(char *str)<br/>{<br/>    int i, j;<br/>    for (i = j = 0; str[i] != &#x27;\\0&#x27;; i++)<br/>        if (str[i] != &#x27;f&#x27; ________ str[i] != &#x27;F&#x27;)<br/>            str[________] = str[i];<br/>    str[________] = &#x27;\\0&#x27;;<br/>}<br/><br/>main()<br/>{<br/>    char str[100];<br/>    printf(&quot;请输入一个字符串：&quot;);<br/>    gets(str);<br/>    printf(&quot;原字符串：&quot;);<br/>    puts(str);<br/>    funDel(str);<br/>    printf(&quot;删除后的字符串：&quot;);<br/>    puts(str);<br/>    printf(&quot;\\n\\n&quot;);<br/>    system(&quot;pause&quot;);<br/>}", "analyze": "依次填 &amp;&amp;、j++、j：条件同时排除 f 和 F；只有保留字符时才写入并后移 j；最后补字符串结束符。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "&&", "itemUuid": "00384888000000000000000000000000", "score": null}, {"prefix": "2", "content": "j++", "itemUuid": "00384888010000000000000000000000", "score": null}, {"prefix": "3", "content": "j", "itemUuid": "00384888020000000000000000000000", "score": null}]}$q$),
(384892,385132,$q$以下程序中，函数 fun 的功能是：从 3 个红球、5 个白球、6 个黑球中任意取出 8 个为一组，进行输出。每组中可以没有黑球，但必须有红球和白球。组合数作为函数值返回。

#include <stdio.h>

int fun()
{
    int i, j, k, sum = 0;
    printf("\nThe result :\n\n");
    for (i = ________; i <= 3; i++) {
        for (j = 1; j <= 5; j++) {
            ________;
            if (k >= 0 ________ k <= 6) {
                sum = sum + 1;
                printf("red:%4d white:%4d black:%4d\n", i, j, k);
            }
        }
    }
    return sum;
}

main()
{
    int sum;
    sum = fun();
    printf("sum = %4d\n\n", sum);
    getchar();
}$q$,$q$1；k=8-i-j；&&$q$,$q$依次填 1、k=8-i-j、&&：红球至少 1 个；黑球数由总数 8 减去红、白球数；黑球数需在 0 到 6 之间。$q$,$q${"titleContent": "以下程序中，函数 fun 的功能是：从 3 个红球、5 个白球、6 个黑球中任意取出 8 个为一组，进行输出。每组中可以没有黑球，但必须有红球和白球。组合数作为函数值返回。<br/><br/>#include &lt;stdio.h&gt;<br/><br/>int fun()<br/>{<br/>    int i, j, k, sum = 0;<br/>    printf(&quot;\\nThe result :\\n\\n&quot;);<br/>    for (i = ________; i &lt;= 3; i++) {<br/>        for (j = 1; j &lt;= 5; j++) {<br/>            ________;<br/>            if (k &gt;= 0 ________ k &lt;= 6) {<br/>                sum = sum + 1;<br/>                printf(&quot;red:%4d white:%4d black:%4d\\n&quot;, i, j, k);<br/>            }<br/>        }<br/>    }<br/>    return sum;<br/>}<br/><br/>main()<br/>{<br/>    int sum;<br/>    sum = fun();<br/>    printf(&quot;sum = %4d\\n\\n&quot;, sum);<br/>    getchar();<br/>}", "analyze": "依次填 1、k=8-i-j、&amp;&amp;：红球至少 1 个；黑球数由总数 8 减去红、白球数；黑球数需在 0 到 6 之间。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "1", "itemUuid": "00384892000000000000000000000000", "score": null}, {"prefix": "2", "content": "k=8-i-j", "itemUuid": "00384892010000000000000000000000", "score": null}, {"prefix": "3", "content": "&&", "itemUuid": "00384892020000000000000000000000", "score": null}]}$q$);
UPDATE t_question q SET stem=e.stem, correct=e.correct, analysis=e.analysis, blank_count=array_length(string_to_array(e.correct,'；'),1)
FROM b7 e WHERE q.id=e.id AND NOT q.is_golden;
UPDATE t_text_content t SET content=e.content FROM b7 e WHERE t.id=e.tc_id;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN b7 e ON e.id=q.id
  WHERE q.stem=e.stem AND q.correct=e.correct AND q.analysis=e.analysis
    AND q.blank_count=array_length(string_to_array(e.correct,'；'),1);
 IF n<>6 THEN RAISE EXCEPTION '更新应为6，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content t JOIN b7 e ON t.id=e.tc_id
  WHERE t.content=e.content AND pg_input_is_valid(t.content,'json');
 IF n<>6 THEN RAISE EXCEPTION '文本应为6，实际%',n; END IF;
 SELECT count(*) INTO n FROM practice_answer WHERE question_id IN (371191,373366,373421,379686,384888,384892); IF n<>0 THEN RAISE EXCEPTION '有作答记录'; END IF;
 SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n<>44419 THEN RAISE EXCEPTION '活跃数'; END IF;
 SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n<>200 THEN RAISE EXCEPTION '金标数'; END IF;
END $$;
COMMIT;
