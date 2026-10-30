-- 知识点 254 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_254
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_254 as
select * from t_knowledge_point where id in (30363,30428,30437,30468,30481,30510,30513,30514,30575,30586,30634,30662,30668,30669,31311,31728,31732,31758,31761,31848,32138,32182,32183,32184,32185,32186,32187,32188,32190,32191,32192,32193,32228,32245,32308,32309,32310);

update t_knowledge_point set title = $kp$循环计数示例与 SQL 练习$kp$, content = $kp$## 循环计数程序

从 101 开始输出整数，用 count 计数，每输出 10 个数换行：

```c
#include <stdio.h>

int main(void)
{
    int i, count = 0;

    for (i = 101; i <= 200; i++) {
        count++;
        printf("%d ", i);

        // 每十个数换行
        if (count % 10 == 0)
            printf("\n");
    }

    return 0;
}
```

## SQL 练习

6. 仅从 Websites 表的 country 列中选取唯一不同的值，即去掉 country 列的重复值：

```sql
SELECT DISTINCT country FROM Websites;
```

7. 选取 Websites 表中 name 以字母 k 结尾的记录中的第 2～30 条：

```sql
SELECT * FROM Websites
WHERE name LIKE '%k'
LIMIT 1, 29;
```

8. 向 Websites 表（name、url、alexa、country，字段均为字符型）插入一行，对应值为“百度”“https://www.baidu.com/”“4”“CN”：

```sql
INSERT INTO Websites (name, url, alexa, country)
VALUES ('百度', 'https://www.baidu.com/', '4', 'CN');
```$kp$, section = '' where id = 30363;
update t_knowledge_point set title = $kp$水仙花数$kp$, content = $kp$水仙花数是指一个三位数，其各位数字的立方和等于该数本身。例如 153 是水仙花数，因为 1、5、3 三个数字的立方和等于 153。

打印所有水仙花数的方法不唯一，可以使用多种方法实现。$kp$, section = '' where id = 30428;
update t_knowledge_point set title = $kp$do-while 循环执行过程示例$kp$, content = $kp$```c
int x = 7;
do {
    printf("*");
    x--;
} while (!(x % 2));
```

执行过程：

- 第 1 次：x = 7，输出一个 `*`，x 变为 6；判断 `!(6 % 2)`，即 `!0`，结果为 1，条件为真，继续循环。
- 第 2 次：x = 6，再输出一个 `*`，x 变为 5；判断 `!(5 % 2)`，即 `!1`，结果为 0，条件为假，循环结束。

因此循环体共执行两次，输出 2 个 `*`。$kp$, section = '' where id = 30437;
update t_knowledge_point set title = $kp$函数定义的一般形式$kp$, content = $kp$函数定义的一般形式为：返回类型 函数名(形参列表) { 声明部分; 语句部分; return 表达式; }。

- 形参列表中的每个形参都要分别写出类型，多个形参之间用逗号分隔。
- 函数体必须用一对花括号括起来。
- 有返回值的函数用 `return 表达式;` 将结果返回调用处。$kp$, section = '' where id = 30468;
update t_knowledge_point set title = $kp$for 语句表达式的省略规则$kp$, content = $kp$- 省略表达式 1：不执行初始化，直接执行表达式 2（条件判断）。
- 省略表达式 2：默认条件为真，循环会一直执行，需要用 break 等方式退出。
- 省略表达式 3：循环体执行后不执行增量，直接回到表达式 2。
- 表达式 1、2、3 都可以省略，但两个分号不能省略。`for (;;)` 表示无限循环。

```c
for (;;) {
    /* 无限循环 */
}
```$kp$, section = '' where id = 30481;
update t_knowledge_point set title = $kp$do-while 语句$kp$, content = $kp$形式：

```c
do {
    语句;
} while (条件);
```

说明：先执行循环体语句，再判断条件；条件为真时继续执行循环体，直到条件为假时循环结束。循环体至少执行一次。`while (条件);` 后的分号不能省略。

while 与 do-while 的区别：

