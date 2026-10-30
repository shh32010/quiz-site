-- 知识点 242 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_242
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_242 as
select * from t_knowledge_point where id in (30260,30272,30273,30427,30435,30438,30439,30444,30445,30470,30474,30480,30486,30488,30489,30490,30492,30497,30498,30500,30501,30502,30505,30528,30547,30578,30579,30587,30595,30598,30600,30601,30602,30603,30607,30613,30620,30623,30625,30626,30629,30631,30633,30645,30649,30854,30944,31304,31309,31321,31339,31344,31570,31633,31634,31651,31652,31653,31668,31669,31670,31671,31672,31731,31748,31749,31750,31751,31752,31789,31799,31800,31801,31802,31803,31804,31805,31806,31807,31808,31809,31810,31811,31818,31862,31868,31873,31919,31925,31953,32071,32072,32073,32074,32075,32077,32079,32083,32084,32085,32086,32087,32088,32089,32090,32091,32092,32110,32115,32117,32118,32121,32122,32123,32124,32125,32126,32127,32129,32131,32132,32133,32134,32135,32136,32137,32139,32140,32141,32142,32143,32144,32145,32147,32148,32149,32150,32151,32152,32154,32155,32157,32159,32160,32161,32218,32223,32224,32226,32232,32234,32235,32238,32239,32240,32244,32255,32260,32261,32262,32263,32264,32266,32267,32273,32276,32277,32278,32279,32296,32304,32305,32306,32397,32433);

update t_knowledge_point set title = $kp$自增自减表达式的求值示例$kp$, content = $kp$设 x 的初值为 2，连续执行两次前置自增：

```c
int x = 2;
int a = (++x) + (++x);
```

两次自增后 x 的值为 5。常见编译器会把两个操作数都按自增后的值 5 计算，因此 a 的值为 10。

再执行两次后置自减：

```c
int b = (x--) + (x--);
```

两个操作数都取自减前的值 5，b 的值为 10，执行后 x 的值为 3。

注意：同一个表达式中对同一变量多次自增或自减，在 C 标准中属于未定义行为，不同编译器的结果可能不同，实际编程应避免这样写。$kp$, section = '' where id = 30260;
update t_knowledge_point set title = $kp$register 与 static 存储类$kp$, content = $kp$`register` 建议把变量存放在 CPU 寄存器中，以提高访问速度；它只能用于局部变量，不能取地址。

`static` 用于局部变量时，变量存放在静态存储区，只初始化一次，函数返回后其值仍然保留。例如：

```c
#include <stdio.h>

int fun(int n) {
    static int s = 2;
    s += n;
    return s;
}

int main(void) {
    int x = 2;
    printf("%d\n", fun(x));  // 输出 4
    return 0;
}
```

第一次调用 `fun(2)` 时，`s` 由 2 加上 2 变为 4；再次调用时 `s` 不会再重新初始化，而是在 4 的基础上继续累加。$kp$, section = '' where id = 30272;
update t_knowledge_point set title = $kp$取模运算的符号规则$kp$, content = $kp$取模运算 `%` 要求两个操作数都是整型，结果的正负由左操作数决定：左操作数为正时结果非负，左操作数为负时结果为负或 0。

C 标准规定，整数 `a`、`b` 满足：

```text
a % b = a - (a / b) * b
```

例如：

```c
-25 % 3   // -25 - (-25 / 3) * 3 = -25 - (-8) * 3 = -1
25 % -3   // 25 - (25 / -3) * -3 = 25 - (-8) * -3 = 1
```

C 语言的整数除法向零截断，所以 `-25 / 3` 的结果是 -8。$kp$, section = '' where id = 30273;
update t_knowledge_point set title = $kp$宏定义指定数组长度$kp$, content = $kp$`#define N 26` 把标识符 `N` 定义为符号常量 26，之后可以用 `N` 指定数组的长度，例如 `char a[N]` 定义了一个长度为 26 的字符数组。

宏定义在预处理阶段进行文本替换，不是 C 语句，行末不加分号。$kp$, section = '' where id = 30427;
update t_knowledge_point set title = $kp$原码、反码与补码$kp$, content = $kp$以 8 位有符号整数为例：

- 原码：最高位为符号位，0 表示正数，1 表示负数，其余位表示数值的绝对值。
  +7 的原码为 `00000111`，-7 的原码为 `10000111`。
- 反码：正数的反码与原码相同；负数的反码符号位保持 1，其余各位对原码按位取反。
  +7 的反码为 `00000111`，-7 的反码为 `11111000`。
- 补码：正数的补码与原码相同；负数的补码等于反码加 1。
  +7 的补码为 `00000111`，-7 的补码为 `11111001`。

负数的补码也可以由原码直接得到：符号位不变，其余各位取反，再对整个数加 1。$kp$, section = '' where id = 30435;
update t_knowledge_point set title = $kp$按位或的运算规则$kp$, content = $kp$按位或运算符 `|` 对两个整数的每一个二进制位分别运算，规则是“有 1 为 1”：两个对应位中只要有一个为 1，结果位就是 1。

```text
1 | 0 = 1
0 | 1 = 1
1 | 1 = 1
0 | 0 = 0
```$kp$, section = '' where id = 30438;
update t_knowledge_point set title = $kp$按位或与逻辑非的规则$kp$, content = $kp$按位或 `|` 的规则是“有 1 为 1”，例如 `1 | 1 = 1`、`1 | 0 = 1`。

逻辑非 `!` 的规则相反：真变假、假变真，非零值取非为 0，0 取非为 1。例如：

```c
!0   // 1
!1   // 0
!5   // 0
```$kp$, section = '' where id = 30439;
update t_knowledge_point set title = $kp$转义字符与字符常量$kp$, content = $kp$常见的转义字符：

| 转义字符 | 含义 |
| --- | --- |
| `'\n'` | 换行（Enter） |
| `'\t'` | 横向制表，跳到下一个制表位 |
| `'\b'` | 退格，如 `123\b4` 输出 `124` |
| `'\'` | 反斜杠 |
| `'\''` | 单引号 |
| `'\"'` | 双引号 |
| `'\ddd'` | 1～3 位八进制数表示的一个字符 |
| `'\xhh'` | 1～2 位十六进制数表示的一个字符 |

例如 `'\101'` 的值为 1×8²+0×8+1 = 65，即字符 `'A'`；`'\x41'` 同样表示 `'A'`。

字符常量用单引号括起，只能放一个字符，如 `'A'`、`'1'`；`'AB'` 不合法。字符串常量用双引号括起。

字符 `'A'` 占 1 个字节；字符串 `"A"` 末尾还有一个隐藏的 `'\0'`，共占 2 个字节。字符串 `"ABCD"` 占 5 个字节。$kp$, section = '' where id = 30444;
update t_knowledge_point set title = $kp$typedef 定义类型别名$kp$, content = $kp$`typedef` 用来给已有的数据类型起别名：

```c
typedef int INTEGER;
INTEGER i, j;          // 等价于 int i, j;

typedef int *PINT;
PINT p;                // 等价于 int *p;
PINT *q;               // 等价于 int **q;
```

`typedef` 定义的是类型名，不是变量；用别名定义的变量与原类型完全等价。$kp$, section = '' where id = 30445;
update t_knowledge_point set title = $kp$按位与的运算规则$kp$, content = $kp$按位与运算符 `&` 对两个整数的每一个二进制位分别运算，规则是“双 1 为 1”：两个对应位都为 1 时结果位才为 1。

```text
1 & 1 = 1
1 & 0 = 0
0 & 1 = 0
0 & 0 = 0
```$kp$, section = '' where id = 30470;
update t_knowledge_point set title = $kp$指针的取地址与取内容运算$kp$, content = $kp$`&` 是取地址运算符，`*` 是取内容（解引用）运算符。

```c
int a = 3, b, *p;
p = &a;                    // p 保存 a 的地址
b = *p;                    // 取出 p 所指变量的值，b 为 3
printf("%d, %d\n", a, b);  // 输出 3, 3
```$kp$, section = '' where id = 30474;
update t_knowledge_point set title = $kp$简单 C 程序的结构$kp$, content = $kp$一个简单的 C 程序：

```c
#include <stdio.h>

int main(void) {
    int a, b, s;
    a = 123;
    b = 456;
    s = a + b;
    printf("S=%d\n", s);
    return 0;
}
```

C 程序的主要特点：

1. 一个 C 程序由函数组成，函数是组成 C 程序的基本单位。
2. 程序总是从主函数 `main` 开始执行。
3. 一行可以写一条或多条语句，一条语句也可以分成多行书写。
4. 每条语句最后用分号结束。$kp$, section = '' where id = 30480;
update t_knowledge_point set title = $kp$C 语言模拟试卷片段$kp$, content = $kp$该条目是一份 C 语言模拟试卷的扫描片段，包含数组、链表、循环、数据库等多道题目的残缺题干和选项，内容前后错乱，无法还原为完整题目。$kp$, section = '' where id = 30486;
update t_knowledge_point set title = $kp$字符的 ASCII 码运算示例$kp$, content = $kp$```c
char c1 = '0', c2 = '9';
printf("%c\n", c1 + 9);    // 输出 9
printf("%d\n", c2 - '0');  // 输出 9
```

`'0'` 的 ASCII 码值为 48，`c1 + 9` 得到 57，即字符 `'9'`；`c2 - '0'` 得到 57 - 48 = 9。字符可以按 ASCII 码值参与整数运算。$kp$, section = '' where id = 30488;
update t_knowledge_point set title = $kp$通过另一个指针访问变量$kp$, content = $kp$```c
int a, *p, *q;
p = &a;
q = p;       // q 与 p 指向同一个变量
*q = 10;     // 等价于 a = 10
```

`q = p` 复制的是地址，因此 `p` 和 `q` 指向同一块存储单元，通过任一指针都能修改 `a` 的值。$kp$, section = '' where id = 30489;
update t_knowledge_point set title = $kp$逻辑表达式与真值$kp$, content = $kp$C 语言中，非零值表示真，0 表示假。逻辑与 `&&` 要求两边都为真时结果才为真：

```c
0 && 20   // 0（假）
1 && 20   // 1（真）
```$kp$, section = '' where id = 30490;
update t_knowledge_point set title = $kp$有符号与无符号整型的溢出$kp$, content = $kp$以 16 位 `int` 为例，有符号 int 的表示范围是 -32768～32767。最大值再加 1 会溢出并回绕为最小值：

```c
int a = 32767, b = 1;
printf("%d\n", a + b);   // 常见实现输出 -32768
```

无符号 int 的范围是 0～65535，65535 再加 1 回绕为 0：

```c
unsigned int a = 65535, b = 1;
printf("%u\n", a + b);   // 0
```

`%d` 按有符号十进制输出，`%u` 按无符号十进制输出。在 16 位 int 的常见实现中，无符号数 65535 用 `%d` 输出会显示 -1。$kp$, section = '' where id = 30492;
update t_knowledge_point set title = $kp$数制转换示例$kp$, content = $kp$十进制数按权展开：

```text
365  = 3×10² + 6×10¹ + 5×10⁰
1024 = 1×10³ + 0×10² + 2×10¹ + 4×10⁰
```

其他进制转十进制：

```text
(111)₂ = 1×2² + 1×2¹ + 1×2⁰ = 7
(3B)₁₆ = 3×16¹ + 11×16⁰ = 59
(26)₈  = 2×8¹ + 6×8⁰ = 22
(2F)₁₆ = 2×16¹ + 15×16⁰ = 47
```$kp$, section = '' where id = 30497;
update t_knowledge_point set title = $kp$带参宏的括号问题$kp$, content = $kp$带参数的宏只是做文本替换，参数和整个替换文本都应加括号，否则容易出现运算顺序错误。

