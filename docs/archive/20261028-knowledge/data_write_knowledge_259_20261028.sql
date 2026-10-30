-- 知识点 259 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_259
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_259 as
select * from t_knowledge_point where id in (28573,30270,30430,30433,30483,30512,30520,30526,30527,30540,30585,30588,30589,30597,30599,30605,30608,30609,30610,30616,30621,30622,30624,30627,30628,30646,30647,30648,30656,31100,31307,31308,31310,31312,31392,31393,31394,31395,31402,31403,31654,31727,31762,31763,31764,31765,31766,31767,31768,31769,31788,31790,31813,31814,31815,31869,31883,31886,31901,31928,31929,31930,31931,32106,32107,32116,32196,32197,32198,32199,32200,32201,32202,32203,32204,32205,32206,32207,32208,32209,32210,32214,32229,32233,32246,32247,32248,32311,32312,32313,32314,32315,32316,32317,32318,32319,32320,32321,32331,32398);

update t_knowledge_point set title = $kp$数据的存储结构$kp$, content = $kp$# 数据的存储结构

任何逻辑结构都可以采用顺序存储和链式存储这两种存储结构。$kp$, section = '' where id = 28573;
update t_knowledge_point set title = $kp$read_char 函数读取字符串$kp$, content = $kp$# 用 read_char 函数读取字符串

```c
#include <stdio.h>
#include <stdlib.h>

#define N 10

char *read_char(char *st, int n);

int main(void) {
    char str[N];
    puts("Start to test function. Enter a string.");
    read_char(str, N);
    puts("The string you input is:");
    puts(str);
    system("pause");
    return 0;
}

char *read_char(char *st, int n) {
    int i = 0;
    do {
        st[i] = getchar();
    } while (st[i] != '\n' && ++i < n - 1);
    st[i] = '\0';
    return st;
}
```

说明：`read_char` 用 `getchar` 逐个读取字符，最多读取 `n-1` 个字符，遇到换行符时停止，并在末尾补 `'\0'`。$kp$, section = '' where id = 30270;
update t_knowledge_point set title = $kp$将最小值移到开头、最大值移到末尾$kp$, content = $kp$# 将最小值移到开头、最大值移到末尾

```c
#include <stdio.h>

#define N 10

void crl(int a[]) {
    int i, j, max = 0, min = 0, temp;

    for (i = 1; i < N; i++)
        if (a[min] > a[i])
            min = i;
    temp = a[min];
    j = min;
    while (j > 0) {
        a[j] = a[j - 1];
        j--;
    }
    a[0] = temp;

    for (i = 1; i < N; i++)
        if (a[max] < a[i])
            max = i;
    temp = a[max];
    j = max;
    while (j < N - 1) {
        a[j] = a[j + 1];
        j++;
    }
    a[N - 1] = temp;
}

int main(void) {
    int a[N] = {8, 5, 6, 9, 4, 1, -1, 7, 3, 2};
    int i;
    crl(a);
    for (i = 0; i < N; i++)
        printf("%d ", a[i]);
    printf("\n");
    return 0;
}
```

说明：先在数组中找最小值并移到最前面，再重新找最大值并移到最后面。$kp$, section = '' where id = 30430;
update t_knowledge_point set title = $kp$冒泡排序程序填空$kp$, content = $kp$# 冒泡排序程序填空

以下程序的功能是用冒泡法对数组 a 进行由小到大的排序。需要在函数 `fun` 中补全排序代码。

```c
void fun(int a[], int n)
```$kp$, section = '' where id = 30433;
update t_knowledge_point set title = $kp$字符数组初始化与赋值$kp$, content = $kp$# 字符数组初始化与赋值

`char s[5] = "ABCD";` 是合法的字符数组初始化，数组元素依次为 `'A'`、`'B'`、`'C'`、`'D'`、`'\0'`。

字符串常量不能直接赋给数组名：

```c
char s[5];
s = "ABCD";   /* 错误：数组名是地址常量 */
```$kp$, section = '' where id = 30483;
update t_knowledge_point set title = $kp$字符数组元素个数$kp$, content = $kp$# 字符数组元素个数

`char s[5] = "ABCD!";` 用 5 个元素存放 5 个字符，没有空间存放结束符 `'\0'`，因此它只是字符数组，不能当作字符串使用。

`char s[6] = "ABCD!";` 有 6 个元素，最后一个元素为 `'\0'`，可以当作字符串。

`char c[11] = "technology";` 中 `"technology"` 有 10 个字符，加上结束符共 11 个字节，因此数组 c 有 11 个元素。$kp$, section = '' where id = 30512;
update t_knowledge_point set title = $kp$函数之间的值传递$kp$, content = $kp$# 函数之间的值传递

C 语言函数参数采用值传递：形参是实参的副本，在函数中交换形参不会影响实参。

```c
#include <stdio.h>

void fun(int x, int y) {
    int t;
    t = x;
    x = y;
    y = t;
}

int main(void) {
    int a = 3, b = 5;
    fun(a, b);
    printf("%d, %d\n", a, b);   /* 输出 3, 5 */
    return 0;
}
```$kp$, section = '' where id = 30520;
update t_knowledge_point set title = $kp$字符串指针要点$kp$, content = $kp$# 字符串指针要点

- 字符串以 `'\0'` 作为结束标志。
- C 语言中没有字符串变量，字符串用字符数组或字符指针处理。$kp$, section = '' where id = 30526;
update t_knowledge_point set title = $kp$二维字符数组与指针$kp$, content = $kp$# 二维字符数组与指针

```c
char s[2][5] = {"ABC", "DEF"}, *p = &s[0][0];
printf("%s", p + 5);   /* 输出 DEF */
```

说明：`p` 指向 `s[0][0]`，`p + 5` 跳过第一行的 5 个元素，指向 `s[1][0]`，因此输出第二行的字符串。$kp$, section = '' where id = 30527;
update t_knowledge_point set title = $kp$数组递推程序填空$kp$, content = $kp$# 数组递推程序填空

程序用数组 `f` 进行递推计算，输入 `k`、`m` 后输出 `f[m]`。原题中有两处需要填空：

- `f[【？】] = 1;`
- 循环中的 `f[i] 【？】 f[j];`$kp$, section = '' where id = 30540;
update t_knowledge_point set title = $kp$选择排序函数示例$kp$, content = $kp$# 选择排序函数示例

```c
#include <stdio.h>
#include <stdlib.h>

void min(void) {
    int a[6] = {9, 8, 7, 6, 5, 4};
    int i, j, min, t;
    int n = sizeof(a) / sizeof(a[0]);

    for (j = 0; j < n - 1; j++) {
        min = j;
        for (i = j + 1; i < n; i++)
            if (a[min] > a[i])
                min = i;
        t = a[min];
        a[min] = a[j];
        a[j] = t;
    }

    for (i = 0; i < n; i++)
        printf("%d\n", a[i]);
    printf("\n");
    system("pause");
}
```

说明：外层循环确定当前要放置最小元素的位置，内层循环在剩余元素中找最小值，然后交换。$kp$, section = '' where id = 30585;
update t_knowledge_point set title = $kp$一维数组的定义$kp$, content = $kp$# 一维数组的定义

一维数组的定义形式为：

```c
类型符 数组名[常量表达式];
```

例如 `int a[10];` 定义了 10 个元素，下标为 `a[0]` 到 `a[9]`。

数组长度必须是整型常量或整型常量表达式：

```c
int a[8];       /* 合法 */
int b[2 + 6];   /* 合法 */
int c[8.2];     /* 非法：长度不是整数 */
```

用符号常量定义长度：

```c
#define N 10
int a[N];       /* 合法 */
```

在 C89 中，数组长度不能是普通变量；C99 起支持变长数组：

```c
int n = 10;
int a[n];       /* C99 合法，C89 不合法 */
```$kp$, section = '' where id = 30588;
update t_knowledge_point set title = $kp$二维数组的地址与元素引用$kp$, content = $kp$# 二维数组的地址与元素引用

```c
int a[3][4];
```

`a` 是二维数组名，表示二维数组的首地址，即第 0 行的地址。访问元素时，先得到行地址，再得到列地址，最后取出元素内容。

设 `int a[2][3] = {1, 2, 3, 4, 5, 6};`，则：

- `a + 1` 是第 1 行的地址。
- `*(a + 1) + 2` 是第 1 行第 2 列的地址，即 `&a[1][2]`。
- `*(*(a + 1) + 2)` 是第 1 行第 2 列的内容，即 `a[1][2]`，值为 6。
- `a[1] + 2` 是第 1 行第 2 列的地址，即 `&a[1][2]`。
- `*(a[1] + 2)` 是第 1 行第 2 列的内容，即 `a[1][2]`，值为 6。

