-- Phase 3 知识库残余低清/水印配图重绘替换迁移脚本 (2026-11-14)
-- 目标节点: 263 (S1-6.4 二分查找), 290 (S3-1.3 用例图), 297 (S3-3.2 顺序图)

BEGIN;

-- Step 1: 删除 7 条已替换的旧图资产记录
DELETE FROM kb_asset WHERE path IN (
  '/kb-assets/skill/p88_r0_51d1062147a5759f.png',
  '/kb-assets/skill/p88_r2_a558f392e6ddedd1.png',
  '/kb-assets/skill/p99_r0_51b5c92e49596ec6.png',
  '/kb-assets/skill/p99_r1_7cfd1ffee85bc5f3.png',
  '/kb-assets/skill/p99_r2_9c2fbe68472b6892.png',
  '/kb-assets/skill/p48_r2_629900eac28fcd26.png',
  '/kb-assets/skill/p49_r0_cef14298b3aecc89.png'
);

-- Step 2: 注册 7 张高清自绘 2x PNG 资产记录
INSERT INTO kb_asset (sha256, path, w, h, kind, license) VALUES ('6f910cdd61430abb9f33dbe587e914adbe6900862101f1291efbae98fdd55c21', '/kb-assets/refinement/s313-actor-symbol.png', 1720, 624, 'diagram', 'self-drawn') ON CONFLICT (sha256) DO NOTHING;
INSERT INTO kb_asset (sha256, path, w, h, kind, license) VALUES ('049e6ccea09dd1151929ea11e34c794331e9e376f5764984916dbc3df0408943', '/kb-assets/refinement/s313-usecase-include-extend.png', 1880, 616, 'diagram', 'self-drawn') ON CONFLICT (sha256) DO NOTHING;
INSERT INTO kb_asset (sha256, path, w, h, kind, license) VALUES ('9a7dbda20e885212d5a10215228d4b2aed2b2c29d4133346eb01b3f947258cc6', '/kb-assets/refinement/s332-sync-message.png', 1720, 496, 'diagram', 'self-drawn') ON CONFLICT (sha256) DO NOTHING;
INSERT INTO kb_asset (sha256, path, w, h, kind, license) VALUES ('523d7937005e78049231b704b2724a98f5240788e68bf69ada57ea920e7ee5b7', '/kb-assets/refinement/s332-return-message.png', 1720, 996, 'diagram', 'self-drawn') ON CONFLICT (sha256) DO NOTHING;
INSERT INTO kb_asset (sha256, path, w, h, kind, license) VALUES ('06173e3be959ce9d5c53b45751dc6bc4242bcfd75111b66a2744b97f92b67dce', '/kb-assets/refinement/s332-self-message.png', 1720, 1044, 'diagram', 'self-drawn') ON CONFLICT (sha256) DO NOTHING;
INSERT INTO kb_asset (sha256, path, w, h, kind, license) VALUES ('bac06015d69b57585e33544924de327c29964dfad25b04c63cbb121655a818bf', '/kb-assets/refinement/s164-binary-search-ab.png', 2280, 700, 'diagram', 'self-drawn') ON CONFLICT (sha256) DO NOTHING;
INSERT INTO kb_asset (sha256, path, w, h, kind, license) VALUES ('0b2144b1da8a94505355030c353022fd35a91bb3bef0e33934e100a9e8e83210', '/kb-assets/refinement/s164-binary-search-c.png', 1720, 768, 'diagram', 'self-drawn') ON CONFLICT (sha256) DO NOTHING;

-- Node 263 (S1-6.4) rev 5 -> 6
DO $$
DECLARE
  v_actual INT;
  v_expected INT := 5;
