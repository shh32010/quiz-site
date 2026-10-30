-- 知识点 73 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_73
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_73 as
select * from t_knowledge_point where id in (22203,22251,22261,22273,22285,22293,22302,22303,22354,22356,22357,22358,22367,22389,22390,22407,22440,22441,22450,22451,22476,22480,22484,22498,22518,22519,22521,22522,22532,22534,22539,22551,22555,23254,24792,24990,24993,25003,25005,25027,25029,25243,25244,25245,25247,25248,25249,25425,25760,26738,26739,26740,26741,26742,27045,27329,27330,27331,27332,27335,27336,27337,27338,27339,27340,27341,27342,27343,27763,27764,27848,27849,27869,27874,27902,27915,27939,28128,28129,28130,28132,28133,28134,28135,28139,28297,28304,28309,28399,28401,28508,28570,28571,28585,28586,28933,28961,28991,28992,29009,29010,29011,29029,29030,29036,29057,29063,29064,29065,29070,29094,29096,29102,29106,29107,29108,29120,29121,29130,29134,29144,29168,29169,29869,30157,30182,30229,31954,31973,31979,31980,31981,32097,32274,32280,32302,32673,32682,32707,32708);

update t_knowledge_point set title = $kp$程序理论$kp$, content = $kp$程序理论是研究程序的语义性质、程序设计及开发方法的理论。其基本问题是如何建立一个相对完善的理论框架，为软件的设计和开发方法提供理论依据：该框架应能提供有效描述程序规约的语言；应能定义可操作的变换方法，以便由规约构造可执行的程序；应能给出验证程序与其规约一致性的机制。相关研究形成了程序语义理论、程序逻辑理论、类型理论、程序验证理论、并发程序理论等。20 世纪 80 年代以后，随着超大规模集成电路技术日趋成熟，并行与分布式计算机系统迅速发展，特别是互联网的出现和广泛使用，大大促进了并行程序理论和网格计算理论的发展，使之成为程序理论的重要分支。$kp$, section = '' where id = 22203;
update t_knowledge_point set title = $kp$机器语言、汇编语言与高级语言$kp$, content = $kp$机器语言对机器（硬件）有依赖性，可移植性比较差。

汇编语言用助记符表示机器指令中的操作码与操作数，操作数可以直接用十进制等形式书写，程序相对容易理解。汇编语言源程序不能被计算机直接运行，需要经汇编程序翻译（汇编）之后才能被执行。

高级语言源程序需要经编译程序翻译成汇编语言程序，再经汇编得到机器语言程序；也可由编译程序直接翻译成机器语言程序。$kp$, section = '' where id = 22251;
update t_knowledge_point set title = $kp$FORTRAN 语言$kp$, content = $kp$FORTRAN 是 FORmula TRANslation（公式翻译）的缩写，是一种主要用于数值计算的面向过程的程序设计语言。

特点：接近数学公式、简单易用，是进行大型科学和工程计算的有力工具。$kp$, section = '' where id = 22261;
update t_knowledge_point set title = $kp$汇编程序、解释程序与编译程序$kp$, content = $kp$汇编程序：从汇编语言到机器语言的翻译程序。

解释程序：按源程序中指令（或语句）的执行顺序，逐条翻译并立即执行相应功能的处理程序，这种翻译方式并不形成机器语言形式的目标程序。
优点：实现算法简单，且易于在解释过程中灵活方便地插入所需要的修改和调试措施。
缺点：运行效率低。
应用：通常适合于以交互方式工作的、在调试状态下运行的、或运行时间与解释时间相差不多的程序。

编译程序：从高级语言到汇编语言（或机器语言）的翻译程序。编译程序对源程序进行翻译的方法相当于“笔译”，在执行过程中要对源程序扫描一遍或几遍，最终形成一个可在具体计算机上执行的目标程序。
优点：可以产生高效运行的目标程序，并把它保存在磁盘上，以备多次执行。
缺点：实现算法较为复杂。
应用：适合于翻译规模大、结构复杂、运行时间长的大型应用程序。$kp$, section = '' where id = 22273;
update t_knowledge_point set title = $kp$汉字输入码与相关试题解析$kp$, content = $kp$特有识别码技术：单字、双字词、三字词均可使用偏旁部首的声母降低重码，极大降低了多重码字的选字强度。

全拼码、自然码、简拼码都是有重码的。

区位码是一种无重码、码长为 4 的数字码，只要直接从键盘输入 4 个由十进制数（0～9）组成的区位码即可输入汉字。

52. 答案：CD
A 错误：CPU 包括指令译码器。
B 错误：程序计数器中存放的是当前正在执行的指令地址。
C 正确：程序计数器决定指令的执行顺序。
D 正确：通用寄存器用于存放操作数，或作为满足某种寻址方式所需要的寄存器，其位数与机器字长相等，便于使用。

53. 答案：ACD
A：十进制表示，合法。
B：以 0 开头为八进制表示，8 不属于八进制允许出现的数字，非法。
C：十六进制表示，合法。
D：二进制表示，合法。

54. 答案：ABD
A 正确：用机器语言编写的程序可以被计算机直接执行。
B 正确：编译程序或解释程序的执行方式都可以完成翻译和解释，但都需要执行相应的翻译程序。
C 错误：解释方式不生成目标程序，而是一边解释一边执行；编译方式需要执行编译程序，会生成目标程序。
D 正确：a+b+c 这类表达式属于程序设计语言中的运算成分。

55. 答案：ABCD
操作系统的四个主要作用：
（1）为运行应用程序提供支持和服务；
（2）为运行应用程序管理和分配软、硬件资源；
（3）为用户提供友善的人机界面（图形用户界面）；
（4）为开发应用程序提供高效率的平台。

56. 答案：ABD
A 正确：需求分析阶段的产物是软件需求规格说明书；确认测试是在软件系统完成集成后进行的、关键而全面的一项测试活动，依据确认测试准则针对需求规格说明进行测试，以确定所开发的软件系统能否满足规定的功能和性能要求。
B 正确：软件测试可分为单元测试、集成测试、系统测试、确认测试和验收测试。$kp$, section = '' where id = 22285;
update t_knowledge_point set title = $kp$解释程序与编译程序的区别$kp$, content = $kp$解释程序（解释器）直接解释执行源程序，或者将源程序翻译成某种中间代码后再加以执行；编译程序（编译器）则将源程序翻译成目标语言程序，然后在计算机上运行目标程序。

这两种语言处理程序的根本区别是：编译方式下，机器上运行的是与源程序等价的目标程序，源程序和编译程序都不参与目标程序的执行过程；解释方式下，解释程序和源程序（或其某种等价表示）要参与到程序的运行过程中，运行程序的控制权在解释程序。

解释方式下，翻译程序不生成独立的目标程序；而编译程序则将源程序翻译成独立保存的目标程序。$kp$, section = '' where id = 22293;
update t_knowledge_point set title = $kp$ALGOL 语言$kp$, content = $kp$ALGOL（ALGOrithmic Language）是一种早期的算法语言，已成为程序设计语言发展史上的里程碑，不但开拓了程序设计语言的研究领域，也为后来的软件自动化和软件可靠性研究奠定了基础。$kp$, section = '' where id = 22302;
update t_knowledge_point set title = $kp$BASIC 和 Visual Basic 语言$kp$, content = $kp$BASIC 是一种简单易学的计算机高级语言。Visual Basic（VB）是微软公司在 BASIC 基础上开发的一种程序设计语言，具有很强的可视化设计功能，给用户在 Windows 环境下开发软件带来了方便，是重要的多媒体编程工具语言，也为网页功能的扩展和 Web 应用提供了很大方便。$kp$, section = '' where id = 22303;
update t_knowledge_point set title = $kp$程序设计语言的分类$kp$, content = $kp$程序设计语言按其级别可以划分为机器语言、汇编语言和高级语言三大类。

① 机器语言：使用计算机指令系统的程序语言。用机器语言编写的程序全部都是二进制代码形式，可以被计算机直接执行。机器语言直接依赖机器的指令系统，不同类型甚至不同型号的计算机，其机器语言是不同的。机器语言不易记忆和理解，所编写的程序也难于修改和维护。
② 汇编语言：用助记符来代替机器指令的操作码和操作数，如用 ADD 表示加法、用 SUB 表示减法等，这样就能使它的每条指令都有明显的符号标识。用汇编语言编写程序比编写机器语言程序直观、易记忆，但汇编语言仍然是面向机器指令系统的，还保留了机器语言的各项缺点。
③ 高级语言：又称算法语言，其表示方法接近解决问题的表示方法，而且具有通用性，在一定程度上与机器无关。

高级语言的特点：易学、易用、易维护，人们可以更有效、更方便地用它来编制各种用途的计算机程序。$kp$, section = '' where id = 22354;
update t_knowledge_point set title = $kp$编译程序和解释程序$kp$, content = $kp$程序语言处理系统是系统软件的一大类，它随被处理的语言及其处理方法和处理过程的不同而不同。任何一个语言处理系统通常都包含一个翻译程序，它把一种语言的程序翻译成等价的另一种语言的程序。

源语言和源程序：被翻译的语言和程序。
目标语言和目标程序：翻译生成的语言和程序。

按照不同的翻译处理方法，可把翻译程序分为汇编程序、解释程序和编译程序三类。$kp$, section = '' where id = 22356;
update t_knowledge_point set title = $kp$语言处理系统$kp$, content = $kp$语言处理系统的作用：把用软件语言（包括汇编语言和高级语言）编写的各种程序变换成可在计算机上执行的程序，或最终的计算结果，或其他中间形式。