一维数组元素的两种引用形式：

```c
a[i]
*(a + i)
```

二维数组元素的四种等价形式：

```c
a[i][j]
*(*(a + i) + j)
*(a[i] + j)
(*(a + i))[j]
```

对于 `int a[2][3] = {1, 2, 3, 4, 5, 6};`：

- `*(*(a + 1) + 2) = 6`，即 `a[1][2]`。
- `*(a[0] + 2) = 3`，即 `a[0][2]`。
- `*(*(a + 0) + 1) = 2`，即 `a[0][1]`。
- `*(a[1] + 1) = 5`，即 `a[1][1]`。$kp$, section = '' where id = 30589;
update t_knowledge_point set title = $kp$strlen 与 sizeof 的区别$kp$, content = $kp$# strlen 与 sizeof 的区别

`strlen` 求字符串长度，即 `'\0'` 之前的字符个数；`sizeof` 求数组或类型所占的总字节数。

| 表达式 | 结果 |
| --- | --- |
| `strlen("ABCD")` | 4 |
| `strlen("\t\"\xff\065\n")` | 5 |
| `strlen("\141\\141abc\t")` | 9 |
| `strlen("hello\0\t\'11")` | 5 |

```c
char s[] = "ABCD";
char t[10] = "ABCD";
```

`strlen(s) = 4`，`sizeof(s) = 5`（含 `'\0'`），`sizeof(t) = 10`。

说明：`strlen` 不计结束符 `'\0'`，`sizeof` 计算整个数组所占的空间。$kp$, section = '' where id = 30597;
update t_knowledge_point set title = $kp$字符数组的定义$kp$, content = $kp$# 字符数组的定义

```c
char a[5];          /* 定义长度为 5 的字符数组 */
char b[] = "abc";   /* 用字符串常量初始化，长度为 4 */
char *p = "abc";    /* 字符指针指向字符串常量 */
```$kp$, section = '' where id = 30599;
update t_knowledge_point set title = $kp$一维数组的初始化$kp$, content = $kp$# 一维数组的初始化

以下各例相互独立：

```c
int a[3] = {1, 2, 3};   /* 三个元素分别为 1、2、3 */
int a[5] = {1, 2, 3};   /* 后两个元素自动为 0 */
int a[5] = {1, 2, 3, 4, 5};
```

`int a[5] = {1, 2, 3};` 的存储情况：

| a[0] | a[1] | a[2] | a[3] | a[4] |
| --- | --- | --- | --- | --- |
| 1 | 2 | 3 | 0 | 0 |

说明：初始化时若给出的元素个数少于数组长度，其余元素自动置 0。若省略数组长度，数组长度由初始化元素的个数决定。$kp$, section = '' where id = 30605;
update t_knowledge_point set title = $kp$字符数组与字符串$kp$, content = $kp$# 字符数组与字符串

```c
char s[5] = "ABCD";
```

初始化后，数组元素依次为 `'A'`、`'B'`、`'C'`、`'D'`、`'\0'`，可以当作字符串使用。$kp$, section = '' where id = 30608;
update t_knowledge_point set title = $kp$strcat 字符串连接$kp$, content = $kp$# strcat 字符串连接

```c
char s[20] = "ABC";
char t[20] = "DEF";
strcat(s, t);
printf("%s, %s\n", s, t);   /* 输出 ABCDEF, DEF */
```

说明：`strcat` 把字符串 `t` 连接到字符串 `s` 的末尾，结果存放在 `s` 中；`s` 必须有足够的空间，`t` 保持不变。$kp$, section = '' where id = 30609;
update t_knowledge_point set title = $kp$数组指针$kp$, content = $kp$# 数组指针

```c
int (*p)[4];
```

说明：`p` 是指向“含有 4 个 int 元素的一维数组”的指针，该数组的长度为 4。$kp$, section = '' where id = 30610;
update t_knowledge_point set title = $kp$一维数组的引用$kp$, content = $kp$# 一维数组的引用

```c
int a[4];
a[0] = 2;
a[1] = a[0] + 3;
a[4] = a[0] + a[1];   /* 错误：a 的合法下标是 0～3，a[4] 越界 */
```

说明：数组元素通过 `数组名[下标]` 引用，下标从 0 开始；引用时不能超出数组范围。$kp$, section = '' where id = 30616;
update t_knowledge_point set title = $kp$strcpy 字符串复制$kp$, content = $kp$# strcpy 字符串复制

```c
char s[20] = "ABC";
char t[20] = "DEF";
strcpy(s, t);
printf("%s, %s\n", s, t);   /* 输出 DEF, DEF */
```

说明：`strcpy` 把字符串 `t`（包括结束符 `'\0'`）复制到 `s` 中，`s` 中原来的内容被整体替换；`s` 必须有足够的空间。$kp$, section = '' where id = 30621;
update t_knowledge_point set title = $kp$字符串指针与字符取值$kp$, content = $kp$# 字符串指针与字符取值

```c
char *p = "ABCD";
printf("%d\n", *(p + 4));   /* 0，即字符串结束符 '\0' */

char s[] = "distance";
char *q = s;
printf("%c\n", *(q + 2));   /* s */

char t[] = "gLister";
char *r = t;
printf("%c\n", *(r + 4));   /* t */
```

说明：`*(p + i)` 取出指针 `p` 后面第 `i` 个字符；字符串常量末尾有结束符 `'\0'`，其值为 0。$kp$, section = '' where id = 30622;
update t_knowledge_point set title = $kp$字符数组的初始化$kp$, content = $kp$# 字符数组的初始化

以下各例相互独立：

```c
char s[5] = {'A', 'B', 'C', 'D', 'E'};
char s[5] = {'A', 'B'};   /* 未指定的元素自动补 0，即 '\0' */
```

说明：初始化时没有显式给出的元素会被置为 0；字符 `'\0'` 也可以写成 `0`。$kp$, section = '' where id = 30624;
update t_knowledge_point set title = $kp$指向一维数组元素的指针$kp$, content = $kp$# 指向一维数组元素的指针

①

```c
int a[5] = {12, 24, 36, 48, 60}, *p, *q;
p = a;
q = p + 1;
```

`*p = 12`，`*(p + 2) = 36`，`q[2] = 48`，`*q + 4 = 28`。

②

```c
int a[5] = {5, 10, 15, 20, 25}, *p = a;
printf("%d\n", *++p);   /* 先使 p 指向 a[1]，输出 10 */
printf("%d\n", ++*p);   /* 使 a[1] 加 1，输出 11 */
```

③

```c
int a[10], *p = a;
p++;        /* 合法：p 是地址变量 */
a++;        /* 非法：a 是地址常量 */
++p;        /* 合法 */
++a;        /* 非法 */
```

说明：数组名是地址常量，不能进行自增、自减或赋值；指针变量可以改变。地址之间可以比较大小。$kp$, section = '' where id = 30627;
update t_knowledge_point set title = $kp$用指针访问二维数组$kp$, content = $kp$# 用指针访问二维数组

```c
int a[2][3] = {1, 2, 3, 4, 5, 6}, *p;
int m, s;

p = &a[0][0];
m = (*p) * (*(p + 2)) * (*(p + 4));   /* 1 * 3 * 5 = 15 */
s = p[1] + p[3] + p[5];               /* 2 + 4 + 6 = 12 */
```

说明：二维数组在内存中按行连续存放，把二维数组看成一维数组，用指向首元素的指针即可顺序访问所有元素。$kp$, section = '' where id = 30628;
update t_knowledge_point set title = $kp$一维数组的遍历$kp$, content = $kp$# 一维数组的遍历

一维数组的元素在内存中连续存放，可以用循环配合下标逐个访问。

```c
int a[5], i;
for (i = 0; i < 5; i++)
    a[i] = i;
```$kp$, section = '' where id = 30646;
update t_knowledge_point set title = $kp$strcmp 字符串比较$kp$, content = $kp$# strcmp 字符串比较

- `strcmp("ABC", "ABB") > 0`，因为 `'C' > 'B'`，串 1 大于串 2，返回正数。
- `strcmp("ABC", "ACB") < 0`，因为第二个字符 `'B' < 'C'`，返回负数（常见实现为 -1）。

说明：`strcmp` 按字符的 ASCII 值逐个比较，返回 0 表示相等，返回正数表示串 1 大，返回负数表示串 1 小。$kp$, section = '' where id = 30647;
update t_knowledge_point set title = $kp$指针数组$kp$, content = $kp$# 指针数组

