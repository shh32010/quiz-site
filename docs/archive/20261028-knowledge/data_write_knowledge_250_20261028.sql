-- 知识点 250 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_250
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_250 as
select * from t_knowledge_point where id in (30425,30511,30519,30611,30665,31373,31376,31377,31378,31379,31698,31759,31760,31812,31907,31927,32130,32153,32170,32171,32172,32173,32175,32176,32177,32178,32179,32180,32181,32194,32227,32269,32298,32299,32300,32301,32303,32307);

update t_knowledge_point set title = $kp$按利润分段计算奖金$kp$, content = $kp$利润在 60 万元到 100 万元之间时，高于 60 万元的部分可提成 1.5%；利润高于 100 万元时，超过 100 万元的部分按 1% 提成。从键盘输入当月利润 I，求应发放的奖金总数。$kp$, section = '' where id = 30425;
update t_knowledge_point set title = $kp$条件运算符的用法$kp$, content = $kp$条件运算符的语法形式为：

```c
条件 ? 值1 : 值2
```

条件为真时结果为「值1」（左值），条件为假时结果为「值2」（右值）。条件运算符的优先级仅高于赋值运算符和逗号运算符，结合性为自右向左。

例如：

```c
int x = -9, y;
y = x > 0 ? x : -x;   // y 的值为 9
```$kp$, section = '' where id = 30511;
update t_knowledge_point set title = $kp$成绩判定输出与读入循环题解析$kp$, content = $kp$成绩为 90 时，90 大于 60，输出 passed；90 大于 80，输出 nice，因此结果是 passed、nice。

第 33 题答案：4。

解析：第一次读入 9，判断 9 == -1 为假；第二次读入 12，判断 12 == -1 为假；第三次读入 3，判断 3 == -1 为假；第四次读入 -1，判断 -1 == -1 为真，执行 break 退出循环。

第 34 题答案：less。$kp$, section = '' where id = 30519;
update t_knowledge_point set title = $kp$程序填空：交换两个数的位置$kp$, content = $kp$三、程序填空（共 2 题，共计 24 分）

第 1 题（12.0 分，题号 591）：如果 a > b，就将两个数的位置调换；否则保持不变。

```c
main()
```$kp$, section = '' where id = 30611;
update t_knowledge_point set title = $kp$用 for 循环求 n 门课程的平均分$kp$, content = $kp$【程序设计】

题目：请用 for 循环编写函数 fun，函数的功能是计算 n 门课程的平均值，计算结果作为函数值返回。例如，若有 5 门课程的成绩是 92、76、69、58、88，则函数的值为 76.600000。

注意：部分源程序给出如下。请勿改动主函数 main 和其他函数中的任何内容，仅在函数 fun 的花括号中填入所编写的若干语句。$kp$, section = '' where id = 30665;
update t_knowledge_point set title = $kp$switch 语句（开关语句）概述$kp$, content = $kp$## 开关语句

- switch 语句是一种多路判定语句（多分支选择），它测试表达式的值是否与一些常量整数值中的某个值匹配，并执行相应的分支动作。
- 配合使用的关键字：case、break、default。
- switch 是另一种选择结构语句，用来代替简单的、拥有多个分支的 if-else 语句。$kp$, section = '' where id = 31373;
update t_knowledge_point set title = $kp$case 与 default 的执行规则$kp$, content = $kp$若所有 case 中的常量表达式的值都没有与表达式的值匹配，就执行 default（位置无所谓）后面的语句，具体执行到哪里取决于是否带 break。

① default 后面带 break：

```c
switch (99)
{
    default: printf("default\n"); break;
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
}
```

② default 后面不带 break（会继续执行后面的 case）：

```c
switch (99)
{
    default: printf("default\n");
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
}
```

匹配到某个 case 之后发现没有 break 时，各种情况总结为：遇到最近的 break 就退出。

① 后面的 case 带 break，执行到该 break 时退出当前 switch：

```c
switch (11)
{
    case 11: printf("11\n");
    case 13: printf("13\n"); break;
    case 89: printf("89\n");
    case 90: printf("90\n");
    default: printf("default\n"); break;
}
```

② 之后遇到 default（带 break）：

```c
switch (11)
{
    case 11: printf("11\n");
    default: printf("default\n"); break;
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
}
```