语言处理系统包括：
① 翻译程序；
② 正文编辑程序：用于建立和修改源程序文件；
③ 联接编辑程序：将多个分别编译或汇编过的目标程序和库文件进行组合；
④ 装入程序：将目标程序装入内存并启动执行。$kp$, section = '' where id = 22357;
update t_knowledge_point set title = $kp$翻译程序$kp$, content = $kp$程序语言处理系统随被处理的语言及其处理方法和处理过程的不同而异，但任何一个语言处理系统通常都包含一个翻译程序，它把一种语言的程序翻译成等价的另一种语言的程序。

源语言和源程序：被翻译的语言和程序。
目标语言和目标程序：翻译生成的语言和程序。

按照不同的翻译处理方法，可把翻译程序分为以下三类：

① 汇编程序（assembler）：从汇编语言到机器语言的翻译程序。
② 解释程序（Interpreter）：按源程序中指令（或语句）的执行顺序，逐条翻译并立即执行相应功能的处理程序，这种翻译方式并不形成机器语言形式的目标程序。优点：实现算法简单，易于在解释过程中灵活方便地插入所需要的修改和调试措施。缺点：运行效率低。应用：通常适合于以交互方式工作的、或在调试状态下运行的、或运行时间与解释时间相差不大的程序。
③ 编译程序（Compiler）：从高级语言到机器语言或汇编语言的翻译程序。编译程序对源程序进行翻译的方法相当于“笔译”，在执行过程中要对源程序扫描一遍或几遍，最终形成一个可在具体计算机上执行的目标程序。优点：通过编译程序的处理可以一次性地产生高效运行的目标程序，并把它保存在磁盘上，以备多次执行。缺点：实现算法较为复杂。应用：适合于翻译那些规模大、结构复杂、运行时间长的大型应用程序。$kp$, section = '' where id = 22358;
update t_knowledge_point set title = $kp$Java 语言$kp$, content = $kp$Java 语言由 SUN Microsystems 公司于 1995 年发布，是一种面向对象的、用于网络环境的程序设计语言。

基本特征：适用于网络分布环境，具有平台独立性、安全性和稳定性。$kp$, section = '' where id = 22367;
update t_knowledge_point set title = $kp$C、C++ 和 C# 语言$kp$, content = $kp$C 语言：面向过程的程序设计语言，是 1972 年至 1973 年间由 AT&T 公司 Bell 实验室的 D. M. Ritchie 在 BCPL 语言基础上设计而成的，著名的 UNIX 操作系统就是用 C 语言编写的。C 语言兼有高级程序设计语言的优点和汇编语言的效率，有效地处理了简洁性和实用性、可移植性和高效性之间的矛盾，语言表达能力强，还具有丰富的数据类型和灵活多样的运算符。

C++ 语言：以 C 语言为基础发展起来的面向对象程序设计语言。

C# 语言：微软公司开发的面向对象的高级程序设计语言。$kp$, section = '' where id = 22389;
update t_knowledge_point set title = $kp$Java 语言$kp$, content = $kp$Java 语言由 SUN Microsystems 公司于 1995 年 5 月正式对外公布，是一种面向对象的、用于网络环境的程序设计语言。

特点：适用于网络分布环境，具有平台独立性、安全性和稳定性，需要 Java 虚拟机解释执行。$kp$, section = '' where id = 22390;
update t_knowledge_point set title = $kp$C 语言和 C++ 语言$kp$, content = $kp$C 语言：1972 年至 1973 年间由 AT&T 公司 Bell 实验室的 D. M. Ritchie 在 BCPL 语言基础上设计而成，著名的 UNIX 操作系统就是用 C 语言编写的。

特点：语言与运行支撑环境分离、可移植性好、语言规模小因而相对简单、具有指针类型等；C 语言本身简洁、高度灵活、程序运行效率高。此外，C 语言中有不少操作直接对应实际机器所执行的动作，在许多场合可以代替汇编语言。

C++ 语言：以 C 语言为基础发展起来的通用程序设计语言。C++ 内置面向对象的机制，支持数据抽象，最先由 Bell 实验室的 B. Stroustrup 在 20 世纪 80 年代设计并实现，至今仍在不断发展。$kp$, section = '' where id = 22407;
update t_knowledge_point set title = $kp$ALGOL 与 PASCAL 语言$kp$, content = $kp$ALGOL（ALGOrithmic Language）语言：分别于 1960 年和 1962 年发表的 ALGOL60 报告及修改报告，已成为程序设计语言发展史上的里程碑，不但开拓了程序设计语言的研究领域，也为后来的软件自动化和软件可靠性研究奠定了基础。ALGOL 语言的语法和语义均有严格的描述，其语法描述采用了巴科斯范式（BNF），结构清晰、理论严谨。

在 ALGOL 语言基础上发展的 ALGOL 语言簇包括 ALGOL68、Simula、PASCAL 等。

PASCAL 语言：具有丰富的数据类型和灵活的控制结构，编译效率高，强调程序的可靠性和易于验证性，被称为第一个结构化程序设计语言。PASCAL 语言适用于数据处理、数值计算和系统软件开发，并曾经成为大学程序设计教学的优选语言。$kp$, section = '' where id = 22440;
update t_knowledge_point set title = $kp$C++ 语言$kp$, content = $kp$C++ 语言：以 C 语言为基础发展起来的通用程序设计语言。C++ 内置面向对象的机制，支持数据抽象，最先由 Bell 实验室的 B. Stroustrup 在 20 世纪 80 年代设计并实现，至今仍在不断发展。

C++ 语言是对 C 语言的扩充，扩充的内容绝大部分来自其他著名语言（如 Simula、ALGOL68、Ada 等）的最佳特性。由于 C++ 语言既有数据抽象和面向对象能力，运行性能高，又能与 C 语言相兼容，使得数量巨大的 C 语言程序能方便地在 C++ 语言环境中重用，因而迅速流行，成为当前面向对象程序设计的主流语言。$kp$, section = '' where id = 22441;
update t_knowledge_point set title = $kp$FORTRAN 语言$kp$, content = $kp$FORTRAN：FORmula TRANslation（公式翻译）的缩写，是一种主要用于数值计算的面向过程的程序设计语言。

特点：接近数学公式、简单易用。在处理功能上，允许复数与双精度实数运算；由于具有程序定义机制、I/O 的格式说明，允许布尔表达式、函数和子例程名作参数传递，扩充的字符处理等功能，使之也能应用于非数值运算领域。此外，FORTRAN 语言还具有块 IF 结构、DO 循环结构等，使写出的程序趋于结构化，是进行大型科学和工程计算的有力工具。$kp$, section = '' where id = 22450;
update t_knowledge_point set title = $kp$Java 语言$kp$, content = $kp$Java 语言：由 SUN Microsystems 公司于 1995 年 5 月正式对外公布的一种面向对象的、用于网络环境的程序设计语言。

特点：适用于网络分布环境，具有平台独立性、安全性和稳定性。$kp$, section = '' where id = 22451;
update t_knowledge_point set title = $kp$计算机语言的发展与分类$kp$, content = $kp$计算机语言的发展阶段：

机器语言：由 0 和 1 组成的指令。

汇编语言：用英文字母和数字表示指令。

高级语言：接近于人的自然语言和数学语言，分为面向过程的语言（非结构化的语言、结构化语言）和面向对象的语言。$kp$, section = '' where id = 22476;
update t_knowledge_point set title = $kp$其他程序设计语言$kp$, content = $kp$除了以上介绍的几种程序语言外，有影响的程序语言还有：

LISP 语言：适用于符号操作和表处理，主要用于人工智能领域。

PROLOG 语言：一种逻辑式编程语言，主要用于人工智能领域。

Ada 语言：类似于 PASCAL 语言，且易于控制并行任务和处理异常情况，适于军用。

【2007 真题】以下常用的高级程序设计语言中，主要用于数值计算的是（　）。
A．FORTRAN　B．BASIC　C．Java　D．C
【试题分析】FORTRAN 语言是一种主要用于数值计算的面向过程的程序设计语言。虽然其他语言也可以用来进行数值计算，但主要用于数值计算的应选 A。

【2007 真题】C++ 语言是以 C 语言为基础发展起来的，已成为当前面向（　）程序设计的主流语言之一。
【试题分析】C++ 语言既有数据抽象和面向对象能力，运行性能高，是当今比较流行的面向对象的语言，应填入“对象”。$kp$, section = '' where id = 22480;
update t_knowledge_point set title = $kp$常用编译器命令$kp$, content = $kp$Compiler 的作用在于将所编写的程序翻译成一个可执行文件。常用的程序设计语言如 C、Pascal、FORTRAN 等，都是先写好源程序文件，再用相应的 compiler 将其翻译成可执行文件，也可以用这种方法生成自己的专用命令。

1. cc/gcc（C 编译器）
/usr/bin/cc
/usr/local/bin/gcc
语法：cc [-o execfile] source；gcc [-o execfile] source
execfile 是所希望的可执行文件名称，如果没有加 -o 选项，编译产生的可执行文件以 a.out 作为文件名。source 是以 .c 结尾的 C 源程序文件。

2. pc（Pascal 编译器）
/usr/local/bin/pc
语法：pc [-o execfile] source
execfile 是可执行文件名称，没有加 -o 选项时生成的可执行文件名为 a.out。source 是以 .p 结尾的 Pascal 源程序文件。

