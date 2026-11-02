-- 目的：P0 知识点重构基础表（kb_entry / kb_revision / kb_asset / user_knowledge_progress）与 S1-1（239/240/241）结构化讲义试点
-- 依赖：t_chapter, profiles, pg_trgm 扩展
-- 执行日期：2026-11-02

BEGIN;

CREATE TABLE IF NOT EXISTS kb_entry (
  node_id       integer PRIMARY KEY REFERENCES t_chapter(id) ON DELETE CASCADE,
  status        varchar(20) NOT NULL DEFAULT 'draft',
  published_rev integer,
  updated_at    timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS kb_revision (
  id          bigserial PRIMARY KEY,
  node_id     integer NOT NULL REFERENCES t_chapter(id) ON DELETE CASCADE,
  rev_no      integer NOT NULL,
  blocks      jsonb NOT NULL DEFAULT '[]'::jsonb,
  html        text NOT NULL DEFAULT '',
  search_text text NOT NULL DEFAULT '',
  source_ref  jsonb,
  created_at  timestamptz NOT NULL DEFAULT now(),
  UNIQUE (node_id, rev_no)
);

CREATE INDEX IF NOT EXISTS idx_kb_revision_search_trgm
  ON kb_revision USING gin (search_text gin_trgm_ops);

CREATE TABLE IF NOT EXISTS kb_asset (
  id      bigserial PRIMARY KEY,
  sha256  char(64) NOT NULL UNIQUE,
  path    text NOT NULL,
  w       integer,
  h       integer,
  kind    varchar(20),
  license varchar(40) NOT NULL DEFAULT 'self-drawn'
);

CREATE TABLE IF NOT EXISTS user_knowledge_progress (
  user_id      uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  section_id   integer NOT NULL REFERENCES t_chapter(id) ON DELETE CASCADE,
  progress_pct smallint NOT NULL DEFAULT 0 CHECK (progress_pct >= 0 AND progress_pct <= 100),
  learned      boolean NOT NULL DEFAULT false,
  last_kp_id   integer,
  updated_at   timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (user_id, section_id)
);

CREATE INDEX IF NOT EXISTS idx_ukp_user_updated
  ON user_knowledge_progress (user_id, updated_at DESC);

GRANT SELECT, INSERT, UPDATE, DELETE ON kb_entry, kb_revision, kb_asset, user_knowledge_progress TO quiz_app;
GRANT USAGE, SELECT ON SEQUENCE kb_revision_id_seq, kb_asset_id_seq TO quiz_app;

-- =====================================================================
-- S1-1 试点讲义写入（239: S1-1.1 / 240: S1-1.2 / 241: S1-1.3）
-- =====================================================================

-- 1) S1-1.1（node_id = 239）：程序的构成，main 函数和其他函数
INSERT INTO kb_revision (node_id, rev_no, blocks, search_text, source_ref)
VALUES (
  239,
  1,
  $json$[
    {
      "t": "list",
      "imp": "core",
      "title": "C 语言源程序与执行全流程",
      "items": [
        "C 语言是一门面向过程的==结构化高级程序设计语言==，兼顾高级语言易读性与底层内存操作能力。",
        "源程序文件扩展名为 ==`.c`==，经**编译（Compile）**生成二进制目标文件 ==`.obj`==，再与标准库函数**链接（Link）**生成可执行文件 ==`.exe`==。",
        "计算机硬件只能直接执行二进制机器指令，==C 源程序与 `.obj` 目标文件均不能直接运行==。"
      ]
    },
    {
      "t": "tree",
      "imp": "key",
      "title": "C 程序函数构成与结构化设计框架",
      "nodes": [
        {
          "label": "C 源程序基本单位：函数（Function）",
          "desc": "一个 C 程序由一个主函数和若干个（0 个或多个）其他函数构成",
          "children": [
            { "label": "主函数 main()", "desc": "程序唯一入口，有且仅有 1 个，位置可任意，程序总从 main 开始并在 main 结束" },
            { "label": "自定义函数", "desc": "由函数首部（返回值类型、函数名、形参表）和函数体（花括号 {}）组成" },
            { "label": "标准库函数", "desc": "如 printf / scanf / strlen 等；C 语言本身不提供输入输出语句，I/O 均通过调用库函数完成" }
          ]
        },
        {
          "label": "结构化程序设计三大原则與三种基本结构",
          "desc": "任何复杂算法均可由三种基本结构组合实现",
          "children": [
            { "label": "设计原则", "desc": "自顶向下、逐步求精、模块化（以函数为模块单位，可独立编译）" },
            { "label": "三种基本控制结构", "desc": "顺序结构、选择（分支）结构、循环结构" }
          ]
        }
      ]
    },
    {
      "t": "code",
      "imp": "key",
      "title": "标准 C 程序结构示例（先声明、后调用）",
      "lang": "c",
      "code": "#include <stdio.h>\n\n/* 函数声明：若自定义函数定义在 main 之后，调用前必须先声明 */\nint add(int a, int b);\n\nint main(void) {\n    int x = 10, y = 20; // 变量先定义后使用\n    int result = add(x, y);\n    printf(\"sum = %d\\n\", result);\n    return 0;\n}\n\n/* 自定义函数定义：函数首部 + 函数体 {} */\nint add(int a, int b) {\n    return a + b;\n}"
    },
    {
      "t": "callout",
      "imp": "core",
      "title": "高频判断与选择易错点",
      "items": [
        "【易错 1】误认为程序从文件中的第 1 个函数开始执行 → 错！不论 `main` 写在文件开头、中间还是末尾，==程序永远从 `main` 函数开始执行==。",
        "【易错 2】误认为 `printf` 和 `scanf` 是 C 语言的关键字或内置语句 → 错！==C 语言本身没有输入输出语句==，输入输出均由 `<stdio.h>` 库函数提供。",
        "【易错 3】函数定义与函数调用：==函数定义绝对不允许嵌套==（不能在一个函数体内定义另一个函数），但==函数调用允许嵌套和递归==。"
      ]
    }
  ]$json$::jsonb,
  'C语言源程序与执行全流程 .c .obj .exe 编译 链接 主函数 main 函数首部 函数体 结构化程序设计 自顶向下 逐步求精 模块化 顺序结构 选择结构 循环结构 printf scanf 库函数',
  '{"source":"ops_pdf_p8_p9 + s1_1_clean"}'::jsonb
)
ON CONFLICT (node_id, rev_no) DO UPDATE
SET blocks = EXCLUDED.blocks,
    search_text = EXCLUDED.search_text,
    source_ref = EXCLUDED.source_ref;