BEGIN
  SELECT published_rev INTO v_actual FROM kb_entry WHERE node_id = 263 FOR UPDATE;
  IF v_actual IS DISTINCT FROM v_expected THEN
    RAISE EXCEPTION 'Optimistic lock mismatch for node 263: expected %, got %', v_expected, v_actual;
  END IF;
  INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref, created_at)
  VALUES (263, 6, $p3a_b_263$[{"t": "list", "id": "s1-6-4-b1", "imp": "core", "items": ["1、==排序==", "（1）^^将无序的数组通过排序算法处理之后实现升序或降序，排序后的数组将按顺序进行存放。^^", "（2）常用的排序算法：==①~④是算法原理和代码是常考点==。其他可以了解一下。"], "title": "", "ordered": false}, {"h": 552, "t": "img", "w": 1376, "id": "s1-6-4-b2", "alt": "七大内部排序算法汇总思维导图（重点标注选择、冒泡、快速与直接插入排序）", "imp": "normal", "src": "/kb-assets/skill/p45_r1_61c9bcf671157b68.png", "title": "", "caption": "常用数组排序算法分类思维导图（重点掌握选择、冒泡、快速与直接插入四种算法）"}, {"t": "list", "id": "s1-6-4-b3", "imp": "core", "items": ["2、==选择排序法==", "（1）原理", "==①、升序原理：第 1 趟从 `a[0 ~ n-1]` 中找出最小元素的下标 `index` 并与 `a[0]` 交换，第一轮之后确定最小元素；第 2 趟再从剩余元素中选出最小元素与 `a[1]` 交换，直到最后一轮比较交换结束即可完成升序排序。==", "==②、降序即，每次都找大的。==", "（2）执行过程", "（3）源代码（升序）"], "title": "", "ordered": false}, {"h": 924, "t": "img", "w": 1880, "id": "s1-6-4-b4", "alt": "选择排序每趟选出最小元素下标 index 归位执行过程（以 9,6,15,4,2 为例）与 C 语言升序源代码", "imp": "normal", "src": "/kb-assets/refinement/s164-selection-sort.png", "title": "", "caption": "选择排序（升序）过程分解与下标记录法源代码（`9,6,15,4,2` 四趟归位为 `2,4,6,9,15`）"}, {"t": "code", "id": "s1-6-4-selection-c", "imp": "normal", "code": "#include <stdio.h>\n\nvoid selection_sort(int a[], int n) {\n    int i, j, index, t;\n    for (i = 0; i < n - 1; i++) {\n        index = i;                  /* 记录本趟最小元素下标 */\n        for (j = i + 1; j < n; j++) /* j = index + 1 也可 */\n            if (a[index] > a[j])    /* 降序只需改为 a[index] < a[j] */\n                index = j;\n        t = a[index];\n        a[index] = a[i];\n        a[i] = t;\n    }\n}\n\nint main(void) {\n    int a[] = {9, 6, 15, 4, 2};\n    int n = (int)(sizeof(a) / sizeof(a[0]));\n    selection_sort(a, n);\n    for (int i = 0; i < n; i++)\n        printf(\"%d%c\", a[i], i == n - 1 ? '\\n' : ' '); /* 输出：2 4 6 9 15 */\n    return 0;\n}", "lang": "c", "title": "选择排序（升序，下标记录法，2027 技能 P40 补全完整代码）"}, {"t": "list", "id": "s1-6-4-b5", "imp": "core", "items": ["3、==冒泡排序法==", "（1）原理", "①、升序，则从前面往后开始，依此==比较相邻的两个元素的大小==，较==大==的==下沉==，较==小==的==上升==。第一轮过后，最大的元素就放在最后一位了。第二轮过后，次大的元素就放在倒数第二位了，之后依此类推。", "②、降序，则从前面往后开始，依此==比较相邻的两个元素的大小==，较==小==的==下沉==，较==大==的==上升==。第一轮过后，最小的元素就放在最后一位了。第二轮过后，次小的元素就放在倒数第二位了，之后依此类推。", "（2）执行过程", "（3）源代码（升序）"], "title": "", "ordered": false}, {"h": 463, "t": "img", "w": 1370, "id": "s1-6-4-b6", "alt": "冒泡排序每趟相邻两两比较让最值上浮示意图及 C 语言升序源代码", "imp": "normal", "src": "/kb-assets/skill/p46_r1_a391ba5f649e9dfc.png", "title": "", "caption": "冒泡排序（升序）：相邻元素两两比较交换沉底/上浮过程分解及双重循环 C 代码"}, {"t": "list", "id": "s1-6-4-b7", "imp": "core", "items": ["执行过程源代码（升序）", "4、==快速排序法==", "（1）原理==通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另外一部分的所有数据都要小，然后再按此方法对这两部分数据分别进行快速排序，整个排序过程可以递归进行，以此达到整个数据变成有序序列。==", "（2）执行过程：", "（3）源代码（升序）"], "title": "", "ordered": false}, {"h": 713, "t": "img", "w": 1364, "id": "s1-6-4-b8", "alt": "快速排序以基准枢轴一趟分区递归分治示意图及 C 语言源代码", "imp": "normal", "src": "/kb-assets/skill/p47_r0_0e9164206822d62e.png", "title": "", "caption": "快速排序（升序）：哨兵双指针围绕基准值左右分区与分治递归 C 语言实现"}, {"t": "list", "id": "s1-6-4-b9", "imp": "core", "items": ["执行过程源代码（升序）", "5、==直接插入排序法==", "（1）原理==每一步将一个待排序的元素,按其排序码的大小,插入到前面已经排好序的一组元素的适当位置上去,直到元素全部插入为止。==", "（2）执行过程", "（3）源代码（升序）"], "title": "", "ordered": false}, {"h": 430, "t": "img", "w": 1334, "id": "s1-6-4-b10", "alt": "直接插入排序将无序元素依次插入前面有序区间过程图及 C 语言代码", "imp": "normal", "src": "/kb-assets/skill/p47_r1_bef6db88a10b6120.png", "title": "", "caption": "直接插入排序（升序）：逐一取元素按值插入前段有序序列过程分解与 C 语言实现"}, {"t": "list", "id": "s1-6-4-b11", "imp": "core", "items": ["执行过程源代码（升序）", "6、==查找==", "（1）^^在数据源（一般是数组）中查找是否有待查找元素^^。", "（2）常用查找的算法："], "title": "", "ordered": false}, {"h": 590, "t": "img", "w": 1351, "id": "s1-6-4-b12", "alt": "顺序查找与二分查找适用前提条件对比思维导图", "imp": "normal", "src": "/kb-assets/skill/p48_r0_a85fc216f9a66ef8.png", "title": "", "caption": "数组常用查找算法对比导图：顺序查找（任意无序表）与二分查找（仅限有序顺序表）"}, {"t": "list", "id": "s1-6-4-b13", "imp": "core", "items": ["7、==顺序查找==", "（1）原理==顺序查找是从表的一端开始，依次扫描表中的各个元素，并与所要查找的数进行比较。==", "（2）执行过程：", "（3）源代码"], "title": "", "ordered": false}, {"h": 372, "t": "img", "w": 1339, "id": "s1-6-4-b14", "alt": "顺序查找逐下标依次扫描匹配关键字示意图及 C 语言源代码", "imp": "normal", "src": "/kb-assets/skill/p48_r1_662572c0ebf91dd2.png", "title": "", "caption": "顺序查找过程示意（从一端向另一端逐个比对目标值）及 C 语言循环查找代码"}, {"t": "list", "id": "s1-6-4-b15", "imp": "core", "items": ["执行过程源代码", "8、==二分查找（折半查找）==", "（1）==如果数据无序，先要进行排序操作，每次都通过跟区间的中间元素对比，将待查找的区间缩小为之前的一半，直到找到要查找的元素，或者区间被缩小为 0。==", "（2）执行过程：对静态查找表{5,13,19,21,37,56,64,75,80,88,92}采用二分查找算法查找关键字为 ==21== 的过程为：图（a）~图(c)所示；"], "title": "", "ordered": false}, {"h": 700, "t": "img", "w": 2280, "id": "s1-6-4-b16", "alt": "有序表二分查找第 1 与第 2 轮折半缩小区间 (a)/(b) 步骤图", "imp": "normal", "src": "/kb-assets/refinement/s164-binary-search-ab.png", "title": "", "caption": "二分查找关键字 `21` 过程图解 (a)(b)：计算中点下标 `mid` 并折半排除右半区间"}, {"t": "list", "id": "s1-6-4-b17", "imp": "normal", "items": ["图二分查找的过程（a）        图二分查找的过程（b）"], "title": "", "ordered": false}, {"h": 768, "t": "img", "w": 1720, "id": "s1-6-4-b18", "alt": "有序表二分查找第 3 轮精准定位目标元素 (c) 步骤图", "imp": "normal", "src": "/kb-assets/refinement/s164-binary-search-c.png", "title": "", "caption": "二分查找关键字 `21` 过程图解 (c)：`mid` 精准命中目标元素 `21` 结束查找"}, {"t": "list", "id": "s1-6-4-b19", "imp": "normal", "items": ["图二分查找的过程（C）", "（3）源代码：图源代码所示。"], "title": "", "ordered": false}, {"h": 786, "t": "img", "w": 1250, "id": "s1-6-4-b20", "alt": "C 语言二分查找算法 while(left<=right) 循环完整源代码图", "imp": "normal", "src": "/kb-assets/skill/p49_r1_a84fb07818761aa3.png", "title": "", "caption": "二分查找标准 C 语言实现源码：利用 `left`、`right`、`mid` 折半收敛查找目标值"}, {"t": "list", "id": "s1-6-4-b21", "imp": "normal", "items": ["图源代码"], "title": "", "ordered": false}, {"h": 623, "t": "img", "w": 1223, "id": "s1-6-4-b22", "alt": "C 语言考试常考标准库函数与自定义函数分类总结思维导图", "imp": "normal", "src": "/kb-assets/skill/p50_r0_1b513e9e3d11bb1e.png", "title": "", "caption": "C 语言核心考纲函数全景导图：标准 IO、字符串、字符、数学、`stdlib` 与用户自定义函数"}, {"t": "code", "id": "s1-6-4-b23", "imp": "normal", "code": "#include <stdio.h>\n\nvoid bubble_sort(int a[], int n) {\n    int i, j, temp;\n    for (i = 0; i < n - 1; i++) {\n        for (j = 0; j < n - 1 - i; j++) {\n            if (a[j] > a[j + 1]) {\n                temp = a[j];\n                a[j] = a[j + 1];\n                a[j + 1] = temp;\n            }\n        }\n    }\n}\n\nint binary_search(const int a[], int n, int key) {\n    int low = 0, high = n - 1;\n    while (low <= high) {\n        int mid = (low + high) / 2;\n        if (a[mid] == key) return mid;\n        if (a[mid] < key) low = mid + 1;\n        else high = mid - 1;\n    }\n    return -1;\n}\n\nint main(void) {\n    int arr[5] = {9, 3, 7, 1, 5};\n    bubble_sort(arr, 5);\n    printf(\"index of 7: %d\\n\", binary_search(arr, 5, 7));\n    return 0;\n}", "lang": "c", "title": "冒泡排序与折半查找标准 C 实现（程序填空高频母题）"}, {"t": "callout", "id": "s1-6-4-b24", "imp": "normal", "kind": "tip", "text": "手写冒泡排序（升序）双重循环骨架：\n• 外层控制排序轮数：`for (i = 0; i < n - 1; i++)`（共 `n - 1` 轮）；\n• 内层相邻两数比较交换：`for (j = 0; j < n - 1 - i; j++) if (a[j] > a[j + 1]) { t = a[j]; a[j] = a[j + 1]; a[j + 1] = t; }`（每轮将当前最大数沉底）；\n• 选择排序对照：内层仅记录最小元下标 `index`，每轮结束后仅交换一次，不依赖相邻元素交换。", "title": "考向复习提示：经典冒泡排序算法手写代码骨架"}, {"t": "callout", "id": "s1-6-4-b25", "imp": "core", "kind": "trap", "text": "专转本编程大题常考高效查找：利用一维数组进行二分查找（折半查找）时，==必须先通过排序算法将数组元素整理为严格升序（或降序）单调有序状态==，才能使用 `low`, `high`, `mid = (low + high) / 2` 进行对半查找；若数组无序，折半查找算法逻辑将彻底失效！", "title": "高频易错陷阱：折半查找算法的前提数组必须有序"}]$p3a_b_263$::jsonb, '', $p3a_s_263$1、排序
（1）将无序的数组通过排序算法处理之后实现升序或降序，排序后的数组将按顺序进行存放。
（2）常用的排序算法：①~④是算法原理和代码是常考点。其他可以了解一下。
常用数组排序算法分类思维导图（重点掌握选择、冒泡、快速与直接插入四种算法）
七大内部排序算法汇总思维导图（重点标注选择、冒泡、快速与直接插入排序）
2、选择排序法
（1）原理
①、升序原理：第 1 趟从 a[0 ~ n-1] 中找出最小元素的下标 index 并与 a[0] 交换，第一轮之后确定最小元素；第 2 趟再从剩余元素中选出最小元素与 a[1] 交换，直到最后一轮比较交换结束即可完成升序排序。
②、降序即，每次都找大的。
（2）执行过程
（3）源代码（升序）
选择排序（升序）过程分解与下标记录法源代码（9,6,15,4,2 四趟归位为 2,4,6,9,15）
选择排序每趟选出最小元素下标 index 归位执行过程（以 9,6,15,4,2 为例）与 C 语言升序源代码
选择排序（升序，下标记录法，2027 技能 P40 补全完整代码）
#include <stdio.h>

void selection_sort(int a[], int n) {
 int i, j, index, t;
 for (i = 0; i < n - 1; i++) {
 index = i; /* 记录本趟最小元素下标 */
 for (j = i + 1; j < n; j++) /* j = index + 1 也可 */
 if (a[index] > a[j]) /* 降序只需改为 a[index] < a[j] */
 index = j;
 t = a[index];
 a[index] = a[i];
 a[i] = t;
 }
}

int main(void) {
 int a[] = {9, 6, 15, 4, 2};
 int n = (int)(sizeof(a) / sizeof(a[0]));
 selection_sort(a, n);
 for (int i = 0; i < n; i++)
 printf("%d%c", a[i], i == n - 1 ? '\n' : ' '); /* 输出：2 4 6 9 15 */
 return 0;
}
3、冒泡排序法
（1）原理
①、升序，则从前面往后开始，依此比较相邻的两个元素的大小，较大的下沉，较小的上升。第一轮过后，最大的元素就放在最后一位了。第二轮过后，次大的元素就放在倒数第二位了，之后依此类推。
②、降序，则从前面往后开始，依此比较相邻的两个元素的大小，较小的下沉，较大的上升。第一轮过后，最小的元素就放在最后一位了。第二轮过后，次小的元素就放在倒数第二位了，之后依此类推。
（2）执行过程
（3）源代码（升序）
冒泡排序（升序）：相邻元素两两比较交换沉底/上浮过程分解及双重循环 C 代码
冒泡排序每趟相邻两两比较让最值上浮示意图及 C 语言升序源代码
执行过程源代码（升序）
4、快速排序法
（1）原理通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另外一部分的所有数据都要小，然后再按此方法对这两部分数据分别进行快速排序，整个排序过程可以递归进行，以此达到整个数据变成有序序列。
（2）执行过程：
（3）源代码（升序）
快速排序（升序）：哨兵双指针围绕基准值左右分区与分治递归 C 语言实现
快速排序以基准枢轴一趟分区递归分治示意图及 C 语言源代码
执行过程源代码（升序）
5、直接插入排序法
（1）原理每一步将一个待排序的元素,按其排序码的大小,插入到前面已经排好序的一组元素的适当位置上去,直到元素全部插入为止。
（2）执行过程
（3）源代码（升序）
直接插入排序（升序）：逐一取元素按值插入前段有序序列过程分解与 C 语言实现
直接插入排序将无序元素依次插入前面有序区间过程图及 C 语言代码
执行过程源代码（升序）
6、查找
（1）在数据源（一般是数组）中查找是否有待查找元素。
（2）常用查找的算法：
数组常用查找算法对比导图：顺序查找（任意无序表）与二分查找（仅限有序顺序表）
顺序查找与二分查找适用前提条件对比思维导图
7、顺序查找
（1）原理顺序查找是从表的一端开始，依次扫描表中的各个元素，并与所要查找的数进行比较。
（2）执行过程：
（3）源代码
顺序查找过程示意（从一端向另一端逐个比对目标值）及 C 语言循环查找代码
顺序查找逐下标依次扫描匹配关键字示意图及 C 语言源代码
执行过程源代码
8、二分查找（折半查找）
（1）如果数据无序，先要进行排序操作，每次都通过跟区间的中间元素对比，将待查找的区间缩小为之前的一半，直到找到要查找的元素，或者区间被缩小为 0。
（2）执行过程：对静态查找表{5,13,19,21,37,56,64,75,80,88,92}采用二分查找算法查找关键字为 21 的过程为：图（a）~图(c)所示；
二分查找关键字 21 过程图解 (a)(b)：计算中点下标 mid 并折半排除右半区间
有序表二分查找第 1 与第 2 轮折半缩小区间 (a)/(b) 步骤图
图二分查找的过程（a） 图二分查找的过程（b）
二分查找关键字 21 过程图解 (c)：mid 精准命中目标元素 21 结束查找
有序表二分查找第 3 轮精准定位目标元素 (c) 步骤图
图二分查找的过程（C）
（3）源代码：图源代码所示。
二分查找标准 C 语言实现源码：利用 left、right、mid 折半收敛查找目标值
C 语言二分查找算法 while(left<=right) 循环完整源代码图
图源代码
C 语言核心考纲函数全景导图：标准 IO、字符串、字符、数学、stdlib 与用户自定义函数
C 语言考试常考标准库函数与自定义函数分类总结思维导图
冒泡排序与折半查找标准 C 实现（程序填空高频母题）
#include <stdio.h>

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
 if (a[mid] == key) return mid;
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
}
考向复习提示：经典冒泡排序算法手写代码骨架
手写冒泡排序（升序）双重循环骨架：
• 外层控制排序轮数：for (i = 0; i < n - 1; i++)（共 n - 1 轮）；
• 内层相邻两数比较交换：for (j = 0; j < n - 1 - i; j++) if (a[j] > a[j + 1]) { t = a[j]; a[j] = a[j + 1]; a[j + 1] = t; }（每轮将当前最大数沉底）；
• 选择排序对照：内层仅记录最小元下标 index，每轮结束后仅交换一次，不依赖相邻元素交换。
高频易错陷阱：折半查找算法的前提数组必须有序
专转本编程大题常考高效查找：利用一维数组进行二分查找（折半查找）时，必须先通过排序算法将数组元素整理为严格升序（或降序）单调有序状态，才能使用 low, high, mid = (low + high) / 2 进行对半查找；若数组无序，折半查找算法逻辑将彻底失效！$p3a_s_263$, $p3a_r_263${"pdf": "操作技能复习.pdf", "extra": ["考纲三级节点: S1-6.4 使用一维数组解决批量数据查找或排序等问题。", "p1_refine_20261114", "p3_zhihu27_20261114", "r1_cleanup_20261114", "p3_assets_redraw_20261114"], "pages": [45, 46, 47, 48, 49, 50], "spans": 29}$p3a_r_263$::jsonb, NOW());
  UPDATE kb_entry SET published_rev = 6, updated_at = NOW() WHERE node_id = 263;