3. f77（FORTRAN 编译器）
/net/home5/lang/f77
语法：f77 [-o execfile] source
execfile 是可执行文件名称，没有加 -o 选项时生成的可执行文件名为 a.out。source 是以 .f 结尾的 FORTRAN 源程序文件。$kp$, section = '' where id = 22484;
update t_knowledge_point set title = $kp$程序语言的控制成分$kp$, content = $kp$程序语言中控制成分的作用：提供一种基本框架，在此基本框架的支持下，可以将数据和对数据的运算组合成程序。

（1）顺序结构：用来表示一个计算操作（或语句）的序列。从操作序列的第一个操作开始，顺序执行序列后续的操作，直至序列的最后一个操作。$kp$, section = '' where id = 22498;
update t_knowledge_point set title = $kp$程序设计语言的分类$kp$, content = $kp$程序设计语言按其级别可以划分为机器语言、汇编语言和高级语言三大类。

机器语言：使用计算机指令系统的程序语言。用机器语言编写的程序全部都是二进制代码形式，可以被计算机直接执行。机器语言直接依赖机器的指令系统，不同类型甚至不同型号的计算机，其机器语言是不同的。机器语言不易记忆和理解，所编写的程序也难于修改和维护。$kp$, section = '' where id = 22518;
update t_knowledge_point set title = $kp$程序语言的基本成分$kp$, content = $kp$高级语言种类千差万别，但其基本成分都可归纳为四种：

数据成分：描述程序所处理的数据对象（数据类型、数据结构）。

运算成分：描述程序所包含的运算（算术表达式、逻辑表达式）。

控制成分：表达程序中的控制构造（条件判断、循环判断）。

传输成分：表达程序中的数据传输（输入/输出）。$kp$, section = '' where id = 22519;
update t_knowledge_point set title = $kp$C 源程序与程序的编译执行$kp$, content = $kp$C 的源程序扩展名为 .c，.cpp 是 C++ 的源程序，选项 A 描述正确。

C 的源程序编译后生成二进制代码（机器代码），选项 B 描述正确。

源程序中的语句不能直接被 CPU 执行，需要先编译、链接生成可执行文件之后才能运行，选项 C 错误。

一个 C 程序可以由多个源文件组成，但其中只能有一个主函数，故选项 D 正确。$kp$, section = '' where id = 22521;
update t_knowledge_point set title = $kp$编译型语言$kp$, content = $kp$编译型语言是用编译器实现的编程语言。它不像解释型语言那样由解释器将代码逐句解释执行，而是先用编译器将代码编译为机器码，再加以运行。将某种程序设计语言写的程序翻译成等价的另一种语言的程序的程序，称为编译程序。$kp$, section = '' where id = 22522;
update t_knowledge_point set title = $kp$编译程序$kp$, content = $kp$编译程序对源程序进行翻译的方法相当于“笔译”。在编译程序的执行过程中，要对源程序扫描一遍或几遍，最终形成一个可在具体计算机上执行的目标程序。

优点：通过编译程序的处理可以一次性地产生高效运行的目标程序，并把它保存在磁盘上，以备多次执行。

缺点：实现算法较为复杂。

应用：适合于翻译那些规模大、结构复杂、运行时间长的大型应用程序。$kp$, section = '' where id = 22532;
update t_knowledge_point set title = $kp$翻译程序$kp$, content = $kp$翻译程序：程序语言处理系统随被处理的语言及其处理方法和处理过程的不同而异，但任何一个语言处理系统通常都包含一个翻译程序，它把一种语言的程序翻译成等价的另一种语言的程序。

源语言和源程序：被翻译的语言和程序。
目标语言和目标程序：翻译生成的语言和程序。

按照不同的翻译处理方法，可把翻译程序分为以下三类：

汇编程序（assembler）：从汇编语言到机器语言的翻译程序。

解释程序（Interpreter）：按源程序中指令（或语句）的执行顺序，逐条翻译并立即执行相应功能的处理程序。

编译程序（Compiler）：从高级语言到机器语言或汇编语言的翻译程序。$kp$, section = '' where id = 22534;
update t_knowledge_point set title = $kp$解释程序$kp$, content = $kp$解释程序对源程序进行翻译的方法相当于两种自然语言间的“口译”。解释程序对源程序从头到尾逐句扫描、逐句翻译，并且翻译一句执行一句，因而这种翻译方式并不形成机器语言形式的目标程序。

优点：实现算法简单，易于在解释过程中灵活方便地插入所需要的修改和调试措施。

缺点：运行效率低。

应用：通常适合于以交互方式工作的、或在调试状态下运行的、或运行时间与解释时间相差不大的语言。$kp$, section = '' where id = 22539;
update t_knowledge_point set title = $kp$语言处理系统$kp$, content = $kp$语言处理系统的作用：把用软件语言（包括汇编语言和高级语言）编写的各种程序变换成可在计算机上执行的程序，或最终的计算结果，或其他中间形式。

语言处理系统包括：

翻译程序；

正文编辑程序：用于建立和修改源程序文件；

联接编辑程序：将多个分别编译或汇编过的目标程序和库文件进行组合；

装入程序：将目标程序装入内存并启动执行。

处理过程：源程序经正文编辑后，由编译（或汇编）程序翻译成目标程序，再经联接编辑与库文件组合成可执行目标程序，最后由装入程序装入内存并执行，得到结果。$kp$, section = '' where id = 22551;
update t_knowledge_point set title = $kp$高级语言$kp$, content = $kp$高级语言又称算法语言，其表示方法接近解决问题的表示方法，而且具有通用性，在一定程度上与机器无关。

高级语言的特点：易学、易用、易维护，人们可以更有效、更方便地用它来编制各种用途的计算机程序。

高级语言虽然接近自然语言，但和自然语言仍有很大差距，主要表现在语法规则极为严格，其主要原因是高级语言的处理系统是执行程序的计算机，而自然语言的处理系统则是人。

【2007 真题】下列关于机器语言程序与高级语言程序的说法中，错误的是（　）。
A．机器语言程序比高级语言程序执行速度慢
B．机器语言程序比高级语言程序可移植性强
C．机器语言程序比高级语言程序可读性差
D．有了高级语言程序，机器语言程序就无存在的必要了
【试题分析】用机器语言编写的程序全部都是二进制代码形式，可以被计算机直接执行，因此执行速度快，A 错误；机器语言不易记忆和理解，所编写的程序也难于修改和维护，可移植性差，B 错误；机器语言可读性差，C 正确；D 的说法显然不对。答案 ABD。$kp$, section = '' where id = 22555;
update t_knowledge_point set title = $kp$BASIC 语言$kp$, content = $kp$BASIC 语言是一种简单易学的计算机高级语言。尤其是 Visual Basic 语言，具有很强的可视化设计功能，给用户在 Windows 环境下开发软件带来了方便，是重要的多媒体编程工具语言。$kp$, section = '' where id = 23254;
update t_knowledge_point set title = $kp$逻辑型数据$kp$, content = $kp$逻辑型数据是 TRUE 或 FALSE 中的一种，在单元格中默认居中对齐。比较运算的结果就是用逻辑型数据表示的。$kp$, section = '' where id = 24792;
update t_knowledge_point set title = $kp$公式中常用的运算符$kp$, content = $kp$公式中使用的运算符通常包括算术运算符、比较运算符、文本运算符、引用运算符、逻辑运算符五类。

算术运算符：+、-、*（乘）、/（除）、%（百分号）、^（乘方）。

比较运算符：>、<、=、>=、<=、<>（不等于）。比较运算符用于比较两个值，结果是一个逻辑值，不是 TRUE 就是 FALSE。

文本运算符：&，用于将两个文本首尾连接起来。

引用运算符：作用是确定公式中参与运算的数据在工作表中所处的位置，包括冒号、逗号和空格三种。
冒号：区域运算符，引用两个单元格之间（含这两个单元格）的所有单元格。
逗号：联合运算符，可将多个引用合并为一个引用。
空格：交叉运算符，引用同时属于两个引用的单元格区域，即两个引用相重叠的部分。

逻辑运算符：即与、或、非、真、假等条件判断符号。$kp$, section = '' where id = 24990;
update t_knowledge_point set title = $kp$单元格中常见的数据类型$kp$, content = $kp$单元格中常见的数据类型有五种：文本型、数值型、日期型、时间型、逻辑型。$kp$, section = '' where id = 24993;
update t_knowledge_point set title = $kp$运算优先级$kp$, content = $kp$一个公式中出现多个运算符时，公式的计算遵循运算符的优先级顺序。Excel 2003 中，运算符的优先顺序由高到低依次是：括号、引用运算符、负号、百分比、乘方、乘除、加减、连接符、比较运算符、逻辑运算符。$kp$, section = '' where id = 25003;
update t_knowledge_point set title = $kp$高级程序语言的基本成分$kp$, content = $kp$① 数据成分：描述程序所处理的数据对象（数据类型、数据结构）。
② 运算成分：描述程序所包含的运算（算术表达式、逻辑表达式）。
③ 控制成分：表达程序中的控制构造（顺序结构、条件选择、重复结构）。
④ 传输成分：表达程序中的数据传输（输入/输出）。$kp$, section = '' where id = 25005;
update t_knowledge_point set title = $kp$函数的形式$kp$, content = $kp$Excel 2003 中的函数具有如下的通用形式：
函数名（参数 1，参数 2，……）
函数中的参数相当于函数的自变量。有的函数没有参数，有的函数可能有多个参数。参数可以是常量、单元格地址、区域或者表达式等。例如 B3 表示对 B3 单元格的引用，A1:C6 表示对从 A1 到 C6 这一片矩形区域的引用。$kp$, section = '' where id = 25027;
update t_knowledge_point set title = $kp$数据成分$kp$, content = $kp$数据作为程序操作的对象，具有名称、类型、作用域等特征，使用前要对这些特征加以说明。数据名称由用户通过标识符命名；类型说明数据需占用存储单元的多少和存放形式；作用域说明数据可以使用的范围。

