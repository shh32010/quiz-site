-- 知识点 238 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_238
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_238 as
select * from t_knowledge_point where id in (27750,30280,30281,30314,30329,30333,30431,30432,30442,30446,30447,30460,30465,30467,30469,30472,30478,30499,30509,30517,30518,30531,30532,30536,30543,30546,30551,30584,30593,30604,30630,30635,30637,30652,30666,30667,30673,30888,31305,31331,31332,31335,31605,31619,31620,31657,31659,31665,31666,31667,31729,31742,31743,31747,31797,31798,31876,31878,31879,31881,31893,31921,31924,31938,32070,32076,32078,32080,32081,32082,32103,32105,32111,32114,32211,32212,32220,32221,32257,32258,32259,32614);

update t_knowledge_point set title = $kp$算法的高效率与低存储量$kp$, content = $kp$算法追求高效率与低存储量，通常用时间复杂度和空间复杂度来衡量。$kp$, section = '' where id = 27750;
update t_knowledge_point set title = $kp$运行 C 程序的四个步骤$kp$, content = $kp$1. 上机输入和编辑源程序（生成 `.c` 文件）。
2. 对源程序进行编译（生成 `.obj` 文件）。
3. 进行连接处理（生成 `.exe` 文件）。
4. 运行可执行程序，得到运行结果。

以上过程可参见教材中的图 1.1；附录 A 介绍了在 Visual C++ 6.0 中编辑、编译、连接和运行 C 程序的方法。$kp$, section = '' where id = 30280;
update t_knowledge_point set title = $kp$程序设计的任务$kp$, content = $kp$程序设计一般按以下步骤进行：
1. 问题分析
2. 设计算法
3. 编写程序
4. 对源程序进行编辑、编译和连接
5. 运行程序，分析结果

说明：结果错了，程序肯定错；结果对了，程序未必对。$kp$, section = '' where id = 30281;
update t_knowledge_point set title = $kp$条件编译的三种基本形式$kp$, content = $kp$条件编译有三种基本形式：

```c
#ifdef 标识符
    程序段 1
#else
    程序段 2
#endif
```

```c
#ifndef 标识符
    程序段 1
#else
    程序段 2
#endif
```

```c
#if 表达式
    程序段 1
#else
    程序段 2
#endif
```$kp$, section = '' where id = 30314;
update t_knowledge_point set title = $kp$各编译系统对 C99 的支持$kp$, content = $kp$目前不同软件公司提供的各种 C 语言编译系统多数并未完全实现 C99 建议的功能。

本书中的程序基本上都可以在目前所用的编译系统（如 VC++ 6.0、Turbo C++ 3.0、GCC）上编译和运行。$kp$, section = '' where id = 30329;
update t_knowledge_point set title = $kp$编译预处理的三种功能$kp$, content = $kp$C 语言提供的预处理功能主要有三种：宏定义、文件包含和条件编译。$kp$, section = '' where id = 30333;
update t_knowledge_point set title = $kp$两个整数相加的程序片段$kp$, content = $kp$```c
#include <stdio.h>

int main()
{
    int a, b, sum;
    a = 123;
    b = 456;
    sum = a + b;
    printf("%d\n", sum);   /* 输出时用 sum 的值替代 %d */
    return 0;
}
```

程序把 123 和 456 分别赋给 a、b，求和后存入 sum，再输出 sum 的值。$kp$, section = '' where id = 30431;
update t_knowledge_point set title = $kp$C 语言的可移植性$kp$, content = $kp$C 语言程序的可移植性好：几乎所有的计算机系统都可以使用 C 语言，程序中的大部分功能不需要修改源代码。$kp$, section = '' where id = 30432;
update t_knowledge_point set title = $kp$什么是计算机程序$kp$, content = $kp$- 程序：一组计算机能识别和执行的指令。
- 只要让计算机执行这个程序，计算机就会自动地、有条不紊地进行工作。
- 计算机的一切操作都是由程序控制的；离开程序，计算机将一事无成。$kp$, section = '' where id = 30442;
update t_knowledge_point set title = $kp$什么是计算机语言$kp$, content = $kp$计算机语言是人和计算机交流信息的、计算机和人都能识别的语言。$kp$, section = '' where id = 30446;
update t_knowledge_point set title = $kp$结构化程序设计的三种基本结构$kp$, content = $kp$结构化程序设计包括三种基本结构：顺序结构、选择结构、循环结构。

C 语言属于结构化程序设计语言。$kp$, section = '' where id = 30447;
update t_knowledge_point set title = $kp$C 语言的结构化与模块化特点$kp$, content = $kp$- 具有结构化的控制语句，如 `if…else`、`while`、`do…while`、`switch`、`for` 语句。
- 用函数作为程序的模块单位，便于实现程序的模块化。
- C 语言是完全模块化和结构化的语言。$kp$, section = '' where id = 30460;
update t_knowledge_point set title = $kp$用 printf 输出一行文字$kp$, content = $kp$例 1.1：要求在屏幕上输出以下一行信息：

```
This is a C program.
```

解题思路：在主函数中用 `printf` 函数原样输出以上文字。$kp$, section = '' where id = 30465;
update t_knowledge_point set title = $kp$函数的两个组成部分$kp$, content = $kp$C 语言程序的结构特点之一：一个函数包括两部分。

- 声明部分：定义在本函数中所用到的变量，并对本函数所调用的函数进行声明。声明部分可以没有。
- 执行部分：由若干个语句组成，指定在函数中所进行的操作。