```c
int *q[3];
```

说明：`q` 是由三个指针变量构成的数组，`q[0]`、`q[1]`、`q[2]` 均为 `int *` 类型，简称指针数组。$kp$, section = '' where id = 30648;
update t_knowledge_point set title = $kp$结构体数组排序题目要求$kp$, content = $kp$# 结构体数组排序题目要求

使用结构体数组实现排序。程序中不得修改结构体定义，不得修改 `main` 函数中给定的主体代码，只需在标出的位置填写代码。排序算法不限，可以使用选择排序或冒泡排序。$kp$, section = '' where id = 30656;
update t_knowledge_point set title = $kp$一维数组的地址$kp$, content = $kp$# 一维数组的地址

```c
int a[10];
```

`a` 是一维数组名，表示一维数组的首地址，即第 0 个元素 `a[0]` 的地址。

数组名的等价关系：

```c
a        等价于 &a[0]
a + i    等价于 &a[i]
*(a + i) 等价于 a[i]
```

例如：

```c
int a[5] = {1, 2, 3, 4, 5};
```

`a[0] = 1`，`*(a + 2) = 3`，`a[2] = 3`，`*a = 1`。$kp$, section = '' where id = 31100;
update t_knowledge_point set title = $kp$顺序栈的基本运算$kp$, content = $kp$# 顺序栈的基本运算

1. 入栈：在栈顶插入新元素。先判断栈满（`top == arrmax`），若满则上溢，结束；否则 `top++`，把新元素放入栈顶位置。
2. 退栈：删除栈顶元素。先判断栈空（`top == 0`），若空则下溢，结束；否则把栈顶元素赋给指定变量，再 `top--`。
3. 读栈顶：先判断栈空（`top == 0`），若空则结束；否则把栈顶元素赋给变量，栈顶指针不变，不删除元素。

在栈中，栈底保持不变；元素入栈时栈顶指针增加，元素出栈时栈顶指针减小。

输入序列为 `abc` 时，全部可能的输出序列：

- `a` 进 `a` 出，`b` 进 `b` 出，`c` 进 `c` 出：`abc`
- `a` 进 `a` 出，`b` 进 `c` 进 `c` 出 `b` 出：`acb`
- `a` 进 `b` 进 `b` 出 `a` 出，`c` 进 `c` 出：`bac`
- `a` 进 `b` 进 `b` 出 `c` 进 `c` 出 `a` 出：`bca`
- `a` 进 `b` 进 `c` 进 `c` 出 `b` 出 `a` 出：`cba`

栈的应用：括号匹配、字符串回文判断、递归调用等。$kp$, section = '' where id = 31307;
update t_knowledge_point set title = $kp$单链表插入操作$kp$, content = $kp$# 单链表插入操作

插入有两种方式：

- 前插入法：在位置 i 之前插入，需要遍历到 i-1 位置，时间复杂度 O(n)。
- 后插入法：在位置 i 之后直接插入，时间复杂度 O(1)。

在结点 `p` 之后插入结点 `s` 的核心代码：

```c
s->next = p->next;
p->next = s;
```$kp$, section = '' where id = 31308;
update t_knowledge_point set title = $kp$双向链表$kp$, content = $kp$# 双向链表

双向链表的每个结点设置两个指针：左指针 `Llink` 指向前件结点，右指针 `Rlink` 指向后件结点。插入和删除时需要同时修改两个方向的指针。

删除 `p` 的后继结点 `q` 的核心代码：

```c
q = p->next;
p->next = q->next;
if (q->next != NULL)
    q->next->prior = p;
free(q);
```$kp$, section = '' where id = 31310;
update t_knowledge_point set title = $kp$双向链表、循环链表与树$kp$, content = $kp$# 双向链表、循环链表与树

## 双向链表

每个结点有两个指针：`prior` 指向前件结点，`next` 指向后件结点。

在结点 `p` 之后插入结点 `s`：

```c
s->prior = p;
s->next = p->next;
if (p->next != NULL)
    p->next->prior = s;
p->next = s;
```

删除 `p` 的后继结点 `q`：

```c
q = p->next;
p->next = q->next;
if (q->next != NULL)
    q->next->prior = p;
free(q);
```

## 循环链表

循环链表中最后一个结点的指针域指向头结点，所有结点构成一个环。带头结点时，空表的判断为 `head->next == head`；指针 `p` 指向链尾的条件是 `p->next == head`。

双循环链表中，尾结点的 `next` 指向头结点，头结点的 `prior` 指向尾结点。

若用指针指向单循环链表的链尾，则访问第一个元素和最后一个元素的时间都是 O(1)。

## 顺序存储与链式存储

- 顺序存储：相邻数据元素的存放地址也相邻，逻辑与物理统一；要求存储单元地址连续。优点是存储密度大、空间利用率高；缺点是插入或删除元素时需要移动大量元素。
- 链式存储：相邻数据元素可以随意存放，每个结点分为数据域和指针域。优点是插入、删除方便、使用灵活；缺点是存储密度较小。

## 树的基本概念

- 结点的度：结点拥有的子树个数。
- 树的度：树中所有结点度的最大值。
- 叶子结点：度为 0 的结点，即没有子树的结点。
- 分支结点：度不为 0 的结点。
- 根结点：树的最开始的结点。
- 孩子结点和双亲结点：某结点子树的根称为该结点的孩子，该结点称为孩子的双亲（父结点）。
- 结点的层次：根结点在第 1 层，同一层上结点的子结点在下一层。
- 树的深度：树中结点的最大层次。
- 树的高度：从叶子结点所在层向上数，一般等于深度。
- 森林：m（m ≥ 0）棵互不相交的树的集合。

## 二叉树

二叉树是 n（n ≥ 0）个结点的有限集合，它或者是空树，或者由一个根结点及两棵互不相交的、分别称为左子树和右子树的二叉树组成。每个结点最多有两棵子树，且左右子树不能互换。

二叉树的五种形态：空二叉树、只有根结点、只有左子树、左右子树均非空、只有右子树。

性质：

1. 在二叉树的第 k 层上，最多有 2^(k-1) 个结点（k ≥ 1）。
2. 深度为 m 的二叉树最多有 2^m - 1 个结点。
3. 任意一棵二叉树中，度为 0 的结点数 n0 总比度为 2 的结点数 n2 多 1，即 n0 = n2 + 1。
4. 具有 n 个结点的二叉树，其深度不小于 floor(log2 n) + 1。

一般二叉树的顺序存储：为了用数组中的相对位置表示结点之间的逻辑关系，需要增加虚结点，把一般二叉树补成完全二叉树，这可能造成存储空间浪费。最坏情况下，一棵深度为 k、只有 k 个结点的单支二叉树需要 2^k - 1 个结点的存储空间。

满二叉树：深度为 m 且有 2^m - 1 个结点的二叉树。每一层的结点数都达到最大值，不存在度为 1 的结点，所有叶子结点都在第 m 层。

完全二叉树：除最后一层外，每一层上的结点数均达到最大值；最后一层只缺少右边连续的若干结点。

- 具有 n 个结点的完全二叉树的深度为 floor(log2 n) + 1。
- 完全二叉树中度为 1 的结点数为 0 或 1。$kp$, section = '' where id = 31312;
update t_knowledge_point set title = $kp$冒泡排序（升序）$kp$, content = $kp$# 冒泡排序（升序）

以数组 `3, 6, 4, 2, 11, 10, 5` 为例，每趟排序后的结果：

| 状态 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 初始 | 3 | 6 | 4 | 2 | 11 | 10 | 5 |
| 第 1 趟 | 3 | 4 | 2 | 6 | 10 | 5 | 11 |
| 第 2 趟 | 3 | 2 | 4 | 6 | 5 | 10 | 11 |
| 第 3 趟 | 2 | 3 | 4 | 5 | 6 | 10 | 11 |
| 第 4 趟 | 2 | 3 | 4 | 5 | 6 | 10 | 11 |
| 第 5 趟 | 2 | 3 | 4 | 5 | 6 | 10 | 11 |
| 第 6 趟 | 2 | 3 | 4 | 5 | 6 | 10 | 11 |

```c
// 冒泡排序
int arr[10] = {2, 3, 5, 6, 4, 8, 1, 0, 9, 7};
int i, j, temp;
int len = sizeof(arr) / sizeof(arr[0]);   // 求数组长度

/* 外循环为排序趟数，比较 len-1 趟 */
for (i = 0; i < len - 1; i++) {
    /* 内循环为每趟比较次数 */
    for (j = 0; j < len - 1 - i; j++) {
        if (arr[j] > arr[j + 1]) {
            temp = arr[j];
            arr[j] = arr[j + 1];
            arr[j + 1] = temp;
        }
    }
}
```$kp$, section = '' where id = 31392;
update t_knowledge_point set title = $kp$直接插入排序$kp$, content = $kp$# 直接插入排序