以 C 语言为例，数据类型分为基本类型和派生类型：
基本类型包括算术类型（整型、实型、字符类型，实型又分单精度和双精度）和枚举类型。
派生类型包括数组、指针、用户定义类型等。$kp$, section = '' where id = 25029;
update t_knowledge_point set title = $kp$程序设计语言的特点与分类$kp$, content = $kp$程序设计语言是计算机语言的一种，有低级和高级之分：低级的有机器语言，高级的有高级语言。按用途可分为以下几类：

程序设计语言：主要用于编写算法，包括机器语言、汇编语言、高级语言。
数据描述语言：主要用于描述数据（文档、音乐、图形、图像、视频）的规范结构和文件格式，如 HTML、XML、MIDI、MP3、OpenGL、JPEG、MPEG。
脚本语言：主要用于编写嵌入在文档中的程序，如 VBA、VBScript、JavaScript；不需编译、可直接运行，可直接在文本中使用运行。
计算机通用语言（通信协议）：用于描述计算机与计算机之间的会话，如 HTTP、POP3、SMTP、FTP、Telnet、TCP、IP。
数据库语言：用于数据库操作，如 SQL 语言。

计算机诞生之日起就有程序设计语言，不论第几代；这些语言都用于人与计算机之间的通信。$kp$, section = '' where id = 25243;
update t_knowledge_point set title = $kp$机器语言$kp$, content = $kp$机器语言就是计算机的指令系统。
使用二进制 0 和 1 编写程序，不易记忆理解，可读性很差。
可以被计算机直接执行，运行执行速度最快，执行效率高。
不可移植：依赖于具体的计算机指令系统，不同架构 CPU 的指令系统不同，所以在另一种不同 CPU 的计算机上可能不能运行。
现在人们已经不用机器语言编写程序了。$kp$, section = '' where id = 25244;
update t_knowledge_point set title = $kp$汇编语言$kp$, content = $kp$使用助记符来替代机器指令的二进制代码，如 ADD 表示加法、SUB 表示减法、MOV 表示传送数据。
操作数使用十六进制编码，较易理解。
不可以直接执行，需要由汇编程序翻译成机器语言后才能执行。
执行速度较快。
不可以移植，依赖于具体的计算机指令系统。
同机器语言一样属于低级语言。$kp$, section = '' where id = 25245;
update t_knowledge_point set title = $kp$高级程序语言的组成成分$kp$, content = $kp$1. 数据成分：用来描述程序处理的数据对象（数据名、数据类型、数据结构）。
2. 运算成分：算术表达式和逻辑表达式，如 x=x+1。
3. 控制成分：表达程序中的控制构造，如条件语句和循环语句 for，对应顺序、选择、循环三种结构。
4. 传输成分：用来表达程序中数据的传输（赋值语句、输入输出语句）。

高级语言按程序设计方法分类：
面向过程：Fortran、C 语言、Pascal、BASIC。
面向对象：Fortran 2008、VB、Java、C++、C#。
用于数值计算的语言有 Fortran、C 语言、MATLAB；数值计算不等于科学计算。$kp$, section = '' where id = 25247;
update t_knowledge_point set title = $kp$常见高级程序设计语言$kp$, content = $kp$Fortran 语言：世界上第一个高级语言（第二代计算机），接近数学公式，面向过程；允许复数与双精度实数运算，适合大型科学和工程计算（数值计算）；目前 Fortran 2008 是最新国际标准（面向对象）；广泛用于天气预报、有限元分析、计算物理、计算化学、计算流体动力学。

BASIC 语言：初学者通用符号指令代码的英文缩写，简单易学，有很强的可视化设计功能。

VB：在 BASIC 基础上开发的程序设计语言，面向对象、可视化，高效易学，用于开发应用程序。VB 不是数据库管理系统，VFP 才是。

VB 的子集：
VBA：扩展 Office 软件的功能。VBA 与 VB 的不同之处在于 VBA 没有自己的开发环境，必须寄生在已有的应用程序中，要求有一个宿主程序（Word、Excel）才能使用，不能创建独立的应用程序（不能生成 exe 可执行文件）。
VBScript：脚本使用 VBScript 语言，脚本嵌入 HTML 文档来扩充网页功能，可以动态修改网页内容、控制 HTML 文档的展现、检验用户输入信息是否正确。

Java：由 SUN 公司发布的面向对象语言，用于网络环境编程，具有一定的平台独立性，与操作系统无关（跨平台），安全性和稳定性好；安卓智能手机的许多 APP 就是用 Java 编写的。

C 语言：AT&T 公司在 BCPL 语言基础上设计的结构化程序设计语言，兼有高级程序设计语言的功能和汇编语言的效率，面向过程；有效处理了简洁性与实用性、可移植性与高效性的矛盾，语言表达能力强，具有丰富的数据类型和灵活多样的运算符；应用广泛，也可用于编写操作系统和编译程序等软件，如 Linux。

C++：以 C 语言为基础，面向对象，是对 C 语言的扩充并与 C 语言兼容，具有数据抽象和面向对象能力，运行性能高。

Objective-C（ObjC、OC）：以 C 语言为基础，面向对象，是 iPhone 和 iPad 的 iOS 的编程语言。

C#：微软的面向对象语言，类似于 C++，更接近 Java 语言。

其他语言：ALGOL；COBOL；PASCAL（面向过程，语法规范，适合教学）；MATLAB（工程计算）；Ada（并行处理）；PROLOG（逻辑语言，人工智能）；LISP（符号操作，人工智能）。

面向对象方法的优点：与人类的思维习惯方法一致，稳定性好，可重用性好，可维护性好，易于开发大型软件。
面向对象方法的三个重要特征：封装、继承、多态。
对象三要素：属性、事件、方法。
对象的封装实现了信息的隐藏。$kp$, section = '' where id = 25248;
update t_knowledge_point set title = $kp$翻译程序与编译、解释方式$kp$, content = $kp$翻译程序是把一种语言的程序翻译成另一种等价语言的程序。
被翻译的语言叫源语言，被翻译的程序叫源程序；翻译生成的语言叫目标语言，翻译生成的程序叫目标程序。由程序员编写的程序、用高级语言和汇编语言编写的程序都叫源程序。

程序设计语言处理系统：任何一个语言处理系统都包含一个翻译程序。

汇编程序：从汇编语言到机器语言的翻译程序称为汇编程序，它把由操作码和操作数地址组成的指令构成的程序，按源程序中语句的执行顺序逐条翻译并立即执行。

解释程序：具有相应功能的处理程序称为解释程序，如执行 VFP 命令语句时逐条翻译。

高级语言源程序需要翻译，翻译的两种方式是解释和编译。编译程序相当于笔译，解释程序相当于口译。高级语言源程序可先汇编成汇编语言，再翻译成机器语言。

编译程序的处理过程：
源程序（.c、.h）→ 编译程序 → 目标程序（.obj）→ 连接程序 → 可执行代码（.exe）→ 装入程序 → 运行。
即：编辑、编译、连接、装入、运行。编译产生的目标程序可反复执行。