这两部分都放在函数体（一对花括号）中。$kp$, section = '' where id = 30467;
update t_knowledge_point set title = $kp$最简单的 C 语言程序：内容提要$kp$, content = $kp$本节包括两部分内容：
1. 最简单的 C 语言程序举例
2. C 语言程序的结构$kp$, section = '' where id = 30469;
update t_knowledge_point set title = $kp$关系运算符与逻辑运算符的优先级$kp$, content = $kp$关系运算符用于比较两个值的大小，比较结果成立为 1，不成立为 0。例如 `3 > 1` 的结果为 1，`1 > 3` 的结果为 0。

逻辑运算符有三种：`!`（逻辑非）、`&&`（逻辑与）、`||`（逻辑或）。

优先级由高到低为：`!` → 算术运算符 → 关系运算符 → `&&` → `||` → 赋值运算符 → 逗号运算符。

结合性：`!` 自右向左结合；`&&` 和 `||` 自左向右结合。$kp$, section = '' where id = 30472;
update t_knowledge_point set title = $kp$程序设计中的问题分析$kp$, content = $kp$问题分析是程序设计的第一步：
- 对所受领的任务进行认真的分析
- 研究所给定的条件
- 分析最后应达到的目标
- 找出解决问题的规律
- 选择解题的方法$kp$, section = '' where id = 30478;
update t_knowledge_point set title = $kp$调用函数 fun 的程序片段$kp$, content = $kp$```c
int main()
{
    int a = 3, b = 5;
    fun(a, b);
    printf("%d, %d\n", a, b);
    return 0;
}
```

主函数定义 a、b 并调用 `fun(a, b)`，随后输出 a、b 的值。$kp$, section = '' where id = 30499;
update t_knowledge_point set title = $kp$学生成绩文件处理程序框架$kp$, content = $kp$```c
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

int main()
{
    FILE *fpIn, *fpOut;
    char in_file_name[80], out_file_name[80];
    SCORES *studentScore;
    int n, i;

    /* 请添加其它需要的变量定义 */

    scanf("%s", in_file_name);
    scanf("%s", out_file_name);

    /* 在此处完成题目要求的所有功能 */

    fpOut = fopen(out_file_name, "wb");
    if (fpOut == NULL)
        return 1;

    studentScore = calloc(n, sizeof(SCORES));
    /* 后续代码略 */
    return 0;
}
```

该框架定义了学生成绩结构体 `SCORES`，读入输入、输出文件名，打开输出文件并为成绩数组分配内存；中间的处理代码需按题目要求补充。$kp$, section = '' where id = 30509;
update t_knowledge_point set title = $kp$两次调用同一函数的程序片段$kp$, content = $kp$```c
int main()
{
    int m = 10, n = 2;

    printf("%d\n", fun(m, n));
    printf("%d\n", fun(m, n));
    return 0;
}
```

主函数两次调用 `fun(m, n)`，并分别输出返回值。$kp$, section = '' where id = 30517;
update t_knowledge_point set title = $kp$预处理命令的书写规则$kp$, content = $kp$预处理命令均以 `#` 开头，末尾不需要加分号，且一行只能写一条预处理命令。$kp$, section = '' where id = 30518;
update t_knowledge_point set title = $kp$main 函数与注释位置的判断题解析$kp$, content = $kp$- 选项 C：一个 C 源程序必须包含一个 `main` 函数。
- 选项 D：在 C 程序中，注释说明只能位于一条语句的后面。

分析：C 语言程序由一个或多个函数组成，其中必须有一个 `main` 函数，因此可以说 C 程序的基本单位是函数。C 语言用 `/* */` 作注释，注释的添加形式比较自由，可以添加在一条语句的后面，也可以添加在语句的前面。选项 A、B、C 正确，选项 D 不正确。

答案：D

【例 3】C 语言规定：在一个源程序中，main 函数的位置
- (A) 必须在最前面
- (B) 必须在系统调用的库函数的后面
- (C) 可以任意
- (D) 必须在最后

分析：C 语言程序由一个或多个函数组成，其中必须有一个 `main` 函数；`main` 函数的位置没有限制，可以在程序的开头，也可以在程序的结尾。

答案：C$kp$, section = '' where id = 30531;
update t_knowledge_point set title = $kp$C 语言的两种注释方式$kp$, content = $kp$C 语言允许两种注释方式：
- `//`：单行注释
  - 可单独占一行
  - 可出现在一行中其他内容的右侧
- `/*……*/`：块式注释
  - 可包含多行$kp$, section = '' where id = 30532;
update t_knowledge_point set title = $kp$函数是 C 程序的主要组成部分$kp$, content = $kp$C 语言程序的结构特点（之二）：函数是 C 程序的主要组成部分。

- 一个 C 程序由一个或多个函数组成。
- 必须包含一个 `main` 函数，且只能有一个。
- 每个函数都用来实现一个或几个特定功能。
- 被调用的函数可以是库函数，也可以是自己编制设计的函数。$kp$, section = '' where id = 30536;
update t_knowledge_point set title = $kp$求指定倍数之和的程序片段$kp$, content = $kp$程序片段：宏定义 `N` 为 1000；主函数调用 `fun` 求某个范围内指定数的倍数之和，把结果存入 `sum`，再用 `printf` 输出提示信息和结果，最后用 `getch()` 暂停。$kp$, section = '' where id = 30543;
update t_knowledge_point set title = $kp$计算球体积$kp$, content = $kp$```c
#include <stdio.h>

#define PI 3.1415927

int main()
{
    double r;        /* 半径 */
    double result;   /* 结果 */

    while (scanf("%lf", &r) != EOF) {
        result = 4.0 * PI * r * r * r / 3.0;  /* 体积 = 4 × π × r³ / 3 */
        printf("%.3lf\n", result);
    }
    return 0;
}
```