1. while 语句先判断条件，后执行语句；do-while 语句先执行语句，后判断条件。
2. while 语句的循环体可能一次也不执行；do-while 语句的循环体至少执行一次。

例如计算 S = 1 + 2 + 3 + 4 + 5：

```c
int i = 1, s = 0;
do {
    s += i;
    i++;
} while (i <= 5);
```$kp$, section = '' where id = 30510;
update t_knowledge_point set title = $kp$指针变量的地址交换$kp$, content = $kp$```c
int a, b, *p, *q, *t;
p = &a;
q = &b;
scanf("%d%d", p, q);
t = p;
p = q;
q = t;
printf("%d, %d\n", *p, *q);
```

`p = &a`、`q = &b` 分别取 a、b 的地址。交换 p、q 中保存的地址后，p 指向 b，q 指向 a，因此按 `*p, *q` 输出时，结果的顺序与输入相反；a、b 本身的数值没有交换。

例如输入 `3 5`，输出 `5, 3`。$kp$, section = '' where id = 30513;
update t_knowledge_point set title = $kp$for 语句的一般形式$kp$, content = $kp$形式：

```c
for (初值; 条件; 增量)
    语句;
```

三个表达式分别表示：

- 式 1：初值，设置循环变量的初始值；
- 式 2：循环条件，决定是否继续循环；
- 式 3：增量，修改循环变量。

例如计算 S = 1 + 2 + 3 + 4 + 5：

```c
int i, s = 0;
for (i = 1; i <= 5; i++)
    s += i;
```$kp$, section = '' where id = 30514;
update t_knowledge_point set title = $kp$二分法求平方根$kp$, content = $kp$```c
#include <stdio.h>

int main(void)
{
    double num, temp;
    double lower_bound, upper_bound;
    int nCount = 30;

    scanf("%lf", &num);

    lower_bound = 0;    // 下界
    upper_bound = num;  // 上界

    while (nCount != 0) {
        temp = (lower_bound + upper_bound) / 2; // 求中间值
        if (temp * temp == num) {
            break;
        } else if (temp * temp > num) {
            upper_bound = temp;
        } else {
            lower_bound = temp;
        }
        nCount--; // 迭代次数递减
    }

    printf("%f\n", temp); // 输出平方根
    return 0;
}
```

在 `[0, num]` 区间内不断取中点，根据中点的平方与 num 的大小关系缩小区间；最多迭代 30 次，找到精确值时可提前结束。$kp$, section = '' where id = 30575;
update t_knowledge_point set title = $kp$break 语句与循环示例$kp$, content = $kp$## break 语句

形式：

```c
break;
```

功能：立即终止并跳出当前所在的循环。

```c
int i, s = 0;
for (i = 1; i <= 10; i++) {
    if (i > 5)
        break;
    s += i;
}
printf("%d\n", s);
```

当 i 增加到 6 时，`i > 5` 成立，执行 break 跳出循环，因此 s = 1 + 2 + 3 + 4 + 5 = 15。

## 用 while 循环求最大公约数

```c
int a = 18, b = 11;
while (a != b) {
    if (a > b)
        a -= b;
    else
        b -= a;
}
printf("%d,%d\n", a, b);
```

以 a = 18、b = 11 为例，循环过程中 a 依次变为 7、3、2、1，b 依次变为 4、1，最终 a = b = 1，输出 `1,1`。$kp$, section = '' where id = 30586;
update t_knowledge_point set title = $kp$程序设计题考试信息$kp$, content = $kp$五、程序设计题共 1 题，共计 14 分。

第 2 题（11.0 分）题号：431；第 1 题（14.0 分）题号：390。$kp$, section = '' where id = 30634;
update t_knowledge_point set title = $kp$字符序列翻译程序改错$kp$, content = $kp$输入字符序列，字符序列以特殊字符“#”结束。程序从前向后依次读入字符，并翻译出新的字符输出。

翻译规则：如果当前读入的字符是数字字符，且该字符的值为 n，则它的后一个字符（包括数字字符）需重复输出 n+1 次；如果当前读入的字符不是数字字符，则输出该字符。输出时，以上述一次翻译为一组，不同组之间用一个空白字符隔开。翻译直至当前读入的字符为 '#'，结束翻译和输出。