END $$;

-- Node 290 (S3-1.3) rev 4 -> 5
DO $$
DECLARE
  v_actual INT;
  v_expected INT := 4;
BEGIN
  SELECT published_rev INTO v_actual FROM kb_entry WHERE node_id = 290 FOR UPDATE;
  IF v_actual IS DISTINCT FROM v_expected THEN
    RAISE EXCEPTION 'Optimistic lock mismatch for node 290: expected %, got %', v_expected, v_actual;
  END IF;
  INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref, created_at)
  VALUES (290, 5, $p3a_b_290$[{"t": "list", "id": "s3-1-3-b1", "imp": "core", "items": ["1、用例图", "（1）用例图（use case diagram）以图解的形式概括了系统中的不同参与者和用例，并显示了哪些参与者能够参与哪些用例。", "（2）图例图元素：", "①、==参与者（Actor）==：==小人=="], "title": "", "ordered": false}, {"h": 624, "t": "img", "w": 1720, "id": "s3-1-3-b2", "alt": "UML 用例图中参与者（Actor）通用人形小人简笔画图标符号", "imp": "normal", "src": "/kb-assets/refinement/s313-actor-symbol.png", "title": "", "caption": "UML 用例图图元——参与者（Actor）通用人形符号表示方法"}, {"t": "list", "id": "s3-1-3-b3", "imp": "core", "items": ["②、==用例==：==椭圆=="], "title": "", "ordered": false}, {"h": 129, "t": "img", "w": 350, "id": "s3-1-3-b4", "alt": "UML 用例图中代表具体系统功能用例的椭圆基本符号", "imp": "normal", "src": "/kb-assets/skill/p88_r1_c9ed5b1947f1f0dc.png", "title": "", "caption": "UML 用例图图元——用例（Use Case）水平椭圆图形符号"}, {"t": "list", "id": "s3-1-3-b5", "imp": "core", "items": ["③、以及用例图中对象间到的==关系(包含、扩展和泛化)==：==箭头==其中关系有==包含、扩展==是用例图中特有的，==泛化==在其他类图中同样存在。"], "title": "", "ordered": false}, {"h": 616, "t": "img", "w": 1880, "id": "s3-1-3-b6", "alt": "UML 用例图包含 «include» 与扩展 «extend» 关系带构造型虚线箭头符号", "imp": "normal", "src": "/kb-assets/refinement/s313-usecase-include-extend.png", "title": "", "caption": "UML 用例之间关系图元符号：带有 `<<include>>` 或 `<<extend>>` 构造型标注的虚线箭头"}, {"t": "list", "id": "s3-1-3-b7", "imp": "core", "items": ["==1）包含（<< include>>）用例==：==当可以从两个或两个以上的用例中提取公共行为时，应该使用包含的关系来表示它们。==其中这个提取出来的公共用例成为抽象用例，而把原始用例成为基本用例或基础用例。", "其中“<<include>>”是包含关系的构造型，箭头指向抽象用例。"], "title": "", "ordered": false}, {"h": 728, "t": "img", "w": 796, "id": "s3-1-3-b8", "alt": "银行 ATM 与电商系统用 «include» 提取“登录/验证”公共子用例的用例图实例", "imp": "normal", "src": "/kb-assets/skill/p88_r3_208f3621a7dc2f21.png", "title": "", "caption": "UML 包含关系（`<<include>>`）应用实例：基础业务用例指向提取出的公共“身份验证”子用例"}, {"t": "list", "id": "s3-1-3-b9", "imp": "core", "items": ["<<扩展>>", "==2）扩展(<<extend>>)用例==：==如果一个用例明显地混合了两种或者两种以上的不同场景，即根据情况可能发生多种分支，则可以将这个用例分为一个基本用例和一个或多个扩展用例，这样可能会使描述更加清晰。==扩展用例为基用例添加新的行为。扩展用例可以访问基用例的属性，因此他能根据基用例中扩展点的当前状态来决定是否执行自己。而扩展用例对基用例不可见。"], "title": "", "ordered": false}, {"h": 361, "t": "img", "w": 839, "id": "s3-1-3-b10", "alt": "使用 «extend» 由异常或可选扩展用例指向基础用例的用例图实例", "imp": "normal", "src": "/kb-assets/skill/p89_r0_f194789a0087533c.png", "title": "", "caption": "UML 扩展关系（`<<extend>>`）应用实例：可选附加或异常分支扩展用例反指回主基用例"}, {"t": "list", "id": "s3-1-3-b11", "imp": "core", "items": ["泛化", "==3）泛化用例==：==当多个用例共同拥有一种类似的结构和行为时，可以将他们的共性抽象成为父用例，其他的用例作为泛化关系的子用例。==在用例的泛化关系中，子用例是父用例的一种特殊形式，它继承了父用例的所有结构、行为、关系。其中三角箭头指向父用例。", "2、统一建模语言 UML 及其作用：统一建模语言（UML）是一种绘制软件蓝图的标准语言，可以用 UML 对软件密集型系统的制品进行可视化、详述和文档化。UML 是一种定义良好、易于表达、功能强大且普遍适用的可视化建模语言，它融入了软件工程领域的新思想、新方法和新技术。其作用范围不限于支持面向对象的分析与设计，还支持从需求分析开始的软件开发全过程；UML 的作用就是用多种图从静态和动态方面全面描述将要开发的系统。", "3、用例图在 UML 中的位置：用例图 参与者（Actor）+ 用例（Use Case）+ 关系。 结构图用于静态结构建模，如类图、对象图，属于设计视图。 行为图用于动态行为建模：用例图属于用例视图，状态图属于进程视图，交互图（如顺序图）用于描述对象之间的交互。", "4、UML 与用例图：UML（统一建模语言）是面向对象建模语言的标准，它可以对任何具有静态结构和动态行为的系统进行建模。其主要作用是帮助用户进行面向对象的描述和建模，可以描述软件从需求分析到软件实现和测试的全过程。"], "title": "", "ordered": false}, {"h": 328, "t": "img", "w": 1253, "id": "s3-1-3-b12", "alt": "参与者与用例间的泛化（继承）关系及空心三角箭头用例图实例", "imp": "normal", "src": "/kb-assets/skill/p89_r1_c4bd855f90314fe9.png", "title": "", "caption": "UML 用例图泛化关系应用实例：子用例/子参与者用实线空心三角箭头指向通用父用例/父角色"}, {"t": "callout", "id": "s3-1-3-b13", "imp": "core", "kind": "tip", "text": "• ==包含关系（`<<include>>`）==：基础用例执行时==必定且无条件包含==执行被包含用例（虚线箭头由基础用例指向公共用例，提取公共逻辑）；\n• ==扩展关系（`<<extend>>`）==：在特定扩展点条件满足时才会可选触发执行（虚线箭头由扩展用例指向基础用例）；\n• 泛化关系：参与者之间或用例之间的继承特化关系（实线带空心三角箭头）。", "title": "考向复习提示：用例之间三大关系（包含、扩展、泛化）"}, {"t": "callout", "id": "s3-1-3-b14", "imp": "core", "kind": "trap", "text": "专转本画图大题最高频扣分点：\n• ==`<<include>>` 箭头：从“基用例”指向“被包含的公共用例”==（基用例依赖并调用子功能）；\n• ==`<<extend>>` 箭头：从“扩展用例”指向“基用例”==（扩展用例为基用例提供可选附加功能）；无数考生由于惯性思维将 extend 箭头画反，直接导致全题得 0 分！", "title": "高频易错陷阱：include 与 extend 虚线箭头的指向方向恰好相反！"}]$p3a_b_290$::jsonb, '', $p3a_s_290$1、用例图
（1）用例图（use case diagram）以图解的形式概括了系统中的不同参与者和用例，并显示了哪些参与者能够参与哪些用例。
（2）图例图元素：
①、参与者（Actor）：小人
UML 用例图图元——参与者（Actor）通用人形符号表示方法
UML 用例图中参与者（Actor）通用人形小人简笔画图标符号
②、用例：椭圆
UML 用例图图元——用例（Use Case）水平椭圆图形符号
UML 用例图中代表具体系统功能用例的椭圆基本符号
③、以及用例图中对象间到的关系(包含、扩展和泛化)：箭头其中关系有包含、扩展是用例图中特有的，泛化在其他类图中同样存在。
UML 用例之间关系图元符号：带有 <<include>> 或 <<extend>> 构造型标注的虚线箭头
UML 用例图包含 «include» 与扩展 «extend» 关系带构造型虚线箭头符号
1）包含（<< include>>）用例：当可以从两个或两个以上的用例中提取公共行为时，应该使用包含的关系来表示它们。其中这个提取出来的公共用例成为抽象用例，而把原始用例成为基本用例或基础用例。
其中“<<include>>”是包含关系的构造型，箭头指向抽象用例。
UML 包含关系（<<include>>）应用实例：基础业务用例指向提取出的公共“身份验证”子用例
银行 ATM 与电商系统用 «include» 提取“登录/验证”公共子用例的用例图实例
<<扩展>>
2）扩展(<<extend>>)用例：如果一个用例明显地混合了两种或者两种以上的不同场景，即根据情况可能发生多种分支，则可以将这个用例分为一个基本用例和一个或多个扩展用例，这样可能会使描述更加清晰。扩展用例为基用例添加新的行为。扩展用例可以访问基用例的属性，因此他能根据基用例中扩展点的当前状态来决定是否执行自己。而扩展用例对基用例不可见。
UML 扩展关系（<<extend>>）应用实例：可选附加或异常分支扩展用例反指回主基用例
使用 «extend» 由异常或可选扩展用例指向基础用例的用例图实例
泛化
3）泛化用例：当多个用例共同拥有一种类似的结构和行为时，可以将他们的共性抽象成为父用例，其他的用例作为泛化关系的子用例。在用例的泛化关系中，子用例是父用例的一种特殊形式，它继承了父用例的所有结构、行为、关系。其中三角箭头指向父用例。
2、统一建模语言 UML 及其作用：统一建模语言（UML）是一种绘制软件蓝图的标准语言，可以用 UML 对软件密集型系统的制品进行可视化、详述和文档化。UML 是一种定义良好、易于表达、功能强大且普遍适用的可视化建模语言，它融入了软件工程领域的新思想、新方法和新技术。其作用范围不限于支持面向对象的分析与设计，还支持从需求分析开始的软件开发全过程；UML 的作用就是用多种图从静态和动态方面全面描述将要开发的系统。
3、用例图在 UML 中的位置：用例图 参与者（Actor）+ 用例（Use Case）+ 关系。 结构图用于静态结构建模，如类图、对象图，属于设计视图。 行为图用于动态行为建模：用例图属于用例视图，状态图属于进程视图，交互图（如顺序图）用于描述对象之间的交互。
4、UML 与用例图：UML（统一建模语言）是面向对象建模语言的标准，它可以对任何具有静态结构和动态行为的系统进行建模。其主要作用是帮助用户进行面向对象的描述和建模，可以描述软件从需求分析到软件实现和测试的全过程。
UML 用例图泛化关系应用实例：子用例/子参与者用实线空心三角箭头指向通用父用例/父角色
参与者与用例间的泛化（继承）关系及空心三角箭头用例图实例
考向复习提示：用例之间三大关系（包含、扩展、泛化）
• 包含关系（<<include>>）：基础用例执行时必定且无条件包含执行被包含用例（虚线箭头由基础用例指向公共用例，提取公共逻辑）；
• 扩展关系（<<extend>>）：在特定扩展点条件满足时才会可选触发执行（虚线箭头由扩展用例指向基础用例）；
• 泛化关系：参与者之间或用例之间的继承特化关系（实线带空心三角箭头）。
高频易错陷阱：include 与 extend 虚线箭头的指向方向恰好相反！
专转本画图大题最高频扣分点：
• <<include>> 箭头：从“基用例”指向“被包含的公共用例”（基用例依赖并调用子功能）；
• <<extend>> 箭头：从“扩展用例”指向“基用例”（扩展用例为基用例提供可选附加功能）；无数考生由于惯性思维将 extend 箭头画反，直接导致全题得 0 分！$p3a_s_290$, $p3a_r_290${"pdf": "操作技能复习.pdf", "extra": ["考纲三级节点: S3-1.3 绘制用例图。", "题库补充：统一建模语言 UML 及其作用 (32题)", "题库补充：用例图在 UML 中的位置 (23题)", "题库补充：UML 与用例图 (21题)", "p1_refine_20261114", "r1_cleanup_20261114", "p3_assets_redraw_20261114"], "pages": [88, 89], "spans": 28}$p3a_r_290$::jsonb, NOW());
  UPDATE kb_entry SET published_rev = 5, updated_at = NOW() WHERE node_id = 290;