程序连续读入半径，逐个计算球体积并保留三位小数输出。$kp$, section = '' where id = 30546;
update t_knowledge_point set title = $kp$从指定位置复制字符串的函数$kp$, content = $kp$```c
#include <stdio.h>

void strcopy(char *str1, char *str2, int m)
{
    char *p1, *p2;

    p1 = str1 + m;
    p2 = str2;

    while (*p1) {
        *p2++ = *p1++;
    }
    *p2 = '\0';
}
```

函数把 `str1` 中从第 `m` 个字符开始的字符串复制到 `str2`。$kp$, section = '' where id = 30551;
update t_knowledge_point set title = $kp$残缺的程序片段（与 SQL 混杂）$kp$, content = $kp$原稿内容严重残损，并与 SQL 语句混杂（`ORDER BY SUM(消费金额) DESC`），只能辨认出主函数中定义了 `int n, s, i, j, sum = 0;` 并读入了一个整数，其余逻辑缺失，无法还原完整程序。$kp$, section = '' where id = 30584;
update t_knowledge_point set title = $kp$C 语言基础判断题与答案$kp$, content = $kp$判断题（Y 表示对，N 表示错）：

1. 字符串只能存放在字符型数组中。答案：Y
2. 若有宏定义 `#define S(a,b) t=a;a=b;b=t`，由于变量 t 没定义，所以此宏定义是错误的。答案：N
3. 在标准 C 中，`=` 是判断两个数是否相等。答案：N
4. 函数调用可以出现在执行语句中，但不能出现在表达式中。答案：N
5. `strcat(s1, s2)` 函数是将字符串 s1 复制到字符串 s2 中。答案：N
6. 语句 `scanf("%7.2f", &a);` 是一个合法的 scanf 函数调用。答案：N
7. 函数若无返回值，则它一定无形参。答案：N
8. 参加位运算的数据可以是任何类型的数据。答案：N
9. 静态外部变量只在本文件内可用。答案：Y
10. C 语言是一种结构化程序设计语言。答案：Y$kp$, section = '' where id = 30593;
update t_knowledge_point set title = $kp$C 程序的执行起点与终点$kp$, content = $kp$【例 1】一个 C 程序的执行是从____。
(A) 本程序文件的第一个函数开始，到本程序 main 函数结束
(B) 本程序的 main 函数开始，到 main 函数结束
(C) 本程序的 main 函数开始，到本程序文件的最后一个函数结束
(D) 本程序文件的第一个函数开始，到本程序文件的最后一个函数结束

分析：一个 C 程序总是从 `main()` 处开始执行，并且终止于 `main` 函数，不管 `main()` 在源程序中的位置如何。

答案：B$kp$, section = '' where id = 30604;
update t_knowledge_point set title = $kp$文件包含的两种形式$kp$, content = $kp$文件包含有两种书写形式：

```c
#include <文件名>
#include "文件名"
```

例如 `#include <stdio.h>` 用于包含标准输入输出头文件。$kp$, section = '' where id = 30630;
update t_knowledge_point set title = $kp$求两个整数之和的思路$kp$, content = $kp$例 1.2：求两个整数之和。

解题思路：
- 设置 3 个变量。
- `a` 和 `b` 用来存放两个整数。
- `sum` 用来存放和数。
- 用赋值运算符 `=` 把结果传送给 `sum`。$kp$, section = '' where id = 30635;
update t_knowledge_point set title = $kp$C 程序结构典型题（选择与填空）$kp$, content = $kp$【例 4】一个 C 程序是由____。
(A) 一个主程序和若干子程序组成
(B) 函数组成
(C) 若干过程组成
(D) 若干子程序组成

分析：C 语言程序由一个或多个函数组成，其中必须有一个 `main` 函数。C 语言是函数语言，它没有子程序，也没有过程。

答案：B

二、填空题分析

【例 1】C 源程序的基本单位是____。
答案：函数

【例 2】一个 C 源程序中至少应包括一个____。
答案：main 函数

【例 3】在一个 C 源程序中，注释部分两侧的分界符分别为____和____。
答案：`/*` 和 `*/`

【例 4】在 C 语言中，输入操作是由库函数____完成，输出是由库函数____完成。
答案：`scanf()`、`printf()`

实战试题

1. 下面属于 C 语言保留字的是____。
(A) Int (B) typedef (C) ENUM (D) unien
答案：B

2. C 语言规定，在一个 C 程序中 main() 函数的位置____。
(A) 必须在开始 (B) 必须在最后 (C) 可以任意 (D) 必须在系统调用库函数之后
答案：C

3. 下列 4 个叙述中，正确的是____。
A. C 程序中的所有字母都必须小写
B. C 程序中的关键字必须小写，其他标识符不区分大小写
C. C 程序中的所有字母都不区分大小写
D. C 程序中的关键字必须小写
答案：D

4. 一个 C 程序由若干个 C 函数组成，各个函数在文件中的书写位置为____。
A. 任意
B. 第一个函数必须是主函数，其他函数任意
C. 必须完全按调用的顺序排列
D. 其他函数必须在前，主函数必须在最后
答案：A