原理：每一步将一个待排序元素按其排序码大小插入到前面已经排好序的元素的适当位置，直到全部元素插入为止。

以 `49, 38, 65, 97, 76, 13, 27, 49` 为例，每趟结束后已排序部分依次为：

`(49)` → `(38 49)` → `(38 49 65)` → `(38 49 65 97)` → `(38 49 65 76 97)` → `(13 38 49 65 76 97)` → `(13 27 38 49 65 76 97)` → `(13 27 38 49 49 65 76 97)`

```c
// 直接插入排序
int arr[10] = {2, 5, 4, 7, 9, 6, 0, 3, 1, 8};   // 待排序数组
int i, j, temp;
int len = sizeof(arr) / sizeof(arr[0]);           // 数组长度

for (i = 1; i < len; i++) {
    temp = arr[i];
    for (j = i - 1; j >= 0 && arr[j] > temp; j--)
        arr[j + 1] = arr[j];
    arr[j + 1] = temp;
}
```$kp$, section = '' where id = 31393;
update t_knowledge_point set title = $kp$顺序查找$kp$, content = $kp$# 顺序查找

顺序查找从数组的一端开始，依次比较每个元素，直到找到目标或遍历完整个数组。遍历顺序可以从左向右，也可以从右向左。

```c
int arr[10] = {2, 5, 4, 7, 9, 6, 0, 3, 1, 8};
int nNum = 4;                                // 需要查询的数
int i;
int nAddr = -1;                              // 找到后的下标，-1 表示未找到
int arrSize = sizeof(arr) / sizeof(arr[0]);

for (i = 0; i < arrSize; i++) {
    if (arr[i] == nNum) {
        nAddr = i;
        break;
    }
}
```$kp$, section = '' where id = 31394;
update t_knowledge_point set title = $kp$二分查找（折半查找）$kp$, content = $kp$# 二分查找（折半查找）

二分查找要求数组有序。每次取中间位置的元素与目标比较，根据比较结果把查找区间缩小一半。

```c
int arr[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};   // 数组必须有序
int left, right, mid;
int nNum = 4;                                    // 需要查询的数
int nAddr = -1;                                  // 找到后的下标，-1 表示未找到

left = 0;
right = sizeof(arr) / sizeof(arr[0]) - 1;

while (left <= right) {
    mid = (left + right) / 2;
    if (arr[mid] < nNum) {
        left = mid + 1;          /* 目标在右半区 */
    } else if (arr[mid] > nNum) {
        right = mid - 1;         /* 目标在左半区 */
    } else {
        nAddr = mid;             /* 找到 */
        break;
    }
}

printf("%d 在数组中%s，位置是 %d\n", nNum,
       nAddr != -1 ? "已找到" : "未找到", nAddr + 1);
```$kp$, section = '' where id = 31395;
update t_knowledge_point set title = $kp$strcat 函数原型$kp$, content = $kp$# strcat 函数原型

```c
char *strcat(char *dest, const char *src);
```

返回值：把 `src` 以追加的方式连接到 `dest` 末尾，返回 `dest` 的首地址。`dest` 必须有足够的空间容纳连接后的字符串。$kp$, section = '' where id = 31402;
update t_knowledge_point set title = $kp$strlen 函数原型$kp$, content = $kp$# strlen 函数原型

```c
size_t strlen(const char *str);
```

返回值：返回 `str` 中 `'\0'` 之前的字符个数，即字符串长度，不包括结束符 `'\0'`。$kp$, section = '' where id = 31403;
update t_knowledge_point set title = $kp$数组的定义$kp$, content = $kp$# 数组的定义

数组：按先后次序在存储器中顺序存放、数据类型一致、占用一片连续存储空间的数据集合。$kp$, section = '' where id = 31654;
update t_knowledge_point set title = $kp$数组的存储特点$kp$, content = $kp$# 数组的存储特点

数组：按先后次序在存储器中顺序存放，数据类型一致，占用一片连续的空间。$kp$, section = '' where id = 31727;
update t_knowledge_point set title = $kp$字符串与字符数组$kp$, content = $kp$# 字符串与字符数组

字符串都是字符数组，字符数组不一定是字符串。$kp$, section = '' where id = 31762;
update t_knowledge_point set title = $kp$字符数组的结束标志$kp$, content = $kp$# 字符数组的结束标志

字符数组就是存放字符的数组。如果数组的最后一个元素是 `'\0'`，这个字符数组就可以当作字符串使用。$kp$, section = '' where id = 31763;
update t_knowledge_point set title = $kp$字符数组必须确定大小$kp$, content = $kp$# 字符数组必须确定大小

字符数组在定义时和数值型数组一样，需要确定大小。例如在函数内写 `char a[];` 是不正确的，因为无法确定数组大小。$kp$, section = '' where id = 31764;
update t_knowledge_point set title = $kp$字符数组的逐个赋值$kp$, content = $kp$# 字符数组的逐个赋值

字符数组在初始化的时候，可以逐个字符地赋值，一般可以结合 `for` 语句为每一个数组元素赋值。$kp$, section = '' where id = 31765;
update t_knowledge_point set title = $kp$字符数组的省略长度初始化$kp$, content = $kp$# 字符数组的省略长度初始化

初始化字符数组时可以省略数组长度，由编译器根据初值确定大小。

```c
char s[] = {'A', 'B', 'C'};   /* 3 个元素 */
char t[] = "ABC";             /* 4 个元素，末尾自动添加 '\0' */
```

字符串常量本身就是一个没有名字的字符数组，末尾由系统自动添加 `'\0'`。$kp$, section = '' where id = 31766;
update t_knowledge_point set title = $kp$数组名是地址常量$kp$, content = $kp$# 数组名是地址常量

字符数组的数组名是一个地址常量，所以不能直接给数组名赋值。$kp$, section = '' where id = 31767;
update t_knowledge_point set title = $kp$字符数组不能整体赋值$kp$, content = $kp$# 字符数组不能整体赋值

不能通过赋值语句直接把字符串或另一个字符数组赋给字符数组。

```c
char s[10];
s = "abc";          /* 错误：数组名是地址常量 */

char a[10], b[10];
a = b;              /* 错误：不能整体赋值 */
```

字符数组的赋值只能在初始化时完成，或者逐个字符元素赋值；对数组名的任何赋值操作都是错误的。$kp$, section = '' where id = 31768;
update t_knowledge_point set title = $kp$字符数组的输入与输出$kp$, content = $kp$# 字符数组的输入与输出

字符数组可以用 `%c` 逐个字符输入输出，也可以用 `%s` 整体输入输出。$kp$, section = '' where id = 31769;
update t_knowledge_point set title = $kp$线性结构$kp$, content = $kp$# 线性结构

线性结构：除第一个元素和最后一个元素外，其他所有元素都有唯一的前驱和唯一的后继。（线性关系，1:1）$kp$, section = '' where id = 31788;
update t_knowledge_point set title = $kp$图结构$kp$, content = $kp$# 图结构

图结构：元素可以有多个前驱，也可以有多个后继。（网状关系，n:m）$kp$, section = '' where id = 31790;
update t_knowledge_point set title = $kp$数组下标从 0 开始$kp$, content = $kp$# 数组下标从 0 开始

数组元素的下标从 0 开始：0 是第一个元素的下标，1 是第二个元素的下标，依此类推。

行下标范围是 0～行长度-1，列下标范围是 0～列长度-1。$kp$, section = '' where id = 31813;
update t_knowledge_point set title = $kp$字符数组的初始化赋值$kp$, content = $kp$# 字符数组的初始化赋值

可以用下面的形式给字符数组赋值：

```c
char str[] = "Hello!";
```

也可以让字符指针指向字符串常量：

```c
char *p;
p = "Hello!";
```$kp$, section = '' where id = 31814;
update t_knowledge_point set title = $kp$不能给数组名赋值$kp$, content = $kp$# 不能给数组名赋值

不能写成下面的形式：

```c
char str[10];
str = "Hello";   /* 错误：str 是地址常量 */
```

因为 `str` 是数组名，表示一个地址常量，不能进行赋值操作。$kp$, section = '' where id = 31815;
update t_knowledge_point set title = $kp$合法的字符数组初始化$kp$, content = $kp$# 合法的字符数组初始化

以下各例相互独立：