```c
#define f(x) x * x

int a = 6, b = 2;
f(a) + f(b);    // 6 * 6 + 2 * 2 = 40
f(a + b);       // 展开为 a + b * a + b，结果不是 (a+b)*(a+b)
```

正确写法：

```c
#define f(x) ((x) * (x))
```$kp$, section = '' where id = 30498;
update t_knowledge_point set title = $kp$结构体指针的成员引用$kp$, content = $kp$若 `p` 是指向结构体的指针，访问成员应使用 `->`：

```c
p->b = 36.17;
```

`p->b` 等价于 `(*p).b`。若 `p` 是结构体变量而不是指针，则应写成 `p.b`；对结构体变量使用 `->` 是错误的。$kp$, section = '' where id = 30500;
update t_knowledge_point set title = $kp$结构体的概念$kp$, content = $kp$在 C 语言中，数组用于存放类型相同的一组数据；结构体则是若干相同或不同数据项的集合，每个数据项称为成员。

```c
struct student {
    int num;
    char name[8];
};

struct student a, *b, c[3];
```

上面的定义中，`a` 是结构体变量，`b` 是结构体指针，`c` 是结构体数组。$kp$, section = '' where id = 30501;
update t_knowledge_point set title = $kp$标识符的命名规则$kp$, content = $kp$标识符由字母、数字和下划线组成，第一个字符不能是数字，不能与关键字相同，并且区分大小写。

```text
int     错误：int 是关键字
_int    正确
int_    正确
Int     正确：与 int 大小写不同
123abc  错误：以数字开头
```$kp$, section = '' where id = 30502;
update t_knowledge_point set title = $kp$结构体变量的四种定义方式$kp$, content = $kp$```c
/* 1. 先声明结构体类型，再定义变量 */
struct student {
    int num;
    char name[8];
};
struct student a, *b, c[3];

/* 2. 声明类型的同时定义变量 */
struct student {
    int num;
    char name[8];
} a, *b, c[3];

/* 3. 直接定义结构体变量，省略类型名 */
struct {
    int num;
    char name[8];
} a, *b, c[3];

/* 4. 用 typedef 定义类型别名后再定义变量 */
typedef struct student {
    int num;
    char name[8];
} STD;
STD a, *b, c[3];
```

结构体类型声明的大括号后面要加分号。$kp$, section = '' where id = 30505;
update t_knowledge_point set title = $kp$结构体成员运算符的正误$kp$, content = $kp$`c[1]` 是结构体数组中的一个结构体变量，不是指针，因此应使用成员运算符 `.`：

```c
c[1].b = 72.45;    // 正确
c[1]->b = 72.45;   // 错误
```

`->` 只能用于结构体指针。结构体变量用 `.`，结构体指针用 `->`；连续出现两个 `.` 或两个 `->` 通常也是错误的。$kp$, section = '' where id = 30528;
update t_knowledge_point set title = $kp$关键字与预定义标识符$kp$, content = $kp$C 语言有 32 个关键字，关键字不能用作标识符。

`scanf`、`printf`、`define`、`include` 属于预定义标识符，不是关键字，语法上可以作为用户标识符，但它们已有特定含义，使用后会影响原有功能，因此不建议这样做。

关键字全部由小写字母组成，且区分大小写；例如 `if` 是关键字，`If` 不是。$kp$, section = '' where id = 30547;
update t_knowledge_point set title = $kp$整除与强制类型转换的混合运算$kp$, content = $kp$```text
8 / 4 * (int)15.5 / (int)(1.25 * (3.7 + 3))
= 2 * 15 / (int)(1.25 * 6.7)
= 30 / 8
= 3
```

计算要点：

- `8 / 4` 是两个整数相除，结果为 2。
- `(int)15.5` 把浮点数强制转换为整数，截去小数部分，结果为 15。
- `1.25 * 6.7` 的结果为 8.375，再强制转换为 int 得 8。
- `30 / 8` 两边都是整数，进行整除，结果为 3。$kp$, section = '' where id = 30578;
update t_knowledge_point set title = $kp$long long、布尔类型与指针类型$kp$, content = $kp$C99 增加了 `long long` 整型和布尔类型 `bool`（使用 `_Bool` 或包含 `<stdbool.h>`）。

指针类型的数据可以用来实现链表、树、栈等复杂的数据结构，是 C 语言中构造复杂数据组织方式的重要手段。$kp$, section = '' where id = 30579;
update t_knowledge_point set title = $kp$C 语言的逻辑值$kp$, content = $kp$C 语言规定非零值为真，0 为假。关系运算和逻辑运算的结果为 1（真）或 0（假）。$kp$, section = '' where id = 30587;
update t_knowledge_point set title = $kp$基本算术运算符及整除规则$kp$, content = $kp$C 语言的基本算术运算符有 `+`、`-`、`*`、`/`、`%`。

- `/`：两边都是整数时进行整除，结果舍去小数部分；只要有一边是浮点数，就进行浮点除法。
- `%`：求余运算，要求两边都是整数，结果的符号与左操作数相同。

```c
5 / 2     // 2
5 / 2.0   // 2.5
7 % 4     // 3
```$kp$, section = '' where id = 30595;
update t_knowledge_point set title = $kp$字符常量与转义字符$kp$, content = $kp$字符常量用单引号括起来，单引号内只能放一个字符：

```c
'A'   'f'   '1'    // 合法
"AB"               // 字符串常量，不是字符常量
'AB'               // 不合法
```

转义字符以反斜杠 `\` 开头，用来表示无法直接输入的字符，如 `'\n'`（换行）、`'\t'`（制表）、`'\'`（反斜杠）。$kp$, section = '' where id = 30598;
update t_knowledge_point set title = $kp$宏定义与文本替换$kp$, content = $kp$`#define` 是预处理命令，用来定义符号常量或带参数的宏：

```c
#define 宏名 替换文本
#define 宏名(参数) 替换文本
```

宏定义不是 C 语句，行末不加分号。预处理阶段只做简单的文本替换，因此替换文本中的运算符优先级可能改变运算结果。例如：

```c
#define k 2 + 3
k / k     // 展开为 2 + 3 / 2 + 3，结果为 6
```

如果希望 2+3 整体参与运算，应写成 `#define k (2 + 3)`。$kp$, section = '' where id = 30600;
update t_knowledge_point set title = $kp$整型常量与 printf 格式符$kp$, content = $kp$整型常量可以用三种进制书写：

- 十进制：`123`、`-456`
- 八进制：以 0 开头，如 `024`、`072`；八进制中不能出现数字 8 和 9
- 十六进制：以 `0x` 或 `0X` 开头，如 `0x123`、`0xabc`

```c
printf("%d,%d\n", 012, 0x12);  // 10,18
printf("%o,%o\n", 10, 12);     // 12,14
printf("%x,%x\n", 10, 12);     // a,c
```

常用格式符：

| 格式符 | 含义 |
| --- | --- |
| `%d` | 十进制整数 |
| `%o` | 八进制整数，无前导 0 |
| `%x` / `%X` | 十六进制整数，小写 / 大写字母 |
| `%f` | 实型，默认保留 6 位小数 |
| `%c` | 字符 |$kp$, section = '' where id = 30601;
update t_knowledge_point set title = $kp$结构体类型的声明$kp$, content = $kp$结构体类型用 `struct` 声明，类型名后面的大括号内列出各个成员：

```c
struct student {
    int num;
    char name[8];
    float score;
};

struct date {
    int year;
    int month;
    int day;
};
```

`struct student` 是结构体类型名，`num`、`name`、`score` 是结构体成员。声明类型时只是描述了数据的组成，并不会分配存储空间；定义变量时才分配空间。$kp$, section = '' where id = 30602;
update t_knowledge_point set title = $kp$auto 存储类$kp$, content = $kp$`auto` 用于说明自动变量，变量存放在内存中，生命周期限于所在的函数或语句块。

```c
auto int a;
```

其中 `auto` 是存储类，`int` 是类型名，`a` 是变量名。局部变量默认的存储类就是 auto，因此通常省略不写。$kp$, section = '' where id = 30603;
update t_knowledge_point set title = $kp$变量的概念与定义$kp$, content = $kp$变量是在程序运行过程中其值可以改变的量。定义变量时要指出类型和变量名：

```c
int a, b, s;
float x, y;
```

变量名必须是合法的标识符。局部变量如果没有赋初值，它的值是随机值，使用前应先赋值。$kp$, section = '' where id = 30607;
update t_knowledge_point set title = $kp$结构体变量与数组的初始化$kp$, content = $kp$结构体变量可以在定义时按成员顺序初始化：

```c
struct {
    int a;
    float b;
} s = {12, 24.56};    // a=12，b=24.56
```

大括号中有几个初值就依次赋给几个成员，后面的成员若没有初值则按默认方式处理。

结构体数组也可以整体初始化：

```c
struct data {
    int x;
    int y;
} c[3] = {12, 24, 36, 48, 60, 72};
```

初始化后：`c[0]` 为 {12,24}，`c[1]` 为 {36,48}，`c[2]` 为 {60,72}。

关于 `sizeof`：结构体变量所占字节数不一定等于各成员字节数简单相加，还要考虑内存对齐。例如 VC6 默认为 8 字节对齐时，成员为 `int a[2]`、`char ch[10]`、`float s`、`double f` 的结构体，各成员之和为 30 字节，实际 `sizeof` 通常为 32 字节；结构体指针变量本身占 4 字节（32 位环境）。$kp$, section = '' where id = 30613;
update t_knowledge_point set title = $kp$C 语言运算符单选题选讲$kp$, content = $kp$1. 语句 `while(E);` 中的表达式 `!E` 等价于（ ）。
A. `E==0`　B. `E!=1`　C. `E!=0`　D. `E==1`
答案：A。`!E` 为真即 E 为 0。

2. 若 `a=1`、`b=2`，则 `a|b` 的值是（ ）。
A. 0　B. 1　C. 2　D. 3
答案：D。1 的二进制为 01，2 为 10，按位或得 11，即 3。

3. 在 C 语言中，引用数组元素时，数组下标的数据类型允许是（ ）。
A. 整型常量　B. 整型表达式　C. 整型常量或整型表达式　D. 任何类型的表达式
答案：C。数组下标必须是整型常量或整型表达式。$kp$, section = '' where id = 30620;
update t_knowledge_point set title = $kp$字符变量与 ASCII 码$kp$, content = $kp$字符变量用 `char` 定义，存放的是字符的 ASCII 码值。

```c
char ch = 'A';
printf("%c\n", ch);   // A
printf("%d\n", ch);   // 65
```

`%c` 输出字符本身，`%d` 输出字符对应的 ASCII 码值。

```c
char c1 = 'A', c2 = 100;
printf("%d,%c\n", c1, c2);   // 65,d

c1 = c1 + 32;   // 'A' → 'a'
c2 = c2 - 32;   // 100('d') → 68('D')
printf("%c,%d\n", c1, c2);   // a,68
```

规律：大写字母的 ASCII 码值加 32 得到对应的小写字母，小写字母减 32 得到对应的大写字母。$kp$, section = '' where id = 30623;
update t_knowledge_point set title = $kp$实型变量与混合运算类型$kp$, content = $kp$单精度 `float` 一般占 4 个字节，双精度 `double` 一般占 8 个字节。

```c
float f = 24.56;
printf("%f\n", f);   // 24.560000，默认保留 6 位小数
```

不同类型混合运算时，结果会自动转换为精度较高的类型。例如：