5. 在 main 函数体内部和外部均允许出现的实体是____。
(A) 预处理命令
(B) 语句
(C) 另一函数的定义
(D) 函数形式参数
答案：A$kp$, section = '' where id = 30637;
update t_knowledge_point set title = $kp$程序阅读题解析：main、switch 与循环$kp$, content = $kp$某填空题：若填选项 C，可以完成 i 的变化，不会造成死循环，同时也从下标 0 开始赋值，所以选项 C 合适；若填选项 D，下标从 1 开始，`++i` 先自增再使用，所以选项 D 不合适。

第 10 题
答案：B
解析：一个完整的 C 语言程序有且仅有一个主函数（main 函数）。程序总是从 main() 函数的第一条语句开始执行，到 main() 函数的最后一条语句结束；其他函数都是在执行 main() 时通过函数调用或嵌套调用而得以执行的。C 语言规定，main() 函数在程序中的位置是任意的，可以出现在其他所有函数（不包含自己）之前或之后。

第 11 题
答案：A
解析：i = 0 时，case 没有匹配项，执行 default，输出 0；i = 1 时，匹配 case 1，输出 1，因没有 break，继续执行 case 2 输出 1，也没有 break，再执行 default 输出 1；i = 2 时，匹配 case 2 输出 2，没有 break，继续执行 default 输出 2。$kp$, section = '' where id = 30652;
update t_knowledge_point set title = $kp$程序设计与 C 语言：本章内容概览$kp$, content = $kp$本章内容包括：
1. 什么是计算机程序
2. 什么是计算机语言
3. C 语言的发展及其特点
4. 最简单的 C 语言程序
5. 运行 C 程序的步骤与方法
6. 程序设计的任务$kp$, section = '' where id = 30666;
update t_knowledge_point set title = $kp$C 语言的特点、关键字与程序构成$kp$, content = $kp$C 语言的特点：ANSI C 一共只有 32 个关键字。

| auto | break | case | char | const | continue | default |
| --- | --- | --- | --- | --- | --- | --- |
| do | double | else | enum | extern | float | for |
| goto | if | int | long | register | return | short |
| signed | static | sizeof | struct | switch | typedef | union |
| unsigned | void | volatile | while | | | |

Turbo C 扩充了 11 个关键字：`asm`、`_cs`、`_ds`、`_es`、`_ss`、`cdecl`、`far`、`huge`、`interrupt`、`near`、`pascal`。

注意：C 语言中关键字都是小写的。

C 程序的构成：C 程序主要由函数构成，共有 3 种类型的函数：
1. `main()`：主函数，是开发系统提供的特殊函数。每一个 C 程序必须有且只有一个 `main()` 函数，它代表程序开始执行的起始位置。
2. 系统提供的函数，如 `printf()`、`scanf()` 等。Turbo C 开发系统提供 300 多个函数。
3. 程序员自己设计的函数，如 `max()`。

一个 C 程序总是从 `main()` 处开始执行，而不管 `main` 在源程序中的位置。
C 程序书写格式自由，一个语句可以占多行，一行也可以有多个语句。
语句和数据定义后必须要有分号，例如 `c = a + b;`。
C 语言用函数进行输入输出，如 `scanf()`、`printf()`。
C 语言用 `/* */` 作注释。$kp$, section = '' where id = 30667;
update t_knowledge_point set title = $kp$C 语言选择题解析：注释、返回值与全局变量$kp$, content = $kp$6. 答案：D
解析：`b = ++a << 2`。先执行 `++a`，a 变为 3；`3 << 2` 即 3×2×2 = 12。`<<` 是算术左移，每移一次相当于乘以 2，左移 2 位即乘以 4。

7. 答案：A
解析：选项 A 正确。注释有 `//` 和 `/* */`，分别是行注释和块注释，可以出现在程序中任意适合的位置。
选项 B 错误。花括号 `{` 和 `}` 可以作为函数体的定界符，也可以是复合语句的定界符，还可以是 if 的执行语句定界符等。
选项 C 错误。构成 C 语言程序的基本单位是函数，主要有主函数、库函数和自定义函数，其中只有自定义函数可以由用户命名，其他都是已经定义好的。
选项 D 错误。分号是 C 语句之间的分隔符，是语句的一部分。

8. 答案：D
解析：C 语言规定，函数返回值的类型由定义该函数时所指定的函数类型所决定。

9. 答案：D
解析：主函数中 `x = a + b = 9 + 3 = 12`，`y = a - b = 9 - 3 = 6`。`num()` 函数中用 `extern` 声明扩展全局变量，因此使用的是全局变量 x、y，函数内对 x、y 的修改会改变全局变量的值。$kp$, section = '' where id = 30673;
update t_knowledge_point set title = $kp$实型常量的小数点形式$kp$, content = $kp$小数点形式由数字、正负号和小数点组成，组成规则：
1. 必须要有小数点。
2. 小数点两边至少有一边要有数字：`.2` 表示 0.2，`2.` 表示 2.0。$kp$, section = '' where id = 30888;
update t_knowledge_point set title = $kp$程序设计语言的四大成分$kp$, content = $kp$程序设计语言由四种成分构成：
1. 数据成分：程序中所涉及的数据部分（变量、数组、结构体等，即数据名、数据类型、数据结构等）。
2. 运算成分：程序中所包括的运算部分（算术运算、逻辑运算、关系运算等）。
3. 控制成分：程序中的控制构造（顺序结构、选择结构、循环结构等）。
4. 传输成分：程序中数据的传输（数据交换，如赋值语句、`strcpy`、`memcpy`；I/O 操作，如输入输出库函数调用；函数传参与返回等）。$kp$, section = '' where id = 31305;
update t_knowledge_point set title = $kp$数学库与标准库头文件的用途$kp$, content = $kp$```c
#include <math.h>    /* 数学相关函数 */
#include <stdlib.h>  /* 标准库文件：malloc、realloc、calloc、free 等动态内存函数，atoi、atof、strtoul 等字符串转数值函数 */
```$kp$, section = '' where id = 31331;
update t_knowledge_point set title = $kp$头文件包含的查找规则$kp$, content = $kp$```c
#include <文件名>    /* 优先到标准库中查找 */
#include "文件名"    /* 优先在项目所属目录下查找 */
#include "my.h"      /* 用户自己的头文件 */
```