注意：不可以增加或删除程序行，也不可以更改程序的结构。$kp$, section = '' where id = 30662;
update t_knowledge_point set title = $kp$循环、数组与 SQL 题目解析$kp$, content = $kp$## do-while 循环

用 do-while 语句构成循环时，当 while 后的表达式为 0 时结束循环。循环既可以用 break 退出，也可以自然退出。do-while 语句构成的循环可以用其他语句构成的循环（for、while）代替。

## 二维数组

9. 答案：D。

解析：二维数组定义初始化时，第二维不可以缺少；第一维可以省略，但需要指定元素进行初始化；指定初始化元素不能超过下标个数。

## 字符串

10. 答案：A。

解析：`'\000'` 的值为 0，即结束符算一个字符；`strlen` 遇到它即结束，因此结果为 0。

```c
#include <stdio.h>
#include <string.h>

int main(void)
{
    char str[] = "\00012\\08ad\0bce";
    printf("%zu %zu\n", strlen(str), sizeof(str));
    return 0;
}
```

输出：

```text
0 13
```

## SQL

11. 答案：A。

解析：

```sql
SELECT studentName, sex, birthday
FROM tb_student
WHERE birthday >= '2000-01-01' AND birthday <= '2000-12-31';
```$kp$, section = '' where id = 30668;
update t_knowledge_point set title = $kp$程序设计题评分标准$kp$, content = $kp$（1）（2 分）输入的 n 不在 [1,10000] 范围时，输出正确。
（2）（8 分）for 循环正确。
（3）（3 分）正确求和。
（4）（2 分）输出语句正确。$kp$, section = '' where id = 30669;
update t_knowledge_point set title = $kp$统计链表长度核心代码$kp$, content = $kp$无头结点链表的核心代码：

```c
int count = 0;
p = head;              // 无头结点；若有头结点，则 p = head->next
while (p != NULL) {
    count++;
    p = p->next;
}
```

`p` 从第一个结点开始依次后移，每访问一个结点计数器加 1，直到 `p` 为 `NULL`，此时 `count` 即为链表长度。$kp$, section = '' where id = 31311;
update t_knowledge_point set title = $kp$while 循环属于哪种基本成分$kp$, content = $kp$C 语言中，while 循环语句属于高级语言四种基本成分中的：

A. 数据部分
B. 运算成分
C. 控制成分
D. 传输成分

答案：C。$kp$, section = '' where id = 31728;
update t_knowledge_point set title = $kp$控制成分$kp$, content = $kp$控制成分包括顺序结构、条件结构（if）和循环结构（for、while）。$kp$, section = '' where id = 31732;
update t_knowledge_point set title = $kp$循环嵌套$kp$, content = $kp$循环嵌套是指在一个循环的循环体内再包含另一个完整的循环结构。$kp$, section = '' where id = 31758;
update t_knowledge_point set title = $kp$continue 语句$kp$, content = $kp$- 功能：结束本次循环，接着判断是否继续下一次循环。
- continue 语句只能出现在 while、do-while、for 循环中。
- 作用范围：所在循环体从属的最内层循环，而不是外层的某个循环。$kp$, section = '' where id = 31761;
update t_knowledge_point set title = $kp$时间复杂度与空间复杂度$kp$, content = $kp$衡量算法的高效率与低存储量，主要看时间复杂度与空间复杂度。时间复杂度指算法执行的次数，而不是执行需要的时间；空间复杂度指算法所需的存储空间。$kp$, section = '' where id = 31848;
update t_knowledge_point set title = $kp$逗号表达式与 for 循环$kp$, content = $kp$for 语句的表达式 1 和表达式 3 可以使用逗号表达式，同时初始化或更新多个变量。例如：