```c
char w;
int x;
float y;
double z;
w * x + z - y;   // 结果类型为 double
```$kp$, section = '' where id = 30625;
update t_knowledge_point set title = $kp$常量的分类$kp$, content = $kp$常量是在程序运行过程中其值不能改变的量。常见类型有：

- 整型常量：`123`、`-456`
- 实型常量：`0.123`、`-4.56`
- 字符常量：`'A'`、`'f'`、`'8'`

此外还有字符串常量，如 `"hello"`，以及用 `#define` 或 `const` 定义的符号常量。$kp$, section = '' where id = 30626;
update t_knowledge_point set title = $kp$整型变量的类型与长度$kp$, content = $kp$整型变量按长度和符号可分为：

| 类型 | 典型长度 |
| --- | --- |
| `int` 基本整型 | TC 下 2 字节，VC 下 4 字节 |
| `short` 短整型 | 2 字节 |
| `long` 长整型 | 4 字节 |
| `unsigned` 无符号型 | 与同类型的有符号版本相同 |
| `char` 字符型 | 1 字节 |

```c
int a, b, sum;
a = 123;
b = 456;
sum = a + b;
printf("a=%d,b=%d\n", a, b);
printf("sum=%d\n", sum);
```

输出结果为 `a=123,b=456` 和 `sum=579`。$kp$, section = '' where id = 30629;
update t_knowledge_point set title = $kp$先声明类型再定义结构体变量$kp$, content = $kp$可以先声明结构体类型，再用类型名定义变量：

```c
struct student {
    int num;
    char name[8];
};

struct student a, *b, c[3];
```

`struct student` 是类型名；`a` 是结构体变量，`*b` 是结构体指针，`c[3]` 是结构体数组。$kp$, section = '' where id = 30631;
update t_knowledge_point set title = $kp$用指针交换两个变量的值$kp$, content = $kp$```c
int a, b, *p, *q, t;
p = &a;
q = &b;

scanf("%d%d", p, q);   // 等价于 scanf("%d%d", &a, &b)

t = *p;
*p = *q;
*q = t;

printf("%d,%d\n", *p, *q);
```

`p`、`q` 分别指向 `a`、`b`，交换 `*p` 和 `*q` 就是交换 `a` 和 `b` 的值。$kp$, section = '' where id = 30633;
update t_knowledge_point set title = $kp$嵌套语句块与变量作用域$kp$, content = $kp$下面程序中，内层语句块定义了与外层同名的变量，内层变量会遮蔽外层变量：

```c
#include <stdio.h>

int main(void) {
    int a = 3, b = 2, c = 1;

    c -= ++b;          // b=3，c=-2
    b *= a + c;        // b=3*(3-2)=3
    {
        int b = 5, c = 12;
        c /= b * 2;    // c=12/10=1
        a -= c;        // a=2
        printf("%d,%d,%d,", a, b, c);  // 2,5,1,
        a += --c;      // 内层 c=1，--c=0，a=2
    }
    printf("%d,%d,%d", a, b, c);       // 2,3,-2
    return 0;
}
```

按题面大括号的位置，程序输出为 `2,5,1,2,3,-2`。内层 `b`、`c` 是新的局部变量，离开语句块后外层同名变量恢复使用。$kp$, section = '' where id = 30645;
update t_knowledge_point set title = $kp$结构体成员的引用方式$kp$, content = $kp$结构体成员有三种引用形式：

```c
struct data {
    int a;
    float b;
} s, *p = &s, c[3];

s.a = 12;       // 结构体变量用 .
p->a = 12;      // 结构体指针用 ->
(*p).a = 12;    // 先解引用，再用 .
```

成员运算符 `.` 和指向运算符 `->` 的优先级最高，结合方向为从左到右。`c[0].a`、`p->b` 都是合法写法。$kp$, section = '' where id = 30649;
update t_knowledge_point set title = $kp$程序输出条件试题片段$kp$, content = $kp$该条目是试卷扫描残片，题干中的程序代码和选项已经缺失，无法确定 `a`、`b` 应满足的条件。

残存内容还包含一道编程题要求：从键盘输入 10 个学生的成绩，统计并输出最高分、最低分和平均分。$kp$, section = '' where id = 30854;
update t_knowledge_point set title = $kp$实型常量的指数形式$kp$, content = $kp$C 语言的实型常量可以用指数形式表示：

```text
12.34E+2  = 12.34 × 10²
12.34e-2  = 12.34 × 10⁻²
```

组成规则：

1. E 或 e 的前后都必须有数字。
2. 指数部分必须是整数，写在 E 或 e 的右边。

因此 `1.2E`、`e-5`、`2E1.5` 都是不合法的；`3.14`、`12.34E+2`、`-3.e+2` 合法。$kp$, section = '' where id = 30944;
update t_knowledge_point set title = $kp$进位标志 CF 与溢出标志 OF$kp$, content = $kp$CF 是进位标志位。进行无符号数运算时，如果最高有效位向更高位产生进位或借位，则 CF=1，否则 CF=0。

OF 是溢出标志位。进行有符号数运算时，若结果超出该类型能表示的范围，则 OF=1。OF 可由符号位的进位与最高数值位向符号位的进位异或得到。

判断结果是否出错：

- 无符号数运算看 CF：CF=1 说明发生进位或借位，结果超出无符号数的表示范围。
- 有符号数运算看 OF：OF=1 说明发生溢出，结果错误。

例如 8 位有符号数 127+1，结果为 -128，OF=1，表示溢出。$kp$, section = '' where id = 31304;
update t_knowledge_point set title = $kp$删除链表结点与求链表长度$kp$, content = $kp$已知指针 `p` 指向要删除的结点时，可以先把后一个结点的数据复制到 `p`，再删除后一个结点，时间复杂度为 O(1)：

```c
q = p->next;
p->data = q->data;
p->next = q->next;
free(q);
```

这里 `q` 指向 `p` 的后继结点，释放前必须先用它保存地址。

求链表长度时，要区分链表是否带头结点：

- 带头结点：从 `head->next` 开始计数，遇到 `NULL` 结束。
- 不带头结点：从 `head` 开始计数，遇到 `NULL` 结束。$kp$, section = '' where id = 31309;
update t_knowledge_point set title = $kp$一维条形码 EAN-13 的结构$kp$, content = $kp$EAN-13 商品条码由以下部分组成：

- 国家代码
- 厂商代码
- 产品代码
- 校验码
- 起始符、中间分隔符、终止符
- 左右两侧的静空区

39 码和 128 码属于国内企业内部自定义码制，可以根据需要确定条码长度和所编码的信息。$kp$, section = '' where id = 31321;
update t_knowledge_point set title = $kp$C 语言运算符的分类$kp$, content = $kp$C 语言常用运算符可以按功能分类：

- 算术运算符
- 关系运算符
- 逻辑运算符
- 赋值运算符
- 位运算符
- 自增自减运算符
- 条件（三目）运算符
- 逗号运算符$kp$, section = '' where id = 31339;
update t_knowledge_point set title = $kp$复合赋值运算符的形式$kp$, content = $kp$复合赋值运算符由算术运算符或位运算符与赋值运算符组合而成，例如 `+=`、`-=`、`*=`、`/=`、`%=`、`<<=`、`>>=`、`&=`、`^=`、`|=`。

复合赋值表达式可以转化为普通赋值表达式：

```c
n += 100;    // 等价于 n = n + 100;
```

复合赋值运算符与赋值运算符优先级相同，结合方向为从右到左。$kp$, section = '' where id = 31344;
update t_knowledge_point set title = $kp$5G 体验速率指标$kp$, content = $kp$体验速率定义为用户速率概率累计函数中 5% 点处所获得的速率，单位为 bit/s。

主要使用场景为 eMBB。指标要求：下行体验速率大于 100 Mbit/s，上行体验速率大于 50 Mbit/s。$kp$, section = '' where id = 31570;
update t_knowledge_point set title = $kp$Windows 标准计算器的使用$kp$, content = $kp$单击【开始】按钮，选择“所有程序”|“附件”|“计算器”命令，打开“计算器”窗口。

该界面是标准型计算器，只能执行简单的计算。如需使用数字小键盘输入数字和运算符，可按【Num Lock】键，然后再输入。该计算器还能存储数据。$kp$, section = '' where id = 31633;
update t_knowledge_point set title = $kp$Windows 科学型计算器$kp$, content = $kp$单击“查看”菜单，选择“科学型”命令，可将标准计算器转换成科学型计算器。

科学型计算器功能较强，不仅可以进行三角函数、阶乘、平方、立方等运算，还具有数制转换、逻辑运算和统计计算的功能。$kp$, section = '' where id = 31634;
update t_knowledge_point set title = $kp$逻辑与（AND）运算$kp$, content = $kp$逻辑乘法又称与运算，运算符为 AND 或 ∧，运算规则是“同时为真结果才为真”。

| A | B | A∧B |
| --- | --- | --- |
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |$kp$, section = '' where id = 31651;
update t_knowledge_point set title = $kp$逻辑或（OR）运算$kp$, content = $kp$逻辑加法又称或运算，运算符为 OR 或 ∨，运算规则是“有一个为真结果就为真”。

| A | B | A∨B |
| --- | --- | --- |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |$kp$, section = '' where id = 31652;
update t_knowledge_point set title = $kp$逻辑非（NOT）运算$kp$, content = $kp$逻辑否定又称非运算，运算符为 NOT 或 ¬，运算规则是“非真为假，非假为真”。

| A | NOT A |
| --- | --- |
| 0 | 1 |
| 1 | 0 |$kp$, section = '' where id = 31653;
update t_knowledge_point set title = $kp$运算成分的含义$kp$, content = $kp$运算成分指程序中只要出现运算符的语句，用来描述程序所包含的运算。$kp$, section = '' where id = 31668;
update t_knowledge_point set title = $kp$Excel 错误值 #VALUE!$kp$, content = $kp$`#VALUE!` 表示公式中输入了不正确的参数或运算符，例如把数字和文本直接相加：

```text
=1+"A"
```$kp$, section = '' where id = 31669;
update t_knowledge_point set title = $kp$Excel 错误值 #VALUE! 的含义$kp$, content = $kp$`#VALUE!` 是 Excel 的错误值，出现原因是公式中使用了类型不正确的参数或运算符，例如数字与文本直接相加：

```text
=1+"A"
```$kp$, section = '' where id = 31670;
update t_knowledge_point set title = $kp$逻辑加法（或运算）$kp$, content = $kp$逻辑加法又称或运算，运算符为 OR 或 ∨。

运算规则：只要有一个操作数为真，结果就为真；两个操作数都为假时结果才为假。$kp$, section = '' where id = 31671;
update t_knowledge_point set title = $kp$异或运算$kp$, content = $kp$异或运算可以由与、或、非三种基本逻辑运算推导出来，运算符记为 ⊕。

运算规则：相同为假，相异为真。

```text
0 ⊕ 0 = 0
0 ⊕ 1 = 1
1 ⊕ 0 = 1
1 ⊕ 1 = 0
```$kp$, section = '' where id = 31672;
update t_knowledge_point set title = $kp$运算成分（含运算符的语句）$kp$, content = $kp$运算成分指程序中包含运算符的语句，它描述程序所执行的运算。$kp$, section = '' where id = 31731;
update t_knowledge_point set title = $kp$大小写字母的 ASCII 码差值$kp$, content = $kp$大写字母与小写字母的 ASCII 码值相差 32。

例如 `'A'` 的 ASCII 码值为 65，`'a'` 为 97，因此大写字母加 32 可转换为对应的小写字母。$kp$, section = '' where id = 31748;
update t_knowledge_point set title = $kp$强制类型转换的一般形式$kp$, content = $kp$强制类型转换的一般形式为：