头文件便于函数共享，一般把 `#include` 放在文件首部。$kp$, section = '' where id = 31332;
update t_knowledge_point set title = $kp$C 源程序书写的强制性规则$kp$, content = $kp$1. 一个 C 语言源程序必须有且只有 1 个 main 函数。
2. 函数名后必须紧跟一对圆括号 `()`，函数体置于一对花括号 `{}` 中。
3. 每个程序体，即语句块（包括函数的函数体、含有多条语句的选择结构和循环结构中的内嵌语句序列），必须用一对花括号 `{}` 括起来。
4. 文件包含预处理命令 `#include` 应置于源程序的开始位置。
5. 语句末尾必须有分号 `;`；而预处理命令（`#include`、`#define`）和函数首部的末尾及右花括号 `}` 之后不要分号。
6. 同一字母的大、小写意义不同，关键字和标准库函数名必须用小写。
7. 变量必须先定义，后使用。
8. 关键字与其他字符之间必须有至少 1 个空格。
9. 注释必须包含在 `/*` 和 `*/` 之间，或 `//` 之后。$kp$, section = '' where id = 31335;
update t_knowledge_point set title = $kp$C 语言程序设计考查目标$kp$, content = $kp$1. 掌握 C 语言程序结构。
2. 掌握 C 语言的基本数据类型及数据运算。
3. 掌握基本语句的使用。
4. 掌握选择结构编程。
5. 掌握循环结构编程。
6. 掌握数组存储与处理批量数据。
7. 了解模块化程序设计思想，学会使用函数进行简单编程。$kp$, section = '' where id = 31605;
update t_knowledge_point set title = $kp$在 Windows 中创建快捷方式$kp$, content = $kp$在 Windows 中，快捷方式可以帮助用户快速打开应用程序、文件或文件夹。快捷方式是一种特殊类型的文件，它与用户界面中的某个对象相连，是指向这个对象的指针，而不是这个对象本身。快捷方式的图标左下角有一个小箭头。

在桌面创建快捷方式的步骤：
1. 右击桌面空白处，在“新建”级联菜单中选择“快捷方式”命令，打开“创建快捷方式”对话框。
2. 单击【浏览】按钮选定对象，单击【下一步】按钮。
3. 输入快捷方式名称，然后单击【完成】按钮。

也可以用鼠标右键创建：右击要创建快捷方式的对象，在快捷菜单中选择“发送到桌面快捷方式”命令。$kp$, section = '' where id = 31619;
update t_knowledge_point set title = $kp$Windows 资源管理器的使用$kp$, content = $kp$（1）浏览文件夹

“资源管理器”窗口左侧是文件夹窗格，通过树形结构可以查看整个计算机系统的组织结构以及所有访问路径的详细内容。
- 文件夹图标左边带有“+”符号，表示该文件夹还包含子文件夹；单击该文件夹或“+”符号，将显示所含的文件夹结构。
- 文件夹图标左边带有“−”符号，表示当前已显示文件夹中的内容；单击“−”符号可折叠文件夹。

从文件夹窗格中选定一个文件夹时，右侧窗格将显示该文件夹下包含的文件和子文件夹。

（2）调整窗格

将鼠标指针指向两个窗格之间的分隔条，当指针变成“↔”形状时，按住鼠标左键左右拖曳，即可调整文件夹窗格的大小。

（3）设置文件夹窗口的显示方式