解释与编译的对比：
解释不产生目标程序，相当于“口译”，效率低、占内存少，但算法简单，易于在解释过程中插入修改；适合交互方式工作、在调试状态下运行、运行时间与解释时间差不多的程序。
编译产生目标程序，运行效率高；适合规模大、结构复杂、运行时间长的大型应用程序。$kp$, section = '' where id = 25249;
update t_knowledge_point set title = $kp$程序设计语言基本三要素$kp$, content = $kp$（1）语法：表示构成语言的各个记号之间的组合规律。
（2）语义：表示程序各个语法成分的含义，可分为静态语义和动态语义。
（3）语用：程序与使用者之间的关系，与运行环境和编译环境有很大关系。$kp$, section = '' where id = 25425;
update t_knowledge_point set title = $kp$查找字符与字符串$kp$, content = $kp$① 查找字符：char *strchr(const char *s, char c)，从左向右查找。返回值为查找到的字符所在位置的指针，查找失败则返回 NULL。
② 查找字符串：char *strstr(char *str1, const char *str2)，从左向右查找。返回值为 str2 在 str1 中首次出现位置的首地址，不存在则返回 NULL。$kp$, section = '' where id = 25760;
update t_knowledge_point set title = $kp$程序设计语言$kp$, content = $kp$程序设计语言是用于书写计算机程序的语言。
程序设计语言有 3 个方面的因素，即语法、语义和语用。语法表示程序的结构或形式，即表示构成语言的各个记号之间的组合规律，但不涉及这些记号的特定含义，也不涉及使用者。语义表示程序的含义，即表示按照各种方法所表示的各个记号的特定含义，但不涉及使用者。语用表示程序与使用者之间的关系。$kp$, section = '' where id = 26738;
update t_knowledge_point set title = $kp$程序设计语言的分类$kp$, content = $kp$程序设计语言分为机器语言、汇编语言、高级语言和非过程化语言。$kp$, section = '' where id = 26739;
update t_knowledge_point set title = $kp$程序设计语言的组成$kp$, content = $kp$任何一种语言都可以分成两大组成部分：基本运算符的集合和除去基本运算符以外的其他部分。$kp$, section = '' where id = 26740;
update t_knowledge_point set title = $kp$源程序执行方式$kp$, content = $kp$源程序的执行方式有编译执行和解释执行两种。$kp$, section = '' where id = 26741;
update t_knowledge_point set title = $kp$常用程序设计语言$kp$, content = $kp$常用的程序设计语言是：梯形图程序设计语言、布尔助记符程序设计语言（语句表）、功能表图程序设计语言、功能模块图程序设计语言、结构化语句描述程序设计语言、梯形图与结构化语句描述程序设计语言、布尔助记符与功能表图程序设计语言、布尔助记符与结构化语句描述程序设计语言。$kp$, section = '' where id = 26742;
update t_knowledge_point set title = $kp$程序的控制结构$kp$, content = $kp$程序控制结构有 3 种，分别是顺序结构、选择（判断）结构、循环结构。$kp$, section = '' where id = 27045;
update t_knowledge_point set title = $kp$汇编语言用助记符表示操作码与操作数$kp$, content = $kp$汇编语言使用助记符号来表示机器指令中的操作码与操作数。$kp$, section = '' where id = 27329;
update t_knowledge_point set title = $kp$汇编语言对机器仍有依赖性$kp$, content = $kp$汇编语言对机器仍然有依赖性。$kp$, section = '' where id = 27330;
update t_knowledge_point set title = $kp$汇编语言仍属于低级语言$kp$, content = $kp$汇编语言仍然属于低级语言。$kp$, section = '' where id = 27331;
update t_knowledge_point set title = $kp$传输成分与结构化程序设计$kp$, content = $kp$传输成分：输入用 scanf，输出用 printf。
结构化程序设计是面向过程的程序设计方法，现代程序设计主张使用顺序、选择、循环三种基本结构嵌套连接成具有复杂层次的结构化程序，使程序易读、易修改。$kp$, section = '' where id = 27332;
update t_knowledge_point set title = $kp$对象的封装实现了信息的隐藏$kp$, content = $kp$对象的封装实现了信息的隐藏。$kp$, section = '' where id = 27335;
update t_knowledge_point set title = $kp$源程序的定义$kp$, content = $kp$用高级语言和汇编语言编写的程序称为源程序。$kp$, section = '' where id = 27336;
update t_knowledge_point set title = $kp$源程序、翻译程序与目标程序的关系$kp$, content = $kp$源程序经翻译程序处理得到目标程序。$kp$, section = '' where id = 27337;
update t_knowledge_point set title = $kp$汇编程序$kp$, content = $kp$汇编程序指的是汇编语言的翻译程序，属于系统软件。$kp$, section = '' where id = 27338;
update t_knowledge_point set title = $kp$高级语言的翻译程序$kp$, content = $kp$高级语言的翻译程序分为解释程序和编译程序。$kp$, section = '' where id = 27339;
update t_knowledge_point set title = $kp$解释程序$kp$, content = $kp$解释程序按源程序中语句的执行顺序，逐条翻译并立即执行相应功能的处理程序，不产生目标程序。
① 相当于“口译”，逐句分析、逐句翻译，边解释边执行。
② 算法简单、灵活，便于查错，占用内存少，运行效率低。
③ 适用于调试程序、交互程序等。$kp$, section = '' where id = 27340;
update t_knowledge_point set title = $kp$编译程序$kp$, content = $kp$编译程序把程序从高级语言转换为机器语言。
① 相当于“笔译”，把高级语言编写的源程序整个翻译成机器语言表示的目标程序，全部译完再执行。
② 编译产生目标程序，目标程序可反复被执行，运行效率高。
③ 适用于规模大、结构复杂、运行效率要求高的程序。$kp$, section = '' where id = 27341;
update t_knowledge_point set title = $kp$C++ 是面向对象的语言$kp$, content = $kp$C++ 是面向对象的程序设计语言。$kp$, section = '' where id = 27342;
update t_knowledge_point set title = $kp$C# 是面向对象的语言$kp$, content = $kp$C# 是一种面向对象的程序设计语言。$kp$, section = '' where id = 27343;
update t_knowledge_point set title = $kp$机器语言可直接执行，无须翻译$kp$, content = $kp$机器语言是计算机唯一能直接识别和执行的语言，不需要翻译。$kp$, section = '' where id = 27763;
update t_knowledge_point set title = $kp$FORTRAN 用于数值计算$kp$, content = $kp$FORTRAN 是面向过程的语言，主要用于科学与数值计算。$kp$, section = '' where id = 27764;
update t_knowledge_point set title = $kp$宏$kp$, content = $kp$宏用于记录用户的一系列操作，可在需要时重复执行。$kp$, section = '' where id = 27848;
update t_knowledge_point set title = $kp$宏的作用$kp$, content = $kp$宏记录用户的操作过程，把一组操作保存下来，以便重复执行。$kp$, section = '' where id = 27849;
update t_knowledge_point set title = $kp$负数的输入方法$kp$, content = $kp$输入负数时可先输入其绝对值再取负，如输入 8 得到 -8。$kp$, section = '' where id = 27869;
update t_knowledge_point set title = $kp$逻辑值的取值$kp$, content = $kp$逻辑型数据只有两个值：False 对应 0，True 对应 1。$kp$, section = '' where id = 27874;
update t_knowledge_point set title = $kp$公式以等号开始$kp$, content = $kp$公式由等号“=”开始，后接表达式。$kp$, section = '' where id = 27902;
update t_knowledge_point set title = $kp$Excel 错误值 #NAME? 与 #NULL!$kp$, content = $kp$#NAME?：公式中使用了不存在的名称，或函数名、名称拼写错误。
#NULL!：公式引用的两个区域没有交叉区域（区域之间用空格表示交叉）。$kp$, section = '' where id = 27915;
update t_knowledge_point set title = $kp$逻辑值的表示$kp$, content = $kp$逻辑值只有两个：False = 0，True = 1。$kp$, section = '' where id = 27939;
update t_knowledge_point set title = $kp$机器语言依赖机器、移植性差$kp$, content = $kp$机器语言对机器有依赖性，移植性差，不同机器的机器语言通常不同。$kp$, section = '' where id = 28128;
update t_knowledge_point set title = $kp$汇编语言属于低级语言$kp$, content = $kp$汇编语言仍然属于低级语言。$kp$, section = '' where id = 28129;
update t_knowledge_point set title = $kp$结构化程序设计$kp$, content = $kp$结构化程序设计是面向过程的程序设计方法，主张用顺序、选择、循环三种基本结构嵌套连接成具有复杂层次的结构化程序，使程序易读、易修改。$kp$, section = '' where id = 28130;
update t_knowledge_point set title = $kp$解释程序$kp$, content = $kp$解释程序：按源程序中语句的执行顺序，逐条翻译并立即执行相应功能的处理程序，不产生目标程序。
① 相当于“口译”，逐句分析、逐句翻译，边解释边执行。
② 算法简单、灵活，便于查错，占用内存少，但运行效率低。
③ 适用于调试程序、交互程序等。$kp$, section = '' where id = 28132;
update t_knowledge_point set title = $kp$编译程序$kp$, content = $kp$编译程序：把高级语言源程序翻译成机器语言或汇编语言程序的翻译程序。
① 相当于“笔译”，将高级语言编写的源程序整体翻译成机器语言表示的目标程序，全部译完再执行。
② 编译产生目标程序，目标程序可反复执行，运行效率高。
③ 适用于翻译规模大、结构复杂、运行时间长的大型应用程序。$kp$, section = '' where id = 28133;
update t_knowledge_point set title = $kp$C# 语言的特点$kp$, content = $kp$C# 是面向对象的程序设计语言，运行于 .NET 平台。$kp$, section = '' where id = 28134;
update t_knowledge_point set title = $kp$解释程序不生成目标程序$kp$, content = $kp$解释程序逐条翻译并立即执行源程序，不生成目标程序；只有编译程序才把高级语言源程序转换成目标程序。$kp$, section = '' where id = 28135;
update t_knowledge_point set title = $kp$伪代码$kp$, content = $kp$伪代码是介于自然语言和程序设计语言之间的文字和符号表达工具。$kp$, section = '' where id = 28139;
update t_knowledge_point set title = $kp$C++ 面向对象$kp$, content = $kp$C++ 是由 C 语言发展而来的面向对象的程序设计语言。$kp$, section = '' where id = 28297;
update t_knowledge_point set title = $kp$解释方式的特点$kp$, content = $kp$解释方式边翻译边执行，算法简单、灵活，便于查错，占用内存少，但运行效率低。$kp$, section = '' where id = 28304;
update t_knowledge_point set title = $kp$面向对象的程序设计$kp$, content = $kp$C# 是面向对象的程序设计语言；面向对象语言提供封装、继承、多态机制，封装即数据的隐藏。$kp$, section = '' where id = 28309;
update t_knowledge_point set title = $kp$SQL 查询与排序$kp$, content = $kp$查询学生表中男生的记录：
SELECT 学号, 姓名, 性别 FROM 学生 WHERE 性别 = '男'
按学号降序输出：
SELECT 学号, 姓名, 性别 FROM 学生 ORDER BY 学号 DESC$kp$, section = '' where id = 28399;
update t_knowledge_point set title = $kp$逻辑值的排序$kp$, content = $kp$逻辑值按升序排列时，False 在前、True 在后。$kp$, section = '' where id = 28401;
update t_knowledge_point set title = $kp$高级语言程序的特点$kp$, content = $kp$高级语言程序执行速度慢，但移植性好、不依赖具体硬件。翻译程序中只有编译程序生成目标程序，解释程序不生成目标程序。$kp$, section = '' where id = 28508;
update t_knowledge_point set title = $kp$机器语言无需翻译$kp$, content = $kp$机器语言是计算机唯一能直接读懂并执行的语言，无需翻译。$kp$, section = '' where id = 28570;
update t_knowledge_point set title = $kp$高级程序语言的基本成分$kp$, content = $kp$高级程序语言的基本成分包括数据成分、运算成分、控制成分和传输成分。$kp$, section = '' where id = 28571;
update t_knowledge_point set title = $kp$FORTRAN 用于科学计算$kp$, content = $kp$FORTRAN 是面向过程的语言，主要用于科学计算。$kp$, section = '' where id = 28585;
update t_knowledge_point set title = $kp$编译方式的适用场合$kp$, content = $kp$编译方式适用于翻译规模大、结构复杂、运行时间长的大型应用程序。$kp$, section = '' where id = 28586;
update t_knowledge_point set title = $kp$MapReduce 独立（本地）运行模式$kp$, content = $kp$独立（本地）运行模式：无需任何守护进程，所有程序都运行在同一个 JVM 上执行。该模式下调试 MR 程序高效方便，主要用于学习或开发阶段的调试。$kp$, section = '' where id = 28933;
update t_knowledge_point set title = $kp$算法的描述工具$kp$, content = $kp$常用描述工具有文字说明、流程图、伪代码（介于自然语言和程序设计语言之间的文字和符号表达工具）、程序设计语言、决策表等，可根据需要选择使用。$kp$, section = '' where id = 28961;
update t_knowledge_point set title = $kp$程序设计语言的成分$kp$, content = $kp$数据成分：描述数据类型。
运算成分：算术运算、关系运算、逻辑运算等。
控制成分：顺序结构、条件选择结构、循环（重复）结构。
传输成分：输入、输出。$kp$, section = '' where id = 28991;
update t_knowledge_point set title = $kp$程序设计语言的处理系统（翻译系统）$kp$, content = $kp$源程序经翻译程序转换为目标程序。
1）汇编语言：汇编语言源程序经汇编程序（汇编器）翻译为机器语言目标程序。
2）高级语言：
（笔译）源程序经编译程序（编译器）翻译为机器语言目标程序，可供多次执行；
（口译）源程序经解释程序（解释器）边翻译边执行，不产生目标程序。
编译过程：编辑—编译—连接—运行。$kp$, section = '' where id = 28992;
update t_knowledge_point set title = $kp$程序设计语言的分类$kp$, content = $kp$分类：机器语言、汇编语言、高级语言。
机器语言：就是 CPU 的指令系统，是二进制数，是硬件唯一可直接执行的语言，不可移植（不同机器的 CPU 指令系统不同，因而机器语言不同）。
汇编语言：即符号语言，几乎直接对应二进制的机器指令，不能直接执行，需先通过汇编程序（一种系统软件）整个汇编成机器语言程序后才能执行；同样不可移植（不同 CPU 的指令系统通常不同）。
注：机器语言写的程序都是系统软件——错误。机器语言可以写任何软件，不一定非是系统软件。
高级语言：面向人的语言（机器语言与汇编语言是面向机器的语言），可移植性高（远离机器、抽象级别高），但不可直接执行。
高级语言程序的执行方式：方法 1，先通过编译程序（一种系统软件）变成等价的机器语言程序，再运行该程序；方法 2，取出源程序中的一条语句，立即按语句含义解释执行，再取下一条，反复进行。
比较：方法 1 为编译方式，程序运行性能高，适合复杂程序，会生成等价的机器语言程序，但人机交互性差；方法 2 为解释方式，人机交互性好，不生成等价的机器语言程序，运行性能不高，适用于不复杂或性能要求不高的场合。
高级语言与机器语言（或汇编语言）比较：高级语言开发效率高，机器语言开发效率差；机器语言执行性能高，高级语言执行性能差些；高级语言不能直接执行，机器语言可直接执行；高级语言程序可移植性高，机器语言或汇编语言可移植性差。$kp$, section = '' where id = 29009;
update t_knowledge_point set title = $kp$常用程序设计语言$kp$, content = $kp$Fortran：面向过程，用于科学与数值计算（Fortran 2003 支持面向对象）。
VB：面向对象、可视化、事件处理。
Java：面向对象，用于网络平台，可跨平台运行。
C：面向过程，通用程序设计语言，适合开发系统软件，效率高。
C++：由 C 语言发展而来，面向对象。
C#：面向对象，运行于 .NET 平台，可跨平台运行，从 C++、Java 发展而来。
LISP：符号操作及表处理，用于人工智能。
PROLOG：逻辑式编程语言，用于人工智能。
ADA：模块化语言，用于实时控制、并发多任务，如飞行器控制。
MATLAB：面向矩阵数学运算，用于数学计算。
COBOL：面向过程，适用于商业、金融。
VBA：面向对象，嵌入在 Office 软件中运行，常见的宏病毒就是用 VBA 编制的。
JavaScript 和 VBScript：面向对象，嵌入在网页中运行。
面向对象：对象是将数据及对其的操作（运算）封装在一起，作为一个整体看待，也是一种新的数据类型；面向对象语言提供封装、继承、多态机制，封装即数据的隐藏。$kp$, section = '' where id = 29010;
update t_knowledge_point set title = $kp$编译程序与解释程序$kp$, content = $kp$1）汇编语言源程序 → 汇编程序 → 机器语言程序。
2）源程序 → 编译程序 → 目标程序（二进制，可浮动定位，不能直接运行）→ 连接程序（将系统库文件代码连接到目标程序中）→ 可执行的机器代码程序（二进制）→ 装入（将代码装入内存运行）→ 运行 → 结果。
归纳：第一步编译，第二步连接，第三步装入并运行。$kp$, section = '' where id = 29011;
update t_knowledge_point set title = $kp$汇编语言的特点$kp$, content = $kp$汇编语言的代码计算机不可以直接执行，需要汇编程序翻译成机器语言后才能执行；执行速度较快，不可移植，依赖于具体计算机的指令系统，与机器语言同属低级语言，使用“助记符”编写程序。$kp$, section = '' where id = 29029;
update t_knowledge_point set title = $kp$高级语言的特点$kp$, content = $kp$高级语言的代码计算机不可以直接执行，需要翻译程序进行“解释”或“编译”才能执行；具有可移植性，不依赖于具体计算机的指令系统，但运行效率较低。$kp$, section = '' where id = 29030;
update t_knowledge_point set title = $kp$翻译程序的三类$kp$, content = $kp$翻译程序分为 3 类：汇编程序（专门用于翻译汇编语言程序）；解释程序（如执行 VFP 命令语句，逐条翻译，不生成目标程序，运行效率低，像“口译”）；编译程序（如执行 VB 代码，把源程序翻译成目标程序，可多次执行，运行效率高，像“笔译”）。$kp$, section = '' where id = 29036;
update t_knowledge_point set title = $kp$语言处理与算法基础$kp$, content = $kp$机器语言：二进制编写，对硬件依赖强，不易移植，可以直接被计算机执行，运行速度最快，不易记忆和理解。
汇编语言：用助记符代替操作码和操作数，需汇编程序翻译，具有机器语言移植性差的缺点。
高级语言：算法语言，易记忆和理解，通用性、可移植性强，便于维护，运行速度慢。
高级语言基本成分：数据成分（数据类型和数据结构）、运算成分（算术运算和逻辑运算）、控制成分（顺序、条件和循环）、传输成分（输入和输出）。
系统开发：正文编辑—翻译—连接编辑—装入—执行。
汇编程序：把汇编语言翻译成机器语言。
解释程序：逐条翻译、逐条执行，不生成目标程序，适用于交互式工作，执行效率低，算法简单。
编译程序：把高级语言翻译成机器语言，生成目标程序，效率高，适于大规模程序，算法复杂。
高级语言分类：面向过程（C 语言）；面向对象（C++、Java）。
瑞士科学家提出：数据结构 + 算法 = 程序。
算法特性：有穷性；确定性（每一步有明确含义）；输入（0 个、1 个或多个值）；输出（至少一个值）；可行性。
算法描述：伪代码、流程图。
算法设计由粗到细、由抽象到具体，通过时间代价和空间代价解决问题；时间代价决定执行次数，空间代价决定数据量。
数据结构：逻辑结构指对象与对象之间的关系，如线性表和树；存储结构是逻辑结构在计算机存储器上的实现，如链接表。$kp$, section = '' where id = 29057;
update t_knowledge_point set title = $kp$C 程序的编译、链接与运行$kp$, content = $kp$用 C 语言编写的源程序不能直接被计算机执行，所有 C 程序都需要编译与链接（连接）无误后才能运行。
① 先编译生成目标文件（.obj）；
② 再把目标文件与各种库函数连接（链接）起来；
③ 生成“.exe”可执行文件；
④ C 程序在运行过程中所有计算都以二进制方式进行。$kp$, section = '' where id = 29063;
update t_knowledge_point set title = $kp$头文件引入与 #include 的搜索路径$kp$, content = $kp$使用库函数前需先用 #include 引入其所在头文件，#include 属于预处理命令。