```c
(类型说明符)(表达式)
```

例如 `(int)3.7` 把 3.7 转换为整数 3；`(float)5 / 2` 先把 5 转换为 float，再进行浮点除法，结果为 2.5。$kp$, section = '' where id = 31749;
update t_knowledge_point set title = $kp$强制类型转换的作用$kp$, content = $kp$强制类型转换把表达式的运算结果转换成类型说明符所表示的类型，例如：

```c
(int)3.14    // 3
(double)5    // 5.0
```

转换只影响该表达式的值，不会改变原变量的类型和值。$kp$, section = '' where id = 31750;
update t_knowledge_point set title = $kp$关系运算符与表达式概述$kp$, content = $kp$关系运算符用于比较两个数值，包括 `>`、`>=`、`<`、`<=`、`==`、`!=`。

由关系运算符连接数值或数值表达式构成关系表达式，其值为逻辑值：真用 1 表示，假用 0 表示。例如 `3 > 2` 的值为 1，`3 == 2` 的值为 0。$kp$, section = '' where id = 31751;
update t_knowledge_point set title = $kp$逻辑运算符与逻辑表达式$kp$, content = $kp$逻辑运算符优先级从高到低为：`!`、`&&`、`||`。

| a | b | a&&b | a\|\|b | !a |
| --- | --- | --- | --- | --- |
| 真 | 真 | 真 | 真 | 假 |
| 真 | 假 | 假 | 真 | 假 |
| 假 | 真 | 假 | 真 | 真 |
| 假 | 假 | 假 | 假 | 真 |

进行逻辑运算时，若 `&&` 左边的值为 0，则不再计算右边的运算对象，整个表达式的值为 0，这称为短路。$kp$, section = '' where id = 31752;
update t_knowledge_point set title = $kp$树结构的特点$kp$, content = $kp$树结构是一种层次结构，除根元素外，其他元素都有唯一前驱，但可以有多个后继。

树结构表示的是 1 对多的层次关系。$kp$, section = '' where id = 31789;
update t_knowledge_point set title = $kp$字符型的关键字$kp$, content = $kp$字符型使用关键字 `char`。

方括号中的内容表示可以省略：

- `[signed] char`：有符号字符型
- `unsigned char`：无符号字符型$kp$, section = '' where id = 31799;
update t_knowledge_point set title = $kp$字符型的取值范围$kp$, content = $kp$字符型的取值范围：

- `[signed] char`：-128～127（有符号）
- `unsigned char`：0～255（无符号）$kp$, section = '' where id = 31800;
update t_knowledge_point set title = $kp$用 const 定义字符常量$kp$, content = $kp$```c
const char A = 'A';
const char Str = '\n';
```

`const` 修饰的变量在定义时必须初始化，之后不能再被修改，通常用来表示常量。$kp$, section = '' where id = 31801;
update t_knowledge_point set title = $kp$整型的关键字$kp$, content = $kp$整型使用以下关键字，方括号中的内容表示可以省略：

- `[signed] short`：有符号短整型；`unsigned short`：无符号短整型
- `[signed] int`：有符号整型；`unsigned int`：无符号整型
- `[signed] long`：有符号长整型；`unsigned long`：无符号长整型$kp$, section = '' where id = 31802;
update t_knowledge_point set title = $kp$整型的存储空间与取值范围$kp$, content = $kp$| C 类型 | 32 位 | 64 位（LP64） | 取值范围 |
| --- | --- | --- | --- |
| `short` | 2 字节 | 2 字节 | -32768～32767 |
| `unsigned short` | 2 字节 | 2 字节 | 0～65535 |
| `int` | 4 字节 | 4 字节 | -2147483648～2147483647 |
| `unsigned int` | 4 字节 | 4 字节 | 0～4294967295 |
| `long` | 4 字节 | 8 字节 | 32 位：-2³¹～2³¹-1；64 位：-2⁶³～2⁶³-1 |
| `unsigned long` | 4 字节 | 8 字节 | 32 位：0～2³²-1；64 位：0～2⁶⁴-1 |

注意：64 位 Windows 使用 LLP64 模型，`long` 仍为 4 字节；表中的 64 位数据适用于 LP64 平台（如 64 位 Linux）。$kp$, section = '' where id = 31803;
update t_knowledge_point set title = $kp$实型的关键字与精度$kp$, content = $kp$实型使用 `float`（单精度）和 `double`（双精度）两个关键字。

```c
float f = 3.14F;
double d = 3.141592653;
```

`float` 一般占 4 个字节，有效数字约 6～7 位；`double` 一般占 8 个字节，有效数字约 15～16 位。常量后面的 `F` 后缀表示 float 类型，否则小数常量默认是 double 类型。$kp$, section = '' where id = 31804;
update t_knowledge_point set title = $kp$单精度与双精度的表示范围$kp$, content = $kp$单精度 `float` 一般占 4 个字节，表示范围约为 -3.4×10³⁸～3.4×10³⁸，有效数字约 6～7 位。

双精度 `double` 一般占 8 个字节，表示范围约为 -1.7×10³⁰⁸～1.7×10³⁰⁸，有效数字约 15～16 位。

两者的区别主要在表示范围和数据精度：double 的范围更大、精度更高，但占用的存储空间也更多。$kp$, section = '' where id = 31805;
update t_knowledge_point set title = $kp$用 const 定义实型常量$kp$, content = $kp$```c
const float PI = 3.141592F;
const double PI = 3.141592653;
```

带 `F` 后缀的常量是 float 类型，不带后缀的小数常量是 double 类型。$kp$, section = '' where id = 31806;
update t_knowledge_point set title = $kp$求余运算的规则$kp$, content = $kp$求余运算 `%` 要求运算对象只能是整型。

取模结果的正负由左操作数决定：左操作数为正时结果非负；左操作数为负时结果为负或 0。

标准规定，整数 `a`、`b` 满足：

```text
a % b = a - (a / b) * b
```

例如：

```c
-15 % 2   // -15 - (-15 / 2) * 2 = -15 - (-7) * 2 = -1
```

C 语言的整数除法向零截断，因此 `-15 / 2` 的结果是 -7。$kp$, section = '' where id = 31807;
update t_knowledge_point set title = $kp$逻辑非运算$kp$, content = $kp$逻辑非运算符 `!` 的规则是：真变假，假变真。

```c
!0   // 1
!1   // 0
```

C 语言中 0 表示假，非零值表示真，因此 `!5` 的结果也是 0。$kp$, section = '' where id = 31808;
update t_knowledge_point set title = $kp$按位右移运算$kp$, content = $kp$`>>` 是按位右移运算符，每右移一位相当于除以 2 并舍去小数，右移 N 位相当于缩小为原来的 1/2ᴺ。

- 对无符号整数和正整数，高位补 0。
- 对负整数，多数编译器采用算术右移，高位补 1；C 标准将负数的右移规定为实现定义行为。

```c
8 >> 1    // 4
8 >> 2    // 2
```$kp$, section = '' where id = 31809;
update t_knowledge_point set title = $kp$赋值时的类型转换$kp$, content = $kp$把浮点数赋给整型变量时，会截去小数部分，只保留整数部分：

```c
float f = 100;
int n = f;       // n 为 100

f = 100.9;
n = f;           // n 为 100，小数部分被截去
```$kp$, section = '' where id = 31810;
update t_knowledge_point set title = $kp$混合运算中的隐式类型转换$kp$, content = $kp$不同类型的数据混合运算时，会按转换规则自动转换为精度较高的类型：

```c
int a, b;
float f;
f = a + b;        // int 结果隐式转换为 float
double m = a + f; // float 结果隐式转换为 double
```

一般的转换方向为：`char`、`short` → `int` → `unsigned` → `long` → `float` → `double`。$kp$, section = '' where id = 31811;
update t_knowledge_point set title = $kp$tolower 大写转小写$kp$, content = $kp$`tolower` 用于把大写字母转换为小写字母，需要包含头文件 `<ctype.h>`。

```c
#include <ctype.h>

int tolower(int ch);
```

若 `ch` 是大写字母（`'A'`～`'Z'`），返回对应的小写字母；否则原样返回。例如 `tolower('A')` 返回 `'a'`。

对应的 `toupper` 函数把小写字母转换为大写字母，例如 `toupper('a')` 返回 `'A'`。$kp$, section = '' where id = 31818;
update t_knowledge_point set title = $kp$自增自减的前后缀口诀$kp$, content = $kp$口诀：加加（减减）在前，先加（减）后用；加加（减减）在后，先用后加（减）。

- `++a`：先把 a 加 1，再使用 a 的新值。
- `a++`：先使用 a 的原值，再把 a 加 1。

`--` 的规则与 `++` 相同。$kp$, section = '' where id = 31862;
update t_knowledge_point set title = $kp$交换两个变量的两种方法$kp$, content = $kp$方法一：使用中间变量。

```c
t = x;
x = y;
y = t;
```

方法二：不使用中间变量，通过加减运算交换。

```c
x = x + y;
y = x - y;
x = x - y;
```

第二种方法只适用于数值类型，并且两数相加可能发生溢出。$kp$, section = '' where id = 31868;
update t_knowledge_point set title = $kp$SQL 聚合函数 SUM$kp$, content = $kp$`SUM` 是常用的聚合函数，返回指定属性（字段）的和。

```sql
-- 统计全班数学总成绩
SELECT SUM(math) AS 总成绩
FROM 成绩表
WHERE 班级号 = 'cs001';

-- 计算销售额提成
SELECT SUM(销售额 * 0.10) AS 提成
FROM 销售表;
```$kp$, section = '' where id = 31873;
update t_knowledge_point set title = $kp$浮点数的尾数与指数$kp$, content = $kp$浮点数由尾数和指数两部分组成：

1. 尾数由纯小数组成，决定可表示的数的精度。
2. 指数由整数组成，决定可表示的数的范围。

| 类型 | 可表示的数的范围 | 可表示的数的精度 |
| --- | --- | --- |
| 浮点数 | 大 | 差 |
| 定点数 | 小 | 好 |

在总位数相同的情况下，浮点数用较多的位表示范围、较少的位表示精度，因此范围大但精度较低。$kp$, section = '' where id = 31919;
update t_knowledge_point set title = $kp$符号常量$kp$, content = $kp$在 C 语言程序中，可以用一个符号名来代表一个常量，称为符号常量。

例如：

```c
#define PI 3.1416
```

此后 `PI` 就代表常量 3.1416，通常用大写字母命名符号常量，以便与变量区分。$kp$, section = '' where id = 31925;
update t_knowledge_point set title = $kp$整型变量的符号属性与扩充类型$kp$, content = $kp$整型变量的值包括负数到正数，也可以定义为“无符号”类型。`signed` 表示有符号，通常可以省略。

扩充的整型类型：

- 有符号双长整型：`[signed] long long [int]`
- 无符号双长整型：`unsigned long long [int]`

Turbo C 中各类整型量的字节数和表示范围：

| 类型说明符 | 字节数 | 数的范围 |
| --- | --- | --- |
| `int` / `short` / `signed int` | 2 | -32768～32767 |
| `unsigned int` | 2 | 0～65535 |
| `long` | 4 | -2147483648～2147483647 |
| `unsigned long` | 4 | 0～4294967295 |

C99 把字符型数据也作为整数类型的一种，字符按代码（整数）形式存储。$kp$, section = '' where id = 31953;
update t_knowledge_point set title = $kp$运算符优先级口诀$kp$, content = $kp$逗号运算符的级别最低，赋值运算符的级别倒数第二。

