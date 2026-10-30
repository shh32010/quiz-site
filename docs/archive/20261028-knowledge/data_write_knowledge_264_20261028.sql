-- 知识点 264 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_264
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_264 as
select * from t_knowledge_point where id in (30320,30434,30464,30479,30495,30504,30516,30521,30524,30525,30529,30542,30545,30573,30574,30576,30577,30582,30590,30591,30592,30606,30615,30617,30618,30632,30636,30638,30639,30657,30658,30664,31111,31306,31399,31400,31583,31660,31661,31662,31663,31730,31770,31772,31773,31774,31775,31816,31817,31819,31867,31880,31900,31922,31932,31933,31934,31935,32093,32112,32119,32120,32162,32164,32165,32215,32216,32217,32222,32230,32249,32250,32251,32252,32253,32254,32270,32271,32272,32322,32323,32324,32325,32326,32327,32328,32329,32330,32332,32333,32334,32444,32487,32709,32710,32711);

update t_knowledge_point set title = $kp$编程题：用函数实现三个数排序$kp$, content = $kp$题目：编写函数实现两个数据的交换，在主函数中输入任意三个数据，调用函数对这三个数据从大到小排序。

注意：部分源程序给出如下。请勿改动主函数 main 和其它函数中的任何内容，仅在函数的花括号中填入所编写的若干语句。$kp$, section = '' where id = 30320;
update t_knowledge_point set title = $kp$删除有序数组中的重复元素$kp$, content = $kp$```c
// 函数首部：形参是数组和长度
int del(int array[], int n)
{
    int i, j;
    for (i = 0; i < n - 1; i++)
    {
        // 判断当前元素是否与后面一个元素相同，若相同则删除
        if (array[i] == array[i + 1])
        {
            for (j = i + 1; j < n; j++)
                array[j - 1] = array[j];   // 将后面所有元素向前移一位
            n--;                           // 移动之后，整个数组的长度减 1
            i--;                           // 继续用 array[i] 与之后的 array[i+1] 比较
        }
    }
    return n;
}

int main(void)
{
    int a[] = {2, 2, 2, 3, 4, 4, 5, 6, 6, 6, 7, 8, 9, 9, 10, 10, 10, 10};
    int n = del(a, sizeof(a) / sizeof(a[0]));   // 函数调用，传递数组名和数组长度
    int i;

    for (i = 0; i < n; i++)
        printf("%d ", a[i]);
    printf("\n");
    system("pause");

    return 0;
}
```$kp$, section = '' where id = 30434;
update t_knowledge_point set title = $kp$选择题：以下正确的函数定义$kp$, content = $kp$13. 以下正确的函数定义是（ ）。

在下列运算符中，优先级最低的运算符是（ ）。$kp$, section = '' where id = 30464;
update t_knowledge_point set title = $kp$专转本模拟卷答案与解析$kp$, content = $kp$13. 答案：C

解析：a 是数组名，不能使用 ++ 或赋值。

```c
int a[5] = {1, 2, 3, 4, 5};
printf("%d\n", &a);       // a[0] 的地址
printf("%d\n", a + 2);    // a[2] 的地址
// printf("%d\n", a++);   // 编译不通过
printf("%d\n", &a[0]);
```

14. 答案：B

解析：&a[2] 是指从元素值为 4 的地址开始传递。在 f 函数里 b 接收到的是 4、5、6、7、8、9，n 的值是 2，所以 r = r * b[0] * b[1] * b[2] = 4 * 5 * 6 = 120。

15. 答案：A

解析：

- 选项 A 正确，单向传递。调用函数时，只能把实参的值传送给形参，形参的值不能传回给实参，属于单向传递。
- 选项 B 错误。标准 C 语言中，函数不可以嵌套定义，但是可以递归调用。
- 选项 C 错误。函数不一定都要有返回值，void 类型的函数就不需要有返回值。
- 选项 D 错误。C 程序中有定义并实现的函数并不一定都需要放在程序文件中，比如调用库函数时，库函数的定义和实现并不一定需要放在程序文件中。

16. 答案：C

解析：

```c
fun((a++, b++, a + b), c++);
= fun((2, 3, 2 + 3), 3)   // 逗号表达式的值为最后一个表达式的值
= fun(5, 3)
= 5 + 3
= 8
```

17. 答案：A

解析：WPA 和 WPA2 都采用 TKIP（本质是 WEP 补丁）或者 AES（对称、高级加密标准）加密方式，比 WEP 的加密级别高，因而更安全。

18. 答案：C

解析：SSID 是个笼统的概念，包含了 ESSID 和 BSSID，用来区分不同的网络，最多可以有 32 个字符（数字、字母等，有些设备支持中文）。无线网卡设置了不同的 SSID 就可以进入不同网络，SSID 通常由 AP 广播出来，通过操作系统自带的扫描功能可以查看当前区域内的 SSID。$kp$, section = '' where id = 30479;
update t_knowledge_point set title = $kp$形参与实参的要点$kp$, content = $kp$注意：形参变量属于被调函数的局部变量，实参变量属于主调函数的局部变量。

说明：

① 函数应先定义后使用。
② C 源程序开始于主函数，同时结束于主函数。
③ 实参负责传递，形参负责接收，函数调用时将实参赋给对应的形参。$kp$, section = '' where id = 30495;
update t_knowledge_point set title = $kp$变量的存储类总结$kp$, content = $kp$① auto 自动型，默认类型，属于动态局部变量。
② register 寄存器型。
③ static 静态型：内部变量、内部函数，仅允许当前文件使用；用于局部变量时为静态局部变量。
④ extern 外部变量、外部函数，允许其他文件使用（全局变量）。

其中 ①② 为动态存储方式，③④ 为静态存储方式。

| 静态局部变量、全局变量或外部变量 | 动态变量 |
| --- | --- |
| 初始化在编译时进行，初值为 0 | 初值为随机值 |

- 生存期：静态存储和动态存储。
- 作用域：全局变量和局部变量。
- 全局变量全部存放在静态存储区。
- 形参：被调函数的局部变量，形参不可以是常量；其存储单元是动态分配的。
- 实参：主调函数的局部变量。$kp$, section = '' where id = 30504;
update t_knowledge_point set title = $kp$值传递：交换形参不影响实参$kp$, content = $kp$设 a、b 的值分别为 3、5，调用 `fun(a, b)` 后，函数内对形参的修改不会影响实参。

```c
xx = xx + xy;   // 3 + 5 = 8
xy = xy + xx;   // 5 + 8 = 13
```

交换函数（值传递，交换无效）：

```c
void fun(int xx, int xy)
{
    int t;
    t = xx;
    xx = xy;
    xy = t;
}
```

main 函数调用 fun(a, b) 后，a、b 的值仍为 3、5。$kp$, section = '' where id = 30516;
update t_knowledge_point set title = $kp$函数调用的计算示例$kp$, content = $kp$6 × 6 + 2 × 2 = 36 + 4 = 40

f(a + b) = ______ = 20$kp$, section = '' where id = 30521;
update t_knowledge_point set title = $kp$求两个整数中的最大值$kp$, content = $kp$```c
int max(int x, int y)
{
    int z;
    if (x > y)
        z = x;
    else
        z = y;
    return(z);
}

int main(void)
{
    int a, b, c;
    scanf("%d,%d", &a, &b);
    c = max(a, b);
    printf("max=%d\n", c);
    return 0;
}
```$kp$, section = '' where id = 30524;
update t_knowledge_point set title = $kp$函数调用与返回的过程$kp$, content = $kp$main 调用 fun：把 a、b 的值传给 x、y，fun 返回结果并赋给 s（s = z）。