END $$;

-- Node 297 (S3-3.2) rev 4 -> 5
DO $$
DECLARE
  v_actual INT;
  v_expected INT := 4;
BEGIN
  SELECT published_rev INTO v_actual FROM kb_entry WHERE node_id = 297 FOR UPDATE;
  IF v_actual IS DISTINCT FROM v_expected THEN
    RAISE EXCEPTION 'Optimistic lock mismatch for node 297: expected %, got %', v_expected, v_actual;
  END IF;
  INSERT INTO kb_revision (node_id, rev_no, blocks, html, search_text, source_ref, created_at)
  VALUES (297, 5, $p3a_b_297$[{"t": "list", "id": "s3-3-2-b1", "imp": "core", "items": ["1、==顺序图中消息==", "（1）==消息用从一个对象的生命线到另一个对象生命线的箭头表示==。", "（2）==箭头以时间顺序在图中从上到下排列。==", "（3）==消息可以激发某个操作、创建或解构某对象==。", "2、消息类型", "==（1）同步消息==", "==（2）返回消息==", "==（3）自关联消息==", "==（4）异步消息==", "3、==同步消息==", "（1）==一个对象向另一个对象发出同步消息后，将处于阻塞状态，一直等到另一个对象的回应。==", "（2）==消息的名称是被调用者的方法名==。", "（3）==UML 表示：带有实心箭头实线=="], "title": "", "ordered": false}, {"h": 496, "t": "img", "w": 1720, "id": "s3-3-2-b2", "alt": "UML 顺序图同步消息符号：带实心三角箭头的实线", "imp": "normal", "src": "/kb-assets/refinement/s332-sync-message.png", "title": "", "caption": "顺序图同步调用消息符号：带有实心箭头实线（调用方发出后阻塞等待返回）"}, {"t": "list", "id": "s3-3-2-b3", "imp": "core", "items": ["4、==返回消息==", "（1）==返回（return）消息表示从过程调用返回==", "（2）==非必要的，是可选的==。", "（3）==UML 表示：带普通箭头虚线表示=="], "title": "", "ordered": false}, {"h": 996, "t": "img", "w": 1720, "id": "s3-3-2-b4", "alt": "UML 顺序图返回消息符号：带普通开放箭头的虚线", "imp": "normal", "src": "/kb-assets/refinement/s332-return-message.png", "title": "", "caption": "顺序图返回消息符号：带有普通开放箭头的虚线（从被调用操作返回控制权或返回值）"}, {"t": "list", "id": "s3-3-2-b5", "imp": "core", "items": ["5、==自关联消息==", "（1）==自身调用自身的方法==。", "（2）==即自我调用的同步消息==。", "（3）==一般是用来描述对象内部函数的互相调用==。", "（4）==UML 表示：带普通箭头实线表示==", "（5）列举："], "title": "", "ordered": false}, {"h": 1044, "t": "img", "w": 1720, "id": "s3-3-2-b6", "alt": "对象生命线自身调用自身方法的自关联消息回指箭头实例", "imp": "normal", "src": "/kb-assets/refinement/s332-self-message.png", "title": "", "caption": "顺序图自关联（自身）消息示例：从对象激活框引出实线普通箭头折回同一生命线调用自身方法"}, {"t": "list", "id": "s3-3-2-b7", "imp": "core", "items": ["6、==异步消息==", "（1）==一个对象向另一个对象发出异步消息后，这个对象可以进行其他的操作，不需要等到另一个对象的响应。==", "（2）==UML 表示：带普通箭头实线表示==", "7、顺序图中的对象与消息布局：在顺序图中，对象安排在 X 轴：启动交互的对象放在最左边，随后接收消息的对象放在启动交互对象的右边。交互中对象发送和接收的消息沿着 Y 轴以时间增加的次序放置。在顺序图中，有的消息对应于激活，表示它将会激活一个对象，这种消息称为调用消息（Call Message）；如果消息没有对应的激活框，表示它不是一个调用消息，不会引发其他对象的活动，这种消息称为发送消息（Send Message）。 消息可分为：调用消息、返回消息、自身消息；或调用消息、发送消息；以及创建消息、销毁消息。"], "title": "", "ordered": false}, {"h": 424, "t": "img", "w": 469, "id": "s3-3-2-b8", "alt": "包含发出与返回交互控制流的顺序图调用消息序列实例", "imp": "normal", "src": "/kb-assets/skill/p100_r0_0a067cecc8dc2710.png", "title": "", "caption": "顺序图完整消息调用链实例：标注同步调用出发及完成后虚线返回的对应关联"}, {"t": "callout", "id": "s3-3-2-b9", "imp": "core", "kind": "tip", "text": "• ==同步调用消息（Synchronous Message）==：实线 + 实心三角箭头（发送方发出请求后必须挂起等待对方执行完成返回）；\n• ==异步消息（Asynchronous Message）==：实线 + 半角普通单开放细箭头（发送方发出消息后不等待立即继续执行后续操作）；\n• ==返回消息（Reply/Return Message）==：==虚线 + 普通细箭头==（表示被调操作执行完毕将结果返回给主调方）。", "title": "考向复习提示：顺序图中三大消息类型与箭头线型标准"}, {"t": "callout", "id": "s3-3-2-b10", "imp": "core", "kind": "trap", "text": "专转本大题规范绘图要求：==同步阻塞调用的箭头必须涂满填充为“黑色实心三角形箭头（▲）”==，而==异步消息必须是“普通线段开放式燕尾箭头（→）”==，返回结果必须使用“虚线”！线型或箭头画错在专转本上机阅卷中属于典型语法错误扣分点！", "title": "高频易错陷阱：同步消息实心箭头 vs 异步消息线箭头的线型混淆"}]$p3a_b_297$::jsonb, '', $p3a_s_297$1、顺序图中消息
（1）消息用从一个对象的生命线到另一个对象生命线的箭头表示。
（2）箭头以时间顺序在图中从上到下排列。
（3）消息可以激发某个操作、创建或解构某对象。
2、消息类型
（1）同步消息
（2）返回消息
（3）自关联消息
（4）异步消息
3、同步消息
（1）一个对象向另一个对象发出同步消息后，将处于阻塞状态，一直等到另一个对象的回应。
（2）消息的名称是被调用者的方法名。
（3）UML 表示：带有实心箭头实线
顺序图同步调用消息符号：带有实心箭头实线（调用方发出后阻塞等待返回）
UML 顺序图同步消息符号：带实心三角箭头的实线
4、返回消息
（1）返回（return）消息表示从过程调用返回
（2）非必要的，是可选的。
（3）UML 表示：带普通箭头虚线表示
顺序图返回消息符号：带有普通开放箭头的虚线（从被调用操作返回控制权或返回值）
UML 顺序图返回消息符号：带普通开放箭头的虚线
5、自关联消息
（1）自身调用自身的方法。
（2）即自我调用的同步消息。
（3）一般是用来描述对象内部函数的互相调用。
（4）UML 表示：带普通箭头实线表示
（5）列举：
顺序图自关联（自身）消息示例：从对象激活框引出实线普通箭头折回同一生命线调用自身方法
对象生命线自身调用自身方法的自关联消息回指箭头实例
6、异步消息
（1）一个对象向另一个对象发出异步消息后，这个对象可以进行其他的操作，不需要等到另一个对象的响应。
（2）UML 表示：带普通箭头实线表示
7、顺序图中的对象与消息布局：在顺序图中，对象安排在 X 轴：启动交互的对象放在最左边，随后接收消息的对象放在启动交互对象的右边。交互中对象发送和接收的消息沿着 Y 轴以时间增加的次序放置。在顺序图中，有的消息对应于激活，表示它将会激活一个对象，这种消息称为调用消息（Call Message）；如果消息没有对应的激活框，表示它不是一个调用消息，不会引发其他对象的活动，这种消息称为发送消息（Send Message）。 消息可分为：调用消息、返回消息、自身消息；或调用消息、发送消息；以及创建消息、销毁消息。
顺序图完整消息调用链实例：标注同步调用出发及完成后虚线返回的对应关联
包含发出与返回交互控制流的顺序图调用消息序列实例
考向复习提示：顺序图中三大消息类型与箭头线型标准
• 同步调用消息（Synchronous Message）：实线 + 实心三角箭头（发送方发出请求后必须挂起等待对方执行完成返回）；
• 异步消息（Asynchronous Message）：实线 + 半角普通单开放细箭头（发送方发出消息后不等待立即继续执行后续操作）；
• 返回消息（Reply/Return Message）：虚线 + 普通细箭头（表示被调操作执行完毕将结果返回给主调方）。
高频易错陷阱：同步消息实心箭头 vs 异步消息线箭头的线型混淆
专转本大题规范绘图要求：同步阻塞调用的箭头必须涂满填充为“黑色实心三角形箭头（▲）”，而异步消息必须是“普通线段开放式燕尾箭头（→）”，返回结果必须使用“虚线”！线型或箭头画错在专转本上机阅卷中属于典型语法错误扣分点！$p3a_s_297$, $p3a_r_297${"pdf": "操作技能复习.pdf", "extra": ["考纲三级节点: S3-3.2 顺序图中的消息类型。", "题库补充：顺序图中的对象与消息布局 (29题)", "p1_refine_20261114", "r1_cleanup_20261114", "p3_assets_redraw_20261114"], "pages": [99, 100], "spans": 33}$p3a_r_297$::jsonb, NOW());
  UPDATE kb_entry SET published_rev = 5, updated_at = NOW() WHERE node_id = 297;