记忆时可按从高到低排列：初等运算符 → 单目运算符 → 算术运算符 → 关系运算符 → 逻辑运算符 → 条件运算符 → 赋值运算符 → 逗号运算符。$kp$, section = '' where id = 32071;
update t_knowledge_point set title = $kp$实型常量与类型长度口诀$kp$, content = $kp$指数形式的实型常量要记住：E 或 e 前后必有数字，E 或 e 后面必为整数。

常见类型长度：整型一般 4 个字节，字符型 1 个字节，双精度一般 8 个字节。

```c
long int x;       // x 是长整型
unsigned int x;   // x 是无符号整型
```

算术表达式和赋值表达式都属于表达式，表达式一定有数值。$kp$, section = '' where id = 32072;
update t_knowledge_point set title = $kp$赋值表达式的值$kp$, content = $kp$赋值表达式的值就是赋值后左边变量得到的值。

```c
a = b = 5;   // 整个表达式的值为 5
```

赋值运算符的左边必须是变量，常量不可以被赋值，例如 `5 = a` 是错误的。$kp$, section = '' where id = 32073;
update t_knowledge_point set title = $kp$自增自减的运算机理$kp$, content = $kp$假设 `a=5`：

- `++a`：先把 a 的值加 1，a 变为 6，表达式的值也是 6。
- `a++`：先取 a 的原值 5 作为表达式的值，再把 a 加 1，a 变为 6。

无论执行 `++a` 还是 `a++`，执行后变量 a 的值都是 6。考试口诀：`++` 在前先加后用，`++` 在后先用后加。$kp$, section = '' where id = 32074;
update t_knowledge_point set title = $kp$逗号表达式的值$kp$, content = $kp$逗号表达式的优先级最低，整个表达式的值是逗号最右边那个表达式的值。

```c
(2, 3, 4)        // 表达式的值为 4

z = (2, 3, 4);   // 整个是赋值表达式，z 的值为 4
z = 2, 3, 4;     // 整个是逗号表达式，z 的值为 2
```$kp$, section = '' where id = 32075;
update t_knowledge_point set title = $kp$运算成分的定义与示例$kp$, content = $kp$运算成分用以描述程序所包含的运算，例如算术表达式和逻辑表达式等。$kp$, section = '' where id = 32077;
update t_knowledge_point set title = $kp$位与字节$kp$, content = $kp$bit 是位，指一个二进制位，只能为 0 或 1。

byte 是字节，一个字节等于 8 个位。$kp$, section = '' where id = 32079;
update t_knowledge_point set title = $kp$标识符的构成规则$kp$, content = $kp$合法标识符只能由字母、数字和下划线组成，出现其他字符就是错误的。

第一个字符必须是字母或下划线，不能是数字。$kp$, section = '' where id = 32083;
update t_knowledge_point set title = $kp$标识符的分类$kp$, content = $kp$标识符分为关键字、预定义标识符和用户标识符。

- 关键字：不能作为用户标识符。`main`、`define`、`scanf`、`printf` 都不是关键字；`If`、`Main` 首字母大写，与关键字大小写不同，可以作为用户标识符。
- 预定义标识符：如 `define`、`scanf`、`printf`、`include`。它们可以作为用户标识符，但已有特定含义，一般不作此用。
- 用户标识符：可作为常量名、变量名、函数名、构造类型名等。$kp$, section = '' where id = 32084;
update t_knowledge_point set title = $kp$整型常量的进制表示$kp$, content = $kp$C 语言的整型常量有八进制、十进制和十六进制三种写法，没有二进制常量写法；程序运行时，各进制数据都会转换为二进制处理。

- 八进制以 0 开头，如 `024`；`018` 是非法的，因为八进制没有数字 8。
- 十六进制以 `0x` 开头，如 `0x1A`。$kp$, section = '' where id = 32085;
update t_knowledge_point set title = $kp$实型常量的写法$kp$, content = $kp$小数的合法写法：小数点两边只要有一边不是零，另一边的 0 可以省略。

```c
1.0   // 可写成 1.
0.1   // 可写成 .1
```

注意：`1` 是整型常量，不是实型常量；要表示实数 1.0，应写成 `1.` 或 `1.0`。

科学计数法的合法形式：E 或 e 前后必须有数字，E 或 e 后必须是整数。例如 `2.333e-1` 是合法的，值为 2.333×10⁻¹。$kp$, section = '' where id = 32086;
update t_knowledge_point set title = $kp$变量的定义与使用$kp$, content = $kp$变量用于存储数据，变量名必须是合法的标识符，定义变量时必须指明类型。

变量参与运算时必须有确定的值，包括作为函数的实参。局部变量未初始化时值不确定，使用前应先赋值。$kp$, section = '' where id = 32087;
update t_knowledge_point set title = $kp$算术运算符与表达式$kp$, content = $kp$算术运算符有 `+`、`-`、`*`、`/`、`%`。

- `/` 两边都是整型时，结果也是整型，小数部分被舍去：`3 / 2` 的结果是 1。
- `/` 只要有一边是小数，结果就是小数：`3 / 2.0` 的结果是 1.5。
- `%` 是求余数，不是求除数；两边都必须是整数，`3.5 % 2` 是错误的。$kp$, section = '' where id = 32088;
update t_knowledge_point set title = $kp$赋值表达式的求值$kp$, content = $kp$赋值表达式的值是赋值后左边变量的值，赋值的左边只能是一个变量。

```c
a = b = 5;    // 表达式的值为 5
```

注意：

```c
int x = y = 10;   // 错误，定义时不能这样连续赋值
int x, y;
x = y = 10;       // 正确，定义完成后可以连续赋值
```$kp$, section = '' where id = 32089;
update t_knowledge_point set title = $kp$复合赋值表达式的计算$kp$, content = $kp$复合赋值运算符 `+=`、`-=`、`*=`、`/=`、`%=` 等，会先计算右边整个表达式的值，再与左边变量运算。

```c
int a = 2;
a *= 2 + 3;    // 等价于 a = a * (2 + 3)，a 的值为 10
```

注意先给 `2+3` 加上括号，不能算成 `a = a * 2 + 3`。$kp$, section = '' where id = 32090;
update t_knowledge_point set title = $kp$自增自减表达式的值$kp$, content = $kp$假设 `a=5`：

- `++a`：a 先加 1 变为 6，表达式的值为 6。
- `a++`：表达式的值为 a 的原值 5，然后 a 加 1 变为 6。

考试口诀：`++` 在前先加后用，`++` 在后先用后加。`--` 的规则相同。$kp$, section = '' where id = 32091;
update t_knowledge_point set title = $kp$逗号表达式的求值$kp$, content = $kp$逗号表达式的优先级最低，表达式的值是逗号最右边那个表达式的值。

```c
(2, 3, 4)        // 值为 4

z = (2, 3, 4);   // 整个是赋值表达式，z 的值为 4
z = 2, 3, 4;     // 整个是逗号表达式，z 的值为 2
```$kp$, section = '' where id = 32092;
update t_knowledge_point set title = $kp$逻辑运算符$kp$, content = $kp$C 语言的逻辑运算符：

- `&&`：逻辑与，相当于 AND
- `||`：逻辑或，相当于 OR
- `!`：逻辑非，相当于 NOT

C 语言没有专门的逻辑异或运算符，逻辑异或可以用 `(a && !b) || (!a && b)` 表示；若 a、b 已保证为 0 或 1，也可以用 `a != b`。$kp$, section = '' where id = 32110;
update t_knowledge_point set title = $kp$数据类型长度与程序注释$kp$, content = $kp$常见数据类型在 32 位和 64 位平台上的长度（字节）：

| 数据类型 | 32 位平台 | 64 位平台 |
| --- | --- | --- |
| `char` | 1 | 1 |
| `short` | 2 | 2 |
| `int` | 4 | 4 |
| `long` | 4 | 8 |
| `long long` | 8 | 8 |
| `float` | 4 | 4 |
| `double` | 8 | 8 |

程序注释：

- 注释用于说明程序，可以出现在程序中合适的位置。
- 注释从 `/*` 开始，到最近的 `*/` 结束，内容不会被计算机执行。
- 注释不可以嵌套。
- 单行注释用 `//`，一般用于一行内容的说明。
- 多行注释用 `/* ... */`，一般用于函数说明。

```c
#include <stdio.h>

int main(void) {
    int nAge;  // 定义一个整型变量用于存年龄

    /*
     * 多行注释
     * 可以写多行说明
     */
    return 0;
}
```

注意：64 位 Windows 使用 LLP64 模型，`long` 仍为 4 字节；表中 64 位的 `long` 长度适用于 LP64 平台。$kp$, section = '' where id = 32115;
update t_knowledge_point set title = $kp$字符变量的定义与转义写法$kp$, content = $kp$字符变量可以用字符常量或整数初始化：

```c
char a = 'a';     // 字符常量
char b = 97;      // ASCII 码值，97 对应 'a'
```

注意 `'\a'` 不是字母 a，而是响铃转义字符，ASCII 码值为 7。若要用转义形式表示字母 a，可以写 `'\141'`（八进制）或 `'\x61'`（十六进制）。$kp$, section = '' where id = 32117;
update t_knowledge_point set title = $kp$实型变量的定义$kp$, content = $kp$```c
float pi = 3.14F;
double pi = 3.141592653;
```

`float` 常量后面加 `F` 后缀，表示它是单精度类型；不加后缀的小数常量默认是 `double` 类型。

用 `float` 变量接收 double 常量时会进行类型转换，可能损失精度。$kp$, section = '' where id = 32118;
update t_knowledge_point set title = $kp$关系运算符$kp$, content = $kp$关系运算符用于比较两个值：

`>`（大于）、`>=`（大于等于）、`<`（小于）、`<=`（小于等于）、`==`（等于）、`!=`（不等于）。

关系表达式的值为 1（真）或 0（假）。例如 `3 > 2` 的值为 1，`3 <= 2` 的值为 0。$kp$, section = '' where id = 32121;
update t_knowledge_point set title = $kp$逻辑与运算$kp$, content = $kp$逻辑与 `&&`：两边表达式同时为真时结果为真，否则为假。

```c
0 && 1   // 0
1 && 1   // 1
1 && 0   // 0
0 && 0   // 0
```$kp$, section = '' where id = 32122;
update t_knowledge_point set title = $kp$逻辑或运算$kp$, content = $kp$逻辑或 `||`：两边表达式同时为假时结果为假，否则为真。

```c
0 || 1   // 1
1 || 1   // 1
1 || 0   // 1
0 || 0   // 0
```$kp$, section = '' where id = 32123;
update t_knowledge_point set title = $kp$逻辑或的短路现象$kp$, content = $kp$```c
a++ || b++
```

如果表达式 `a++` 的值非零（真），则整个逻辑或表达式已经为真，右边的 `b++` 不再执行。$kp$, section = '' where id = 32124;
update t_knowledge_point set title = $kp$逻辑与的短路现象$kp$, content = $kp$```c
a++ && b++
```

如果表达式 `a++` 的值为零（假），则整个逻辑与表达式已经为假，右边的 `b++` 不再执行。$kp$, section = '' where id = 32125;
update t_knowledge_point set title = $kp$逻辑运算符的运算对象$kp$, content = $kp$逻辑运算符两侧的运算对象可以是任何合法的标量类型数据，包括整型、浮点型、字符型和指针型。

判断时 0 为假，非 0 为真；逻辑运算的结果为 1 或 0。$kp$, section = '' where id = 32126;
update t_knowledge_point set title = $kp$赋值运算符的种类$kp$, content = $kp$赋值运算符包括：