调用关系：main → fun → 返回 main。$kp$, section = '' where id = 30525;
update t_knowledge_point set title = $kp$数组作为函数参数$kp$, content = $kp$数组作为函数参数时：

- 实参是数组名，数组需要定义长度；
- 形参可以写成数组或指针，不需要定义长度。$kp$, section = '' where id = 30529;
update t_knowledge_point set title = $kp$学生成绩文件排序程序$kp$, content = $kp$```c
#include <stdio.h>
#include <stdlib.h>

#define N 100

typedef struct scores
{
    char No[32];
    char name[32];
    int score1;
    int score2;
    int score3;
    float aveScore;
} SCORES;

int readerNumberOfStudent(FILE *fp);
void sortScoreByAvg(SCORES studentScore[], int n);   // 按平均分排序
void printScores(SCORES studentScore[], int n);      // 输出成绩
void readerScore(FILE *fp, SCORES studentScore[], int n);
void writerScore(FILE *fp, SCORES studentScore[], int n);
void filterTitle(FILE *fp);

int main(void)
{
    FILE *fpIn, *fpOut;
    char in_file_name[80], out_file_name[80];
    SCORES *studentScore;
    int n, i;

    scanf("%s", in_file_name);
    scanf("%s", out_file_name);

    fpIn = fopen(in_file_name, "r");
    if (fpIn == NULL)
    {
        printf("Can't open %s.\n", in_file_name);
        return 1;
    }

    n = readerNumberOfStudent(fpIn);
    filterTitle(fpIn);

    studentScore = (SCORES *)malloc(sizeof(SCORES) * n);
    if (studentScore == NULL)
        return 1;

    readerScore(fpIn, studentScore, n);
    sortScoreByAvg(studentScore, n);
    fclose(fpIn);

    fpOut = fopen(out_file_name, "wb");
    if (fpOut == NULL)
        return 1;

    writerScore(fpOut, studentScore, n);
    fclose(fpOut);

    fpOut = fopen(out_file_name, "rb");
    if (fpOut == NULL)
        return 1;

    for (i = 0; i < n; i++)
    {
        fread(&studentScore[i], sizeof(SCORES), 1, fpOut);
    }

    if (fclose(fpOut))
    {
        printf("result file close is error!\n");
        exit(1);
    }

    printf("\n\noutput the scores in sortedScore.bat file written by students\n");
    for (i = 0; i < n; i++)
    {
        printf("%s %s %0.1f\n", studentScore[i].No, studentScore[i].name,
               studentScore[i].aveScore);
    }

    free(studentScore);

    return 0;
}

int readerNumberOfStudent(FILE *fp)
{
    int num;
    fscanf(fp, "%d", &num);
    fgetc(fp);
    return num;
}

void sortScoreByAvg(SCORES studentScore[], int n)
{
    int i, j, k;
    SCORES temp;

    for (i = 0; i < n - 1; i++)
    {
        k = i;
        for (j = i + 1; j < n; j++)
        {
            if (studentScore[k].aveScore < studentScore[j].aveScore)
            {
                k = j;
            }
        }
        if (k != i)
        {
            temp = studentScore[k];
            studentScore[k] = studentScore[i];
            studentScore[i] = temp;
        }
    }
}

void printScores(SCORES studentScore[], int n)
{
    int i;
    for (i = 0; i < n; i++)
    {
        printf("%s %s %d %d %d %0.1f\n", studentScore[i].No, studentScore[i].name,
               studentScore[i].score1, studentScore[i].score2,
               studentScore[i].score3, studentScore[i].aveScore);
    }
}

void readerScore(FILE *fp, SCORES studentScore[], int n)
{
    int i;
    for (i = 0; i < n; i++)
    {
        fscanf(fp, "%s %s %d %d %d", studentScore[i].No, studentScore[i].name,
               &studentScore[i].score1, &studentScore[i].score2,
               &studentScore[i].score3);

        studentScore[i].aveScore = (studentScore[i].score1 +
                                    studentScore[i].score2 +
                                    studentScore[i].score3) / 3.0;
    }
}

void writerScore(FILE *fp, SCORES studentScore[], int n)
{
    int i;
    for (i = 0; i < n; i++)
    {
        fwrite(&studentScore[i], sizeof(SCORES), 1, fp);
    }
}

void filterTitle(FILE *fp)
{
    int ch;
    while ((ch = fgetc(fp)) != '\n' && ch != EOF)
        ;
}
```$kp$, section = '' where id = 30542;
update t_knowledge_point set title = $kp$用函数指针调用 qsort 排序$kp$, content = $kp$```c
#include <stdio.h>
#include <stdlib.h>

#define N 5

struct student
{
    long num;
    char name[20];
    float score;
};

int greater(const void *p, const void *q);
int lessthan(const void *p, const void *q);
void input_student(struct student a[], int n);
void output_student(struct student a[], int n);

int main(void)
{
    struct student CIE_CS[N];
    int (*fun)(const void *p, const void *q);

    input_student(CIE_CS, N);

    printf("Sort results with descending order:\n");
    fun = greater;
    qsort(CIE_CS, N, sizeof(struct student), fun);
    output_student(CIE_CS, N);

    printf("Sort results with ascending order:\n");
    fun = lessthan;
    qsort(CIE_CS, N, sizeof(struct student), fun);
    output_student(CIE_CS, N);

    return 0;
}

int greater(const void *p, const void *q)
{
    const struct student *x = p;
    const struct student *y = q;
    return (x->score < y->score) - (x->score > y->score);
}

int lessthan(const void *p, const void *q)
{
    const struct student *x = p;
    const struct student *y = q;
    return (x->score > y->score) - (x->score < y->score);
}

void input_student(struct student a[], int n)
{
    int i;
    for (i = 0; i < n; i++)
        scanf("%ld %s %f", &a[i].num, a[i].name, &a[i].score);
}

void output_student(struct student a[], int n)
{
    int i;
    for (i = 0; i < n; i++)
        printf("%ld %s %.1f\n", a[i].num, a[i].name, a[i].score);
}
```

说明：`greater` 返回正数时表示 p 排在 q 之后，因此按成绩降序排列；`lessthan` 则按成绩升序排列。$kp$, section = '' where id = 30545;
update t_knowledge_point set title = $kp$形参与实参的使用示例$kp$, content = $kp$```c
int max(int x, int y)      // 形式参数
{
    int z;
    if (x > y)
        z = x;
    else
        z = y;
    return(z);
}

int main(void)
{
    int a, b, c;           // 实际参数
    scanf("%d,%d", &a, &b);
    c = max(a, b);
    printf("max=%d\n", c);
    return 0;
}
```$kp$, section = '' where id = 30573;
update t_knowledge_point set title = $kp$十进制转二进制（数组存余数）$kp$, content = $kp$```c
int fun(int a[], int num)
{
    int r, k = 0;
    do {
        r = num % 2;
        a[k] = r;          // 顺序存放转换后的数
        k++;
        num = num / 2;     // 保留商
    } while (num != 0);
    return k;
}

int main(void)
{
    int n, a[10], k, i;
    scanf("%d", &n);
    k = fun(a, n);                 // 调用转换函数
    for (i = k - 1; i >= 0; i--)   // 逆序输出
        printf("%d", a[i]);
    system("pause");
    return 0;
}
```$kp$, section = '' where id = 30574;
update t_knowledge_point set title = $kp$函数声明与定义示例$kp$, content = $kp$```c
#include <stdio.h>

int max(int x, int y);   // 函数声明

int main(void)
{
    int a, b, c;
    scanf("%d,%d", &a, &b);
    c = max(a, b);
    printf("max=%d\n", c);
    return 0;
}

int max(int x, int y)
{
    int z;
    if (x > y)
        z = x;
    else
        z = y;
    return(z);
}
```$kp$, section = '' where id = 30576;
update t_knowledge_point set title = $kp$先声明后调用的求最大值程序$kp$, content = $kp$```c
#include <stdio.h>

int main(void)
{
    int max(int x, int y);   // 在 main 内部声明
    int a, b, c;

    scanf("%d,%d", &a, &b);
    c = max(a, b);
    printf("max=%d\n", c);
    return 0;
}

int max(int x, int y)
{
    int z;
    if (x > y)
        z = x;
    else
        z = y;
    return(z);
}
```$kp$, section = '' where id = 30577;
update t_knowledge_point set title = $kp$取位并重组数字的函数$kp$, content = $kp$函数 fun 的形参和返回值类型为 unsigned long，其处理逻辑是：

