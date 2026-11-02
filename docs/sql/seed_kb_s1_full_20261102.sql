-- P2 阶段：S1（C语言程序设计）S1-2 至 S1-7 共 21 个三级考点结构化精编讲义发布
-- 同时完成 S1-3 跨科混入的 7 条 Windows/Word 知识点归位，以及 S1 二级直挂知识点下沉至三级节点
-- 执行日期：2026-11-02

BEGIN;

-- 0. 备份即将调整 node_id / content 的 S1 旧版知识点
CREATE TABLE IF NOT EXISTS t_kp_s1_backup_20261102 AS
SELECT id, node_id, title, content FROM t_knowledge_point
 WHERE id IN (31624, 31783, 31920, 32100, 32101, 32102, 32103, 32104)
    OR node_id IN (242, 247, 250, 254, 259, 264);

-- S1-2.1 C 语言的基本数据类型及定义方法。 (node_id=243)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (243, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (243, 1, '[{"id": "s1-2-1-b1", "t": "list", "imp": "core", "title": "标识符命名规则与三类标识符", "ordered": false, "items": ["合法字符集：标识符只能由==字母（A~Z、a~z）、数字（0~9）和下划线（`_`）==组成，且==首字符必须是字母或下划线，绝不能以数字开头==。", "大小写敏感：C 语言严格区分大小写，如 `score`、`Score` 与 `SCORE` 是三个不同的标识符；**关键字必须全部小写**（如 `int`、`return`、`sizeof`）。", "三类标识符：① ==关键字==（32 个，有固定语法含义，不可作变量名，如 `int, if, else, for, while, do, switch, case, break, continue, default, sizeof, static, extern`）；② **预定义标识符**（库函数名或预处理命令如 `printf, scanf, define, include`，语法允许重定义但严禁重名）；③ **用户标识符**（自定义的变量名、函数名、结构体名）。"]}, {"id": "s1-2-1-b2", "t": "tree", "imp": "important", "title": "C 语言数据类型体系导图", "root": {"label": "C 语言数据类型", "children": [{"label": "基本类型（算术类型）", "children": [{"label": "整型：short (2B)、int (4B)、long (4B)，均可配 signed / unsigned"}, {"label": "字符型：char (1B，内存中存 ASCII 码整数，可参与算术运算)"}, {"label": "实型（浮点型）：float 单精度 (4B，6~7 位有效数字)、double 双精度 (8B，15~16 位有效数字)"}]}, {"label": "构造类型（聚合类型）", "children": [{"label": "数组类型 `type arr[N]`、结构体 `struct`、共用体 `union`、枚举 `enum`"}]}, {"label": "指针类型 `type *p`（32 位环境下任意指针变量本身占 4 字节）"}, {"label": "空类型 `void`（无返回值函数或通用指针 `void *`）"}]}}, {"id": "s1-2-1-b3", "t": "table", "imp": "core", "title": "基本数据类型字节数、取值范围与常量表示（32 位标准环境）", "headers": ["数据类型", "关键字", "字节数 (sizeof)", "常见表示与考试必记要点"], "rows": [["字符型", "`char` / `unsigned char`", "==1 字节 (8 bit)==", "有符号 `-128 ~ 127`，无符号 `0 ~ 255`；`''A''=65, ''a''=97, ''0''=48`，==大小写相差 32=="], ["短整型", "`short [int]`", "==2 字节 (16 bit)==", "有符号 `-32768 ~ 32767`，无符号 `0 ~ 65535`"], ["基本整型", "`int` / `unsigned int`", "==4 字节 (32 bit)==", "十进制 `123`、==八进制以 `0` 开头==（如 `017` 合法，`018` 非法）、==十六进制以 `0x/0X` 开头==（如 `0x1A`）"], ["单精度实型", "`float`", "==4 字节 (32 bit)==", "小数形式 `3.14f`；指数形式 ==`aEn` 或 `aen` 要求 E 前必有数、E 后必为整数==（如 `1.2e-3` 合法，`e3`、`2e1.5` 非法）"], ["双精度实型", "`double`", "==8 字节 (64 bit)==", "C 语言中实型常量（如 `3.14`）默认按 `double` 存储和运算"]]}, {"id": "s1-2-1-b4", "t": "table", "imp": "core", "title": "高频转义字符与字符串存储区别", "headers": ["转义形式", "含义与 ASCII", "典型示例", "易错区分"], "rows": [["`''\\n''` / `''\\t''` / `''\\r''`", "换行(10) / 水平制表(9) / 回车(13)", "`printf(\"a\\tb\\n\");`", "每个转义字符无论写几个符号都==只算 1 个字符=="], ["`''\\\\''` / `''\\''''` / `''\\\"''`", "反斜杠 `\\` / 单引号 `''` / 双引号 `\"`", "`char c = ''\\'''';`", "在路径字符串中写双反斜杠：`\"C:\\\\test\\\\a.txt\"`"], ["`''\\0''` vs `''0''`", "空字符(ASCII ==0==) vs 数字字符(ASCII ==48==)", "`\"a\"` 占 ==2 字节==（`''a''` 与末尾隐含 `''\\0''`）", "字符 `''a''` 占 1B；字符串 `\"a\"` 含结束标志 `''\\0''` 占 2B"], ["`''\\ddd''` / `''\\xhh''`", "1~3 位八进制 / 1~2 位十六进制转义", "`''\\101''` 即 `''A''`(65)，`''\\x41''` 即 `''A''`", "八进制转义中不能出现 `8` 或 `9`（如 `''\\018''` 错误）"]]}, {"id": "s1-2-1-b5", "t": "callout", "imp": "core", "kind": "trap", "title": "高频易错：符号常量 #define 与结构体 sizeof 双口径（对应复核项 30613）", "text": "① `#define PI 3.14` 是**宏替换预处理指令**，末尾==绝不能加分号==，仅做文本替换不做语法检查；`const double pi = 3.14;` 才是有类型的常变量。<br>② **结构体 `sizeof` 双口径**：若题目不计内存对齐，按各成员字节数紧凑累加（如 `int a[2]; char ch[10]; float s; double f;` 累加为 `8+10+4+8 = 30` 字节）；若按 32 位/VC 默认对齐，`char ch[10]` 后补齐 2 字节，整体 `sizeof` 为 **32 字节**；而**任意类型的结构体指针变量本身在 32 位下恒占 4 字节**。"}]'::jsonb, '', 'S1-2.1 C 语言的基本数据类型及定义方法。 标识符命名规则与三类标识符 合法字符集：标识符只能由字母（A~Z、a~z）、数字（0~9）和下划线（_）组成，且首字符必须是字母或下划线，绝不能以数字开头。 大小写敏感：C 语言严格区分大小写，如 score、Score 与 SCORE 是三个不同的标识符；关键字必须全部小写（如 int、return、sizeof）。 三类标识符：① 关键字（32 个，有固定语法含义，不可作变量名，如 int, if, else, for, while, do, switch, case, break, continue, default, sizeof, static, extern）；② 预定义标识符（库函数名或预处理命令如 printf, scanf, define, include，语法允许重定义但严禁重名）；③ 用户标识符（自定义的变量名、函数名、结构体名）。 C 语言数据类型体系导图 基本数据类型字节数、取值范围与常量表示（32 位标准环境） 数据类型 关键字 字节数 (sizeof) 常见表示与考试必记要点 字符型 char / unsigned char 1 字节 (8 bit) 有符号 -128 ~ 127，无符号 0 ~ 255；''A''=65, ''a''=97, ''0''=48，大小写相差 32 短整型 short [int] 2 字节 (16 bit) 有符号 -32768 ~ 32767，无符号 0 ~ 65535 基本整型 int / unsigned int 4 字节 (32 bit) 十进制 123、八进制以 0 开头（如 017 合法，018 非法）、十六进制以 0x/0X 开头（如 0x1A） 单精度实型 float 4 字节 (32 bit) 小数形式 3.14f；指数形式 aEn 或 aen 要求 E 前必有数、E 后必为整数（如 1.2e-3 合法，e3、2e1.5 非法） 双精度实型 double 8 字节 (64 bit) C 语言中实型常量（如 3.14）默认按 double 存储和运算 高频转义字符与字符串存储区别 转义形式 含义与 ASCII 典型示例 易错区分 ''\n'' / ''\t'' / ''\r'' 换行(10) / 水平制表(9) / 回车(13) printf("a\tb\n"); 每个转义字符无论写几个符号都只算 1 个字符 ''\\'' / ''\'''' / ''\"'' 反斜杠 \ / 单引号 '' / 双引号 " char c = ''\''''; 在路径字符串中写双反斜杠："C:\\test\\a.txt" ''\0'' vs ''0'' 空字符(ASCII 0) vs 数字字符(ASCII 48) "a" 占 2 字节（''a'' 与末尾隐含 ''\0''） 字符 ''a'' 占 1B；字符串 "a" 含结束标志 ''\0'' 占 2B ''\ddd'' / ''\xhh'' 1~3 位八进制 / 1~2 位十六进制转义 ''\101'' 即 ''A''(65)，''\x41'' 即 ''A'' 八进制转义中不能出现 8 或 9（如 ''\018'' 错误） 高频易错：符号常量 #define 与结构体 sizeof 双口径（对应复核项 30613） ① #define PI 3.14 是宏替换预处理指令，末尾绝不能加分号，仅做文本替换不做语法检查；const double pi = 3.14; 才是有类型的常变量。<br>② 结构体 sizeof 双口径：若题目不计内存对齐，按各成员字节数紧凑累加（如 int a[2]; char ch[10]; float s; double f; 累加为 8+10+4+8 = 30 字节）；若按 32 位/VC 默认对齐，char ch[10] 后补齐 2 字节，整体 sizeof 为 32 字节；而任意类型的结构体指针变量本身在 32 位下恒占 4 字节。', '{"pdf": "操作技能复习.pdf", "pages": [12, 13, 14, 15, 16]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-2.2 C 语言运算符的种类、运算优先级和结合性。 (node_id=244)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (244, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (244, 1, '[{"id": "s1-2-2-b1", "t": "table", "imp": "core", "title": "C 语言核心运算符优先级与结合性总表（由高到低）", "headers": ["优先级梯队", "运算符类别", "代表运算符", "结合方向与必记口诀"], "rows": [["第 1 梯队（最高）", "初等运算符", "`()` 圆括号、`[]` 数组下标、`->`、`.` 成员", "自左向右；括号优先级永远最高"], ["第 2 梯队", "单目运算符", "`!`、`++`、`--`、`-`(负号)、`&`(取址)、`*`(解引用)、`(type)`、`sizeof`", "==自右向左==（单目、条件、赋值三大类均为右结合）"], ["第 3 梯队", "算术运算符", "先 `*  /  %`，后 `+  -`", "自左向右；==求余 `%` 两侧操作数必须全为整型=="], ["第 4 梯队", "关系运算符", "先 `>  >=  <  <=`，后 `==  !=`", "自左向右；结果只有真（`1`）或假（`0`）"], ["第 5 梯队", "逻辑运算符（不含 `!`）", "先逻辑与 `&&`，后逻辑或 `||`", "自左向右；注意单目逻辑非 `!` 在第 2 梯队，远高于算术和关系"], ["第 6 梯队", "条件运算符（唯一三目）", "`表达式1 ? 表达式2 : 表达式3`", "==自右向左==；如 `a>b ? a : c>d ? c : d` 等价于 `a>b ? a : (c>d ? c : d)`"], ["第 7 梯队", "赋值与复合赋值", "`=  +=  -=  *=  /=  %=`", "==自右向左==；左操作数必须是可修改的**变量（左值）**"], ["第 8 梯队（最低）", "逗号运算符", "`表达式1, 表达式2, ..., 表达式n`", "自左向右依次求值，整个表达式取==最后一个表达式的值=="]]}, {"id": "s1-2-2-b2", "t": "list", "imp": "core", "title": "算术运算与自增自减（++ / --）必记铁律", "ordered": false, "items": ["整数相除截断小数：两个整型相除结果仍为整型（向零取整），如 ==`5 / 2 == 2`==、`-5 / 2 == -2`；只要有一侧为浮点型则为实数除法，如 `5.0 / 2 == 2.5`。", "求余 `%` 符号规律：==`a % b` 的操作数必须全为整数==（如 `5.0 % 2` 编译报错），且**余数的正负号完全取决于被除数 `a`**，如 `-7 % 4 == -3`、`7 % -4 == 3`。", "前置 `++i` vs 后置 `i++`：单独成句时效果相同；嵌入表达式时，==前置 `++i` 先自增 1 再用新值参与运算==，==后置 `i++` 先用原值参与运算、表达式取完值后再自增 1==；`++`/`--` 只能用于变量，不能用于常量或表达式（如 `5++`、`(a+b)++` 均非法）。"]}, {"id": "s1-2-2-b3", "t": "callout", "imp": "core", "kind": "trap", "title": "逻辑短路求值与连续自增陷阱（对应复核项 30260）", "text": "① **逻辑与 `&&` 短路**：在 `expr1 && expr2` 中，若 ==`expr1` 为假（0），则 `expr2` 根本不会执行==（例如 `int a=0, b=1; (a++) && (++b);` 执行后 `a=1`，而 `b` 仍为 `1`）。<br>② **逻辑或 `||` 短路**：在 `expr1 || expr2` 中，若 ==`expr1` 为真（非 0），则 `expr2` 根本不会执行==。<br>③ **同一变量连续自增（30260）**：标准 C 中同一表达式内对同一变量多次自增属未定义行为，但旧版等级考试若出现 `int x=2; int a=(++x)+(++x);`，通常按两次前置自增均完成后 `x=4`、`a=8`（或部分老题库按 `x=2` 连增计算）考查，写工程代码时严禁写出此类表达式。"}]'::jsonb, '', 'S1-2.2 C 语言运算符的种类、运算优先级和结合性。 C 语言核心运算符优先级与结合性总表（由高到低） 优先级梯队 运算符类别 代表运算符 结合方向与必记口诀 第 1 梯队（最高） 初等运算符 () 圆括号、[] 数组下标、->、. 成员 自左向右；括号优先级永远最高 第 2 梯队 单目运算符 !、++、--、-(负号)、&(取址)、*(解引用)、(type)、sizeof 自右向左（单目、条件、赋值三大类均为右结合） 第 3 梯队 算术运算符 先 *  /  %，后 +  - 自左向右；求余 % 两侧操作数必须全为整型 第 4 梯队 关系运算符 先 >  >=  <  <=，后   != 自左向右；结果只有真（1）或假（0） 第 5 梯队 逻辑运算符（不含 !） 先逻辑与 &&，后逻辑或 || 自左向右；注意单目逻辑非 ! 在第 2 梯队，远高于算术和关系 第 6 梯队 条件运算符（唯一三目） 表达式1 ? 表达式2 : 表达式3 自右向左；如 a>b ? a : c>d ? c : d 等价于 a>b ? a : (c>d ? c : d) 第 7 梯队 赋值与复合赋值 =  +=  -=  *=  /=  %= 自右向左；左操作数必须是可修改的变量（左值） 第 8 梯队（最低） 逗号运算符 表达式1, 表达式2, ..., 表达式n 自左向右依次求值，整个表达式取最后一个表达式的值 算术运算与自增自减（++ / --）必记铁律 整数相除截断小数：两个整型相除结果仍为整型（向零取整），如 5 / 2  2、-5 / 2  -2；只要有一侧为浮点型则为实数除法，如 5.0 / 2  2.5。 求余 % 符号规律：a % b 的操作数必须全为整数（如 5.0 % 2 编译报错），且余数的正负号完全取决于被除数 a，如 -7 % 4  -3、7 % -4  3。 前置 ++i vs 后置 i++：单独成句时效果相同；嵌入表达式时，前置 ++i 先自增 1 再用新值参与运算，后置 i++ 先用原值参与运算、表达式取完值后再自增 1；++/-- 只能用于变量，不能用于常量或表达式（如 5++、(a+b)++ 均非法）。 逻辑短路求值与连续自增陷阱（对应复核项 30260） ① 逻辑与 && 短路：在 expr1 && expr2 中，若 expr1 为假（0），则 expr2 根本不会执行（例如 int a=0, b=1; (a++) && (++b); 执行后 a=1，而 b 仍为 1）。<br>② 逻辑或 || 短路：在 expr1 || expr2 中，若 expr1 为真（非 0），则 expr2 根本不会执行。<br>③ 同一变量连续自增（30260）：标准 C 中同一表达式内对同一变量多次自增属未定义行为，但旧版等级考试若出现 int x=2; int a=(++x)+(++x);，通常按两次前置自增均完成后 x=4、a=8（或部分老题库按 x=2 连增计算）考查，写工程代码时严禁写出此类表达式。', '{"pdf": "操作技能复习.pdf", "pages": [16, 17, 18, 19, 20, 21]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-2.3 不同类型数据间的转换与运算。 (node_id=245)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (245, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (245, 1, '[{"id": "s1-2-3-b1", "t": "list", "imp": "core", "title": "隐式自动类型转换与赋值转换规则", "ordered": false, "items": ["算术运算自动提升（向高精度看齐）：不同类型数据混合运算时，纵向先把 `char`、`short` 自动提升为 `int`；横向按 ==`int` → `unsigned int` → `long` → `double`== 由低向高自动转换（`float` 参与运算时直接按双精度 `double` 处理）。", "赋值自动转换（向等号左侧看齐）：赋值运算 `=` 两侧类型不同时，==无条件将右侧表达式的值转换为左侧变量的类型==。浮点型赋给整型会**直接截断小数部分**（不四舍五入），如 `int a = 3.9;` 结果 `a` 为 `3`。"]}, {"id": "s1-2-3-b2", "t": "code", "imp": "important", "title": "显式强制类型转换 `(类型名)表达式` 示例", "lang": "c", "code": "#include <stdio.h>\n\nint main(void) {\n    double x = 3.8;\n    int a = (int)x + 2;       /* (int)x 得到临时值 3，x 本身仍为 3.8 */\n    int b = (int)(x + 2.5);   /* 先算 3.8 + 2.5 = 6.3，再强转为 6 */\n    printf(\"x=%.1f, a=%d, b=%d\\n\", x, a, b);\n    return 0;\n}"}, {"id": "s1-2-3-b3", "t": "callout", "imp": "core", "kind": "trap", "title": "强制类型转换两大必考陷阱", "text": "① **语法写法**：类型名必须加括号，写成 `(int)x` 正确，写成 `int(x)` 在纯 C 中语法错误。<br>② **原变量不变**：强制转换 `(int)x` 仅产生一个临时的整型中间值，==变量 `x` 自身的数据类型和存储值均不发生任何改变==；且 `(int)x + y` 只强转 `x`（因单目 `(type)` 优先级高于 `+`）。"}]'::jsonb, '', 'S1-2.3 不同类型数据间的转换与运算。 隐式自动类型转换与赋值转换规则 算术运算自动提升（向高精度看齐）：不同类型数据混合运算时，纵向先把 char、short 自动提升为 int；横向按 int → unsigned int → long → double 由低向高自动转换（float 参与运算时直接按双精度 double 处理）。 赋值自动转换（向等号左侧看齐）：赋值运算 = 两侧类型不同时，无条件将右侧表达式的值转换为左侧变量的类型。浮点型赋给整型会直接截断小数部分（不四舍五入），如 int a = 3.9; 结果 a 为 3。 显式强制类型转换 (类型名)表达式 示例 #include <stdio.h>

int main(void) {
    double x = 3.8;
    int a = (int)x + 2;       /* (int)x 得到临时值 3，x 本身仍为 3.8 */
    int b = (int)(x + 2.5);   /* 先算 3.8 + 2.5 = 6.3，再强转为 6 */
    printf("x=%.1f, a=%d, b=%d\n", x, a, b);
    return 0;
} 强制类型转换两大必考陷阱 ① 语法写法：类型名必须加括号，写成 (int)x 正确，写成 int(x) 在纯 C 中语法错误。<br>② 原变量不变：强制转换 (int)x 仅产生一个临时的整型中间值，变量 x 自身的数据类型和存储值均不发生任何改变；且 (int)x + y 只强转 x（因单目 (type) 优先级高于 +）。', '{"pdf": "操作技能复习.pdf", "pages": [22]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-2.4 C 语言表达式类型（赋值表达式，算术表达式，关系表达式，逻辑表达式，条件表达式，逗号表达式）和求值规则。 (node_id=246)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (246, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (246, 1, '[{"id": "s1-2-4-b1", "t": "table", "imp": "core", "title": "六大类表达式求值规则与高频考题对照", "headers": ["表达式类型", "语法与求值规则", "经典真题示例（设初值 `int a=3, b=4, c=5;`）", "容易踩坑点"], "rows": [["赋值与复合赋值", "右结合；==复合赋值右侧整体自动加括号==", "`a += a -= a * a`（设初值 `a=6`）：先算 `a -= 36` 得 `a=-30`，再算 `a += -30` 得 ==`-60`==", "`a *= b + c` 等价于 `a = a * (b + c)`，绝不是 `a * b + c`"], ["关系表达式", "成立值为 `1`，不成立值为 `0`", "`c > b > a`：先算 `c > b` 得 `1`，再算 `1 > a`（即 `1 > 3`）结果为 ==`0`==", "数学连等 `1 <= x <= 10` 在 C 中恒为真（`1`），应写 **`x >= 1 && x <= 10`**"], ["逻辑表达式", "非 0 即真，0 即假；结果仅 `1` 或 `0`", "`!(a + b) + c - 1 && b + c / 2`：`!(7)` 为 `0`，`0+5-1=4`(真)，右侧 `4+2=6`(真)，结果为 ==`1`==", "注意赋值 `=` 与相等 `==`：`if (a = 0)` 会把 0 赋给 `a` 且恒判为假"], ["条件表达式", "`e1 ? e2 : e3`（右结合）", "`a < b ? a : c` 结果为 `3`", "只会计算被选中的那个分支，未选中分支中的 `++` 不会执行"], ["逗号表达式", "`e1, e2, ..., en`（优先级最低）", "`x = (a = 3, 6 * 3)` 则 `x=18`；而 `x = a = 3, 6 * 3` 则 ==`x=3`==", "无括号时赋值 `=` 优先级高于逗号 `,`"]]}, {"id": "s1-2-4-b2", "t": "code", "imp": "important", "title": "复合赋值与逗号表达式求值验证", "lang": "c", "code": "#include <stdio.h>\n\nint main(void) {\n    int a = 6, x, y;\n    a += a -= a * a;\n    x = (y = 3, y + 5);\n    printf(\"a=%d, x=%d, y=%d\\n\", a, x, y);\n    return 0;\n}"}]'::jsonb, '', 'S1-2.4 C 语言表达式类型（赋值表达式，算术表达式，关系表达式，逻辑表达式，条件表达式，逗号表达式）和求值规则。 六大类表达式求值规则与高频考题对照 表达式类型 语法与求值规则 经典真题示例（设初值 int a=3, b=4, c=5;） 容易踩坑点 赋值与复合赋值 右结合；复合赋值右侧整体自动加括号 a += a -= a * a（设初值 a=6）：先算 a -= 36 得 a=-30，再算 a += -30 得 -60 a *= b + c 等价于 a = a * (b + c)，绝不是 a * b + c 关系表达式 成立值为 1，不成立值为 0 c > b > a：先算 c > b 得 1，再算 1 > a（即 1 > 3）结果为 0 数学连等 1 <= x <= 10 在 C 中恒为真（1），应写 x >= 1 && x <= 10 逻辑表达式 非 0 即真，0 即假；结果仅 1 或 0 !(a + b) + c - 1 && b + c / 2：!(7) 为 0，0+5-1=4(真)，右侧 4+2=6(真)，结果为 1 注意赋值 = 与相等 ：if (a = 0) 会把 0 赋给 a 且恒判为假 条件表达式 e1 ? e2 : e3（右结合） a < b ? a : c 结果为 3 只会计算被选中的那个分支，未选中分支中的 ++ 不会执行 逗号表达式 e1, e2, ..., en（优先级最低） x = (a = 3, 6 * 3) 则 x=18；而 x = a = 3, 6 * 3 则 x=3 无括号时赋值 = 优先级高于逗号 , 复合赋值与逗号表达式求值验证 #include <stdio.h>

int main(void) {
    int a = 6, x, y;
    a += a -= a * a;
    x = (y = 3, y + 5);
    printf("a=%d, x=%d, y=%d\n", a, x, y);
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [22, 23, 24]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-3.1 表达式语句，空语句，复合语句。 (node_id=248)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (248, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (248, 1, '[{"id": "s1-3-1-b1", "t": "list", "imp": "core", "title": "三类基本语句的语法特征与作用", "ordered": false, "items": ["表达式语句：在任意合法表达式末尾加上==分号 `;`== 即构成语句（如 `a = 3;`、`i++;`、`printf(\"Hi\");`）。**分号是 C 语句不可缺少的组成部分**，不加分号只是表达式而非语句。", "空语句：仅由一个分号 `;` 组成的语句，执行时不产生任何操作，常用于循环体为空的延时或占位。**切忌在 `if (条件)`、`for (...)`、`while (...)` 圆括号后误加分号**，否则会导致分支或循环体变成空语句。", "复合语句（分程序 / 语句块）：用一对花括号 ==`{ ... }`== 括起来的多条语句（内部也可在开头定义局部变量），在语法上**被视为单条语句**，==右花括号 `}` 后不加分号==。"]}, {"id": "s1-3-1-b2", "t": "callout", "imp": "core", "kind": "trap", "title": "复合语句内部同名变量遮蔽（Shadowing）", "text": "复合语句 `{ ... }` 内部定义的变量仅在该花括号块内有效；若块内定义了与外部同名的变量，块内会暂时遮蔽外部变量，走出 `}` 后外部变量恢复原值。"}]'::jsonb, '', 'S1-3.1 表达式语句，空语句，复合语句。 三类基本语句的语法特征与作用 表达式语句：在任意合法表达式末尾加上分号 ; 即构成语句（如 a = 3;、i++;、printf("Hi");）。分号是 C 语句不可缺少的组成部分，不加分号只是表达式而非语句。 空语句：仅由一个分号 ; 组成的语句，执行时不产生任何操作，常用于循环体为空的延时或占位。切忌在 if (条件)、for (...)、while (...) 圆括号后误加分号，否则会导致分支或循环体变成空语句。 复合语句（分程序 / 语句块）：用一对花括号 { ... } 括起来的多条语句（内部也可在开头定义局部变量），在语法上被视为单条语句，右花括号 } 后不加分号。 复合语句内部同名变量遮蔽（Shadowing） 复合语句 { ... } 内部定义的变量仅在该花括号块内有效；若块内定义了与外部同名的变量，块内会暂时遮蔽外部变量，走出 } 后外部变量恢复原值。', '{"pdf": "操作技能复习.pdf", "pages": [25]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-3.2 输入输出函数的调用，正确输入数据并正确设计输出格式。 (node_id=249)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (249, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (249, 1, '[{"id": "s1-3-2-b1", "t": "table", "imp": "core", "title": "printf / scanf 格式控制符与宽度精度修饰表", "headers": ["格式符", "对应类型与含义", "printf 输出特性", "scanf 输入特性与陷阱"], "rows": [["`%d` / `%u`", "十进制有符号 / 无符号整型", "`%5d` 右对齐占 5 列，`%-5d` 左对齐，`%05d` 补前导 0", "`%3d` 表示最多截取 3 位数字读入"], ["`%o` / `%x`", "八进制 / 十六进制无符号整数", "默认不带前缀 `0` 或 `0x`（加 `#` 如 `%#x` 才带前缀）", "可按八进制或十六进制读入整数"], ["`%f` / `%lf`", "小数形式浮点数", "`printf` 中 `%f` 默认输出 ==6 位小数==；`%.2f` 四舍五入保留 2 位小数", "==`scanf` 读 `float` 用 `%f`，读 `double` 必须用 `%lf`=="], ["`%c`", "单个字符", "输出 1 个字符", "==空格、回车、Tab 都会被 `%c` 当作有效字符读入=="], ["`%s`", "字符串", "从首地址起输出直到遇 `''\\0''`", "==遇空格、Tab 或回车即停止读入==；参数直接传字符数组名，**不加 `&`**"]]}, {"id": "s1-3-2-b2", "t": "list", "imp": "core", "title": "scanf 与字符输入输出（getchar / putchar）必记规则", "ordered": false, "items": ["`scanf` 参数必须传**地址**：普通变量前==必须加取地址符 `&`==（如 `scanf(\"%d\", &a);`），而字符数组名本身代表首元素地址，因此 `scanf(\"%s\", str);` 前不加 `&`。", "`scanf` 格式串分隔符：若格式串写成 `\"%d,%d\"`，输入时两数之间**必须原样输入英文逗号**（如 `3,4`）；若写成 `\"%d%d\"`，输入时可用空格、回车或 Tab 分隔。==`scanf` 格式控制串中严禁指定小数精度（如 `scanf(\"%5.2f\", &x)` 非法）==。", "`getchar()` 与 `putchar(ch)`：需包含 `<stdio.h>`；`getchar()` 每次从缓冲区读取 1 个字符（含回车 `''\\n''`），`putchar(ch)` 输出单个字符。"]}, {"id": "s1-3-2-b3", "t": "code", "imp": "important", "title": "宽度修饰与格式化输入输出示例", "lang": "c", "code": "#include <stdio.h>\n\nint main(void) {\n    int a = 12;\n    double y = 3.14159;\n    /* %4d 右对齐补2空格，%6.2f 共占6列保留2位小数，%% 输出百分号本身 */\n    printf(\"|%4d|%-4d|%6.2f|100%%|\\n\", a, a, y);\n    return 0;\n}"}]'::jsonb, '', 'S1-3.2 输入输出函数的调用，正确输入数据并正确设计输出格式。 printf / scanf 格式控制符与宽度精度修饰表 格式符 对应类型与含义 printf 输出特性 scanf 输入特性与陷阱 %d / %u 十进制有符号 / 无符号整型 %5d 右对齐占 5 列，%-5d 左对齐，%05d 补前导 0 %3d 表示最多截取 3 位数字读入 %o / %x 八进制 / 十六进制无符号整数 默认不带前缀 0 或 0x（加 # 如 %#x 才带前缀） 可按八进制或十六进制读入整数 %f / %lf 小数形式浮点数 printf 中 %f 默认输出 6 位小数；%.2f 四舍五入保留 2 位小数 scanf 读 float 用 %f，读 double 必须用 %lf %c 单个字符 输出 1 个字符 空格、回车、Tab 都会被 %c 当作有效字符读入 %s 字符串 从首地址起输出直到遇 ''\0'' 遇空格、Tab 或回车即停止读入；参数直接传字符数组名，不加 & scanf 与字符输入输出（getchar / putchar）必记规则 scanf 参数必须传地址：普通变量前必须加取地址符 &（如 scanf("%d", &a);），而字符数组名本身代表首元素地址，因此 scanf("%s", str); 前不加 &。 scanf 格式串分隔符：若格式串写成 "%d,%d"，输入时两数之间必须原样输入英文逗号（如 3,4）；若写成 "%d%d"，输入时可用空格、回车或 Tab 分隔。scanf 格式控制串中严禁指定小数精度（如 scanf("%5.2f", &x) 非法）。 getchar() 与 putchar(ch)：需包含 <stdio.h>；getchar() 每次从缓冲区读取 1 个字符（含回车 ''\n''），putchar(ch) 输出单个字符。 宽度修饰与格式化输入输出示例 #include <stdio.h>

int main(void) {
    int a = 12;
    double y = 3.14159;
    /* %4d 右对齐补2空格，%6.2f 共占6列保留2位小数，%% 输出百分号本身 */
    printf("|%4d|%-4d|%6.2f|100%%|\n", a, a, y);
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [26, 27, 28, 29]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-4.1 用 if 语句实现选择结构。 (node_id=251)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (251, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (251, 1, '[{"id": "s1-4-1-b1", "t": "list", "imp": "core", "title": "if 语句的三种基本形式与判断规则", "ordered": false, "items": ["三种结构：① 单分支 `if (表达式) 语句;`；② 双分支 `if (表达式) 语句1; else 语句2;`；③ 多分支阶梯 `if (e1) ... else if (e2) ... else ...`（从上往下依次判断，**一旦某个分支成立并执行完毕，立即跳出整个阶梯**）。", "条件真假判定：`if` 圆括号内可以是**任意数值类型表达式**（不限于关系或逻辑表达式），==值非 0 即判为“真”，值为 0 即判为“假”==。", "子句管辖范围：若 `if` 或 `else` 后不加花括号 `{}`，则==只管辖紧随其后的第一条语句==；要控制多条语句必须使用 `{ ... }` 复合语句。"]}, {"id": "s1-4-1-b2", "t": "callout", "imp": "core", "kind": "trap", "title": "if 语句三大经典考题陷阱", "text": "① **`if (a = 5)` vs `if (a == 5)`**：`if (a = 5)` 是把 `5` 赋给 `a`，表达式值为 `5`（非 0），恒走真分支；`if (a = 0)` 表达式值为 `0`，恒走假分支。<br>② **`if (条件);` 多余分号**：圆括号后紧跟 `;` 代表空语句，后面的代码不论条件真假都会无条件执行，且若后续还有 `else` 会导致 `else` 无匹配 `if` 编译报错。<br>③ **`else` 不能单独出现**：每个 `else` 前面必须有与之配对的 `if`，且 **`else` 后绝不能直接带条件表达式**（必须写 `else if (条件)`）。"}]'::jsonb, '', 'S1-4.1 用 if 语句实现选择结构。 if 语句的三种基本形式与判断规则 三种结构：① 单分支 if (表达式) 语句;；② 双分支 if (表达式) 语句1; else 语句2;；③ 多分支阶梯 if (e1) ... else if (e2) ... else ...（从上往下依次判断，一旦某个分支成立并执行完毕，立即跳出整个阶梯）。 条件真假判定：if 圆括号内可以是任意数值类型表达式（不限于关系或逻辑表达式），值非 0 即判为“真”，值为 0 即判为“假”。 子句管辖范围：若 if 或 else 后不加花括号 {}，则只管辖紧随其后的第一条语句；要控制多条语句必须使用 { ... } 复合语句。 if 语句三大经典考题陷阱 ① if (a = 5) vs if (a  5)：if (a = 5) 是把 5 赋给 a，表达式值为 5（非 0），恒走真分支；if (a = 0) 表达式值为 0，恒走假分支。<br>② if (条件); 多余分号：圆括号后紧跟 ; 代表空语句，后面的代码不论条件真假都会无条件执行，且若后续还有 else 会导致 else 无匹配 if 编译报错。<br>③ else 不能单独出现：每个 else 前面必须有与之配对的 if，且 else 后绝不能直接带条件表达式（必须写 else if (条件)）。', '{"pdf": "操作技能复习.pdf", "pages": [30, 31]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-4.2 用 switch 语句实现多分支选择结构。 (node_id=252)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (252, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (252, 1, '[{"id": "s1-4-2-b1", "t": "list", "imp": "core", "title": "switch 多分支语法铁律与穿透（Fall-through）特性", "ordered": false, "items": ["表达式类型限制：`switch (表达式)` 括号内的表达式结果==必须是整型、字符型或枚举型==，**绝不能是实型（`float` / `double`）或字符串**。", "`case` 标号规则：每个 `case` 后必须是==整型或字符型常量表达式==（不能含变量或关系表达式如 `case x >= 60:`），且同一个 `switch` 内各 `case` 常量值**互不相同**。", "穿透执行与 `break`：`case` 仅起**入口标号**作用；一旦匹配成功（或匹配 `default`），若分支末尾==没有写 `break;`，程序会继续顺序往下执行后续所有 `case`/`default` 中的语句==，直到遇到 `break;` 或 `switch` 右花括号结束。", "`default` 位置：`default` 分支可选，且可放在 `switch` 内的任意位置；**若 `default` 放在最前面或中间且末尾未写 `break;`，同样会向下穿透执行后面的 `case` 语句**！"]}, {"id": "s1-4-2-b2", "t": "code", "imp": "important", "title": "switch 缺省 break 穿透与 default 前置典型考题", "lang": "c", "code": "#include <stdio.h>\n\nint main(void) {\n    int k = 3, s = 0;\n    switch (k) {\n        default: s += 1;      /* k=3 无匹配 case，进入 default 但无 break，向下穿透 */\n        case 1:  s += 2;\n        case 2:  s += 3; break;\n        case 4:  s += 4;\n    }\n    printf(\"s=%d\\n\", s);      /* 输出 s=6 (1 + 2 + 3) */\n    return 0;\n}"}]'::jsonb, '', 'S1-4.2 用 switch 语句实现多分支选择结构。 switch 多分支语法铁律与穿透（Fall-through）特性 表达式类型限制：switch (表达式) 括号内的表达式结果必须是整型、字符型或枚举型，绝不能是实型（float / double）或字符串。 case 标号规则：每个 case 后必须是整型或字符型常量表达式（不能含变量或关系表达式如 case x >= 60:），且同一个 switch 内各 case 常量值互不相同。 穿透执行与 break：case 仅起入口标号作用；一旦匹配成功（或匹配 default），若分支末尾没有写 break;，程序会继续顺序往下执行后续所有 case/default 中的语句，直到遇到 break; 或 switch 右花括号结束。 default 位置：default 分支可选，且可放在 switch 内的任意位置；若 default 放在最前面或中间且末尾未写 break;，同样会向下穿透执行后面的 case 语句！ switch 缺省 break 穿透与 default 前置典型考题 #include <stdio.h>

int main(void) {
    int k = 3, s = 0;
    switch (k) {
        default: s += 1;      /* k=3 无匹配 case，进入 default 但无 break，向下穿透 */
        case 1:  s += 2;
        case 2:  s += 3; break;
        case 4:  s += 4;
    }
    printf("s=%d\n", s);      /* 输出 s=6 (1 + 2 + 3) */
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [31, 32, 33]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-4.3 选择结构的嵌套。 (node_id=253)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (253, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (253, 1, '[{"id": "s1-4-3-b1", "t": "list", "imp": "core", "title": "if-else 嵌套配对原则与 switch 嵌套", "ordered": false, "items": ["`else` 就近配对原则：在没有花括号 `{}` 强制界定时，==`else` 总是与它前面最近的、且尚未配对的 `if` 相配对==，**与代码的缩进对齐位置完全无关**。", "改变配对关系：若希望 `else` 与外层 `if` 配对，必须用花括号 `{ ... }` 将内层 `if` 语句包裹成复合语句。", "`switch` 嵌套里的 `break`：在嵌套的 `switch` 结构中，`break;` ==只跳出它直接所在的那一层内层 `switch`==，不会直接跳出外层 `switch`。"]}, {"id": "s1-4-3-b2", "t": "code", "imp": "important", "title": "悬空 else 就近配对真题演示", "lang": "c", "code": "#include <stdio.h>\n\nint main(void) {\n    int a = 2, b = -1, c = 2;\n    if (a < b)\n        if (b < 0) c = 0;\n    else c += 1;              /* 注意：此 else 实际与内层 if (b < 0) 配对！ */\n    printf(\"c=%d\\n\", c);      /* 因外层 a < b 为假，内层 if-else 整体跳过，c 仍为 2 */\n    return 0;\n}"}]'::jsonb, '', 'S1-4.3 选择结构的嵌套。 if-else 嵌套配对原则与 switch 嵌套 else 就近配对原则：在没有花括号 {} 强制界定时，else 总是与它前面最近的、且尚未配对的 if 相配对，与代码的缩进对齐位置完全无关。 改变配对关系：若希望 else 与外层 if 配对，必须用花括号 { ... } 将内层 if 语句包裹成复合语句。 switch 嵌套里的 break：在嵌套的 switch 结构中，break; 只跳出它直接所在的那一层内层 switch，不会直接跳出外层 switch。 悬空 else 就近配对真题演示 #include <stdio.h>

int main(void) {
    int a = 2, b = -1, c = 2;
    if (a < b)
        if (b < 0) c = 0;
    else c += 1;              /* 注意：此 else 实际与内层 if (b < 0) 配对！ */
    printf("c=%d\n", c);      /* 因外层 a < b 为假，内层 if-else 整体跳过，c 仍为 2 */
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [34, 35]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-5.1 for 循环结构。 (node_id=255)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (255, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (255, 1, '[{"id": "s1-5-1-b1", "t": "list", "imp": "core", "title": "for (表达式1; 表达式2; 表达式3) 执行顺序与省略规则", "ordered": true, "items": ["先求解一次 **表达式1**（循环变量赋初值，**整个循环只执行 1 次**）。", "求解 **表达式2**（循环条件）：若为真（非 0），则执行循环体语句，然后转第 3 步；若为假（0），立即结束循环。", "每次循环体执行完毕后，求解 **表达式3**（循环变量步进更新），随后回到第 2 步继续判断表达式2。", "三个表达式均可省略，但==两个分号 `;` 绝对不能省==：省略**表达式2**时条件==默认恒为真==（如 `for (;;)` 构成无限循环，需靠内部 `break` 退出）。"]}, {"id": "s1-5-1-b2", "t": "callout", "imp": "core", "kind": "trap", "title": "for 循环条件中的赋值号与末尾分号陷阱", "text": "① **条件写赋值号**：如 `for (i = 0; i = 0; i++)`，表达式2为赋值表达式 `i = 0`（值为 0 即假），循环体 **1 次也不执行**；若写 `for (i = 0; i = 1; i++)` 则表达式2恒为 1，变成**死循环**。<br>② **括号后误加分号**：如 `for (i = 0; i < 5; i++); printf(\"%d\", i);`，分号使循环体为空语句，空转 5 次后退出循环时 `i` 变为 `5`，最后仅打印一次 `5`。"}]'::jsonb, '', 'S1-5.1 for 循环结构。 for (表达式1; 表达式2; 表达式3) 执行顺序与省略规则 先求解一次 表达式1（循环变量赋初值，整个循环只执行 1 次）。 求解 表达式2（循环条件）：若为真（非 0），则执行循环体语句，然后转第 3 步；若为假（0），立即结束循环。 每次循环体执行完毕后，求解 表达式3（循环变量步进更新），随后回到第 2 步继续判断表达式2。 三个表达式均可省略，但两个分号 ; 绝对不能省：省略表达式2时条件默认恒为真（如 for (;;) 构成无限循环，需靠内部 break 退出）。 for 循环条件中的赋值号与末尾分号陷阱 ① 条件写赋值号：如 for (i = 0; i = 0; i++)，表达式2为赋值表达式 i = 0（值为 0 即假），循环体 1 次也不执行；若写 for (i = 0; i = 1; i++) 则表达式2恒为 1，变成死循环。<br>② 括号后误加分号：如 for (i = 0; i < 5; i++); printf("%d", i);，分号使循环体为空语句，空转 5 次后退出循环时 i 变为 5，最后仅打印一次 5。', '{"pdf": "操作技能复习.pdf", "pages": [35, 36, 37]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-5.2 while 和 do-while 循环结构。 (node_id=256)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (256, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (256, 1, '[{"id": "s1-5-2-b1", "t": "table", "imp": "core", "title": "while 与 do-while 循环结构核心对比", "headers": ["对比维度", "while (表达式) 循环体", "do { 循环体 } while (表达式);"], "rows": [["执行先后顺序", "==先判断条件，后执行循环体==（当型循环）", "==先执行一次循环体，后判断条件==（直到型循环）"], ["最少执行次数", "初始条件为假时，循环体执行 **0 次**", "无论初始条件真假，循环体==至少执行 1 次=="], ["末尾分号要求", "`while (表达式)` 圆括号后**不能**加分号（否则成空语句）", "==`do { ... } while (表达式);` 末尾分号 `;` 绝对不能省略=="], ["循环次数关系", "当第一次判断条件为真时，两者执行效果与次数相同", "当第一次判断条件为假时，`do-while` 比 `while` 多执行 1 次"]]}, {"id": "s1-5-2-b2", "t": "code", "imp": "important", "title": "while 条件带后置自减的求值追踪", "lang": "c", "code": "#include <stdio.h>\n\nint main(void) {\n    int n = 3, count = 0;\n    while (n--) {             /* 依次用 3, 2, 1 判断为真进入循环；最后用 0 判断为假后 n 变为 -1 */\n        count++;\n    }\n    printf(\"count=%d, n=%d\\n\", count, n); /* 输出 count=3, n=-1 */\n    return 0;\n}"}]'::jsonb, '', 'S1-5.2 while 和 do-while 循环结构。 while 与 do-while 循环结构核心对比 对比维度 while (表达式) 循环体 do { 循环体 } while (表达式); 执行先后顺序 先判断条件，后执行循环体（当型循环） 先执行一次循环体，后判断条件（直到型循环） 最少执行次数 初始条件为假时，循环体执行 0 次 无论初始条件真假，循环体至少执行 1 次 末尾分号要求 while (表达式) 圆括号后不能加分号（否则成空语句） do { ... } while (表达式); 末尾分号 ; 绝对不能省略 循环次数关系 当第一次判断条件为真时，两者执行效果与次数相同 当第一次判断条件为假时，do-while 比 while 多执行 1 次 while 条件带后置自减的求值追踪 #include <stdio.h>

int main(void) {
    int n = 3, count = 0;
    while (n--) {             /* 依次用 3, 2, 1 判断为真进入循环；最后用 0 判断为假后 n 变为 -1 */
        count++;
    }
    printf("count=%d, n=%d\n", count, n); /* 输出 count=3, n=-1 */
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [37, 38]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-5.3 continue 语句和 break 语句。 (node_id=257)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (257, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (257, 1, '[{"id": "s1-5-3-b1", "t": "table", "imp": "core", "title": "break 与 continue 语句全方位对比（高频必考）", "headers": ["对比项", "break 语句", "continue 语句"], "rows": [["适用范围", "可用于 **循环结构**（`for/while/do-while`）和 **`switch` 语句**", "==只能用于循环结构==，绝不能单独用于 `switch` 或 `if`"], ["执行效果", "==立即终止并跳出当前整层循环==（或跳出当前 `switch`）", "==仅跳过本轮循环体剩余未执行的语句==，直接开启下一轮循环"], ["在 `for` 中的跳转目标", "直接跳到 `for` 循环结构之后的第一条语句", "先跳转到 **`表达式3`（步进更新）**，再判断 `表达式2`"], ["在 `while / do-while` 中", "直接跳出当前循环", "直接跳转到 **`while (表达式)` 条件判断处**（若步进写在 `continue` 之后会造成死循环）"]]}, {"id": "s1-5-3-b2", "t": "code", "imp": "important", "title": "for 循环中 continue 与 break 效果对比", "lang": "c", "code": "#include <stdio.h>\n\nint main(void) {\n    int i, sum = 0;\n    for (i = 1; i <= 5; i++) {\n        if (i == 2) continue; /* 跳过 i=2，直接去执行 i++ 进入 i=3 */\n        if (i == 4) break;    /* 当 i=4 时直接终止整个 for 循环 */\n        sum += i;\n    }\n    printf(\"sum=%d, i=%d\\n\", sum, i); /* sum = 1 + 3 = 4, i = 4 */\n    return 0;\n}"}]'::jsonb, '', 'S1-5.3 continue 语句和 break 语句。 break 与 continue 语句全方位对比（高频必考） 对比项 break 语句 continue 语句 适用范围 可用于 循环结构（for/while/do-while）和 switch 语句 只能用于循环结构，绝不能单独用于 switch 或 if 执行效果 立即终止并跳出当前整层循环（或跳出当前 switch） 仅跳过本轮循环体剩余未执行的语句，直接开启下一轮循环 在 for 中的跳转目标 直接跳到 for 循环结构之后的第一条语句 先跳转到 表达式3（步进更新），再判断 表达式2 在 while / do-while 中 直接跳出当前循环 直接跳转到 while (表达式) 条件判断处（若步进写在 continue 之后会造成死循环） for 循环中 continue 与 break 效果对比 #include <stdio.h>

int main(void) {
    int i, sum = 0;
    for (i = 1; i <= 5; i++) {
        if (i  2) continue; /* 跳过 i=2，直接去执行 i++ 进入 i=3 */
        if (i  4) break;    /* 当 i=4 时直接终止整个 for 循环 */
        sum += i;
    }
    printf("sum=%d, i=%d\n", sum, i); /* sum = 1 + 3 = 4, i = 4 */
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [38, 39]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-5.4 循环的嵌套。 (node_id=258)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (258, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (258, 1, '[{"id": "s1-5-4-b1", "t": "list", "imp": "core", "title": "多重循环执行次数与内层 break 作用范围", "ordered": false, "items": ["执行规律：==外层循环变量每变化 1 次，内层循环就要完整地从头到尾执行 1 轮==。若外层执行 $M$ 次、内层独立执行 $N$ 次，则内层循环体总共执行 $M \\times N$ 次。", "内层与外层耦合：若内层循环的初值或条件依赖外层变量（如 `for (i = 0; i < 4; i++) for (j = i; j < 4; j++)`），需逐轮列表累加（如 $4 + 3 + 2 + 1 = 10$ 次）。", "嵌套中的 `break` 与 `continue`：内层循环中的 `break` ==只能跳出内层循环本身==，外层循环仍会继续进入下一轮！"]}, {"id": "s1-5-4-b2", "t": "code", "imp": "important", "title": "二重循环嵌套与内层 break 计数示例", "lang": "c", "code": "#include <stdio.h>\n\nint main(void) {\n    int i, j, cnt = 0;\n    for (i = 1; i <= 3; i++) {\n        for (j = 1; j <= 3; j++) {\n            if (j > i) break; /* 仅退出内层 j 循环，外层 i 继续下一轮 */\n            cnt++;\n        }\n    }\n    printf(\"cnt=%d\\n\", cnt);  /* i=1 计1次, i=2 计2次, i=3 计3次，共 6 次 */\n    return 0;\n}"}]'::jsonb, '', 'S1-5.4 循环的嵌套。 多重循环执行次数与内层 break 作用范围 执行规律：外层循环变量每变化 1 次，内层循环就要完整地从头到尾执行 1 轮。若外层执行 $M$ 次、内层独立执行 $N$ 次，则内层循环体总共执行 $M \times N$ 次。 内层与外层耦合：若内层循环的初值或条件依赖外层变量（如 for (i = 0; i < 4; i++) for (j = i; j < 4; j++)），需逐轮列表累加（如 $4 + 3 + 2 + 1 = 10$ 次）。 嵌套中的 break 与 continue：内层循环中的 break 只能跳出内层循环本身，外层循环仍会继续进入下一轮！ 二重循环嵌套与内层 break 计数示例 #include <stdio.h>

int main(void) {
    int i, j, cnt = 0;
    for (i = 1; i <= 3; i++) {
        for (j = 1; j <= 3; j++) {
            if (j > i) break; /* 仅退出内层 j 循环，外层 i 继续下一轮 */
            cnt++;
        }
    }
    printf("cnt=%d\n", cnt);  /* i=1 计1次, i=2 计2次, i=3 计3次，共 6 次 */
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [39]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-6.1 一维数组的定义、初始化和数组元素的引用。 (node_id=260)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (260, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (260, 1, '[{"id": "s1-6-1-b1", "t": "list", "imp": "core", "title": "一维数组的定义、初始化与下标越界规则", "ordered": false, "items": ["定义语法：`类型说明符 数组名[常量表达式];`——方括号内的长度==必须是正整型常量表达式==（标准 C89 不允许用普通变量定义数组长度，如 `int n=5; int a[n];` 判错）。", "初始化规则：① 全部初始化时可省略长度，如 `int a[] = {1, 2, 3, 4};`（数组长度自动定为 4，占 `4*4=16` 字节）；② ==部分初始化时，未赋初值的剩余元素自动补 `0`==（如 `int a[10] = {0};` 将全部 10 个元素清零）；③ **局部数组若完全不初始化，各元素值为不确定的随机数**；④ 初值个数绝不能超过数组定义长度。", "下标与引用：长度为 `N` 的数组，==合法下标范围是 `0` 到 `N - 1`==（`a[N]` 已属于下标越界！）；C 语言不能用数组名整体输入输出普通整型数组，必须通过循环逐个元素访问。", "数组名的本质：==一维数组名是代表首元素地址（`&a[0]`）的地址常量==，不能对其赋值或自增（如 **`a++` 或 `a = b` 均编译报错**）。"]}, {"id": "s1-6-1-b2", "t": "code", "imp": "important", "title": "一维数组部分初始化与 sizeof 计算元素个数", "lang": "c", "code": "#include <stdio.h>\n\nint main(void) {\n    int a[] = {10, 20, 30, 40};\n    int b[5] = {1, 2};        /* b[0]=1, b[1]=2, b[2]~b[4] 自动补 0 */\n    int len = (int)(sizeof(a) / sizeof(a[0]));\n    printf(\"len=%d, b[4]=%d\\n\", len, b[4]);\n    return 0;\n}"}]'::jsonb, '', 'S1-6.1 一维数组的定义、初始化和数组元素的引用。 一维数组的定义、初始化与下标越界规则 定义语法：类型说明符 数组名[常量表达式];——方括号内的长度必须是正整型常量表达式（标准 C89 不允许用普通变量定义数组长度，如 int n=5; int a[n]; 判错）。 初始化规则：① 全部初始化时可省略长度，如 int a[] = {1, 2, 3, 4};（数组长度自动定为 4，占 4*4=16 字节）；② 部分初始化时，未赋初值的剩余元素自动补 0（如 int a[10] = {0}; 将全部 10 个元素清零）；③ 局部数组若完全不初始化，各元素值为不确定的随机数；④ 初值个数绝不能超过数组定义长度。 下标与引用：长度为 N 的数组，合法下标范围是 0 到 N - 1（a[N] 已属于下标越界！）；C 语言不能用数组名整体输入输出普通整型数组，必须通过循环逐个元素访问。 数组名的本质：一维数组名是代表首元素地址（&a[0]）的地址常量，不能对其赋值或自增（如 a++ 或 a = b 均编译报错）。 一维数组部分初始化与 sizeof 计算元素个数 #include <stdio.h>

int main(void) {
    int a[] = {10, 20, 30, 40};
    int b[5] = {1, 2};        /* b[0]=1, b[1]=2, b[2]~b[4] 自动补 0 */
    int len = (int)(sizeof(a) / sizeof(a[0]));
    printf("len=%d, b[4]=%d\n", len, b[4]);
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [40, 41]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-6.2 二维数组的定义、初始化和数组元素的引用。 (node_id=261)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (261, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (261, 1, '[{"id": "s1-6-2-b1", "t": "list", "imp": "core", "title": "二维数组按行存储、省行不省列与初始化对比", "ordered": false, "items": ["定义与省维铁律：`类型名 数组名[行数][列数];` 在初始化时，==第一维（行数）可以省略，但第二维（列数）绝对不能省略==！例如 `int a[][3] = {1, 2, 3, 4};` 合法（共 4 个元素，每行 3 列，自动折算为 **2 行**，占 `2*3*4 = 24` 字节）；而 `int a[2][] = {1,2,3,4};` 非法。", "按行优先顺序存储：内存中二维数组严格按**先行后列**顺序连续存放（先存 `a[0][0], a[0][1]...`，再存 `a[1][0]...`）。", "分行初始化 vs 连续初始化：`int a[3][2] = {{1}, {2}, {3}};` 是给每行的第 0 列赋值（`a[0][0]=1, a[1][0]=2, a[2][0]=3`）；而 `int b[3][2] = {1, 2, 3};` 是按行顺序依次赋给 `b[0][0]=1, b[0][1]=2, b[1][0]=3`，其余补 `0`。"]}, {"id": "s1-6-2-b2", "t": "callout", "imp": "core", "kind": "trap", "title": "引用二维数组元素的下标写法陷阱", "text": "引用二维数组元素必须写成双中括号 ==`a[i][j]`==，**绝不能写成数学矩阵式的 `a[i, j]`**！在 C 语言中，`a[i, j]` 括号内是逗号表达式（值为 `j`），实际等价于行地址偏移 `a[j]`，并非第 `i` 行第 `j` 列元素。"}]'::jsonb, '', 'S1-6.2 二维数组的定义、初始化和数组元素的引用。 二维数组按行存储、省行不省列与初始化对比 定义与省维铁律：类型名 数组名[行数][列数]; 在初始化时，第一维（行数）可以省略，但第二维（列数）绝对不能省略！例如 int a[][3] = {1, 2, 3, 4}; 合法（共 4 个元素，每行 3 列，自动折算为 2 行，占 2*3*4 = 24 字节）；而 int a[2][] = {1,2,3,4}; 非法。 按行优先顺序存储：内存中二维数组严格按先行后列顺序连续存放（先存 a[0][0], a[0][1]...，再存 a[1][0]...）。 分行初始化 vs 连续初始化：int a[3][2] = {{1}, {2}, {3}}; 是给每行的第 0 列赋值（a[0][0]=1, a[1][0]=2, a[2][0]=3）；而 int b[3][2] = {1, 2, 3}; 是按行顺序依次赋给 b[0][0]=1, b[0][1]=2, b[1][0]=3，其余补 0。 引用二维数组元素的下标写法陷阱 引用二维数组元素必须写成双中括号 a[i][j]，绝不能写成数学矩阵式的 a[i, j]！在 C 语言中，a[i, j] 括号内是逗号表达式（值为 j），实际等价于行地址偏移 a[j]，并非第 i 行第 j 列元素。', '{"pdf": "操作技能复习.pdf", "pages": [41, 42]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-6.3 字符串与字符数组。 (node_id=262)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (262, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (262, 1, '[{"id": "s1-6-3-b1", "t": "list", "imp": "core", "title": "字符数组初始化与字符串结束标志 ''\\0''", "ordered": false, "items": ["字符串结束标志：C 语言没有专用字符串变量类型，用字符数组存放字符串，依靠 ==`''\\0''`（ASCII 码为 0）== 作为结束标志。", "两种初始化的字节数差异：`char s1[] = \"abc\";` 自动在末尾补 `''\\0''`，因此 ==`sizeof(s1)` 为 4，`strlen(s1)` 为 3==；而逐字符初始化 `char s2[] = {''a'', ''b'', ''c''};` 不含 `''\\0''`，==`sizeof(s2)` 为 3==（不可直接对其调用 `strlen` 或 `%s` 打印）。", "字符数组不能直接用 `=` 赋值或用 `==` 比较内容：定义之后写 `char s[10]; s = \"hello\";` **编译报错**（必须用 `strcpy(s, \"hello\")`）；比较两个字符串是否相等必须用 ==`strcmp(s1, s2) == 0`==，写 `s1 == s2` 只是比较首地址！"]}, {"id": "s1-6-3-b2", "t": "table", "imp": "core", "title": "常用字符串处理函数对照表（需 #include <string.h>）", "headers": ["函数原型 / 用法", "功能说明", "高频考点与必记细节"], "rows": [["`strlen(s)`", "求字符串有效长度", "从首地址数到**第一个 `''\\0''` 为止，==不计入 `''\\0''` 本身==**；如 `strlen(\"a\\0bc\")` 为 `1`"], ["`strcpy(dest, src)`", "将 `src`（含 `''\\0''`）复制到 `dest`", "`dest` 必须是足够大的字符数组，覆盖原有内容"], ["`strcat(dest, src)`", "把 `src` 追加到 `dest` 末尾", "从 `dest` 原有的 `''\\0''` 位置开始覆盖连接，末尾自动保留 `''\\0''`"], ["`strcmp(s1, s2)`", "自左向右逐字符按 ASCII 码比较", "`s1 == s2` 返回 ==`0`==；遇首个不同字符若 `s1[i] > s2[i]` 返回**正数**，否则返回**负数**"], ["`gets(s)` / `puts(s)`", "整行读入（含空格） / 输出并自动换行", "`stdio.h` 函数：`gets` 遇回车结束并把回车换成 `''\\0''`；`puts` 输出字符串后**自动输出换行 `''\\n''`**"]]}]'::jsonb, '', 'S1-6.3 字符串与字符数组。 字符数组初始化与字符串结束标志 ''\0'' 字符串结束标志：C 语言没有专用字符串变量类型，用字符数组存放字符串，依靠 ''\0''（ASCII 码为 0） 作为结束标志。 两种初始化的字节数差异：char s1[] = "abc"; 自动在末尾补 ''\0''，因此 sizeof(s1) 为 4，strlen(s1) 为 3；而逐字符初始化 char s2[] = {''a'', ''b'', ''c''}; 不含 ''\0''，sizeof(s2) 为 3（不可直接对其调用 strlen 或 %s 打印）。 字符数组不能直接用 = 赋值或用  比较内容：定义之后写 char s[10]; s = "hello"; 编译报错（必须用 strcpy(s, "hello")）；比较两个字符串是否相等必须用 strcmp(s1, s2)  0，写 s1  s2 只是比较首地址！ 常用字符串处理函数对照表（需 #include <string.h>） 函数原型 / 用法 功能说明 高频考点与必记细节 strlen(s) 求字符串有效长度 从首地址数到第一个 ''\0'' 为止，不计入 ''\0'' 本身；如 strlen("a\0bc") 为 1 strcpy(dest, src) 将 src（含 ''\0''）复制到 dest dest 必须是足够大的字符数组，覆盖原有内容 strcat(dest, src) 把 src 追加到 dest 末尾 从 dest 原有的 ''\0'' 位置开始覆盖连接，末尾自动保留 ''\0'' strcmp(s1, s2) 自左向右逐字符按 ASCII 码比较 s1  s2 返回 0；遇首个不同字符若 s1[i] > s2[i] 返回正数，否则返回负数 gets(s) / puts(s) 整行读入（含空格） / 输出并自动换行 stdio.h 函数：gets 遇回车结束并把回车换成 ''\0''；puts 输出字符串后自动输出换行 ''\n''', '{"pdf": "操作技能复习.pdf", "pages": [43, 44]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-6.4 使用一维数组解决批量数据查找或排序等问题。 (node_id=263)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (263, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (263, 1, '[{"id": "s1-6-4-b1", "t": "list", "imp": "core", "title": "四大常考数组算法核心模板与边界条件", "ordered": false, "items": ["最值查找（求最大值及下标）：令初值 `max = a[0], idx = 0;`（**切忌盲目设 `max = 0`，否则全负数数组会出错**），然后 `for (i = 1; i < n; i++)` 逐个比较。", "冒泡排序（Bubble Sort）：共进行 ==`n - 1` 趟==（外层 `i` 从 `0` 到 `n - 2`），第 `i` 趟内层比较相邻元素 `a[j]` 与 `a[j + 1]`（内层 `j` 从 `0` 到 ==`n - 1 - i`==）。", "选择排序（Selection Sort）：外层 `i` 从 `0` 到 `n - 2`，每趟在 `i ~ n - 1` 中找出最小元素下标 `k`，若 `k != i` 则将 `a[i]` 与 `a[k]` 交换（每趟最多交换 1 次）。", "折半查找（二分查找）：==前提是数组必须已按升序（或降序）排好序==；维护 `low = 0, high = n - 1`，当 `low <= high` 时取 `mid = (low + high) / 2` 比较。"]}, {"id": "s1-6-4-b2", "t": "code", "imp": "core", "title": "冒泡排序与折半查找标准 C 实现（程序填空高频母题）", "lang": "c", "code": "#include <stdio.h>\n\nvoid bubble_sort(int a[], int n) {\n    int i, j, temp;\n    for (i = 0; i < n - 1; i++) {\n        for (j = 0; j < n - 1 - i; j++) {\n            if (a[j] > a[j + 1]) {\n                temp = a[j];\n                a[j] = a[j + 1];\n                a[j + 1] = temp;\n            }\n        }\n    }\n}\n\nint binary_search(const int a[], int n, int key) {\n    int low = 0, high = n - 1;\n    while (low <= high) {\n        int mid = (low + high) / 2;\n        if (a[mid] == key) return mid;\n        if (a[mid] < key) low = mid + 1;\n        else high = mid - 1;\n    }\n    return -1;\n}\n\nint main(void) {\n    int arr[5] = {9, 3, 7, 1, 5};\n    bubble_sort(arr, 5);\n    printf(\"index of 7: %d\\n\", binary_search(arr, 5, 7));\n    return 0;\n}"}]'::jsonb, '', 'S1-6.4 使用一维数组解决批量数据查找或排序等问题。 四大常考数组算法核心模板与边界条件 最值查找（求最大值及下标）：令初值 max = a[0], idx = 0;（切忌盲目设 max = 0，否则全负数数组会出错），然后 for (i = 1; i < n; i++) 逐个比较。 冒泡排序（Bubble Sort）：共进行 n - 1 趟（外层 i 从 0 到 n - 2），第 i 趟内层比较相邻元素 a[j] 与 a[j + 1]（内层 j 从 0 到 n - 1 - i）。 选择排序（Selection Sort）：外层 i 从 0 到 n - 2，每趟在 i ~ n - 1 中找出最小元素下标 k，若 k != i 则将 a[i] 与 a[k] 交换（每趟最多交换 1 次）。 折半查找（二分查找）：前提是数组必须已按升序（或降序）排好序；维护 low = 0, high = n - 1，当 low <= high 时取 mid = (low + high) / 2 比较。 冒泡排序与折半查找标准 C 实现（程序填空高频母题） #include <stdio.h>

void bubble_sort(int a[], int n) {
    int i, j, temp;
    for (i = 0; i < n - 1; i++) {
        for (j = 0; j < n - 1 - i; j++) {
            if (a[j] > a[j + 1]) {
                temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
        }
    }
}

int binary_search(const int a[], int n, int key) {
    int low = 0, high = n - 1;
    while (low <= high) {
        int mid = (low + high) / 2;
        if (a[mid]  key) return mid;
        if (a[mid] < key) low = mid + 1;
        else high = mid - 1;
    }
    return -1;
}

int main(void) {
    int arr[5] = {9, 3, 7, 1, 5};
    bubble_sort(arr, 5);
    printf("index of 7: %d\n", binary_search(arr, 5, 7));
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [45, 46, 47, 48, 49]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-7.1 库函数的正确调用。 (node_id=265)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (265, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (265, 1, '[{"id": "s1-7-1-b1", "t": "table", "imp": "core", "title": "常考标准库函数与所属头文件速查表", "headers": ["头文件", "代表库函数", "参数与返回值类型", "高频考试要点"], "rows": [["`<math.h>`", "`sqrt(x)`、`pow(x, y)`、`fabs(x)`", "参数与返回值均为 ==`double`==", "`fabs(x)` 求浮点数绝对值；求整数绝对值用 `<stdlib.h>` 的 `abs(n)`"], ["`<math.h>`", "`ceil(x)`、`floor(x)`", "返回 `double`", "`ceil(3.2)=4.0`（向上取整），`floor(-3.2)=-4.0`（向下取整）"], ["`<ctype.h>`", "`isalpha(c)`、`isdigit(c)`、`isupper(c)`、`islower(c)`、`tolower(c)`、`toupper(c)`", "`int`", "判断字母/数字/大小写及大小写转换；不记函数时可用 `''0''<=c && c<=''9''` 替代"], ["`<stdlib.h>`", "`rand()`、`srand(seed)`、`malloc(size)`、`free(p)`、`exit(0)`", "见说明", "`rand() % (b - a + 1) + a` 生成 `[a, b]` 闭区间随机整数"]]}]'::jsonb, '', 'S1-7.1 库函数的正确调用。 常考标准库函数与所属头文件速查表 头文件 代表库函数 参数与返回值类型 高频考试要点 <math.h> sqrt(x)、pow(x, y)、fabs(x) 参数与返回值均为 double fabs(x) 求浮点数绝对值；求整数绝对值用 <stdlib.h> 的 abs(n) <math.h> ceil(x)、floor(x) 返回 double ceil(3.2)=4.0（向上取整），floor(-3.2)=-4.0（向下取整） <ctype.h> isalpha(c)、isdigit(c)、isupper(c)、islower(c)、tolower(c)、toupper(c) int 判断字母/数字/大小写及大小写转换；不记函数时可用 ''0''<=c && c<=''9'' 替代 <stdlib.h> rand()、srand(seed)、malloc(size)、free(p)、exit(0) 见说明 rand() % (b - a + 1) + a 生成 [a, b] 闭区间随机整数', '{"pdf": "操作技能复习.pdf", "pages": [50, 51, 52, 53]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-7.2 用户自定义函数的定义、类型与返回值。 (node_id=266)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (266, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (266, 1, '[{"id": "s1-7-2-b1", "t": "list", "imp": "core", "title": "函数定义语法、返回类型与原型声明规则", "ordered": false, "items": ["函数不能嵌套定义：==C 语言中所有函数都是平行的，绝不允许在一个函数体内部定义另一个函数==（但允许嵌套调用）。", "形参表独立声明：函数首部形参必须**各自独立写出类型名**，如 `int max(int a, int b)` 正确，==写成 `int max(int a, b)` 编译报错==！且函数首部圆括号后**不能加分号**（加分号是函数原型声明而非函数定义）。", "返回值类型看齐：函数返回值类型==以函数首部定义的类型为准==；若 `return` 表达式类型与函数返回类型不一致，系统自动将其转换为函数定义的类型（如 `int f(void) { return 3.8; }` 实际返回 `3`）；无返回值函数必须声明为 `void`。", "先声明后调用：若自定义函数写在 `main` 函数之后，必须在调用前写出**函数原型声明**（如 `int max(int, int);`，声明中形参名可省略，末尾必有分号）。"]}]'::jsonb, '', 'S1-7.2 用户自定义函数的定义、类型与返回值。 函数定义语法、返回类型与原型声明规则 函数不能嵌套定义：C 语言中所有函数都是平行的，绝不允许在一个函数体内部定义另一个函数（但允许嵌套调用）。 形参表独立声明：函数首部形参必须各自独立写出类型名，如 int max(int a, int b) 正确，写成 int max(int a, b) 编译报错！且函数首部圆括号后不能加分号（加分号是函数原型声明而非函数定义）。 返回值类型看齐：函数返回值类型以函数首部定义的类型为准；若 return 表达式类型与函数返回类型不一致，系统自动将其转换为函数定义的类型（如 int f(void) { return 3.8; } 实际返回 3）；无返回值函数必须声明为 void。 先声明后调用：若自定义函数写在 main 函数之后，必须在调用前写出函数原型声明（如 int max(int, int);，声明中形参名可省略，末尾必有分号）。', '{"pdf": "操作技能复习.pdf", "pages": [54]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-7.3 函数的正确调用、参数的值传递。 (node_id=267)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (267, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (267, 1, '[{"id": "s1-7-3-b1", "t": "list", "imp": "core", "title": "实参形参内存关系与单向值传递 vs 地址传递", "ordered": false, "items": ["形参生命周期：==形式参数只有在函数被调用时才分配内存单元==，调用结束立即释放；实参与形参占据**不同的内存单元**。", "单向值传递铁律：C 语言参数传递本质是==实参向形参“单向传递值”==。当传递普通变量值时，**在函数内部修改形参的值，绝对不会改变主调函数中实参的值**！", "地址传递（指针或数组名作参数）：若要让被调函数修改主调函数中的变量，必须传递**变量的地址（指针）**或**数组名（首地址）**，在被调函数中通过 `*p` 解引用或 `arr[i]` 下标修改原内存单元。"]}, {"id": "s1-7-3-b2", "t": "code", "imp": "core", "title": "传值失败 vs 传址成功（交换两数经典对比）", "lang": "c", "code": "#include <stdio.h>\n\nvoid swap_val(int x, int y) { /* 传值：仅交换形参副本，实参 a, b 丝毫未变 */\n    int t = x; x = y; y = t;\n}\n\nvoid swap_ptr(int *x, int *y) { /* 传址：通过指针解引用修改实参内存 */\n    int t = *x; *x = *y; *y = t;\n}\n\nint main(void) {\n    int a = 3, b = 5;\n    swap_val(a, b);\n    printf(\"after swap_val: a=%d, b=%d\\n\", a, b); /* 仍为 3, 5 */\n    swap_ptr(&a, &b);\n    printf(\"after swap_ptr: a=%d, b=%d\\n\", a, b); /* 变为 5, 3 */\n    return 0;\n}"}]'::jsonb, '', 'S1-7.3 函数的正确调用、参数的值传递。 实参形参内存关系与单向值传递 vs 地址传递 形参生命周期：形式参数只有在函数被调用时才分配内存单元，调用结束立即释放；实参与形参占据不同的内存单元。 单向值传递铁律：C 语言参数传递本质是实参向形参“单向传递值”。当传递普通变量值时，在函数内部修改形参的值，绝对不会改变主调函数中实参的值！ 地址传递（指针或数组名作参数）：若要让被调函数修改主调函数中的变量，必须传递变量的地址（指针）或数组名（首地址），在被调函数中通过 *p 解引用或 arr[i] 下标修改原内存单元。 传值失败 vs 传址成功（交换两数经典对比） #include <stdio.h>

void swap_val(int x, int y) { /* 传值：仅交换形参副本，实参 a, b 丝毫未变 */
    int t = x; x = y; y = t;
}

void swap_ptr(int *x, int *y) { /* 传址：通过指针解引用修改实参内存 */
    int t = *x; *x = *y; *y = t;
}

int main(void) {
    int a = 3, b = 5;
    swap_val(a, b);
    printf("after swap_val: a=%d, b=%d\n", a, b); /* 仍为 3, 5 */
    swap_ptr(&a, &b);
    printf("after swap_ptr: a=%d, b=%d\n", a, b); /* 变为 5, 3 */
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [55, 56]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-7.4 函数的嵌套调用、递归调用。 (node_id=268)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (268, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (268, 1, '[{"id": "s1-7-4-b1", "t": "list", "imp": "core", "title": "递归调用两大要素与展开追踪方法", "ordered": false, "items": ["递归定义：函数直接或间接地在函数体内**调用其自身**称为递归调用。", "递归两大必备条件：① ==必须有明确的递归终止条件（基例 / 边界条件）==，否则会导致栈溢出无限递归；② 每次递归调用都在向终止条件逼近（问题规模缩小）。", "做题追踪法：先顺着递推式一层层往下写到终止条件（“递”阶段），再从终止条件的值一层层往回代算（“归”阶段）。常见母题：阶乘 $n!$、斐波那契数列 $F(n)=F(n-1)+F(n-2)$、进制转换逆序打印。"]}, {"id": "s1-7-4-b2", "t": "code", "imp": "important", "title": "递归求阶乘与逆序打印数字示例", "lang": "c", "code": "#include <stdio.h>\n\nint fact(int n) {\n    if (n <= 1) return 1;     /* 递归终止条件 */\n    return n * fact(n - 1);   /* 递推关系 */\n}\n\nint main(void) {\n    printf(\"5! = %d\\n\", fact(5)); /* 输出 120 */\n    return 0;\n}"}]'::jsonb, '', 'S1-7.4 函数的嵌套调用、递归调用。 递归调用两大要素与展开追踪方法 递归定义：函数直接或间接地在函数体内调用其自身称为递归调用。 递归两大必备条件：① 必须有明确的递归终止条件（基例 / 边界条件），否则会导致栈溢出无限递归；② 每次递归调用都在向终止条件逼近（问题规模缩小）。 做题追踪法：先顺着递推式一层层往下写到终止条件（“递”阶段），再从终止条件的值一层层往回代算（“归”阶段）。常见母题：阶乘 $n!$、斐波那契数列 $F(n)=F(n-1)+F(n-2)$、进制转换逆序打印。 递归求阶乘与逆序打印数字示例 #include <stdio.h>

int fact(int n) {
    if (n <= 1) return 1;     /* 递归终止条件 */
    return n * fact(n - 1);   /* 递推关系 */
}

int main(void) {
    printf("5! = %d\n", fact(5)); /* 输出 120 */
    return 0;
}', '{"pdf": "操作技能复习.pdf", "pages": [56, 57]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- S1-7.5 局部变量与全局变量。 (node_id=269)
INSERT INTO kb_entry (node_id, status, published_rev, updated_at) VALUES (269, 'published', 1, now()) ON CONFLICT (node_id) DO UPDATE SET status = 'published', published_rev = 1, updated_at = now();
INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref) VALUES (269, 1, '[{"id": "s1-7-5-b1", "t": "table", "imp": "core", "title": "变量作用域与四种存储类别（auto / static / register / extern）对比", "headers": ["变量类别 / 关键字", "存储区域", "生命周期", "未显式赋初值时的默认值与高频考点"], "rows": [["自动局部变量 `auto`（默认省略）", "动态存储区（栈区）", "进入函数时创建，函数返回即销毁", "未初始化时值为==不确定的随机数==；每次进入函数都会重新初始化"], ["静态局部变量 ==`static`==", "==静态存储区==", "整个程序运行期间持续存在，不随函数返回销毁", "编译时自动赋初值 ==`0`（或 `''\\0''`）==；**初始化语句只在第一次调用时生效一次，后续调用保留上次结束时的值**！"], ["全局变量（外部变量）", "静态存储区", "整个程序运行期间", "自动赋初值 ==`0`==；当局部变量与全局变量同名时，**在局部范围内局部变量优先（遮蔽全局变量）**"], ["外部声明 `extern` vs 静态全局 `static`", "静态存储区", "整个程序运行期间", "`extern` 仅作外部变量声明（不分配内存）以扩展作用域；全局变量加 `static` 则**限制仅在本源文件内可见**"]]}, {"id": "s1-7-5-b2", "t": "code", "imp": "core", "title": "static 静态局部变量保留上一次值必考真题", "lang": "c", "code": "#include <stdio.h>\n\nint fun(int a) {\n    static int k = 1;         /* 仅第一次调用时初始化为 1，之后保留上次结果 */\n    int m = 1;                /* auto 局部变量，每次调用都重新置 1 */\n    k += a;\n    m += a;\n    return k + m;\n}\n\nint main(void) {\n    int s1 = fun(2);          /* 第1次：k=3, m=3, 返回 6 */\n    int s2 = fun(2);          /* 第2次：k在3基础上+2得5, m=3, 返回 8 */\n    printf(\"s1=%d, s2=%d\\n\", s1, s2);\n    return 0;\n}"}, {"id": "s1-7-5-b3", "t": "callout", "imp": "important", "kind": "warn", "title": "综合程序设计安全规范（对应复核项 30542）", "text": "在编写文件读写与结构体数组排序程序（如学生成绩文件排序 30542）时：① 数组大小需与循环边界严格一致，防止 `a[N]` 越界；② 打开文件 `fopen` 后应在读取/写入循环结束后**只调用一次 `fclose(fp)`**，切忌在循环内重复关闭文件句柄。"}]'::jsonb, '', 'S1-7.5 局部变量与全局变量。 变量作用域与四种存储类别（auto / static / register / extern）对比 变量类别 / 关键字 存储区域 生命周期 未显式赋初值时的默认值与高频考点 自动局部变量 auto（默认省略） 动态存储区（栈区） 进入函数时创建，函数返回即销毁 未初始化时值为不确定的随机数；每次进入函数都会重新初始化 静态局部变量 static 静态存储区 整个程序运行期间持续存在，不随函数返回销毁 编译时自动赋初值 0（或 ''\0''）；初始化语句只在第一次调用时生效一次，后续调用保留上次结束时的值！ 全局变量（外部变量） 静态存储区 整个程序运行期间 自动赋初值 0；当局部变量与全局变量同名时，在局部范围内局部变量优先（遮蔽全局变量） 外部声明 extern vs 静态全局 static 静态存储区 整个程序运行期间 extern 仅作外部变量声明（不分配内存）以扩展作用域；全局变量加 static 则限制仅在本源文件内可见 static 静态局部变量保留上一次值必考真题 #include <stdio.h>

int fun(int a) {
    static int k = 1;         /* 仅第一次调用时初始化为 1，之后保留上次结果 */
    int m = 1;                /* auto 局部变量，每次调用都重新置 1 */
    k += a;
    m += a;
    return k + m;
}

int main(void) {
    int s1 = fun(2);          /* 第1次：k=3, m=3, 返回 6 */
    int s2 = fun(2);          /* 第2次：k在3基础上+2得5, m=3, 返回 8 */
    printf("s1=%d, s2=%d\n", s1, s2);
    return 0;
} 综合程序设计安全规范（对应复核项 30542） 在编写文件读写与结构体数组排序程序（如学生成绩文件排序 30542）时：① 数组大小需与循环边界严格一致，防止 a[N] 越界；② 打开文件 fopen 后应在读取/写入循环结束后只调用一次 fclose(fp)，切忌在循环内重复关闭文件句柄。', '{"pdf": "操作技能复习.pdf", "pages": [58, 59]}'::jsonb) ON CONFLICT (node_id, rev_no) DO UPDATE SET blocks = EXCLUDED.blocks, search_text = EXCLUDED.search_text, source_ref = EXCLUDED.source_ref;

-- 清理 S1-3 (247) 跨科混入的 Windows/Word 知识点并归入标准考纲三级节点
UPDATE t_knowledge_point SET node_id = 72, content = regexp_replace(content, '^> 注：[^\n]+\n+\s*', '') WHERE id = 31624;
UPDATE t_knowledge_point SET node_id = 116, content = regexp_replace(content, '^> 注：[^\n]+\n+\s*', '') WHERE id = 31920;
UPDATE t_knowledge_point SET node_id = 119, content = regexp_replace(content, '^> 注：[^\n]+\n+\s*', '') WHERE id IN (31783, 32100, 32101, 32102, 32103, 32104);

-- 将 S1 其余二级直挂知识点（node_id IN (242,247,250,254,259,264)）按关联题优先 + 标题内容关键词全量下沉到对应三级节点
WITH q_vote AS (
  SELECT k.id AS kp_id,
         q.chapter_id AS target_l3,
         ROW_NUMBER() OVER (PARTITION BY k.id ORDER BY count(*) DESC, q.chapter_id) AS rn
    FROM t_knowledge_point k
    JOIN t_question_kp x ON x.kp_id = k.id
    JOIN t_question q ON q.id = x.question_id AND NOT q.deleted
    JOIN t_chapter ch ON ch.id = q.chapter_id AND ch.parent_id = k.node_id AND ch.level = 3
   WHERE NOT k.deleted
     AND k.node_id IN (242, 247, 250, 254, 259, 264)
   GROUP BY k.id, q.chapter_id
)
UPDATE t_knowledge_point k
   SET node_id = v.target_l3
  FROM q_vote v
 WHERE k.id = v.kp_id AND v.rn = 1;

-- 对无关联题投票的剩余 S1 二级直挂知识点按标题/正文特征规则归入对应三级节点
UPDATE t_knowledge_point k
   SET node_id = CASE
     WHEN k.node_id = 242 THEN
       CASE
         WHEN k.title ~* '转换|强转' THEN 245
         WHEN k.title ~* '表达式|求值|赋值|条件运算|逗号' THEN 246
         WHEN k.title ~* '运算符|优先级|自增|自减|求余|逻辑|关系|位运算|sizeof' THEN 244
         ELSE 243
       END
     WHEN k.node_id = 247 THEN
       CASE
         WHEN k.title ~* 'printf|scanf|getchar|putchar|输入|输出|格式' OR k.content ~* 'printf|scanf' THEN 249
         ELSE 248
       END
     WHEN k.node_id = 250 THEN
       CASE
         WHEN k.title ~* 'switch|case|多分支' THEN 252
         WHEN k.title ~* '嵌套' THEN 253
         ELSE 251
       END
     WHEN k.node_id = 254 THEN
       CASE
         WHEN k.title ~* 'break|continue' THEN 257
         WHEN k.title ~* '嵌套|多重|九九|矩阵' THEN 258
         WHEN k.title ~* 'while' THEN 256
         ELSE 255
       END
     WHEN k.node_id = 259 THEN
       CASE
         WHEN k.title ~* '字符|串|strlen|strcpy|strcat|strcmp|gets|puts' THEN 262
         WHEN k.title ~* '二维|矩阵|行.*列|对角线|转置' THEN 261
         WHEN k.title ~* '排序|冒泡|选择|查找|折半|二分|最值|逆序' THEN 263
         ELSE 260
       END
     WHEN k.node_id = 264 THEN
       CASE
         WHEN k.title ~* '递归|嵌套' THEN 268
         WHEN k.title ~* '全局|局部|static|静态|extern|auto|register|作用域|存储' THEN 269
         WHEN k.title ~* '库函数|sqrt|pow|fabs|abs|rand|malloc|fopen|文件' THEN 265
         WHEN k.title ~* '传值|传址|实参|形参|指针.*参数|数组.*参数' THEN 267
         ELSE 266
       END
   END
 WHERE NOT k.deleted
   AND k.node_id IN (242, 247, 250, 254, 259, 264);

-- 修正并更新站内公告首条历史记录（UTF-8 无乱码）
UPDATE site_announcement
   SET version = '2026-11-02-5',
       history_json = jsonb_set(
         history_json,
         '{0}',
         jsonb_build_object(
           'date', '2026-11-02',
           'text', '知识点阅读器上线结构化讲义模式（S1 C语言全部 7 节 24 个考纲考点已精编上线）：新增「只看必记」背诵过滤、搜索词正文高亮、移动端宽表转卡片与登录跨端进度同步'
         )
       ),
       updated_at = now()
 WHERE id = 1;

COMMIT;