```c
int a1, b = 2, c = 7, d = 5; // 定义变量
for (i = 0, j = 0; i < n; i++, j++) {
    /* 循环体 */
}
```$kp$, section = '' where id = 32138;
update t_knowledge_point set title = $kp$for 语句表达式 1 的作用$kp$, content = $kp$表达式 1 一般用于初始化变量（循环变量或其他变量），可以为空（缺省）；多个初始化表达式之间使用逗号分隔。

```c
for (i = 0, j = 0; i < n; i++, j++) {
    /* 循环体 */
}
```$kp$, section = '' where id = 32182;
update t_knowledge_point set title = $kp$while 循环的常见形式$kp$, content = $kp$while 循环的常见使用形式：

```c
while (i > 0) {
    sum += i;
    i--;
}
```$kp$, section = '' where id = 32183;
update t_knowledge_point set title = $kp$do-while 循环的常见形式$kp$, content = $kp$do-while 循环先执行一次循环体，再判断条件：

```c
do {
    sum += i;
    i--;
} while (i > 0);
```$kp$, section = '' where id = 32184;
update t_knowledge_point set title = $kp$continue 语句的使用场景$kp$, content = $kp$continue 语句用于在 for、while 和 do-while 循环中提前结束本轮循环，只能出现在循环结构中。$kp$, section = '' where id = 32185;
update t_knowledge_point set title = $kp$for 循环中的 continue$kp$, content = $kp$continue 出现在 for 循环的循环体中：

```c
for (表达式1; 表达式2; 表达式3) {
    continue;
}
```

遇到 continue 时，停止执行循环体中后面的语句，转去执行表达式 3。$kp$, section = '' where id = 32186;
update t_knowledge_point set title = $kp$while 循环中的 continue$kp$, content = $kp$```c
while (表达式1) {
    continue;
}
```

遇到 continue 时，停止执行循环体中后面的语句，转去判断表达式 1（循环条件）。$kp$, section = '' where id = 32187;
update t_knowledge_point set title = $kp$do-while 循环中的 continue$kp$, content = $kp$```c
do {
    continue;
} while (表达式1);
```

遇到 continue 时，停止执行循环体中后面的语句，转去判断表达式 1（循环条件）。$kp$, section = '' where id = 32188;
update t_knowledge_point set title = $kp$break 语句的作用$kp$, content = $kp$在循环体中，break 用于终止所在整个循环；在 switch 语句中，break 用于退出当前 switch 语句。break 可以出现在循环结构（for、while、do-while）中，也可以出现在 switch 语句中。$kp$, section = '' where id = 32190;
update t_knowledge_point set title = $kp$for 循环中的 break$kp$, content = $kp$```c
for (表达式1; 表达式2; 表达式3) {
    break;
}
```

执行遇到 break 时，退出当前 for 循环结构。$kp$, section = '' where id = 32191;
update t_knowledge_point set title = $kp$while 循环中的 break$kp$, content = $kp$```c
while (表达式1) {
    break;
}
```

执行遇到 break 时，退出当前 while 循环结构。$kp$, section = '' where id = 32192;
update t_knowledge_point set title = $kp$do-while 循环中的 break$kp$, content = $kp$```c
do {
    break;
} while (表达式1);
```

执行遇到 break 时，退出当前 do-while 循环结构。$kp$, section = '' where id = 32193;
update t_knowledge_point set title = $kp$循环嵌套中的 break 与一维数组$kp$, content = $kp$在循环嵌套中，break 只能退出 break 所在循环体所属的那一层循环，不会退出外层循环。

## 一维数组的引用

（5）每一个元素都可以看成一个变量。

```c
int a[10];
a[10] = 0; // 下标越界，运行会报错
```

（6）数组元素引用之后可以进行各种运算操作，比如算术运算、逻辑运算等。

```c
int a = 10;
int b[10] = {0};
b[0] = a;          // 给数组 b 的第一个元素赋值
b[9] = a + b[0];   // 将数组元素参与运算
```

（7）一维数组名是数组的首地址。数组名不能单独引用，不能通过一个数组名代表全部元素；不能对数组名赋值，所以 a 为数组名时，`a++` 是错误的。但数组名可以作为地址与一个整数相加得到一个新地址；一维数组名加减数字时表示水平移动（列上移动）。