- 循环中依次取出各位数字：`t = n % 10;`，`n = n / 10;`；
- 用 `v = v * 10 + t;` 把取出的数字重新组合；
- main 中提示输入 0 < n < 10000000 的正整数，并调用 fun 输出结果。

```c
unsigned long fun(unsigned long n)
{
    unsigned long v = 0;
    int t;

    while (n) {
        t = n % 10;          // 取出当前位上的数
        v = v * 10 + t;      // 组合起来
        n = n / 10;
    }
    return v;
}
```$kp$, section = '' where id = 30582;
update t_knowledge_point set title = $kp$函数定义与调用的基本形式$kp$, content = $kp$```c
int fun(int x, int y)   // 决定返回值类型
{
    int z;
    z = x + y;
    return z;           // 返回结果
}

int main(void)          // 主函数
{
    int a = 3, b = 5, s;
    s = fun(a, b);      // 实参
    printf("%d\n", s);
    return 0;
}
```

形参 x、y 与实参 a、b 一一对应，return 将结果返回给调用处，赋给 s。$kp$, section = '' where id = 30590;
update t_knowledge_point set title = $kp$函数声明（说明）的形式$kp$, content = $kp$函数定义：

```c
float fun(float x, float y)
{
    return x + y;
}
```

函数声明（说明）的形式：

```c
float fun(float x, float y);
```

有了函数声明，函数定义可以放在调用之后。$kp$, section = '' where id = 30591;
update t_knowledge_point set title = $kp$函数调用的三种形式$kp$, content = $kp$1. 语句调用：`fun(a, b);`
2. 表达式调用：`y = fun(x);`，函数返回值作为表达式的一部分参与运算。
3. 函数参数调用（嵌套调用）：把一次函数调用的返回值作为另一次调用的实参。

```c
int fun(int x, int y)
{
    return x + y;
}

int main(void)
{
    int a = 3, b = 2, c = 5, d;
    d = fun(fun(a, b), c);   // 先调用 fun(a, b) 得到 5，再调用 fun(5, c)
    printf("%d\n", d);
    return 0;
}
```

输出结果为 10。$kp$, section = '' where id = 30592;
update t_knowledge_point set title = $kp$全局变量的作用域$kp$, content = $kp$在函数外部定义的变量称为全局变量。其作用域从定义位置起，到整个程序结束。

```c
int a = 3;             // 全局变量

int main(void)
{
    int s = 0;
    {
        int a = 5;     // 局部变量，只在块内隐藏全局变量 a
    }
    s += a++;          // s = s + a++ = 0 + 3 = 3，a 变为 4
    s += a + 1;        // s = s + a + 1 = 3 + 4 + 1 = 8
    printf("%d\n", s); // 输出 8
    return 0;
}
```$kp$, section = '' where id = 30606;
update t_knowledge_point set title = $kp$C 语言函数重点概念$kp$, content = $kp$1. 函数是构成 C 程序的基本单位，语句是最小单位。
2. C 程序开始于主函数，同时结束于主函数，主函数的位置是任意的。
3. 实参的类型可以与形参的类型不一致，以形参的类型为准。
4. 实参与形参各占用独立的存储单元。形参必须逐个指定类型，如 `int x, int y`，不能写成 `int x, y`。
5. 形参单独定义，属于临时变量，调用函数时为其分配存储单元，函数调用结束后释放其存储单元。
6. 函数应先定义后调用。
7. 函数可以嵌套调用，但不可以嵌套定义（须单独定义）。
8. 函数默认的类型为 int 型。
9. 函数返回值的类型由定义函数时所指定的函数类型决定。
10. 函数直接或间接地调用自己称为递归调用，分为直接递归和间接递归。
11. main() 函数（主函数）不能调用自己，其他函数都可以调用自己。
12. 通过 return 语句，函数只能带回一个返回值；void 表示函数无返回值。
13. 函数的实参传递分为值传递和地址传递。

### 递归调用

函数直接或间接地调用自己，称为函数的递归调用。递归分为直接递归和间接递归。

```c
int fun(int x)
{
    int y;
    if (x > 1)
        y = fun(x - 1) + 2;
    else
        y = 2;
    return y;
}

int main(void)
{
    printf("%d\n", fun(3));
    return 0;
}
```

调用过程：

- fun(3)：x = 3，y = fun(2) + 2 = 6
- fun(2)：x = 2，y = fun(1) + 2 = 4
- fun(1)：x = 1，y = 2

输出结果为 6。递归调用最终必须到达一个确定的结束条件。$kp$, section = '' where id = 30615;
update t_knowledge_point set title = $kp$函数的返回值与 return 语句$kp$, content = $kp$return 语句有两种形式，二者意义相同：

```c
return(表达式);
return 表达式;
```

① 编写函数 fun，返回形参 x 的绝对值：

```c
int fun(int x)
{
    if (x >= 0)
        return (x);
    else
        return (-x);
}
```

② 编写函数 fun，返回形参 x 和形参 y 中的较大者：

```c
float fun(float x, float y)
{
    return x > y ? x : y;
}
```

其中 `x > y ? x : y` 是条件运算符。$kp$, section = '' where id = 30617;
update t_knowledge_point set title = $kp$函数调用的语法要求$kp$, content = $kp$① 先定义，后调用。
② 若函数首部省略类型，默认为 int。$kp$, section = '' where id = 30618;
update t_knowledge_point set title = $kp$函数指针的声明$kp$, content = $kp$```c
int (*p)();
```

说明：p 是指向返回值为整型函数的指针。$kp$, section = '' where id = 30632;
update t_knowledge_point set title = $kp$例：求两个整数中的较大者$kp$, content = $kp$例 1.3 求两个整数中的较大者。

解题思路：

- 用一个函数实现求两个整数中的较大者；
- 在主函数中调用此函数并输出结果。$kp$, section = '' where id = 30636;
update t_knowledge_point set title = $kp$函数之间的地址传递$kp$, content = $kp$地址传递是双向的：实参传地址，形参用指针接收。

```c
void fun(int *x, int *y)
{
    int t = *x;
    *x = *y;
    *y = t;
}

int main(void)
{
    int a = 3, b = 5;
    fun(&a, &b);
    printf("%d,%d\n", a, b);   // 输出 5,3
    return 0;
}
```

说明：实参向形参传数值时，形参用变量接收；传地址时，形参用指针接收。$kp$, section = '' where id = 30638;
update t_knowledge_point set title = $kp$指针函数与数组名$kp$, content = $kp$指针函数的形式：

```c
int *p();
```