尖括号 <> 与双引号 "" 的区别在于头文件的搜索路径不同：

- 使用尖括号时，编译器到系统路径下查找头文件；
- 使用双引号时，编译器首先在当前目录下查找，找不到再到系统路径下查找。$kp$, section = '' where id = 29064;
update t_knowledge_point set title = $kp$类型转换：隐式转换与强制转换$kp$, content = $kp$类型转换分为隐式转换和强制转换。

隐式转换由编译程序自动完成，方向为由低精度类型向高精度类型转换。$kp$, section = '' where id = 29065;
update t_knowledge_point set title = $kp$ALTER DATABASE 修改数据库字符集与排序规则$kp$, content = $kp$语法：

ALTER DATABASE 数据库名 CHARACTER SET 字符集 COLLATE 排序规则；

用于修改数据库的默认字符集和排序规则。$kp$, section = '' where id = 29070;
update t_knowledge_point set title = $kp$源程序需翻译成目标程序才能执行$kp$, content = $kp$源程序需要翻译成目标程序才能被计算机执行。

机器语言对人类而言难理解、编程效率低、不易维护。$kp$, section = '' where id = 29094;
update t_knowledge_point set title = $kp$软件、操作系统、程序设计语言与数据结构的基本要求$kp$, content = $kp$熟悉计算机软件的定义和分类，掌握操作系统基本概念，熟悉程序设计语言语法基础，掌握几种常见数据结构及基本操作，掌握软件工程基础。$kp$, section = '' where id = 29096;
update t_knowledge_point set title = $kp$软件技术的四代发展$kp$, content = $kp$软件技术的发展：