```c
int a[10] = {0};
printf("%p", (void *)a);  // a 表示首地址，输出内存地址
printf("%d", *(a + 1));   // *(a+1) 等价于 a[1]；a+1 表示 a[1] 的地址，* 是取值运算符
```$kp$, section = '' where id = 32228;
update t_knowledge_point set title = $kp$break 与 continue 语句$kp$, content = $kp$- break 语句：可以结束 switch 结构和三种循环。
- continue 语句：结束本次循环，即忽略循环体中剩余的语句。$kp$, section = '' where id = 32245;
update t_knowledge_point set title = $kp$循环结构程序设计概述$kp$, content = $kp$## 为什么需要循环控制

在日常生活和程序处理的问题中，常常遇到需要重复处理的问题，例如：

- 向计算机输入全班 50 个学生的成绩；
- 分别统计全班 50 个学生的平均成绩；
- 求 30 个整数之和；
- 检查 30 个学生的成绩是否及格。

例如，统计每名学生三门课的平均成绩，需要对每个学生重复执行：

```c
scanf("%f,%f,%f", &s1, &s2, &s3);
aver = (s1 + s2 + s3) / 3;
printf("aver=%7.2f", aver);
```

50 名学生就要重复 50 次。循环结构、顺序结构和选择结构是结构化程序设计的三种基本结构，是各种复杂程序的基本构造单元。

## 用 while 语句实现循环

while 循环先判断条件，条件为真时执行循环体。例如：

```c
i = 1;
sum = 0;
while (i <= 100) {
    sum = sum + i;
    i++;          // 不能丢，否则循环永不结束
}
printf("sum=%d\n", sum);
```

## 用 do-while 语句实现循环

do-while 语句先无条件执行一次循环体，再判断循环条件是否成立。一般形式：

```c
do
    语句;
while (表达式);
```

例如用 do-while 求 1 + 2 + 3 + … + 100：

```c
i = 1;
sum = 0;
do {
    sum = sum + i;
    i++;
} while (i <= 100);
```

## 用 for 语句实现循环

一般形式：

```c
for (表达式1; 表达式2; 表达式3)
    语句;
```

- 表达式 1：设置初始条件，只执行一次，可以为零个、一个或多个变量设置初值。
- 表达式 2：循环条件表达式，用来判定是否继续循环，在每次执行循环体前先执行。
- 表达式 3：循环的调整器，例如使循环变量增值，在每次执行完循环体后执行。
- 循环结束后，执行 for 语句下面的一个语句。$kp$, section = '' where id = 32308;
update t_knowledge_point set title = $kp$for 循环结束后的执行流程$kp$, content = $kp$for 循环结束后，程序继续执行 for 语句下面的一个语句。如果在循环体中执行 break，则提前终止循环，同样转去执行 for 语句下面的一个语句。

```c
for (i = 1; i <= n; i++) {
    /* 循环体 */
}
```$kp$, section = '' where id = 32309;
update t_knowledge_point set title = $kp$break、continue 与循环嵌套$kp$, content = $kp$## 用 break 语句提前终止循环

break 语句可以从循环体内跳出循环体，即提前结束循环，接着执行循环下面的语句。break 只能用于循环语句和 switch 语句之中，不能单独使用。

例 5.4：在全系 1000 名学生中征集慈善募捐，当总数达到 10 万元时就结束，统计此时捐款的人数以及平均每人捐款的数目。

编程思路：

- 循环次数不确定，但最多循环 1000 次；
- 在循环体中累计捐款总数；
- 用 if 语句检查是否达到 10 万元；
- 如果达到就不再继续执行循环，终止累加；
- 计算人均捐款数。

变量 amount 存放捐款数，total 存放累计总捐款数，aver 存放人均捐款数，符号常量 SUM 代表 100000。

```c
#include <stdio.h>
#define SUM 100000

int main(void)
{
    float amount, aver, total;
    int i;

    for (i = 1, total = 0; i <= 1000; i++) {
        printf("please enter amount:");
        scanf("%f", &amount);
        total = total + amount;
        if (total >= SUM)
            break;          // 达到 10 万，提前结束循环
    }

    aver = total / i;        // i 为实际捐款人数
    printf("num=%d\naver=%10.2f\n", i, aver);
    return 0;
}
```