说明：p 是返回值为整型指针的函数，“指针”写在函数名之前。

注意：

- 不能对整型数组进行整体输入输出；
- 数组名本身就是地址（后面没有下标时），不需要再加 &。$kp$, section = '' where id = 30639;
update t_knowledge_point set title = $kp$无返回值、无参数的函数$kp$, content = $kp$```c
void fun(void)   // 无参函数，无返回值
{
    printf("*****\n");
}
```$kp$, section = '' where id = 30657;
update t_knowledge_point set title = $kp$程序填空：长方体体积与面积$kp$, content = $kp$题目：利用全局变量计算长方体的体积及三个面的面积。

```c
int s1, s2, s3;   // 三个面的面积

int vs(int a, int b, int c)
{
    int v;
    v = a * b * c;    // 第一空：体积
    s1 = a * b;
    s2 = b * c;       // 第二空
    s3 = a * c;
    return v;
}
```$kp$, section = '' where id = 30658;
update t_knowledge_point set title = $kp$程序改错与程序设计题$kp$, content = $kp$【程序改错】编写函数 fun 求 1000 以内所有 8 的倍数之和。

【程序设计】求一批数中最大值和最小值的差。

注意：不可以增加或删除程序行，也不可以更改程序的结构。$kp$, section = '' where id = 30664;
update t_knowledge_point set title = $kp$字符串输入输出函数 gets 与 puts$kp$, content = $kp$```c
char s[80];
gets(s);     // 输入字符串，以回车结束，可以包含空格
puts(s);     // 输出字符串，自动换行
```

- gets 以回车作为结束标志，不以空格作为结束标志。
- puts 输出字符串后自动换行，把字符串结束符 '\0' 转换成 '\n' 输出。
- 字符输入输出用 getchar / putchar。$kp$, section = '' where id = 31111;
update t_knowledge_point set title = $kp$程序的控制结构$kp$, content = $kp$（1）顺序控制结构：最基本、最普通的结构形式，按照程序中的语句行的先后顺序逐条执行。
（2）选择控制结构：单分支选择（if）、双分支选择（if…else）、多分支选择（if…else if…/switch…case）。
（3）循环控制结构：如 C 语言中的 for、do-while（循环体最少被执行一次）、while 等循环。$kp$, section = '' where id = 31306;
update t_knowledge_point set title = $kp$平方根函数 sqrt$kp$, content = $kp$① 函数原型：`double sqrt(double x);`
② 头文件：math.h

```c
sqrt(4);   // 求 4 的平方根，结果为 2.0
```$kp$, section = '' where id = 31399;
update t_knowledge_point set title = $kp$幂函数与角度弧度转换$kp$, content = $kp$① 函数原型：`double pow(double x, double y);`
② 头文件：math.h
③ pow() 用来计算以 x 为底的 y 次方值并返回，设返回值为 ret，则 ret = x^y。

```c
pow(2, 3);       // 2 的 3 次方
pow(2.3, 4.4);   // 2.3 的 4.4 次方
```

角度与弧度的转换：

- π = 180°
- 1° = π/180 rad
- 1 rad = 180/π
- 角度转弧度：用角度乘以 π/180
- 弧度转角度：用弧度乘以 180/π$kp$, section = '' where id = 31400;
update t_knowledge_point set title = $kp$C 语言常用函数的分类$kp$, content = $kp$```mermaid
graph TD
    subgraph 数学函数
        A["头文件：math.h"] --> B["数学函数"]
        C["算术平方根：sqrt"] --> D["常用函数"]
        E["绝对值函数：fabs"] --> D
        F["幂函数：pow"] --> D
        G["正弦函数：sin"] --> D
    end

    subgraph 用户自定义函数
        H["普通函数"] --> I["用户自定义函数"]
        J["递归函数"] --> I
    end

    subgraph 字符函数
        K["头文件：ctype.h"] --> L["字符函数"]
        M["判断是否小写：islower<br/>判断是否大写：isupper<br/>转小写：tolower<br/>转大写：toupper"] --> L
    end

    subgraph 标准IO函数
        N["头文件：stdio.h"] --> O["标准 IO 函数"]
        Q["字符输入输出：getchar / putchar"] --> O
        R["字符串输入输出：gets / puts"] --> O
        S["标准输入输出：scanf / printf"] --> O
    end

    subgraph 字符串函数
        V["头文件：string.h"] --> W["常用函数"]
        X["字符串拷贝：strcpy"] --> W
        Y["字符串比较：strcmp"] --> W
        Z["字符串拼接：strcat"] --> W
        AA["字符串长度：strlen"] --> W
        AB["字符/字符串查找：strchr / strstr"] --> W
    end

    B --> T["C 语言函数（考试中涉及）"]
    I --> T
    L --> T
    O --> T
    W --> T
```$kp$, section = '' where id = 31583;
update t_knowledge_point set title = $kp$表格软件公式与函数考点$kp$, content = $kp$选中一列，可以冻结所选单元格左侧所有的列。

## 高频考点 4：公式和函数

### 【考点详解】公式和函数

#### 1. 公式的概念$kp$, section = '' where id = 31660;
update t_knowledge_point set title = $kp$排名函数 RANK()$kp$, content = $kp$RANK()：排名函数。$kp$, section = '' where id = 31661;
update t_knowledge_point set title = $kp$错误值 #N/A$kp$, content = $kp$#N/A：函数中没有可用数值。$kp$, section = '' where id = 31662;
update t_knowledge_point set title = $kp$错误值 #NUM!$kp$, content = $kp$#NUM!：在函数或公式中使用了不正确的数字，如 SQRT(-4)。$kp$, section = '' where id = 31663;
update t_knowledge_point set title = $kp$函数提高编程和维护效率$kp$, content = $kp$提高了编程和维护效率。$kp$, section = '' where id = 31730;
update t_knowledge_point set title = $kp$函数表达式调用$kp$, content = $kp$函数表达式：函数作为表达式中的一项出现在表达式中，以函数返回值参与表达式运算。例如：

```c
z = max(x, y);
```$kp$, section = '' where id = 31770;
update t_knowledge_point set title = $kp$可省略函数声明：返回整型或字符型$kp$, content = $kp$被调函数的返回值是整型或字符型时，返回值自动按整型处理，可以省略函数声明。$kp$, section = '' where id = 31772;
update t_knowledge_point set title = $kp$可省略函数声明：定义在主调函数之前$kp$, content = $kp$当被调函数的定义在主调函数之前时，可以省略函数声明。$kp$, section = '' where id = 31773;
update t_knowledge_point set title = $kp$可省略函数声明：已预先说明类型$kp$, content = $kp$在所有函数定义之前，在函数外预先说明了各个函数的类型，调用时不必再声明。$kp$, section = '' where id = 31774;
update t_knowledge_point set title = $kp$递归调用次数分析$kp$, content = $kp$设有函数 `int fun(int k)`。调用 fun(3) 时，依次调用 fun(2)、fun(1)，fun 总共被调用 3 次；fun(1) 返回 1，逐层返回后 fun(3) 的结果为 3，最后 n 为 3。$kp$, section = '' where id = 31775;
update t_knowledge_point set title = $kp$判断小写字母函数 islower$kp$, content = $kp$① 原型：`int islower(char ch)`
② 若 ch 是小写字母（'a'～'z'）返回非 0 值，否则返回 0。

```c
islower('a');   // 返回结果是非 0 值
islower('0');   // 返回结果是 0
```$kp$, section = '' where id = 31816;
update t_knowledge_point set title = $kp$判断大写字母函数 isupper$kp$, content = $kp$① 原型：`int isupper(char ch)`
② 若 ch 是大写字母（'A'～'Z'）返回非 0 值，否则返回 0。

