-- 知识点 247 节内容清洗（2026-10-28）
-- 目的：修正标题/序号/段落/LaTeX/OCR 明显问题；不改变题目与知识点 ID。
-- 依赖：t_knowledge_point；执行前自动建备份表 t_knowledge_point_backup_20261028_247。
-- 回滚：delete/update 使用备份表按 id 恢复。
begin;
create table if not exists t_knowledge_point_backup_20261028_247 as
select * from t_knowledge_point where node_id = 247;

update t_knowledge_point set title = $kp$if 语句示例$kp$, content = $kp$```c
int a = 3, b = 4, t = 0;
if (a > b) {
    t = a;
    a = b;
    b = t;
}
printf("%d, %d\n", a, b);
```

说明：`if` 后面的多条语句要用 `{}` 组成复合语句；交换两个变量通常需要一个临时变量。$kp$ where id = 30436;
update t_knowledge_point set title = $kp$scanf 的输入宽度与分隔符$kp$, content = $kp$scanf 可以在格式符中指定最大读取宽度：

```c
int a, b, c;
scanf("%2d%3d%4d", &a, &b, &c);
printf("%d, %d, %d\n", a, b, c);
/* 输入 1234567890，输出 12, 345, 6789 */
```

说明：

- `%2d`、`%3d` 中的数字表示最多读取的字符数。
- 多个格式符之间没有分隔符时，空格、Tab、回车都可以作为输入分隔。
- `scanf` 的地址列表要使用 `&` 取地址（数组名、字符串名除外）。

```c
char c1, c2;
scanf("%c%c", &c1, &c2);
printf("%c,%c\n", c1, c2);
```

`%c` 会原样读取字符，输入时不要在字符之间随意加空格。$kp$ where id = 30482;
update t_knowledge_point set title = $kp$3.3 数据的输入$kp$, content = $kp$使用 `scanf` 读入多个整数：

```c
int a, b, c;
scanf("%d%d%d", &a, &b, &c);
printf("%d, %d, %d\n", a, b, c);
```

`scanf` 的地址列表要使用 `&` 取地址。$kp$ where id = 30493;
update t_knowledge_point set title = $kp$3.5 程序实例：交换两个变量$kp$, content = $kp$输入两个整数并交换后输出：

```c
int a, b, t;
scanf("%d%d", &a, &b);
t = a;
a = b;
b = t;
printf("%d, %d\n", a, b);
/* 输入 3 5，输出 5, 3 */
```

也可以不使用临时变量：

```c
a = a + b;
b = a - b;
a = a - b;
```$kp$ where id = 30496;
update t_knowledge_point set title = $kp$空指针的定义$kp$, content = $kp$空指针表示不指向任何有效对象的指针。

```c
int *p = NULL;   /* NULL 的值通常为 0 */
```

注意：

- `NULL` 通常定义为 0，不能对空指针解引用。
- 空指针可以作为“未指向”的标记，使用前应先判断。$kp$ where id = 30506;
update t_knowledge_point set title = $kp$利用 scanf 和 printf 处理字符串$kp$, content = $kp$`printf` 和 `scanf` 都可以处理字符串。

```c
char s[] = "ABCD";
printf("%c\n", s[2]);   /* 输出 C */
printf("%s\n", s);      /* 输出 ABCD */
printf("%s\n", s + 1);  /* 输出 BCD */
```

说明：

- `%c` 输出单个字符，`%s` 输出字符串。
- 字符串以 `\0` 结束，`%s` 遇到 `\0` 停止输出。$kp$ where id = 30594;
update t_knowledge_point set title = $kp$复合语句$kp$, content = $kp$复合语句用一对花括号把多条语句组合成一条语句：

```c
{ a = 2; b = 3; c = a + b; }
```

复合语句在语法上视为一条语句。$kp$ where id = 30596;
update t_knowledge_point set title = $kp$测试用例示例$kp$, content = $kp$测试用例示例（输入与输出）：

| 测试用例 | 输出结果 |
| --- | --- |
| 0 | invalid number |
| 10001 | invalid number |
| 10000 | sum=166650 |
| 1 | sum=1 |
| -1 | invalid number |$kp$ where id = 30822;
update t_knowledge_point set title = $kp$鼠标属性的设置$kp$, content = $kp$> 注：本条属于计算机基础/Windows 操作，与本节 C 语言主题不符，建议归入对应章节。

在“控制面板”中双击“鼠标”图标，打开“鼠标属性”对话框。

- “鼠标键”选项卡：可切换主要和次要按钮，调整双击速度，启用单击锁定。
- “指针”选项卡：可选择鼠标指针方案，并查看不同状态下的指针形状。$kp$ where id = 31624;
update t_knowledge_point set title = $kp$printf 函数的一般形式$kp$, content = $kp$```c
printf("格式控制字符串", 输出列表);
```