`=`（赋值）、`+=`（加后赋值）、`-=`（减后赋值）、`*=`（乘后赋值）、`/=`（除后赋值）、`%=`（取余后赋值）、`<<=`（左移后赋值）、`>>=`（右移后赋值）、`&=`（按位与后赋值）、`^=`（按位异或后赋值）、`|=`（按位或后赋值）。$kp$, section = '' where id = 32127;
update t_knowledge_point set title = $kp$复合赋值运算符的展开$kp$, content = $kp$复合赋值运算符由算术运算符或位运算符与赋值运算符组合而成。

掌握把复合赋值表达式转化为普通赋值表达式的方法：

```c
n += 100;    // 等价于 n = n + 100;
a *= b;      // 等价于 a = a * b;
```

即先用左边变量和右边表达式按指定运算符运算，再把结果赋回左边变量。$kp$, section = '' where id = 32129;
update t_knowledge_point set title = $kp$条件运算符示例$kp$, content = $kp$```c
int a = 0, b = 10;
a = b > 0 ? 1 : 0;   // b>0 为真，a 的值为 1
```

条件表达式 `b > 0 ? 1 : 0` 先判断 `b > 0`，为真取 1，为假取 0。$kp$, section = '' where id = 32131;
update t_knowledge_point set title = $kp$自增运算的前缀与后缀$kp$, content = $kp$自增、自减运算分为前缀运算和后缀运算，它们所对应的表达式的值不同。

```c
j = i++;    // 等价于 j = i; i = i + 1;
j = ++i;    // 等价于 i = i + 1; j = i;
```

`i++` 使用 i 的原值，然后 i 加 1；`++i` 先把 i 加 1，再使用新值。$kp$, section = '' where id = 32132;
update t_knowledge_point set title = $kp$自增自减的运算对象$kp$, content = $kp$常量不可以使用 `++` 或 `--` 运算符，因为常量不能被修改。

自增自减的运算对象可以是 `char` 型变量、`int` 型变量和 `float` 型变量等可修改的变量。$kp$, section = '' where id = 32133;
update t_knowledge_point set title = $kp$自增自减在不同语境下的区别$kp$, content = $kp$自增、自减的前缀与后缀在以下情况中没有区别：

- 在 `for` 语句的表达式 3 位置，`++i` 和 `i++` 作用相同。
- 作为独立的语句，如 `i++;` 和 `++i;`，最终都是把 i 加 1。

在以下情况中区别明显：

- 函数传参：`fun(i++)` 先传递 i 的原值，再自增；`fun(++i)` 先自增，再传递新值。
- 逗号表达式：`(1, 2, i++)` 的值是 i 自增前的值；`(1, 2, ++i)` 的值是 i 自增后的值。

注意：`i++` 的表达式值是自增前的值，但 i 本身已经加 1；`++i` 的表达式值和 i 都是自增后的值。$kp$, section = '' where id = 32134;
update t_knowledge_point set title = $kp$按位取反运算$kp$, content = $kp$`~` 是按位取反运算符，规则是 1 取反变 0，0 取反变 1。

取反之后的结果按补码形式解释。例如：

```c
int a = ~0;
printf("%d", a);   // 输出 -1
```

0 的各位全为 0，取反后各位全为 1，按有符号补码解释就是 -1。$kp$, section = '' where id = 32135;
update t_knowledge_point set title = $kp$位运算符的优先级$kp$, content = $kp$位运算符的优先级从高到低为：

```text
~  >  <<、>>  >  &  >  ^  >  |
```

即按位取反最高，其次是移位，然后是按位与、按位异或、按位或。$kp$, section = '' where id = 32136;
update t_knowledge_point set title = $kp$逗号运算符$kp$, content = $kp$逗号运算符可以把多个表达式连接起来，构成一个更大的逗号表达式。

一般形式为：

```text
表达式1, 表达式2, ..., 表达式n
```

计算时从左到右依次求值，整个表达式的值为最后一个表达式的值。$kp$, section = '' where id = 32137;
update t_knowledge_point set title = $kp$运算符优先级从高到低$kp$, content = $kp$运算符的优先级从高到低依次为：

初等运算符 → 单目运算符 → 算术运算符 → 关系运算符 → 逻辑运算符（逻辑非 `!` 除外，它属于单目运算符）→ 条件运算符 → 赋值运算符 → 逗号运算符。$kp$, section = '' where id = 32139;
update t_knowledge_point set title = $kp$运算符优先级速记$kp$, content = $kp$可以简记为：

```text
()  >  单目运算符（++ -- * & ! ~ sizeof）  >  算术运算符
    >  关系运算符  >  &&  >  ||  >  ?:  >  赋值运算符  >  逗号运算符
```

其中单目运算符里的 `*` 是取值运算符，`&` 是取地址运算符，不是乘法和按位与。$kp$, section = '' where id = 32140;
update t_knowledge_point set title = $kp$运算符的结合方向$kp$, content = $kp$大多数运算符从左到右结合，例如 `()`、算术运算符、关系运算符、`&&`、`||` 等。

从右到左结合的运算符主要有：`!`、`++`、`--`、`*`（取值）、`&`（取地址）、赋值运算符和条件运算符等单目或特殊运算符。$kp$, section = '' where id = 32141;
update t_knowledge_point set title = $kp$单目运算符与双目运算符$kp$, content = $kp$单目运算符只有一个操作数，包括：`!`（逻辑非）、`~`（按位取反）、`++`、`--`、`-`（负号）、`(类型)`（强制类型转换）、`*`（取值）、`&`（取地址）、`sizeof` 等。

双目运算符有两个操作数，包括：算术运算符、关系运算符、`&`（按位与）、`|`、`&&`、`||` 等。$kp$, section = '' where id = 32142;
update t_knowledge_point set title = $kp$C 语言运算符优先级总表$kp$, content = $kp$| 优先级 | 运算符 | 名称 | 结合方向 |
| --- | --- | --- | --- |
| 1 | `[]`、`()`、`.`、`->` | 数组下标、圆括号、成员选择 | 左到右 |
| 2 | `-`、`(类型)`、`++`、`--`、`*`、`&`、`!`、`~`、`sizeof` | 单目运算符 | 右到左 |
| 3 | `*`、`/`、`%` | 乘、除、取余 | 左到右 |
| 4 | `+`、`-` | 加、减 | 左到右 |
| 5 | `<<`、`>>` | 左移、右移 | 左到右 |
| 6 | `<`、`<=`、`>`、`>=` | 关系比较 | 左到右 |
| 7 | `==`、`!=` | 等于、不等于 | 左到右 |
| 8 | `&` | 按位与 | 左到右 |
| 9 | `^` | 按位异或 | 左到右 |
| 10 | `\|` | 按位或 | 左到右 |
| 11 | `&&` | 逻辑与 | 左到右 |
| 12 | `\|\|` | 逻辑或 | 左到右 |
| 13 | `?:` | 条件运算符 | 右到左 |
| 14 | `=`、`+=`、`-=`、`*=`、`/=`、`%=`、`<<=`、`>>=`、`&=`、`^=`、`\|=` | 赋值运算符 | 右到左 |
| 15 | `,` | 逗号运算符 | 左到右 |

优先级数字越小，运算越先进行。$kp$, section = '' where id = 32143;
update t_knowledge_point set title = $kp$除法与强制类型转换$kp$, content = $kp$除法中，两个操作数都是整数时，结果只能为整数；若接收结果的变量是 int，小数部分会被舍去。

```c
int a = (int)(10 / 3);   // 10/3 先整除得 3，a 为 3
float f = 10.0 / 3;      // 10.0 是浮点数，结果为 3.333…
float g = (float)10 / 3; // 先把 10 转换为 float，结果同为 3.333…
```

若写成 `10 / 3`，先进行整除得到 3，再把 3 隐式转换为 float 赋给变量，结果为 3.0。$kp$, section = '' where id = 32144;
update t_knowledge_point set title = $kp$表达式的构成$kp$, content = $kp$表达式由运算对象和运算符构成。

例如赋值运算符和运算对象构成赋值表达式：

```c
j = 1;
```

表达式的值就是该表达式运算后的结果。$kp$, section = '' where id = 32145;
update t_knowledge_point set title = $kp$表达式的运算对象$kp$, content = $kp$运算对象可以是表达式、常量或变量。例如：

```text
表达式：a+b、a+a、a>b
常量：100L、3.1415F
变量：a、b、c、i、j
```$kp$, section = '' where id = 32147;
update t_knowledge_point set title = $kp$C 语言表达式的类型$kp$, content = $kp$C 语言常见的表达式类型：

- 算术表达式
- 关系表达式
- 逻辑表达式
- 条件表达式
- 赋值表达式
- 逗号表达式
- 其他表达式，如按位运算表达式、复合表达式等$kp$, section = '' where id = 32148;
update t_knowledge_point set title = $kp$整数除法$kp$, content = $kp$除法运算符 `/` 两边都是整型时，运算结果也是整型，小数部分被舍去。

```c
5 / 2     // 2
-5 / 2    // -2
5 / -2    // -2
```

C99 规定整数除法向零截断，因此负数除法同样舍去小数部分，而不是向下取整。$kp$, section = '' where id = 32149;
update t_knowledge_point set title = $kp$表达式求值的注意事项$kp$, content = $kp$表达式求值时要注意运算符的优先级和类型转换，包括隐式转换和显式转换。

关系表达式是常见考点，需要掌握关系运算符的优先级及关系表达式的值。$kp$, section = '' where id = 32150;
update t_knowledge_point set title = $kp$关系表达式的应用$kp$, content = $kp$关系表达式由运算对象和关系运算符连接而成，常用于条件判断和循环控制。

```c
if (a < 10) {
    /* ... */
}

for (i = 0; i < n; i++) {
    /* ... */
}

x = a > 0 ? a + 1 : a - 1;
```$kp$, section = '' where id = 32151;
update t_knowledge_point set title = $kp$条件表达式的嵌套$kp$, content = $kp$条件表达式可以嵌套使用，但不建议嵌套层数太多，以免影响阅读。

```c
a = b > 0 ? (c > 0 ? a + 2 : a + 1) : a - 1;
```

条件运算符的结合方向为从右到左，因此 `b > 0 ? a : c > 0 ? c : d` 等价于 `b > 0 ? a : (c > 0 ? c : d)`。$kp$, section = '' where id = 32152;
update t_knowledge_point set title = $kp$赋值类运算符$kp$, content = $kp$赋值类运算符包括：

`+=`、`-=`、`*=`、`/=`、`%=`、`<<=`、`>>=`、`&=`、`^=`、`|=`

它们都是复合赋值运算符，把一个运算与赋值合并在一起。$kp$, section = '' where id = 32154;
update t_knowledge_point set title = $kp$赋值表达式的一般形式$kp$, content = $kp$赋值表达式的格式为：

```text
变量名 = 表达式
```

赋值运算符的左边必须是一个变量，赋值运算把右边表达式的值赋给左边变量。整个赋值表达式的值就是赋值后左边变量的值。$kp$, section = '' where id = 32155;
update t_knowledge_point set title = $kp$逗号表达式的求值顺序$kp$, content = $kp$逗号表达式从左向右依次计算各表达式的值，最后一个表达式的值就是整个逗号表达式的值。

```c
a = (1, 2, 3);   // a 的值为 3
```$kp$, section = '' where id = 32157;
update t_knowledge_point set title = $kp$自增自减的等价写法$kp$, content = $kp$```c
++变量    // 等价于 变量 = 变量 + 1
--变量    // 等价于 变量 = 变量 - 1
```