① 查看方式：单击工具栏中的【查看】按钮，在下拉菜单中选择所需的显示方式；也可从“查看”菜单中直接选择。
② 排列方式：右击窗口空白处，在快捷菜单的“排列图标”级联菜单中选择排列方式，可按名称、大小、类型、修改时间等方式排列图标。$kp$, section = '' where id = 31620;
update t_knowledge_point set title = $kp$业务逻辑层的含义$kp$, content = $kp$业务逻辑层由实现各种业务功能、流程、规则、策略等应用业务的一组程序代码构成。$kp$, section = '' where id = 31657;
update t_knowledge_point set title = $kp$Word 域代码与域结果的切换$kp$, content = $kp$域分为域代码和域结果，两者切换的快捷键是【Shift】+【F9】。$kp$, section = '' where id = 31659;
update t_knowledge_point set title = $kp$机器语言的缺点$kp$, content = $kp$机器语言程序难理解，编程效率低。$kp$, section = '' where id = 31665;
update t_knowledge_point set title = $kp$机器语言的优缺点与硬件依赖$kp$, content = $kp$机器语言程序难理解、编程效率低、不易维护，但执行效率高。机器语言对机器（CPU）有依赖性。$kp$, section = '' where id = 31666;
update t_knowledge_point set title = $kp$高级语言的优点$kp$, content = $kp$高级语言容易理解、记忆和使用，降低了编程难度。$kp$, section = '' where id = 31667;
update t_knowledge_point set title = $kp$机器语言：难维护但执行效率高$kp$, content = $kp$机器语言程序难理解、编程效率低、不易维护，执行效率高。$kp$, section = '' where id = 31729;
update t_knowledge_point set title = $kp$高级程序设计语言的基本成分$kp$, content = $kp$高级程序语言的基本成分：
① 数据成分：数据类型的定义、数据结构，程序员可以自定义数据类型。
② 运算成分：只要出现运算符的表达式。
③ 控制成分：三个基本结构——顺序、选择（`if`）、循环（`for`、`while`）。
④ 传输成分：输入输出语句，如 `printf`。$kp$, section = '' where id = 31742;
update t_knowledge_point set title = $kp$机器语言与高级语言的比较$kp$, content = $kp$- 机器语言对 CPU 有依赖性，可移植性差，但是执行效率高。
- 高级语言对人类而言容易理解、记忆和使用，降低了编程难度，提高了编程和维护效率。$kp$, section = '' where id = 31743;
update t_knowledge_point set title = $kp$C 语言是结构化程序设计语言$kp$, content = $kp$C 语言是一种结构化程序设计语言，其程序由三种基本结构组成：顺序结构、选择结构、循环结构。$kp$, section = '' where id = 31747;
update t_knowledge_point set title = $kp$结构化程序设计：自顶向下与模块化$kp$, content = $kp$自顶向下：程序设计时应先考虑总体，后考虑细节，从最上层总目标开始设计，逐步使问题具体化，不要一开始就追求众多细节。

模块化：把程序要解决的总目标分解为若干模块，每个模块完成一个子功能。$kp$, section = '' where id = 31797;
update t_knowledge_point set title = $kp$头文件、数据说明与程序注释（导读）$kp$, content = $kp$C 程序由三种基本结构（顺序结构、选择结构和循环结构）组成。本节介绍头文件、数据说明和程序注释。$kp$, section = '' where id = 31798;
update t_knowledge_point set title = $kp$两种注释方式的使用场景$kp$, content = $kp$使用 `/* ... */` 注释可以将多行文本作为注释，这种注释方式常用于对代码块进行描述和解释；使用 `//` 注释通常用于对单行代码进行注释和调试。$kp$, section = '' where id = 31876;
update t_knowledge_point set title = $kp$程序设计语言发展简史$kp$, content = $kp$- 最早的高级语言：Fortran（用于数值计算）、ALGOL。
- 与硬件结合最紧密的高级语言：C 语言。
- 20 世纪 90 年代以前：主要是面向过程的语言。
- 20 世纪 90 年代以后：主要是面向对象的语言，C++ 是当前面向对象的主流语言。
- Java 主要应用于网络环境，Python 主要用于人工智能。
- C# 既有 C 语言的严谨性，又有 Basic 语言的便捷性。$kp$, section = '' where id = 31878;
update t_knowledge_point set title = $kp$高级语言源程序的四种基本成分$kp$, content = $kp$高级语言源程序含有四种基本成分：
- 数据成分，如各种数据类型、用户自定义数据类型；
- 运算成分，如算术、关系、逻辑表达式；
- 控制成分，如条件和循环语句；
- 传输成分，如 I/O 输入和输出语句。$kp$, section = '' where id = 31879;
update t_knowledge_point set title = $kp$源程序书写规则与程序暂停$kp$, content = $kp$在 Windows 下运行控制台程序时，可在代码末尾加一行 `system("pause");`，让程序暂停，等待用户按键后再退出。

C 源程序书写的强制性规则：
1. 一个 C 语言源程序必须有且只有 1 个 main 函数。
2. 函数名后必须紧跟一对圆括号 `()`，函数体置于一对花括号 `{}` 中。
3. 每个程序体，即语句块（包括函数的函数体、含有多条语句的选择结构和循环结构中的内嵌语句序列），必须用一对花括号 `{}` 括起来。
4. 文件包含预处理命令 `#include` 应置于源程序的开始位置。
5. 语句末尾必须有分号 `;`；而预处理命令（`#include`、`#define`）和函数首部的末尾及右花括号 `}` 之后不要分号。
6. 同一字母的大、小写意义不同，关键字和标准库函数名必须用小写。
7. 变量必须先定义，后使用。
8. 关键字与其他字符之间必须有至少 1 个空格。
9. 注释必须包含在 `/*` 和 `*/` 之间，或 `//` 之后。$kp$, section = '' where id = 31881;
update t_knowledge_point set title = $kp$自由软件（开源软件）的含义$kp$, content = $kp$自由软件（开放源代码软件）的用户可以共享软件，允许随意拷贝、修改其源代码，允许销售和自由传播；对源代码的任何修改必须向全体用户公示；用户有进一步拷贝和修改的自由。

举例：Linux、TCP/IP 协议、Android。$kp$, section = '' where id = 31893;
update t_knowledge_point set title = $kp$主函数在源程序中的位置$kp$, content = $kp$主函数的位置不固定：既可以出现在自定义函数之前，也可以出现在自定义函数之后。$kp$, section = '' where id = 31921;
update t_knowledge_point set title = $kp$使用库函数前需引入头文件$kp$, content = $kp$使用标准库函数（`stdio.h`）、数学函数（`math.h`）、字符串函数（`string.h`）时，需要先引入对应的头文件。$kp$, section = '' where id = 31924;
update t_knowledge_point set title = $kp$计算机类专业综合操作技能考试范围$kp$, content = $kp$计算机专业大类专业综合操作技能考试以《计算机专业大类专业综合操作技能考试》考试大纲为依据，考试范围不能超出考试大纲。命题既要体现对计算机类专业所必需的专业综合操作技能的考核，又要体现对程序设计逻辑思维能力与解决实际问题能力的考核。