```c
char s[8] = {"NanJing"};
char s[] = "NanJing";
char s[8] = "NanJing";
char s[8] = {'N', 'a', 'n', 'J', 'i', 'n', 'g'};     /* 未指定的元素默认为 0，即 '\0' */
char s[] = {'N', 'a', 'n', 'J', 'i', 'n', 'g', '\0'}; /* 手工加 '\0' 才能当字符串使用 */
```$kp$, section = '' where id = 31869;
update t_knowledge_point set title = $kp$冒泡排序及快速排序原理$kp$, content = $kp$# 冒泡排序及快速排序原理

冒泡排序（升序）的执行过程：

| 状态 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 初始 | 3 | 6 | 4 | 2 | 11 | 10 | 5 |
| 第 1 趟 | 3 | 4 | 2 | 6 | 10 | 5 | 11 |
| 第 2 趟 | 3 | 2 | 4 | 6 | 5 | 10 | 11 |
| 第 3 趟 | 2 | 3 | 4 | 5 | 6 | 10 | 11 |
| 第 4 趟 | 2 | 3 | 4 | 5 | 6 | 10 | 11 |
| 第 5 趟 | 2 | 3 | 4 | 5 | 6 | 10 | 11 |
| 第 6 趟 | 2 | 3 | 4 | 5 | 6 | 10 | 11 |

```c
// 冒泡排序
int arr[10] = {2, 3, 5, 6, 4, 8, 1, 0, 9, 7};
int i, j, temp;
int len = sizeof(arr) / sizeof(arr[0]);

for (i = 0; i < len - 1; i++) {
    for (j = 0; j < len - 1 - i; j++) {
        if (arr[j] > arr[j + 1]) {
            temp = arr[j];
            arr[j] = arr[j + 1];
            arr[j + 1] = temp;
        }
    }
}
```

快速排序原理：通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另一部分的所有数据小，然后按此方法对这两部分分别递归排序，整个排序过程可以递归进行，最终得到有序序列。$kp$, section = '' where id = 31883;
update t_knowledge_point set title = $kp$顺序查找与二分查找$kp$, content = $kp$# 顺序查找与二分查找

顺序查找从数组一端开始，依次比较每个元素，遍历顺序可以从左向右，也可以从右向左。

```c
int arr[10] = {2, 5, 4, 7, 9, 6, 0, 3, 1, 8};
int nNum = 4;
int i;
int nAddr = -1;
int arrSize = sizeof(arr) / sizeof(arr[0]);

for (i = 0; i < arrSize; i++) {
    if (arr[i] == nNum) {
        nAddr = i;
        break;
    }
}
```

二分查找（折半查找）要求数组有序，每次比较中间元素，把查找区间缩小一半。$kp$, section = '' where id = 31886;
update t_knowledge_point set title = $kp$循环队列出队操作$kp$, content = $kp$# 循环队列出队操作

循环队列出队时，队首指针加 1，并对队列容量取模：

```c
Q.front = (Q.front + 1) % MAXSIZE;
```$kp$, section = '' where id = 31901;
update t_knowledge_point set title = $kp$数组所占字节数$kp$, content = $kp$# 数组所占字节数

数组所占字节数为元素个数与基类型所占字节数的乘积。

```c
int a[][2] = {9, 9, 9, 9};   /* 4 个元素，每个 int 占 4 字节，共 16 字节 */
```$kp$, section = '' where id = 31928;
update t_knowledge_point set title = $kp$二维数组下标从 0 开始$kp$, content = $kp$# 二维数组下标从 0 开始

数组的行（第一维）下标和列（第二维）下标都从 0 开始，`a[0][0]` 表示数组 a 的第一个元素。$kp$, section = '' where id = 31929;
update t_knowledge_point set title = $kp$数组下标越界$kp$, content = $kp$# 数组下标越界

引用数组时，如果行或列下标超出对应长度减 1，就出现数组下标越界。

```c
int a[10][10] = {0};
a[10][0] = 0;    /* 行下标越界 */
a[0][10] = 0;    /* 列下标越界 */
a[10][10] = 0;   /* 行、列下标都越界 */
```

越界访问属于未定义行为，可能破坏其他内存或导致程序崩溃。$kp$, section = '' where id = 31930;
update t_knowledge_point set title = $kp$数组元素参与运算$kp$, content = $kp$# 数组元素参与运算

数组元素引用之后可以参与各种运算，例如算术运算、逻辑运算等。

```c
int a = 10;
int b[10][10] = {0};
b[9][0] = a - b[0][0];   /* 数组元素参与算术运算 */
```$kp$, section = '' where id = 31931;
update t_knowledge_point set title = $kp$常用的数据存储结构$kp$, content = $kp$# 常用的数据存储结构

常用的数据存储结构有：顺序结构（如数组）、链接结构（如指针、二叉树、森林、图）。$kp$, section = '' where id = 32106;
update t_knowledge_point set title = $kp$数组与指针实现存储结构$kp$, content = $kp$# 数组与指针实现存储结构

在用高级语言编写的程序中，常用“数组”实现“顺序”存储结构，用“指针”实现“链接”存储结构。$kp$, section = '' where id = 32107;
update t_knowledge_point set title = $kp$C 语言没有字符串变量$kp$, content = $kp$# C 语言没有字符串变量

C 语言中没有字符串变量，存放字符串使用字符数组。

```c
char str[] = "hello";   /* 用字符数组存放字符串 */
```$kp$, section = '' where id = 32116;
update t_knowledge_point set title = $kp$二维数组的概念$kp$, content = $kp$# 二维数组的概念

二维数组：当数组中每个元素都需要两个下标来确定时，称这样的数组为二维数组。它像一个二维表，第一维是行，第二维是列。例如 `int a[5][5];` 是一个 5 行 5 列、共 25 个元素的整型二维数组。$kp$, section = '' where id = 32196;
update t_knowledge_point set title = $kp$二维数组的定义格式$kp$, content = $kp$# 二维数组的定义格式

格式为：

```c
类型名 数组名[常量表达式1][常量表达式2];
```

例如 `int a[10][10];` 表示十行十列。$kp$, section = '' where id = 32197;
update t_knowledge_point set title = $kp$二维数组省略行数$kp$, content = $kp$# 二维数组省略行数

常量表达式 1 可以省去不写，但必须在定义时对数组进行初始化；常量表达式 2 不可以省略。

```c
int a[][2] = {10, 9, 8, 7};
```$kp$, section = '' where id = 32198;
update t_knowledge_point set title = $kp$二维数组的初始化$kp$, content = $kp$# 二维数组的初始化

以下各例相互独立：

```c
int a[10][10] = {0};                          /* 全部元素为 0 */
int a[10][10] = {0, 1, 2, 4, 5};              /* 按行顺序赋值，其余元素为 0 */
int a[10][10] = {{0}, {1}};                   /* 第一行第一列为 0，第二行第一列为 1，其余为 0 */
int a[10][10] = {{0, 1, 2, 4}, {1, 2, 3, 4}}; /* 分别初始化前两行 */
int a[10][10] = {{0}, {2}, {3}};              /* 前三行第一列分别为 0、2、3 */
int a[3][2] = {0, 1, 2, 3, 4, 5};             /* 0、1 第一行；2、3 第二行；4、5 第三行 */
```

说明：二维数组按行存放，未指定具体值的元素初始值为 0。$kp$, section = '' where id = 32199;
update t_knowledge_point set title = $kp$数组的循环初始化与 memset$kp$, content = $kp$# 数组的循环初始化与 memset

使用循环进行初始化：

```c
int a[10][10], i, j;
for (i = 0; i < 10; i++)
    for (j = 0; j < 10; j++)
        a[i][j] = 0;
```

也可以使用 `memset` 清零：

```c
#include <string.h>
memset(a, 0, sizeof(int) * 10 * 10);
```

说明：`memset` 一般用 0 初始化内存单元，常用于给数组或结构体清零。$kp$, section = '' where id = 32200;
update t_knowledge_point set title = $kp$数组的长度$kp$, content = $kp$# 数组的长度

数组的长度即数组元素的个数。

```c
int a[10] = {0};        /* 数组 a 的长度是 10 */
int b[] = {0, 1, 2, 3}; /* 数组 b 的长度是 4 */
```

可以使用 `sizeof` 计算数组长度：`sizeof(b) / sizeof(int)`。$kp$, section = '' where id = 32201;
update t_knowledge_point set title = $kp$数组元素可以当作变量$kp$, content = $kp$# 数组元素可以当作变量

每一个数组元素都可以看成一个变量。