1. 第一代（20 世纪 50—60 年代）：以 ALGOL、FORTRAN 等编程语言为标志，高级语言出现。
2. 第二代（20 世纪 70 年代）：以 Pascal、COBOL 和 C 等编程语言以及关系数据库管理系统为标志的结构化程序设计软件技术。
3. 第三代（20 世纪 80 年代）：以 Smalltalk、C++ 等为代表的面向对象技术（OO）出现。
4. 第四代（20 世纪 90 年代）：以 COM、CORBA 等为代表的分布式面向对象技术（DOO）和构件技术。$kp$, section = '' where id = 29102;
update t_knowledge_point set title = $kp$高级语言程序的特点$kp$, content = $kp$高级语言程序执行速度慢，但移植性好、不依赖硬件。

高级语言的翻译程序中，只有编译程序生成目标程序，解释程序不生成目标程序。$kp$, section = '' where id = 29106;
update t_knowledge_point set title = $kp$高级语言程序必须翻译后才能执行$kp$, content = $kp$高级语言编写的程序人类易懂易编写，但计算机不能直接执行高级语言程序，因此高级语言程序需要翻译。$kp$, section = '' where id = 29107;
update t_knowledge_point set title = $kp$汇编程序及其所属类别$kp$, content = $kp$汇编程序是汇编语言的翻译程序，属于系统软件。

程序 = 算法 + 数据结构。$kp$, section = '' where id = 29108;
update t_knowledge_point set title = $kp$高级语言的翻译程序：解释程序与编译程序$kp$, content = $kp$高级语言的翻译程序分为解释程序和编译程序：解释程序不产生目标程序，编译程序把源程序翻译为计算机语言的目标程序。

解释程序按源程序中语句的执行顺序，逐条翻译并立即执行相应功能，不产生目标程序。$kp$, section = '' where id = 29120;
update t_knowledge_point set title = $kp$解释程序的优点与编译程序的定义$kp$, content = $kp$解释程序的优点是适用于调试程序、交互程序等。

编译程序是把高级语言翻译成机器语言或汇编语言的翻译程序，会生成目标程序。$kp$, section = '' where id = 29121;
update t_knowledge_point set title = $kp$UPDATE、DELETE 语句与软件危机$kp$, content = $kp$更改语句：

UPDATE 对指定表中已有数据进行修改。

删除语句：如果省略 WHERE 子句，则删除表中所有元组，只保留表的结构。

DELETE FROM C  // 删除 C 表中的所有元组

五、信息系统的开发和管理

软件危机是指在计算机软件开发和维护过程中所遇到的一系列问题，软件危机与硬件无关。$kp$, section = '' where id = 29130;
update t_knowledge_point set title = $kp$逻辑运算的分类与真值$kp$, content = $kp$分类：

1) 逻辑乘（“与”、“and”、“∧”、“·”）：全一为一
2) 逻辑加（“或”、“or”、“∨”、“+”）：有一为一
3) 取反（“非”、“not”、“-”）：颠倒是非

逻辑加：0∨0=0，0∨1=1，1∨0=1，1∨1=1

逻辑乘：0∧0=0，0∧1=0，1∧0=0，1∧1=1

取反：0→1，1→0$kp$, section = '' where id = 29134;
update t_knowledge_point set title = $kp$传输成分与程序设计语言处理系统$kp$, content = $kp$传输成分：

1) 定义：用以表达程序中数据的传输。
2) 例如：I/O 语句 printf("hello!");

（三）程序设计语言处理系统$kp$, section = '' where id = 29144;
update t_knowledge_point set title = $kp$计算机语言分为高级语言、汇编语言和机器语言$kp$, content = $kp$计算机语言分为高级语言、汇编语言和机器语言。

高级语言接近人们日常使用的语言；汇编语言用助记符代替机器指令的操作码和操作数；机器语言由二进制（只有 0、1）组成，可被计算机直接执行，但不易记忆、不易理解、不易维护，不同机器的机器语言程序互不兼容。

高级语言和汇编语言编写的源程序需经翻译后才能交给 CPU 运行，机器语言程序无需翻译。$kp$, section = '' where id = 29168;
update t_knowledge_point set title = $kp$翻译程序与常用程序设计语言的特点$kp$, content = $kp$翻译程序分为解释程序（不产生目标程序，相当于“口译”）和编译程序（把源程序编译为计算机语言的目标程序，相当于“笔译”）。

FORTRAN 主要用于数值计算，是面向过程的程序设计语言。

Visual Basic 是一种可视化的、面向对象的程序设计语言。

Java 是面向对象的、用于网络环境的语言，独立于平台，编写的程序与机器无关。

C 语言是面向过程的主流语言。

C++ 以 C 语言为基础发展而来，与 C 语言兼容，具有面向对象能力，是主流语言。$kp$, section = '' where id = 29169;
update t_knowledge_point set title = $kp$创建数据库时设置字符集与排序规则$kp$, content = $kp$创建数据库时设置数据库的编码方式：

CHARACTER SET：指定数据库采用的字符集，utf8 不能写成 utf-8。

COLLATE：指定数据库字符集的排序规则，utf8 的默认排序规则为 utf8_general_ci。

设置默认字符集和排序规则的举例：

CREATE DATABASE IF NOT EXISTS tpm_business DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;$kp$, section = '' where id = 29869;
update t_knowledge_point set title = $kp$应用幻灯片设计模板$kp$, content = $kp$应用设计模板是指将某个设计模板应用于当前演示文稿，使当前演示文稿呈现出指定模板的外观。

具体步骤：

1. 选择“格式”菜单中的“幻灯片设计”命令。
2. 从出现的设计模板名称列表中选取一种模板。
3. 单击“应用”按钮完成操作。$kp$, section = '' where id = 30157;
update t_knowledge_point set title = $kp$公式中的运算符与单元格引用$kp$, content = $kp$公式以“=”开头。

算术运算：+、-、*、/

比较运算（关系运算）：>、<、=、>=、<=、<>

逻辑运算：& 连接符、and、or

引用单元格：

- 冒号表示连续引用，如 B2:E7；
- 逗号表示不连续引用，如 A3,B5,A9；
- 空格表示交叉引用。

引用单元格有三种状态：绝对引用 $A$1、相对引用 A1、混合引用 $A1 或 A$1。

复制公式时，被引用的单元格若为绝对引用则不发生变化，若为相对引用则发生变化，变化依据复制后公式所在单元格与原公式所在单元格的相对位置。

如果是删除或插入某行或某列，则无论绝对引用还是相对引用都要发生变化。

三维引用格式：[工作簿]工作表!单元格$kp$, section = '' where id = 30182;
update t_knowledge_point set title = $kp$strlen 的计数规则与数组的排序和查询$kp$, content = $kp$strlen 遇到 '\0'（或 0）就返回，实际上只计算到 '\0' 或 0 之前的字符长度。

6.4 数组的排序和查询

1、排序$kp$, section = '' where id = 30229;
update t_knowledge_point set title = $kp$变量的初始化$kp$, content = $kp$变量赋初值：

int a=3,b=3,c;

int a=3; 相当于 int a; a=3; 即在定义变量的同时给变量赋初值。$kp$, section = '' where id = 31954;
update t_knowledge_point set title = $kp$闰年的判断$kp$, content = $kp$能被 4 整除但不能被 100 整除的年份是闰年，如 2008、2012、2048 年；能被 400 整除的年份也是闰年，如 2000 年。$kp$, section = '' where id = 31973;
update t_knowledge_point set title = $kp$N-S 流程图与伪代码$kp$, content = $kp$N-S 流程图用矩形框表示三种基本结构：顺序结构（A、B 依次执行）、选择结构（条件 p 成立时执行 A，否则执行 B）、循环结构（当型：当 p1 成立时反复执行 A；直到型：反复执行 A，直到 p2 成立）。

例 2.11 求 5!：t=1，i=2，反复执行 t=t*i、i=i+1，直到 i>5，输出 t。

例 2.12 输出 50 名学生中成绩高于 80 分者的学号与成绩：i=1，输入 ni、gi，若 gi≥80 则输出 ni、gi，i=i+1，直到 i>50。

例 2.13 判定闰年：year 从 2000 到 2500，若 year%4 为 0 且 year%100 不为 0，或 year%400 为 0，则输出 year 为闰年，否则输出 year 为非闰年，year=year+1，直到 year>2500。