③ 之后遇到 default（不带 break）：

```c
switch (11)
{
    case 11: printf("11\n");
    default: printf("default\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
}
```

④ 找不到其他带 break 的 case，且 default 位于中间（带 break）：

```c
switch (11)
{
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    default: printf("default\n"); break;
    case 90: printf("90\n");
}
```$kp$, section = '' where id = 31376;
update t_knowledge_point set title = $kp$default 不带 break 时继续执行后续分支$kp$, content = $kp$default 不带 break，且后面还有 case 和可执行语句时，default 分支执行完后会继续向下执行后续语句。

⑤ 找不到其他带 break 的 case，且 default 位于中间（不带 break）：

```c
switch (11)
{
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    default: printf("default\n");
    case 90: printf("90\n");
}
```$kp$, section = '' where id = 31377;
update t_knowledge_point set title = $kp$default 位于末尾时 break 可有可无$kp$, content = $kp$⑥ 找不到其他带 break 的 case，且 default 位于末尾时，带不带 break 效果都一样：

```c
switch (11)
{
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
    default: printf("default\n"); break;
}
```

default 已是最后一个分支，执行完自然结束 switch，因此 break 不影响结果。$kp$, section = '' where id = 31378;
update t_knowledge_point set title = $kp$switch 与 case 的常考限制$kp$, content = $kp$（4）考查点：switch 后的表达式与 case 后的常量表达式。

① switch 后小括号里面的表达式不能为实型（字符串也不行），只能是整型（字符型也是特殊的整数，可用 0～127 的 ASCII 码表示）等；case 后的表达式不能有变量。
② 要会判断 switch 表达式与 case 常量表达式是否正确。
③ 口诀：switch 后不能为实（实数），case 后不能为变（变量）。$kp$, section = '' where id = 31379;
update t_knowledge_point set title = $kp$表格软件中的 IF、COUNT 与 COUNTIF 函数$kp$, content = $kp$IF 函数：条件选择函数，语法为 `IF(条件, T, F)`，条件成立时返回 T，否则返回 F。

COUNT()：计算数字单元格的个数。

COUNTIF()：按条件计数。$kp$, section = '' where id = 31698;
update t_knowledge_point set title = $kp$else 语句必须与 if 配对使用$kp$, content = $kp$else 语句不能单独使用，总是和最近的 if 语句配对。$kp$, section = '' where id = 31759;
update t_knowledge_point set title = $kp$悬空 else 的配对与 break 语句$kp$, content = $kp$```c
if (!x) y++;
else if (x == 0)
    if (x) y += 2;
    else y += 3;
```

上面的代码中 else 分支没有加花括号。编译器在处理 if 语句时，即使后面还有语句，也会检查有没有 else：没有 else 就认为整个 if 语句结束；有 else 就把 else 语句也作为该 if 语句的一部分。因此 `else y += 3;` 与最近的、尚未配对的 `if (x)` 配对，而不是与外层的 `if (!x) ... else if` 配对。

## break 语句

- 功能：
  - 跳出整个 switch 语句；
  - 跳出循环体，防止死循环，结束循环。如果是多层循环，break 的作用是跳出本层循环。
- break 语句只能出现在 switch、while、do-while、for 循环中，不能出现在其他地方。
- 作用范围：所在循环体从属的最内层循环，而不是外层的某个循环。$kp$, section = '' where id = 31760;
update t_knowledge_point set title = $kp$选择结构的作用$kp$, content = $kp$当对数据进行处理时，如果做出的选择不同、需要执行不同的操作，就使用选择结构来实现不同的处理。$kp$, section = '' where id = 31812;
update t_knowledge_point set title = $kp$表格 IF 函数的嵌套用法$kp$, content = $kp$逻辑函数 IF 要能看懂。例如：

```text
=IF(A2=100,"good","bad")
=IF(A2>89,"A",IF(A2>79,"B",IF(A2>69,"C","D")))
```$kp$, section = '' where id = 31907;
update t_knowledge_point set title = $kp$if 嵌套中 else 的就近配对$kp$, content = $kp$if 嵌套时注意 if 与 else 就近配对：在多重嵌套中，else 总是和在它之前出现、尚未匹配且离它最近的 if 相匹配。