```c
int a = 10;
int b[10][10] = {0};
b[5][5] = a;   /* 给数组 b 的第 6 行第 6 列元素赋值 */
```$kp$, section = '' where id = 32202;
update t_knowledge_point set title = $kp$二维数组名的特点$kp$, content = $kp$# 二维数组名的特点

二维数组名是数组的首行地址。数组名不能单独引用，不能通过一个数组名代表全部元素。数组名是地址常量，不能对数组名赋值，所以 `a++` 是错误的；但数组名可以与一个整数相加得到新地址。二维数组名加减整数时表示垂直移动（行上下的移动）。

```c
int a[10][10] = {{0}, {2}, {3}, {6}};
printf("%p\n", (void *)a);        /* 输出首地址 */
printf("%d\n", *(a + 1)[0]);      /* 输出 a[1][0]，即 2 */
```$kp$, section = '' where id = 32203;
update t_knowledge_point set title = $kp$二维数组的行首地址$kp$, content = $kp$# 二维数组的行首地址

数组 `int a[2][3] = {1, 2, 3, 4, 5, 6};` 含 6 个元素，有 2 行 3 列。第一行为 `a[0]` 行，第二行为 `a[1]` 行，`a[0]`、`a[1]` 叫行首地址，是地址常量。

- `a[0] + 1` 是第一行第一个元素往后跳一列，即 `*(a[0] + 1)` 的值为 2，也就是 `a[0][1]`。
- `a[0] + 3` 是第一行第一个元素往后跳三个元素，即 `*(a[0] + 3)` 的值为 4，也就是 `a[1][0]`。$kp$, section = '' where id = 32204;
update t_knowledge_point set title = $kp$字符串的结束符$kp$, content = $kp$# 字符串的结束符

在存储字符串时，系统会自动在其尾部加上一个空值 `'\0'`，空值也要占用一个字节。例如字符串 `"A_B"` 有 3 个字符，需要占 4 个字节。$kp$, section = '' where id = 32205;
update t_knowledge_point set title = $kp$字符数组的一维与二维定义$kp$, content = $kp$# 字符数组的一维与二维定义

- 一维字符数组：`char 数组名[常量表达式];`
- 二维字符数组：`char 数组名[常量表达式1][常量表达式2];`$kp$, section = '' where id = 32206;
update t_knowledge_point set title = $kp$字符串输入函数$kp$, content = $kp$# 字符串输入函数

```c
scanf("%s", str);
gets(str);
```

`gets` 函数可以接收空格；`scanf` 接收字符串时遇到空格、制表符或换行符就结束。`gets` 不检查数组边界，已不推荐使用，可用 `fgets` 代替。$kp$, section = '' where id = 32207;
update t_knowledge_point set title = $kp$字符串输出函数$kp$, content = $kp$# 字符串输出函数

```c
printf("%s", str);
puts(str);
```

`puts` 函数在输出字符串后自动输出一个换行；`printf` 换行需要手动填写 `"\n"`。$kp$, section = '' where id = 32208;
update t_knowledge_point set title = $kp$常用字符函数与 sizeof$kp$, content = $kp$# 常用字符函数与 sizeof

常用字符函数（如 `strlen`）是常考点，注意它与 `sizeof` 的区别：`strlen` 统计 `'\0'` 之前的字符个数，`sizeof` 计算数组或类型所占的总字节数。$kp$, section = '' where id = 32209;
update t_knowledge_point set title = $kp$二分查找源代码$kp$, content = $kp$# 二分查找源代码

```c
int arr[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};   // 数组必须有序
int left, right, mid;
int nNum = 4;                                    // 需要查询的数
int nAddr = -1;                                  // 找到后的下标，-1 表示未找到

left = 0;
right = sizeof(arr) / sizeof(arr[0]) - 1;

while (left <= right) {
    mid = (left + right) / 2;
    if (arr[mid] < nNum) {
        left = mid + 1;
    } else if (arr[mid] > nNum) {
        right = mid - 1;
    } else {
        nAddr = mid;
        break;
    }
}

printf("%d 在数组中%s，位置是 %d\n", nNum,
       nAddr != -1 ? "已找到" : "未找到", nAddr + 1);
```$kp$, section = '' where id = 32210;
update t_knowledge_point set title = $kp$常用字符串处理函数$kp$, content = $kp$# 常用字符串处理函数

## strcpy

原型：`char *strcpy(char *dest, const char *src);`

把从 `src` 开始的字符串（包括 `'\0'`）复制到 `dest` 开始的地址空间，返回 `dest`。`dest` 必须足够大。

```c
#include <stdio.h>
#include <string.h>

int main(void) {
    char ch1[30] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    char *ch2 = "abc";
    printf("ch1: %s\n", ch1);
    printf("strcpy: %s\n", strcpy(ch1, ch2));   /* abc */
    printf("ch1: %s\n", ch1);                   /* abc */
    printf("ch2: %s\n", ch2);                   /* abc */
    return 0;
}
```

## strcmp

原型：`int strcmp(const char *s1, const char *s2);`

按字符的 ASCII 值逐个比较。字符串相同返回 0；`s1` 大于 `s2` 返回正数；`s1` 小于 `s2` 返回负数。

```c
#include <stdio.h>
#include <string.h>

int main(void) {
    char *ch1 = "abd";
    char *ch2 = "abc";
    printf("%d\n", strcmp(ch1, ch2));   /* 正数 */
    return 0;
}
```

## strcat

原型：`char *strcat(char *dest, const char *src);`

把 `src` 追加到 `dest` 末尾，返回 `dest` 的首地址。

```c
char ch1[20] = "abc";
char *ch2 = "88888";
printf("%s\n", strcat(ch1, ch2));   /* abc88888 */
```

## strlen

原型：`size_t strlen(const char *str);`

遇到 `'\0'` 或 0 就返回，返回此之前的字符串长度。注意区分 `'\0'` 与八进制转义字符 `'\012'`。

```c
#include <stdio.h>
#include <string.h>

int main(void) {
    char ch[] = {'a', 'b', '\0', 'c'};
    printf("strlen 为：%zu\n", strlen(ch));   /* 输出 2 */
    return 0;
}
```

## strchr 与 strstr

- `char *strchr(const char *s, int c);`：从左向右查找字符 c，返回第一次出现的位置，找不到返回 `NULL`。
- `char *strstr(const char *str1, const char *str2);`：查找子串，返回第一次出现的位置，找不到返回 `NULL`。

```c
char ch1[] = "1234567890";
printf("%s\n", strchr(ch1, '5'));     /* 567890 */
printf("%s\n", strstr(ch1, "234"));   /* 234567890 */
```

## rand

`rand()` 用于产生伪随机整数，使用前通常用 `srand()` 设置随机数种子。$kp$, section = '' where id = 32214;
update t_knowledge_point set title = $kp$常用字符函数$kp$, content = $kp$# 常用字符函数

常用字符函数包括 `strlen`、`strcpy`、`strcat`、`strcmp` 等，注意 `strlen` 与 `sizeof` 的区别。$kp$, section = '' where id = 32229;
update t_knowledge_point set title = $kp$字符串与字符数组的概念$kp$, content = $kp$# 字符串与字符数组的概念

字符串是由双引号引起来的若干字符组成的序列，也称为字符串常量。字符串常量实际上是没有名字的字符数组，最后一个字符是 `'\0'`。

字符串的结束标志是 `'\0'`。例如字符串 `"china"` 在内存中的存储形式为：`c h i n a \0`，长度为 5 个字符，占用 6 个字节。

C 语言中只有字符串常量，没有字符串变量。通常所说的字符串变量就是字符数组，并且该字符数组以 `'\0'` 结尾。

字符串一定是一个一维字符数组；一维字符数组不一定是字符串，只有最后一个元素为 `'\0'` 的一维字符数组才能当作字符串使用。$kp$, section = '' where id = 32233;
update t_knowledge_point set title = $kp$数组的概念$kp$, content = $kp$# 数组的概念

计算机处理数据时，经常出现数据按某种有序形式组织的情况，例如随温度改变的实验数据、按学号排列的成绩表。这些数据的共同特征：

- 都是由若干个分量组成；
- 各分量都是同一类型；
- 分量按一定顺序排列。

数组：按序排列的具有相同类型的变量的集合。

- 用数组名表示这一组数；
- 用数组名后跟下标唯一确定数组中的元素；
- 数组的首地址、数组元素的类型和个数（数组长度）是数组的三个要素。$kp$, section = '' where id = 32246;
update t_knowledge_point set title = $kp$一维数组的定义与使用$kp$, content = $kp$# 一维数组的定义与使用

1）定义：`类型名 数组名1[exp1], 数组名2[exp2], ……;`，其中 `exp` 为常量表达式。