例 2.14 求级数和：sum=1，deno=2，sign=1，反复执行 sign=(-1)*sign、term=sign*(1/deno)、sum=sum+term、deno=deno+1，直到 deno>100，输出 sum。

例 2.15 判别素数：输入 n，w=0，i=2，反复执行 n%i→r，若 r=0 则 w=1，i=i+1，直到 i>√n 或 w≠0；若 w=0 则输出 n 是素数，否则输出 n 不是素数。原来的流程图有两个出口，不符合基本结构的特点，无法直接用 N-S 流程图的三种基本结构符号表示，需先作必要的变换。

结构化算法的特点：由一些基本结构顺序组成；在基本结构之间不存在向前或向后的跳转，流程的转移只存在于一个基本结构范围之内；一个非结构化的算法可以用一个等价的结构化算法代替，功能不变；如果一个算法不能分解为若干个基本结构，则它必然不是一个结构化的算法。

伪代码是用介于自然语言和计算机语言之间的文字和符号来描述算法，没有固定的、严格的语法规则，可以用英文，也可以中英文混用。例 2.16 用伪代码求 5!。$kp$, section = '' where id = 31979;
update t_knowledge_point set title = $kp$求 5! 的伪代码$kp$, content = $kp$用伪代码求 5!：

begin
t=1，i=2
while i≤5
{ t=t*i
i=i+1 }
print t
end

（算法开始）……（算法结束）

例 2.17 用伪代码求级数和。$kp$, section = '' where id = 31980;
update t_knowledge_point set title = $kp$C 程序的结构$kp$, content = $kp$一个 C 程序由一个或多个程序模块组成，每一个程序模块作为一个源程序文件。对较大的程序，一般不希望把所有内容全放在一个文件中，而是将它们分别放在若干个源文件中，由若干个源程序文件组成一个 C 程序，这样便于分别编写、分别编译，提高调试效率。一个源程序文件可以为多个 C 程序共用。

（2）一个源程序文件由一个或多个函数以及其他有关内容（如预处理指令、数据声明与定义等）组成。一个源程序文件是一个编译单位，在程序编译时是以源程序文件为单位进行编译的，而不是以函数为单位进行编译的。

（3）C 程序的执行是从 main 函数开始的，如果在 main 函数中调用其他函数，在调用后流程返回到 main 函数，在 main 函数中结束整个程序的运行。

（4）所有函数都是平行的，即在定义函数时是分别进行的，是互相独立的。一个函数并不从属于另一个函数，即函数不能嵌套定义。函数间可以互相调用，但不能调用 main 函数，main 函数是被操作系统调用的。

（5）从用户使用的角度看，函数有两种：库函数，由系统提供，用户不必自己定义而直接使用（不同的 C 语言编译系统提供的库函数的数量和功能会有一些不同，许多基本的函数是共同的）；用户自己定义的函数，用以解决用户专门的需要。$kp$, section = '' where id = 31981;
update t_knowledge_point set title = $kp$Excel 公式与运算符$kp$, content = $kp$公式：以等号（=）开始，由函数、引用、区域名字、运算符和常量组成的等式，用于进行数值计算。

算术运算符：+（加）、-（减）、-（负号）、*（乘）、/（除）、%（百分比）、^（乘幂）。算术运算符的优先级从高到低为：负号、百分号、乘幂、乘或除、加或减。

比较运算符：=（等于）、>（大于）、>=（大于等于）、<（小于）、<=（小于等于）、<>（不等于）。用运算符比较两个值时，结果是一个逻辑值，不是 TRUE 就是 FALSE。
比较规则：数值类型按数值的大小比较；文本类型按 ASCII 码或汉字机内码比较。
混合类型数据之间比较大小时，逻辑类型（TRUE、FALSE）最大，其次是字符类型，最后是数字类型（日期、时间按数字类型处理）。
单元格内容为空时，按空串、0 或 FALSE 解释，即 A1=""、A1=0、A1=FALSE 的结果均为 TRUE。因此 TRUE>"abc"、FALSE>"abc"、TRUE>123、FALSE>123、"123">123、"">766 的结果都是 TRUE；而 A1>766 结果为 FALSE（此时 A1 就是 0），TRUE>A1 结果为 TRUE（此时 A1 就是 FALSE），A1>"" 结果为 FALSE（此时 A1 就是空串）。

文本连接运算符 &：将一个或更多文本字符串连接成一串文本，如 "North"&"wind" 得到 "Northwind"。

引用运算符：:（冒号，区域运算符，产生对包括在两个引用之间的所有单元格的引用，如 B5:B15）、,（逗号，联合运算符，将多个引用合并为一个引用，如 SUM(B5:B15,D5:D15)）、空格（交叉运算符，产生对两个引用共有的单元格的引用，如 B7:D7 C6:C8）。

公式中的运算次序：公式按特定次序计算数值，通常以等号开始，紧随等号之后的是需要进行计算的元素（操作数），各操作数之间以运算符分隔，Excel 根据公式中运算符的特定顺序从左到右计算。

运算符优先级从高到低为：引用运算符、算术运算符、文本连接运算符、比较运算符。引用运算符内部依次为 :（冒号）、单个空格（区域相交）、,（逗号，区域合并，重复单元格要重复计算）。如果公式中包含相同优先级的运算符，如同时包含乘法和除法，则从左到右计算。

例如 =SUM(A1:A6 A4:A8, B1:B6 B4:B8) 的含义是：取 A4:A6 与 B4:B6 合并构成的区域，对该区域中所有单元格求和。$kp$, section = '' where id = 32097;
update t_knowledge_point set title = $kp$C 语言中的成员运算符及其他运算符$kp$, content = $kp$成员运算符：. 和 ->，用于访问结构体、共用体的成员或指针所指对象的成员。
逗号运算符：,，用于把多个表达式串联成一个表达式。
指针运算符：* 和 &，分别表示取所指对象的值和取变量的地址。
sizeof：求字节数运算符，返回类型或对象所占的字节数。
强制类型转换：(类型)，把表达式的值转换为指定类型。$kp$, section = '' where id = 32274;
update t_knowledge_point set title = $kp$赋值过程中的类型转换$kp$, content = $kp$两侧类型一致时，直接赋值。
两侧类型不一致但都是算术类型时，系统自动把右侧表达式的类型转换为左侧变量的类型后再赋值。
定义变量时要防止数据溢出。$kp$, section = '' where id = 32280;
update t_knowledge_point set title = $kp$if 语句与多分支的嵌套形式$kp$, content = $kp$if（表达式）语句 1
else 语句 2

多分支可写成：
if (number > 500) cost = 0.15;
else if (number > 300) cost = 0.10;
else if (number > 100) cost = 0.075;
else if (number > 50) cost = 0.05;
else cost = 0;

它等价于逐层嵌套的写法：
if (number > 500) cost = 0.15;
else
    if (number > 300) cost = 0.10;
    else
        if (number > 100) cost = 0.075;
        else
            if (number > 50) cost = 0.05;
            else cost = 0;

注意：内嵌 if 语句后的分号不能丢。$kp$, section = '' where id = 32302;
update t_knowledge_point set title = $kp$命名规则$kp$, content = $kp$名字的第一个字符必须是字母或汉字。
名字不能使用类似单元格地址的形式，如 D4、E5、F6 等。
不可将空格当作分隔符，可以用点或下划线代替。
名字不区分英文字母大小写。
名字不超过 255 个字符，名称框中最多显示 15 个字符。$kp$, section = '' where id = 32673;
update t_knowledge_point set title = $kp$“与”关系的条件必须出现在同一行$kp$, content = $kp$筛选条件为“科室编号大于 1001 与工资大于 1000”时，两个条件必须写在同一行，例如在同一行的两列中分别写“>1001”和“>1000”。$kp$, section = '' where id = 32682;
update t_knowledge_point set title = $kp$算术运算中 float、double 型的类型提升$kp$, content = $kp$+、-、*、/ 运算的两个数中有一个为 float 或 double 型时，结果为 double 型。系统先把 float 型数据转换为 double 型，然后进行运算。$kp$, section = '' where id = 32707;
update t_knowledge_point set title = $kp$int 型与 float、double 型混合运算$kp$, content = $kp$int 型与 float 或 double 型数据进行运算时，先把 int 型和 float 型数据转换为 double 型，然后进行运算，结果为 double 型。$kp$, section = '' where id = 32708;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22203,22251,22261,22273,22285,22293,22302,22303,22354,22356,22357,22358,22367,22389,22390,22407,22440,22441,22450,22451,22476,22480,22484,22498,22518,22519,22521,22522,22532,22534,22539,22551,22555,23254,24792,24990,24993,25003,25005,25027,25029,25243,25244,25245,25247,25248,25249,25425,25760,26738,26739,26740,26741,26742,27045,27329,27330,27331,27332,27335,27336,27337,27338,27339,27340,27341,27342,27343,27763,27764,27848,27849,27869,27874,27902,27915,27939,28128,28129,28130,28132,28133,28134,28135,28139,28297,28304,28309,28399,28401,28508,28570,28571,28585,28586,28933,28961,28991,28992,29009,29010,29011,29029,29030,29036,29057,29063,29064,29065,29070,29094,29096,29102,29106,29107,29108,29120,29121,29130,29134,29144,29168,29169,29869,30157,30182,30229,31954,31973,31979,31980,31981,32097,32274,32280,32302,32673,32682,32707,32708) and not deleted) <> 140 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