语句块只有一条语句时可以不写花括号；多条语句必须用花括号括起来，否则只有就近的一条语句会被当作 if 或 else 的语句块。$kp$, section = '' where id = 31927;
update t_knowledge_point set title = $kp$条件表达式的取值规则$kp$, content = $kp$若表达式 1 的值为真，则整个表达式的值为表达式 2 的值；否则整个表达式的值为表达式 3 的值。$kp$, section = '' where id = 32130;
update t_knowledge_point set title = $kp$条件表达式与 if-else 的等价写法$kp$, content = $kp$`表达式 1 ? 表达式 2 : 表达式 3;` 等价于：

```c
if (表达式 1) { 表达式 2; } else { 表达式 3; }
```$kp$, section = '' where id = 32153;
update t_knowledge_point set title = $kp$选择结构的分类与 if 语句的条件$kp$, content = $kp$选择结构分为 if 和 switch 两种。

## if 语句

注：if 后面圆括号中的表达式，可以是任意合法的 C 语言表达式（如逻辑表达式、关系表达式、算术表达式、赋值表达式等），也可以是任意类型的数据（如整型、浮点型即实型、字符型、指针型等）。$kp$, section = '' where id = 32170;
update t_knowledge_point set title = $kp$switch 语句的多路判定$kp$, content = $kp$switch 语句是一种多路判定语句（多分支选择），它测试表达式是否与一些常量整数值中的某个值匹配，并执行相应的分支动作。$kp$, section = '' where id = 32171;
update t_knowledge_point set title = $kp$switch 语句替代多分支 if-else$kp$, content = $kp$switch 是另外一种选择结构的语句，用来代替简单的、拥有多个分支的 if-else 语句。$kp$, section = '' where id = 32172;
update t_knowledge_point set title = $kp$switch 匹配 case 常量后执行分支$kp$, content = $kp$当 switch 后面括号内的表达式的值与某一个 case 后面的常量表达式的值相等时，就执行该 case 后面的语句。

```c
char ch = 90;
switch (ch)
{
    default: printf("default\n"); break;
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n"); break;
}
```

ch 的值为 90，与 case 90 匹配，因此输出 90。$kp$, section = '' where id = 32173;
update t_knowledge_point set title = $kp$匹配 case 后没有 break 的各种情况$kp$, content = $kp$当匹配到某个 case 之后，发现没有 break 时，各种情况总结为：遇到最近的 break 就退出。

① 找到其他 case 有 break，执行到该 break 时退出当前 switch：

```c
switch (11)
{
    case 11: printf("11\n");
    case 13: printf("13\n"); break;
    case 89: printf("89\n");
    case 90: printf("90\n");
    default: printf("default\n"); break;
}
```

② 之后遇到 default 语句（带 break）：

```c
switch (11)
{
    case 11: printf("11\n");
    default: printf("default\n"); break;
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
}
```

③ 之后遇到 default 语句（不带 break）：

```c
switch (11)
{
    case 11: printf("11\n");
    default: printf("default\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
}
```

④ 找不到其他 case 有 break，且 default 在中间（带 break）：

```c
switch (11)
{
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    default: printf("default\n"); break;
    case 90: printf("90\n");
}
```

⑤ 找不到其他 case 有 break，且 default 在中间（不带 break）：

```c
switch (11)
{
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    default: printf("default\n");
    case 90: printf("90\n");
}
```

⑥ 找不到其他 case 有 break，且 default 在末尾时，带与不带 break 都一样：

```c
switch (11)
{
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
    default: printf("default\n"); break;
}
```$kp$, section = '' where id = 32175;
update t_knowledge_point set title = $kp$switch 表达式与 case 常量的限制$kp$, content = $kp$考查点：switch 后的表达式与 case 后的常量表达式。

① switch 后小括号里面的表达式不能为实型（字符串也不行），只能是整型（字符型也是特殊的整数，可用 0～127 的 ASCII 码表示）等；case 后的表达式不能有变量。
② 要会判断 switch 表达式与 case 常量表达式是否正确。
③ 口诀：switch 后不能为实（实数），case 后不能为变（变量）。$kp$, section = '' where id = 32176;
update t_knowledge_point set title = $kp$if-else if 多分支形式（形式一）$kp$, content = $kp$```c
if (表达式1)
    语句块1
else if (表达式2)
    语句块2
else if (表达式3)
    语句块3
......
else if (表达式n)
    语句块n
else
    语句块n+1
```