```c
isupper('A');   // 返回结果是非 0 值
isupper('0');   // 返回结果是 0
```$kp$, section = '' where id = 31817;
update t_knowledge_point set title = $kp$小写转大写函数 toupper$kp$, content = $kp$① 原型：`int toupper(char ch)`
② 若 ch 是小写字母（'a'～'z'）返回相应的大写字母（'A'～'Z'）。

```c
toupper('a');   // 返回 'A'
```$kp$, section = '' where id = 31819;
update t_knowledge_point set title = $kp$C 语言提供的库函数$kp$, content = $kp$C 语言提供了一些封装好的函数供使用，比如字符串处理函数、标准输入输出函数、数学函数等。$kp$, section = '' where id = 31867;
update t_knowledge_point set title = $kp$模块化程序设计思想$kp$, content = $kp$模块化：一个复杂问题可以进一步分解为具体的小目标，每个小目标称为一个模块，而可复用是面向对象程序设计的一个优点。C 语言允许对函数单独进行编译（不能单独执行，需要从主函数开始执行），从而可以实现模块化，而且提供了丰富的数据类型。$kp$, section = '' where id = 31880;
update t_knowledge_point set title = $kp$MapReduce 的映射函数和归约函数$kp$, content = $kp$在利用 MapReduce 编写程序时，程序员只需要关注两个自定义函数：Map 映射函数和 Reduce 归约函数。$kp$, section = '' where id = 31900;
update t_knowledge_point set title = $kp$自定义函数的位置与声明$kp$, content = $kp$自定义函数可以出现在主函数之前，也可以出现在主函数之后（使用时需要先声明），还可以出现在其他 C 程序文件中（使用时需要先声明）。$kp$, section = '' where id = 31922;
update t_knowledge_point set title = $kp$绝对值函数 abs 与 fabs$kp$, content = $kp$① abs() 对整数取绝对值，函数原型为 `int abs(int x)`，头文件 stdlib.h：

```c
abs(-5);   // 结果是 5
```

② fabs() 对浮点数取绝对值，函数原型为 `double fabs(double x)`，头文件 math.h：

```c
fabs(-5.5);   // 结果是 5.5
```$kp$, section = '' where id = 31932;
update t_knowledge_point set title = $kp$平方根函数 sqrt 的使用$kp$, content = $kp$① 函数原型：`double sqrt(double x);`
② 头文件：math.h

```c
sqrt(4);   // 求 4 的平方根
```$kp$, section = '' where id = 31933;
update t_knowledge_point set title = $kp$rand 函数的取值范围$kp$, content = $kp$rand 函数界限：stdlib.h 头文件中有宏 `#define RAND_MAX 0x7fff`。

rand 产生一个 0～0x7fff（0～32767）的随机数，即最大是 32767。$kp$, section = '' where id = 31934;
update t_knowledge_point set title = $kp$rand 函数产生指定范围的随机数$kp$, content = $kp$想要产生一个 0～99 之间的随机数：

```c
int num = rand() % 100;   // 随机产生 0～99 的整数
```

想要产生一个 1～100 之间的随机数：

```c
int num = rand() % 100 + 1;   // 先产生 0～99，再 +1，范围扩大到 1～100
```

想要产生一个 0～99.99（2 位小数）之间的数：

```c
float num = (rand() % 10000) / 100.0;   // rand() % 10000 产生 0～9999 的整数，再除以 100.0
```$kp$, section = '' where id = 31935;
update t_knowledge_point set title = $kp$函数常考概念与典型程序$kp$, content = $kp$1. 函数是具有一定功能的一个程序块，是 C 语言的基本组成单位。
2. 函数不可以嵌套定义，但是可以嵌套调用。
3. 函数名缺省返回值类型，默认为 int。
4. C 语言由函数组成，但有且仅有一个 main 函数，它是程序运行的开始。

5. 判断 a 是否为素数：

```c
#include <stdio.h>

void isprime(int a)
{
    int i;
    for (i = 2; i <= a / 2; i++)
        if (a % i == 0)
        {
            printf("不是素数！");
            return;
        }
    printf("是素数！");
}
```

若需要返回值，可把 printf 语句换成 return 值。

6. 求 n!：

```c
int fun(int n)
{
    int p = 1, i;
    for (i = 1; i <= n; i++)
        p = p * i;
    return p;
}
```

7. 函数的参数可以是常量、变量、表达式，甚至是函数调用。

```c
int add(int x, int y)
{
    return x + y;
}

int main(void)
{
    int sum;
    sum = add(add(7, 8), 9);   // 结果为 24
    return 0;
}
```

8. 注意实参和形参之间的传递方式：传数值时，形参的变化不会改变实参；传地址时，形参的变化有可能改变实参。

9. 函数声明一定要有函数名、函数的返回类型、函数的参数类型，不一定要有形参的名称。

已知函数定义为 `int fun(int a[], int b[])`，下面几种声明都正确：

```c
int fun(int *a, int *b);
int fun(int a[], int b[]);
int fun(int b[], int c[]);   // 参数名可以随便写
int fun(int *, int *);       // 参数名可以不写
```

数组作为形参时等价于指针。$kp$, section = '' where id = 32093;
update t_knowledge_point set title = $kp$函数与程序模块化$kp$, content = $kp$函数在主函数或自定义函数内调用。

8. C 语言主要是借助定义函数功能来实现程序模块化。
9. 结构化程序设计方法的主要原则：$kp$, section = '' where id = 32112;
update t_knowledge_point set title = $kp$无返回值函数定义为空类型$kp$, content = $kp$函数不需要返回值时，可以定义为空类型。例如：

```c
void showTime(void);
void showTime();
```$kp$, section = '' where id = 32119;
update t_knowledge_point set title = $kp$void 的三种语义$kp$, content = $kp$① 作为参数表示无参数：`int sum(void);`（void 可以省略不写）
② 作为返回值表示无返回值：`void update(int a);`
③ 修饰指针变量表示未知类型的指针：`void *str = NULL;`$kp$, section = '' where id = 32120;
update t_knowledge_point set title = $kp$函数调用语句$kp$, content = $kp$函数调用语句：函数名（参数列表）；

例如：

```c
printf("%d", (1 * 20 / 5));
```$kp$, section = '' where id = 32162;
update t_knowledge_point set title = $kp$语句块作用域与变量隐藏$kp$, content = $kp$在语句块内声明的名称具有语句块作用域，从声明点开始，一直到语句块结尾之前有效。这种声明会把在语句块以外声明的同名对象隐藏起来。

```c
int a = 0;
{
    int a = 10;   // 隐藏语句块外的同名变量，作用域只在块内
    a++;
    printf("a=%d\n", a);   // 输出 11
}
printf("a=%d\n", a);       // 输出 0
```$kp$, section = '' where id = 32164;
update t_knowledge_point set title = $kp$动态变量的存储周期$kp$, content = $kp$动态变量的存储周期也被限制在语句块中它们生成的地方。这意味着，如果一个变量没有被声明为 static 或 extern，那么该变量的存储空间会在语句块结束之后自动被释放。$kp$, section = '' where id = 32165;
update t_knowledge_point set title = $kp$函数类型默认为 int$kp$, content = $kp$函数类型默认为 int 型；另外还有 void 空类型、char、long 等。$kp$, section = '' where id = 32215;
update t_knowledge_point set title = $kp$return 语句与 void 函数$kp$, content = $kp$return 只执行一次，执行完或函数体结束后退出函数。