INSERT INTO kb_entry (node_id, status, published_rev, updated_at)
VALUES (239, 'published', 1, now())
ON CONFLICT (node_id) DO UPDATE
SET status = 'published', published_rev = 1, updated_at = now();

-- 2) S1-1.2（node_id = 240）：头文件，数据说明，程序注释
INSERT INTO kb_revision (node_id, rev_no, blocks, search_text, source_ref)
VALUES (
  240,
  1,
  $json$[
    {
      "t": "list",
      "imp": "core",
      "title": "文件包含预处理（#include）规则",
      "items": [
        "调用标准库函数前需通过 `#include` 引入对应头文件；==预处理指令以 `#` 开头，行末不加分号==。",
        "`#include <文件名>`：==直接到系统标准库目录查找==，用于 `<stdio.h>`、`<math.h>`、`<string.h>`、`<stdlib.h>` 等标准头文件。",
        "`#include \"文件名\"`：==先在当前源文件所在目录查找==，找不到再去系统标准库目录查找，常用于自定义头文件。"
      ]
    },
    {
      "t": "table",
      "imp": "key",
      "title": "常用标准头文件与基本数据类型字节数对照",
      "headers": ["类别 / 类型", "头文件或 32 位字节", "64 位字节", "典型用途与说明"],
      "rows": [
        ["<stdio.h>", "标准输入输出", "标准输入输出", "printf, scanf, getchar, putchar, fopen, fclose"],
        ["<string.h>", "字符串处理", "字符串处理", "strlen, strcpy, strcat, strcmp, memset"],
        ["<math.h>", "数学函数", "数学函数", "sqrt, pow, fabs, sin, cos（返回值多为 double）"],
        ["<stdlib.h>", "标准通用库", "标准通用库", "malloc, calloc, free, atoi, atof, rand, exit"],
        ["char", "1 字节", "1 字节", "字符型 / 单字节整数（1 Byte = 8 bit）"],
        ["short", "2 字节", "2 字节", "短整型"],
        ["int / float", "4 字节", "4 字节", "基本整型 / 单精度浮点型"],
        ["double / long long", "8 字节", "8 字节", "双精度浮点型 / 64 位长整型"]
      ]
    },
    {
      "t": "list",
      "imp": "core",
      "title": "程序注释的语法与编译特性",
      "items": [
        "单行注释：以 `//` 开始，持续到本行末尾。",
        "块注释（多行注释）：以 `/*` 开始，到**最近遇到的第一个 `*/` 结束**；==`/* ... */` 块注释绝对不能嵌套==。",
        "编译特性：注释在预处理阶段会被**替换为一个空格**，==不产生任何目标代码，对程序运行速度与体积无任何影响==。"
      ]
    }
  ]$json$::jsonb,
  '头文件 #include stdio.h string.h math.h stdlib.h 数据类型 字节 char short int float double 程序注释 单行注释 块注释 不可嵌套',
  '{"source":"ops_pdf_p9_p10 + s1_1_clean"}'::jsonb
)
ON CONFLICT (node_id, rev_no) DO UPDATE
SET blocks = EXCLUDED.blocks,
    search_text = EXCLUDED.search_text,
    source_ref = EXCLUDED.source_ref;