- 格式控制字符串用双引号括起来。
- 输出列表可以是常量、变量或表达式。$kp$ where id = 31753;
update t_knowledge_point set title = $kp$printf 的输出规则$kp$, content = $kp$`printf` 输出时：

- 遇到格式控制符，按格式输出对应数据；
- 普通字符按原样输出；
- `\n` 表示换行。$kp$ where id = 31754;
update t_knowledge_point set title = $kp$scanf 函数的一般形式$kp$, content = $kp$```c
scanf("格式控制字符串", 地址列表);
```

地址列表使用变量地址（`&变量`）；数组名、字符串名本身就是地址。$kp$ where id = 31755;
update t_knowledge_point set title = $kp$scanf 的分隔符规则$kp$, content = $kp$`scanf` 的格式字符串中包含普通字符时，输入必须按原样匹配。

没有普通分隔字符时，空格、Tab、回车都可以作为数据分隔，数量不限。$kp$ where id = 31756;
update t_knowledge_point set title = $kp$scanf 格式字符串$kp$, content = $kp$scanf 的格式字符串一般形式：

```text
%[*][输入数据宽度][长度]类型
```

- `*`：读入后跳过该输入项，不赋给变量。
- 输入数据宽度：用十进制数指定最多读取的字符数。
- 长度：如 `l`、`h`，用于指定 `long`、`short` 等类型。$kp$ where id = 31757;
update t_knowledge_point set title = $kp$函数语句$kp$, content = $kp$函数语句：函数调用后加分号。

```c
printf("%d\n", a);
```$kp$ where id = 31771;
update t_knowledge_point set title = $kp$域代码与域结果的切换$kp$, content = $kp$> 注：本条属于计算机基础/Word 操作，与本节 C 语言主题不符，建议归入对应章节。

域分为域代码和域结果，按 `Shift + F9` 切换。$kp$ where id = 31783;
update t_knowledge_point set title = $kp$程序的控制结构$kp$, content = $kp$程序的控制结构有三种：顺序、选择（分支）、循环。$kp$ where id = 31791;
update t_knowledge_point set title = $kp$算法的有穷性$kp$, content = $kp$有穷性：算法必须在有限步内结束，每一步都在有限时间内完成。$kp$ where id = 31847;
update t_knowledge_point set title = $kp$常用输出格式符$kp$, content = $kp$常用输出格式符：

| 格式符 | 用途 |
|---|---|
| `%d` | 十进制整数 |
| `%o` | 无符号八进制整数 |
| `%x` | 无符号十六进制整数 |
| `%u` | 无符号十进制整数 |
| `%c` | 单个字符 |
| `%s` | 字符串 |
| `%e` | 指数形式实数 |
| `%f` | 小数形式实数 |
| `%g` | 自动选择 `%e` 或 `%f` 中较短的形式 |$kp$ where id = 31863;
update t_knowledge_point set title = $kp$语言栏与输入法快捷键$kp$, content = $kp$> 注：本条属于计算机基础/Windows 操作，与本节 C 语言主题不符，建议归入对应章节。

语言栏快捷键：

- `Ctrl + Shift`：切换输入法顺序
- `Ctrl + Space`：中英文切换
- `Ctrl + .`：中英文标点切换
- `Shift + Space`：全角/半角切换$kp$ where id = 31920;
update t_knowledge_point set title = $kp$goto 语句的使用限制$kp$, content = $kp$结构化程序设计限制使用 `goto` 语句，程序由顺序、选择、循环三种基本结构组成。$kp$ where id = 31923;
update t_knowledge_point set title = $kp$输入数据的分隔符$kp$, content = $kp$键盘输入多个数据时，数据之间可用空格、制表符或回车分隔。

逗号不是默认分隔符；除非格式字符串中明确写了逗号，否则输入时不要用逗号分隔。$kp$ where id = 31926;
update t_knowledge_point set title = $kp$选定一行文本$kp$, content = $kp$> 注：本条属于计算机基础/Word 操作，与本节 C 语言主题不符，建议归入对应章节。

将鼠标指针移到行左侧，指针变为向右箭头时单击，选定一行；拖动可选定多行。$kp$ where id = 32100;
update t_knowledge_point set title = $kp$选定一个段落$kp$, content = $kp$> 注：本条属于计算机基础/Word 操作，与本节 C 语言主题不符，建议归入对应章节。

将鼠标指针移到段落左侧，指针变为向右箭头时双击选定一个段落；在段落中任意位置三击也可选定该段。$kp$ where id = 32101;
update t_knowledge_point set title = $kp$选定多个连续段落$kp$, content = $kp$> 注：本条属于计算机基础/Word 操作，与本节 C 语言主题不符，建议归入对应章节。