## 用 continue 语句提前结束本次循环

有时并不希望终止整个循环，而只希望提前结束本次循环，接着执行下次循环，这时可以使用 continue 语句。continue 只结束本次循环；break 则强行退出整个循环。

例 5.5：输出 100～200 之间不能被 3 整除的数。

编程思路：对 100 到 200 之间的每一个整数进行检查，不能被 3 整除就输出，否则不输出；无论是否输出，都要接着检查下一个数，直到 200 为止。

```c
for (n = 100; n <= 200; n++) {
    if (n % 3 == 0)
        continue;
    printf("%d ", n);
}
```

## 循环的嵌套

例 5.6：输出以下 4×5 的矩阵。

```text
1  2  3  4  5
2  4  6  8 10
3  6  9 12 15
4  8 12 16 20
```

解题思路：用循环的嵌套处理，外循环输出一行数据，内循环输出一列数据，按每行 5 个数据的矩阵格式输出。

```c
#include <stdio.h>

int main(void)
{
    int i, j, n = 0;

    for (i = 1; i <= 4; i++) {
        for (j = 1; j <= 5; j++) {
            printf("%d\t", i * j);
            n = n + 1;
            if (n % 5 == 0)
                printf("\n");
        }
    }
    return 0;
}
```

## 求 π 的近似值

例 5.7：用公式 π/4 ≈ 1 - 1/3 + 1/5 - 1/7 + … 求 π 的近似值。

```c
#include <stdio.h>
#include <math.h>

int main(void)
{
    int sign = 1;
    double pi = 0, n = 1, term = 1;

    while (fabs(term) >= 1e-6) {
        pi = pi + term;
        n = n + 2;
        sign = -sign;
        term = sign / n;
    }
    pi = pi * 4;
    printf("pi=%10.8f\n", pi);
    return 0;
}
```

`fabs` 是求绝对值的函数。取 `1e-6` 时只保证前 5 位小数是准确的；将条件改为 `1e-8` 可以提高精度。

## 求 Fibonacci 数列

例 5.8：求费波那西（Fibonacci）数列的前 40 个数。数列的第 1、2 个数为 1、1，从第 3 个数开始，每个数都是其前面两个数之和。

古典问题：有一对兔子，从出生后第 3 个月起每个月都生一对兔子；小兔子长到第 3 个月后每个月又生一对兔子。假设所有兔子都不死，问每个月的兔子总数为多少？

```c
#include <stdio.h>

int main(void)
{
    int f1 = 1, f2 = 1, f3;
    int i;

    printf("%12d\n%12d\n", f1, f2);
    for (i = 1; i <= 38; i++) {
        f3 = f1 + f2;
        printf("%12d\n", f3);
        f1 = f2;
        f2 = f3;
    }
    return 0;
}
```

## 输出 100～200 之间的素数

```c
#include <stdio.h>
#include <math.h>

int main(void)
{
    int n, k, i, m = 0;

    for (n = 101; n <= 200; n += 2) {
        k = (int)sqrt(n);
        for (i = 2; i <= k; i++)
            if (n % i == 0)
                break;
        if (i >= k + 1) {
            printf("%d ", n);
            m = m + 1;
            if (m % 10 == 0)
                printf("\n");
        }
    }
    printf("\n");
    return 0;
}
```

## 译密码

例 5.11：为使电文保密，往往按一定规律将其转换成密码，收报人再按约定的规律将其译回原文。非字母字符保持原状不变。输入一行字符，要求输出其相应的密码。$kp$, section = '' where id = 32310;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30363,30428,30437,30468,30481,30510,30513,30514,30575,30586,30634,30662,30668,30669,31311,31728,31732,31758,31761,31848,32138,32182,32183,32184,32185,32186,32187,32188,32190,32191,32192,32193,32228,32245,32308,32309,32310) and not deleted) <> 37 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