返回类型为 void 的函数表示不返回任何值，例如：

```c
#include <stdio.h>

void checkPrimeNumber(void)
{
    int n, i, flag = 0;
    printf("输入一个正整数: ");
    scanf("%d", &n);

    for (i = 2; i <= n / 2; i++)
        if (n % i == 0)
        {
            flag = 1;
            break;
        }

    if (flag == 0)
        printf("%d 是素数\n", n);
    else
        printf("%d 不是素数\n", n);
}
```$kp$, section = '' where id = 32216;
update t_knowledge_point set title = $kp$递归调用的条件$kp$, content = $kp$递归调用必须存在一定的限制条件，当达到条件的时候，递归调用将不再继续执行；每次调用之后，其最终的结果都会接近该限制条件。$kp$, section = '' where id = 32217;
update t_knowledge_point set title = $kp$模块化程序设计的学习要求$kp$, content = $kp$了解模块化程序设计思想，学会使用函数进行简单编程。

【考查内容】

1. C 语言程序的结构$kp$, section = '' where id = 32222;
update t_knowledge_point set title = $kp$pow 函数与三角函数应用$kp$, content = $kp$① 函数原型：`double pow(double x, double y);`
② 头文件：math.h
③ pow() 用来计算以 x 为底的 y 次方值，然后将结果返回。设返回值为 ret，则 ret = x^y。

```c
pow(2, 3);       // 2 的 3 次方
pow(2.3, 4.4);   // 2.3 的 4.4 次方
```

角度与弧度的换算：

- π = 180°
- 1° = π/180
- 1 rad = 180/π
- 角度转弧度：角度乘以 π/180
- 弧度转角度：弧度乘以 180/π

当输入是 30 角度时：

```c
/* 输入为角度 */
#include <stdio.h>
#include <math.h>

int main(void)
{
    const double pi = acos(-1.0);   // 用反三角函数求出 π
    double x, r;                    // x 是角度值，如 30°、60°
    double s, c;

    scanf("%lf", &x);               // 输入角度值：30、60
    r = x * pi / 180;               // 角度转弧度
    s = sin(r);                     // 正弦函数
    c = cos(r);                     // 余弦函数
    printf("sin=%f,cos=%f\n", s, c);

    return 0;
}
```

运行结果：

```text
sin=0.500000, cos=0.866025
```

当输入是 30 弧度时：

```c
/* 输入为弧度 */
#include <stdio.h>
#include <math.h>

int main(void)
{
    double x;    // 弧度
    double s, c;

    scanf("%lf", &x);   // 从控制台输入弧度
    s = sin(x);          // 正弦函数
    c = cos(x);          // 余弦函数
    printf("sin=%f,cos=%f\n", s, c);

    return 0;
}
```

运行结果：

```text
sin=-0.988032, cos=0.154251
```$kp$, section = '' where id = 32230;
update t_knowledge_point set title = $kp$返回函数值的方法$kp$, content = $kp$- 如果一个函数有返回值，就必须使用 return 语句；
- 一个函数中可以有一个以上的 return 语句，但不论执行到哪个 return，都将结束函数调用，返回主调函数；
- return 语句中的括号可以省略，后面的值可以是一个表达式。$kp$, section = '' where id = 32249;
update t_knowledge_point set title = $kp$函数值的类型$kp$, content = $kp$- 函数的类型即函数值的类型；
- 省略了类型说明的函数是 int 型的；
- return 语句中表达式的值一般应与函数类型一致；
- 如果不一致，则需要进行类型转换。$kp$, section = '' where id = 32250;
update t_knowledge_point set title = $kp$不需要返回值的函数$kp$, content = $kp$- 如果函数中没有使用 return 语句，函数返回的是一个不确定的数值；
- 如果一个函数不需要返回值（表示一个过程），可以用 void 做类型说明；
- 如果一个函数被声明为 void 类型，就不允许再引用它的返回值。$kp$, section = '' where id = 32251;
update t_knowledge_point set title = $kp$函数表达式与调用执行过程$kp$, content = $kp$函数表达式：函数的返回值参与运算。

3）函数调用的执行过程：

```c
#include <stdio.h>

float iabs(float x)
{
    return (x > 0 ? x : -x);
}

int main(void)
{
    float x = -1.2, y;
    y = iabs(2 * x);
    printf("x=%f , iabs(x)=%f\n", x, y);
    return 0;
}
```$kp$, section = '' where id = 32252;
update t_knowledge_point set title = $kp$return 语句的执行$kp$, content = $kp$当遇到 return（表达式）语句时，计算表达式的值，并返回主调函数。

4）函数的原型说明$kp$, section = '' where id = 32253;
update t_knowledge_point set title = $kp$函数的嵌套调用与数组参数$kp$, content = $kp$函数的嵌套调用：在一个函数的函数体中又调用了其他函数。

3. 数组作为函数的参数

1）数组元素做函数实参

与变量做实参一样，数组元素做实参是“值传递”。

例：求 10 个任意整数中的最大数。

2）一维数组与函数参数

若函数的形参是数组，对应的实参必须是数组名。

说明：（1）实参数组与形参数组的类型必须一致。$kp$, section = '' where id = 32254;
update t_knowledge_point set title = $kp$指针的定义与编程练习$kp$, content = $kp$编写程序实现：用键盘输入两个非 0 整数 a 和 b，然后求 a 的 b 次方和 b 的 a 次方的值，要求用自定义函数实现该功能。

课时十 指针

考点：

| 考点 | 重要程度 | 分值 | 常见题型 |
| --- | --- | --- | --- |
| 指针的定义 | ★★★★ | 2～6 | 选择题、读程序题 |
| 指针做函数参数 | ★★★ | 0～6 | 选择题、读程序题 |
| 指针与数组 | ★★ | 2～4 | 选择题、读程序题及部分编程题 |

1. 指针的定义

```c
int *p1, x;
x = 5;
p1 = &x;

int y = 10, *p2 = &y;
*p2 = 20;
p2 = p1;
```$kp$, section = '' where id = 32270;
update t_knowledge_point set title = $kp$指针做函数参数：交换两个数$kp$, content = $kp$```c
#include <stdio.h>

void swap(int *x, int *y)
{
    int temp;
    temp = *x;
    *x = *y;
    *y = temp;
}

int main(void)
{
    int a, b;
    a = 10;
    b = 20;
    swap(&a, &b);
    printf("a=%d b=%d", a, b);
    return 0;
}
```

运行结果：a = 20，b = 10。

若形参不是指针，而是普通变量：

```c
#include <stdio.h>

void swap(int x, int y)
{
    int temp;
    temp = x;
    x = y;
    y = temp;
}

int main(void)
{
    int a, b;
    a = 10;
    b = 20;
    swap(a, b);
    printf("a=%d b=%d", a, b);
    return 0;
}
```

运行结果：a = 10，b = 20。$kp$, section = '' where id = 32271;
update t_knowledge_point set title = $kp$文件的打开方式$kp$, content = $kp$文件的打开方式："r"、"w"、"rb"、"wb"、"r+"、"w+"、"rb+"、"wb+"。$kp$, section = '' where id = 32272;
update t_knowledge_point set title = $kp$为什么要用函数$kp$, content = $kp$7.1 为什么要用函数

- 如果程序的功能比较多、规模比较大，把所有代码都写在 main 函数中，就会使主函数变得庞杂、头绪不清，阅读和维护变得困难；
- 有时程序中要多次实现某一功能，就需要多次重复编写实现此功能的程序代码，这使程序冗长、不精炼。