程序依次判断各表达式，哪个为真就执行对应的语句块，其余分支不再执行；全部为假时执行最后的 else 语句。$kp$, section = '' where id = 32177;
update t_knowledge_point set title = $kp$if-else 的嵌套形式（形式二）$kp$, content = $kp$```c
if (表达式1)
    if (表达式2)
        语句块1
    else
        语句块2
else
    if (表达式3)
        语句块3
    else
        语句块4
```

示例：

```c
char ch = '8';
if (ch >= '0' && ch <= 'z') {
    if (ch >= '0' && ch <= '9') {
        printf("数字字符\n");
    } else {
        printf("字母或其他字符\n");
    }
} else {
    printf("未知字符!\n");
}
system("pause");
```

运行结果：数字字符$kp$, section = '' where id = 32178;
update t_knowledge_point set title = $kp$if 语句的嵌套与可读性建议$kp$, content = $kp$if 的各语句块都可以再嵌套，包括在 else if 分支中继续嵌套 if 语句；但一般不建议嵌套太深，否则会影响程序的可理解性、算法理解和维护。$kp$, section = '' where id = 32179;
update t_knowledge_point set title = $kp$switch 的嵌套使用建议$kp$, content = $kp$某个 case 中再进行嵌套 switch，不建议这样使用，一般建议在其中嵌入一些简单的 if 判断。$kp$, section = '' where id = 32180;
update t_knowledge_point set title = $kp$switch 中嵌套 if 与混合嵌套$kp$, content = $kp$注意 case 的 break、default 的位置以及是否带 break 等：

```c
switch (表达式1) {
    case 常量表达式1:
        if (表达式2)
            语句块1
        else
            语句块2
        break;
    case 常量表达式2:
        break;
    ......
    default:
        语句块;
        break;
}
```

if 和 switch 之间可以互相嵌套着使用。不建议嵌套得太乱、层次太深，建议根据算法实现情况来选择。$kp$, section = '' where id = 32181;
update t_knowledge_point set title = $kp$switch 中 break 的退出作用$kp$, content = $kp$在 switch 中：

```c
switch (表达式1) {
    case 常量表达式1: break;
    case 常量表达式2: break;
    default: break;
}
```

当执行遇到 `break;` 时，即退出当前 switch 语句。$kp$, section = '' where id = 32194;
update t_knowledge_point set title = $kp$所有 case 不匹配时执行 default$kp$, content = $kp$若所有 case 中的常量表达式的值都没有与表达式的值匹配，就执行 default（位置无所谓）后面的语句，具体执行范围取决于是否带 break。

① default 后面带 break：

```c
switch (99)
{
    default: printf("default\n"); break;
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
}
```

② default 后面不带 break（会执行后面的 case）：

```c
switch (99)
{
    default: printf("default\n");
    case 11: printf("11\n");
    case 13: printf("13\n");
    case 89: printf("89\n");
    case 90: printf("90\n");
}
```$kp$, section = '' where id = 32227;
update t_knowledge_point set title = $kp$if/else 多语句必须用花括号$kp$, content = $kp$当 if 或 else 后面有多个语句时，用 `{ }` 把这多个语句括起来组成复合语句；否则只有紧跟的第一条语句属于该分支。$kp$, section = '' where id = 32269;
update t_knowledge_point set title = $kp$选择结构与条件判断的意义$kp$, content = $kp$## 选择结构程序综合举例

## 4.1 选择结构和条件判断

在现实生活中，需要进行判断和选择的情况很多：

- 如果你在家，我去拜访你
- 如果考试不及格，要补考
- 如果遇到红灯，要停车等待
- 周末我们去郊游
- 70 岁以上的老年人，入公园免票

处理这些问题，关键在于进行条件判断。由于程序处理问题的需要，大多数程序中都会包含选择结构，需要在进行下一个操作之前先进行条件判断。$kp$, section = '' where id = 32298;
update t_knowledge_point set title = $kp$两种选择语句与一元二次方程求根$kp$, content = $kp$if 语句用于实现两个分支的选择结构，switch 语句用于实现多分支的选择结构。