四、考查内容
（一）技能一：程序设计（C 语言）$kp$, section = '' where id = 31938;
update t_knowledge_point set title = $kp$编译预处理的特点$kp$, content = $kp$编译预处理不是 C 语言的一部分，不占运行时间，预处理命令末尾不加分号。

用 C 语言编写的程序称为源程序，它以 ASCII 码形式存放在文本文件中。$kp$, section = '' where id = 32070;
update t_knowledge_point set title = $kp$注释的考试要点$kp$, content = $kp$注释是近几年考试的重点：注释不是 C 语句，不占运行时间，末尾没有分号，并且注释不可以嵌套。$kp$, section = '' where id = 32076;
update t_knowledge_point set title = $kp$阅读 C 程序的方法$kp$, content = $kp$读程序都要从 `main()` 入口开始，然后从最上面顺序往下读（碰到循环就执行循环，碰到选择就执行选择）。一个 C 程序有且只有一个 `main` 函数。$kp$, section = '' where id = 32078;
update t_knowledge_point set title = $kp$宏定义末尾不能加分号$kp$, content = $kp$编译预处理不是 C 语言的一部分，不占运行时间，预处理命令末尾不要加分号。例如 `#define PI 3.1415926;` 这种写法是错误的，宏定义中一定不能出现分号。$kp$, section = '' where id = 32080;
update t_knowledge_point set title = $kp$C 程序的扩展名与运行步骤$kp$, content = $kp$用 C 语言编写的程序称为源程序，扩展名是 `.c`。C 程序必须经过编辑、编译、链接、运行四个步骤才能得到运行结果。注意：`.c` 和 `.obj` 文件是无法运行的，只有 `.exe` 文件才可以运行。$kp$, section = '' where id = 32081;
update t_knowledge_point set title = $kp$常用的 C 语言编译环境$kp$, content = $kp$Cfree、VC/VC++、Code::Blocks 等是用于编写和运行 C 语言程序的软件（编译环境）。$kp$, section = '' where id = 32082;
update t_knowledge_point set title = $kp$在 Word 中选定整篇文档$kp$, content = $kp$选定整篇文档有以下几种方法：
- 方法一：将鼠标指针移到文档中任意正文的左侧，直到指针变为指向右边的箭头，然后三击。
- 方法二：按 `Ctrl+A`。
- 方法三：按住 `Ctrl`，将鼠标指针移到文档中任意正文的左侧，直到指针变为指向右边的箭头，单击。
- 方法四：选择“编辑”→“全选”。$kp$, section = '' where id = 32103;
update t_knowledge_point set title = $kp$程序设计语言基本成分详解$kp$, content = $kp$程序设计语言中的基本成分有四种：数据成分、运算成分、控制成分和传输成分。

① 数据成分：用来描述程序所处理的数据对象，如对数据类型和结构的说明。
常见的数据类型：
- 算术数据类型；
- 枚举数据类型，用一组枚举值为数据提供便于记忆的标识符；
- 数组数据类型，是一组类型相同的有序数据的集合；
- 指针数据类型，表示数据对象的地址；
- 用户自定义类型。

例如 `int a = 2;` 属于数据成分，变量 a 与数值 2 都是数据成分；`int` 是变量 a 的数据类型，即整型。

记住：数据类型决定了数据或变量在内存中占用的字节数量（即数据的大小）；数据的作用域表示数据在哪个范围内可以使用。

② 运算成分：用来描述程序所包含的运算，如算术和逻辑表达式。

③ 控制成分：用来表达程序中的控制构造。

④ 传输成分：用来表达程序中数据的传输，如 I/O 语句与赋值语句（例如 `x = 3;` 表示将数值 3 传送给变量 x）。

例如 `printf("Hello");` 或 `scanf("%d", &x);` 都是传输成分。

补充要点：
1. 任何正规程序都可以由三种结构组成：顺序结构、条件选择结构和重复结构。
2. `if (P) A else B` 的含义是：若 P 为真，做 A，否则做 B；A 与 B 不会同时执行。
3. `while (P) S` 的含义是：当 P 为真时，反复做 S，一直做到 P 为假为止。注意 S 可能一次也不执行，即执行次数最少是 0 次，因为先判断 P，若 P 一开始就为假，则 S 没有执行的机会。
4. `for (P1; P2; P3) A` 的含义是：`P1; while (P2) { A; P3; }`。$kp$, section = '' where id = 32105;
update t_knowledge_point set title = $kp$C 源程序的组成与书写要点$kp$, content = $kp$C 语言源程序的主要组成是函数。函数包括主函数（main 函数）和其他函数（自定义函数、库函数）。

1. C 源程序由若干个函数构成，C 程序的基本组成单位是函数。
2. 一个 C 程序的执行从主函数开始，到主函数结束；主函数可以位于程序的任意位置。
3. 每条语句、数据定义、函数声明等最后必须有一个分号，分号是 C 语句的必要组成部分。
4. C 程序书写的格式是自由的。
5. C 语言本身没有输入输出语句，输入输出通过调用标准库函数实现。
6. 注释可以使用 `//` 行注释，也可以使用 `/* */` 块注释。