解决方法：用模块化程序设计的思路。

- 采用“组装”的办法简化程序设计的过程；
- 事先编好一批实现各种不同功能的函数，把它们保存在函数库中，需要时直接使用；
- 函数就是功能，每一个函数用来实现一个特定的功能，函数的名字应反映其代表的功能。

在设计一个较大的程序时，往往把它分为若干个程序模块，每一个模块包括一个或多个函数，每个函数实现一个特定的功能。Ｃ程序可由一个主函数和若干个其他函数构成；主函数调用其他函数，其他函数也可以互相调用；同一个函数可以被一个或多个函数调用任意多次。

可以使用库函数，也可以使用自己编写的函数。在程序设计中要善于利用函数，可以减少重复编写程序段的工作量，同时可以方便地实现模块化的程序设计。

例 7.1 输出以下的结果，用函数调用实现。

```text
******************
How do you do!
******************
```

解题思路：

- 在输出的文字上下分别有一行“*”号，不必重复写这段代码，用一个函数 print_star 来实现输出一行“*”号的功能；
- 再写一个 print_message 函数来输出中间一行文字信息；
- 用主函数分别调用这两个函数。

```c
#include <stdio.h>

void print_star(void);      // 声明函数
void print_message(void);

int main(void)
{
    print_star();           // 输出一行 *
    print_message();        // 输出一行文字
    print_star();
    return 0;
}

void print_star(void)       // 定义函数
{
    printf("******************\n");
}

void print_message(void)
{
    printf("How do you do!\n");
}
```$kp$, section = '' where id = 32322;
update t_knowledge_point set title = $kp$定义函数的方法$kp$, content = $kp$7.2.1 为什么要定义函数

C 语言要求，在程序中用到的所有函数必须“先定义，后使用”。定义函数时要指定：

- 函数的名字，以便以后按名调用；
- 函数类型，即函数返回值的类型；
- 函数参数的名字和类型，以便在调用函数时向它们传递数据；
- 函数的功能，这是最重要的，在函数体中解决。

对于库函数，程序设计者只需用 #include 指令把有关的头文件包含到本文件模块中即可；库函数没有提供的函数，需要程序设计者自己在程序中定义。

7.2.2 定义函数的方法$kp$, section = '' where id = 32323;
update t_knowledge_point set title = $kp$函数调用的形式$kp$, content = $kp$7.3.1 函数调用的形式

函数调用的一般形式为：函数名（实参表列）。

- 如果是调用无参函数，则“实参表列”可以没有，但括号不能省略；
- 如果实参表列包含多个实参，则各参数之间用逗号隔开。

按函数调用在程序中出现的形式和位置来分，可以有以下 3 种函数调用方式：

1. 函数调用语句：把函数调用单独作为一个语句，如 `print_star();`。这时不要求函数带回值，只要求函数完成一定的操作。
2. 函数表达式：函数调用出现在另一个表达式中，如 `c = max(a, b);`。这时要求函数带回一个确定的值以参加表达式的运算。
3. 函数参数：函数调用作为另一函数调用时的实参，如 `m = max(a, max(b, c));`。其中 max(b, c) 是一次函数调用，它的值作为 max 另一次调用的实参。

7.3.2 函数调用时的数据传递$kp$, section = '' where id = 32324;
update t_knowledge_point set title = $kp$形式参数和实际参数$kp$, content = $kp$在调用有参函数时，主调函数和被调用函数之间有数据传递关系。

- 定义函数时函数名后面的变量名称为“形式参数”（简称“形参”）；
- 主调函数中调用一个函数时，函数名后面的参数称为“实际参数”（简称“实参”）；
- 实际参数可以是常量、变量或表达式。

7.3.2 函数调用时的数据传递$kp$, section = '' where id = 32325;
update t_knowledge_point set title = $kp$实参和形参间的数据传递$kp$, content = $kp$在调用函数过程中，系统会把实参的值传递给被调用函数的形参；或者说，形参从实参得到一个值，该值在函数调用期间有效，可以参加被调函数中的运算。

7.3.2 函数调用时的数据传递

例 7.2 输入两个整数，要求输出其中值较大者，要求用函数来找到大数。

解题思路：$kp$, section = '' where id = 32326;
update t_knowledge_point set title = $kp$max 函数的定义、调用与参数传递$kp$, content = $kp$max 函数应当有两个参数，以便从主函数接收两个整数，因此参数的类型应当是整型。

先编写 max 函数：

```c
int max(int x, int y)
{
    int z;
    z = x > y ? x : y;
    return(z);
}
```

再在 max 函数上面编写主函数：

```c
#include <stdio.h>

int main(void)
{
    int max(int x, int y);
    int a, b, c;
    printf("two integer numbers: ");
    scanf("%d,%d", &a, &b);
    c = max(a, b);      // 实参可以是常量、变量或表达式
    printf("max is %d\n", c);
    return 0;
}
```

函数调用的过程：

- 定义函数时指定的形参，在未出现函数调用时不占内存中的存储单元；
- 发生函数调用时，形参被临时分配内存单元，实参的值传给形参；
- 调用结束，形参单元被释放，实参单元仍保留并维持原值；
- 如果在执行被调用函数时形参的值发生改变，不会改变主调函数的实参的值。$kp$, section = '' where id = 32327;
update t_knowledge_point set title = $kp$return 语句与函数返回值$kp$, content = $kp$函数的返回值是通过函数中的 return 语句获得的。

- 一个函数中可以有一个以上的 return 语句，执行到哪一个 return 语句，哪一个就起作用；
- return 语句后面的括号可以不要。

通常，希望通过函数调用使主调函数得到一个确定的值，这就是函数值（函数的返回值）。$kp$, section = '' where id = 32328;
update t_knowledge_point set title = $kp$定义函数时指定函数值的类型$kp$, content = $kp$函数值的类型应当在定义函数时指定。

通常，希望通过函数调用使主调函数得到一个确定的值，这就是函数值（函数的返回值）。$kp$, section = '' where id = 32329;
update t_knowledge_point set title = $kp$函数类型与返回值类型不一致$kp$, content = $kp$在定义函数时指定的函数类型一般应该和 return 语句中的表达式类型一致。如果函数值的类型和 return 语句中表达式的值不一致，则以函数类型为准。

例 7.3 将例 7.2 稍作改动，把 max 函数中定义的变量 z 改为 float 型。函数返回值的类型与指定的函数类型不同，分析其处理方法。

解题思路：如果函数返回值的类型与指定的函数类型不同，按照赋值规则处理。

```c
#include <stdio.h>

int main(void)
{
    int max(float x, float y);
    float a, b;
    int c;

    scanf("%f,%f", &a, &b);
    c = max(a, b);
    printf("max is %d\n", c);
    return 0;
}
```

max 返回 float 型值，赋给 int 型变量 c 时按赋值规则处理（舍去小数部分）。$kp$, section = '' where id = 32330;
update t_knowledge_point set title = $kp$存储类别小结$kp$, content = $kp$7.9.1 动态存储方式与静态存储方式

- 从变量的作用域的角度观察，变量可以分为全局变量和局部变量；
- 从变量值存在的时间（即生存期）观察，变量的存储有两种不同的方式：静态存储方式和动态存储方式。
  - 静态存储方式：在程序运行期间由系统分配固定的存储空间；
  - 动态存储方式：在程序运行期间根据需要动态地分配存储空间。

内存用户区可分为程序区、静态存储区和动态存储区：