## 例 4.1 求方程的根

由键盘输入 a、b、c，假设 a、b、c 的值任意，并不保证 b² - 4ac ≥ 0。需要在程序中进行判别：如果 b² - 4ac ≥ 0，就计算并输出方程的两个实根，否则输出「方程无实根」的信息。

关键代码：

```c
scanf("%lf%lf%lf", &a, &b, &c);
disc = b * b - 4 * a * c;

if (disc < 0)
    printf("has not real roots\n");
else
{
    p = -b / (2.0 * a);
    q = sqrt(disc) / (2.0 * a);
    x1 = p + q;
    x2 = p - q;
    printf("real roots:\nx1=%7.2f\nx2=%7.2f\n", x1, x2);
}
```

当 disc 的值为 -15 时输出 has not real roots；当 disc 的值为 8 时，q 约为 0.71，x1 约为 -0.29，x2 约为 -1.71。$kp$, section = '' where id = 32299;
update t_knowledge_point set title = $kp$if 语句的一般形式与排序示例$kp$, content = $kp$## 4.2.1 用 if 语句处理选择结构举例

### 例 4.2 两个数按代数值由小到大输出

输入两个实数，按代数值由小到大的顺序输出。

解题思路：只需要做一次比较，然后进行一次交换即可；关键是怎样实现两个变量值的互换。

```c
#include <stdio.h>
int main()
{
    float a, b, t;
    scanf("%f,%f", &a, &b);
    if (a > b)
    {
        t = a;
        a = b;
        b = t;
    }
    printf("%5.2f,%5.2f\n", a, b);
    return 0;
}
```

### 例 4.3 三个数按由小到大输出

输入 3 个数 a、b、c，要求按由小到大的顺序输出。可以先用伪代码写出算法：

- 若 a > b，a 和 b 对换（a 是 a、b 中的小者）
- 若 a > c，a 和 c 对换（a 是三者中最小者）
- 若 b > c，b 和 c 对换（b 是三者中次小者）
- 顺序输出 a、b、c

```c
#include <stdio.h>
int main()
{
    float a, b, c, t;
    scanf("%f,%f,%f", &a, &b, &c);
    if (a > b)
    { t = a; a = b; b = t; }
    if (a > c)
    { t = a; a = c; c = t; }
    if (b > c)
    { t = b; b = c; c = t; }
    printf("%5.2f,%5.2f,%5.2f\n", a, b, c);
    return 0;
}
```

## 4.2.2 if 语句的一般形式

```c
if (表达式) 语句1 [else 语句2]
```

- 表达式可以是关系表达式、逻辑表达式或数值表达式。
- 方括号内的部分为可选的。
- 语句1、语句2 可以是简单的语句、复合语句或另一个 if 语句等。$kp$, section = '' where id = 32300;
update t_knowledge_point set title = $kp$if-else if 语句的嵌套形式$kp$, content = $kp$```c
if (表达式1)
    语句1
else if (表达式2)
    语句2
else if (表达式3)
    语句3
...
else if (表达式m)
    语句m
else
    语句m+1
```

在 else 部分又嵌套了多层的 if 语句。$kp$, section = '' where id = 32301;
update t_knowledge_point set title = $kp$if 各分支语句的书写形式$kp$, content = $kp$在 if 的多分支形式中，「语句 1」……「语句 m」可以是简单的语句，也可以是复合语句。$kp$, section = '' where id = 32303;
update t_knowledge_point set title = $kp$if 与 switch 的综合应用例题$kp$, content = $kp$## 用 if 语句处理符号函数

输入 x，按 x 的符号给 y 赋值，并输出 x 和 y：

```c
scanf("%d", &x);
if (x > 0) y = 1;
else if (x == 0) y = 0;
else y = -1;
printf("x=%d,y=%d\n", x, y);
```

## 例 4.6 按成绩等级输出分数段

A 等为 85 分以上，B 等为 70～84 分，C 等为 60～69 分，D 等为 60 分以下，成绩等级由键盘输入。