将鼠标指针移到段落左侧，指针变为向右箭头后单击并上下拖动，可选定多个连续段落。$kp$ where id = 32102;
update t_knowledge_point set title = $kp$选择矩形文本$kp$, content = $kp$> 注：本条属于计算机基础/Word 操作，与本节 C 语言主题不符，建议归入对应章节。

按住 `Alt` 不放，从左上角拖动到右下角，可选择矩形文本区域。

| 操作 | 正文左侧 | 正文中间 |
| --- | --- | --- |
| 单击 | 选择该行 | 移动插入点 |
| 双击 | 选择该段 | 选择单词 |
| 三击 | 选择整个文档 | 选择该段 |$kp$ where id = 32104;
update t_knowledge_point set title = $kp$C 语言的三种基本结构$kp$, content = $kp$C 语言的三种基本结构：

1. 顺序结构
2. 选择结构（分支）
3. 循环结构$kp$ where id = 32113;
update t_knowledge_point set title = $kp$表达式语句$kp$, content = $kp$表达式语句：表达式后加分号。

```c
i += 1;
```$kp$ where id = 32146;
update t_knowledge_point set title = $kp$自增自减表达式语句$kp$, content = $kp$自增自减表达式加分号构成语句：

```c
++i;
j--;
```$kp$ where id = 32158;
update t_knowledge_point set title = $kp$复合语句（语句块）$kp$, content = $kp$复合语句（语句块）用一对花括号把多条语句组合成一条语句。

```c
{
    int x = 1, y = 2, t;
    t = x;
    x = y;
    y = t;
}
```

说明：复合语句在语法上视为一条语句，常用于 `if`、`for`、`while` 等控制结构中。$kp$ where id = 32163;
update t_knowledge_point set title = $kp$格式符与字符输入输出函数$kp$, content = $kp$格式符由 `%` 和类型字母组成，例如 `%d`、`%c`。

常用字符输入输出函数：

| 函数 | 作用 |
|---|---|
| `getchar()` | 从键盘读入一个字符 |
| `putchar(c)` | 向屏幕输出一个字符 |
| `gets(s)` | 读入一行字符串（不安全，现代 C 不建议使用） |
| `puts(s)` | 输出字符串并换行 |
| `scanf()` | 按格式输入 |
| `printf()` | 按格式输出 |$kp$ where id = 32166;
update t_knowledge_point set title = $kp$scanf 函数$kp$, content = $kp$`scanf` 函数：

1. 头文件：`#include <stdio.h>`
2. 函数名：`scanf`
3. 功能：按格式从键盘输入数据
4. 格式：`scanf("格式控制字符串", 地址列表);`

常用格式符：`%d` 整数、`%f` 实数、`%c` 字符、`%s` 字符串。$kp$ where id = 32167;
update t_knowledge_point set title = $kp$printf 函数$kp$, content = $kp$`printf` 函数：

1. 头文件：`#include <stdio.h>`
2. 函数名：`printf`
3. 功能：按格式向屏幕输出数据
4. 格式：`printf("格式控制字符串", 输出列表);`

格式控制符由 `%`、修饰符和格式符组成，例如 `%3d`、`%5.1f`。$kp$ where id = 32168;
update t_knowledge_point set title = $kp$printf 输出修饰符$kp$, content = $kp$`printf` 输出修饰符：

- `%s`：输出字符串。
- `%ms`：最小宽度为 `m`，右对齐，左补空格。
- `%-ms`：最小宽度为 `m`，左对齐，右补空格。
- `%m.ns`：最多取字符串左端 `n` 个字符，输出宽度为 `m`。
- `%-m.ns`：同上，但左对齐、右补空格。$kp$ where id = 32169;
update t_knowledge_point set title = $kp$顺序程序设计$kp$, content = $kp$顺序程序设计按语句书写顺序依次执行。程序的基本控制结构有顺序、选择、循环。$kp$ where id = 32241;
update t_knowledge_point set title = $kp$赋值语句$kp$, content = $kp$赋值语句：

```c
变量 = 表达式;
```

- 赋值表达式末尾没有分号；赋值语句末尾有分号。
- 赋值时把右侧表达式的值写入左侧变量。
- 实型数据赋给整型变量时舍弃小数部分；整型数据赋给实型变量时转换为浮点形式。$kp$ where id = 32242;
update t_knowledge_point set title = $kp$简单的输入输出函数$kp$, content = $kp$`printf` 的基本用法：

```c
printf("格式控制字符串", 输出列表);
```