- 全局变量全部存放在静态存储区，程序开始执行时分配，程序执行完毕释放；
- 函数形参、函数中定义的没有用 static 声明的变量、函数调用时的现场保护和返回地址等存放在动态存储区，函数调用开始时分配，函数结束时释放。

每一个变量和函数都有两个属性：数据类型和数据的存储类别。

- 数据类型，如整型、浮点型等；
- 存储类别，指数据在内存中存储的方式，包括自动的、静态的、寄存器的、外部的。

根据变量的存储类别，可以知道变量的作用域和生存期。

7.9.2 局部变量的存储类别$kp$, section = '' where id = 32332;
update t_knowledge_point set title = $kp$自动变量与静态局部变量$kp$, content = $kp$自动变量（auto 变量）

- 局部变量如果不专门声明存储类别，都是动态地分配存储空间的；
- 调用函数时系统给局部变量分配存储空间，调用结束就自动释放，这类局部变量称为自动变量；
- 自动变量用关键字 auto 作存储类别的声明，auto 通常可以省略。

```c
int f(int a)
{
    auto int b, c = 3;
    /* ... */
}
```

2. 静态局部变量（static 局部变量）

希望函数中的局部变量在函数调用结束后不消失而继续保留原值，即其占用的存储单元不释放，在下一次再调用该函数时该变量已有值（上一次调用结束时的值），这时应指定该局部变量为“静态局部变量”，用关键字 static 声明。

例 7.16 考察静态局部变量的值：

```c
#include <stdio.h>

int main(void)
{
    int f(int);
    int a = 2, i;

    for (i = 0; i < 3; i++)
        printf("%d\n", f(a));

    return 0;
}

int f(int a)
{
    auto int b = 0;
    static int c = 3;

    b = b + 1;
    c = c + 1;
    return a + b + c;
}
```

输出结果：7、8、9。$kp$, section = '' where id = 32333;
update t_knowledge_point set title = $kp$内部函数和外部函数$kp$, content = $kp$7.11.1 内部函数

如果一个函数只能被本文件中其他函数所调用，它称为内部函数。定义内部函数时，在函数名和函数类型的前面加 static：

```c
static 类型名 函数名(形参表)
```

内部函数又称静态函数。通常把只能由本文件使用的函数和外部变量放在文件的开头，前面都冠以 static 使之局部化，其他文件不能引用，从而提高了程序的可靠性。

7.11.2 外部函数

如果在定义函数时，在函数首部的最左端加关键字 extern，则此函数是外部函数，可供其他文件调用，如：

```c
extern int fun(int a, int b)
```

如果在定义函数时省略 extern，则默认为外部函数。

例 7.20 有一个字符串，内有若干个字符，今输入一个字符，要求程序将字符串中该字符删去，用外部函数实现。

解题思路：

- 分别定义 3 个函数用来输入字符串、删除字符、输出字符串；
- 把以上 3 个函数分别放在 3 个文件中，main 函数在另一文件中，main 函数调用以上 3 个函数。

文件 file1.c：

```c
#include <stdio.h>

extern void enter_string(char str[]);
extern void delete_string(char str[], char ch);
extern void print_string(char str[]);

int main(void)
{
    char c, str[80];
    enter_string(str);
    scanf("%c", &c);
    delete_string(str, c);
    print_string(str);
    return 0;
}
```

文件 file2.c：

```c
void enter_string(char str[80])
{
    gets(str);
}
```

文件 file3.c：

```c
void delete_string(char str[], char ch)
{
    int i, j;
    for (i = j = 0; str[i] != '\0'; i++)
        if (str[i] != ch)
            str[j++] = str[i];
    str[j] = '\0';
}
```

文件 file4.c：

```c
void print_string(char str[])
{
    printf("%s\n", str);
}
```$kp$, section = '' where id = 32334;
update t_knowledge_point set title = $kp$数据库日期函数与视图$kp$, content = $kp$## 日期相关函数

实例：

```sql
SELECT CURDATE(), CURTIME(), NOW(), WEEK(NOW()), YEAR(NOW()),
       HOUR(NOW()), MINUTE(NOW()), DATEDIFF(NOW(), '2000-4-12'),
       ADDDATE(NOW(), 5);
```

结果示例：

| 函数 | 结果 |
| --- | --- |
| CURDATE() | 2021-04-12 |
| CURTIME() | 10:00:29 |
| NOW() | 2021-04-12 10:00:29 |
| WEEK(NOW()) | 15 |
| YEAR(NOW()) | 2021 |
| HOUR(NOW()) | 10 |
| MINUTE(NOW()) | 0 |
| DATEDIFF(NOW(), '2000-4-12') | 7670 |
| ADDDATE(NOW(), 5) | 2021-04-17 10:00:29 |

## 9、数学相关函数的操作

(1) 数学相关函数介绍：重点是 RAND 函数。

(3) 实例：

```sql
SELECT FLOOR(1 + RAND() * 50);
```

## 4. 视图和索引

### 4.1 创建和查看视图

#### 1、直接在表上创建视图

(1) 语法：

```sql
CREATE VIEW 视图名[(视图显示的列)]
AS (对表查询语句)
[WITH [CASCADED | LOCAL] CHECK OPTION];
```

WITH CHECK OPTION：指定在更新视图上所进行的修改都需要符合对表查询语句中所指定的限制条件。$kp$, section = '' where id = 32444;
update t_knowledge_point set title = $kp$Word 表格中的常用函数$kp$, content = $kp$Word 表格中常用的函数有 SUM、AVERAGE、MAX、MIN、COUNT、IF（前两个最常用）。

表示方法：Word 函数 + 位置。例如：

- `=SUM(LEFT)`：求左边一组数的和；
- `=SUM(ABOVE)`：求上面一组数的和。$kp$, section = '' where id = 32487;
update t_knowledge_point set title = $kp$无参函数与有参函数$kp$, content = $kp$从函数的形式看，函数分两类。

① 无参函数。无参函数一般用来执行指定的一组操作。无参函数可以带回或不带回函数值，但一般以不带回函数值的居多。

② 有参函数。在调用函数时，主调函数通过参数向被调用函数传递数据；一般情况下，执行被调用函数时会得到一个函数值，供主调函数使用。

7.2 怎样定义函数$kp$, section = '' where id = 32709;
update t_knowledge_point set title = $kp$定义无参函数的一般形式$kp$, content = $kp$定义无参函数的一般形式为：

```c
类型名 函数名()
{
    函数体
}
```

或：

```c
类型名 函数名(void)
{
    函数体
}
```

函数体包括声明部分和语句部分。$kp$, section = '' where id = 32710;
update t_knowledge_point set title = $kp$定义有参函数的一般形式$kp$, content = $kp$定义有参函数的一般形式为：

```c
类型名 函数名(形式参数表列)
{
    函数体
}
```

7.2.2 定义函数的方法$kp$, section = '' where id = 32711;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30320,30434,30464,30479,30495,30504,30516,30521,30524,30525,30529,30542,30545,30573,30574,30576,30577,30582,30590,30591,30592,30606,30615,30617,30618,30632,30636,30638,30639,30657,30658,30664,31111,31306,31399,31400,31583,31660,31661,31662,31663,31730,31770,31772,31773,31774,31775,31816,31817,31819,31867,31880,31900,31922,31932,31933,31934,31935,32093,32112,32119,32120,32162,32164,32165,32215,32216,32217,32222,32230,32249,32250,32251,32252,32253,32254,32270,32271,32272,32322,32323,32324,32325,32326,32327,32328,32329,32330,32332,32333,32334,32444,32487,32709,32710,32711) and not deleted) <> 96 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