INSERT INTO kb_entry (node_id, status, published_rev, updated_at)
VALUES (240, 'published', 1, now())
ON CONFLICT (node_id) DO UPDATE
SET status = 'published', published_rev = 1, updated_at = now();

-- 3) S1-1.3（node_id = 241）：源程序的书写格式
INSERT INTO kb_revision (node_id, rev_no, blocks, search_text, source_ref)
VALUES (
  241,
  1,
  $json$[
    {
      "t": "list",
      "imp": "core",
      "title": "C 源程序书写强制性语法规则",
      "items": [
        "==C 语言严格区分大小写==：所有关键字（如 `int`, `if`, `return`）和标准库函数名必须全部使用**小写字母**；`Main` 或 `PRINTF` 均不是原关键字/库函数。",
        "==分号 `;` 是 C 语句的组成部分==（而不仅是分隔符）：每条执行语句、变量定义、函数声明末尾必须有分号；单独一个 `;` 构成合法的**空语句**。",
        "==不加分号的 3 类位置==：预处理指令（`#include`、`#define`）末尾、函数定义首部 `int main(void)` 末尾、复合语句右花括号 `}` 之后（结构体/数组初始化除外）。",
        "复合语句（语句块）：用一对花括号 `{}` 括起来的多条语句在语法上视为**一条单语句**，可出现在任何允许单语句的位置（如 `if` / `for` 分支内）。"
      ]
    },
    {
      "t": "callout",
      "imp": "key",
      "title": "自由书写格式与编码规范",
      "items": [
        "C 语言书写格式自由：**一行内可以写多条语句**，一条语句也可以拆成多行书写（但不能把一个标识符、关键字或字符串字面量从中间拆断）。",
        "缩进与对齐（如 K&R 风格、Allman 风格）仅用于提升代码可读性，==C 编译器不依赖缩进判断代码块归属==，代码块范围只由 `{}` 决定！"
      ]
    }
  ]$json$::jsonb,
  '源程序书写格式 区分大小写 关键字小写 分号 空语句 复合语句 花括号 自由书写格式 缩进风格',
  '{"source":"ops_pdf_p10_p11 + s1_1_clean"}'::jsonb
)
ON CONFLICT (node_id, rev_no) DO UPDATE
SET blocks = EXCLUDED.blocks,
    search_text = EXCLUDED.search_text,
    source_ref = EXCLUDED.source_ref;

INSERT INTO kb_entry (node_id, status, published_rev, updated_at)
VALUES (241, 'published', 1, now())
ON CONFLICT (node_id) DO UPDATE
SET status = 'published', published_rev = 1, updated_at = now();

COMMIT;