注意：`变量++` 作为表达式时，表达式的值是变量自增前的值；上面这种等价写法只描述了变量最终加 1 的效果。$kp$, section = '' where id = 32159;
update t_knowledge_point set title = $kp$复合表达式的求值$kp$, content = $kp$计算复合表达式的值时，要结合运算符的优先级、结合性以及各运算符的运算规则。

尤其要注意逻辑与 `&&` 和逻辑或 `||` 的短路现象：左边的结果已经能确定整个表达式的值时，右边不再计算。$kp$, section = '' where id = 32160;
update t_knowledge_point set title = $kp$数学表达式的 C 语言写法$kp$, content = $kp$把数学表达式翻译成 C 语言表达式时，要注意括号的使用和运算符的优先级。

| 数学表达式 | C 语言表达式 |
| --- | --- |
| a×b 或 a·b | `a * b` |
| a² | `a * a` |
| a³ | `a * a * a` 或 `pow(a, 3)` |
| a÷b | `a / b` |
| a+b | `a + b` |
| a-b | `a - b` |
| √(a²+b²) | `sqrt(a*a + b*b)` |
| (-b+√(b²-4ac))/(2a) | `(-b + sqrt(b*b - 4*a*c)) / (2*a)` |
| (-b-√(b²-4ac))/(2a) | `(-b - sqrt(b*b - 4*a*c)) / (2*a)` |
| (a+b)h/2 | `(a + b) * h / 2` |
| a>b | `a > b` |
| a≤b | `a <= b` |
| a≥b | `a >= b` |
| 'a'≤ch≤'z' | `ch >= 'a' && ch <= 'z'` |

数学中的乘号不能省略，除法、分子分母和整个分母都要用括号括清楚。$kp$, section = '' where id = 32161;
update t_knowledge_point set title = $kp$数据库字段数据类型的选择$kp$, content = $kp$设计数据库表时，字段的数据类型应根据实际存储的内容选择。

例如，如果列中存储的是数字（如订单中的物品数量），相应的数据类型应为数值类型；如果列存储的是日期、文本、注释、金额等，则应选择恰当的数据类型来规定。$kp$, section = '' where id = 32218;
update t_knowledge_point set title = $kp$C 语言表达式类型与求值规则$kp$, content = $kp$C 语言表达式类型包括：赋值表达式、算术表达式、关系表达式、逻辑表达式、条件表达式和逗号表达式。

学习时要掌握各类表达式的构成和求值规则。$kp$, section = '' where id = 32223;
update t_knowledge_point set title = $kp$自增自减的前缀与后缀$kp$, content = $kp$自增自减运算分为前缀运算和后缀运算，分别使用 `++` 和 `--` 运算符。

- 前缀：`++i`、`--i`，先改变变量的值，表达式的值是新值。
- 后缀：`i++`、`i--`，先取变量的原值作为表达式的值，再改变变量。

两种写法的运算符相同，但表达式值和变量修改的先后不同。$kp$, section = '' where id = 32224;
update t_knowledge_point set title = $kp$赋值运算符$kp$, content = $kp$赋值类运算符包括：

`=`、`+=`、`-=`、`*=`、`/=`、`%=`、`<<=`、`>>=`、`&=`、`^=`、`|=`

其中 `=` 是基本赋值运算符，其余是复合赋值运算符。$kp$, section = '' where id = 32226;
update t_knowledge_point set title = $kp$SQL 中 BETWEEN AND 的用法$kp$, content = $kp$SQL 的 `WHERE` 子句可以使用 `BETWEEN ... AND ...` 选取介于两个值之间的数据范围。

这些值可以是数值、文本或者日期。`BETWEEN a AND b` 等价于 `>= a AND <= b`，包含边界值。

```sql
SELECT *
FROM 成绩表
WHERE 分数 BETWEEN 60 AND 100;
```$kp$, section = '' where id = 32232;
update t_knowledge_point set title = $kp$标识符的定义与构成$kp$, content = $kp$标识符是用来标记常量、变量、函数及文件名字的字符序列。

构成规则：由字母、数字和下划线组成，第一个字符必须是字母或下划线，不能是数字。$kp$, section = '' where id = 32234;
update t_knowledge_point set title = $kp$C 语言关键字$kp$, content = $kp$关键字也称“保留字”，是 C 语言中具有特定含义、专门用作语言特定成分的一类标识符。

ANSI 推荐的 C 语言关键字有 32 个，例如 `int`、`char`、`float`、`else`、`while` 等。注意 `main` 是函数名，`define` 是预处理命令，它们都不是关键字。

所有关键字都有固定含义，不能用作其他用途，并且必须小写。例如 `else` 是关键字，`ELSE` 只是用户定义的标识符。$kp$, section = '' where id = 32235;
update t_knowledge_point set title = $kp$数值型数据的混合运算$kp$, content = $kp$整型（包括 `int`、`short`、`long`）和浮点型（包括 `float`、`double`）可以混合运算。

混合运算时，低精度类型会向高精度类型转换，例如 `int` 与 `float` 运算时先转换为 `float`，`float` 与 `double` 运算时先转换为 `double`。$kp$, section = '' where id = 32238;
update t_knowledge_point set title = $kp$基本算术运算符$kp$, content = $kp$基本的算术运算符：

- `+`：加法运算符，或正值运算符，如 `3 + 5`、`+3`
- `-`：减法运算符，或负值运算符，如 `5 - 2`、`-3`
- `*`：乘法运算符，如 `3 * 5`、`2 * x`、`3 * (a + b)`
- `/`：除法运算符，如 `5 / 3`、`(x + y) / (a + b)`
- `%`：模运算符，也称求余运算符，两侧均应为整型数据，如 `7 % 4` 的值为 3$kp$, section = '' where id = 32239;
update t_knowledge_point set title = $kp$逗号运算符与逗号表达式$kp$, content = $kp$逗号表达式的一般形式可以扩展为：

```text
表达式1, 表达式2, 表达式3, ..., 表达式n
```

它的值为表达式 n 的值。逗号运算符是所有运算符中级别最低的。

```c
#include <stdio.h>

int main(void) {
    int a = 1;
    printf("结果为:%d\n", (a = 3 * a, 3 * a));  // 输出 9
    return 0;
}
```

括号内先执行 `a = 3 * a`，a 变为 3；再计算 `3 * a` 得 9，整个逗号表达式的值为 9。

若写成 `printf("结果为:%d\n", a = 3 * a, 3 * a);`，逗号是函数参数的分隔符而不是逗号运算符，格式串只有一个 `%d`，输出的是第一个参数 `a = 3 * a` 的值 3。$kp$, section = '' where id = 32240;
update t_knowledge_point set title = $kp$逻辑运算符与流程控制$kp$, content = $kp$## 逻辑运算符与优先级

- `&&`：逻辑与，相当于其他语言中的 AND
- `||`：逻辑或，相当于其他语言中的 OR
- `!`：逻辑非，相当于其他语言中的 NOT

`a && b`：a、b 都为真时结果为真；`a || b`：a、b 之一为真时结果为真；`!a`：a 为真时结果为假。

优先级：`!` 高于算术运算符；`&&` 和 `||` 低于关系运算符。整体顺序为：`!` → 算术 → 关系 → `&&` → `||` → 赋值。

## 逻辑表达式

用逻辑运算符将关系表达式或逻辑量连接起来的式子就是逻辑表达式，其值为“真”或“假”。C 语言用 1 表示真、0 表示假；判断一个量是否为真时，0 为假，非 0 为真。

## if 语句

三种形式：

```c
/* 1. 条件执行 */
if (a > 0)
    printf("a is positive.\n");

/* 2. 分支选择 */
if (a > 0)
    printf("A is positive.\n");
else
    printf("A is not positive.\n");

/* 3. else if 阶梯形式 */
if (score >= 90)
    printf("优秀\n");
else if (score >= 80)
    printf("良好\n");
else if (score >= 70)
    printf("中\n");
else if (score >= 60)
    printf("及格\n");
else
    printf("不及格\n");
```

`else` 总是与它前面最近的、尚未配对的 `if` 相匹配。

## switch 语句

```c
switch (e) {
    case c1:
        语句1;
        break;
    case c2:
        语句2;
        break;
    default:
        语句n;
}
```

执行时先计算表达式 e 的值，与某个 case 后的常量表达式相等时，从该 case 开始执行，直到遇到 `break` 或 switch 的右大括号；若都不匹配，执行 default 分支。各 case 常量表达式的值必须唯一，多个 case 可以共用一组执行语句。

## 循环语句

C 语言提供 `while`、`do...while`、`for` 三种循环。

```c
while (表达式)        // 先判断，后执行
    语句;

do                    // 先执行一次，再判断
    语句;
while (表达式);

for (初始化; 条件; 增量)
    语句;
```

循环可以嵌套：一个循环体内包含另一个完整的循环结构称为循环嵌套。嵌套时内层循环变化快、外层循环变化慢，各层循环控制变量不能相同。三种循环可以互相嵌套。$kp$, section = '' where id = 32244;
update t_knowledge_point set title = $kp$Excel 公式与常见错误值$kp$, content = $kp$公式由运算符（算术、比较、文本、引用）和运算数组成，`&` 用于连接文本，例如 `办公&自动化` 得到 `办公自动化`。

常见错误值：

| 错误值 | 含义 |
| --- | --- |
| `####` | 列宽不够，或使用了负的时间、日期 |
| `#NAME?` | 未识别公式中的文本 |
| `#NUM!` | 公式或函数中的数字有问题 |
| `#REF!` | 单元格引用无效 |
| `#DIV/0!` | 数字被零除 |
| `#VALUE!` | 使用的参数或操作数类型错误 |
| `#N/A` | 数值对函数或公式不可用 |
| `#NULL!` | 两个不相交区域的交叉点 |$kp$, section = '' where id = 32255;
update t_knowledge_point set title = $kp$C 语言的 32 个关键字$kp$, content = $kp$C 语言规定 32 个关键字不能作为标识符使用。

类型与声明相关：

`char`、`int`、`float`、`double`、`long`、`short`、`signed`、`unsigned`、`enum`、`extern`、`sizeof`、`struct`、`typedef`、`union`、`void`、`volatile`、`register`、`auto`、`static`、`const`

控制语句相关：

`if`、`else`、`for`、`do`、`while`、`goto`、`break`、`case`、`continue`、`default`、`return`、`switch`$kp$, section = '' where id = 32260;
update t_knowledge_point set title = $kp$常量的种类与转义字符$kp$, content = $kp$常量包括整型常量、实型常量、字符常量和字符串常量。

- 整型常量：整数，如 `1`、`-5`
- 实型常量：小数，如 `1.5`、`-3.12`
- 字符常量：用单引号括起来的一个字符，如 `'a'`、`'2'`、`'!'`；或以 `\` 开头的转义字符
- 字符串常量：用双引号括起来的字符序列，如 `"Hello, world"`、`"a"`

常见转义字符：

| 转义字符 | 功能 |
| --- | --- |
| `\n` | 换行 |
| `\t` | 跳格 |
| `\` | 反斜杠 |
| `\'` | 单引号 |
| `\ddd` | 1～3 位八进制数表示的字符 |
| `\xhh` | 1～2 位十六进制数表示的字符 |

字符常量在存储中占 1 个字节；字符串常量末尾有隐藏的 `'\0'` 作为结束标志，也占 1 个字节。例如 `'a'` 占 1 个字节，`"a"` 占 2 个字节。$kp$, section = '' where id = 32261;
update t_knowledge_point set title = $kp$变量的定义与赋值$kp$, content = $kp$```c
int a1;              // 定义
int x1, y1;          // 一次定义多个变量
a1 = 3;              // 赋值

int a2 = 3;          // 定义时初始化
int x2 = 5, y2 = 3;  // 多个变量同时初始化

int y3 = x3 = 3;     // 错误：x3 尚未定义
```