注意：C 语言区分大小写（关键字要小写）；变量先定义后使用；函数先声明或定义后使用。$kp$, section = '' where id = 32111;
update t_knowledge_point set title = $kp$头文件的包含格式与常用头文件$kp$, content = $kp$格式：`#include <头文件名>` 或 `#include "头文件名"`。

```c
#include <stdio.h>   /* 标准输入输出 */
#include <string.h>  /* 字符串相关函数 */
#include <math.h>    /* 数学相关函数 */
#include <stdlib.h>  /* 标准库：malloc、realloc、calloc、free 等动态内存函数，atoi、atof、strtoul 等字符串转数值函数 */
#include "my.h"      /* 用户自己的头文件 */
```$kp$, section = '' where id = 32114;
update t_knowledge_point set title = $kp$include 命令的书写形式$kp$, content = $kp$调用 C 语言标准库函数时要包含 include 命令。include 命令行以 `#` 开头，后面是用双引号 `""` 或尖括号 `<>` 括起来的、后缀为 `.h` 的头文件。$kp$, section = '' where id = 32211;
update t_knowledge_point set title = $kp$编译预处理命令行与常用头文件$kp$, content = $kp$以 `#` 开头的一行称为编译预处理命令行。预处理命令行不是 C 语句，末尾不加分号，不占运行时间。

常用库函数头文件：
- `<stdio.h>`：标准输入输出函数（`getchar`、`putchar`、`gets`、`printf`、`scanf` 等）
- `<stdlib.h>`：`abs` 绝对值函数等
- `<string.h>`：字符串函数（`strcmp`、`strcpy`、`strcat`、`strlen` 等）
- `<ctype.h>`：字符函数（`islower`、`isupper`、`tolower`、`toupper` 等）
- `<math.h>`：数学函数（`sqrt`、`sin`、`pow`、`fabs` 等）$kp$, section = '' where id = 32212;
update t_knowledge_point set title = $kp$UML 状态及其组成要素$kp$, content = $kp$状态表示对象生命周期中的一种条件或情况。状态可以是单一的，也可以是嵌套的：嵌套在另一个状态中的状态称为子状态，含有子状态的状态称为组合状态。活动可以在状态内执行，也可以在状态迁移时执行。

状态的组成要素：
① 状态名称：把一个状态与其他状态区分开来，必须在当前层次内保持唯一。没有名称的状态称为匿名状态。
② 入口动作与出口动作：由其他状态转移到当前状态、或从当前状态转移到其他状态时附带完成的动作，分别表示为 `entry / 动作表达式` 和 `exit / 动作表达式`。
③ 内部执行活动：对象进入一个状态时，在执行完入口动作后开始执行该活动，用 `do / 活动表达式` 表示。
④ 内部转换：不导致状态改变的转换，只有源状态而没有目标状态，表示为 `事件名称（事件参数）/ 活动表达式`。
⑤ 可推迟事件：不会触发状态转换，事件在该状态下可以被推迟但不会丢失，格式为 `事件名称 / defer`。$kp$, section = '' where id = 32220;
update t_knowledge_point set title = $kp$UML 中间状态的组成$kp$, content = $kp$中间状态包括：状态名、进入/退出动作（entry/exit action）、内部转换（不涉及状态改变，一般表示为 `事件名 / 动作表达式`）和子状态。$kp$, section = '' where id = 32221;
update t_knowledge_point set title = $kp$main 函数的函数体与常见写法$kp$, content = $kp$整个 main 函数由一对花括号 `{ }` 括起来，即函数体。

```c
#include <stdio.h>

int main(void)
{
    /* 要求掌握的标准写法 */
    return 0;
}
```

```c
#include <stdio.h>

int main()
{
    return 0;
}
```

旧教材中还可以见到省略返回类型的写法：

```c
main()
{
}
```

现代 C 语言不推荐这种写法。$kp$, section = '' where id = 32257;
update t_knowledge_point set title = $kp$文件包含及其嵌套$kp$, content = $kp$文件包含（`#include`）可以嵌套使用。`#include <stdio.h>` 就是一种文件包含。$kp$, section = '' where id = 32258;
update t_knowledge_point set title = $kp$宏定义的基本用法$kp$, content = $kp$宏定义格式：`#define 名称 内容`。

使用规则：预处理时把程序中出现的所有该名称替换成对应的内容。$kp$, section = '' where id = 32259;
update t_knowledge_point set title = $kp$程序设计（C 语言）考试说明$kp$, content = $kp$技能一：程序设计（C 语言）考试分值约占 40%（32 分）。

教程中的颜色标记：
- 红色字体：核心高频（必须熟记）
- 绿色字体：重点内容（必须熟悉）
- 黄色字体：难点内容（尽量掌握）
- 黑色字体：常规内容（必须了解）
- 蓝色字体：代码关键字等相关内容

第一部分：C 语言程序的结构
1.1 程序的构成，main 函数和其他函数$kp$, section = '' where id = 32614;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (27750,30280,30281,30314,30329,30333,30431,30432,30442,30446,30447,30460,30465,30467,30469,30472,30478,30499,30509,30517,30518,30531,30532,30536,30543,30546,30551,30584,30593,30604,30630,30635,30637,30652,30666,30667,30673,30888,31305,31331,31332,31335,31605,31619,31620,31657,31659,31665,31666,31667,31729,31742,31743,31747,31797,31798,31876,31878,31879,31881,31893,31921,31924,31938,32070,32076,32078,32080,32081,32082,32103,32105,32111,32114,32211,32212,32220,32221,32257,32258,32259,32614) and not deleted) <> 82 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