```c
#include <stdio.h>
int main()
{
    char grade;
    scanf("%c", &grade);
    printf("Your score:");
    switch (grade)
    {
        case 'A': printf("85～100\n"); break;
        case 'B': printf("70～84\n"); break;
        case 'C': printf("60～69\n"); break;
        case 'D': printf("60以下\n"); break;
        default: printf("enter data error!\n");
    }
    return 0;
}
```

## 例 4.7 用 switch 调用不同的操作函数

```c
#include <stdio.h>
int main()
{
    void action1(int, int), action2(int, int);
    char ch;
    int a = 15, b = 23;
    ch = getchar();
    switch (ch)
    {
        case 'a':
        case 'A': action1(a, b); break;
        case 'b':
        case 'B': action2(a, b); break;
        default: putchar('\a');
    }
    return 0;
}

void action1(int x, int y)
{
    printf("x+y=%d\n", x + y);
}

void action2(int x, int y)
{
    printf("x*y=%d\n", x * y);
}
```

输入 a 或 A 时调用 action1 执行加法，输入 b 或 B 时调用 action2 执行乘法，输入其他字符时发出警告。

## 例 4.8 判断某一年是否闰年

用变量 leap 代表是否闰年的信息：若为闰年，令 leap = 1；非闰年，leap = 0。最后判断 leap 是否为 1（真），若是则输出闰年信息。

```c
#include <stdio.h>
int main()
{
    int year, leap;
    printf("enter year:");
    scanf("%d", &year);
    if (year % 4 == 0)
        if (year % 100 == 0)
            if (year % 400 == 0) leap = 1;
            else leap = 0;
        else leap = 1;
    else leap = 0;
    if (leap)
        printf("%d is ", year);
    else
        printf("%d is not ", year);
    printf("a leap year.\n");
    return 0;
}
```

## 例 4.9 求一元二次方程的根

按判别式 disc = b² - 4ac 分三种情况处理：两个相等实根、两个不同实根、一对共轭复根。

```c
if (fabs(disc) <= 1e-6)
    printf("has two equal roots:%8.4f\n", -b / (2 * a));
else if (disc > 1e-6)
{
    x1 = (-b + sqrt(disc)) / (2 * a);
    x2 = (-b - sqrt(disc)) / (2 * a);
    printf("has distinct real roots:%8.4f and %8.4f\n", x1, x2);
}
else
{
    realpart = -b / (2 * a);
    imagpart = sqrt(-disc) / (2 * a);
    printf("has complex roots:\n");
    printf("%8.4f+%8.4fi\n", realpart, imagpart);
    printf("%8.4f-%8.4fi\n", realpart, imagpart);
}
```

## 例 4.10 计算运输费用

路程 s（km）越远，每吨·千米运费越低，标准如下：

| 路程 s | 折扣 |
| --- | --- |
| s < 250 | 没有折扣 |
| 250 ≤ s < 500 | 2% 折扣 |
| 500 ≤ s < 1000 | 5% 折扣 |
| 1000 ≤ s < 2000 | 8% 折扣 |
| 2000 ≤ s < 3000 | 10% 折扣 |
| 3000 ≤ s | 15% 折扣 |

设每吨每千米货物的基本运费为 p，货物重为 w，距离为 s，折扣为 d，则总运费 f = p × w × s × (1 - d)。

折扣的变化点都是 250 的倍数。令 c = s / 250（整数除法），c 代表 250 的倍数；当 s ≥ 3000 时 c = 12，否则 c = s / 250。

```c
if (s >= 3000) c = 12;
else c = s / 250;

switch (c)
{
    case 0: d = 0; break;
    case 1: d = 2; break;
    case 2:
    case 3: d = 5; break;
    case 4:
    case 5:
    case 6:
    case 7: d = 8; break;
    case 8:
    case 9:
    case 10:
    case 11: d = 10; break;
    case 12: d = 15; break;
}

f = p * w * s * (1 - d / 100.0);
printf("freight=%10.2f\n", f);
```$kp$, section = '' where id = 32307;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (30425,30511,30519,30611,30665,31373,31376,31377,31378,31379,31698,31759,31760,31812,31907,31927,32130,32153,32170,32171,32172,32173,32175,32176,32177,32178,32179,32180,32181,32194,32227,32269,32298,32299,32300,32301,32303,32307) and not deleted) <> 38 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