变量必须先定义后使用；定义时可以初始化，也可以先定义再赋值。连续赋值 `x3 = 3` 本身合法，但不能在定义 `y3` 的同时使用尚未定义的 `x3`。$kp$, section = '' where id = 32262;
update t_knowledge_point set title = $kp$算术运算符$kp$, content = $kp$C 语言的算术运算符包括 `+`、`-`、`*`、`/`、`%`。

`++` 和 `--` 是自增、自减运算符，不属于基本的算术运算符。$kp$, section = '' where id = 32263;
update t_knowledge_point set title = $kp$复合赋值与运算符优先级$kp$, content = $kp$复合赋值运算符包括 `+=`、`-=`、`*=`、`/=`、`%=`。

```c
a += b;    // 等价于 a = a + b;
a *= b;    // 等价于 a = a * b;
```

`%` 是求余数运算，例如 `18 % 4 = 2`。

注意：`==` 表示相等，`=` 表示赋值，两者含义不同。

算术运算符的优先级高于关系运算符，关系运算符高于逻辑运算符。$kp$, section = '' where id = 32264;
update t_knowledge_point set title = $kp$printf 格式化输出$kp$, content = $kp$把变量的值输出到屏幕上：

```c
#include <stdio.h>

int main(void) {
    int a = 65;
    char b = 'a';
    float c = 12.1562;
    printf("a = %d, b = %c, c = %.1f\n", a, b, c);
    return 0;
}
```

运行结果：

```text
a = 65, b = a, c = 12.2
```

常用的格式说明：

| 格式符 | 含义 |
| --- | --- |
| `%d` | 输出 int 类型变量的值 |
| `%f` | 输出 float/double 类型变量的值 |
| `%c` | 输出 char 类型变量的值 |
| `%lf` | 在 scanf 中读取 double；printf 中输出 double 也可用 `%f` |

`%md` 表示输出至少占 m 位整数；`%.nf` 表示输出小数点后 n 位。$kp$, section = '' where id = 32266;
update t_knowledge_point set title = $kp$ASCII 码顺序与 scanf 输入$kp$, content = $kp$在 ASCII 码表中，`A`～`Z`、`a`～`z`、`0`～`9` 的码值依次增加。

`scanf` 输入语句的用法：

```c
scanf("键盘输入的内容", 变量地址);
```

普通变量要用 `&` 加变量名取得地址，例如：

```c
int a;
scanf("%d", &a);
```

数组名本身代表首地址，读取字符串时不需要再加 `&`。$kp$, section = '' where id = 32267;
update t_knowledge_point set title = $kp$常量与变量$kp$, content = $kp$## 常量

常量是在程序运行过程中其值不能被改变的量。

- 整型常量：如 `1000`、`12345`、`0`、`-345`
- 实型常量：
  - 十进制小数形式：如 `0.34`、`-56.79`、`0.0`
  - 指数形式：如 `12.34e3`，代表 12.34×10³
- 字符常量：如 `'?'`，以及转义字符 `'\n'`
- 字符串常量：如 `"boy"`
- 符号常量：如 `#define PI 3.1416`

## 变量

变量是在程序运行期间其值可以改变的量。

- 变量必须先定义，后使用。
- 定义变量时要指定变量的名字和类型。
- 变量名和变量值是两个不同的概念。
- 变量名实际上是用一个名字代表一个存储地址。
- 从变量中取值，实际上是通过变量名找到相应的内存地址，从该存储单元中读取数据。$kp$, section = '' where id = 32273;
update t_knowledge_point set title = $kp$赋值运算符的作用$kp$, content = $kp$`=` 是赋值运算符，作用是把一个数据赋给一个变量，也可以把一个表达式的值赋给一个变量。

```c
a = 3;          // 把 3 赋给 a
b = a + 1;      // 把表达式 a+1 的值赋给 b
```

赋值运算符的左边必须是变量，不能是常量或表达式。$kp$, section = '' where id = 32276;
update t_knowledge_point set title = $kp$复合赋值运算符$kp$, content = $kp$在赋值符 `=` 之前加上其他运算符，可以构成复合赋值运算符。

```c
a += 3;    // 等价于 a = a + 3;
```

常见的复合赋值运算符还有 `-=`、`*=`、`/=`、`%=` 等。$kp$, section = '' where id = 32277;
update t_knowledge_point set title = $kp$赋值表达式的构成与求解$kp$, content = $kp$赋值表达式的一般形式为：

```text
变量 赋值运算符 表达式
```

对赋值表达式求解的过程：

1. 求赋值运算符右侧表达式的值。
2. 把该值赋给赋值运算符左侧的变量。

整个赋值表达式的值就是赋值后左侧变量的值。$kp$, section = '' where id = 32278;
update t_knowledge_point set title = $kp$赋值表达式的求值与等价形式$kp$, content = $kp$赋值表达式 `a = 3 * 5` 的值为 15，求解后变量 a 的值和表达式的值都是 15。

```c
a = (b = 5);   // 与 a = b = 5 等价
```

`a = b` 和 `b = a` 含义不同：前者把 b 的值赋给 a，后者把 a 的值赋给 b。$kp$, section = '' where id = 32279;
update t_knowledge_point set title = $kp$scanf 函数的一般形式$kp$, content = $kp$`scanf` 函数的一般形式为：

```c
scanf(格式控制, 地址表列);
```

格式控制的含义与 `printf` 函数相同，地址表列给出要读入数据的变量地址。普通变量需要用 `&` 取地址：

```c
int a, b;
scanf("%d%d", &a, &b);
```$kp$, section = '' where id = 32296;
update t_knowledge_point set title = $kp$关系运算符与关系表达式$kp$, content = $kp$关系运算符用于对两个数值进行比较。C 语言提供 6 种关系运算符：

- `<`（小于）、`<=`（小于或等于）、`>`（大于）、`>=`（大于或等于），这四个优先级相同且较高。
- `==`（等于）、`!=`（不等于），这两个优先级相同且较低。

优先级关系：算术运算符高于关系运算符，关系运算符高于赋值运算符。

例如：

| 表达式 | 等效于 |
| --- | --- |
| `c > a + b` | `c > (a + b)` |
| `a > b == c` | `(a > b) == c` |
| `a == b < c` | `a == (b < c)` |
| `a = b > c` | `a = (b > c)` |

关系表达式用关系运算符把两个数值或数值表达式连接起来，其值为逻辑值“真”或“假”。C 语言中以 1 代表真，以 0 代表假。$kp$, section = '' where id = 32304;
update t_knowledge_point set title = $kp$逻辑运算符与逻辑型变量$kp$, content = $kp$C 语言有 3 种逻辑运算符：

- `&&`：逻辑与，双目运算符
- `||`：逻辑或，双目运算符
- `!`：逻辑非，单目运算符

用逻辑运算符将关系表达式或其他逻辑量连接起来的式子称为逻辑表达式。

真值表：

| a | b | !a | !b | a&&b | a\|\|b |
| --- | --- | --- | --- | --- | --- |
| 真 | 真 | 假 | 假 | 真 | 真 |
| 真 | 假 | 假 | 真 | 假 | 真 |
| 假 | 真 | 真 | 假 | 假 | 真 |
| 假 | 假 | 真 | 真 | 假 | 假 |

逻辑运算符的优先次序为：`!` 最高，其次是 `&&`，最后是 `||`。与其他运算符相比：`!` 高于算术运算符，算术运算符高于关系运算符，关系运算符高于 `&&` 和 `||`，`&&` 和 `||` 高于赋值运算符。

编译系统表示逻辑运算结果时，以 1 代表真、0 代表假；判断一个量是否为真时，以 0 代表假、非 0 代表真。

C99 增加了逻辑型变量 `_Bool`，包含 `<stdbool.h>` 后可使用 `bool`，用来存放关系运算和逻辑运算的结果。$kp$, section = '' where id = 32305;
update t_knowledge_point set title = $kp$逻辑表达式与条件运算符$kp$, content = $kp$逻辑表达式的值为“真”或“假”，C 语言用 1 表示真、0 表示假；判断时 0 为假，非 0 为真。

例如，`a` 和 `b` 的值分别为 4 和 5：

```c
!a || b        // !4 为 0，0 || 5 为 1
4 && 0 || 2    // 4&&0 为 0，0||2 为 1
```

判断闰年：能被 4 整除但不能被 100 整除，或者能被 400 整除。

```c
(year % 4 == 0 && year % 100 != 0) || year % 400 == 0
```

表达式的值为 1 表示闰年，为 0 表示非闰年。

条件运算符 `?:` 可以把简单的 if-else 赋值写成条件表达式：

```c
max = (a > b) ? a : b;
```

执行时先求表达式 1，若为非 0（真），求表达式 2 并以它的值作为整个表达式的值；否则求表达式 3 并以它的值作为结果。条件运算符优先于赋值运算符，结合方向为从右到左。

例：输入一个字符，若是大写字母则转换为小写字母，否则不变。

```c
#include <stdio.h>

int main(void) {
    char ch;
    scanf("%c", &ch);
    ch = (ch >= 'A' && ch <= 'Z') ? ch + 32 : ch;
    printf("%c\n", ch);
    return 0;
}
```$kp$, section = '' where id = 32306;
update t_knowledge_point set title = $kp$整型变量的定义与后缀$kp$, content = $kp$```c
unsigned short count = 100U;
int sum = 9999;
long index = 999999L;
unsigned long u_index;
```

整数常量后的后缀表示类型：`U` 表示 unsigned，`L` 表示 long。例如 `100U` 是无符号整型常量，`999999L` 是长整型常量。$kp$, section = '' where id = 32397;
update t_knowledge_point set title = $kp$SQL 联合查询 UNION$kp$, content = $kp$使用 `UNION` 关键字可以把多个 `SELECT` 语句的结果组合到一个结果集中，这种查询方式称为并（UNION）运算或联合查询。

合并时，多个 `SELECT` 子句中对应的字段数和数据类型必须相同。

```sql
SELECT 姓名, 班级 FROM 一班
UNION
SELECT 姓名, 班级 FROM 二班;
```$kp$, section = '' where id = 32433;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30260,30272,30273,30427,30435,30438,30439,30444,30445,30470,30474,30480,30486,30488,30489,30490,30492,30497,30498,30500,30501,30502,30505,30528,30547,30578,30579,30587,30595,30598,30600,30601,30602,30603,30607,30613,30620,30623,30625,30626,30629,30631,30633,30645,30649,30854,30944,31304,31309,31321,31339,31344,31570,31633,31634,31651,31652,31653,31668,31669,31670,31671,31672,31731,31748,31749,31750,31751,31752,31789,31799,31800,31801,31802,31803,31804,31805,31806,31807,31808,31809,31810,31811,31818,31862,31868,31873,31919,31925,31953,32071,32072,32073,32074,32075,32077,32079,32083,32084,32085,32086,32087,32088,32089,32090,32091,32092,32110,32115,32117,32118,32121,32122,32123,32124,32125,32126,32127,32129,32131,32132,32133,32134,32135,32136,32137,32139,32140,32141,32142,32143,32144,32145,32147,32148,32149,32150,32151,32152,32154,32155,32157,32159,32160,32161,32218,32223,32224,32226,32232,32234,32235,32238,32239,32240,32244,32255,32260,32261,32262,32263,32264,32266,32267,32273,32276,32277,32278,32279,32296,32304,32305,32306,32397,32433) and not deleted) <> 175 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