- 数组名的命名规则和简单变量名相同；
- 数组名后只能用方括号括起来的常量表达式；
- 常量表达式的值确定数组元素的个数。

2）存储：用连续的内存单元存放各个元素。总字节数 = `sizeof(基本类型) * 数组元素个数`。

3）引用：

- 数组必须先定义后引用；
- C 语言只能逐个引用数组元素，不能一次引用整个数组；
- 引用一维数组元素的一般形式为 `数组名[下标]`。

```c
#include <stdio.h>

int main(void) {
    int i, a[10];
    for (i = 0; i < 10; i++)
        a[i] = i;
    for (i = 9; i >= 0; i--)
        printf("%d", a[i]);
    printf("\n");
    return 0;
}
```

4）初始化：

- 在定义数组时对数组元素赋初值，如 `int a[4] = {1, 2, 3, 4};`；
- 可以只给一部分元素赋初值；
- 对全部数组元素赋初值时，可以不指定数组长度。$kp$, section = '' where id = 32247;
update t_knowledge_point set title = $kp$二维数组与字符数组$kp$, content = $kp$# 二维数组与字符数组

## 二维数组

定义：`类型名 数组名[C_exp1][C_exp2];`，例如 `int a[3][4], b[4][M];`（M 是符号常量）。

存储：二维数组从概念上可理解为行-列矩阵，但存储器是一维的，元素按行存放，右边下标比左边下标变化快。

引用：`数组名[下标][下标]`。例如定义 `int a[2][4], b[5][3];` 时，引用下标不能超过对应长度减 1，注意区分数组定义和数组元素引用。

初始化（按行存放）：

```c
int x[2][3] = {1, 2, 3, 4, 5, 6};       /* 按存放顺序赋值 */
int x[2][3] = {{1, 2}, {4, 5, 6}};        /* 按行赋值 */
static int x[2][3] = {1, 2, 4};            /* 部分赋值，其余为 0 */
```

## 字符数组

- C 语言没有专门的字符串变量，而是把字符串存入字符数组处理；
- 用一个一维数组存放一个字符串，每个元素存放一个字符；
- 字符数组是数组的特殊情况，定义和引用方法与一般数组类似。

字符数组的初始化：

```c
static char c[10] = {'s', 't', 'o', 'r', 'e'};   /* 其余元素为 '\0' */
char c[6] = {"china"};                            /* 字符串方式赋值 */
```

注意：以字符串方式赋值时，必须保证数组元素个数 ≥ 字符个数 + 1，多出的一个位置存放 `'\0'`。

示例（各例独立）：

```c
char a[7] = {'a', 'p', 'p', 'l', 'e'};
char b[7] = {"apple"};
char c[7];
static char x[7];
```$kp$, section = '' where id = 32248;
update t_knowledge_point set title = $kp$一维数组的定义、引用与举例$kp$, content = $kp$# 一维数组的定义、引用与举例

## 怎样定义一维数组

一般形式：`类型符 数组名[常量表达式];`。数组名的命名规则和变量名相同，例如 `int a[10];` 定义 10 个元素 `a[0]`～`a[9]`。

数组长度必须是常量表达式：`int a[4 + 6];` 合法；`int n = 10; int a[n];` 在 C89 中不合法，C99 起支持变长数组。

## 怎样引用一维数组元素

引用形式：`数组名[下标]`。只能引用数组元素，不能一次整体引用整个数组。

```c
int n = 5, a[10];
a[0] = a[5] + a[7] - a[2 * 3];   /* 合法 */
a[n] = 20;                        /* 合法 */
```

例：对 10 个数组元素依次赋值为 0～9，再按逆序输出。

```c
#include <stdio.h>

int main(void) {
    int i, a[10];
    for (i = 0; i < 10; i++)
        a[i] = i;
    for (i = 9; i >= 0; i--)
        printf("%d ", a[i]);
    printf("\n");
    return 0;
}
```

## 一维数组的初始化

以下各例相互独立：

```c
int a[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
int a[10] = {0, 1, 2, 3, 4};   /* 等价于 {0,1,2,3,4,0,0,0,0,0} */
int a[10] = {0};                /* 全部元素为 0 */
int a[] = {1, 2, 3, 4, 5};      /* 省略长度，由初值个数决定 */
```

## 例：Fibonacci 数列

```c
#include <stdio.h>

int main(void) {
    int i;
    int f[20] = {1, 1};
    for (i = 2; i < 20; i++)
        f[i] = f[i - 1] + f[i - 2];
    for (i = 0; i < 20; i++)
        printf("%d ", f[i]);
    printf("\n");
    return 0;
}
```

## 例：冒泡排序

```c
/* 假设数组 a 已定义，n 为元素个数 */
for (i = 0; i < n - 1; i++)
    for (j = 0; j < n - 1 - i; j++)
        if (a[j] > a[j + 1]) {
            t = a[j];
            a[j] = a[j + 1];
            a[j + 1] = t;
        }
```

冒泡排序的过程是大数沉淀、小数起泡。$kp$, section = '' where id = 32311;
update t_knowledge_point set title = $kp$二维数组与字符数组举例$kp$, content = $kp$# 二维数组与字符数组举例

## 怎样定义二维数组

一般形式：`类型符 数组名[常量表达式][常量表达式];`，例如 `float a[3][4], b[5][10];`。

二维数组可以看作一种特殊的一维数组，它的每个元素又是一个一维数组。例如 `a[3][4]` 可看作 3 个元素 `a[0]`、`a[1]`、`a[2]`，每个元素又是一个包含 4 个元素的一维数组。

存储：逻辑上是行-列矩阵，内存中按行存放，元素的存放顺序为 `a[0][0]`、`a[0][1]`、……、`a[2][3]`。

## 怎样引用二维数组元素

形式：`数组名[下标][下标]`，例如 `b[1][2] = a[2][3] / 2;`。

## 例：求二维数组中的最大值

```c
int i, j, row = 0, colum = 0, max;
int a[3][4] = {{1, 2, 3, 4}, {9, 8, 7, 6}, {-10, 10, -5, 2}};

max = a[0][0];
for (i = 0; i < 3; i++)
    for (j = 0; j < 4; j++)
        if (a[i][j] > max) {
            max = a[i][j];
            row = i;
            colum = j;
        }
printf("max=%d, row=%d, colum=%d\n", max, row, colum);
```

## 字符数组

用来存放字符数据的数组是字符数组，一个元素存放一个字符。定义方法与数值型数组类似，例如 `char c[10];`。

字符数组的初始化（各例独立）：

```c
char c[10] = {'I', ' ', 'a', 'm', ' ', 'h', 'a', 'p', 'p', 'y'};
char c[10] = {'c', ' ', 'p', 'r', 'o', 'g', 'r', 'a', 'm'};   /* 最后一个元素为 '\0' */
char diamond[5][5] = {{' ', ' ', '*'}, {' ', '*', ' ', '*'}, {'*', ' ', ' ', ' ', '*'}, {' ', '*', ' ', '*'}, {' ', ' ', '*'}};
```

引用字符数组中的元素：

```c
char c[15] = {'I', ' ', 'a', 'm', ' ', 'a', ' ', 's', 't', 'u', 'd', 'e', 'n', 't', '.'};
int i;
for (i = 0; i < 15; i++)
    putchar(c[i]);
```

## 字符数组的输入输出

- 逐个字符输入输出：使用 `%c`；
- 整个字符串一次输入输出：使用 `%s`；
- 用 `%s` 输出时，输出项是字符数组名，不是数组元素名；
- 输出字符中不包括结束符 `'\0'`，遇到第一个 `'\0'` 输出结束。

```c
char c[6];
scanf("%s", c);   /* 输入 China，系统自动在末尾加 '\0' */

char str1[5], str2[5], str3[5];
scanf("%s%s%s", str1, str2, str3);   /* 输入 How are you? */
```$kp$, section = '' where id = 32312;
update t_knowledge_point set title = $kp$字符数组应用举例$kp$, content = $kp$# 字符数组应用举例

## 怎样定义字符数组

用来存放字符数据的数组是字符数组，字符数组中的一个元素存放一个字符。定义字符数组的方法与定义数值型数组的方法类似。

```c
char c[10];
c[0] = 'I'; c[1] = ' '; c[2] = 'a'; c[3] = 'm'; c[4] = ' ';
c[5] = 'h'; c[6] = 'a'; c[7] = 'p'; c[8] = 'p'; c[9] = 'y';
```

## 字符数组的初始化

以下各例相互独立：