- 格式控制符以 `%` 开头，如 `%d`、`%f`、`%c`、`%s`。
- `%5.1f` 表示输出宽度 5、保留 1 位小数。
- `%%` 输出一个 `%`。$kp$ where id = 32243;
update t_knowledge_point set title = $kp$输出固定内容$kp$, content = $kp$输出固定内容：

```c
#include <stdio.h>
int main(void) {
    printf("跟我学 C 语言");
    return 0;
}
```

`printf("跟我学\nC 语言");` 中的 `\n` 表示换行。$kp$ where id = 32265;
update t_knowledge_point set title = $kp$scanf 输入格式示例$kp$, content = $kp$输入语句：

```c
scanf("a=%d b=%d c=%d", &a, &b, &c);
```

若要使 `a=1`、`b=3`、`c=2`，应输入：

```text
a=1 b=3 c=2
```

`scanf` 格式字符串中的普通字符（如 `a=`）必须原样输入。$kp$ where id = 32268;
update t_knowledge_point set title = $kp$控制语句$kp$, content = $kp$控制语句包括：`if`、`switch`、`for`、`while`、`do...while`、`continue`、`break`、`return`、`goto` 等。$kp$ where id = 32275;
update t_knowledge_point set title = $kp$赋值表达式和赋值语句$kp$, content = $kp$- 赋值表达式末尾没有分号；赋值语句末尾有分号。
- 一个表达式可以包含赋值表达式，但不能包含赋值语句。$kp$ where id = 32281;
update t_knowledge_point set title = $kp$预处理指令 #include$kp$, content = $kp$使用 `printf`、`scanf` 前需要包含头文件：

```c
#include <stdio.h>
```

或：

```c
#include "stdio.h"
```$kp$ where id = 32282;
update t_knowledge_point set title = $kp$printf 函数的一般格式$kp$, content = $kp$`printf` 的一般格式：

```c
printf("格式控制", 输出表列);
```

例如：

```c
printf("i=%d,c=%c\n", i, c);
```

输出表列可以是常量、变量或表达式。$kp$ where id = 32285;
update t_knowledge_point set title = $kp$d 格式符$kp$, content = $kp$`%d` 输出有符号十进制整数，可以指定域宽：

```c
printf("%5d%5d\n", 12, -345);
```

`%ld` 输出 `long` 型数据。$kp$ where id = 32286;
update t_knowledge_point set title = $kp$c 格式符$kp$, content = $kp$`%c` 输出一个字符：

```c
char ch = 'a';
printf("%c", ch);
printf("%5c", ch);
```$kp$ where id = 32287;
update t_knowledge_point set title = $kp$s 格式符$kp$, content = $kp$`%s` 输出字符串：

```c
printf("%s", "CHINA");
```$kp$ where id = 32288;
update t_knowledge_point set title = $kp$f 格式符$kp$, content = $kp$`%f` 以小数形式输出实数；不指定宽度时默认保留 6 位小数：

```c
double a = 1.0;
printf("%f\n", a / 3);
```$kp$ where id = 32289;
update t_knowledge_point set title = $kp$e 格式符$kp$, content = $kp$`%e` 以指数形式输出实数：

```c
printf("%e", 123.456);
/* 输出：1.234560e+002 */
```$kp$ where id = 32294;
update t_knowledge_point set title = $kp$scanf 函数的一般形式$kp$, content = $kp$`scanf` 的一般形式：

```c
scanf("格式控制", 地址表列);
```

地址表列可以是变量地址或字符串首地址。

```c
scanf("%f%f%f", &a, &b, &c);  /* 正确 */
scanf("%f%f%f", a, b, c);     /* 错误：缺少 & */
```$kp$ where id = 32297;

-- 247 的子节 S1-3.2 也有一条残片，补入备份并清洗
insert into t_knowledge_point_backup_20261028_247
select * from t_knowledge_point k
where k.id = 31875
  and not exists (select 1 from t_knowledge_point_backup_20261028_247 b where b.id = k.id);
update t_knowledge_point
set title = '输入输出函数的调用', section = '', content = $kp$输入输出函数调用时，要保证格式控制字符串与参数的类型、数量匹配。

```c
int a;
scanf("%d", &a);
printf("%d\n", a);
```$kp$
where id = 31875;

-- 旧 section 字段是原 OCR 标题/残片，标题改名后会重复显示，统一清空
update t_knowledge_point set section = '' where node_id = 247;

do $$
begin
  if (select count(*) from t_knowledge_point where node_id = 247 and not deleted) <> 49 then
    raise exception '247 节知识点数量异常';
  end if;
  if exists (select 1 from t_knowledge_point where node_id = 247 and (title is null or btrim(title) = '')) then
    raise exception '247 节存在空标题';
  end if;
end $$;
commit;