END $$;

-- Step 3: 提交前数据库级完整性断言
DO $$
DECLARE
  v_cr_cnt INT;
  v_upd_cnt INT;
  v_old_asset INT;
  v_new_asset INT;
  v_old_ref INT;
  v_new_ref INT;
BEGIN
  SELECT count(*) INTO v_cr_cnt
    FROM kb_entry e JOIN kb_revision r ON r.node_id = e.node_id AND r.rev_no = e.published_rev
   WHERE e.status = 'published' AND r.search_text LIKE '%' || E'\r' || '%';
  IF v_cr_cnt > 0 THEN
    RAISE EXCEPTION 'Found % published nodes with CR in search_text', v_cr_cnt;
  END IF;

  SELECT count(*) INTO v_upd_cnt FROM kb_entry
   WHERE status = 'published' AND ((node_id = 263 AND published_rev = 6) OR (node_id = 290 AND published_rev = 5) OR (node_id = 297 AND published_rev = 5));
  IF v_upd_cnt <> 3 THEN
    RAISE EXCEPTION 'Expected 3 updated asset nodes, got %', v_upd_cnt;
  END IF;

  SELECT count(*) INTO v_old_asset FROM kb_asset WHERE path IN ('/kb-assets/skill/p88_r0_51d1062147a5759f.png', '/kb-assets/skill/p88_r2_a558f392e6ddedd1.png', '/kb-assets/skill/p99_r0_51b5c92e49596ec6.png', '/kb-assets/skill/p99_r1_7cfd1ffee85bc5f3.png', '/kb-assets/skill/p99_r2_9c2fbe68472b6892.png', '/kb-assets/skill/p48_r2_629900eac28fcd26.png', '/kb-assets/skill/p49_r0_cef14298b3aecc89.png');
  IF v_old_asset <> 0 THEN
    RAISE EXCEPTION 'Obsolete assets still in kb_asset: %', v_old_asset;
  END IF;

  SELECT count(*) INTO v_new_asset FROM kb_asset WHERE path IN ('/kb-assets/refinement/s313-actor-symbol.png', '/kb-assets/refinement/s313-usecase-include-extend.png', '/kb-assets/refinement/s332-sync-message.png', '/kb-assets/refinement/s332-return-message.png', '/kb-assets/refinement/s332-self-message.png', '/kb-assets/refinement/s164-binary-search-ab.png', '/kb-assets/refinement/s164-binary-search-c.png');
  IF v_new_asset <> 7 THEN
    RAISE EXCEPTION 'Expected 7 new assets in kb_asset, got %', v_new_asset;
  END IF;

  SELECT count(*) INTO v_old_ref
    FROM kb_entry e JOIN kb_revision r ON r.node_id = e.node_id AND r.rev_no = e.published_rev
   WHERE e.status = 'published' AND (r.blocks::text LIKE '%' || '/kb-assets/skill/p88_r0_51d1062147a5759f.png' || '%' OR r.blocks::text LIKE '%' || '/kb-assets/skill/p88_r2_a558f392e6ddedd1.png' || '%' OR r.blocks::text LIKE '%' || '/kb-assets/skill/p99_r0_51b5c92e49596ec6.png' || '%' OR r.blocks::text LIKE '%' || '/kb-assets/skill/p99_r1_7cfd1ffee85bc5f3.png' || '%' OR r.blocks::text LIKE '%' || '/kb-assets/skill/p99_r2_9c2fbe68472b6892.png' || '%' OR r.blocks::text LIKE '%' || '/kb-assets/skill/p48_r2_629900eac28fcd26.png' || '%' OR r.blocks::text LIKE '%' || '/kb-assets/skill/p49_r0_cef14298b3aecc89.png' || '%');
  IF v_old_ref <> 0 THEN
    RAISE EXCEPTION 'Published revisions still reference obsolete assets: %', v_old_ref;
  END IF;

  SELECT count(*) INTO v_new_ref
    FROM kb_asset a
   WHERE a.path IN ('/kb-assets/refinement/s313-actor-symbol.png', '/kb-assets/refinement/s313-usecase-include-extend.png', '/kb-assets/refinement/s332-sync-message.png', '/kb-assets/refinement/s332-return-message.png', '/kb-assets/refinement/s332-self-message.png', '/kb-assets/refinement/s164-binary-search-ab.png', '/kb-assets/refinement/s164-binary-search-c.png')
     AND EXISTS (
       SELECT 1 FROM kb_entry e JOIN kb_revision r ON r.node_id = e.node_id AND r.rev_no = e.published_rev
        WHERE e.status = 'published' AND r.blocks::text LIKE '%' || a.path || '%'
     );
  IF v_new_ref <> 7 THEN
    RAISE EXCEPTION 'Expected all 7 new assets referenced in published revisions, got %', v_new_ref;
  END IF;
END $$;

COMMIT;