```c
char c[10] = {'I', ' ', 'a', 'm', ' ', 'h', 'a', 'p', 'p', 'y'};
char c[10] = {'c', ' ', 'p', 'r', 'o', 'g', 'r', 'a', 'm'};   /* 最后一个元素为 '\0' */
char diamond[5][5] = {{' ', ' ', '*'}, {' ', '*', ' ', '*'}, {'*', ' ', ' ', ' ', '*'}, {' ', '*', ' ', '*'}, {' ', ' ', '*'}};
```

## 怎样引用字符数组中的元素

```c
#include <stdio.h>

int main(void) {
    char c[15] = {'I', ' ', 'a', 'm', ' ', 'a', ' ', 's', 't', 'u', 'd', 'e', 'n', 't', '.'};
    int i;
    for (i = 0; i < 15; i++)
        putchar(c[i]);
    putchar('\n');
    return 0;
}
```

## 字符数组的输入输出

- 逐个字符输入输出（`%c`）；
- 整个字符串一次输入输出（`%s`）；
- 输出的字符中不包括结束符 `'\0'`；
- 用 `%s` 输出字符串时，`printf` 的输出项是字符数组名，不是数组元素名；
- 如果字符数组中包含多个 `'\0'`，遇到第一个 `'\0'` 时输出就结束；
- 输入的字符串应短于已定义的字符数组长度。

```c
char c[6];
scanf("%s", c);   /* 输入 China */
```$kp$, section = '' where id = 32313;
update t_knowledge_point set title = $kp$puts 输出字符串$kp$, content = $kp$# puts 输出字符串

`puts` 函数用于输出字符串，一般形式为：

```c
puts(字符数组);
```

作用是将一个字符串输出到终端，并自动换行。

```c
char str[20] = "China";
puts(str);   /* 输出 China */
```$kp$, section = '' where id = 32314;
update t_knowledge_point set title = $kp$gets 输入字符串$kp$, content = $kp$# gets 输入字符串

`gets` 函数用于输入字符串，一般形式为：

```c
gets(字符数组);
```

作用是输入一个字符串到字符数组。

```c
char str[20];
gets(str);   /* 输入 Computer */
```

注意：`gets` 不检查数组边界，已不推荐使用，可用 `fgets` 代替。$kp$, section = '' where id = 32315;
update t_knowledge_point set title = $kp$strcat 字符串连接函数$kp$, content = $kp$# strcat 字符串连接函数

`strcat` 函数的一般形式为：

```c
strcat(字符数组1, 字符数组2);
```

作用是把两个字符串连接起来，把字符串 2 接到字符串 1 的后面，结果存放在字符数组 1 中。

使用字符串函数时，需要在程序开头写 `#include <string.h>`。$kp$, section = '' where id = 32316;
update t_knowledge_point set title = $kp$strcat 与 strcpy 的使用$kp$, content = $kp$# strcat 与 strcpy 的使用

```c
char str1[30] = "People";
char str2[] = "China";
printf("%s", strcat(str1, str2));   /* 输出 PeopleChina */
```

`str1` 必须足够大。

`strcpy(字符数组1, 字符串2)` 把字符串 2 复制到字符数组 1 中：

```c
char str1[10], str2[] = "China";
strcpy(str1, str2);
```

相当于 `strcpy(str1, "China");`。不能写成 `str1 = "China";` 或 `str1 = str2;`，因为数组名是地址常量。

`strncpy(str1, str2, n)` 把 `str2` 中前面的 n 个字符复制到 `str1` 中。若 n 小于 `str2` 的长度，`strncpy` 不会自动在末尾补 `'\0'`。$kp$, section = '' where id = 32317;
update t_knowledge_point set title = $kp$strcmp 字符串比较函数$kp$, content = $kp$# strcmp 字符串比较函数

一般形式：

```c
strcmp(字符串1, 字符串2);
```

作用是比较字符串 1 和字符串 2。比较规则：将两个字符串自左至右逐个字符比较，直到出现不同字符或遇到 `'\0'` 为止；如果全部字符相同，认为两个字符串相等；否则以第一对不同字符的比较结果为准。

返回值：

- 字符串 1 等于字符串 2，返回 0；
- 字符串 1 大于字符串 2，返回正整数；
- 字符串 1 小于字符串 2，返回负整数。

例如：

```c
strcmp("China", "Korea");       /* 返回负数，'C' < 'K' */
strcmp("computer", "compare");  /* 返回正数，'u' > 'a' */
strcmp("these", "that");        /* 返回正数，'e' > 'a' */
```

判断字符串相等应写成 `if (strcmp(str1, str2) == 0)`，不能写成 `if (str1 == str2)`。$kp$, section = '' where id = 32318;
update t_knowledge_point set title = $kp$strlen 测字符串长度$kp$, content = $kp$# strlen 测字符串长度

一般形式：

```c
strlen(字符数组);
```

作用：测试字符串长度，函数值为字符串中的实际字符个数，不包括结束符 `'\0'`。$kp$, section = '' where id = 32319;
update t_knowledge_point set title = $kp$strlen 使用示例$kp$, content = $kp$# strlen 使用示例

```c
char str[10] = "China";
printf("%zu", strlen(str));   /* 输出 5 */
```

也可以直接测试字符串常量的长度：

```c
strlen("China");   /* 结果为 5 */
```$kp$, section = '' where id = 32320;
update t_knowledge_point set title = $kp$strlwr 转换为小写$kp$, content = $kp$# strlwr 转换为小写

一般形式：

```c
strlwr(字符串);
```

作用是将字符串中的大写字母转换成小写字母。

注意：`strlwr` 不是 C 标准库函数，只在部分编译器中提供。标准做法是使用 `tolower` 逐个字符转换。$kp$, section = '' where id = 32321;
update t_knowledge_point set title = $kp$数组作函数参数$kp$, content = $kp$# 数组作函数参数

## 数组元素作函数实参

例：输入 10 个数，要求输出其中值最大的元素和该数是第几个数。

```c
#include <stdio.h>

int max(int x, int y);

int main(void) {
    int a[10], m, n, i;
    printf("10 integer numbers:\n");
    for (i = 0; i < 10; i++)
        scanf("%d", &a[i]);

    m = a[0];
    n = 0;
    for (i = 1; i < 10; i++)
        if (m < a[i]) {
            m = max(m, a[i]);
            n = i;
        }

    printf("largest number is %d\n", m);
    printf("%dth number.\n", n + 1);
    return 0;
}

int max(int x, int y) {
    return x > y ? x : y;
}
```

说明：用数组元素作实参时，向形参变量传递的是数组元素的值。

## 数组名作函数参数

除了可以用数组元素作为函数参数外，还可以用数组名作函数参数（包括实参和形参）。

- 用数组元素作实参时，向形参变量传递的是数组元素的值；
- 用数组名作实参时，向形参传递的是数组首元素的地址。

例：有一个一维数组 `score`，内放 10 个学生成绩，求平均成绩。

```c
#include <stdio.h>

float average(float array[10]);

int main(void) {
    float score[10], aver;
    int i;
    printf("input 10 scores:\n");
    for (i = 0; i < 10; i++)
        scanf("%f", &score[i]);
    aver = average(score);
    printf("average=%f\n", aver);
    return 0;
}

float average(float array[10]) {
    int i;
    float sum = 0;
    for (i = 0; i < 10; i++)
        sum += array[i];
    return sum / 10;
}
```$kp$, section = '' where id = 32331;
update t_knowledge_point set title = $kp$数组初始化的默认值$kp$, content = $kp$# 数组初始化的默认值

数组初始化时，未指定的元素值默认为 0；没有初始化的局部数组，其元素值是不确定的随机值。

```c
int a[10][10];          /* 各元素值不确定 */
int b[10][10] = {1};    /* b[0][0] 为 1，其余元素默认值为 0 */
```$kp$, section = '' where id = 32398;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (28573,30270,30430,30433,30483,30512,30520,30526,30527,30540,30585,30588,30589,30597,30599,30605,30608,30609,30610,30616,30621,30622,30624,30627,30628,30646,30647,30648,30656,31100,31307,31308,31310,31312,31392,31393,31394,31395,31402,31403,31654,31727,31762,31763,31764,31765,31766,31767,31768,31769,31788,31790,31813,31814,31815,31869,31883,31886,31901,31928,31929,31930,31931,32106,32107,32116,32196,32197,32198,32199,32200,32201,32202,32203,32204,32205,32206,32207,32208,32209,32210,32214,32229,32233,32246,32247,32248,32311,32312,32313,32314,32315,32316,32317,32318,32319,32320,32321,32331,32398) and not deleted) <> 100 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
