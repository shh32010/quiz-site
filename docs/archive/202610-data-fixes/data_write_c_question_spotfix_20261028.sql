-- 抽检高置信度修正（2026-10-28）
begin;
create table if not exists t_question_backup_20261028_spotfix as select * from t_question where id in (365021,367431,371909,371965,381511,382570);
update t_question set stem = $qt$88 以下程序的运行结果是______。

```c
#include <stdio.h>
int main()
{
    int a = 2, b = 3, c;
    c = a;
    if (a > b) c = 1;
    else if (a == b) c = 0;
    else c = -1;
    printf("%d
", c);
    return 0;
}
```$qt$ where id=365021 and not is_golden;
update t_question set stem = $qt$写一个 SQL 语句，查询选修了“计算机基础”的学生的学号和姓名：

```sql
SELECT sno, sname
FROM Student
WHERE sno IN (
    SELECT sno
    FROM Sc
    WHERE ____(SELECT cno FROM Course WHERE cname = '计算机基础')
);
```$qt$ where id=367431 and not is_golden;
update t_question set stem = $qt$阅读下面的程序，运行结果是（ ）。

```c
#include <stdio.h>
void main()
{
    int i, j;
    i = 010;
    j = 9;
    printf("%d,%d", i - j, i + j);
}
```$qt$, option_json = $qt${"A":"1,19","B":"-1,19","C":"1,17","D":"-1,17"}$qt$ where id=371909 and not is_golden;
update t_question set stem = $qt$对于条件表达式 (m)?(a+1):(a-1) 来说，其中的表达式 m 为真等价于（ ）。$qt$ where id=371965 and not is_golden;
update t_question set stem = $qt$强制类型转换有显式转换和隐式转换。正确错误$qt$, analysis = $qt$强制类型转换只包括显式转换，不包括隐式转换，故说法错误。$qt$ where id=381511 and not is_golden;
update t_question set stem = $qt$代数式 (3 + ab)/(c + d) 表示成 C 表达式为____$qt$ where id=382570 and not is_golden;
commit;
