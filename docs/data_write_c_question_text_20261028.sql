-- C 语言（S1）题目文本清洗（2026-10-28）
-- 仅改 stem/option_json/analysis；correct、question_type、score 不变；金标题未包含。
-- 备份表：t_question_backup_20261028_c_text
begin;
create table if not exists t_question_backup_20261028_c_text as select * from t_question where id in (364565,364602,365045,365047,365064,365082,365083,365087,365109,365467,365468,365470,365472,365473,365474,365781,365783,365785,365792,365805,365941,366101,366102,366104,366136,366203,366206,366317,366359,366373,366386,366395,366396,366484,366501,366502,366505,366515,366549,366551,366624,366693,366735,366752,366760,366768,366769,366779,366789,366791,366795,366798,366804,366805,366813,366822,366823,366829,366838,366845,366847,366848,366849,366851,366854,366862,366864,366865,366868,366885,366887,366888,366889,366898,366899,366905,366937,366942,366953,366959,367442,367609,367840,367845,367850,367970,367971,367974,367975,367978,367979,367985,367986,367987,367996,367997,368284,368286,368287,368291,368297,368299,368300,368301,368302,368303,368304,368306,368308,368316,368317,368318,368319,368356,368361,369428,369717,370144,370376,370388,370539,370551,370554,370573,370574,370584,370596,370603,370606,370609,370616,370628,370634,370636,370638,370640,370649,370651,370668,370681,370696,370700,370702,370740,370741,370750,370763,370765,370766,370768,370769,370770,370772,370774,370775,370776,370785,370789,370790,370801,370802,370805,370811,370812,370818,370820,370821,370822,370824,370844,370854,370867,370869,370870,370872,370890,370898,370911,370921,370922,370923,370926,370932,370935,370937,370938,370946,370957,370960,370966,370968,370969,370973,370992,370993,370994,371005,371007,371009,371011,371015,371016,371028,371029,371038,371039,371040,371044,371050,371061,371084,371085,371086,371111,371122,371191,371193,371194,371195,371196,371198,371203,371204,371207,371219,371231,371240,371248,371256,371267,371268,371271,371287,371306,371324,371326,371327,371330,371332,371337,371338,371340,371342,371343,371345,371346,371348,371350,371351,371352,371356,371357,371358,371368,371371,371385,371388,371391,371394,371443,371494,371495,371497,371578,371582,371597,371606,371621,371645,371647,371648,371663,371679,371680,371695,371733,371735,371736,371743,371756,371759,371768,371770,371799,371816,371818,371820,371823,371827,371838,371847,371849,371851,371855,371866,371867,371872,371873,371884,371892,371893,371896,371898,371901,371909,371911,371920,371921,371923,371926,371941,371944,371945,371946,371949,371950,371964,371965,371971,371972,371977,371979,372009,372011,372014,372017,372039,372048,372049,372056,372066,372071,372099,372104,372131,372136,372140,372147,372164,372166,372178,372179,372197,372205,372213,372218,372221,372224,372227,372229,372230,372231,372233,372236,372238,372239,372240,372246,372250,372252,372253,372261,372262,372263,372264,372265,372266,372269,372276,372283,372288,372296,372298,372301,372308,372317,372319,372320,372322,372323,372325,372326,372333,372335,372338,372339,372346,372349,372351,372362,372363,372375,372378,372392,372393,372400,372424,372426,372428,372430,372438,372439,372440,372446,372471,372473,372498,372503,372510,372511,372512,372513,372514,372524,372534,372535,372536,372537,372538,372539,372540,372542,372548,372549,372550,372551,372552,372554,372560,372569,372572,372576,372577,372578,372584,372587,372591,372592,372594,372596,372597,372598,372617,372618,372619,372620,372623,372624,372625,372628,372629,372630,372631,372633,372635,372636,372640,372642,372643,372650,372651,372654,372655,372656,372661,372662,372663,372664,372665,372677,372684,372696,372703,372712,372715,372718,372719,372722,372723,372725,372728,372729,372732,372735,372742,372745,372746,372747,372749,372750,372753,372759,372761,372763,372765,372770,372773,372778,372780,372783,372784,372785,372792,372800,372803,372804,372807,372809,372813,372821,372822,372824,372830,372832,372839,372842,372847,372848,372849,372850,372851,372852,372853,372854,372857,372858,372860,372865,372868,372869,372887,372895,372896,372903,375683,375709,376450,376845,377069,377362,377563,377614,377658,377986,378055,378063,378084,378101,378117,378128,378139,378142,378149,378740,378741,378743,378744,378745,378806,378807,378820,378826,378827,378831,378839,378846,378847,378848,378850,378857,378863,378864,378866,378870,378872,378874,378875,378920,378925,378928,378950,378953,379152,379155,379185,379245,379269,379334,379335,379337,379343,379353,379358,379359,379360,379362,379364,379365,379372,379374,379376,379377,379381,379386,379388,379389,379390,379392,379394,379398,379400,379401,379405,379422,379425,379426,379428,379446,379450,379467,379482,379495,379503,379509,379511,379513,379514,379534,379536,379548,379569,379602,379617,379619,379623,379634,379653,379782,379986,379995,379997,380011,380014,380016,380026,380040,380057,380060,380067,380100,380109,380113,380114,380145,380150,380151,380152,380155,380181,380207,380209,380305,380310,380312,380313,380317,380319,380320,380334,380340,380358,380381,380382,380396,380398,380403,380412,380413,380417,380421,380422,380424,380427,380429,380440,380441,380450,380458,380459,380462,380465,380474,380477,380483,380489,380529,380530,380565,380598,380599,380620,380635,380636,380664,380695,380707,380711,380714,380715,380730,380736,380737,380739,380742,380745,380765,380795,380814,380817,380821,380922,380930,380931,380934,381221,381226,381229,381243,381244,381245,381251,381257,381259,381265,381266,381268,381269,381270,381271,381272,381273,381275,381277,381285,381286,381288,381294,381299,381304,381321,381391,381392,381407,381429,381430,381447,381458,381464,381473,381484,381487,381488,381489,381490,381491,381492,381493,381506,381507,381509,381510,381520,381521,381523,381524,381526,381527,381533,381537,381538,381541,381544,381545,381546,381547,381552,381553,381557,381558,381559,381560,381562,381563,381568,381569,381570,381574,381588,381589,381590,381591,381593,381594,381595,381598,381603,381607,381608,381609,381624,381626,381627,381628,381644,381648,381651,381663,381666,381686,381687,381688,381691,381692,381694,381707,381708,381714,381719,381720,381737,381749,381750,381753,381756,381759,381760,381786,381787,381790,381791,381793,381844,381847,381848,381857,381864,381878,381879,381881,381882,382445,382451,382453,382459,382466,382467,382473,382475,382476,382507,382540,382544,382559,382562,382563,382564,382566,382568,382570,382572,382573,382574,382575,382578,382590,383201,384447,384454,384460,384576,384717,384731,384788,384875,384878,384886,384888,384892,385153,385155,385159,385167,385172,385190,385191,385201,385236,385247,385251,385260,385277,385278,385284,385290,385294,385296,385322,385348,385390,385520,385523,385533,385538,385546,385566,385567,385584,385596,385599,385601,385642,385652,385660,385674,385685,385686,385743,385744,385748,385760,385761,385762,385766,385768,385769,385770,385771,385772,385773,385784,385828,385830,385840,385854,385858,385859,385861,385873,385880,385881,385941,386038,386053,386062,386063,386099,386101,386118,386133,386134,386215,386218,386220,386221,386226,386230,390348,390467,390468);

update t_question set stem = $qt$如果 int a = 3, b = 4; 则条件表达式" a<b?a:b 的值是 3。（ ）$qt$, analysis = $qt$A：3<4为真取a=3，值3。$qt$ where id = 364565 and not is_golden;
update t_question set stem = $qt$C 语言如果 int   a =3, b =4; ；则条件表达式"a<b? a:b"的值是 4.（ ）$qt$, analysis = $qt$B：3<4应取3，说值为4错误。$qt$ where id = 364602 and not is_golden;
update t_question set stem = $qt$11下面程序的功能是在输入一批正整数中求出最大者,输入0结束循环，请选择填空______。

#include "stdio.h"
main()
{int a,max=0;
scanf("%d",&a);
while (      )
{if (max<a) max=a;
scanf("%d",&a);
}
printf("%d",max);}$qt$, option_json = $qt${"A":"a==0","B":"a","C":"a==1","D":"!a"}$qt$, analysis = $qt$while(a) 表示 a 非 0 时继续循环，输入 0 结束，故选 B。$qt$ where id = 365045 and not is_golden;
update t_question set stem = $qt$14 C语言中while和do while循环的主要区别是______。$qt$, option_json = $qt${"A":"do-while的循环至少无条件执行一次。","B":"while循环控制条件比do-while的循环控制条件严格。","C":"do-while允许从外部转入到循环体内。","D":"do-while的循环体不能是复合语句。"}$qt$, analysis = $qt$do-while 至少无条件执行一次。$qt$ where id = 365047 and not is_golden;
update t_question set stem = $qt$47 以下是死循环的程序段是______。$qt$, option_json = $qt${"A":"for(i=1; ; )\n\nif(++i%2==0) continue;\n\nif(++i%3==0) break;\n\n}","B":"i=32767;\n\ndo{if(i<0) break;}while(++i);","C":"for(i=1; ; ) if(++i<10) continue;","D":"i=1;\n\nwhile(i--);"}$qt$, analysis = $qt$（AI 补答）for(i=1;;) if(++i<10) continue; 无终止条件且无 break，是死循环，故选 C。$qt$ where id = 365064 and not is_golden;
update t_question set stem = $qt$20 对说明语句int a[10]={6,7,8,9,10};的正确理解是_______。$qt$, option_json = $qt${"A":"将5个初值依次a[1]至a[5]","B":"将5个初值依次a[0]至a[4]","C":"将5个初值依次a[5]至a[9]","D":"将5个初值依次a[6]至a[10]"}$qt$, analysis = $qt$5 个初值依次赋 a[0]~a[4]。$qt$ where id = 365082 and not is_golden;
update t_question set stem = $qt$21 以下不正确的定义语句是______。$qt$, option_json = $qt${"A":"double x[5]={2.0,4.0,6.0,8.0,10.0};","B":"int y[5]={0,1,3,5,7,9};","C":"char c1[]={'1','2','3','4','5'};","D":"char c2[]={'\\x10','\\xa','\\x8'};"}$qt$, analysis = $qt$（AI 补答）int y[5] 初始化给出 6 个值，超出数组长度，定义不正确，故选 B。$qt$ where id = 365083 and not is_golden;
update t_question set stem = $qt$25以下程序段的作用是______。

int a[]={4,0,2,3,1},i,j,t;

for (i=1;i<5;i++)

{t=a[i];j=i-1;

while (j>=0&&t>a[j])

{a[j+1]=a[j];j- -;}

a[j+1]=t;

}$qt$, option_json = $qt${"A":"对数组a进行插入排序(升序)","B":"对数组a进行插入排序(降序)","C":"对数组a进行选择排序(升序)","D":"对数组a进行选择排序(降序)"}$qt$, analysis = $qt$该程序段为插入排序（升序）。$qt$ where id = 365087 and not is_golden;
update t_question set stem = $qt$21 若使用一位数组名作为函数实参，则以下正确的说法是______。$qt$, option_json = $qt${"A":"必须在主调函数中说明此数组的大小","B":"实参数组类型与形参数组类型可以不匹配","C":"在被调函数中，不需要考虑形参数组的大小","D":"实参数组名与形参数组名必须一致"}$qt$, analysis = $qt$形参数组大小可省略，不必考虑。$qt$ where id = 365109 and not is_golden;
update t_question set stem = $qt$(2 分)【多选题】33.下列不属于 C 语言的特点的是（）$qt$, option_json = $qt${"A":"语言简洁、紧凑，使用方便、灵活","B":"数据类型和运算符丰富","C":"标准C语言有大量的嵌入式系统库函数可供调用，简化了程序设计工作","D":"C语言效率高，但移植性差\n\n参考答案:C D\n\n解析:无"}$qt$, analysis = $qt$不属于 C 特点：嵌入式库函数、移植性差表述（CD）。$qt$ where id = 365467 and not is_golden;
update t_question set stem = $qt$(3 分)【多选题】33.对于 switch 语句，一下描述正确的是（ ）。$qt$, option_json = $qt${"A":"switch 括号内的“表达式”，其值的类型应为整型或字符型;","B":"case 后面的表达式必须是常量表达式，不能是变量;","C":"每一个 case 后面的常量表达式必须互不相同;","D":"多个 case 可以共用一组执行语句;\n\n参考答案:A B C D\n\n解析:无"}$qt$, analysis = $qt$switch 描述四项（ABCD）。$qt$ where id = 365468 and not is_golden;
update t_question set stem = $qt$(3 分)【多选题】23.C 语言的运算符有以下几种（ ）。$qt$, option_json = $qt${"A":"算术运算符","B":"赋值运算符","C":"逗号运算符","D":"位运算符\n\n参考答案:A B C D\n\n解析:无"}$qt$, analysis = $qt$运算符四类（ABCD）。$qt$ where id = 365470 and not is_golden;
update t_question set stem = $qt$(3 分)【多选题】对 C 语言来说，下列标识符中哪些是合法的？$qt$, option_json = $qt${"A":"total","B":"_debug","C":"Large&Tall","D":"Counter1","E":"begin_","F":"SUM","G":"5S","H":"max"}$qt$, analysis = $qt$合法标识符：total、_debug、Counter1、begin_、SUM、max（ABDEFH）。$qt$ where id = 365472 and not is_golden;
update t_question set stem = $qt$(3 分)【多选题】对 C 语言来说，下列标识符中哪些是不合法的？$qt$, option_json = $qt${"A":"total","B":"_debug","C":"Large&Tall","D":"Counter1","E":"begin_","F":"SUM","G":"5S","H":"max"}$qt$, analysis = $qt$不合法：NO！（！）、do（关键字）、(xyz)（ABF）。$qt$ where id = 365473 and not is_golden;
update t_question set stem = $qt$在C语言中以下正确的说法是（$qt$, option_json = $qt${"A":"实参和与其对应的形参各占用独立的存储单元","B":"实参和与其对应的形参共占用一个存储单元","C":"只有当实参和与其对应的形参同名时才共占用存储单元","D":"形参是虚拟的，不占用存储单元\n\n解析:有同学选 d，也可以，但是本题意思是在函数调用时，函数参数是如何传参。如果函数没调用，不占存储单元。"}$qt$, analysis = $qt$在 C 语言中，实参和与其对应的形参各占用独立的存储单元，故选 A。$qt$ where id = 365474 and not is_golden;
update t_question set stem = $qt$执行 a = 10 > 8*2?3 + 5:3*2; 后, a 的值是 ____$qt$, analysis = $qt$a = 1 0 > 8 * 2? 3 + 5: 3 * 2;

=优先级低于？:

a = 1 0 > 8 \star 2? 3 + 5: 3 \star 2

a =   1 0 > 1 6? 8: 6

a=6$qt$ where id = 365781 and not is_golden;
update t_question set stem = $qt$若 m 是一个三位数，则百位上的数字可表示为 ____。$qt$, analysis = $qt$若 m 是一个三位数，则百位上的数字可表示为 m / 100。

若 m 是一个三位数，则十位上的数字可表示为 m/10%10。

若 m 是一个三位数，则个位上的数字可表示为 m% 10。

考到上述三种，一律按这种写法。$qt$ where id = 365783 and not is_golden;
update t_question set stem = $qt$打印 “魔方阵”，所谓魔方阵是指这样的方阵，它的每一行、每一列和对角线之和均相等。例如，三阶魔方阵为:

txt

要求打印出由 1~ n^2 的自然数构成的魔方阵。$qt$, analysis = $qt$奇数阶魔方阵用罗伯法填充。$qt$ where id = 365785 and not is_golden;
update t_question set stem = $qt$补充程序: int n1=10, n2=20; ",n1,n2);

要求按以下格式输出 n1 和 n2 的值，每个输出行从第一列开始。

txt
n1=0010
n2=0020$qt$, analysis = $qt$printf 格式串应为 n1=%04d 换行 n2=%04d（%04d 表示 4 位宽、前导零），故填 n1=%04d\nn2=%04d。$qt$ where id = 365792 and not is_golden;
update t_question set stem = $qt$若 x = 2,y = 3 则 x||y 的结果是____。$qt$, analysis = $qt$x||y：2||3=真=1。$qt$ where id = 365805 and not is_golden;
update t_question set stem = $qt$(int) x + y 的作用是把 x + y 的结果转换成整型。$qt$, analysis = $qt$（int） x + y 的作用是把 x 转换成int类型，然后再与y相加。$qt$ where id = 365941 and not is_golden;
update t_question set stem = $qt$能够正确表示逻辑关系“ a>= 15 ”或“ a<= -1 ”（$qt$, option_json = $qt${"A":"a>=15 && a<=-1","B":"a>=15 || a<=-1","C":"a>=15 | a<= -1","D":"a>=15 & a<=-1"}$qt$, analysis = $qt$或使用||

大于等于 >=

小于等于 <=

a>=15 || a<=-1$qt$ where id = 366101 and not is_golden;
update t_question set stem = $qt$下列四组选项中，均是合法转义字符的选项是（）。$qt$, option_json = $qt${"A":"'\\l'\" ,'\\|', 'ln'","B":"'1' , \"017' , \\\"'\"","C":"'\\018', '\\f', '\\xab'","D":"'\\0', '\\101', '\\x1f'"}$qt$, analysis = $qt$“”、“A”、“”均为合法转义字符（其余组含非法项），故选 D。$qt$ where id = 366102 and not is_golden;
update t_question set stem = $qt$设有:int a=1, b=2, c=3, d=4, m=2, n=2；执行 (m=a>b) && (n=c>d) 后 n 的值为（）。$qt$, option_json = $qt${"A": "1", "B": "2", "C": "3", "D": "4"}$qt$, analysis = $qt$```txt
(m=a>b)&&(n=c>d)
= (m=1>2) &&(n=c>d)
= 0&&&(n=c>d) 出现短路了,所以 n=c>d 不会被执行
n 还是原来的值,2.
```$qt$ where id = 366104 and not is_golden;
update t_question set stem = $qt$下列字符常量,不合法的是____。$qt$, option_json = $qt${"A":"'\\x41'","B":"“t”","C":"'\\t'","D":"'\\101'"}$qt$, analysis = $qt$“t”是字符串（双引号），不是字符常量。$qt$ where id = 366136 and not is_golden;
update t_question set stem = $qt$补充程序: int n1=10, n2=20; ",n1,n2); 要求按以下格式输出 n1 和 n2 的值，每个输出行从第一列开始。 n1=0010 n2=0020$qt$, analysis = $qt$printf 格式串应为 n1=%04d 换行 n2=%04d（%04d 表示 4 位宽、前导零），故填 n1=%04d\nn2=%04d。$qt$ where id = 366203 and not is_golden;
update t_question set stem = $qt$判断字符串 str1 是否大于字符串 str2，应当使用 。$qt$, option_json = $qt${"A":"if(str1 > str2)","B":"if ( strcmp ( str1 , str2 ) < 0 )","C":"if ( strcmp ( str 2, str 1)>0)","D":"if ( strcmp ( str1 , str2 )>0)"}$qt$, analysis = $qt$判断字符串 str1 是否大于 str2 应使用 strcmp(str1,str2)>0，故选 D。$qt$ where id = 366206 and not is_golden;
update t_question set stem = $qt$下面函数用“折半查找法”从有 n 个数按升序排列的 a 数组中对关键字 x 查找，若找到，返回其下标值，否则返回-1，请填空使程序完整。

txt
int search(int a[],int n,int x){
 int x 1=0,x2=n-1,mid ;
 while(x1a[mid])
 ________;
 else
 return ________;
 }
 return(-1);
}$qt$, analysis = $qt$折半查找：x1>x2 时结束；a[mid]<x 时取右半区 x1=mid+1；a[mid]>x 时取左半区 x2=mid-1；找到时返回 mid。故填 x2=mid-1、x1=mid+1、mid。$qt$ where id = 366317 and not is_golden;
update t_question set stem = $qt$对下图所示的二叉树进行顺序存储(根结点编号为

1,对于编号为i的结点，其左孩子结点为2i,右孩子结点为 2i+1 )并用一维数组BT来表示。已知结点X、E和D在数组BT中的下标为分别为1、2、3,可推出结点

G、K和H在数组BT中的下标分别为$qt$, option_json = $qt${"A": "10、11、12", "B": "12、24、25", "C": "11、12、13", "D": "11、22、23"}$qt$, analysis = $qt$按照“左孩子结点为2i，右孩子结点为 2i + 1 ”，且 E = 2 的原则带入图中元素计算。

F = 2 * E + 1 = 5

G = 2 * F + 1 = 2 * 5 + 1 = 1 1

K = 2 * G = 2 * 1 1 = 2 2

H = 2 * G + 1 = 2 3 _ {\circ}

对下图所示的二叉树进行顺序存储(根结点编号为1,对于编号为1的结点，其左孩子结点为2L右孩子结点为2l+1)并用一维数组BT来表示。已知结点X、E和D在数组BT中的下标为分别为1、2、3.可推出结点G、K和H在数组BT中的下标分别为（）。

A 10、11、12
B 12、24、25
C 11、12、13
D 11、22、23

\+ 添加选项

X = 1

\bar {E} = 2 x = 2 × 1 = 4

D = 2 x + 1 = 2 × 1 + 1 = 3

F = 2 E + 1 = 2 × 2$qt$ where id = 366359 and not is_golden;
update t_question set stem = $qt$以下（）是计算机程序设计语言所经历的主要阶段。$qt$, option_json = $qt${"A":"机器语言、BASIC语言和C语言","B":"机器语言、汇编语言和 C++ 语言","C":"机器语言、汇编语言和高级语言","D":"二进制代码语言、机器语言和FORTRAN语言"}$qt$, analysis = $qt$程序设计语言的发展可以分为三代:机器语言、汇编语言和高级语言。BASIC 语言、C 语言、FORTRAN 语言和 C++ 语言都属于高级语言。$qt$ where id = 366373 and not is_golden;
update t_question set stem = $qt$在循环队列中用数组 A[0...m-1]存放队列元素，其队头指针和队尾指针分别为 front 和 rear, 则当前队列中的元素个数是 ( )$qt$, option_json = $qt${"A": "(front-rear)%m", "B": "(front-rear+m-1)%m", "C": "(front-rear+m)%m", "D": "(rear-front+m)%m"}$qt$, analysis = $qt$计算循环队列的元素个数:“尾指针减头指针”，若为负数，再加其容量即可。

队列长度（元素个数）= (m+rear-front)%m 。m为总长度。$qt$ where id = 366386 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是____。$qt$, option_json = $qt${"A":"标识符的长度不能任意长,最多只能包含16个字符","B":"标识符总是由字母、数字和下划线组成，且第一个字符不得为数字","C":"语言中的关键字不能作变量名,但可以作为函数名","D":"用户自定义的标识符必须\"见名知义\", 如果随意定义, 则会出编译错误"}$qt$, analysis = $qt$标识符由字母数字下划线组成且首字符非数字。$qt$ where id = 366395 and not is_golden;
update t_question set stem = $qt$设变量 x 和 y 均已正确定义并赋值。以下 if 语句中，在编译时将产生错误信息的是 ____。$qt$, option_json = $qt${"A":"if(x++);","B":"if(x>y && y!=0);","C":"if(x>0) x-- else y++;","D":"if(y<0) {;} else x++;"}$qt$, analysis = $qt$if(x>0) x-- else y++; 中 x-- 之后缺少分号，编译时产生错误，故选 C。$qt$ where id = 366396 and not is_golden;
update t_question set stem = $qt$定义s为 5 × 6 (5行6列)的数组可写成floata[5,6];$qt$, analysis = $qt$B：二维数组须写a[5][6]。$qt$ where id = 366484 and not is_golden;
update t_question set stem = $qt$在 C 语言中，下列标识符中合法的是( )$qt$, option_json = $qt${"A":". -int","B":". in1_3","C":". A_B'D","D":"const"}$qt$, analysis = $qt$in1_3 是合法的用户自定义标识符（-int 含减号、A_B'D 含撇号、const 为关键字），故选 B。$qt$ where id = 366501 and not is_golden;
update t_question set stem = $qt$一元二次方程 ax2 + bx + c = 0 有两个相异实根的条件是 a != 0 且 b2 - 4ac > 0，以下选项中能正确表示该条件的 C 语言表达式是（）。$qt$, option_json = $qt${"A":"a!= 0, b^* b - 4^* a^* c > 0","B":"a!=0 || b*b-4*a*c>0","C":"a&&b*b-4*a*c>0","D":"!a&& b*b-b-4*a*c >0"}$qt$, analysis = $qt$相异实根：a≠0 且 b*b-4*a*c>0。$qt$ where id = 366502 and not is_golden;
update t_question set stem = $qt$下列运算符中优先级最高的是$qt$, option_json = $qt${"A":"<","B":"+","C":"%","D":"!="}$qt$, analysis = $qt$%（算术）优先级最高。$qt$ where id = 366505 and not is_golden;
update t_question set stem = $qt$以下正确的函数定义是（）$qt$, option_json = $qt${"A":"double fun(int x, int y) {z = x + y; return  z}","B":"double fun(int x, y){int z;return z;}","C":"fun (x,y){intx,y; double z;z = x + y; return z;}","D":"double fun (int x, int y) {double z; return z;}"}$qt$, analysis = $qt$判断函数定义先看参数表再看函数体：A 项中 z 没有声明就参与运算并返回；B 项形参 y 漏写了类型，参数表不合法；D 项声明了 double z 却从未赋值，返回的是无意义的量。C 项给出参数 x、y，函数体中声明 double z，经 z = x + y 赋值后返回，故选 C。$qt$ where id = 366515 and not is_golden;
update t_question set stem = $qt$在公式中 y × p(x, y)，存在量词是在全称量词的辖域内，我们允许所存在的 x 可能依赖于 y 值。令这种依赖关系明显地由函数所定义，它把每个 y 值映射到存在的那个 x。这种函数叫做 ____$qt$, option_json = $qt${"A": "依赖函数", "B": "Skolem函数", "C": "决定函数", "D": "多元函数"}$qt$, analysis = $qt$同 366548。$qt$ where id = 366549 and not is_golden;
update t_question set stem = $qt$以下叙述中错误的是____。$qt$, option_json = $qt${"A":"对于 double 类型数组，不可以直接用数组名对数组进行整体输入或输出","B":"数组名代表的是数组所占存储区的首地址，其值不可改变","C":"当程序执行中, 数组元素的下标超出所定义的下标范围时, 系统将给出\"下标越界\"的出错信息","D":"可以通过赋初值的方式确定数组元素的个数"}$qt$, analysis = $qt$C 语言不做下标越界检查（不会给出“下标越界”出错信息），C 叙述错误，故选 C。$qt$ where id = 366551 and not is_golden;
update t_question set stem = $qt$c 语言中，设 a = 3 ， b= 2 ， c = l ， a > b > c 的值为$qt$, analysis = $qt$a>b 得 1，1>c（1>1）得 0，故 a>b>c 的值为 0，填 0。$qt$ where id = 366624 and not is_golden;
update t_question set stem = $qt$若有以下定义下:

#define E 5

int A=16;double B = 5.5; char C='A';

则下列语句中正确的是（）。$qt$, option_json = $qt${"A":"(A + B) + +","B":"B = A + +","C":"+ + C = A + 1 = E","D":"E++"}$qt$, analysis = $qt$（AI 补答）B=A++ 合法（double 接收 int 自增）；A、C、D 均语法错误，故选 B。$qt$ where id = 366693 and not is_golden;
update t_question set stem = $qt$在下列选项中,不正确的赋值语句是$qt$, option_json = $qt${"A":"++t;","B":"n1 = (n2 = (n3 = 0)) ;","C":"\\mathbf { k } { = } \\mathbf { \\dot { i } } { = } \\mathbf { \\dot { j } } ;","D":"a=b+c=1; 1"}$qt$, analysis = $qt$赋值号左边必须是变量：a=b+c=1 中 (b+c) 不是左值，该赋值语句不正确，故选 D。$qt$ where id = 366735 and not is_golden;
update t_question set stem = $qt$已知: char c='A'; int i=1, j; 执行语句 j=!c&&i++; 则 i 和 j 的值分别是 0, 1。$qt$, analysis = $qt$j = ! c & & i + +

= ! (^ {\prime} A ^ {\prime}) & & i + +

= 0 8 & i + +

出现短路了，所以 i++ 不执行了。j=0,i的值不变，还是初始的值1。

i 和 j 的值分别为 1, 0。$qt$ where id = 366752 and not is_golden;
update t_question set stem = $qt$已知: char c=48; int i=1, j=10; 执行语句 j=!(c>j)&&i++; 则 i 和 j 的值分别是 1 和 0。$qt$, analysis = $qt$j = ! (c > j) & & i + +

= ! (4 8 > 1 0) & & i + +

= ! (1) & & i + +

= 0. 8 × 8 i + +

出现短路，这时候i不变，j=0$qt$ where id = 366760 and not is_golden;
update t_question set stem = $qt$以下选项中不能作为 C 语言合法常量的是____。$qt$, option_json = $qt${"A":"'cd'","B":"0.1e+6","C":"\"\\a\"","D":"'\\011'"}$qt$, analysis = $qt$'cd' 是多字符常量，不合法。$qt$ where id = 366768 and not is_golden;
update t_question set stem = $qt$在 C 语言中，合法的长整型常数是____。$qt$, option_json = $qt${"A":"OL","B":"4962710","C":"324562&","D":"216D"}$qt$, analysis = $qt$C 语言中长整型数为在数值后加上一个 L 或 l 字符。本题答案为 A。$qt$ where id = 366769 and not is_golden;
update t_question set stem = $qt$以下正确的函数形式是 ____。$qt$, option_json = $qt${"A":"double fun(int x,int y){\n z=x+y;\n return z;\n}","C":"fun(x,y){\n int x,y;\n double z; z=x+)\n return z;\n}","B":"fun(int x,y){\n int z;\n return z;\n}","D":"double fun(int x,int y){\n double z;\n z=x+y;\n return z:\n}"}$qt$, analysis = $qt$A 中 z 未声明、B 返回未赋值的 z、C 语法残缺，只有 D（double fun(int x,int y){double z; z=x+y; return z;}）定义正确，故选 D。$qt$ where id = 366779 and not is_golden;
update t_question set stem = $qt$下列程序段实现的功能是 a = a + b; b = a - b; a = a - b; ( )$qt$, option_json = $qt${"A": "将 a 和 b 中的数值增加一倍", "B": "将a和b中的数值减少一半", "C": "保持 a 和 b 中的数值不变", "D": "将a和b中的数值交换"}$qt$, analysis = $qt$:（1）自顶向下∶程序设计时，应先考虑总体，后考虑细节;先考虑全局目标，后考虑局部目标。

（2）逐步求精∶对复杂问题，应设计一些子目标作为过渡，逐步细化。
（3）模块化∶一个复杂问题，肯定是由若干稍简单的问题构成。模块化是把程序要解决的

总目标分解为子目标，再进一步分解为具体的小目标，把每一个小目标称为一个模块。$qt$ where id = 366789 and not is_golden;
update t_question set stem = $qt$下列标识符在 c 语言中，（）属于合法的用户自定义的标识符。$qt$, option_json = $qt${"A":"a_12","B":"do","C":"aa.txt\n\nD 3m"}$qt$, analysis = $qt$a_12 合法（do 为关键字、aa.txt 含点号、3m 以数字开头），故选 A。$qt$ where id = 366791 and not is_golden;
update t_question set stem = $qt$在 c 语言中，下列常量的写法正确的是（）。$qt$, option_json = $qt${"A":"①、-32767 ②、023f ③、0x123dfh","B":"①、123.46 ②、123. ③、.456 ④、0.456","C":"①、123.4E4 ②、5.4E0.5 ③、4E ④、1.23e-5 ⑤、3E2","D":"①、“abbchkdl” ②、“a” ③、“” ④、“” ⑤、“\\n” ⑥、“'"}$qt$, analysis = $qt$①123.46 ②123. ③.456 ④0.456 均为合法常量写法（其余组含非法常量），故选 B。$qt$ where id = 366795 and not is_golden;
update t_question set stem = $qt$在 C 语言中，以下合法的数组定义是（）$qt$, option_json = $qt${"A":"int a[] = \"string\";","B":"int a[5] = {0,1,2,3,4,5};","C":"vhst s = \"string\"","D":"char a[] = {0,1,2,3,4,5}"}$qt$, analysis = $qt$char a[] = {0,1,2,3,4,5} 是合法的数组定义，故选 D。$qt$ where id = 366798 and not is_golden;
update t_question set stem = $qt$C 语言中下面哪个数组的创建错误的:（）$qt$, option_json = $qt${"A":"int arr[10] = {0}","B":"int n = 10; int arr[n] = {0}","C":"int arr[] = {1,2,3,4,5,6,7,8,9,0}","D":"char ch[10] = \"hello bit\""}$qt$, analysis = $qt$对于 int arr[] = {1,2,(3,4),5}数组，里面总共有 4 个元素，(3,4)为逗号表达式，取后者，因此数组中元素分别为:1,2,4,5 而 sizeof(arr)求的是整个数组所占空间的大小，即:4*sizeof(int)=4*4=16

因此，选择B$qt$ where id = 366804 and not is_golden;
update t_question set stem = $qt$定义了一维 int 型数组 a[10] 后，下面错误的引用是:（）$qt$, option_json = $qt${"A":"a[0] = 1;","B":"a[0] = 5*2;","C":"a[10] = 2;","D":"a[1] = a[2]*a[0];"}$qt$, analysis = $qt$int a[10] 的下标范围是 0~9，a[10]=2 引用越界错误，故选 C。$qt$ where id = 366805 and not is_golden;
update t_question set stem = $qt$以下选项中不能作为 C 语言合法常量的是（）$qt$, option_json = $qt${"A":"'cd'","B":"0.1e + 6","C":"\"\\a\"","D":"\"\\011\""}$qt$, analysis = $qt$'cd' 不合法。$qt$ where id = 366813 and not is_golden;
update t_question set stem = $qt$请选出合法的 C 语言赋值语句（）。$qt$, option_json = $qt${"A":"a = b = 58","B":"(i + 1) + + ;","C":"a = 58, b = 58","D":"k=(int)_{a+b} ;"}$qt$, analysis = $qt$a=b=58 是合法链式赋值语句。$qt$ where id = 366822 and not is_golden;
update t_question set stem = $qt$以下选项中, 不正确的赋值语句是 ( )。$qt$, option_json = $qt${"A":"t=t+1 ;","B":"n1 = (n2 = (n3 = 0))","C":"k=i=j;","D":"a=b+c=1;"}$qt$, analysis = $qt$赋值号左边必须是变量：a=b+c=1 中 (b+c) 不是左值，该赋值语句不正确，故选 D。$qt$ where id = 366823 and not is_golden;
update t_question set stem = $qt$以下选项中，与 k = n + + ;完全等价的语句是$qt$, option_json = $qt${"A":"k = n; n = n + 1 ;","B":"n=n+1 ; k=n;","C":"\\mathbf { k } { = } { + } { + } \\mathbf { n } ;","D":"\\mathtt { k } + = \\mathtt { n } + 1 ;"}$qt$, analysis = $qt$k=n++ 等价于 k=n; n=n+1;（先取值后自增），故选 A。$qt$ where id = 366829 and not is_golden;
update t_question set stem = $qt$以下能正确定义数组并正确赋初值的语句是（）。

|$qt$, option_json = $qt${"A":"int N=5,b[N][N] |","B":"int a[1][2]={{1},{3}}; |\n| --- | --- |\n|","C":"int c[2][]={{1,2},{3,4}} |","D":"int d[3][2]={{1,2},{34}}; |"}$qt$, analysis = $qt$int c[2][2]={{1,2},{3,4}} 行列维度明确且赋初值完整（选项 C 第二维疑脱漏为 [2]），故选 C。$qt$ where id = 366838 and not is_golden;
update t_question set stem = $qt$已知 int x=10, y=20, z=30; 以下语句执行后 x, y, z 的值是 () if (x>y) z=x, x=y; y=z;$qt$, option_json = $qt${"A":"x = 10, y = 20, z = 30","B":"x = 20 ， y = 30 ， z = 30","C":"x = 10 ， y = 30 ， z = 30","D":"x=20, y=30, z=20"}$qt$, analysis = $qt$if(x>y)

z=x, x=y;

y=z;

先执行 10>20，不满足条件，不执行 z=x,x=y;

然后再执和 y=z=30;

x, z 的值没有变化。$qt$ where id = 366845 and not is_golden;
update t_question set stem = $qt$以下能正确定义且赋初值的语句是。$qt$, option_json = $qt${"A":"int n1=n2=10;","B":"char c='\\0';","C":"float f=f+1.1;","D":"double x=12.3E2.5;"}$qt$, analysis = $qt$选项 A 错误。可以写成 int n1, n2; n1 = n2 = 10;
选项 B 正确。char c=0':等价于 char c=0;
选项 C 错误。可以写成 float f=0, f=f+1.1;
选项 D 错误。非法实型常量使用。$qt$ where id = 366847 and not is_golden;
update t_question set stem = $qt$C 语句“x*=y+2；”还可以写成()$qt$, option_json = $qt${"A":"x = x*y + 2;","B":"y=x=2+y*x","C":"x = x*(y + 2)","D":"x=y+2*x ;"}$qt$, analysis = $qt$x*=y+2 还可写成 x=x*(y+2)，故选 C。$qt$ where id = 366848 and not is_golden;
update t_question set stem = $qt$设函数 fun 的定义形式如下，则以下对函数 fun 的调用语句中，正确的是（）。

void fun(char ch, float X){......}$qt$, option_json = $qt${"A":"fun(\"abc\",3.0);","B":"t=fun(\"D',16.5)","C":"fun('65',2.8);","D":"fun(32,32);"}$qt$, analysis = $qt$void fun(char ch, float X)：fun(32,32) 中实参可隐式转换为 char、float，调用合法，故选 D。$qt$ where id = 366849 and not is_golden;
update t_question set stem = $qt$给出以下定义:

char x[]="abcdefg";

char y[]={'a','b','c','d','e','f','g};

则正确的叙述为____。$qt$, option_json = $qt${"A":"数组 x 和数组 y 等价","B":"数组 x 和数组 y 的长度相同","C":"数组 x 的长度大于数组 y 的长度","D":"数组 x 的长度小于数组 y 的长度"}$qt$, analysis = $qt$char x[]="abcdefg" 含结束符共 8 字节，char y[]={'a',…,'g'} 为 7 字节，x 的长度大于 y，故选 C。$qt$ where id = 366851 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是____。$qt$, option_json = $qt${"A":"C 程序中注释部分可以出现在程序中任意合适的地方","B":"花括号\"{\"和}\"只能作为函数体的定界符","C":"构成 C 程序基本单位是函数,所有函数名都可以由用户命名","D":"分号是 C 语句之间的分隔符,不是语句的一"}$qt$, analysis = $qt$注释可出现在程序中任意合适位置；花括号还可作复合语句定界符、main 不能改名、分号是语句的一部分，故选 A。$qt$ where id = 366854 and not is_golden;
update t_question set stem = $qt$以下选项中，合法的 C 语言常量是____。$qt$, option_json = $qt${"A":"1.234","B":"'C++'","C":"\"\\2.0","D":"2Kb"}$qt$, analysis = $qt$所谓常量是指在程序运行过程中，其值不能被改变的量。常量可以分为数值型常量和符号常量，数值型常量又可分为整型常量和实型常量，整型常量是由数字组成，实型常量是由小数点和数字组成，符号常量的命名要复合标识符的命名规则。故本题答案为 A。$qt$ where id = 366862 and not is_golden;
update t_question set stem = $qt$以下程序段中，与语句:k=a>b?(b>c?1:0):0;功能相同的是____。$qt$, option_json = $qt${"A":"if((a>b)&&(b>c)) k=1;  \\text {else} k = 0;","C":"if(a<=b) k=0; else if(b<=c) k=1;","B":"if((a>b)||(b>c)) k=1;  \\text {else} k = 0;","D":"\\text {if} (a > b) k = 1   \\text {else if} (b > c) k = 1; \\text {else} k = 0;"}$qt$, analysis = $qt$k=a>b?(b>c?1:0):0 表示 a>b 且 b>c 时 k=1、否则 k=0，与 A 的 if 结构相同，故选 A。$qt$ where id = 366864 and not is_golden;
update t_question set stem = $qt$证明正确定义, 则以下能正确计算 f = m! 的程序段是____。$qt$, option_json = $qt${"A":"f=0;for(i=1;i<=m;i++)f*=i;","B":"f=0;for(i=1;i<=m;i++)f*=i;","C":"f=1;for(i=m;i>1;i++)f*=i;","D":"f=1;for(i=m;i>=2;i--)f*=i;"}$qt$, analysis = $qt$f=1; for(i=m;i>=2;i--) f*=i; 计算 m!。$qt$ where id = 366865 and not is_golden;
update t_question set stem = $qt$设有定义:int a[10]={0,1,2,3,4,5,6,7,8,9},i,；若

0 <=slant i <=slant 9 则对 a 数组元素的引用可能存在错误的是 ____。$qt$, option_json = $qt${"A":"a[a[i]]","B":"a[i]","C":"a[a[i] + a[i]]","D":"a[9]"}$qt$, analysis = $qt$选项A，当i=9时， a[i]=a[9]=9;a[a[i]]=a[a[9]]=a[9]=9; 当i=0，a[i]=a[0]=0;a[a[i]]=a[a[0]]=a[0]=0;.... 选项B， 当i =[0,9]; a[i]即 a[0]~a[9] 选项C, 当i = 9时， a[i]=a[9]=9, a[a[i]+a[i]] = a[a[9]+a[9]]=a[9+9]=a[18]，下标越界。 选项C，a[9]=9; ### 二、判断题$qt$ where id = 366868 and not is_golden;
update t_question set stem = $qt$下列四组选项中，正确的 C 语言标识符是（）。$qt$, option_json = $qt${"A":"%x","B":"a + b","C":"a123","D":"123"}$qt$, analysis = $qt$C 语言标识符只能由字母、数字和下划线组成，且不能以数字开头。a123 完全符合这一规则，选 C。A 含非法字符 %，B 含  和 +，D 以数字开头，都不能作为标识符。$qt$ where id = 366885 and not is_golden;
update t_question set stem = $qt$在 C 语言中，以（）作为字符串结束标志。$qt$, option_json = $qt${"A":"'\\n'","B":"'\\0'","D":"'0'"}$qt$, analysis = $qt$C 语言中以 '\0'（空字符）作为字符串结束标志，故选 B。$qt$ where id = 366887 and not is_golden;
update t_question set stem = $qt$C 语句 x*=y+2；还可以写成( )$qt$, option_json = $qt${"A":"x=x*y+2;","B":"x = 2 + y * x;","C":"x=x*(y+2);","D":"x = y + 2 * x;"}$qt$, analysis = $qt$x*=y+2 即 x=x*(y+2)。$qt$ where id = 366888 and not is_golden;
update t_question set stem = $qt$下列程序段实现的功能是( )。

\underline {{a = a + b ; b = a - b ; a = a - b ;}}$qt$, option_json = $qt${"A":"将 a 和 b 中的数值增加一倍","B":"保持 a 和 b 中的数值不变","C":"将 a 和 b 中的数值减少一半","D":"将 a 和 b 中的数值交换"}$qt$, analysis = $qt$a=a+b; b=a-b; a=a-b; 实现 a 与 b 数值的交换（不用第三变量），故选 D。$qt$ where id = 366889 and not is_golden;
update t_question set stem = $qt$下列程序段实现的功能是____。

a=b;   b=c;   c=a;$qt$, option_json = $qt${"A": "将 a 和 b 中的数值增加一倍", "B": "保持a和b中的数值不变", "C": "将 a 和 b 中的数值减少一半", "D": "将 c 和 b 中的数值交换"}$qt$, analysis = $qt$以 a 作临时单元：a=b 后 b=c、c=a（a 存的是旧 b），结果将 b 和 c 中的数值交换，故选 D。$qt$ where id = 366898 and not is_golden;
update t_question set stem = $qt$下列程序段实现的功能是( )。

\underline {{a = a + b ; b = a - b ; a = a - b ;}}$qt$, option_json = $qt${"A":"将 a 和 b 中的数值增加一倍","B":"保持 a 和 b 中的数值不变","C":"将 a 和 b 中的数值减少一半","D":"将 a 和 b 中的数值交换"}$qt$, analysis = $qt$a=a+b; b=a-b; a=a-b; 实现 a 与 b 中数值的交换，故选 D。$qt$ where id = 366899 and not is_golden;
update t_question set stem = $qt$（2013 年第 35 题单选）下列程序段实现的功能是

a = a + b; b = a - b; a = a - b;$qt$, option_json = $qt${"A": "将 a 和 b 中的数值增加一倍", "B": "将 a 和 b 中的数值减少一半", "C": "保持 a 和 b 中的数值不变", "D": "将 a 和 b 中的数值交换"}$qt$, analysis = $qt$a=a+b; b=a-b; a=a-b; 是将 a 和 b 中的数值交换，故选 D。$qt$ where id = 366905 and not is_golden;
update t_question set stem = $qt$执行下面的程序段的时间复杂度为（）。

\text {for} (i = 0; i <   m; i + +)

\text {for} (j = 0; j <   n; j + +)

a [ i ] [ j ] = i * j;$qt$, option_json = $qt${"A":"O(m + n)","B":"O(m*n)","D":"O(n2)","C":"O(m2)"}$qt$, analysis = $qt$双重循环共执行m×n次赋值，时间复杂度为O(mn)。源卷选项标号笔误把“C.O(m2)”并进了题干尾部，导致库题干带垃圾串、C项缺失；复航官方解析也写明“时间复杂度为m*n”。故应清理题干、补回C项“O(m2)”，答案由C改为B。$qt$ where id = 366937 and not is_golden;
update t_question set stem = $qt$在一个降序排列的数组中查找一个数 n，使用折半查找法效率低于顺序查找法，则 n 的值（）。$qt$, option_json = $qt${"A": "大于数组的中间值", "B": "小于数组的中间值", "C": "等于数组的中间值", "D": "不确定"}$qt$, analysis = $qt$折半查找的基本思想:查找过程中,先确定查找元素的范围,然后逐步缩小序列范围,每次将待查找元素的序列范围小一半,直到找到或找不到元素为止。使用折半查找的效率低于顺序查找的效率,说明n大于数组的中间值$qt$ where id = 366942 and not is_golden;
update t_question set stem = $qt$若有以下数组说明，则 i = 10; a[a[i] - a[i-1]] 元素数值是( )。
int a[12]={1,4,7,10,2,5,8,11,3,6,9,12};$qt$, option_json = $qt${"A": "10", "B": "9", "C": "6", "D": "5"}$qt$, analysis = $qt$a[10]=9、a[9]=6，差值 9-6=3，a[3]=10，故选 A。$qt$ where id = 366953 and not is_golden;
update t_question set stem = $qt$设 a 、 b 、 c 为整型数，且 a = 2, b = 3, c = 4 ，则执行完以下语句:a* = 16 + (b++) - (++c)；后，a 的值是$qt$, analysis = $qt$16+3-5=14；a=2*14=28。$qt$ where id = 366959 and not is_golden;
update t_question set stem = $qt$(资料题，6分)

【综合题】

求1000之间的所有完数。所谓的完数是指一个数恰好等于它所有因子数之和。

例如，因为 6 = 1 + 2 + 3 ，所以6为完数。

c
#include 
main(){
 int i=0,j=0;
 int sum=0;
 int cnt=0;//统计完数
 for( i=2;i NULL$qt$, analysis = $qt$【1】sum=0（每个数重新求和）；【2】if(i%j==0) sum+=j（累加因子）；【3】if(sum==i) cnt++（完数计数）。故填 sum=0、if(i%j==0) sum+=j、if(sum==i) cnt++。$qt$ where id = 367442 and not is_golden;
update t_question set stem = $qt$Excel 中提供了工作表窗口拆分的功能以方便对一些较大工作表的编辑。要水平分割工作表，简便的操作是将鼠标指针，然后用鼠标将其拖动到自己满意的地方。$qt$, option_json = $qt${"A":"指向水平分割框","B":"指向垂直分割框","C":"执行\"窗口→新建窗口\"命令菜单","D":"执行\"窗口→重排窗口\"命令菜单"}$qt$, analysis = $qt$水平分割工作表：将鼠标指向水平分割框再拖动，故选 A。$qt$ where id = 367609 and not is_golden;
update t_question set stem = $qt$利用条件运算符将两条语句“if(a>=b) m=a,”"else m=b,"转换成与其等价的一条语句是____。$qt$, analysis = $qt$与 if(a>=b) m=a; else m=b; 等价的条件表达式为 m=(a>=b)?a:b;，故填 m=(a>=b)?a:b;。$qt$ where id = 367840 and not is_golden;
update t_question set stem = $qt$设a=3,b=4,c=5,则逻辑表达式l(a+b)*c-1&&b+c%2的值是____。$qt$, analysis = $qt$\begin{array}{l} (a + b) * c - 1 & & b + % 2 \ = (! (a + b) * c - 1) & & (b + c % 2) \ = (! (3 + 4) * 5 - 1) & & (4 + 5 % 2) \ = (! (7) * 5 - 1) & & (4 + 5 % 2) \ = (0 * 5 - 1) & & (4 + 5 % 2) \ = (- 1) & & (4 + 5 % 2) \ = (- 1) & & (4 + 1) \ = (- 1) & & (5) \ = 1 \ \end{array}$qt$ where id = 367845 and not is_golden;
update t_question set stem = $qt$设a=3,b=4,c=5,则逻辑表达式 I(a+b)^{*}c-1&b+c%2 的值是____。$qt$, analysis = $qt$!(a+b)=0，0*c−1=−1（非 0 为真）；b+c%2=4+1=5（真）；逻辑与的结果是 1，故填 1。$qt$ where id = 367850 and not is_golden;
update t_question set stem = $qt$在C语言中，Main（）函数是主函数，有且仅有一个。$qt$, analysis = $qt$main()函数是 C 言中的主函数，有且仅有一个。

注意C语言区分大小写$qt$ where id = 367970 and not is_golden;
update t_question set stem = $qt$在C语言中进行逻辑运算时，判断真、假的依据是-1为真，0为假。$qt$, analysis = $qt$C 语言中判断真假以非 0 为真、0 为假（不是 −1 为真），故该说法错误。$qt$ where id = 367971 and not is_golden;
update t_question set stem = $qt$static只能定义全局变量，作用域是当前文件中。$qt$, analysis = $qt$static 也可以定义局部变量（静态局部变量），「只能定义全局变量」错误，故该说法错误。$qt$ where id = 367974 and not is_golden;
update t_question set stem = $qt$一个循环的循环体中套有另一个循环称为循环嵌套定义，一个循环外面仅包围一层循环称为循环嵌套调用。$qt$, analysis = $qt$循环嵌套是循环体内又包含完整的循环（嵌套调用是函数概念），题干表述错误，故该说法错误。$qt$ where id = 367975 and not is_golden;
update t_question set stem = $qt$在C语言中，允许一行写几个语句，也可以一个语句分几行写。$qt$, analysis = $qt$C 语言允许一行写几个语句，也允许一个语句分几行写，故该说法正确。$qt$ where id = 367978 and not is_golden;
update t_question set stem = $qt$执行continue语句时将跳过所有循环的循环体中余下尚未执行的语句$qt$, analysis = $qt$执行 continue 语句时将跳过本层循环的本次循环体中余下尚未执行的语句$qt$ where id = 367979 and not is_golden;
update t_question set stem = $qt$判断字符串的a和b是否相等，应用使用 if(a==b).$qt$, analysis = $qt$判断两个字符串是否相等应使用 strcmp 函数（不能直接用 if(a==b) 比较），故该说法错误。$qt$ where id = 367985 and not is_golden;
update t_question set stem = $qt$在一个C源程序文件中，若要定义一个只允许本源文件所有函数使用的全局变量则该变量需要使用的存储类型是static。$qt$, analysis = $qt$在一个C源程序文件中，若要定义一个只允许本源文件所有函数使用的全局变量则该变量需要使用的存储类型是static。若想其他文件也可以使用到该全局变量，可以在其他使用的地方加上extern。$qt$ where id = 367986 and not is_golden;
update t_question set stem = $qt$用户所定义的标识符必须以字母或下画线开头$qt$, analysis = $qt$用户所定义的标识符必须以字母或下画线开头，故该说法正确。$qt$ where id = 367987 and not is_golden;
update t_question set stem = $qt$定义在main()函数后的任何函数都需要在main()中进行函数声明。$qt$, analysis = $qt$定义在 main() 函数后的函数只需在调用之前声明即可，故该说法错误。$qt$ where id = 367996 and not is_golden;
update t_question set stem = $qt$执行“int x=2, y=3,”后，表达式 x=y++=++x 的值是0。$qt$, analysis = $qt$y++ 不能作为赋值目标，表达式 x=y++=++x 不符合 C 语法、无法正常求值，题述结果不成立，故该说法错误。$qt$ where id = 367997 and not is_golden;
update t_question set stem = $qt$以下能对二维数组a进行正确实始化的语句是（）$qt$, option_json = $qt${"A": "int a[2]] = {{1,0,1},{5,2,3}};", "B": "int a[[3] = {{1,2}, {5,2,3,4}};", "C": "int a[3][3]={{1,2,3},{5},{2},{3}};", "D": "int a[][2] = {{0},{1}};"}$qt$, analysis = $qt$int a[][2]={{0},{1}}; 合法。$qt$ where id = 368284 and not is_golden;
update t_question set stem = $qt$下列可用于C语言用户标识符的一组是（）$qt$, option_json = $qt${"A": "abc void 3C", "B": "x_o _a12 CAT", "C": "case -fg avg", "D": "100 xxy goto"}$qt$, analysis = $qt$x_o、_a12、CAT 均为合法用户标识符（case 为关键字、-fg 含减号、100/3C 以数字开头等不合法），故选 B。$qt$ where id = 368286 and not is_golden;
update t_question set stem = $qt$能够正确表示逻辑关系“ a >= 15 ”或“ a <= -1 ”$qt$, option_json = $qt${"A": "a>=15 && a<=-1", "B": "a>=15 || a<=-1", "C": "a>=15 | a<=-1", "D": "a>=15 & a<=-1"}$qt$, analysis = $qt$或使用||

大于等于 >=

小于等于 <=

a>=15 || a<=-1$qt$ where id = 368287 and not is_golden;
update t_question set stem = $qt$为了避免在嵌套的条件语句if...else中产生二义性，C语名规定，else子句总与（）配对$qt$, option_json = $qt${"A": "缩排位置相同的if", "B": "其之前最近的if", "C": "其之后最近的if", "D": "同一行上的if"}$qt$, analysis = $qt$else 子句总与其之前最近的 if 配对，故选 B。$qt$ where id = 368291 and not is_golden;
update t_question set stem = $qt$若有以下程序:

main(){

matlab
int x,y,z;
 x = y=1;
 z =x++,y++,++y;
 printf("%d,%d,%d\n",z,y,x);
}$qt$, option_json = $qt${"A": "3,3,2", "B": "1,3,2", "C": "2,3,1", "D": "2,2,1"}$qt$, analysis = $qt$z=x++ 使 z=1、x=2；随后 y++、++y 使 y=3，输出 1,3,2，故选 B。$qt$ where id = 368297 and not is_golden;
update t_question set stem = $qt$while(lx) 中lx与下面的表这式（）等价$qt$, option_json = $qt${"A": "x==0", "B": "x==1", "C": "x!=5", "D": "x!=0"}$qt$, analysis = $qt$while(!x) 中 !x 与 x==0 等价，故选 A。$qt$ where id = 368299 and not is_golden;
update t_question set stem = $qt$以下能正确定义数组并正确赋初值的语句是（）$qt$, option_json = $qt${"A": "int N=5, b[N][N];", "B": "int a[1][2]={{1},{2}};", "C": "int c[2][]={{1,2},{3,4}},", "D": "int d[3][2]={{1,2},{3,4}}"}$qt$, analysis = $qt$int d[3][2]={{1,2},{3,4}} 定义合法（A 长度非常量、B 行数超限、C 第二维不能省略），故选 D。$qt$ where id = 368300 and not is_golden;
update t_question set stem = $qt$若有以下程序:

txt
main(){
 int x,y,z;
 x = y=1;
 z = x++,y++,++y;
 printf("%d,%d,%d\n",z,y,x);
}$qt$, option_json = $qt${"A": "3,3,2", "B": "1,3,2", "C": "2,3,1", "D": "2,2,1"}$qt$, analysis = $qt$z=x++ 使 z=1、x=2；y++、++y 使 y=3，输出 1,3,2，故选 B。$qt$ where id = 368301 and not is_golden;
update t_question set stem = $qt$若有以下定义下:

#define E 5

int A=16; double B = 5.5; char C='A';

则下列语句中正确的是（）$qt$, option_json = $qt${"A":"(A+B) ++","B":"B = A + +","C":"++C = A + 1 = E","D":"E++"}$qt$, analysis = $qt$B 为 double 变量，可将 A+E 的值赋给它；A 非左值、C 为常量、D 为常量自增均错，故选 B。$qt$ where id = 368302 and not is_golden;
update t_question set stem = $qt$while(lx) 中lx与下面的表这式（）等价$qt$, option_json = $qt${"A":"x==0","B":"x==1","C":"x!= 5","D":"x!=0"}$qt$, analysis = $qt$while(!x) 中 !x 与 x==0 等价，故选 A。$qt$ where id = 368303 and not is_golden;
update t_question set stem = $qt$以下能正确定义数组并正确赋初值的语句是（）$qt$, option_json = $qt${"A": "int N=5, b[N][N];", "B": "int a[1][2]={{1},{2}};", "C": "int c[2][j]={{1,2},{3,4}},", "D": "int d[3][2]={{1,2},{3,4}}"}$qt$, analysis = $qt$int d[3][2]={{1,2},{3,4}} 定义合法，故选 D。$qt$ where id = 368304 and not is_golden;
update t_question set stem = $qt$以下选项中叙述错误的是（）$qt$, option_json = $qt${"A": "C程序函数中定义的赋有初值的静态变量，每调用一次函数，赋一次初值", "B": "在C程序的同一函数中，各复合语句内可以定义变量，其作用域仅限于本复合语句内", "C": "C程序函数中定义的自动变量，系统不自动赋确定的初值", "D": "C程序函数的形参不可以说明为static型变量"}$qt$, analysis = $qt$C程序函数中定义的赋有初值的静态变量，每次调用，不用再重新赋初值。选项A错误。$qt$ where id = 368306 and not is_golden;
update t_question set stem = $qt$若有以下调用语句，则不正确的fun()函数的首部是（）

main () {

txt
...
int a[50],n;
...
fun(n,&a[9]);
...
}$qt$, option_json = $qt${"A":"void fun(int x, int y[])","B":"int fun(int m, int n[41])","C":"void fun(int p, int *s)","D":"int fun(int n, int a)"}$qt$, analysis = $qt$选项D不正确。第二个参数需要是能接收数组的，而int a是普通变量，不能接收数组。 选项A。定义时一维下标可以省。 选项B。传参是从下标9开始至50之间，一共41个元素，所以n[41]也可以。 选项C$qt$ where id = 368308 and not is_golden;
update t_question set stem = $qt$在C语言中，不合法的常量的是（）$qt$, option_json = $qt${"A":"3.E+02","B":"O12","C":"'\\012'","D":"0xFF"}$qt$, analysis = $qt$只有选项A是输入x自增之前的值。$qt$ where id = 368316 and not is_golden;
update t_question set stem = $qt$设有以下语句:

char ch1,ch2,scanf("%c%c",&ch1,&ch2);,若要为变量ch1和ch2分别输入字符A和B,则()$qt$, option_json = $qt${"A": "输入A和B之间使用逗号间隔", "B": "输入A和B之间不能使用任何间隔符", "C": "输入A和B之间使用空格间隔", "D": "编译时报错"}$qt$, analysis = $qt$```txt
//printf( %d,%f ,x=y++==++x,a);
char ch1,ch2,scanf("%c%c",&ch1,&ch2);
system("pause");
100 %
输出
显示输出来源(S): 生成
I>InitializeBuildStatus:
I> 正在对“Debug\test2.unsuccessfulbuild”执行 Touch 任务:
I>C1Compile:
I> test.c
I>e:\vs 2010 c project\test1\test2\test.c(6): error C2143: 语法错误 : 缺少“)”(在“字符串”的前面)
I>e:\vs 2010 c project\test1\test2\test.c(6): error C2371: “scanf”: 重定义; 不同的基类型
I> c:\program files (x86)\microsoft visual studio 10.0&include\stdio.h(304) : 参见“scanf”(在“字符串”的前面)
I>e:\vs 2010 c project\$qt$ where id = 368317 and not is_golden;
update t_question set stem = $qt$若执行printf("%d\n",strlen("a\n\"\x41\008"));语句，其输出的结果是（）

lua$qt$, option_json = $qt${"A": "7", "B": "6", "C": "5", "D": "4"}$qt$, analysis = $qt$第一个 \0 出现前的字符为 a、\n、"、A 共 4 个，strlen 值为 4，故选 D。$qt$ where id = 368318 and not is_golden;
update t_question set stem = $qt$若有以下调用语句，则不正确的fun()函数的首部是（）

txt
main () {
 ...
 int a[50],n;
 ...
 fun(n,&a[9])
 ...
}$qt$, option_json = $qt${"A": "void fun(int x, int y[])", "B": "int fun(int m, int n[41])", "C": "void fun(int p, int *s)", "D": "int fun(int n, int a)"}$qt$, analysis = $qt$实参 n、&a[9] 为 int 和 int*，形参 int a 无法接收地址，D 首部不正确，故选 D。$qt$ where id = 368319 and not is_golden;
update t_question set stem = $qt$设有一分段函数，则下列程序段哪个是正确的____。

{ \begin{array}{l l} {x=1} & {  a=b} \end{array} .$qt$, option_json = $qt${"A":"if(a<b)\nIf(c==d)\nx=1;\nelse x=2;","B":"if(a<b)\n{if(c==d)\nx=1;\nelse x=2;}","C":"if(a>b)\nif(c==d)\nx=1;\nelse x=2;","D":"if(a>=b)\nx=2;\nelse\n{if(c==d) x=1;}"}$qt$, analysis = $qt$分段函数“当 a>b 时 c==d 则 x=1、否则 x=2”：应写成 if(a>b) 后内嵌 if(c==d) x=1; else x=2;（A 的 If 大小写错误、B 条件方向相反、D 判断值相反），故选 C。$qt$ where id = 368356 and not is_golden;
update t_question set stem = $qt$一下叙述错误的是（）$qt$, option_json = $qt${"A":"c 程序经过编译、链接步骤之后才能形成一个真正可执行的二进制机器指令文件","B":"c 语言中的每条[打开播放器补全]最终都被转换成二进制的机器指\n\n令","C":"用 c 语言编写的程序称为源程序，它以 ASCII 代码形式存放在一个文本文件中","D":"c 语言源程序经过编译会生成一个为.obj 的目标文件"}$qt$, analysis = $qt$（AI 补答）注释等非执行内容不会全部转换为机器指令，B 说法错误，故选 B。$qt$ where id = 368361 and not is_golden;
update t_question set stem = $qt$设 a = 3，b = 2，c = 1，a > b > c 的值为 ____。$qt$, analysis = $qt$a>b 得 1，1>c（1>1）得 0，故 a>b>c 的值为 0，填 0。$qt$ where id = 369428 and not is_golden;
update t_question set stem = $qt$抹下选项中,非法的字符常量是()。

A '1r'$qt$, option_json = $qt${"A":"'\\r'","B":"'\\17'","C":"\"n\"","D":"'\\xaa'"}$qt$, analysis = $qt$“n”是字符串（双引号）而不是字符常量，属于非法字符常量，故选 C。$qt$ where id = 369717 and not is_golden;
update t_question set stem = $qt$下列运算符中优先级最高的是($qt$, option_json = $qt${"A":"<","B":"+","C":"&&","D":"!="}$qt$, analysis = $qt$算术 + 优先级最高。$qt$ where id = 370144 and not is_golden;
update t_question set stem = $qt$将字符g赋值给字符变量ch，正确的表达式是（）$qt$, option_json = $qt${"A":"ch=”g”","B":"ch=103","C":"ch='\\g'","D":"ch='\\103'"}$qt$, analysis = $qt$g ^ {\prime} = 1 0 3 = 0 1 4 7 (\text {八进制})$qt$ where id = 370376 and not is_golden;
update t_question set stem = $qt$若变量 a 是 int 类型，并执行了语句:a='A'+1.6;，则正确叙述是____。$qt$, option_json = $qt${"A":"a的值是字符C","B":"a的值是浮点型","C":"不允许字符型和浮点型相加","D":"a 的值是字符'A'的 ASCII 值加上 1"}$qt$, analysis = $qt$'A'+1.6=66.6，int 取 66='A'+1。$qt$ where id = 370388 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是____。

main(){

int a=0;

a + = (a = 8);

\operatorname{printf} (% d \backslash n, a)

}$qt$, analysis = $qt$a+=(a=8) 常见实现（GCC）为 16。$qt$ where id = 370539 and not is_golden;
update t_question set stem = $qt$数学表达式 \frac{x+y}{a^{2}+4b} 对应的 C 语言表达式为 ____。(注意^是次方的表示，原题是 a^{2} )$qt$, analysis = $qt$a² 写作 a*a：(x+y)/(a*a+4*b)。$qt$ where id = 370551 and not is_golden;
update t_question set stem = $qt$某循环队列的元素类型为char，队头指针front指向队头元素的前一个位置，队尾指针rear指向队尾元素，如

下图所示, 则队中从队头到队尾的元素为____。

0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
b c a b c d 1 2 3 4 5 6 c d f g
↑
rear
front$qt$, analysis = $qt$front 指向队头元素的前一个位置，所以队头是 front 的下一个下标 13，rear 指向队尾下标 2；从 13 依次取到 15，再绕回下标 0 取到 2，得到 d、f、g、b、c、a，即 dfgbca。$qt$ where id = 370554 and not is_golden;
update t_question set stem = $qt$以下程序运行后输出结果为____。

#include "stdio n"
int mystery(int a,int b){
 if(b==1) return a;
 else return a+mystery(a,b-1);
void main(){
 int x=5,y=3; printf("%d\n",mystery(x,y));
};$qt$, analysis = $qt$此题是函数的递归调用。第1次调用，x=5传给a，y=3传给b，返回a+ mystery(a,b-1)即5+ mystery(5,2)，第2次调用，返回5+5+ mystery(5,1)，第3次调用，此时b=1，返回5，最后的结果为 5+5+5=15 。$qt$ where id = 370573 and not is_golden;
update t_question set stem = $qt$设 x 都为整型变量，请写出描述“x 是偶数”的表达式 ____，$qt$, analysis = $qt$x 是偶数即 x 能被 2 整除，C 语言表达式为 x%2==0。故填 x%2==0。$qt$ where id = 370574 and not is_golden;
update t_question set stem = $qt$设 x 都为整型变量，请写出描述“x 是奇数”的表达式____。$qt$, analysis = $qt$设 x 都为整型变量，请写出描述“x 是奇数”的表达式  x%2!=0 。

奇数的话，%2结果不为0$qt$ where id = 370584 and not is_golden;
update t_question set stem = $qt$设有 int x = 11, 则表达式 (x + + * 1/3) 的值是 ____。$qt$, analysis = $qt$x++*1/3=11×1÷3=3（整除），故填 3。$qt$ where id = 370596 and not is_golden;
update t_question set stem = $qt$若有定义“int x=0;”, 则执行试值语句“ x=x+3+5,x*5 ;”后, 变量 x 中的值是 ____。$qt$, analysis = $qt$逗号表达式取 x=x+8 得 8。$qt$ where id = 370603 and not is_golden;
update t_question set stem = $qt$以下程序运行的输出结果是 ____

\begin{array}{l} \text {main()} \ {  \text {int p = 30;} \   \text {printf("%d\n", (p / 32 > 0 ?p / 10 : p%3));} \ } \end{array}$qt$, analysis = $qt$（AI 补答）p=30：p/32=0 不>0，取 p%3=0，输出 0。$qt$ where id = 370606 and not is_golden;
update t_question set stem = $qt$假设 x, y 是整型变量且分别赋值为 12、9，则执行表达式 x^{\wedge}y 的值为 ____。$qt$, analysis = $qt$12^9=1100B^1001B=0101B=5。$qt$ where id = 370609 and not is_golden;
update t_question set stem = $qt$假设 a 是整型变量，则执行表达式 a=25/3%3>1 后 a 的值为 ____。$qt$, analysis = $qt$25/3=8，8%3=2，2>1 得 1。$qt$ where id = 370616 and not is_golden;
update t_question set stem = $qt$41设有说明：char w;int x;float y;double z;则表达式w*x+z-y值的数据类型为 _____。$qt$, option_json = $qt${"A": "float", "B": "char", "C": "int", "D": "double"}$qt$, analysis = $qt$则表达式 w*x + z - y 值的数据类型为 double

char * int +double -float

= int +double-float

= double-float

= double$qt$ where id = 370628 and not is_golden;
update t_question set stem = $qt$12 已有程序段和输入数据的形式，程序中输入语句的正确形式应当为______。

main()

{ int a;float f;

printf("Input number:");

(输入语句)

printf("\nf=%f,a=%d\n",f,a);

}

Input number:4.5□□2<CR>$qt$, option_json = $qt${"A":"scanf(\"%d,%f\",&a,&f);","B":"scanf(\"%f,%d\",&f,&a);","C":"scnaf(\"%d%f\",&a,&f);","D":"scanf(\"%f%d\",&f,&a);"}$qt$, analysis = $qt$输入形式为 4.5,2（逗号分隔），格式串中的非格式字符须原样匹配：scanf("%f,%d",&f,&a);，故选 B。$qt$ where id = 370634 and not is_golden;
update t_question set stem = $qt$15 根据题目中已给出的数据输入和输出形式，程序中输入输出语句的正确内容是______。

main()

{int x;float y;

printf("enter x,y:");

输入语句

输出语句

}

输入形式：enter x,y:2 3.4

输出形式：x+y=5.40$qt$, option_json = $qt${"A":"scanf(\"%d,%f\",&x,&y);\nprintf(\"\\nx+y=%4.2f\",x+y);","B":"scanf(\"%d%f\",&x,&y);\nprintf(\"\\nx+y=%4.2f\",x+y);","C":"scanf(\"%d%f\",&x,&y);\nprintf(\"\\nx+y=%6.1f\",x+y);","D":"scanf(\"%d%3.1f\",&x,&y);\nprintf(\"\\nx+y=%4.2f\",x+y);"}$qt$, analysis = $qt$输入以空格分隔用 %d%f；输出 x+y=5.40 用 %4.2f，故选 B。$qt$ where id = 370636 and not is_golden;
update t_question set stem = $qt$18 有输入语句：scanf("a=%d,b=%d,c=%d",&a,&b,&c);为使变量a的值为1，b为3，c为2，从键盘输入数据的正确形式应当是______。$qt$, option_json = $qt${"A":"132<CR>","B":"1,3,2<CR>","C":"a=1□b=3□c=2<CR>","D":"a=1,b=3,c=2<CR>"}$qt$, analysis = $qt$scanf 格式串含 a=、b=、c= 字样，须原样输入 a=1,b=3,c=2，故选 D。$qt$ where id = 370638 and not is_golden;
update t_question set stem = $qt$21 已知ch是字符型变量，下面正确的赋值语句是______。$qt$, option_json = $qt${"A":"ch='123';","B":"ch='\\xff';","C":"ch='\\08';","D":"ch=\"\\\";"}$qt$, analysis = $qt$转义字符常量 ch='\xff' 正确（'123' 为多字符常量、'\08' 非法八进制、ch="\"" 为字符串），故选 B。$qt$ where id = 370640 and not is_golden;
update t_question set stem = $qt$61 若运行时输入：16<CR>,则以下程序的运行结果是______。

#include <stdio.h>

void main(void)

{int year;

printf("Input your year:");

scanf("%d",&year);

if (year>=18)

printf("your \4.5 yuan/xiaoshi");

else

printf("your \3.0 yuan/xiaoshi");

}$qt$, analysis = $qt$输入 16：16<18 不满足，执行 else 分支，输出 your 3.0 yuan/xiaoshi，故填 your 3.0 yuan/xiaoshi。$qt$ where id = 370649 and not is_golden;
update t_question set stem = $qt$63 若运行时输入：4.4<CR>,则以下程序的运行结果是______。

#include <stdio.h>

void main(void)

{float costprice,sellingprice;

printf("Enter Cost Price \:");

scanf("%f",&costprice);

if(costprice>=5)

{sellingprice=costprice+costprice*0.25;

printf("Selling Price(0.25)%6.2f",sellingprice);

}

else

{sellingprice=costprice+costprice*0.30;

printf("Selling Price(0.30)%6.2f",sellingprice);

}

}$qt$, analysis = $qt$输入 4.4：4.4<5，执行 else 分支：4.4×(1+0.30)=5.72，输出 Selling Price(0.30) 5.72，故填 Selling Price(0.30) 5.72。$qt$ where id = 370651 and not is_golden;
update t_question set stem = $qt$3语句while(!E);中的!E等价于______。$qt$, option_json = $qt${"A":"E==0","B":"E!=1","C":"E!=0","D":"E==1"}$qt$, analysis = $qt$（AI 补答）while(!E) 中 !E 等价于 E==0，故选 A。$qt$ where id = 370668 and not is_golden;
update t_question set stem = $qt$2以下对一维数组a的正确说明是_______。$qt$, option_json = $qt${"A":"int n; scanf(\"%d\",&n); int a[n];","B":"int n=10,a[n];","C":"int a(10);","D":"#define SIZE 10\nint a[SIZE];"}$qt$, analysis = $qt$定义一维数组可用符号常量作长度：#define SIZE 10 int a[SIZE];，故选 D。$qt$ where id = 370681 and not is_golden;
update t_question set stem = $qt$32有两个字符数组a、b,则以下正确的输入语句是______。$qt$, option_json = $qt${"A":"gets(a,b);","B":"scanf(\"%s%s\",a,b);","C":"scanf(\"%s%s\",&a,&b);","D":"gets(\"a\");gets(\"b\");"}$qt$, analysis = $qt$输入两个字符串：scanf("%s%s",a,b);，故选 B。$qt$ where id = 370696 and not is_golden;
update t_question set stem = $qt$38判断字符串s1是否大于字符串s2，应当使用______。$qt$, option_json = $qt${"A":"if (s1>s2)","B":"if (strcmp(s1,s2)","C":"if(strcmp(s2,s1)>0)","D":"if(strcmp(s1,s2)>0)"}$qt$, analysis = $qt$判断 s1 是否大于 s2 应用 strcmp(s1,s2)>0，故选 D。$qt$ where id = 370700 and not is_golden;
update t_question set stem = $qt$40 下面描述正确的是_______。$qt$, option_json = $qt${"A":"两个字符串包含的字符个数相同时，才能比较字符串","B":"字符个数多的字符串比字符个数少的字符串大","C":"字符串\"STOP\"与\"STOP■\"相等","D":"字符串\"That\"小于字符串\"The\""}$qt$, analysis = $qt$字符串比较按逐个字符的 ASCII 码：That 小于 The（'a'<'e'），故选 D。$qt$ where id = 370702 and not is_golden;
update t_question set stem = $qt$有定义 inta = 1234; ；，获取其百位数码的表达式为 ___ 。$qt$, analysis = $qt$获取百位数字的表达式为 a/100%10，故填 a/100%10。$qt$ where id = 370740 and not is_golden;
update t_question set stem = $qt$若有定义: char a = 97, c; ，则表达式 c = a + 8 - 3 的值为$qt$, analysis = $qt$a+8-3=97+5=102，即字符 f，故填 f。$qt$ where id = 370741 and not is_golden;
update t_question set stem = $qt$设变量定义为"int a, b,"，执行下列语句时，输入____，则a和b的值都是10。

\text {scanf} (" a = % d, b = % d", & a, & b);$qt$, analysis = $qt$scanf 格式串为 a=%d,b=%d，应输入 a=10,b=10，故填 a=10,b=10。$qt$ where id = 370750 and not is_golden;
update t_question set stem = $qt$设 a = 3,b = 4,c = 5 则 (a + b) + c - 1& b + c / 2 逻辑表达式的结果是（）$qt$, analysis = $qt$!(a+b)=0，0+5−1=4（非 0 为真），b+c/2=6（真），逻辑与结果为 1，故填 1。$qt$ where id = 370763 and not is_golden;
update t_question set stem = $qt$设， a = 3,b = 4,c = 5 ，则 a\| b + c& & b - c 的逻辑表达式值是（）$qt$, analysis = $qt$a 非 0 使逻辑或短路，表达式为真即 1，故填 1。$qt$ where id = 370765 and not is_golden;
update t_question set stem = $qt$设char型变量x中的值为10100111，则表达式 (2+x)^{(~3)} 的二进制结果是（）

txt
=(00000010+10100111)^(~00000011)
=(10101001)^(11111100)
=01010101

难度: 易

知识点:

7.

若有 unsigned int a = 6; int b = -20; 则 (a + b) > 6?1:0 表达式的结果是（）$qt$, analysis = $qt$无符号运算下 a+b=6+(−20) 变为大正数、大于 6 成立，三元表达式取 1，故填 1。$qt$ where id = 370766 and not is_golden;
update t_question set stem = $qt$txt
若有以下代码:
main{
 int x = 1, a = 0, b = 0;
 switch(x) {
 case 0: b++;
 case 1: a++;
 case 2: a++; b++;
 }
 printf("a = %d, b = %d\n", b, a);
}$qt$, analysis = $qt$x=1 进入 case 1 后顺序执行 case 2：a=2、b=1；按格式串先输出 b 再输出 a，显示 a = 1, b = 2，故填 a = 1, b = 2。$qt$ where id = 370768 and not is_golden;
update t_question set stem = $qt$c
有以下程序:
#include 
int a =5;
void fun(int b){
 int a =10;
 a+=b;
 printf("%d",a);
}
main(){
 int c=20;
 fun(c); a+=c;
 printf("%d\n",a);

}

则程序运行后的输出结果是____。$qt$, analysis = $qt$fun 中局部 a=10+20=30 输出 30；main 中全局 a=5+20=25 输出 25，合计 3025，故填 3025。$qt$ where id = 370769 and not is_golden;
update t_question set stem = $qt$有以下程序:

c
#include 
main(){
 int a=-2,b=0;
 while(a++&&++b);printf("%d,%d\n",a,b);
}

则程序运行后的输出结果是（）$qt$, analysis = $qt$a=-2：两次循环后 a=1、b=2，输出 1,2，故填 1,2。$qt$ where id = 370770 and not is_golden;
update t_question set stem = $qt$有以下程序:

c
#include 
main(){
 int k=055;
 printf("%d\n",k++);
}$qt$, analysis = $qt$k=055 是八进制数（=45），k++ 先取值输出 45，故填 45。$qt$ where id = 370772 and not is_golden;
update t_question set stem = $qt$若有x是int型变量，则执行以下语句结果是（）

txt
for(x=1; ,x++) {
 if(x%2==0)
 if(x% 3==0)
 if(x%5==0)

txt
{
 printf("%d",x);
 break;
}
}$qt$, analysis = $qt$循环找到同时能被 2、3、5 整除的数并输出 30 后 break，故填 30。$qt$ where id = 370774 and not is_golden;
update t_question set stem = $qt$有以下函数:

#include <stdio.h>

#define S(x) (x)*x*2

javascript
main( ){
 int k=5,j=2;
 printf("%05o,%-5d",S(k+j),S(k-j));
}

若有空格使用“X”代替。$qt$, analysis = $qt$宏展开：S(k+j)=(5+2)×5+2×2=39（八进制 47，%05o 输出 00047），S(k−j)=(5−2)×5−2×2=11（%-5d 左对齐补 X），故填 00047,11XXX。$qt$ where id = 370775 and not is_golden;
update t_question set stem = $qt$若有x是int型变量，则执行以下语句结果是（）

txt
for(x=1; ;x++) {
 if(x%2==0)
 if(x% 3== 0)
 if(x%5==0)
 {
 printf("%d",x);
 break;
 }
}$qt$, analysis = $qt$循环找到同时被 2、3、5 整除的 30 后 break 输出，故填 30。$qt$ where id = 370776 and not is_golden;
update t_question set stem = $qt$设 a, b, c 都是 int 类型变量，如果 a 的值为 1，b 的值为 2，则执行 “c = a++ || b++;” 语句的，变量 b 的值是 ____。$qt$, analysis = $qt$a++ 为真使逻辑或短路，b++ 不执行，b 仍为 2，故填 2。$qt$ where id = 370785 and not is_golden;
update t_question set stem = $qt$设 a=3, b=4, c=5, 则逻辑表达式! (a+b)^{*}c-1 &&b+c%2 的值是 ____。$qt$, analysis = $qt$!(a+b)=0，0*5−1=−1（非 0 真）；b+c%2=5（真）；逻辑与结果为 1，故填 1。$qt$ where id = 370789 and not is_golden;
update t_question set stem = $qt$若有 x 是 int 型变量，则执行以下语句结果是()

\text {for} (x = 1;; x + + ) {.

\text {if} (x % 2 = = 0)

\text {if} (x % 3 = = 0)

\text {if} (x % 5 = = 0)

{

\text {printf} (% d, x);

\text {break;}

} . }

}$qt$, analysis = $qt$循环找到同时被 2、3、5 整除的 30 后输出，故填 30。$qt$ where id = 370790 and not is_golden;
update t_question set stem = $qt$int m = 5, y = 2; 则 表达式 y += y -= m * y 的值为 ____。$qt$, analysis = $qt$int m =5,y =2;

y^{+} = y^{-} = m^{*}y

y = y + (y - = m^{*}y)

y = y + (y = y - m^{*}y)

y = y + (y = 2 - 5 * 2)

y = y + (y = 2 - 10)

y = -8 + (-8)

y=-16$qt$ where id = 370801 and not is_golden;
update t_question set stem = $qt$当 a = 5, b = 4, c = 2 时，表达式 a > b! = c 的值是 ____。$qt$, analysis = $qt$a>b 得 1，1!=c（1≠2）得 1，故填 1。$qt$ where id = 370802 and not is_golden;
update t_question set stem = $qt$用语句计算 1 / 4 个球的体积 vol = 1 / 4 * 3.14 * r * r * r; 若变量 r 的值为 2, 则 vol 的值为 ____。$qt$, analysis = $qt$1/4 是整除为 0，vol=0*3.14*2*2*2=0，故填 0。$qt$ where id = 370805 and not is_golden;
update t_question set stem = $qt$int n=45; 表达式 n%10+n/10%10 的值为 ____.$qt$, analysis = $qt$n%10+n/10%10

=45%10 + 45/10%10

= 5 + 4

=9$qt$ where id = 370811 and not is_golden;
update t_question set stem = $qt$若有以下程序:

int fun3(int x){

\text {static int } a = 3;

a + = x;

\text {return} (a);

}

void main(){

\text {int} k = 2, m = 1, n;

n = \text {fun3(k)};

n = \text {fun3(m)};

\operatorname{printf} (% d \backslash n, n);

}

以上程序的运行结果是____。$qt$, analysis = $qt$fun3 函数里的 a 是静态变量

执行 n = fun3(2)，fun3 函数里 a = 3, a += x, a = 3 + 2 = 5, n = 5;

执行 n = fun3(1)，这时候 a 就再进制初始化了，直接保留上一次值， a += x, a = 5 + 1 = 6, n = 6

输出 n, 即是 6$qt$ where id = 370812 and not is_golden;
update t_question set stem = $qt$C 语言表达式 5 > 2 > 7 > 8 的值是 ____。$qt$, analysis = $qt$5>2 得 1，1>7 得 0，0>8 得 0，故填 0。$qt$ where id = 370818 and not is_golden;
update t_question set stem = $qt$设有语句“int a=3, b; b=(a++||a++);”，运行结束后，变量 a 的值为 ____。$qt$, analysis = $qt$a++||a++

a 为 3, 非 0 为真，a 再自增， a=a+1=4,\parallel  出现短路现象，所以  \parallel  右边的  a++  不会被执行到。$qt$ where id = 370820 and not is_golden;
update t_question set stem = $qt$假设 int x=1, y=2, z=3; 则表达式 z+=x>y?++x:++y 的值是 ____。$qt$, analysis = $qt$z+=x>y?++x;++y

z = z + (x > y? + + x: + + y)

z = 3 + (1 > 2?2:3)

z = 3 + 3

z=6$qt$ where id = 370821 and not is_golden;
update t_question set stem = $qt$若 m 是一个三位数，则其百位数字的表达式为 ____。$qt$, analysis = $qt$若 m 是一个三位数，则其百位数字的表达式为 m / 100。

百位:m/100

十位:m/10%10

个数:m%10$qt$ where id = 370822 and not is_golden;
update t_question set stem = $qt$有下列程序

#include <stdio.h>

main()

{ int x=6,y=2, z1,z2;

z1 = x||y; z2 = x|y;

printf("%d,%d\n", z1, z2);

执行后的输出结果是().$qt$, analysis = $qt$z1=x||y=1（逻辑或）；z2=x|y=6|2=6（按位或），输出 1,6，故填 1,6。$qt$ where id = 370824 and not is_golden;
update t_question set stem = $qt$若有以下程序段

double x = 5.16894

printf("%f\n",(int)(x*1000+0.5)/(double)1000);

则程序段的输出结果是____。$qt$, analysis = $qt$(int)(5168.94+0.5)=5169，/1000.0=5.169，%f 输出 5.169000。$qt$ where id = 370844 and not is_golden;
update t_question set stem = $qt$若有以下说明: int a[12]={1,2,3, 4,5,6, 7,8,9, 10, 11, 12};char c='a',d, g;则数值为 4 的表达式是()$qt$, option_json = $qt${"A":"a[g-c]","B":"a[4]","C":"a['d'-'c']","D":"a['d'-c]"}$qt$, analysis = $qt$数组和指针的操作不一样的。 ### 三、填空题$qt$ where id = 370854 and not is_golden;
update t_question set stem = $qt$表达式 1! = 2 && 3! = 5 的值是_。$qt$, option_json = $qt${"A": "True"}$qt$, analysis = $qt$1!=2 与 3!=5 均为真，结果 1。$qt$ where id = 370867 and not is_golden;
update t_question set stem = $qt$已知 a = 12 则表达式 a + = a - = a = a 的结果是 ____。$qt$, analysis = $qt$复合赋值链后 a=0。$qt$ where id = 370869 and not is_golden;
update t_question set stem = $qt$若已定义 int a, 则表达式 a = 10, a + 10, a++ 的值是 ____。$qt$, analysis = $qt$逗号表达式值取 a++ 的值 10。$qt$ where id = 370870 and not is_golden;
update t_question set stem = $qt$int x[2][3];，则以下关于二维数组 x 的叙述错误的是（）。$qt$, option_json = $qt${"A":"x[0]可看作是由3个整形元素组成的一维数组","B":"x[0]和 x[1]是数组名，分别代表不同的地址常量","C":"数组 x 包含6个元素","D":"可以用语句 x[0]=0; 为数组所有元素赋初值 0"}$qt$, analysis = $qt$二维数组元素在内存中按顺序存放，先顺序放第一行，再顺序放第二行，以些类推。$qt$ where id = 370872 and not is_golden;
update t_question set stem = $qt$有如下程序:

\begin{array}{l} \text {main () } { \ \text {int} y = 3, x = 3, z = 1; \ \end{array}

txt
printf ("%d,%d\n",(++x,y++),z+2);
}

运行该程序的输出结果是____。$qt$, analysis = $qt$(++x,y++) 是逗号表达式取 y++ 的值 3（y 变 4），z+2=3，输出 3,3，故填 3,3。$qt$ where id = 370890 and not is_golden;
update t_question set stem = $qt$有以下程序:#include <stdio.h>

void main()
{ int i.s=0;

\text {for} (i = 1; i < 1 0; i + = 2)

s + = i + 1;

printf( "%d\n",s);} 程序执行后的输出结果是(40)30$qt$, analysis = $qt$i=1、3、5、7、9 时 s+=i+1：s=2+4+6+8+10=30，故填 30。$qt$ where id = 370898 and not is_golden;
update t_question set stem = $qt$若有以下代码:

\text {char} a [ 1 0 ] = " 1 2 3 5 6 7";

\text {char} b [ 1 0 ] = " a b c d e f g";

\underline{strcpy(a,b);}

\text {printf} (" 0 % - 0 5 o", a [ b [ 4 ] - b [ b [ 5 ] - b [ 3 ] ]) - 3 2);

如有空格请使用小写字母 v 代表

请写出输出结果____。$qt$, analysis = $qt$strcpy 是字符串拷贝操作（a 被 b 覆盖为 abcdefg）；printf("0%-05o", a[b[4]-b[b[5]-b[3]]]-32) 的输出结果为 0103vv，其中空格用 v 表示。$qt$ where id = 370911 and not is_golden;
update t_question set stem = $qt$下列程序的输出结果是()。
#include <stdio.h>
main(){
 int i, a =0, b=0;
 for(i=1, i<10;i++){
 if(i%2==0){
 a++; continue;
 }
 b++;
}
printf("a=%d,b=%d",a,b);
}$qt$, option_json = $qt${"A":"a = 4, b = 4","B":"a = 4, b = 5","C":"a = 5, b = 4","D":"a = 5, b = 5"}$qt$, analysis = $qt$i=1~9 中偶数 4 个使 a++、奇数 5 个使 b++，得 a=4,b=5，故选 B。$qt$ where id = 370921 and not is_golden;
update t_question set stem = $qt$若有 x 是 int 型变量，则执行以下语句结果是()

\text {for} (x = 1;; x + + ) {

\text {if} (x % 2 = = 0)

\text {if} (x % 3 = = 0)

\text {if} (x % 5 = = 0)

{

printf(%d",x);

\text {break;}

}$qt$, analysis = $qt$循环找到同时被 2、3、5 整除的 30 后输出，故填 30。$qt$ where id = 370922 and not is_golden;
update t_question set stem = $qt$有以下函数:

# \text {include} }

# \text {define} S (x) (x) ^ {*} x ^ {*} 2

main()

\text {int} k = 5, j = 2;

\text {printf} (% 0 5 o, % - 5 d ^ {\prime \prime}, S (k + j), S (k - j));

}若有空格使用“X”代替。$qt$, analysis = $qt$宏展开后 S(k+j)=39（八进制 47）、S(k−j)=11，输出 00047,11XXX，故填 00047,11XXX。$qt$ where id = 370923 and not is_golden;
update t_question set stem = $qt$用语句计算 1 / 4 个球的体积 vol = 1 / 4 * 3.14 * r * r * r; 若变量 r 的值为 2, 则 vol 的值为 ____。$qt$, analysis = $qt$1/4=0（整除），vol=0。$qt$ where id = 370926 and not is_golden;
update t_question set stem = $qt$若有以下程序:

int fun3(int x){
 static int a =3;
 a+=x;
 return(a);
}

void main(){
 int k=2,m=1,n;

n = \text {fun3} (k);

n = \text {fun3} (m);

printf(%d\n",n);

}

以上程序的运行结果是____。$qt$, analysis = $qt$static 变量 a 跨调用保持：fun3(2) 后 a=5、fun3(1) 后 a=6，输出 6，故填 6。$qt$ where id = 370932 and not is_golden;
update t_question set stem = $qt$假设 int x = 1, y = 2, z = 3; 则表达式 z += x > y ? ++x: +y 的值是 ____。$qt$, analysis = $qt$x>y（即 1>2）不成立，三元表达式取 +y 即 2，执行 z+=2，z=3+2=5。故填 5。$qt$ where id = 370935 and not is_golden;
update t_question set stem = $qt$有下列程序
#include 
main()
{ int x=6,y=2, z1,z2;
z1=x||y; z2=x|y;

\overline{count(%d,%d\n", z1, z2)};

执行后的输出结果是().$qt$, analysis = $qt$z1=1（逻辑或），z2=6|2=6。$qt$ where id = 370937 and not is_golden;
update t_question set stem = $qt$数学表达式 (x+y)/(a^2+4b) 对应的 C 语言表达式为____。（注意是次）表示，原题是 a2）$qt$, analysis = $qt$a² 写作 a*a。$qt$ where id = 370938 and not is_golden;
update t_question set stem = $qt$int n=45;表达式n%10+n/10%10的值为____。$qt$, analysis = $qt$n%10+n/10%10

=45%10 + 45/10%10

= 5 + 4

=9$qt$ where id = 370946 and not is_golden;
update t_question set stem = $qt$设有定义 int x=9, y=8; 表达式 x == y + 1 的结果是 ____。$qt$, analysis = $qt$9==8+1 为真，结果 1。$qt$ where id = 370957 and not is_golden;
update t_question set stem = $qt$设 a 为整型变量, 初值为 12 , 执行赋值表达式 a + = a - = a^{*}a 后, a 的值是____。$qt$, analysis = $qt$a-=a*a 得 -132；a+=(-132) 得 -264。$qt$ where id = 370960 and not is_golden;
update t_question set stem = $qt$设 int x=7, y=3, 则表达式 x%y+x/y 的值是 ____。$qt$, analysis = $qt$7%3=1，7/3=2，和为 3。$qt$ where id = 370966 and not is_golden;
update t_question set stem = $qt$设 int x=2, y=1; 则表达式 x+++y 的值是 ____。$qt$, analysis = $qt$(x++)+y=2+1=3。$qt$ where id = 370968 and not is_golden;
update t_question set stem = $qt$设 int m=0;，执行表达式 m||(m=2)||(m=3)||(m=4) 后，m 的值是 ____。$qt$, analysis = $qt$m=0 为假→(m=2) 为真短路，m=2。$qt$ where id = 370969 and not is_golden;
update t_question set stem = $qt$设 int a=0, b=0, c=2, d=4; 则执行 (c=a==b) \mid (d=b==a); 后变量 d 的值是 ____。$qt$, analysis = $qt$两赋值均为 1；d=b==a=1。$qt$ where id = 370973 and not is_golden;
update t_question set stem = $qt$若有以下说明: int a[12]={1,2,3, 4,5,6, 7,8,9, 10, 11, 12};char c='a',d,g;则数值为4的表达式是()$qt$, option_json = $qt${"A":"a[g - c]","B":"a[4]","C":"a['d' - 'c']","D":"a['d' - c]"}$qt$, analysis = $qt$数组和指针的操作不一样的。 ### 三、填空题$qt$ where id = 370992 and not is_golden;
update t_question set stem = $qt$下面是有关 C 语言字符数组的描述，其中错误的是____。$qt$, option_json = $qt${"A":"不可以用赋值语句给字符数组名赋字符串","B":"可以用输入语句把字符串整体输入给字符数组","C":"字符数组中的内容不一定是字符串","D":"字符数组只能存放字符串\n\n}\n程序运行后的输出结果是 ____。"}$qt$, analysis = $qt$用来存放字符数据的数组是字符数组。字符数组中的一个元素存放一个字符。所以选项D只能存放字符串的说法是错误的，应该是字符数组只能存放字符，而字符串是用字符数组来表示的。 ### 二、判断题$qt$ where id = 370993 and not is_golden;
update t_question set stem = $qt$以下程序中函数 f 的功能是将 n 个字符串，按由小到小的顺序进行排序。

#include <string.h>
void fun(char str[][12],int num){
char tmp[15]; int i,j;
for(i=0;i<num-1;i++)
 for (j=i+1;j<num;j++)
 if(strcmp(str[i],str[j])>0) {
 strcpy(tmp,str[i]);
 strcpy(str[i],str[j]);
 strcpy(str[j],tmp);}
}

javascript
main(){
char p[][12]={"abc","cdef","aabdef","dcdbe","aabd"};
fun(p,5); printf("%d\n",strlen(p[0]));

dart
system("pause");
}$qt$, analysis = $qt$比较字符串的大小是从字符串的第一个字母开始比较，如果第一个字母相同则比较第二个字母，以此类推，直至字符串结束，结合本题可知，比较后的字符串数组为： p[0]="aabd"；p[1]="aabdef"；p[2]="abc"；p[3]="cdef"；p[4]="dcdbe"；所以，strlen(p[0])=4。 ### 四、综合题 ### 【2023版及以前】【第1题】答案：ABCDE 解析：程序中函数scmp的功能是返回形参指针str1和str1所指字符串中较大字符串的首地址。比较字符串的大小是从字符串的第一个字母开始比较，如果第一个字母相同则比较第二个字母，以此类推，直至字符串结束。string中存放的是最大字串。即ABCDE。 ### 【2024版及以后】【第1题】答案：&a[i++] 解析:本题需要填的位置是scanf的输入项列表。 %d对应的是int类型，对数组各元素进行初始化，在scanf输入项列中，需要是地址。 所以引用每个元素进行初始，即&a[i++]。$qt$ where id = 370994 and not is_golden;
update t_question set stem = $qt$已知有变量定义 double x=1.6; int a=78; 正确的输出语句_。$qt$, option_json = $qt${"A":"printf(\"%f%d\\n\",x,a);","B":"printf(\"%f%f\\n\",x,a);","C":"printf(\"%d%f\\n\",x,a);","D":"printf(\"%d%d\\n\",x,a);"}$qt$, analysis = $qt$（AI 补答）double 用 %f、int 用 %d：printf("%f%d\n",x,a); 正确，故选 A。$qt$ where id = 371005 and not is_golden;
update t_question set stem = $qt$已知 a = 12 则表达式 a + = a - = a* = a 的结果是$qt$, analysis = $qt$复合赋值链（a=a 起）后 a=0。$qt$ where id = 371007 and not is_golden;
update t_question set stem = $qt$int x[2][3];，则以下关于二维数组 x 的叙述错误的是（）。$qt$, option_json = $qt${"A":"x[0]可看作是由3个整形元素组成的一维数组","B":"x[0]和 x[1]是数组名，分别代表不同的地址常量","C":"数组 × 包含6个元素","D":"可以用语句 x[0] = 0; 为数组所有元素赋初值 0"}$qt$, analysis = $qt$二维数组元素在内存中按顺序存放，先顺序放第一行，再顺序放第二行，以些类推。$qt$ where id = 371009 and not is_golden;
update t_question set stem = $qt$已知:char s[10]，若要从终端给 s 输入 5 个字符，错误的语句是（）。$qt$, option_json = $qt${"A":"gets( &s[0] );","B":"scanf(\"%s\",s+1);","C":"scanf(\"%s \",s[1]);","D":"gets(s);"}$qt$, analysis = $qt$（AI 补答）scanf("%s",s[1]) 第二参数应传地址，写法错误，故选 C。$qt$ where id = 371011 and not is_golden;
update t_question set stem = $qt$已知 int a; 使用 scanf() 函数输入一个整数给变量 a, 正确的函数调用是()$qt$, option_json = $qt${"A":"scanf(\"%d\", a);","B":"scanf(\"%d\",&a);","C":"scanf(\"A\", &a);","D":"scanf(\"%df\", &a);"}$qt$, analysis = $qt$（AI 补答）输入整数：scanf("%d",&a); 正确，故选 B。$qt$ where id = 371015 and not is_golden;
update t_question set stem = $qt$C语言的函数体由()括起来

A( )$qt$, option_json = $qt${"B":"{}\n\nC . []","D":"/**/"}$qt$, analysis = $qt$（AI 补答）C 语言的函数体由一对花括号 {} 括起来，故选 B。$qt$ where id = 371016 and not is_golden;
update t_question set stem = $qt$已知 a = 12 ，则表达式 a + = a - = a* = a 的结果是$qt$, option_json = $qt${"A": "0", "B": "144", "C": "12", "D": "-264"}$qt$, analysis = $qt$同 371007：0。$qt$ where id = 371028 and not is_golden;
update t_question set stem = $qt$若已定义 int a, 则表达式 a = 10, a + 10, a++ 的值是 ____。$qt$, option_json = $qt${"A": "20", "B": "10", "C": "21", "D": "11"}$qt$, analysis = $qt$逗号表达式值取 a++ 值 10。$qt$ where id = 371029 and not is_golden;
update t_question set stem = $qt$数学表达式 (x+y)/(a^2+4b) 对应的 C 语言表达式为____。（注意^是次方的表示，原题是 a^{2}）$qt$, analysis = $qt$a² 写作 a*a：(x+y)/(a*a+4*b)。$qt$ where id = 371038 and not is_golden;
update t_question set stem = $qt$假设 x, y 是整型变量且分别赋值为 12、9，则执行表达式 x^y 的值为 ____。$qt$, analysis = $qt$12^9=1100B^1001B=0101B=5。$qt$ where id = 371039 and not is_golden;
update t_question set stem = $qt$若 a 是 int 型变量，则表达式 (a = 4 * 5, a * 2), a + 6 的值为（ ）。$qt$, analysis = $qt$逗号表达式：a=4*5=20 后取 a+6=26。$qt$ where id = 371040 and not is_golden;
update t_question set stem = $qt$若 x 和 n 都是 int 型变量，且 x 和 n 的初值都是 6，则计算表达式 x += n++ 后，x 的值为:____，n 的值为:____。$qt$, analysis = $qt$x+=n++：x=6+6=12（n++取旧值），n 自增为 7。$qt$ where id = 371044 and not is_golden;
update t_question set stem = $qt$若变量 x, y 已定义为 int 类型且 x 的值为 99, y 的值为 9, 请将输出语句 printf(____, x/y); 补充完整,

使其输出的计算结果形式为: x / y = 11 。$qt$, analysis = $qt$格式串 "x/y=%d\n"（99/9=11）。$qt$ where id = 371050 and not is_golden;
update t_question set stem = $qt$假设有条件 int x=1, y=2, z=3; 则表达式 z+=x>y?++x:++y 的值是 ____.$qt$, analysis = $qt$x>y 假→取 ++y=3；z=3+3=6。$qt$ where id = 371061 and not is_golden;
update t_question set stem = $qt$字符串 \mathbf { h e l l o } 在内存中占用_____个存储单元。$qt$, analysis = $qt$含结尾 '\0' 共占 6 个存储单元。$qt$ where id = 371084 and not is_golden;
update t_question set stem = $qt$设 double r=2.5，则表达式 3 / 4 ^ { * } 3 . 1 4 ^ { * } \mathrm { r ^ { * } r } 的值等于_____。$qt$, analysis = $qt$3/4 是整除为 0，整个表达式为 0，故填 0。$qt$ where id = 371085 and not is_golden;
update t_question set stem = $qt$下面程序是判断一元二次方程 ax^{2}+bx+c=0 根的情况。

c
#include 
int main(void){
 float a, b, c, disc;
 scanf("a=%f,b=%f,c=%f",&a,&b,&c);
 delta=b*b-4*a*c;
 if(__________) printf("该方程有两个相等的实根。\n");
 else if(__________) printf("该方程有两个不相等的实根。\n");
 ____ printf("该方程没有实根。\n");
 return 0;
}
一元二次方程△=b*b-4*a*c
△>0时，方程有2个不相等的实根；
△=0时，方程有两个相等的实根；
△0_, _else_。
if(条件1为真)执行操作1;
else if(条件2为真)执行操作2;
else if(条件3为真)执行操作3;
......
else 执行操作n;$qt$, analysis = $qt$依次填空：disc==0、disc>0、else，故填 disc==0、disc>0、else。$qt$ where id = 371086 and not is_golden;
update t_question set stem = $qt$假设程序中已有相应的声明，以下语句中错误的选项是____。$qt$, option_json = $qt${"A":"printf(i==4?\"%6d\\n\":\"%6d\",i);","B":"i==4?printf(\"%6d\\n\",i):printf(\"%6d\",i);","C":"for(i=10;;i--)if(i==1)break;","D":"for(i=10;;if(i--);break;"}$qt$, analysis = $qt$D 中 for 语句 break 位置错误且循环结构不当，为错误的语句，故选 D。$qt$ where id = 371111 and not is_golden;
update t_question set stem = $qt$以下选项中，与 k=n++ 完全等价的表达式是（）。$qt$, option_json = $qt${"A":"k=n,n=n+1","B":"n=n+1,k=n","C":"k=++n","D":"k+=n+1"}$qt$, analysis = $qt$k = n, n = n + 1 与 k = n + + 完全等价的表达式。选项A正确。$qt$ where id = 371122 and not is_golden;
update t_question set stem = $qt$设有整数数列 a0, a1, a2, ..., an-1，给出求解最大值的递归程序。请补全代码。

MaxValue函数的功能就是返回数组中最大值。

例如:整数数列是12,44,1,5,8,99,23,20,33,76，返回结果是99

代码如下:

#include <stdio.h>

int MaxValue(int a[],int n){

int max;

if(n==0)

max = a[0];

else if(a[n]> MaxValue(a,n-1))

max = ______________;

else

max= ____

____ max ;

}

main(){

int aa[10] = { 12,44,1,5,8,99,23,20,33,76};

int max = MaxValue(aa,9);

printf("max = %d\notin",max);

 system("pause");$qt$, analysis = $qt$第一个空 a[n]；第二个空 MaxValue(a,n-1)（最后 return max）。$qt$ where id = 371191 and not is_golden;
update t_question set stem = $qt$若有以下程序:

main(){

int x,y,z;

\begin{array}{l} x = y = 1; \ z = x + +, y + +, + + y; \ \end{array}

 printf("%d,%d,%d\n",z,y,x);

}$qt$, option_json = $qt${"A": "3, 3, 2", "B": "1, 3, 2", "C": "2,3,1", "D": "2, 2, 1"}$qt$, analysis = $qt$执行 x=y=1, 即 x 的值是 1, y 的值也是 1。

然后执行 z = x + +, y + +, + +y；这是一个逗号表达式，分别是三个表达式构成。z = x + +, y + + 和 + +y。

逗号表达式的执行顺序是从左向右依次执行。

z = x + + ，这时候 x + + ，变量在前，先 x 的1值赋值给 z ，然后 x = x + 1 = 2

然后再执行 y++，这时候 y 的值是 1 作为整个表达式 y++ 的值，然后 y = y + 1 = 2，

再执行++y，这时候 y = y + 1 = 2 + 1 = 3，3作为表达 y + + 的值，也作为整个逗号表达式的值。

输出 x,y,z 即为 2,3,1$qt$ where id = 371193 and not is_golden;
update t_question set stem = $qt$while(!x)中!x与下面的表这式（）等价。$qt$, option_json = $qt${"A":"x == 0","B":"x==1","C":"x!= 5","D":"x!= 0"}$qt$, analysis = $qt$while(!x) 中 !x 与 x==0 等价，故选 A。$qt$ where id = 371194 and not is_golden;
update t_question set stem = $qt$以下函数的功能是，通过键盘输入数据，为数组中的所有元素赋值。

#define N 10

void arrin(int x[N]){

int i = 0;

while(i<N)

scanf("%d",____);

}

在下画线处应该填入的是（）。$qt$, option_json = $qt${"A":"x + i","B":"&x[i+1]","C":"x + (i++)","D":"&x[++i]"}$qt$, analysis = $qt$为数组元素逐个读入并前进，应填 x+(i++)，故选 C。$qt$ where id = 371195 and not is_golden;
update t_question set stem = $qt$下列程序的输出结果是()。
#include <stdio.h>
main(){
 int i, a =0, b=0;
 for(i=1, i<10;i++){
 if(i%2==0){
 a++; continue;
 }
 b++;
 }
 printf("a=%d,b=%d",a,b);
}$qt$, option_json = $qt${"A":"a = 4, b = 4","B":"a = 4, b = 5","C":"a = 5, b = 4","D":"a = 5, b = 5"}$qt$, analysis = $qt$i 取 1~9：偶数（2、4、6、8）时 a++ 共 4 次，奇数（1、3、5、7、9）时 b++ 共 5 次，输出 a=4,b=5，故选 B。$qt$ where id = 371196 and not is_golden;
update t_question set stem = $qt$将字符 g 赋值给字符变量 ch，正确的表达式是（）$qt$, option_json = $qt${"A":"ch=\"g\"","B":"ch=103","C":"ch='\\g'","D":"ch='\\103'"}$qt$, analysis = $qt$将字符 g 赋给 ch：ch=103（'g' 的 ASCII 码），故选 B。$qt$ where id = 371198 and not is_golden;
update t_question set stem = $qt$已知有声明 “int a=3, b=4, c=5;”，以下表达式中值为 0 的是 ____。$qt$, option_json = $qt${"A":"a&&b","B":"a<b","C":"a||b&&c","D":"!(!c||1)"}$qt$, analysis = $qt$a=3、b=4、c=5：!(!c||1)=!(0||1)=0，其余三项均为 1，故选 D。$qt$ where id = 371203 and not is_golden;
update t_question set stem = $qt$关于语句 int x; scanf("%d", &x); if(x=0) printf("zero"); 下列说法正确的是 ( )。$qt$, option_json = $qt${"A":"只有当 x 的输入值为0时，才能显示zero","B":"只有当 x 的输入值非 0 时，才能显示 zero","C":"无论输入什么值，都不显示 zero","D":"无论输入什么值，都显示 zero"}$qt$, analysis = $qt$x=0 为赋值表达式、恒为假，无论输入什么值都不显示 zero，故选 C。$qt$ where id = 371204 and not is_golden;
update t_question set stem = $qt$设有“int t;”以及函数 fun 的定义形式为:

void fun(char ch,float x){printf("%d,%f",ch,x);},屏幕要显示 97,2.000000 则以下对函数 fun 的调用语句中，正确的形式是____。$qt$, option_json = $qt${"A":"fun(\"a\",2.0);","B":"t=fun('97',2);","C":"fun('a',2.0);","D":"t=fun(97.0,32);"}$qt$, analysis = $qt$fun('a',2.0) 中 ch='a'=97 按 %d 输出 97、x=2.0 按 %f 输出 2.000000，故选 C。$qt$ where id = 371207 and not is_golden;
update t_question set stem = $qt$若有定义语句：int x=10;，则表达式 x-=x+x 的值为 ____。

c$qt$, analysis = $qt$x-=x+x 相当于 x=x-(x+x)=-x=-10。$qt$ where id = 371219 and not is_golden;
update t_question set stem = $qt$有以下程序

# \text {include} 

# \text {include} 

\text {main} () {\text {int} a = 0, b = 0, c = 0;

c = (a + = + + b, b + = 4);

\text {printf} (" % d, % d, % d \backslash n", a, b, c);

}
则程序的输出结果是____。$qt$, analysis = $qt$逗号表达式：a=1,b=5,c=5；输出 1,5,5。$qt$ where id = 371231 and not is_golden;
update t_question set stem = $qt$以下程序拟实现计算 s = 1 + 2 * 2 + 3 * 3 + ·s + n * n + ·s，直到 s > 1000 为止。

#include <stdio.h>
main(){ int s,n;
 s=1;
 n=1;
 do

{n=n+1; s=s+n*n;}
while(s>1000);
printf("s=%d\n",s);
}$qt$, analysis = $qt$do {循环体} While(表达式)，当表达式为真时,执行循环体，题目要求s>1000为止，而现有程序是当s>1000时才执行循环体，故需要把s>1000改为s<=1000。$qt$ where id = 371240 and not is_golden;
update t_question set stem = $qt$下面程序的功能是实现表达式 z = (x >= y ? x : y)，请将程序填写完整。

c
include"stdio.h"
main( ){
 int x, y, z;
 printf("Please input x,y:");
 scanf("%d%d",&x,&y);
 if (__________) z=x;
 else z=y;
 printf("z=%d",z);

}$qt$, analysis = $qt$填x >= y或者y<=x ---$qt$ where id = 371248 and not is_golden;
update t_question set stem = $qt$(\pi)/(4) = 1 - (1)/(3) +(1)/(5) -(1)/(7) +... +\frac{-1^{n - 1}}{2n - 1} ，求 \pi 。第 n 项值的绝对值 
#include 
void main(){

double sum=0,pi,c=1,s=1;//c 为当前项,s 为符号位

c
int n=1;
while(__________ >= 1e-6) {
 sum += c;
 s=__________;
 n++;
 c=__________;
}
pi=4*sum;
printf("pi=%lf\n",pi);$qt$, analysis = $qt$fabs(c)；-s；s/(2*n-1)。$qt$ where id = 371256 and not is_golden;
update t_question set stem = $qt$将字符 g 赋值给字符变量 ch，正确的表达式是（）$qt$, option_json = $qt${"A":"ch=\"g\"","B":"ch=103","C":"ch=\\g'","D":"ch=105"}$qt$, analysis = $qt$ch=103 即把 ASCII 码 103 对应的字符 g 赋给字符变量，故选 B。$qt$ where id = 371267 and not is_golden;
update t_question set stem = $qt$对于以下程序:

#include<stdio.h>

int main(){

\text {int} a = 2;

\text {int} b = a + 2

\operatorname{printf} (% d ^ {\prime \prime}, b);

\text {return} 0;

}

则输出结果是:$qt$, option_json = $qt${"A": "4", "B": "%d", "C": "a+2"}$qt$, analysis = $qt$（AI 补答）b=a+2=4，printf("%d",b) 输出 4，故选 A。$qt$ where id = 371268 and not is_golden;
update t_question set stem = $qt$有下列程序，执行后的输出结果是（）

fun(int x, int y){return (x+y);}

main(){

int a = 1, b = 2, c = 3, sum:

sum=fun((a++, b++, a+b), c++ );

printf("%d \n", sum);$qt$, analysis = $qt$fun( (a++, b++, a+b), c++ );

= fun((2,3,2 + 3),3)

=fun(5,3)

= 5 + 3

=8$qt$ where id = 371271 and not is_golden;
update t_question set stem = $qt$设有定义:int x-2；，以下表达式中，值不为 6 的是 0。$qt$, option_json = $qt${"A":"2^{*}x, x+ = 2","B":"x++, 2^{*}x"}$qt$, analysis = $qt$(2*x, x+=2) 逗号表达式取 x+=2 的值 4（x 初值 2），不为 6，故选 A。$qt$ where id = 371287 and not is_golden;
update t_question set stem = $qt$有以下程序

main(){ int a,b,d=25;
 a=d/10%9;
 b=a&&(-1);
 printf("%d,%d\n",a,b);
}

程序运行后的输出结果是____。

6、若有以下程序段:

\text {int} i = 1, j = 1, k = 2;$qt$, analysis = $qt$输出 2,1。$qt$ where id = 371306 and not is_golden;
update t_question set stem = $qt$下面程序的功能是实现表达式 z = (x >= y ? x : y)，请将程序填写完整。

include"stdio.h"
main( ){
 int x, y, z;
 printf("Please input x,y:");
 scanf("%d%d",&x,&y);
 if (__________) z=x;
 else z=y;
 printf("z=%d",z);
}$qt$, analysis = $qt$填x >= y或者y<=x ---$qt$ where id = 371324 and not is_golden;
update t_question set stem = $qt$表达式‘123’+‘456’的结果是（）。$qt$, option_json = $qt${"A":"'579'","B":"579","C":"'123456'","D":"'123'"}$qt$, analysis = $qt$字符常量 '123' 与 '456' 相加，结果为 579，故选 B。$qt$ where id = 371326 and not is_golden;
update t_question set stem = $qt$有以下程序

# \text {include} \ # \text {include} \ \text {main} () {\text {int} a = 0, b = 0, c = 0; \ c = (a + = + + b, b + = 4); \ \text {printf} (" % d, % d, % d \backslash n", a, b, c); \ \end{array}

}
则程序的输出结果是____。$qt$, analysis = $qt$逗号表达式输出 1,5,5。$qt$ where id = 371327 and not is_golden;
update t_question set stem = $qt$写出下列程序的运行结果。

c
#include 
void main() {
 int a=5,b=4,c=3,d=2;
 if(a>b>c)
 printf( "%d\n" ,d);
 else if((c-1>=d)==1)
 printf( "%d\n" ,d+1);
 else
 printf( "%d\n" ,d+2);
}

程序执行后的输出结果是:____。

seal

闫
TONGFANG$qt$, analysis = $qt$a>b 为 1，1>c 为 0→跳；c-1>=d 即 2>=2 真==1→输出 d+1=3。$qt$ where id = 371330 and not is_golden;
update t_question set stem = $qt$以下叙述正确的是（）$qt$, option_json = $qt${"A":"C 语言程序是由过程和函数组成的","B":"C 语言函数可以嵌套调用, 例如: fun(fun(x))","C":"C 语言函数不可以单独编译","D":"C 语言中除了 main 函数, 其他函数不可作为单独文件形式存在\n\n解析:C程序由函数构成"}$qt$, analysis = $qt$C 语言函数可以嵌套调用（如 fun(fun(x))），B 叙述正确，故选 B。$qt$ where id = 371332 and not is_golden;
update t_question set stem = $qt$以下选项中能表示合法常量的是（）$qt$, option_json = $qt${"A":"整数:1,200","B":"实数:1.5E2.0","C":"字符斜杠:'\\\\'","D":"字符串:“\\007”"}$qt$, analysis = $qt$表示整常量不能用逗号分隔，A项错误；实型常量的指数形式E后必为整数，故B项错误；'007'是转义字符，只能用单引号括起来，不能用双引号或其他括号，故D项错误。字符只能用单引号表示，不能使用双引号$qt$ where id = 371337 and not is_golden;
update t_question set stem = $qt$以下选项中不能用作 C 程序合法常量的是（）$qt$, option_json = $qt${"A":"1,234","B":"\\123'","D":"\"\\x7G\""}$qt$, analysis = $qt$A 中的', '在编译时会出错的, 直接写成 1234 即可, B 是一个三位八进制数代表的字符, C 是一个数字常量, D 是一个字符串, 其中 \x7 是一个一位十六进制数代表的字符, 也即 D 中的字符串是两个字符, 如果 sizeof 的话是 3, 因为字符串最后有一个 /0 作为结束标记, 如果 strlen 的话是 2。$qt$ where id = 371338 and not is_golden;
update t_question set stem = $qt$有以下程序

#include <stdio.h>

main()

{char c1,c2;

c1='A'+'8'-'4';

c2='A'+'8'-'5';

printf("%c,%d\n",c1,c2);

}

seal

BAI COMPUTER
综合设计系统

已知字母 A 的 ASCII 码为 65，程序运行后的输出结果是（）$qt$, option_json = $qt${"A": "E,68", "B": "D,69", "C": "E,D", "D": "输出无定值"}$qt$, analysis = $qt$'A'的 ASCII 码值为 65，'8'的 ASCII 码值为 56，'4'的 ASCII 码值为 52,65+56-52=69，对应于字符'E'。'5'的 ASCII 码值为 53,65+56-53=68，对应于字符'D'。字符变量 c1 以%c 格式输出，即'E'。字符变量 c2 以%d 格式输出，即 68。故答案是 A。

## 8.知识点:进制转换$qt$ where id = 371340 and not is_golden;
update t_question set stem = $qt$设有定义: int x=2; 以下表达式中, 值不为 6 的是 ( )$qt$, option_json = $qt${"A":"x* = x + 1","B":"x++, 2*x","C":"x^{*} = (1 + x)","D":"2 * x, x += 2"}$qt$, analysis = $qt$A 项 x = x*(x + 1) = 2*(2 + 1) = 6; B 项 x++ 后, x 的值为 3,2*x 的值为 6 , 整个逗号表达式的值为 6 ; C 项 x = x*(1+x) = 2*3 = 6; D 项 x = x + 2 = 2 + 2 = 4, 整个逗号表达式的值为 4 。故答案是 D 。

## 13.知识点:自增自减运算符

++i i 自加 1 后再参与运算

i++ i 参与运算后再自加 1

--i i 自减 1 后再参与运算

i-- i 参与运算后再自减 1

++和--的运算对象只能为变量，不能是常量或表达式。$qt$ where id = 371342 and not is_golden;
update t_question set stem = $qt$有以下程序

c
#include

main( )

{ int x=011;

 printf("%d\n",++x);

}

程序运行后的输出结果是（）$qt$, option_json = $qt${"A": "12", "B": "11", "C": "10", "D": "9"}$qt$, analysis = $qt$011 是一个八进制的数，转为十进制则为 1*8+1=9；++x 是 x 先自增 1 再参与其他运算，所以先 x 自增 1 为 10 再输出即为 10，故选 C。

## 14.知识点:赋值表达式

- 一般形式:变量名=表达式
- 赋值运算符左边必须是变量，而不是表达式。$qt$ where id = 371343 and not is_golden;
update t_question set stem = $qt$若有定义语句:int a = 3, b = 2, c = 1，以下选项中错误的赋值表达式是（）$qt$, option_json = $qt${"A": "a=(b=4)=3;", "B": "a=b=c+1;", "C": "a=(b=4)+c;", "D": "a=1+(b=c=4);"}$qt$, analysis = $qt$赋值表达式的左边必须是变量不能是表达式。而答案 A 中， (b=4) 是一个赋值表达式。

复合赋值运算符和表达式

+ = 、 - = 、 * = 、 / = 、 % = 、 > = 、 & = 、 ^ = 、 | =$qt$ where id = 371345 and not is_golden;
update t_question set stem = $qt$表达式 a + = a - = a = 9 的值是（）$qt$, option_json = $qt${"A": "9", "B": "-9", "C": "18", "D": "0"}$qt$, analysis = $qt$赋值运算符的结合性是从右到左，a = 9 → a = a - 9 = 0 → a = a + 0 = 0 + 0 = 0。故答案是 D。

## 15.知识点:位运算

- 按位与运算&

规则: 0& 0 = 0 0& 1 = 0 1& 0 = 0 1& 1 = 1

- 按位或运算

规则: 0\mid 0 = 0 0\mid 1 = 1 1\mid 0 = 1 1\mid 1 = 1

- 按位异或运算^

规则: 0 \wedge 0 = 0 0 \wedge 1 = 1 1 \wedge 0 = 1 1 \wedge 1 = 0

- 求反运算~

规则:~ 0 = 1 ~ 1 = 0

- 左移运算
seal

BII COMPUTER
良实计算机

若要使程序的运行结果为 248，应在下划线处填入的是

A) >>2 B) | 248 C) &0248 D) >

把>>左边的运算数的各二进位全部右移若干位。高位补 0，低位丢弃。右移一位相当于该数除以 2。右移 n 位相当于除以 2^{n} 。$qt$ where id = 371346 and not is_golden;
update t_question set stem = $qt$有以下程序

main()

{int m,n,p;

scanf("m=%dn=%dp=%d",&m,&n,&p);

printf("%d%d%d\n",m,n,p);

}若想从键盘上输入数据, 使变量 m 中的值为 123, n 中的值为 456, p 中的值为 789, 则正确的输入是 ( )$qt$, option_json = $qt${"A": "m=123n=456p=789", "B": "m=123 n=456 p=789", "C": "m=123,n=456,p=789", "D": "123 456 789"}$qt$, analysis = $qt$scanf("m=%dn=%dp=%d",&m,&n,&p); 格式控制字符串中有非格式字符串, 则按原样输入, 故答案是 A。$qt$ where id = 371348 and not is_golden;
update t_question set stem = $qt$有以下程序

#include <stdio.h>

main()

{int a1,a2; char c1,c2;

scanf("%d%c%d%c",&a1,&c1,&a2;&c2);

printf("%d,%c,%d,%c",a1,c1,a2,c2);

}

seal

BAI COMPUTER
武汉大成汽车

若想通过键盘输入, 使得 a1 的值为 12, a2 的值为 34, c1 的值为字符 a, c2 的值为字符 b, 程序输出结果是: 12, a, 34, b 则正确的输入格式是 ( ) (以下_代表空格, <CR>代表回车)$qt$, option_json = $qt${"A":"12a34b<CR>","B":"12_a_34_b<CR>","C":"12,a,34,b<CR>","D":"12_a34_b<CR>"}$qt$, analysis = $qt$空格会被当作字符赋值给变量，故 B、D 错误；C 项中逗号会被当作字符赋值给变量，故 C 项错误。$qt$ where id = 371350 and not is_golden;
update t_question set stem = $qt$若有定义语句:double x,y,*px,*py；执行了 px=&x；py=&y；之后，正确的输入语句是（）$qt$, option_json = $qt${"A":"scanf(\"%f%f\",x,y);","B":"scanf(\"%f%f\",&x,&y);","C":"scanf(\"%lf%le\",px,py);","D":"scanf(\"%lf%lf\",x,y);"}$qt$, analysis = $qt$A、D 项地址列表，应为&x,&y；x、y 为 double 型，格式控制字符串不是%f%f，故 B 项错误。当定义的变量类型和 scanf 中“格式符”类型不一致时（这里只限定在字符型和整型两种类型，其他数据类型不可以。）整型和字符型之间通过 ASCII 可以相互转化。$qt$ where id = 371351 and not is_golden;
update t_question set stem = $qt$有以下程序 (说明:字符0的ASCII码值为48)

main( )

{ char c1,c2;

scanf("%d",&c1);

c2=c1+9;

printf("%c%c\n",c1,c2);

}

seal

富安达计算机

若程序运行时从键盘输入 48, 则输出结果为 ( ).。$qt$, analysis = $qt$输入 48，则 c1=48，c2=48+9，以字符输出 c1 和 c2，则为输出 ASCII 码为 48 和 57 对应的字符，分别为 0 和 9。

## 20.知识点:字符输出函数 putchar()

一般形式:putchar('a'); putchar('\101');

## 21.知识点:字符输入函数 getchar()

一般形式:getchar(); 或 ch=getchar();$qt$ where id = 371352 and not is_golden;
update t_question set stem = $qt$设有定义: int a=1, b=2, c=3; 以下语句中执行效果与其它三个不同的是 ( )$qt$, option_json = $qt${"A": "if (a > b) c = a, a = b, b = c;", "B": "if (a > b) { c = a, a = b, b = c; }", "C": "if (a > b) c = a; a = b; b = c;", "D": "if (a > b) { c = a; a = b; b = c; }"}$qt$, analysis = $qt$对于单个 if 语句，其后跟随的受 if 控制的只能是 1 个语句或者是 1 个复合语句。故 C 项，if(a > b) 条件成立时，语句 c = a; 才被执行，而无论 if(a > b) 条件成立与否，语句 a = b; b = c; 都会被执行。A、B、D 项，只有 if(a > b) 条件成立时，语句 c = a; a = b; b = c; 才被执行。$qt$ where id = 371356 and not is_golden;
update t_question set stem = $qt$以下程序段中, 与语句: k = a > b? (b > c? 1: 0): 0; 功能相同的是 ( )$qt$, option_json = $qt${"A":"if((a>b)&&(b>c)) k=1;else k=0;","B":"if((a>b)||(b>c)) k=1;else k=0;","C":"if(a<=b) k=0; else if(b<=c) k=1; else k=0;","D":"if(a>b) k=1; else if(b>c) k=1; else k=0;"}$qt$, analysis = $qt$条件运算符的结合性是从右至左。当 b>c 时，b>c?1:0 的值为 1，k=a>b?1:0，同时当 a>b 时，a>b?1:0 的值为 1，此时 k=1。否则 k=0。故答案为 A。

## 4.知识点:switch 语句

- switch 语句的圆括号中的表达式的值必须是整型或字符型，不能为实型。
case 后的表达式可以是求得整型和字符型的常量表达式，但不能含有变量。
- default 的位置对程序的执行没有影响。$qt$ where id = 371357 and not is_golden;
update t_question set stem = $qt$若有定义语句 int a,b;double x;则下列选项中没有错误是（）

txt$qt$, option_json = $qt${"A":"switch(x%2)\n{case 0:a++;break;\ncase 1:b++;break;\ndefault:a++;b++;\n}","C":"switch((int)x%2)\n{case 0:a++;break;\ncase 1:b++;break;\ndefault:a++;b++;\n}","B":"switch((int)x%2.0)\n{case 0:a++;break;\ncase 1:b++;break;\ndefault:a++;b++;\n}","D":"switch((int)(x)%2)\n{case 0.0:a++;break;\ncase 1.0:b++;break;\ndefault:a++;b++;"}$qt$, analysis = $qt$switch 语句的圆括号中的表达式的值必须是整型或字符型，不能为实型。x 是 double 型，x%2 不合法，A 项错误。(int)x%2.0 不合法，B 项错误。(int)x%2 值为整型，故 C 项正确。case 后面的表达式可以是求得整型量和字符型量的常量表达式，故 D 项错误。$qt$ where id = 371358 and not is_golden;
update t_question set stem = $qt$若有定义语句: int m[ ] = {5,4,3,2,1}, i = 4; 则下面对 m 数组元素的引用中错误的是 ( )$qt$, option_json = $qt${"A": "m[--i]", "B": "m[2*2]", "C": "m[m[0]]", "D": "m[m[i]]"}$qt$, analysis = $qt$m 数组元素的引用的下限为 0，上限为 4。i=4，--i 的值为 3，A 项正确。B 项没有越界，正确。

m[0]=5 ，超过上限，已经越界，故 C 项错误。 m[4]=1 ，没有越界，故 D 项正确。$qt$ where id = 371368 and not is_golden;
update t_question set stem = $qt$以下选项中正确的语句组是（）

javascript$qt$, option_json = $qt${"A":"char s[];s=\"BOOK!\";","B":"char *s;s={\"BOOK!\"};","C":"char s[10];s=\"BOOK!\";","D":"char *s;s=\"BOOK!\";"}$qt$, analysis = $qt$字符数组名是地址常量，不能赋值给数组名，故 A、C 项错误，D 项指针 s 是个变量，将字符串常量赋值给 s，是正确的。B 项中给 s 赋值时不能用花括号将字符串串括起来。$qt$ where id = 371371 and not is_golden;
update t_question set stem = $qt$有以下程序

c
#include 
void fun(char *c,int d)
{ *c=*c+1; d=d+1;
 printf("%c,%c",*c,d);
}
main()
{ char b='a', a='A';
 fun(&b,a);
 printf("%c,%c\n",b,a);

} 程序运行后的输出结果是（）$qt$, option_json = $qt${"A":"b,B,b,A","B":"b,B,B,A","C":"a,B,B,a","D":"a,B,a,B\n\nseal\n\n西安众计计算机"}$qt$, analysis = $qt$fun(&b,a)：*c 使 b 由 'a' 变 'b'、形参 d 增 1 不影响实参 a；输出 b,B,b,A，故选 A。$qt$ where id = 371385 and not is_golden;
update t_question set stem = $qt$有以下程序

txt
int funl(double a){return a*=a; }

 int fun2(double x, double y)
 {double a=0, b=0;
 a=funl(x); b=funl(y); return (int)(a+b);
}
main()

txt
{double w; w=fun2(1.1,2.0);……}

程序执行后变量 w 中的值是$qt$, option_json = $qt${"A": "5.21", "C": "5.0", "D": "0.0"}$qt$, analysis = $qt$此题考查函数的嵌套调用。main 函数中调用了 fun2 函数；fun2 函数中又调用了如 fun1 函数 w = fun2(1.1, 2.0) → w = (int)(funl(1.1) + funl(2.0)) → w = (int)5.21; w 值为 5，但是 w 是 double 类型变量，故将 5 转换成 5.0 赋值给变量 w$qt$ where id = 371388 and not is_golden;
update t_question set stem = $qt$有以下程序

#include <stdio.h>

int f(int t□, int n);

main()

{ int a[4]={1,2,3,4},s;

s=f(a,4); printf("%d\n",s);

}

int f(int t[],int n)

{ if(n>0) return t=[n-1]+f(t,n-1);

else return 0;

}程序运行后的输出结果是（）$qt$, analysis = $qt$s=f(a,4)=t[3]+f(a,3)=4+f(a,3)=4+t[2]+f(a,2)=4+3+f(a,2)=7+t[1]+f(a,1)

= 7 + 2 + f (a, 1) = 9 + t [ 0 ] + f (a, 0) = 9 + 1 + f (a, 0) = 1 0 + 0 = 1 0

 

seal

BAI COMPUTER
武汉设计系统$qt$ where id = 371391 and not is_golden;
update t_question set stem = $qt$若有代数式 \sqrt{|n^{x} + e^{x}|} (其中 e 仅代表自然对数的底数, 不是变量), 则以下能够正确表示该代数式的 C 语言表达式是 ( )$qt$, option_json = $qt${"A": "sqrt(abs(n^x + e^x))", "B": "sqrt(fbs(pow(n,x) + pow(x,e)))", "C": "sqrt(fabs(pow(n,x) + exp(x,e)))", "D": "sqrt(fabs(pow(x,n) + exp(x)))"}$qt$, analysis = $qt$表示n^x须用pow(n,x)，e^x用exp(x)，绝对值用fabs，平方根用sqrt。D项pow(x,n)计算的是x^n，与代数式不符；A用abs、B用fbs均非浮点库函数，故源答案C正确。$qt$ where id = 371394 and not is_golden;
update t_question set stem = $qt$下列运算符中优先级最高的是（ ）。$qt$, option_json = $qt${"A":"!","B":"%","C":"=","D":"&&"}$qt$, analysis = $qt$按题源选 A（优先级最高运算符）。$qt$ where id = 371443 and not is_golden;
update t_question set stem = $qt$下列定义变量的语句错误的是( )$qt$, option_json = $qt${"A":"int _int;","B":"double int_;","C":"char For;","D":"float US\\;"}$qt$, analysis = $qt$float US; 含非法字符 ，语句错误（_int、int_、For 均合法），故选 D。$qt$ where id = 371494 and not is_golden;
update t_question set stem = $qt$表达式 3.5 + 1 / 2 + 56% 10 的计算结果是——$qt$, analysis = $qt$3.5+1/2+56%10=3.5+0+6=9.5。$qt$ where id = 371495 and not is_golden;
update t_question set stem = $qt$下面程序的输出结果为（）

#main<math,h>

Main()

{ int a=1,b=4,c=2;

Float x=10.5,y=4.0,z;

Z=(a+b)/c+sqrt((double)y)*1.2/c+x;

Printf("%f\n",z);

}$qt$, option_json = $qt${"A": "14.0000", "B": "15.40000", "C": "13.70000", "D": "14.90000"}$qt$, analysis = $qt$(1+4)/2=2；sqrt(4.0)×1.2/2=1.2；z=2+1.2+10.5=13.7，输出 13.70000，故选 C。$qt$ where id = 371497 and not is_golden;
update t_question set stem = $qt$若 a=3,b=2,c=1 则关系表达式" (a>b)==c 的值为"真"。 （ ）$qt$, analysis = $qt$a>b 得 1，1==c（1==1）为真，表达式的值为真，故该说法正确。$qt$ where id = 371578 and not is_golden;
update t_question set stem = $qt$表达式 (j = 3, j++) 的值是 4.$qt$, analysis = $qt$逗号表达式 (j=3, j++) 取末项 j++ 的值 3（j 自增为 4），值为 3 不是 4，故该说法错误。$qt$ where id = 371582 and not is_golden;
update t_question set stem = $qt$(资料题，6分)

【综合题】

下列程序是把给出的 unsigned int 型数据转换成逆序的字符串。

c
#include 
#include 
void convert(char *a, unsigned int n){
 int i;
 if((i=____【第1空】____)l=0)
 convert(a+1,i);
 __【第2空】_;
}
main(void){
 unsigned int number;
 char str[10]=(0);
 scanf("%u",&number);
 __【第3空】__;
 puts(str);
 system("pause");
}$qt$, analysis = $qt$逆序转换：第一空 n/10（取商继续递归）；第二空 *a = n%10 + '0'（写入末位字符）；第三空 convert(str, number)（调用函数）。库答仅给出第 1 空。$qt$ where id = 371597 and not is_golden;
update t_question set stem = $qt$执行“int x=2，y=3；”后，表达式 x=y++==++x 的值是0。$qt$, analysis = $qt$B：y++==++x为1（3==3），值应为1。$qt$ where id = 371606 and not is_golden;
update t_question set stem = $qt$若 x 为整型变量，j 为实型变量，当执行语句: x = (int)j ; 后，j 也变为整型变量。$qt$, analysis = $qt$(int)j 只是用转换后的值参与运算，j 本身的类型仍是实型，故该说法错误。$qt$ where id = 371621 and not is_golden;
update t_question set stem = $qt$先用语句定义字符型变量 c，然后要将字符 'a' 赋给 c，则下列语句中正确的是（）$qt$, option_json = $qt${"A":"c = 'a'","B":"c=\"a\";","C":"C=\"97\";","D":"C='97';"}$qt$, analysis = $qt$c='a'; 正确。$qt$ where id = 371645 and not is_golden;
update t_question set stem = $qt$int a,b;float c,d;均以赋值，表达式 a + b / c + d；最后类型 float 型。$qt$, analysis = $qt$低类型向高类型转，题中最高类型为 float，也没有其他显式的强制转换，即最终结构
是 float。$qt$ where id = 371647 and not is_golden;
update t_question set stem = $qt$表达式 10% 2 + 10.0 / 2 ，结果是浮点型。$qt$, analysis = $qt$10%2=0（整型），10.0/2=5.0（浮点），相加结果为浮点型，故该说法正确。$qt$ where id = 371648 and not is_golden;
update t_question set stem = $qt$若有一维数组名为 b_{i} 则 *(b + i) 与 b[i] 等价。$qt$, analysis = $qt$A：*(b+i)与b[i]等价。$qt$ where id = 371663 and not is_golden;
update t_question set stem = $qt$以下程序段的输出结果是（）。

\text {char str} [ 1 5 ] = \text {"hello!"};

printf (" % d", \text {strlen} (str));$qt$, option_json = $qt${"A": "15", "B": "14", "C": "7", "D": "6"}$qt$, analysis = $qt$字符串 hello! 共 6 个字符，strlen 为 6，故选 D。$qt$ where id = 371679 and not is_golden;
update t_question set stem = $qt$以下程序段

x = - 1;

do

{

x = x ^ {*} x;

} \text {while} (! x)$qt$, option_json = $qt${"A": "是死循环", "B": "循环执行两次", "C": "循环执行一次", "D": "有语法错误"}$qt$, analysis = $qt$x=−1 先平方得 1，!1 为假循环结束，循环执行一次，故选 C。$qt$ where id = 371680 and not is_golden;
update t_question set stem = $qt$执行“int x=2，y=3；”后，表达式 x = y + + = + + x 的值是0。$qt$, analysis = $qt$B：表达式值应为1。$qt$ where id = 371695 and not is_golden;
update t_question set stem = $qt$先用语句定义字符型变量 c，然后要将字符 'a' 赋给 c，则下列语句中正确的是（）$qt$, option_json = $qt${"A":"c='a';","B":"c=\"a\";","C":"c=\"97\";","D":"C='97';"}$qt$, analysis = $qt$c='a'; 正确。$qt$ where id = 371733 and not is_golden;
update t_question set stem = $qt$下面（）表达式的值为4。$qt$, option_json = $qt${"A":"11 / 3","B":"11.0 / 3","C":"(float) 11 / 3","D":"(int)(11.0/3+0.5)"}$qt$, analysis = $qt$(int)(11.0/3+0.5)=(int)4.166…=4，其余表达式值为 3 或 3.x，故选 D。$qt$ where id = 371735 and not is_golden;
update t_question set stem = $qt$若 a 是 int 变量,则执行表达式 a=25/3%3 后,a 值是()$qt$, option_json = $qt${"A": "0", "B": "1", "C": "2", "D": "3"}$qt$, analysis = $qt$25/3=8，8%3=2。$qt$ where id = 371736 and not is_golden;
update t_question set stem = $qt$若有一维数组名为 b, 则 *(b+i) 与 b[i] 等价。$qt$, analysis = $qt$一维数组名 b 中 *(b+i) 与 b[i] 等价（都取第 i+1 个元素），故该说法正确。$qt$ where id = 371743 and not is_golden;
update t_question set stem = $qt$有以下程序:

c
#include 
main(){
 int a=0, b=1,c=-1;
 if(a) b++;
 else if(a==0) if(b==0)c++;
 else c++;
 printf("%d\n", ~c);
 system("pause");
 printf("\n");
}

则程序运行后输出的结果（）$qt$, analysis = $qt$（AI 补答）a=0 使 if(a) 不成立，a==0 成立而 b==0 不成立 → c++ 得 c=0，~c=-1。$qt$ where id = 371756 and not is_golden;
update t_question set stem = $qt$若 i = 3，则 printf("%d", -i++); 输出的值为 -4.$qt$, analysis = $qt$i=3 时 -i++ 先取值 3 输出 -3（i 后自增为 4），不是 -4，故该说法错误。$qt$ where id = 371759 and not is_golden;
update t_question set stem = $qt$若 a 是数值类型, 则逻辑表达式 (a == 1) \| (a != 1) 的值是 ( )$qt$, analysis = $qt$a 的值有两种情况:a 等于 1 或 a 不等于 1。故逻辑表达式 (a==1)\parallel(a!=1) 的值为 1。

## 18.知识点:格式输入函数 printf()$qt$ where id = 371768 and not is_golden;
update t_question set stem = $qt$a = (b = 4) + (c = 6) 是一个合法的赋值表达式.$qt$, analysis = $qt$A：a=(b=4)+(c=6)合法。$qt$ where id = 371770 and not is_golden;
update t_question set stem = $qt$设顺序循环队列 Q[0, M-1] 的头指针和尾指针分别为 F 和 R，头指针 F 总是指向队头元素的前一位，尾指 R 总是指向队尾元素的当前位置，则（）$qt$, option_json = $qt${"A":"队列的元素个数是(R-F+M)%M,","B":"入队操作是 F = (F + 1)% M","C":"队满条件是 (R + 1)% M == F","D":"队空条件是 F == R;"}$qt$, analysis = $qt$顺序循环队列：个数 (R-F+M)%M、队满 (R+1)%M==F、队空 F==R。$qt$ where id = 371799 and not is_golden;
update t_question set stem = $qt$由以下 while 构成的循环，循环体执行的次数是 f(·) 。

int i=0;

while(i=-1)i++;$qt$, option_json = $qt${"A": "有语法错，不能执行", "B": "一次也不执行", "C": "执行一次", "D": "无限次"}$qt$, analysis = $qt$while(i=−1)：赋值结果恒为 −1（非 0）恒真，循环体执行无限次，故选 D。$qt$ where id = 371816 and not is_golden;
update t_question set stem = $qt$若有以下程序段:

main() { int n = 24;

n = (6 * 4, n + 6), n * 2;

\text {printf} (\text {"%d\n", n});

}

此程序的输出结果是( )。$qt$, option_json = $qt${"A": "30", "B": "24", "C": "60", "D": "48"}$qt$, analysis = $qt$逗号表达式 n=(24,30)=30；n*2 不赋值。$qt$ where id = 371818 and not is_golden;
update t_question set stem = $qt$若定义 int m=7, n=12; 则能得到值为 3 的表达式是 ( )$qt$, option_json = $qt${"A":"n% = (m% = 5)","B":"n% = (n - n% 5)","C":"n%=m","D":"(n% = m)- (m% = 5)"}$qt$, analysis = $qt$(n%=7)-(m%=5)=5-2=3。$qt$ where id = 371820 and not is_golden;
update t_question set stem = $qt$已知 ch 是字符型变量,下面不正确的赋值语句是()$qt$, option_json = $qt${"A":"ch='a+b';","B":"ch='\\0';","C":"ch='7'+'9';","D":"ch=5+9;"}$qt$, analysis = $qt$'a+b' 为多字符常量，赋值给 ch 不正确（ch='\0'、'7'+'9'、5+9 均可行），故选 A。$qt$ where id = 371823 and not is_golden;
update t_question set stem = $qt$假设所有变量均为整型，则表达式 (a = 2, b = 5, b++, a + b) 的值是 ____。$qt$, option_json = $qt${"A": "7", "B": "8", "C": "6", "D": "2"}$qt$, analysis = $qt$b++ 后 b=6，a+b=8。$qt$ where id = 371827 and not is_golden;
update t_question set stem = $qt$以下对一维数组 a 的正确说明是（）$qt$, option_json = $qt${"A":"char a (10);","B":"int a[];","C":"int k=5, a[k];","D":"char a[3]={'a','b','c'};"}$qt$, analysis = $qt$char a[3]={'a','b',…} 合法。$qt$ where id = 371838 and not is_golden;
update t_question set stem = $qt$执行以下程序段后，变量a,b,c的值分别是（）

int x=10, y=9;

int a,b,c;

a = (- - x = = y + +)? - - x: + + y;

b = x + +;

c = y;$qt$, option_json = $qt${"A":"a = 9,b = 9,c = 9","B":"a=8,b=8,c=10","C":"a=9,b=10,c=9","D":"a=1,b=11,c=10"}$qt$, analysis = $qt$--x==y++ 真取 --x → a=8；b=x++=8。$qt$ where id = 371847 and not is_golden;
update t_question set stem = $qt$若 x,i, j 和 k 都是 int 型变量，则执行下面表达式后 x 的值为( ).

x = (i = 4, j = 1 6, k = 3 2)$qt$, option_json = $qt${"A": "4", "B": "16", "C": "32", "D": "52"}$qt$, analysis = $qt$逗号表达式取末值 32。$qt$ where id = 371849 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是()

txt
main ( ) {
int x=10,y=3,z;
 printf("%d\n",z=(x%y,x/y));
}

seal

福源县人民法院$qt$, option_json = $qt${"A": "1", "B": "0", "C": "4", "D": "3"}$qt$, analysis = $qt$(x%y,x/y) 取 x/y=3。$qt$ where id = 371851 and not is_golden;
update t_question set stem = $qt$以下有关 C 语言中 scanf 函数说法正确的是 ____。$qt$, option_json = $qt${"A":"输入项可以为一个实型常量，如 scanf (\"%f\", 6.7);","B":"只有格式控制，没有输入项，也能进行正确输入；如 scanf(\"a=%d, b=%d\");","C":"当输入一个实型数据时，格式控制部分应规定小数点后的位数，如 scanf (\"% 4.2f\", &f);","D":"当输入数据时，必须指明变量的地址，如 scanf(\"%f\", &f);"}$qt$, analysis = $qt$scanf 输入数据时必须指明变量地址，D 说法正确，故选 D。$qt$ where id = 371855 and not is_golden;
update t_question set stem = $qt$若变量已正确定义并赋值，下面符合C语言语法的表达式是（）$qt$, option_json = $qt${"A":"a:= b+1","B":"a = b = c + 2","C":"int 18.5%3","D":"a = a + 7 = c + b"}$qt$, analysis = $qt$a = b = c + 2 符合 C 语言语法（链式赋值），故选 B。$qt$ where id = 371866 and not is_golden;
update t_question set stem = $qt$判断一个数 n 是不是3的倍数一般可以用以下表达式()。$qt$, option_json = $qt${"A":"n>3","B":"n/3=0","C":"n!=3","D":"n%3==0"}$qt$, analysis = $qt$n%3==0 可判断 n 是否 3 的倍数，故选 D。$qt$ where id = 371867 and not is_golden;
update t_question set stem = $qt$设有 char str[10]，下列语句正确的是（）。$qt$, option_json = $qt${"A":"scanf(\"%is\",&str);","B":"printf(\"%o\",str);","C":"printf(\"%s\",str[0]);","D":"printf(\"%s\",str);"}$qt$, analysis = $qt$printf("%s",str); 正确。$qt$ where id = 371872 and not is_golden;
update t_question set stem = $qt$若 int x,y; double z;

以下不合法的 scanf 函数调用语句是____。$qt$, option_json = $qt${"A":"scanf(\"%d%lx,%le\",&x,&y,&z);","B":"scanf(\"%2d%d%lf\",&x,&y,&z);","C":"scanf(\"%x%*d%o\",&&,&y);","D":"scanf(\"%x%o%6.2f\", &x,&y,&z);"}$qt$, analysis = $qt$scanf 不能用 %6.2f（精度符非法）。$qt$ where id = 371873 and not is_golden;
update t_question set stem = $qt$一个程序中的算术表达式，如 X + Y - Z ，属于高级程序语言中的（）成分。$qt$, option_json = $qt${"A": "数据", "B": "运算", "C": "控制", "D": "传输"}$qt$, analysis = $qt$算术表达式属运算成分。$qt$ where id = 371884 and not is_golden;
update t_question set stem = $qt$程序段( )的功能是将变量 u、s 中的最大值赋给变量 t.$qt$, option_json = $qt${"A":"If(u>s)t=c:t=s;","B":"t=u;if(t>s)t=k;","C":"if(u>s)t=s;elset=u;","D":"t=s;if(u>t)t=u;"}$qt$, analysis = $qt$将 u、s 中的最大值赋给 t：t=s;if(u>t)t=u;，故选 D。$qt$ where id = 371892 and not is_golden;
update t_question set stem = $qt$#include<stdio.h>

| int main( ){ | } |
| --- | --- |
| inta,b; | printf("%d\\n",a); |
| for(a=1,b=1;a<=100;a++){ | } |
| if(b>=20)break; | 程序的输出结果是 ) |
| if(b%3==1){ |$qt$, option_json = $qt${"A":"10 |\n| b=b+3; |","B":"9 |\n| continue; |","C":"8 |\n| } |","D":"7 |\n| b=b-5; |  |"}$qt$, analysis = $qt$第一次进入程序时，a=1, b=1，满足 b%3 == 1，因此 b=4，并执行 continue 进入下一次循环；

第二次，a=2，b=4，满足 b%3 == 1，因此 b=7，并执行 continue 进入下一次循环。

以此类推，b 的值的变化为 7, 10, 13, 16, 19, 21，满足 b >= 20，break 退出循环，b 的值变化了 8 次，在 b 从 19 变化到 21 时，a++仍然运行，因此 a=8，选 C$qt$ where id = 371893 and not is_golden;
update t_question set stem = $qt$在c语言中，下列常量的写法正确的是（）。$qt$, option_json = $qt${"A":"①、-32767 ②、023f ③、0x123dfh","B":"①、123.46 ②、123. ③、.456 ④、0.456","C":"①、123.4E4 ②、5.4E0.5 ③、4E ④、1.23e-5 ⑤、3E2","D":"①、“abbchkdI” ②、“a” ③、“” ④、“'” ⑤、“\\n” ⑥、“'”"}$qt$, analysis = $qt$①123.46 ②123. ③.456 ④0.456 均为合法常量写法（其余组含非法常量），故选 B。$qt$ where id = 371896 and not is_golden;
update t_question set stem = $qt$若 char a[10];已定义，以下语句中不能从键盘上给 a 数组的所有元素赋值的语句是（）$qt$, option_json = $qt${"A":"gets(a);","B":"scanf(\"%s\",a);","C":"for(i=0;i<10;i++)a[i]=getchar();","D":"a=getchar();"}$qt$, analysis = $qt$a=getchar(); 只能读入一个字符，不能给字符数组所有元素赋值，故选 D。$qt$ where id = 371898 and not is_golden;
update t_question set stem = $qt$已知:int x, y; double z; 以下语句中错误的函数调用是 ()

|$qt$, option_json = $qt${"A":"scanf(\"%d,%lx,%le\",&x,&y,&z); |","B":"scanf(\"%2d+%d%lf\",&x,&y,&z); |\n| --- | --- |\n|","C":"scanf(\"%x%*d%o\",&x,&y); |","D":"scanf(\"%x%o%6.2f\",&x,&y,&z); |"}$qt$, analysis = $qt$scanf 的格式串中不能规定小数点位数（%6.2f），D 语句错误，故选 D。$qt$ where id = 371901 and not is_golden;
update t_question set stem = $qt$阅读下面的程序

| #include<stdio.h> | } |
| --- | --- |
| void main(){ | 则程序的运行结果是( )。 |
| int i,j; |$qt$, option_json = $qt${"A":"1,19 |\n| i=010; |","B":"-1,19 |\n| j=9; |","C":"1,17 |\n| printf(\"%d,%d\",i-j,i+j); |","D":"-1,17 |"}$qt$, analysis = $qt$i=010 即八进制 8：i−j=−1、i+j=17，输出 −1,17，故选 D。$qt$ where id = 371909 and not is_golden;
update t_question set stem = $qt$若有定义:char c; int d; 程序运行时输入:c=1, d=2 ，能把字符 1 输入给变量 c、整数 2 输入给变量 d 的输入语句是 { }。$qt$, option_json = $qt${"A":"scanf(\"c=%d d=%d\", &c,&d);","B":"scanf(\"c=%c d=%d\", &c,&d);","C":"scanf(\"c=%d d=%d\", &c,&d);","D":"scanf(\"c=%c,d=%d\", &c,&d);"}$qt$, analysis = $qt$输入 c=1,d=2 与格式串匹配：scanf("c=%c,d=%d",&c,&d);，故选 D。$qt$ where id = 371911 and not is_golden;
update t_question set stem = $qt$已知在函数 f 中声明了局部变量 x，如果希望 f 函数第一次被调用返回后变量 x 中存储的数据保持到下次 f 函数被调用时仍可以使用，则在声明 x 时必须指定其存储类型为____。$qt$, option_json = $qt${"A": "auto", "B": "register", "C": "static", "D": "extern"}$qt$, analysis = $qt$局部变量需保持到下次调用应声明为 static 存储类型，故选 C。$qt$ where id = 371920 and not is_golden;
update t_question set stem = $qt$下列循环语句中，能保证至少执行一次循环体的是（）$qt$, option_json = $qt${"A":"for(i=0;i<10;i++)","B":"do{i++:)while(i<10)","C":"while(i<10){i++;}","D":"以上都不是"}$qt$, analysis = $qt$do-while 语句可以保证至少执行一次循环体。$qt$ where id = 371921 and not is_golden;
update t_question set stem = $qt$下列描述中错误的是()$qt$, option_json = $qt${"A":"字符数组可以存放字符串","B":"字符数组的字符串可以整体输入输出","C":"可以在赋值语句中通过赋值运算符\"=\"对字符数组整体赋值","D":"不可以用关系运算符对字符数组的字符串进行比较"}$qt$, analysis = $qt$字符数组不能用 = 整体赋值。$qt$ where id = 371923 and not is_golden;
update t_question set stem = $qt$已知有声明“char s[80];”，假设需要将键盘输入的一个不含空格的字符串保存到s数组中，则以下语句中正确的选项是____。$qt$, option_json = $qt${"A":"scanf(\"%s\",s);","B":"scanf(\"%s\",s[0]);","C":"s=gets();","D":"s=getchar();"}$qt$, analysis = $qt$将不含空格的字符串保存到字符数组：scanf("%s",s);，故选 A。$qt$ where id = 371926 and not is_golden;
update t_question set stem = $qt$设 a 和 b 均为double型变量，且 a = 5.5, b = 2.5 ，则表达式(int) a + b / b 的值是（ ）$qt$, option_json = $qt${"A": "6.500000", "B": "6", "C": "5.500000", "D": "6.000000"}$qt$, analysis = $qt$(int)a+b/b=(int)5.5+2.5/2.5=5+1.0=6.0（输出 6.000000），故选 D。$qt$ where id = 371941 and not is_golden;
update t_question set stem = $qt$设a和b均为double型变量，且 a = 5.5 、 b = 2.5，则表达式（int） a + b / b 的值是（）$qt$, option_json = $qt${"A": "6.500000", "B": "6", "C": "5.500000", "D": "6.000000"}$qt$, analysis = $qt$(int)5.5+2.5/2.5=5+1.0=6.0，输出 6.000000，故选 D。$qt$ where id = 371944 and not is_golden;
update t_question set stem = $qt$已知 i、j、k 为 int 型变量，若从键盘输入:1, 2, 3，使 i 的值为 1、j 的值为 2、k 的值为 3，以下选项中正确的输入语句是（）$qt$, option_json = $qt${"A":"scanf( \"%2d%2d%2d\" ,&i,&j,&k);","B":"scanf( \"%d %d %d\" ,&i,&j,&k);","C":"scanf( \"%d,%d,%d\" ,&i,&j,&k);","D":"scanf(“i=%d, j=%d, k=%d”, &i, &j, &k);"}$qt$, analysis = $qt$输入 1,2,3 与含逗号的格式串匹配：scanf("%d,%d,%d",&i,&j,&k);，故选 C。$qt$ where id = 371945 and not is_golden;
update t_question set stem = $qt$若有以下程序:

main()

{\text {int} k = 2, i = 2, m; m = (k + = i * = k); \text {printf} (% d, % d \backslash n", m, i); }

执行后的输出结果是( )$qt$, option_json = $qt${"A": "8, 6", "B": "8, 3", "C": "6, 4", "D": "7, 4"}$qt$, analysis = $qt$i*=k 使 i=4，k+=i 使 k=6，输出 6,4，故选 C。$qt$ where id = 371946 and not is_golden;
update t_question set stem = $qt$已知有声明"int a=1, b=2, c=3,"以下表达式中值为 0 的是____$qt$, option_json = $qt${"A":"c<=b<=a","B":"a&&b","C":"a^b","D":"a&b"}$qt$, analysis = $qt$a&b=1&2=0。$qt$ where id = 371949 and not is_golden;
update t_question set stem = $qt$下列代码中循环一次都不执行的是

txt$qt$, option_json = $qt${"A":"unshort char x=0;\nwhile(--x>=0)\n{...}","B":"signed char x=0;\ndo{...}while(--x>=0);","C":"signed char x=1;\nwhile(--x){...}","D":"signed char x=0;\nfor(--x>=0;;){...}"}$qt$, analysis = $qt$signed char x=1; while(--x) 条件为 0 → 执行 0 次。$qt$ where id = 371950 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是（）。$qt$, option_json = $qt${"A":"输入项可以是一个实型常量,例如: \\operatorname{scanf}(% f^{\\prime},3.5) ;","B":"只有格式控制, 没有输入项, 也能正确输入数据到内存, 例如: \\operatorname{scanf}( {a = % d,b = % d})","C":"输入一个实型数据时, 格式控制部分可以规定小数点后的位数, 例如: scanf(\"%4.2f\", &d);","D":"当输入数据时, 必须指明变量地址。例如: scanf(\"%f\", &f);"}$qt$, analysis = $qt$scanf 输入数据时必须指明变量地址，D 叙述正确，故选 D。$qt$ where id = 371964 and not is_golden;
update t_question set stem = $qt$对于条件表达式(m)?(a+1):(a-)来说，其中的表达式m为真等价于（）。$qt$, option_json = $qt${"A":"m = 0","B":"m = 1","C":"m!=0","D":"m!=1"}$qt$, analysis = $qt$m 为真等价 m!=0。$qt$ where id = 371965 and not is_golden;
update t_question set stem = $qt$以下能够正确判断 char 型变量 c 是否为大写字母的表达式是（）。$qt$, option_json = $qt${"A":"('A '=c)","B":"('A '=c)","C":"\\langle A' = c}","D":"以上答案都不对"}$qt$, analysis = $qt$完整大写判断需双条件，A/B/C 均不完整。$qt$ where id = 371971 and not is_golden;
update t_question set stem = $qt$有如下程序:

lisp
main()
{
 int x=1,a=0,b=0;
 switch(x)
 {
 case 0: b++;
 case 1: a++;

A^{2}C=CC=Z ACZ

\begin{array}{l} \text {case 2:a++;b++;} \ \text {printf("a = %d,b = %d\n",a,b);} \end{array}

该程序的输出结果是（）。$qt$, option_json = $qt${"A":"a = 2, b = 1","B":"a = 1,b = 1","C":"a=1, b=0","D":"a = 2,b = 2"}$qt$, analysis = $qt$x=1：case 1 起顺序执行 a++→1，落入 case 2 再 a++、b++，输出 a=2,b=1，故选 A。$qt$ where id = 371972 and not is_golden;
update t_question set stem = $qt$以下能正确定义一维数组的选项是____。

\text {A) int} a [ 5 ] = {0, 1, 2, 3, 4, 5 };

\text {B) char a[] = {0,1,2,3,4,5};}$qt$, option_json = $qt${"A": "int a[5]={0,1,2,3,4,5};", "B": "char a[]={0,1,2,3,4,5};", "C": "char a={'A','B','C'};", "D": "int a[5]=\"0123\";"}$qt$, analysis = $qt$char a[]={0,1,2,3,4,5}; 由初值确定长度、定义合法（A 初值超界、C 缺方括号、D 类型不符），故选 B。$qt$ where id = 371977 and not is_golden;
update t_question set stem = $qt$以下不能正确计算代数式 ((\sin(0.5))^2)/(3) 值的 C 语言表达式是 ____。$qt$, option_json = $qt${"A":"1 / 3^{*}\\sin (1 / 2)^{*}\\sin (1 / 2)","B":"\\sin(0.5)*\\sin(0.5)/3","C":"pow(sin(0.5),2)/3","D":"1/3.0*pow(sin(1.0/2),2)"}$qt$, analysis = $qt$1/3 为整数除法得 0，A 整个式子恒为 0，不能正确计算 (sin0.5)²/3，故选 A。$qt$ where id = 371979 and not is_golden;
update t_question set stem = $qt$以下可用作用户自定义标识符的一组是$qt$, option_json = $qt${"A":"void、return、if","B":"printf、include、fabs","C":"Max、_abc、Main","D":"2abc、pay\\、sum-10"}$qt$, analysis = $qt$Max、_abc、Main 可用作用户自定义标识符（含关键字或非法字符的组不行），故选 C。$qt$ where id = 372009 and not is_golden;
update t_question set stem = $qt$设有定义:double d,h;，其中 d 为三角形的底边长，h 为三角形的高，则以下 C 语言表达式与其面积公式 dh 计算结果不相符的是$qt$, option_json = $qt${"A":"d^{*} h / 2","B":"1 / 2 ^ { * } \\mathrm { d ^ { * } h }","C":"\\mathrm{d^{*}h^{*}1/2}","D":"d/2 物"}$qt$, analysis = $qt$1/2 为整数除法得 0，B 表达式结果恒为 0，与 dh/2 不符，故选 B。$qt$ where id = 372011 and not is_golden;
update t_question set stem = $qt$下面输入语句中，正确的是 。$qt$, option_json = $qt${"A":"scanf(a=b=%d,&a,&b);","B":"scanf(%d,%d,&a,&b);","C":"scanf(%c,c);","D":"scanf(%d%d in, &f1,f2);"}$qt$, analysis = $qt$scanf("%d%d",&a,&b) 形式正确；其余缺引号或地址符。$qt$ where id = 372014 and not is_golden;
update t_question set stem = $qt$以下选项中，当 x 为大于 1 的奇数时，值为 0 的表达式$qt$, option_json = $qt${"A":"x^{0}/2 \\equiv 1","B":"x/2","C":"x%2!=0","D":"x%2==0"}$qt$, analysis = $qt$x 为大于 1 的奇数时 x%2==0 为假（值 0），故选 D。$qt$ where id = 372017 and not is_golden;
update t_question set stem = $qt$C 语言程序中必须有的函数是（）。$qt$, option_json = $qt${"A":"#include \"stdio.h\"","B":"main","C":"printf","D":"scanf"}$qt$, analysis = $qt$C 语言程序中必须有的函数是 main，故选 B。$qt$ where id = 372039 and not is_golden;
update t_question set stem = $qt$若用数组名作为函数的实参，传递给形参的是（ ）。$qt$, option_json = $qt${"A":"数组的首地址","B":"数组第一个元素的值\n\n## 复航四校","C":"数组中全部元素的值","D":"数组元素的个数"}$qt$, analysis = $qt$数组名作函数实参传递给形参的是数组的首地址，故选 A。$qt$ where id = 372048 and not is_golden;
update t_question set stem = $qt$以下函数调用语句中实参的个数是（）_{n}

func((e1,e2),(e3,e4,e5));$qt$, option_json = $qt${"B": "3", "A": "2", "D": "语法错误", "C": "5"}$qt$, analysis = $qt$逗号表达式合并实参：func((e1,e2),(e3,e4,e5)) 只有 2 个实参，故选 A。$qt$ where id = 372049 and not is_golden;
update t_question set stem = $qt$C 语言程序中必须有的函数是（）。

|$qt$, option_json = $qt${"A":"#include \"stdio.h\" |","B":"main |\n| --- | --- |\n|","C":"printf |","D":"scanf |"}$qt$, analysis = $qt$C语言严格区分大小写，因此大写字母和小写字母被认为是两个不同的字符。$qt$ where id = 372056 and not is_golden;
update t_question set stem = $qt$下列四组字符串中都可以用作C语言程序中的标识符的是（ A ）。$qt$, option_json = $qt${"A":"print  _3d   db8  aBc","B":"I\\am  one_half  start\\it  3pai","C":"str_1  Cpp  pow  while","D":"Pxq  My->book  line#  His.age 选项B中的“\\”，”\\” ，选项D中“>”，”#”，”.”，”-”不满足（1）；选项C中的while为关键字，不满足（3）"}$qt$, analysis = $qt$print、_3d、db8、aBc 均可用作标识符（其余组含 \、、# 等非法字符或关键字），故选 A。$qt$ where id = 372066 and not is_golden;
update t_question set stem = $qt$在C语言中对一维整型数组的正确定义为 ______。$qt$, option_json = $qt${"A":"int a(10);","B":"int n=10,a[n];","C":"int n;a[n];","D":"#define N 10\nint a[N];"}$qt$, analysis = $qt$一维整型数组正确定义：#define N 10 int a[N];，故选 D。$qt$ where id = 372071 and not is_golden;
update t_question set stem = $qt$#include <stdio.h>

int m=4;

int func(int x,int y)

{ int m=1;

return(x*y-m);

}

main()

{int a=2,b=3;

printf("%d\n",m);

printf("%d\n",func(a,b)/m);

}

运行结果为：

整型变量m在函数外定义，因此m为全局变量，其作用于范围为其定义位置开始，一直到整个程序结束。因此func与main函数都可以访问m

程序首先执行main函数

执行printf("%d\n",m); 即输出m中的值4，并换行。

执行printf("%d\n",func(a,b)/m);即输出表达式func(a,b)/m的值，为了计算该表达式，

需要调用函数func。此时main将a,b中的2和3值作为实参传递给func的x和y

程序开始转向执行func函数，此时func中的x为2，y为3

执行int m=1; 此句定义了一个局部变量m并赋值为1 。m的作用域为其所在的复合

语句，即func的函数体，因此在func的函数体重，有限访问局部变量m。

执行return(x*y-m); 即return（2*3-1） ;返回的是整数5.

func函数返回至main函数中的被调用处

main函数中func(a,b)的值为5，func(a,b)/m=5/4=1,注意，在main函数中访问的m为全局变量m，此时main函数无法访问func中的m，因为不在func中m的作用域。$qt$, analysis = $qt$先输出全局 m=4；func(2,3)=2*3-1=5，5/4=1；输出 4 与 1。$qt$ where id = 372099 and not is_golden;
update t_question set stem = $qt$# include 

main ( )

{ int x[ ] = {10, 20, 30, 40, 50 };

int *p ;

p=x;

printf ( “%d”, *(p+2 ) );

}

运行结果为：

首先定义一个整型数组x，x的长度为5;然后定义一个指针变量p;对p进行初始化，将数组x的地址赋给p。因此此时p中存放的数组x的首地址，即数组中第一个元素x[0]的地址。

然后执行printf语句，输出表达式*(p+2)的值。p+2表示以p当前指向的位置起始，之后第2个元素的地址，即a[2]的地址。*(p+2)则表示该地址内所存放的内容，即a[2]的值30,因此输出30$qt$, analysis = $qt$*(p+2)=30。$qt$ where id = 372104 and not is_golden;
update t_question set stem = $qt$设变量 a 是整型，f 是实型，i 是双精度型，则表达式 10 + 'a' + i * f 值的数据类型为（）$qt$, option_json = $qt${"A": "int", "B": "float", "C": "double", "D": "不确定"}$qt$, analysis = $qt$10+'a'+i*f 中含双精度型 i，结果类型为 double，故选 C。$qt$ where id = 372131 and not is_golden;
update t_question set stem = $qt$下列运算符中优先级最高的是（）$qt$, option_json = $qt${"A":"<","B":"+","C":"%","D":"!="}$qt$, analysis = $qt$%（乘除类）优先级最高（+、<、!= 依次降低），故选 C。$qt$ where id = 372136 and not is_golden;
update t_question set stem = $qt$下面运算符的优先级比较，正确的是（）$qt$, option_json = $qt${"A":"“!=” < “+” < “=” < “&&”","C":"“=” < “&&” < “!=” < “+”","B":"“&&” < “!=” < “+” < “=”","D":"“+” < “!=” < “=” < “&&”"}$qt$, analysis = $qt$优先级由低到高为 = < && < != < +，只有 C 的比较链完全正确，故选 C。$qt$ where id = 372140 and not is_golden;
update t_question set stem = $qt$是合法的用户自定义标识符的( )$qt$, option_json = $qt${"A":"ah-spks","B":"double","C":"<ctrl>","D":"_myapple"}$qt$, analysis = $qt$_myapple 是合法用户自定义标识符，故选 D。$qt$ where id = 372147 and not is_golden;
update t_question set stem = $qt$C 语言中计算 a3 的正确表达式是（ ）$qt$, option_json = $qt${"A":"\\mathbf { a } ^ { \\wedge 3 }","B":"\\mathbf { a } ^ { * * } 3","C":"\\mathbf { p o w } ( \\mathbf { a } , 3 )","D":"\\mathrm { p o w e r } ( \\mathrm { a } , \\mathrm { 3 } )"}$qt$, analysis = $qt$pow(a,3) 计算 a 的 3 次方。$qt$ where id = 372164 and not is_golden;
update t_question set stem = $qt$为表示关系 x>y>=z,则正确的 c 语言表达方式为（ ）。$qt$, option_json = $qt${"A":"(x>y>=z)","B":"(x>y)and(y>=z)","C":"(y<x)&&(y>=z)","D":"(x>y)&(y>z)"}$qt$, analysis = $qt$x>y>=z 应写为 (y<x)&&(y>=z)，故选 C。$qt$ where id = 372166 and not is_golden;
update t_question set stem = $qt$以下能正确定义一维数组的选项是 ( )$qt$, option_json = $qt${"A":"int a[5]={0,1,2,3,4,5};","B":"char a[]={0,1,2,3,4,5};","C":"char a={'A','B','C'};","D":"int a[5]=\"0123\";"}$qt$, analysis = $qt$数组的常量表达式中可以包括整型常量和符号常量，不能包括变量。也就是说，C 不允许对数组的大小作动态定义，即数组的大小不依赖于程序运行过程中变量的值，所以选项A 不正确。而选项 B 事先定义一个字符常量 N，所以可以在数组中作常量表达式，选项 B 正确。而选项 C 中不能用区间表示数组大小；在 D 中 N 虽然被赋为 100，但 N 仍然为变量，所以不对。$qt$ where id = 372178 and not is_golden;
update t_question set stem = $qt$设 char b[10]; 若从键盘输入字符串“spkaoshi” ，则正确的函数引用是( )$qt$, option_json = $qt${"A":"scanf(“%s”, &b);","B":"scanf(“%c”,&b[10]);","C":"gets(b);","D":"gets(b[10]);"}$qt$, analysis = $qt$char b[10] 从键盘输入字符串使用 gets(b);，故选 C。$qt$ where id = 372179 and not is_golden;
update t_question set stem = $qt$有如下程序

int a[10]={1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, *P=a;

则数值为9的表达式是$qt$, option_json = $qt${"A":"*P+9","B":"* (P+8)","C":"*P+=9","D":"P+8"}$qt$, analysis = $qt$*(P+8) 即 a[8]=9（a 数组第 9 个元素），故选 B。$qt$ where id = 372197 and not is_golden;
update t_question set stem = $qt$在C语言中，以下属于算术运算符的是（）$qt$, option_json = $qt${"A":"+=","B":"*=","C":"%","D":"&&"}$qt$, analysis = $qt$% 属于算术运算符（+=、*= 为赋值类、&& 为逻辑），故选 C。$qt$ where id = 372205 and not is_golden;
update t_question set stem = $qt$在C语言中， r = a% b 的等价计算公式是（）$qt$, option_json = $qt${"A":"r = a + (a / b)^{*}b","B":"r = a - (a / b)^{*}b","C":"r = b - (a / b)^{*}a","D":"r = b + (a / b)^{*}a"}$qt$, analysis = $qt$r=a%b 的等价公式为 r=a-(a/b)*b，故选 B。$qt$ where id = 372213 and not is_golden;
update t_question set stem = $qt$在C语言中，（）不属于逻辑运算符。$qt$, option_json = $qt${"A":"&&","B":"!=","C":"!","D":"||"}$qt$, analysis = $qt$!（逻辑非）属逻辑运算符，!= 是关系运算符，故选 B。$qt$ where id = 372218 and not is_golden;
update t_question set stem = $qt$在C语言中， a = 5,b = 5,c = 0;a! = b > c 的运算结果是（）$qt$, option_json = $qt${"A": "0", "B": "1", "C": "-1", "D": "-2"}$qt$, analysis = $qt$a!=b>c 即 5!=1（b>c 得 1），结果为 1（真），故选 B。$qt$ where id = 372221 and not is_golden;
update t_question set stem = $qt$在C语言中，设 a = 10,b = 1,c = 0 ，若有 c = (c& & b + + ,b + + ) 表达式，执行完之后，c的值是（）$qt$, option_json = $qt${"A": "0", "B": "1", "C": "2", "D": "3"}$qt$, analysis = $qt$c&&b++ 因 c=0 短路（b 不变），逗号表达式取 b++ 的值 1，c=1，故选 B。$qt$ where id = 372224 and not is_golden;
update t_question set stem = $qt$假设所有变量均为整型，则表达式（ a = 2,b = 5,a + + ,b + + ,a + b ）的值为（）$qt$, option_json = $qt${"A": "5", "B": "7", "C": "9", "D": "11"}$qt$, analysis = $qt$逗号表达式取 a+b：a、b 各自增后为 3、6，值为 9，故选 C。$qt$ where id = 372227 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是（）$qt$, option_json = $qt${"A": "do...while 语句构成的循环不能用其他语句构成的循环代替", "B": "do...while 语句构成的循环只能用break语句退出", "C": "用do...while语句构成循环时，当while后的表达式为非0时结束循环", "D": "用do...while语句构成循环时，当while后的表达式为0时结束循环"}$qt$, analysis = $qt$do-while 当 while 表达式为 0 时结束。$qt$ where id = 372229 and not is_golden;
update t_question set stem = $qt$在C语言中，当执行下列程序段时，（）。

x=-1;

do{

X=X^{*}X_{i}

}while(!x);$qt$, option_json = $qt${"A": "循环体执行一次", "B": "循环体执行两次", "C": "循环体执行无数次", "D": "系统将提示有语法错误"}$qt$, analysis = $qt$x=−1 平方得 1，!1 为假循环结束：循环体执行一次，故选 A。$qt$ where id = 372230 and not is_golden;
update t_question set stem = $qt$有以下程序

c
#include 
#include 
main()
{ char x[]="STRING";
 x[0]=0; x[1]="\0"; x[2]='0';
 printf("%d %d\n ",sizeof(x),strlen(x));
}

程序运行后的输出结果是____。$qt$, option_json = $qt${"A": "61", "B": "70", "C": "63", "D": "71"}$qt$, analysis = $qt$x[0]=0 使首字符为 '\0'：sizeof 为 7、strlen 为 0，输出 7 0，故选 B。$qt$ where id = 372231 and not is_golden;
update t_question set stem = $qt$C语言中，运算对象必须是整型的运算符是（）$qt$, option_json = $qt${"A":"%=","B":"/","C":"?:","D":">="}$qt$, analysis = $qt$%=（取余赋值）的运算对象必须为整型（/ 可浮点、?: 与 >= 不限），故选 A。$qt$ where id = 372233 and not is_golden;
update t_question set stem = $qt$C语言中，运算对象必须是整型的运算符是（）$qt$, option_json = $qt${"A":"% =","B":"/","C":"?:","D":">=="}$qt$, analysis = $qt$%= 的运算对象必须为整型，故选 A。$qt$ where id = 372236 and not is_golden;
update t_question set stem = $qt$fun函数的功能是, 通过键盘给x所指的整型数组的所有元素赋值, 在下列下画线应该填写的是( )
#include 
#define N 5
void fun(int x[N])
{
 int m;
 for(m =N-1; m>=0;m--) scanf("%d",_______);
}$qt$, option_json = $qt${"A":"&x[++m]","B":"&x[m+1]","C":"x+(m++)","D":"x+m"}$qt$, analysis = $qt$> **〔扫描核验补录 · 2026-09-28〕**
> 答案素材截图（第1题解析用 C 程序），md 的 text_image 已覆盖代码主体（其中 `for(m =N-1; m>=0;m--> scanf("%d",x+m);` 漏了右括号，图中实为 `for(m =N-1; m>=0;m--)  scanf("%d",x+m);`）。md 未收录图中右下调试窗口，补录：标题「E:\vs 2010 c project\test1\Debug\t...」（截断），内容「1 2 3 4 5」「5,4,3,2,1,请按任意键继续. .」（画面有「上善」水印）$qt$ where id = 372238 and not is_golden;
update t_question set stem = $qt$以下程序的功能是递归的方法计算学生的年龄，已知第一个学生的年龄最小，为10岁，第二个学生比第一个学生大两岁，以此类推，求第5个学生的年龄。

递归程序如下:

c
#include 
age(int n){
 int c;
 if(n==1) c =10;
 else c = ________;
 return (c);
}
main(){
 int n =5;
 printf("age:%d\n", ________;
}

txt$qt$, option_json = $qt${"A": "age(n-2); age(n-1)", "B": "age(n-1); age(n-1)", "C": "age(n-1)*2; age(n)", "D": "age(n-1)+2; age(n)"}$qt$, analysis = $qt$第 n 个学生年龄为第 n−1 个加 2：c=age(n-1)+2，故选 D。$qt$ where id = 372239 and not is_golden;
update t_question set stem = $qt$c
fun函数的功能是，通过键盘给x所指的整型数组的所有元素赋值，在下列下画线应该填写的是( )
#include 
#define N 5
void fun(int x[N])
{
 int m;
 for(m =N-1; m>=0;m--) scanf("%d",____________________);
}

txt$qt$, option_json = $qt${"A":"&x[++m]","B":"&x[m+1]","C":"x+(m++)","D":"x+m"}$qt$, analysis = $qt$m 已由 for 递减控制，循环体只需填地址 x+m（等价 &x[m]），故选 D。$qt$ where id = 372240 and not is_golden;
update t_question set stem = $qt$假定符号-、*、\分别代表减法、乘法和指数运算，且

1)三个运算符优先级顺序是:-最高，*其次，\最低；

2)运算符运算时为左结合。

请计算 3-2*4\1*2\3 的值（）。$qt$, option_json = $qt${"A": "4096", "B": "-61", "C": "64", "D": "2048"}$qt$, analysis = $qt$按 - 最高、* 次之、 最低左结合：3−2=1，1*4=4，4(1*2)3=(42)3=16³=4096，故选 A。$qt$ where id = 372246 and not is_golden;
update t_question set stem = $qt$下列可用于C语言用户标识符的一组是( )$qt$, option_json = $qt${"A":"abc\n\nvoid\n\n3C","B":"x_o\n\n_a12\n\nCAT","C":"case\n\n-fg\n\navg","D":"xxy\n\ngoto"}$qt$, analysis = $qt$x_o、_a12、CAT 可用作用户标识符（含关键字或非法字符的组不行），故选 B。$qt$ where id = 372250 and not is_golden;
update t_question set stem = $qt$有以下程序:

#include <stdio.h>

#include <string.h>

main(){

char x[]="STRING";

x[0]=0; x[1]=\'0'; x[2]='0';

 printf("%d %d\n ",sizeof(x),strlen(x));

}

程序运行后的输出结果是____。$qt$, option_json = $qt${"A": "6 1", "B": "7.0", "C": "6 3"}$qt$, analysis = $qt$x[0]=0 使 strlen 为 0、sizeof 为 7，输出 7 0，故选 B。$qt$ where id = 372252 and not is_golden;
update t_question set stem = $qt$fun 函数的功能是，通过键盘给 x 所指的整型数组的所有元素赋值，在下列下画线应该填写的是（）.#include <stdio.h>

#define N 5

void fun(int x[N]){

int m;

for(m =N-1; m>=0;m--) scanf("%d",____);

}$qt$, option_json = $qt${"A":"&x[++m]","B":"&x[m+1]","C":"x + (m++)","D":"x + m"}$qt$, analysis = $qt$m 已由 for 递减控制，应填 x+m（即 &x[m]），故选 D。$qt$ where id = 372253 and not is_golden;
update t_question set stem = $qt$以下函数的类型是 ()

fun c(doublex )

{ printf("%f\n",X*X );

}$qt$, option_json = $qt${"A":"与参数 x 的类型相同","B":"void 类型","C":"int 类型","D":"无法确定"}$qt$, analysis = $qt$函数未指定类型时隐含为 int 类型，故选 C。$qt$ where id = 372261 and not is_golden;
update t_question set stem = $qt$以下叙述不正确的是（）。$qt$, option_json = $qt${"A":"在 C 程序中，逗号运算符的优先级最低","B":"在 C 程序中，MAX 和 max 是两个不同的变量","C":"若 a 和 b 类型相同, 在计算了赋值表达式 a = b 后, b 中的值将放入 a 中, 而 b 中的值不变","D":"当从键盘输入数据时，对于整型变量只能输入整型数值，对于实型变量只能输入实型数值"}$qt$, analysis = $qt$整型变量也可输入实数（截取整数部分），实型可输整数。$qt$ where id = 372262 and not is_golden;
update t_question set stem = $qt$以下叙述正确的是（）。$qt$, option_json = $qt${"A":"在 C 程序中，每行只能写一条语句","B":"若 a 是实型变量，C 程序中允许赋值 a = 10 ，因此实型变量中允许存放整型数","C":"在 C 程序中，%是只能用于整数运算的运算符（字符型也可以）","D":"在 C 程序中，无论是整数还是实数，都能被准确无误地表示"}$qt$, analysis = $qt$% 既可用于整型也可用于字符型（按整数算）。$qt$ where id = 372263 and not is_golden;
update t_question set stem = $qt$设有说明:char w; int x; float y; double z; 则表达式 w * x + z - y 值的数据类型为（）。$qt$, option_json = $qt${"A": "float", "B": "char", "C": "int", "D": "double"}$qt$, analysis = $qt$w*x+z-y 中含 double 型 z，结果类型为 double，故选 D。$qt$ where id = 372264 and not is_golden;
update t_question set stem = $qt$设以下变量均为 int 类型，则值不等于 7 的表达式是（）。$qt$, option_json = $qt${"A":"(x = y = 6, x + y, x + 1)","B":"(x=y=6, x+y, y+1)","C":"(x = 6, x + 1, y = 6, x + y)","D":"(y = 6,y + 1,x = y,x + 1)"}$qt$, analysis = $qt$选项C (x = 6,x + 1,y = 6,x + y) = 12$qt$ where id = 372265 and not is_golden;
update t_question set stem = $qt$判断 char 型变量 ch 是否为大写字母的正确表达式是（）。$qt$, option_json = $qt${"A":"\"A\" <= ch <= 'Z'","B":"(ch>='A')&(ch<='Z')","C":"(ch>='A')&&(ch<='Z')","D":"('A'<= ch)AND('Z'>= ch)"}$qt$, analysis = $qt$判断 ch 为大写字母的正确表达式是 (ch>='A')&&(ch<='Z')，故选 C。$qt$ where id = 372266 and not is_golden;
update t_question set stem = $qt$以下程序的运行结果是 \tilde{0}。

main(){

int a,b,d=241;

a=d/100%9;

b=(-1)&&(-1);

printf("%d,%d",a,b);

}$qt$, option_json = $qt${"A": "6, 1", "B": "2, 1", "C": "6,0", "D": "2,0"}$qt$, analysis = $qt$a=d/100%9=2%9=2；b=(−1)&&(−1)=1，输出 2,1，故选 B。$qt$ where id = 372269 and not is_golden;
update t_question set stem = $qt$假定 a 为一个一维字符数组名, 则引用数组元素 a[k] 的正确形式为 ( ).$qt$, option_json = $qt${"A":"a + k","B":"a+k","C":"*(a+k)","D":"*a+k"}$qt$, analysis = $qt$a[k] 等价于 *(a+k)（a+k 是地址、*a+k 是值加 k），故选 C。$qt$ where id = 372276 and not is_golden;
update t_question set stem = $qt$以下能够正确描述“k 是大于 0 的偶数”的表达式是()。$qt$, option_json = $qt${"A":"(k>0) && (k%2!=1)","B":"(k>0) && (k%2=0)","C":"(k>0) ||!(k%2)","D":"(k>0) II (k%2==0)"}$qt$, analysis = $qt$k是大于0的偶数

:k>0 且 k 是偶数

偶数的判断可以是 k%2 == 0 或 k%2!=1

Ψ(k>0) && (k%2!=1)$qt$ where id = 372283 and not is_golden;
update t_question set stem = $qt$设有定义:int x=2；，以下表达式中，值不为6的是()。$qt$, option_json = $qt${"A":"2^{*}x,x + = 2","B":"x++,2*x","C":"x*(1+x)","D":"{x}^{ * } = x + 1"}$qt$, analysis = $qt$2*x,x+=2 值为 4，其余均为 6。$qt$ where id = 372288 and not is_golden;
update t_question set stem = $qt$若 int x,y; double z;

以下不合法的 scanf 函数调用语句是____。$qt$, option_json = $qt${"A":"scanf(\"%d%lx,%le\",&x,&y,&z);","B":"scanf(\"%2d%d%lf\",&x,&y,&z);","C":"scanf(\"%x%*d%o\",&&,y);","D":"scanf(\"%x%o%6.2f\", &x,&y,&z);"}$qt$, analysis = $qt$scanf 不能用 %6.2f。$qt$ where id = 372296 and not is_golden;
update t_question set stem = $qt$以下四个程序中，完全正确的是 ____。$qt$, option_json = $qt${"A":"#include <stdio.h>\nmain();{\n printf(\"programming!\\n\");\n}","C":"#include <stdio.h>\nmain(){\n printf(\"programming!\\n\");\n}","B":"#include\nmain(){\n printf(\"programming!\\n\");\n}","D":"include<stdio.h>\nmain(){\n printf(\"programming!\\n\");\n}"}$qt$, analysis = $qt$（AI 补答）C 程序结构完整：#include 加 main(){...}，故选 C。$qt$ where id = 372298 and not is_golden;
update t_question set stem = $qt$以下正确引用头文件“stdio.h”的语句是$qt$, option_json = $qt${"A":"#include {stdio.h}","B":"#include <stdio.h>","C":"##include <stdio.h>","D":"#include#stdio.h#"}$qt$, analysis = $qt$#include <stdio.h> 为正确引用。$qt$ where id = 372301 and not is_golden;
update t_question set stem = $qt$以下叙述中错误的是____。$qt$, option_json = $qt${"A":"在程序中凡是以\"#\"开始的语句行都是预处理命令行","B":"预处理命令行的最后不能以分号表示结束","C":"#define MAX 是合法的宏定义命令行","D":"C 程序对预处理命令行的处理是在程序执行的过程中进行的"}$qt$, analysis = $qt$预处理命令的处理在编译前（并非程序执行过程中）进行，D 叙述错误，故选 D。$qt$ where id = 372308 and not is_golden;
update t_question set stem = $qt$以下说法正确的是____。$qt$, option_json = $qt${"A":"C语言只接受十进制的数","B":"C语言只接受二进制、八进制、十六进制的数","C":"C语言只接受二进制、十进制 s -十六进制的数","D":"C语言只接受八进制、十进制、十六进制的数"}$qt$, analysis = $qt$C 语言接受八进制、十进制、十六进制数。$qt$ where id = 372317 and not is_golden;
update t_question set stem = $qt$表达式 a + = a - = a = 9 的值是____。$qt$, option_json = $qt${"A": "9", "B": "-9", "C": "18", "D": "0"}$qt$, analysis = $qt$表达式"a+=a-=a=9"的求解过程，第一步:a=9；第二步:a-=9，相当于 a=a-9=9-9=0；第三步:a+=0，相当于 a=a+0=0+0=0。故本题答案为 D。$qt$ where id = 372319 and not is_golden;
update t_question set stem = $qt$若有定义语句:int a=3,b=2,c=1;，以下选项中错误的赋值表达式是____。$qt$, option_json = $qt${"A":"a=(b=4)=3;","B":"a=b=c+1;","C":"a=(b=4)+c ;","D":"a=1+(b=c=4) ;"}$qt$, analysis = $qt$a=(b=4)=3 中 (b=4) 非左值，错误。$qt$ where id = 372320 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是____。$qt$, option_json = $qt${"A":"在赋值表达式中，赋值号的右边可以是变量，也可以是任意表达式","B":"a 是实型变量，a=10 在 C 语言中是允许的，因此可以说:实型变量中可以存放整型数","C":"若有 int a = 4, b = 9; 执行了 a = b 后, a 的值已由原值改变为 b 的值, b 的值变为 0","D":"若有 int a = 4, b = 9; 执行了 a = b; b = a; 之后, a 的值为 9, b 的值为 4"}$qt$, analysis = $qt$赋值号右边可以是变量或任意表达式。$qt$ where id = 372322 and not is_golden;
update t_question set stem = $qt$有以下程序段

int a=3, b;
b=a+3;
{ int c=2; a*=c+1;}
printf("%d\n",a) ;

下面关于此段程序的说法，正确的是____。$qt$, option_json = $qt${"A":"这段程序的输出是9","B":"这段程序中存在有语法错误的语句","C":"这段程序的输出是7","D":"可执行语句 b = a + 3; 后，不能再定义变量 c"}$qt$, analysis = $qt$a*=c+1=3*3=9，输出 9。$qt$ where id = 372323 and not is_golden;
update t_question set stem = $qt$有以下程序

\text {main} ()

{char a1='M',a2='m';
printf("%c\n",(a1,a2));
}

以下叙述中正确的是____。$qt$, option_json = $qt${"A": "程序输出大写字母M", "B": "程序输出小写字母 m", "C": "格式说明符不足，编译出错", "D": "程序运行时产生出错信息"}$qt$, analysis = $qt$(a1,a2) 逗号表达式值为 a2 → m。$qt$ where id = 372325 and not is_golden;
update t_question set stem = $qt$设 a,b,c 是整型变量且均已赋值，则以下选项中错误的赋值语句是 ____。$qt$, option_json = $qt${"A":"a = (b = 3) = 1;","B":"a = (b = 2) + c;","C":"a=b=c+10;","D":"a=1+(b=c=2);"}$qt$, analysis = $qt$(b=3)=1 非左值错误。$qt$ where id = 372326 and not is_golden;
update t_question set stem = $qt$设有如下语句:int k=0;k=printf("OK\n");则以下叙述中正确的是____。$qt$, option_json = $qt${"A":"变量 k 得到的是输出的可见字符个数 2","B":"变量 k 得到的是输出字符的总个数3","C":"printf 必须作为独立语句出现","D":"变量 k 仍保持初值 0"}$qt$, analysis = $qt$k=printf("OK\n") 的值为输出字符的总个数 3（O、K、换行），故选 B。$qt$ where id = 372333 and not is_golden;
update t_question set stem = $qt$设有定义:int a,pa;以下 scanf 语句中能正确为变量 pa 或 a 读入数据的是____。$qt$, option_json = $qt${"A":"scanf(\"%d\",pa);","B":"scanf(\"%d\",a);","C":"scanf(\"%d\",&pa);","D":"scanf(\"%d\",*pa);"}$qt$, analysis = $qt$scanf("%d",&pa) 取地址正确。$qt$ where id = 372335 and not is_golden;
update t_question set stem = $qt$有以下程序

#include <stdio.h>

main(){int a1,a2;char c1,c2;

scanf("%d%c%d%c",&a1,&c1,&a2,&c2);

printf("%d,%c,%d,%c",a1,c1,a2,c2);

若想通过键盘输入, 使得 a1 的值为 12 , a2 的值为 34 , c1 的值为字符 a, c2 的值为字符 b, 程序输出结果是: 12,a,34,b 则正确的输入格式是 (以下 \sqcup 代表空格, <CR>代表回车) ____。$qt$, option_json = $qt${"A":"12a34b<CR>","B":"12LlaL34Lb<CR>","C":"12,a,34,b<CR>","D":"12L|a34L|b<CR>"}$qt$, analysis = $qt$"%d%c%d%c" 对应 12a34b。$qt$ where id = 372338 and not is_golden;
update t_question set stem = $qt$有以下程序

main(){ int m,n,p;

scanf("m=%dn=%dp=%d",&m,&n,&p);

printf("%d%d%d\n",m,n,p);

}

若想从键盘上输入数据, 使变量 m 中的值为 123 , n 中的值为 456 , p 中的值为 789 , 则正确的输入是____。$qt$, option_json = $qt${"A": "m=123 n=456 p=789", "B": "m=123n=456p=789", "C": "m=123,n=456,p=789", "D": "123 456 789"}$qt$, analysis = $qt$格式串含 m=、n=、p= 字样，须原样输入 m=123n=456p=789，故选 B。$qt$ where id = 372339 and not is_golden;
update t_question set stem = $qt$以下不能输出字符 A 的语句是____。(注:

字符 A 的 ASCII 码值为 65，字符 a 的 ASCII 码值为 97)$qt$, option_json = $qt${"A":"printf(\"%c\\n\", 'a' -32);","B":"printf(\"%d\\n\",A\");","C":"printf(\"%c\\n\",65);","D":"printf(\"%c\\n\",'B'-1);"}$qt$, analysis = $qt$printf("%d",'A') 输出 65 不是字符 A。$qt$ where id = 372346 and not is_golden;
update t_question set stem = $qt$设有定义:double x=3.33；以下不能完整输出变量 x 值的语句是 ____。$qt$, option_json = $qt${"A":"printf(\"x=%lf\\n\",x);","B":"printf(\"x=%f\\n\",x);","C":"printf(\"x=%4.0f\\n\",x);","D":"printf(\"x=%0.5f\\n\",x);"}$qt$, analysis = $qt$printf("x=%4.0f\n",x) 只输出 3，不能完整输出 3.33，故选 C。$qt$ where id = 372349 and not is_golden;
update t_question set stem = $qt$下列条件语句中，输出结果与其他语句不同的是____。$qt$, option_json = $qt${"A":"if(a) printf(\"%d\\n\",x); else print(\"%d\\n\",y);","B":"if(a==0) printf(\"%d\\n\",y); else print(\"%d\\n\",x);","C":"if(a!=0) printf(\"%d\\n\",x); else print(\"%d\\n\",y);","D":"if(a==0) printf(\"%d\\n\",x); else print(\"%d\\n\",y);"}$qt$, analysis = $qt$选项 A:如果 a 为非 0，则输出 x，否则输出 y _ { \circ } 。选项 B:如果 a 为 0，则输出 y，否则输出 \mathsf { X } _ { \circ } 选项 C:如果 a 为非 0，则输出 x，否则输出 y _ { \circ } 选项 D:如果 a 为 0，则输出 x，否则输出 y。故本题答案为 D。$qt$ where id = 372351 and not is_golden;
update t_question set stem = $qt$若有定义:int a=0, b=0, c=0, d=0;，有 C 语言表达式 (a++ && b++) ? c++ : d++, 以下关于其执行顺序的斜确是____。$qt$, option_json = $qt${"A":"先执行 b++, 表达式 b++ 的值为 1; 再执行 a++, 表达式 a++ 的值为 1, 由此可确定 (a++ && b++) 值为此执行 c++","B":"先执行 a++，表达式 a++ 的值为 0；再执行 b++，表达式 b++ 的值为 0，由此可确定 (a++ && b++) 值为此执行 d++","C":"先执行 a++，表达式 a++ 的值为 1；再执行 b++，表达式 b++ 的值为 1，由此可确定 (a++ && b++) 值为此执行 c++","D":"先执行 a++，表达式 a++ 的值为 0，由此即可确定 (a++ && b++) 值为 0，因此执行 d++"}$qt$, analysis = $qt$(a++&&b++)：a++ 为 0 直接短路（b 不变），取 d++，故选 D。$qt$ where id = 372362 and not is_golden;
update t_question set stem = $qt$若有定义:int a=0, b=0, c=0, d=0;，以下关于 C 语言表达式:(++a||++b) ? ++c : ++d 执行顺序的叙述正确。$qt$, option_json = $qt${"A": "先执行++a，表达式++a的值为1，由此可确定(++) || ++b)值为1，因此执行++c", "B": "先执行++a，表达式++a的值为1；再执行++b，表达式++b的值为1，由此可确定(++a || ++b)值为1，执行++c", "C": "先执行++b，表达式++b的值为1；再执行++a，表达式++a的值为1，由此可确定(++a || ++b)值为1，执行++c", "D": "先执行++a, ++b, ++c, ++d, 使得 a,b,c,d 的值都为 1，由此可确定(++a || ++b)值为 1，因此执行++c"}$qt$, analysis = $qt$先执行++a，表达式++a 的值为 1，由此可确定(++a||++b)值为 1，不必执行++b 语句，直接执行++c 语句。$qt$ where id = 372363 and not is_golden;
update t_question set stem = $qt$要求通过 while 循环不断读入字符，当读入字母 N 时结束循环。若变量已正确定义,以下正确的程序段是____$qt$, option_json = $qt${"A":"while(ch=getchar()=='N') printf(\"%c \",ch);","B":"while((ch=getchar())=='N') printf(\"%c \",ch);","C":"while((ch=getchar())!='N') printf(\"%c \",ch);","D":"while(ch=getchar() ='N') printf(\"%c \",ch);"}$qt$, analysis = $qt$不断读入字符、遇 N 结束：while((ch=getchar())!='N') printf(...)，故选 C。$qt$ where id = 372375 and not is_golden;
update t_question set stem = $qt$在以下给出的表达式中，与while(EXP)中的(EXP)不等价的表达式是____。$qt$, option_json = $qt${"A":"(!EXP==0)","B":"(EXP>0||EXP<0)","C":"(EXP==0)","D":"(EXP!=0)"}$qt$, analysis = $qt$while(表达式)语句用来实现"当型"循环结构，当表达式为非 0 值时，执行 while 语句中的内嵌语句。选项 A 非零即为 1，选项 B 与选项 D 的结果也为 1，只有选项 C 为 0。$qt$ where id = 372378 and not is_golden;
update t_question set stem = $qt$如果定义:float a[10], x; 则以下叙述中正确的是 ____。$qt$, option_json = $qt${"A":"语句 a = & x；是非法的","B":"表达式 a + 1 是非法的","C":"三个表达式 a[1]、*(a+1)、*&a[1]表示的意思完全不同","D":"表达式*&a[1]是非法的，应该写成 *(&(a[1]))"}$qt$, analysis = $qt$数组名不可赋值，a=&x 非法（正确）。$qt$ where id = 372392 and not is_golden;
update t_question set stem = $qt$以下叙述正确的是____。$qt$, option_json = $qt${"A":"char c1, *c2, **c3, c4[2]; 是 C 语言的合法语句","B":"不能在数组说明符的一对方括号中使用表达式","C":"数组下标的最小值可以是负值","D":"若有数组定义 int array[5]; 则语句 printf(\"%d\", array[1.23]);是合法的"}$qt$, analysis = $qt$char c1,*c2,**c3,c4[2]; 合法。$qt$ where id = 372393 and not is_golden;
update t_question set stem = $qt$若有定义:int bb[8];。则以下表达式中不能代表数组元素bb[1]的地址的是( )$qt$, option_json = $qt${"A":"&bb[0]+1","B":"&bb[1]","C":"&bb[0]++","D":"bb+1"}$qt$, analysis = $qt$&bb[0]++ 非法（非左值），不能代表地址。$qt$ where id = 372400 and not is_golden;
update t_question set stem = $qt$有函数 void fun(int a, int b)，在 main 函数中有如下变量定义和函数调用:

int a = 3, b = 4, c = 5; fun(a,b); 则关于函数调用, 下列描述正确的是 ____。$qt$, option_json = $qt${"A": "形参与实参为相同变量，共享内存", "B": "形参与实参为不同变量，但具有相同的值", "C": "形参与实参为不同变量，但共享内存", "D": "形参与实参关系不确定"}$qt$, analysis = $qt$函数调用时形参与实参是不同变量、但具有相同的值（值传递），故选 B。$qt$ where id = 372424 and not is_golden;
update t_question set stem = $qt$有输入语句: scanf("a=%d,b=%d,c=%d",&a,&b,&c) ;为使变量 a 的值为 1，b 的值为 3，c 的值为 2，则正确的数组输入方式是 ____。（√表示回车）$qt$, option_json = $qt${"A": "132", "B": "1,3,2", "C": "a=1 b=3 c=2", "D": "a=1,b=3,c=2"}$qt$, analysis = $qt$输入形式为 a=1,b=3,c=2（与格式串非格式字符匹配），故选 D。$qt$ where id = 372426 and not is_golden;
update t_question set stem = $qt$执行以下程序段后，变量 a,b,c 的值分别是（）”。

int x=10, y=9;

int a,b,c;

a = (- - x = = y + +)? - - x: + + y;

b = x + +;

c=y;

a = 9,b = 9,c = 9$qt$, option_json = $qt${"A":"a = 9,b = 9,c = 9","B":"a=8,b=8,c=10","C":"a=9,b=10,c=9","D":"a=1,b=11,c=10"}$qt$, analysis = $qt$a=8,b=8,c=10。$qt$ where id = 372428 and not is_golden;
update t_question set stem = $qt$下列四组字符串中都可以用作 C 语言程序中的用户标识符的是( ).$qt$, option_json = $qt${"A":"print_3d db8 aBc","B":"ham one half startit 3pai","C":"str_1 Cpp pow while","D":"Pxq My->book line# His.age"}$qt$, analysis = $qt$print_3d、db8、aBc 均可用作用户标识符，故选 A。$qt$ where id = 372430 and not is_golden;
update t_question set stem = $qt$判断一个数 n 是不是 3 的倍数 一般可以用以下表达式（）。$qt$, option_json = $qt${"A":"n>3","B":"n/3=0","C":"n!=3","D":"n%3==0"}$qt$, analysis = $qt$n%3==0 可判断 n 是否 3 的倍数，故选 D。$qt$ where id = 372438 and not is_golden;
update t_question set stem = $qt$设有 char str[10]，下列语句正确的是____。$qt$, option_json = $qt${"A":"scanf(\"%s\",&str);","B":"printf(\"%c\" str);","C":"printf(\"%s\",str[0]);","D":"printf(\"%s\",str);"}$qt$, analysis = $qt$printf("%s",str); 合法。$qt$ where id = 372439 and not is_golden;
update t_question set stem = $qt$若 int x,y; double z;

以下不合法的 scanf 函数调用语句是____。$qt$, option_json = $qt${"A":"scanf(\"%d%lx,%le\",&x,&y,&z);","B":"scanf(\"%2d%d%lf\",&x,&y,&z);","C":"scanf(\"%x%*d%o\",&x,&y);","D":"scanf(\"%x%o%6.2f\", &x,&y,&z);"}$qt$, analysis = $qt$scanf 不能用 %6.2f。$qt$ where id = 372440 and not is_golden;
update t_question set stem = $qt$执行下列语句后输出的结果是( )

int a = 8,b = 7,c = 6,

if(a<b)if(b>c){a=c;c=b;}

printf("%d,%d,%d\n",a,b,c);$qt$, option_json = $qt${"A": ".6, 7, 7", "B": ".6, 7, 8", "C": ".8, 7, 6", "D": ".8, 7, 8"}$qt$, analysis = $qt$同 372119：8,7,6。$qt$ where id = 372446 and not is_golden;
update t_question set stem = $qt$回答: 若 i, j 均为整型变量, 有以下循环.

\text {for} (i = 0, j = - 1; j = 1; i + +, j + +)

printf ("%d%d",i,j);

则下面描述中正确的是（）$qt$, option_json = $qt${"A": "循环体只执行一次", "B": "循环体一次也不执行", "C": "判断循环结束的条件不合法", "D": "是无限循环"}$qt$, analysis = $qt$for(i=0,j=-1;j=1;i++,j++)：条件 j=1 恒真，是无限循环，故选 D。$qt$ where id = 372471 and not is_golden;
update t_question set stem = $qt$设整型变量 a 的值为 5，使整型变量 b 的值不为 2 的表达式是（）$qt$, option_json = $qt${"A":"b = a / 2","B":"b = 6 - (-a)","C":"b = a% 2","D":"b = a > 3?2:1"}$qt$, analysis = $qt$b≠2：6-(-a)=11、a%2=1（BC）。$qt$ where id = 372473 and not is_golden;
update t_question set stem = $qt$假定符号-、*、\分别代表减法、乘法和指数运算，且

1)三个运算符优先级顺序是:-最高，*其次，\最低；2)运算符运算时的运算值为0。
2) 运算符运算时为左结合。

请计算 3-2*4\1*2\3 的值（）。$qt$, option_json = $qt${"A": "4096", "B": "-61", "C": "64", "D": "2048"}$qt$, analysis = $qt$按 - 最高、* 次、 最低左结合计算 3−2*41*23=(42)3=16³=4096，故选 A。$qt$ where id = 372498 and not is_golden;
update t_question set stem = $qt$有以下程序:

#include <stdio.h>

#include <string.h>

main(){

char x[]="STRING";

x[0]=0; x[1]='0'; x[2]='0';

printf("%d %d\n ",sizeof(x),strlen(x));

}

程序运行后的输出结果是____。$qt$, option_json = $qt${"A": "6 1", "B": "70", "C": "6 3"}$qt$, analysis = $qt$x[0]=0 使 strlen=0、sizeof=7，输出 7 0，故选 B。$qt$ where id = 372503 and not is_golden;
update t_question set stem = $qt$以下函数的类型是（）

fun c(doublex )

{ printf("%f\n",X*X );

}$qt$, option_json = $qt${"A":"与参数 x 的类型相同","B":"void 类型","C":"int 类型","D":"无法确定"}$qt$, analysis = $qt$函数未指定类型时隐含为 int 类型，故选 C。$qt$ where id = 372510 and not is_golden;
update t_question set stem = $qt$以下叙述不正确的是（）。$qt$, option_json = $qt${"A":"在 C 程序中，逗号运算符的优先级最低","B":"在 C 程序中，MAX 和 max 是两个不同的变量","C":"若 a 和 b 类型相同，在计算了赋值表达式 a = b 后，b 中的值将放入 a 中，而 b 中的值不变","D":"当从键盘输入数据时，对于整型变量只能输入整型数值，对于实型变量只能输入实型数值"}$qt$, analysis = $qt$实数输入给整型变量可行（截取），'只能'错误。$qt$ where id = 372511 and not is_golden;
update t_question set stem = $qt$以下叙述正确的是（）。$qt$, option_json = $qt${"A":"在 C 程序中，每行只能写一条语句","B":"若 a 是实型变量, C 程序中允许赋值 a = 10, 因此实型变量中允许存放整型数","C":"在 C 程序中，% 是只能用于整数运算的运算符（字符型也可以）","D":"在 C 程序中，无论是整数还是实数，都能被准确无误地表示"}$qt$, analysis = $qt$% 可用于字符型（按整数运算）。$qt$ where id = 372512 and not is_golden;
update t_question set stem = $qt$设有说明:char w; int x; float y; double z; 则表达式 w*x+z-y 值的数据类型为（）。$qt$, option_json = $qt${"A": "float", "B": "char", "C": "int", "D": "double"}$qt$, analysis = $qt$w*x+z-y 中含 double 型 z，结果类型为 double，故选 D。$qt$ where id = 372513 and not is_golden;
update t_question set stem = $qt$设以下变量均为 int 类型，则值不等于 7 的表达式是（）。$qt$, option_json = $qt${"A":"(x = y = 6, x + y, x + 1)","B":"(x = y = 6, x + y, y + 1)","C":"(x = 6, x + 1, y = 6, x + y)","D":"(y = 6, y + 1, x = y, x + 1)"}$qt$, analysis = $qt$选项C (x = 6,x + 1,y = 6,x + y) = 12$qt$ where id = 372514 and not is_golden;
update t_question set stem = $qt$设 x 和 y 均为 int 型变量，则以下语句:x+=y; y=x-y; x-=y; 的功能是（）$qt$, option_json = $qt${"A":"把 x 和 y 按从大到小排列","B":"把 x 和 y 按从小到大排列","C":"无确定结果","D":"交换 x 和 y 中的值"}$qt$, analysis = $qt$x+=y; y=x-y; x-=y; 实现 x 与 y 中数值的交换，故选 D。$qt$ where id = 372524 and not is_golden;
update t_question set stem = $qt$关于语句int x; scanf("%d ", &x); if(x= 0) printf("zero"); 下列说法正确的是____。$qt$, option_json = $qt${"A":"只有当x的输入值为0时，才能显示zero\n-","B":"只有当x的输入值非0时，才能显示zero","C":"无论输入什么值，都不显示zero\n-","D":"无论输入什么值，都显示zero\n\n我的答案:C 正确答案:C"}$qt$, analysis = $qt$x=0这个无论x之前是什么，之后都被赋值成0，所以if(x=0)假，所以不会显示zero.$qt$ where id = 372534 and not is_golden;
update t_question set stem = $qt$有函数void fun() { static int a;int b; }, 则a和b的值分别为____。 • A. 0,0$qt$, option_json = $qt${"A":"0, 0","B":"0,未初始化","C":"未初始化,0","D":"未初始化,未初始化\n\n我的答案:B 正确答案:B"}$qt$, analysis = $qt$静态变量未直接赋值初始值时，默认初始值是0 自动变量不初始化时，是不确定值。$qt$ where id = 372535 and not is_golden;
update t_question set stem = $qt$设有语句int i= 29;则表达式i%3? 1:-1的值是____。 • A. -1$qt$, option_json = $qt${"A": "-1", "B": "3", "C": "2", "D": "1"}$qt$, analysis = $qt$i%3? 1:-1  \begin{array}{l} = 29% 3 ? 1: -1 \ = 2? 1: - 1 \ = 1 \ \end{array}$qt$ where id = 372536 and not is_golden;
update t_question set stem = $qt$若要求从键盘读入含有空格字符的字符串，应用该使用函数____。$qt$, option_json = $qt${"A":"getc()","B":"gets()","C":"getchar()","D":"scanf()\n\n我的答案:C 正确答案:B\n\n答案解析:\n\ngets()可以读入含有空格字符的字符串。"}$qt$, analysis = $qt$gets()可以读入含有空格字符的字符串。$qt$ where id = 372537 and not is_golden;
update t_question set stem = $qt$设有“int t;”以及函数fun的定义形式为:

void fun(char ch,float x){printf("%d,%f",ch,x);}

,屏幕要显示97,2.000000 则以下对函数fun的调用语句中，正确的形式是____。$qt$, option_json = $qt${"A":"fun(\"a\",2.0);","B":"t=fun('97',2);","C":"fun('a',2.0);","D":"t=fun(97.0,32);\n\n我的答案:C 正确答案:C"}$qt$, analysis = $qt$void fun(char ch,float x) 调用fun函数需要char是字符，可以使得ascii值传，也可以字符  { } ^ { \prime } a ^ { \prime } =$qt$ where id = 372538 and not is_golden;
update t_question set stem = $qt$下列关于break语句叙述正确的是____。$qt$, option_json = $qt${"A":"break语句只能用于switch语句","B":"在switch语句中必须使用default","C":"break语句必须与switch语句中case配对","D":"在switch语句中，不一定使用break语句\n\n我的答案:D 正确答案:D"}$qt$, analysis = $qt$break可以在switch语句中，也可以用于循环结构中。选项A错误。 switch语句中不一定要defaultl、break。选项B错误。 break语句不一定要与switch语句中case配对使用。$qt$ where id = 372539 and not is_golden;
update t_question set stem = $qt$以下能正确定义且赋初值的语句是____。 A int n1=n2=10; B char c='\0'; C float f=f+1.1; D double x=12.3E2.5;$qt$, option_json = $qt${"A":"int n1=n2=10;","B":"char c='\\0';","C":"float f=f+1.1;","D":"double x=12.3E2.5;"}$qt$, analysis = $qt$char c='\0'; 正确赋初值。$qt$ where id = 372540 and not is_golden;
update t_question set stem = $qt$对于以下程序: #include int main(){ txt int a = 2; int b = a + 2 printf("%d",b); return 0; } ## 则输出结果是:$qt$, option_json = $qt${"A": "4", "B": "%d", "C": "a+2", "D": "程序无法通过编译（编译错误）"}$qt$, analysis = $qt$int b = a + 2 之后缺秒分号$qt$ where id = 372542 and not is_golden;
update t_question set stem = $qt$if语句的基本形式是:if(表达式)语句，以下关于“表达式”值的叙述中正确的是（）。$qt$, option_json = $qt${"A":"必须是逻辑值","B":"必须是整数值","C":"必须是正数","D":"可以是任意合法的数值\n\n我的答案:D 正确答案:D\n\n答案解析:\n\n表达式可以是任意合法的数值。"}$qt$, analysis = $qt$表达式可以是任意合法的数值。$qt$ where id = 372548 and not is_golden;
update t_question set stem = $qt$下面对变量定义正确的是()$qt$, option_json = $qt${"A":"int x, y","B":"fk:float;","C":"char ch;","D":"double int;\n\n我的答案:C 正确答案:C"}$qt$, analysis = $qt$选项A错误。语句需要有； 选项B错误。定义是类型名变量名； 选项C正确。 选项D错误。int是关键字不能作为用户标识符使用。$qt$ where id = 372549 and not is_golden;
update t_question set stem = $qt$有以下程序(strcat()函数用来连接两个字符串), 程序运行后的输出结果是(B)

c
#include 

main( ){
 char a[20]="ABCD\0EFG\0", b[]="IJK";

 strcat(a,b);

 printf("%s\n",a);
}$qt$, option_json = $qt${"A":"ABCDE\\0FG\\0IJK","B":"ABCDIJK","C":"IJK","D":"EFGIJK\n\n我的答案:B 正确答案:B"}$qt$, analysis = $qt$strcat是字符串拼接函数，接在第一个'\0'位置 所以结果是“ABCDIJK”$qt$ where id = 372550 and not is_golden;
update t_question set stem = $qt$以下函数的类型是（）

fun c( doublex )

awk
{ printf("%f\n",X*X );
}$qt$, option_json = $qt${"A":"与参数x的类型相同\n-","B":"void 类型\n•","C":"int 类型","D":"无法确定\n\n我的答案:C 正确答案:C\n\n答案解析:\n\n函数缺略时为int类型。"}$qt$, analysis = $qt$函数缺略时为int类型。$qt$ where id = 372551 and not is_golden;
update t_question set stem = $qt$若要定义一个具有5个元素的整型数组，以下语句中错误的是:()$qt$, option_json = $qt${"A":"int a[5]={0};","B":"int b[ ]={0,0,0,0,0};","C":"int c[2+3];","D":"int n = 5; d[n];\n\n我的答案:D 正确答案:D"}$qt$, analysis = $qt$数组的下标长度。定义时候，不可以是变量。$qt$ where id = 372552 and not is_golden;
update t_question set stem = $qt$设以下变量均为int类型，则值不等于7的表达式是（）。$qt$, option_json = $qt${"A":"(x=y=6,x+y,x+1)","B":"(x=y=6,x+y,y+1)","C":"(x=6,x+1,y=6,x+y)","D":"(y=6,y+1,x=y,x+1)\n\n我的答案:C 正确答案:C"}$qt$, analysis = $qt$选项C (x = 6,x + 1,y = 6,x + y) = 12$qt$ where id = 372554 and not is_golden;
update t_question set stem = $qt$下面程序的功能是将从键盘输入的一对数,由小到大排序输出,当输入一对相等数时结束循环,请选择填空( )。

c
#include 

main( )

{

 int a,b,t;

 scanf("%d%d",&a,&b);

txt
while( ______ )
 {if(a>b)
 {t=a;a=b;b=t;}
 printf("%d,%d\n",a,b);
 scanf("%d%d",&a,&b);
 }
}$qt$, option_json = $qt${"A":"!a=b","B":"a!= b","C":"a == b","D":"a = b"}$qt$, analysis = $qt$a!=b 为循环继续条件。$qt$ where id = 372560 and not is_golden;
update t_question set stem = $qt$若变量已正确定义并赋值,以下符合 C 语言语法的表达式是( )$qt$, option_json = $qt${"A":"a = a + 7;","B":"a = 7 + b + c, a++","C":"int(12.3%4)","D":"a = a + 7 = c + b"}$qt$, analysis = $qt$a=7+b+c, a++ 是合法逗号表达式。$qt$ where id = 372569 and not is_golden;
update t_question set stem = $qt$以下不是无限循环的语句为( )。$qt$, option_json = $qt${"A":"for(y=0,x=1;x>++y;x=i++) i=x;","B":"for(;;x++=i);","C":"while(1){x++;}","D":"for(i=10;;i--) sum+=i;"}$qt$, analysis = $qt$A 条件 x>++y 首轮即假，非无限循环。$qt$ where id = 372572 and not is_golden;
update t_question set stem = $qt$x、y、z 被定义为 int 型变量,若从键盘给 x、y、z 输入数据,正确的输入语句是( )。$qt$, option_json = $qt${"A":"INPUT x, y, z;","B":"scanf(\"%d%d%d\",&x,&y,&z);","C":"scanf(\"%d%d%d\",x,y,z);","D":"read(\"%d%d%d\",&x,&y,&z);"}$qt$, analysis = $qt$scanf("%d%d%d",&x,&y,&z) 格式正确。$qt$ where id = 372576 and not is_golden;
update t_question set stem = $qt$若有定义:int a = 10, b = 9, c = 8; 接着顺序执行下列语句后, 变量 b 中的值是( )。

\begin{array}{l} c = (a - = (b - 5)); \ c = (a   % 1 1  ) + (b   = 3); \ \end{array}$qt$, option_json = $qt${"A": "1", "B": "2", "C": "3", "D": "9"}$qt$, analysis = $qt$（AI 补答）a-=(b-5) 后 a=6；c=(a%11)+(b=3) 使 b=3，故选 C。$qt$ where id = 372577 and not is_golden;
update t_question set stem = $qt$判断 char 型变量 c1 是否为小写字母的正确表达式是( )。$qt$, option_json = $qt${"A":"'a'<=c1<='z'","B":"(c1>=a) && (c1<=z)","C":"('a'>=c1) || ('z'<=c1)","D":"(c1>='a') && (c1<='z')"}$qt$, analysis = $qt$判断 c1 为小写字母：(c1>='a')&&(c1<='z')，故选 D。$qt$ where id = 372578 and not is_golden;
update t_question set stem = $qt$以下叙述不正确的是( )。$qt$, option_json = $qt${"A":"在C程序中,逗号运算符的优先级最低","B":"在C程序中,APH和aph是两个不现的变量","C":"若a和b类型相同,在计算了赋值表达式 a = b 后 b 中的值将放入 a 中,而b中的值不变","D":"当从键盘输入数据时,对于整型变量只能输入整型数值,对于实型变量只能输入实型数值"}$qt$, analysis = $qt$同 372511：'只能输入'错误。$qt$ where id = 372584 and not is_golden;
update t_question set stem = $qt$以下选项中,与 k = n++ 完全等价的表达式是( )。$qt$, option_json = $qt${"A":"k = n, n = n + 1","B":"n = n + 1, k = n","C":"k = + + n","D":"k += n + 1"}$qt$, analysis = $qt$k = n, n = n + 1 与 k = n + + 完全等价的表达式。选项A正确。$qt$ where id = 372587 and not is_golden;
update t_question set stem = $qt$若 x、i、j 和 k 均是 int 型变量, 则计算表达式 x=(i=4,j=16,k=32) 后, x 的值为()。$qt$, option_json = $qt${"A": "4", "B": "16", "C": "32", "D": "52"}$qt$, analysis = $qt$逗号表达式取末值 32。$qt$ where id = 372591 and not is_golden;
update t_question set stem = $qt$设 x 和 y 均为 int 型变量, 则以下语句的功能是( )

x += y; y = x - y; x -= y;$qt$, option_json = $qt${"A":"把 x 和 y 按从大到小排列","B":"把 x 和 y 按从小到大排列","C":"无确定结果","D":"交换 x 和 y 中的值"}$qt$, analysis = $qt$x+=y;y=x-y;x-=y 交换 x、y。$qt$ where id = 372592 and not is_golden;
update t_question set stem = $qt$设 a = 12, b = 123.45, 执行语句 printf(%4d, %4.1f", a, b) 的输出结果为( ).$qt$, option_json = $qt${"A": "12, 12.3", "B": "12,123.4", "C": "12, 23.4", "D": "12, 123.45"}$qt$, analysis = $qt$123.45 浮点存储略小于真值，%.1f 得 123.4。$qt$ where id = 372594 and not is_golden;
update t_question set stem = $qt$若有说明语句: char c = '\72'; 则变量 c ( ).$qt$, option_json = $qt${"A":"包含1个字符 |\n| --- |\n|","C":"包含3个字符 |\n\n|","B":"包含2个字符 |\n| --- |\n|","D":"说明不合法,c的值不确定 |"}$qt$, analysis = $qt$'\72' 1 个字符。$qt$ where id = 372596 and not is_golden;
update t_question set stem = $qt$设 int x, y, 且 x=10, y=3, 则以下语句的输出结果是()

| printf("%d,%d\\n",x--,--y); |
| --- |
| A.10,3 |
| C.9,2 |

seal

OMPUTER$qt$, option_json = $qt${"A": "10,3", "B": "9,3", "C": "9,2", "D": "10,2"}$qt$, analysis = $qt$x--=10，--y=2。$qt$ where id = 372597 and not is_golden;
update t_question set stem = $qt$下列程序执行后的输出结果是(小数点后只写一位)()。

main()

{ double d; float f; long l; int i;

i=f=l=d=20/3;

printf("%d %ld %f %f \n", i,l,f,d);

}$qt$, option_json = $qt${"A":"6 6 6.0 6.0","C":"6 6 6.0 6.7","B":"6 6 6.7 6.7","D":"6 6 6.7 6.0\n\nQuark夸克\n\n高清扫描还原文档\n\n白羊权计算机 高分冲刺系列丛书"}$qt$, analysis = $qt$20/3=6，全为 6.0。$qt$ where id = 372598 and not is_golden;
update t_question set stem = $qt$不能正确表示数学式 (a· b)/(c) 的表达式是____。$qt$, option_json = $qt${"A": "a/b*c", "B": "a*b/c", "C": "a/c*b", "D": "a*(b/c)"}$qt$, analysis = $qt$由题意可知 c 是除数，A 中 b 是除数，故 A 错。故本题答案为 A。$qt$ where id = 372617 and not is_golden;
update t_question set stem = $qt$C语言程序中，运算对象必须是整型数的运算符是____。$qt$, option_json = $qt${"A":"&&","B":"/","C":"%"}$qt$, analysis = $qt$% 要求整型运算对象。$qt$ where id = 372618 and not is_golden;
update t_question set stem = $qt$设有定义:int a = 0, b = 1, c = 1；以下选项中，表达式值与其它三个不同的是 ____。$qt$, option_json = $qt${"A": "b=a==c", "B": "a=b=c", "C": "a=c==b", "D": "c=a!=c"}$qt$, analysis = $qt$b=a==c 得 0，其余表达式值为 1。$qt$ where id = 372619 and not is_golden;
update t_question set stem = $qt$以下能正确表述算式 \sin(2\pi r+60^{\circ}) 的 C 语言表达式是 ____。$qt$, option_json = $qt${"A":"\\sin (2*3.14*r + 3.14*60 / 180.0)","B":"\\sin(2*\\pi*r+60)","C":"\\sin(2*3.14*r+60)","D":"sin(2*3.14*r+60*3.14/360.0)"}$qt$, analysis = $qt$πr 用 3.14*r，60° 用 3.14*60/180.0。$qt$ where id = 372620 and not is_golden;
update t_question set stem = $qt$若有 C 语言表达式 2+3*4+7/3 , 结果____。$qt$, option_json = $qt${"A": "15", "B": "16", "C": "9", "D": "16.5"}$qt$, analysis = $qt$2+12+2=16。$qt$ where id = 372623 and not is_golden;
update t_question set stem = $qt$设变量 m 为 float 类型，变量 n 为 int 类型，则以下能实现将 m 中的数值保留小数点后两位，第三位进行到五入运算的表达式是____。$qt$, option_json = $qt${"A":"n=m*100+0.5, m=n/100.0","B":"m=(m*100+0.5)/100.0","C":"n=m/100+0.5, m=n*100.0","D":"m=m*100+0.5/100.0"}$qt$, analysis = $qt$先 n=m*100+0.5 四舍五入（赋给 int 截断），再 m=n/100.0 还原两位小数，故选 A。$qt$ where id = 372624 and not is_golden;
update t_question set stem = $qt$若变量已正确定义，以下选项中非法的表达式是____。$qt$, option_json = $qt${"A":"'a'=1/2*(x=y=20,x*3)","B":"a!=4||'b'","C":"'a' % 4","D":"'A' + 32"}$qt$, analysis = $qt$'a'=... 赋值给常量非法。$qt$ where id = 372625 and not is_golden;
update t_question set stem = $qt$以下选项中，能够正确利用随机函数 rand(), 产生一个英文字母的表达式是 ____。$qt$, option_json = $qt${"A":"rand()%26+'A'&&rand()%26+'a'","B":"rand()%26+'A'||rand()%26+'a'","C":"rand()%2==0 ? rand()%26+'A':rand()%26+'a'","D":"rand()%2==0 ? rand()%'A':rand()%'a'"}$qt$, analysis = $qt$rand()%2 选择大小写字母。$qt$ where id = 372628 and not is_golden;
update t_question set stem = $qt$若变量均已正确定义并赋值，以下合法的 C 语言赋值语句是____。$qt$, option_json = $qt${"A":"x=y==5;","B":"x=n%2.5;","C":"x+n=i;","D":"x = 5 = 4 + 1"}$qt$, analysis = $qt$x=y==5 合法。$qt$ where id = 372629 and not is_golden;
update t_question set stem = $qt$若变量 x、y 已正确定义并赋值，以下符合 C 语言语法的表达式是 ____。$qt$, option_json = $qt${"A":"++x,y=x--","B":"x+1=y","C":"x = x + 10 = x + y","D":"double(x)/10"}$qt$, analysis = $qt$++x,y=x-- 符合 C 语法（B 赋值目标非法、C 链式错误、D double(x) 非转换语法），故选 A。$qt$ where id = 372630 and not is_golden;
update t_question set stem = $qt$若已有定义语句:int a, b, c，且变量已正确赋初值，则以下选项中正确的赋值表达式是____。$qt$, option_json = $qt${"A":"a = (b = c) + 8;","B":"(a=b)=c=9;","C":"a=(b==c)='A';","D":"a + b = c + 1"}$qt$, analysis = $qt$a=(b=c)+8 合法。$qt$ where id = 372631 and not is_golden;
update t_question set stem = $qt$在 C 语言中，（）运算符会出现“短路现象”。$qt$, option_json = $qt${"A":"&&, ||","B":">=, <=","C":"&","D":"|"}$qt$, analysis = $qt$&& 和 || 运算符会出现“短路现象”，故选 A。$qt$ where id = 372633 and not is_golden;
update t_question set stem = $qt$若有定义语句:int a=3,b=2,c=1;，以下选项中错误的赋值表达式是____。$qt$, option_json = $qt${"A":"a = (b = 4) = 3;","B":"a = b = c + 1;","C":"a = (b = 4) + c;","D":"a = 1 + (b = c - 4)"}$qt$, analysis = $qt$a=(b=4)=3 非左值错误。$qt$ where id = 372635 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是____。$qt$, option_json = $qt${"A":"在赋值表达式中，赋值号的右边可以是变量，也可以是任意表达式","B":"a 是实型变量，a=10 在 C 语言中是允许的。因此可以说:实型变量中可以存放整型数","C":"若有 int a=4,b=9; 执行了 a=b 后，a 的值已由原值改变为 b 的值，b 的值变为 0","D":"若有 int a=4,b=9; 执行了 a=b;b=a; 之后，a 的值为\n\n9, b 的值为 4"}$qt$, analysis = $qt$赋值号右边可以是任意表达式。$qt$ where id = 372636 and not is_golden;
update t_question set stem = $qt$若变量已正确定义为 int 型，要通过语句 scanf ("%d,%d,%d",&a,&b,&c); 给 a 赋值 1、给 b 赋值 2、给 c 赋值 3,以下输入形式中错误的是 ____。(L 代表一个空格符)$qt$, option_json = $qt${"A":"1,2,3<回车>","B":"1 2 3<回车>","C":"1,  2,  3<回车>","D":"1,2,3<回车>"}$qt$, analysis = $qt$%d,%d,%d 要求用逗号分隔（空格可置于各数前）：输入 1 2 3 不含逗号会匹配失败，故选 B。$qt$ where id = 372640 and not is_golden;
update t_question set stem = $qt$有以下程序

#include <stdio.h>

main(){int a1,a2;char c1,c2;

scanf("%d%c%d%c",&a1,&c1;&a2,&c2)

printf("%d,%c,%d,%c",a1,a1,a2,c2);

}

若想通过键盘输入，使得a1的值为12，a2的值为34，c1的值为字符a，c2的值为字符b，程序输出结果是:

12,a,34,b 则正确的输入格式是（以下 \sqcup 代表空格，<CR>代表回车）$qt$, option_json = $qt${"A":"12a34b<CR>","B":"12L|aL|34L|b<CR>","C":"12,a,34,b<CR>","D":"12L|a34L|b<CR>"}$qt$, analysis = $qt$%d%c%d%c 对应 12a34b。$qt$ where id = 372642 and not is_golden;
update t_question set stem = $qt$有以下程序

main(){ int m,n,p;

scanf("m=%dn=%dp=%d",&m,&n,&p);

printf("%d%d%d\n",m,n,p);

}

若想从键盘上输入数据, 使变量 m 中的值为 123, n 中的值为 456, p 中的值为 789, 则正确的输入是____。$qt$, option_json = $qt${"A": "m=123 n=456 p=789", "B": "m=123n=456p=789", "C": "m=123,n=456,p=789", "D": "123 456 789"}$qt$, analysis = $qt$格式串含 m=、n=、p=，须原样输入 m=123n=456p=789，故选 B。$qt$ where id = 372643 and not is_golden;
update t_question set stem = $qt$设有定义:double x；，以下选项中不能将输入数据3.14读入赋给变量x的是____。$qt$, option_json = $qt${"A":"scanf(\"%4lf\",&x);","B":"scanf(\"%|f\",&x);","C":"scanf(\"%le\",&x);","D":"scanf(\"%4.2f\",&x);"}$qt$, analysis = $qt$scanf语句中，%f用于float类型的输入，%lf用于double类型的输入，%le用法和%lf一样。而本题x被定义为double类型，选项D错误，故本题的答案为D。$qt$ where id = 372650 and not is_golden;
update t_question set stem = $qt$以下不能输出字符 A 的语句是____。(注:字符 A 的 ASCII 码值为 65，字符 a 的 ASCII 码值为 97)$qt$, option_json = $qt${"A":"printf(\"%c\\n\",a'-32);","B":"printf(\"%d\\n\", 'A');","C":"printf(\"%c\\n\",65);","D":"printf(\"%c\\n\", 'B'-1);"}$qt$, analysis = $qt$printf("%d",'A') 输出 65。$qt$ where id = 372651 and not is_golden;
update t_question set stem = $qt$设有定义:double x=3.33；以下不能完整输出变量x值的语句是____。$qt$, option_json = $qt${"A":"printf(\"x=%lf\\n\",x);","B":"printf(\"x=%f\\n\",x);","C":"printf(\"x=%4.0\\n\",x);","D":"printf(\"x=%0.5f\\n\",x);"}$qt$, analysis = $qt$printf("x=%4.0f\n",x) 只输出 3，不能完整输出 3.33，故选 C。$qt$ where id = 372654 and not is_golden;
update t_question set stem = $qt$若 a 是数值类型，则逻辑表达式(a==1)||(a!=1)的值是____。$qt$, option_json = $qt${"A":"1","B":"0","C":"2","D":"不知道 a 的值，不能确定"}$qt$, analysis = $qt$(a==1)||(a!=1) 恒为 1。$qt$ where id = 372655 and not is_golden;
update t_question set stem = $qt$若变量已正确定义，在 if(W) printf("%d\n",k);中，以下不可替代 W 的是____。$qt$, option_json = $qt${"A":"a==b","B":"a<>b","C":"chr=getchar()","D":"b++"}$qt$, analysis = $qt$a<>b 不是 C 运算符。$qt$ where id = 372656 and not is_golden;
update t_question set stem = $qt$若有定义 int x,y; 并已正确给变量赋值，则以下选项中与表达式 (x+y)?(x--):(y--) 中的条件表达式 (x+y) 等价的是 ____。$qt$, option_json = $qt${"A":"(x + y <   0)","B":"(x+y<0||x-y>0)","C":"(x+y<>0)","D":"(x+y==0)"}$qt$, analysis = $qt$条件表达式 (x+y) 等价于 (x+y)<>0（即非 0），故选 C。$qt$ where id = 372661 and not is_golden;
update t_question set stem = $qt$若有定义:int a = 0, b = 0, c = 0, d = 0；有 C 语言表达式 (a++ && b++) ? c++ : d++，以下关于其执行顺序的叙述正确是 ____。$qt$, option_json = $qt${"A":"先执行 b++, 表达式 b++ 的值为 1; 再执行 a++, 表达式 a++ 的值为 1, 由此可确定 (a++ && b++) 值为 1, 因此执行 c++","B":"先执行 a++ ，表达式 a++ 的值为0；再执行 b++ ，表达式 b++ 的值为0，由此可确定 (a++& & b++) 值为0，因此执行 d++","C":"先执行 a++，表达式 a++ 的值为 1；再执行 b++，表达式 b++ 的值为 1，由此可确定 (a++ && b++) 值为 1，因此执行 c++","D":"先执行 a++，表达式 a++ 的值为 0，由此即可确定 (a++ && b++) 值为 0，因此执行 d++"}$qt$, analysis = $qt$表达式 (a++ && b++) ? c++ : d++中&&左边的表达式为假，则不必执行&&右边的表达式，直接执行 d++语句，表达式执行后:a=1，b=0，c=0，d=1。$qt$ where id = 372662 and not is_golden;
update t_question set stem = $qt$若有定义:int a=0, b=0, c=0, d=0，以下关于 C 语言表达式:(++a||++b) ? ++c : ++d 执行顺序的叙述正确的是 ____。$qt$, option_json = $qt${"A":"先执行++a，表达式++a的值为1，由此可确定(++a || ++b)值为1，因此执行++c","B":"先执行++a，表达式++a的值为1；再执行++b，表达式++b的值为1，由此可确定(++a || ++b)值为1，因此执行++c","C":"先执行++b，表达式++b的值为1；再执行++a，表达式++a的值为1，由此可确定(++)a || ++b)值为1，因此执行++c","D":"先执行++a，++b，++c，++d，使得a,b,c,d的值都为1，由此可确定 (+ + a\\parallel + + b) 值为1，因此执行 + + c"}$qt$, analysis = $qt$先执行++a，表达式++a 的值为 1，由此可确定(++a||++b)值为 1，不必执行++b 语句，直接执行++c 语句。$qt$ where id = 372663 and not is_golden;
update t_question set stem = $qt$设变量已正确定义，则以下能正确计算 f=m! 的程序段是 ____。$qt$, option_json = $qt${"A":"f=0; for(i=1;i<=m;i++) f*=i;","B":"f=0; for(i=1;i<=m;i++) f*=i;","C":"f=1; for(i=m;i>1;i++) f*=i;","D":"f=1; for(i=m;i>=2;i--) f*=i;"}$qt$, analysis = $qt$正确计算 m!：f=1; for(i=m;i>=2;i--) f*=i;（A/B f 初值 0、C 递增方向错），故选 D。$qt$ where id = 372664 and not is_golden;
update t_question set stem = $qt$设变量已正确定义，以下不能统计出一行中输入字符个数（不包含回车符）的程序段是____。$qt$, option_json = $qt${"A":"n=0; while((ch=getchar())!='\\n') n++;","B":"for(n=0;getchar()!='\\n';n++);","C":"n=0;for(ch=getchar();ch!='\\n';n++);","D":"n=0; while(getchar()!=\\n') n++;"}$qt$, analysis = $qt$C 段 ch 不更新，不能统计。$qt$ where id = 372665 and not is_golden;
update t_question set stem = $qt$如果定义:float a[10], x; 则以下叙述中正确的是 ____。$qt$, option_json = $qt${"A":"语句 a = & x；是非法的","B":"表达式 a + 1 是非法的","C":"三个表达式a[1]、*(a+1)、*&a[1]表示的意思完全不同","D":"表达式*&a[1]是非法的，应该写成 *(&(a[1]))"}$qt$, analysis = $qt$数组名不可赋值 a=&x 非法（正确）。$qt$ where id = 372677 and not is_golden;
update t_question set stem = $qt$若有定义:int bb[8];。则以下表达式中不能代表数组元素bb[1]的地址的是( )$qt$, option_json = $qt${"A":"&bb[0]+1","B":"&bb[1]","C":"&bb[0]+","D":"bb+1"}$qt$, analysis = $qt$&bb[0]++ 非法，不能代表地址。$qt$ where id = 372684 and not is_golden;
update t_question set stem = $qt$以下函数的功能是（）

fun (char s[], char t[]){ int i=-1;

while(i++, s[i]==t[i] && s[i]!='\0');

return (s[i]=='\0' && t[i]=='\0');}$qt$, option_json = $qt${"A":"比较串 s 和 t 的长度","B":"比较串 s 和 t 的大小","C":"比较串s和t是否相等","D":"将串1赋给串s"}$qt$, analysis = $qt$逐字符比较 s、t 是否相等。$qt$ where id = 372696 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是____。$qt$, option_json = $qt${"A":"在赋值表达式中，赋值号的右边可以是变量，也可以是任意表达式","B":"a 是实型变量，a=10 在 C 语言中是允许的，因此可以说:实型变量中可以存放整型数","C":"若有 int a = 4, b = 9; 执行了 a = b 后, a 的值已由原值改变为 b 的值, b 的值变为 0","D":"若有 int a=4,b=9; 执行了 a=b;b=a; 之后，a 的值为 9, b 的值为 4"}$qt$, analysis = $qt$赋值号右边任意表达式。$qt$ where id = 372703 and not is_golden;
update t_question set stem = $qt$有输入语句: scanf("a=%d,b=%d,c=%d",&a,&b,&c) ;为使变量 a 的值为 1，b 的值为 3，c 的值为 2，则正确的数是输入方式是 ____。（√表示回车）$qt$, option_json = $qt${"A": "132", "B": "1,3,2", "C": "a=1 b=3 c=2", "D": "a=1,b=3,c=2"}$qt$, analysis = $qt$输入形式为 a=1,b=3,c=2，故选 D。$qt$ where id = 372712 and not is_golden;
update t_question set stem = $qt$c
fun函数的功能是，通过键盘给x所指的整型数组的所有元素赋值，在下列下画线应该填写的是( )
#include 
#define N 5
void fun(int x[N])
{
 int m;
 for(m =N-1; m>=0;m--) scanf("%d",____________________);
}$qt$, option_json = $qt${"A":"&x[++m]","B":"&x[m+1]","C":"x + (m++)","D":"x + m"}$qt$, analysis = $qt$m 已由 for 递减控制，应填 x+m，故选 D。$qt$ where id = 372715 and not is_golden;
update t_question set stem = $qt$以下能正确定义一维数组的选项是____。

\text {A)int} a [ 5 ] = {0, 1, 2, 3, 4, 5 };

\text {B)char} a [ ] = {0, 1, 2, 3, 4, 5 };$qt$, option_json = $qt${"A":"int a[5]={0, 1, 2, 3, 4, 5};","B":"char a[]={0, 1, 2, 3, 4, 5};","C":"char a={'A','B','C'};","D":"int a[5]=\"0123\";"}$qt$, analysis = $qt$char a[]={0,1,2,3,4,5}; 由初值确定长度、定义合法，故选 B。$qt$ where id = 372718 and not is_golden;
update t_question set stem = $qt$以下不能正确计算代数式 ((\sin(0.5))^2)/(3) 值的 C 语言表达式是 ____。$qt$, option_json = $qt${"A":"1 / 3*\\sin (1 / 2)*\\sin (1 / 2)","B":"\\sin (0.5)*\\sin (0.5) / 3","C":"pow(sin(0.5),2)/3","D":"1 / 3.0^{*}pow(\\sin (1.0 / 2),2)"}$qt$, analysis = $qt$1/3 为整数除法得 0，A 式子恒为 0，不能正确计算 (sin0.5)²/3，故选 A。$qt$ where id = 372719 and not is_golden;
update t_question set stem = $qt$若以下选项中的变量已正确定义，则正确的赋值语句是____。$qt$, option_json = $qt${"A":"x1=26.8%3;","B":"1 + 2 = x2","C":"x3=0x12;","D":"x4=1+2=3;"}$qt$, analysis = $qt$x3=0x12; 是正确赋值语句（其余目标非法或链式赋值错误），故选 C。$qt$ where id = 372722 and not is_golden;
update t_question set stem = $qt$设有定义:float a = 2, b = 4, h = 3；以下 C 语言表达式中与代数式 (1)/(2)(a + b)^*h 的计算结果不相符的是 ____。$qt$, option_json = $qt${"A":"(a+b) *h/2","B":"(1 / 2) * (a + b) * h","C":"(a+b) *h*1/2","D":"h/2*(a+b)"}$qt$, analysis = $qt$1/2 为整数除法得 0，B 结果恒为 0，与 ½(a+b)h 不符，故选 B。$qt$ where id = 372723 and not is_golden;
update t_question set stem = $qt$在 while(!x) 语句中的!x 与下面条件表达式等价的是____。$qt$, option_json = $qt${"A":"x!= 0","B":"x=1","C":"x!=1","D":"x=0"}$qt$, analysis = $qt$!x 等价 x==0。$qt$ where id = 372725 and not is_golden;
update t_question set stem = $qt$若有以下定义,则能使值为 3 的表达式是____。

int k=7, x=12;$qt$, option_json = $qt${"A":"x% = (k% = 5)","B":"x%=(k-k%5)","C":"x%=k-k%5","D":"(x%=k)-(k%=5)"}$qt$, analysis = $qt$x%=k 得 5、k%=5 得 2，相减为 3，故选 D。$qt$ where id = 372728 and not is_golden;
update t_question set stem = $qt$判断 char 型变量 c1 是否为小写字母的正确表达式为 ____。$qt$, option_json = $qt${"A":"'a'<=c1<='z'","B":"(c1>=A)&&(c1<=z')","C":"(a'>=c1)||(z'<=c1)","D":"(c1>='a')&&(c1<='z')"}$qt$, analysis = $qt$判断 c1 为小写字母：(c1>='a')&&(c1<='z')，故选 D。$qt$ where id = 372729 and not is_golden;
update t_question set stem = $qt$若有定义语句: int a = 10; double b = 3.14; 则表达式 ‘A’ +a+b 值得类型是 ( )$qt$, option_json = $qt${"A": "char", "B": "int", "C": "double", "D": "float"}$qt$, analysis = $qt$各种类型数据混合运算时，最终结果的类型可依据以下转换规律:

\text {char -> short -> int -> long -> float -> double}$qt$ where id = 372732 and not is_golden;
update t_question set stem = $qt$以下程序的主函数中调用了在其前面定义的 fun 函数

#include<stdio.h>

main()

{double a[15],k;

k=fun(a);

则以下选项中错误的 fun 函数首部是（）$qt$, option_json = $qt${"A": "double fun(double a[15])", "B": "double fun(double *a)", "C": "double fun(double a[])", "D": "double fun(double a)"}$qt$, analysis = $qt$当一维数组名 a 作为实参时, 对应形参有三种表示形式: *a、a[]、a[N](注: N 为定义 a 数组时

## 的元素个数)$qt$ where id = 372735 and not is_golden;
update t_question set stem = $qt$____是C语言合法的常量。$qt$, option_json = $qt${"A":".45","B":"078","C":"25.6e3.4","D":"'xy'"}$qt$, analysis = $qt$.45 是合法浮点常量。$qt$ where id = 372742 and not is_golden;
update t_question set stem = $qt$以下叙述不正确的是____。$qt$, option_json = $qt${"A":"逗号运算符的运算级最低。","B":"ABC 和 abc 是两个不同的变量。","C":"若 a 和 b 类型相同，在执行 a = b 后，b 的自身值不变。","D":"‘a’ 和 “a” 是完全等价的常量。"}$qt$, analysis = $qt$'a' 是字符常量、双引号 a 是字符串常量，不等价。$qt$ where id = 372745 and not is_golden;
update t_question set stem = $qt$int x=3, y=2; 则表达式 x+=x*=y+8 的值为。$qt$, option_json = $qt${"A": "28", "B": "30", "C": "60", "D": "17"}$qt$, analysis = $qt$x*=10→30；x+=30→60。$qt$ where id = 372746 and not is_golden;
update t_question set stem = $qt$设 x = 2.7，a = 8，y = 4.9，算术表达式 x + a% 3*(int)(x + y)% 5 / 3 的值为。$qt$, option_json = $qt${"A": "2.7", "B": "3.7", "C": "4.7", "D": "4.03"}$qt$, analysis = $qt$8%3*7%5/3=1，2.7+1=3.7。$qt$ where id = 372747 and not is_golden;
update t_question set stem = $qt$执行下面语句后的结果为。

y=10; x=y++;$qt$, option_json = $qt${"A":"x = 10 ，y=10","B":"x = 11 ，y=11","C":"x = 10 ，y=11","D":"x = 11, y = 10"}$qt$, analysis = $qt$x=y++ → x=10，y=11。$qt$ where id = 372749 and not is_golden;
update t_question set stem = $qt$Char w; int x; float y; double z; 则表达式 w*x+z-y 值的数据类型是____。$qt$, option_json = $qt${"A": "double", "B": "char", "C": "int", "D": "float"}$qt$, analysis = $qt$w*x+z-y 取 double（z 最高）。$qt$ where id = 372750 and not is_golden;
update t_question set stem = $qt$以下关于运算符优先顺序的描述中正确的是____。$qt$, option_json = $qt${"A":"关系运算符 < 算术运算符 < 赋值运算符 < 逻辑与运算符","B":"逻辑与运算符＜关系运算符＜算术运算符＜赋值运算符","C":"赋值运算符 < 逻辑与运算符 < 关系运算符 < 算术运算符","D":"算术运算符＜关系运算符＜赋值运算符＜逻辑与运算符"}$qt$, analysis = $qt$赋值 < 逻辑与 < 关系 < 算术。$qt$ where id = 372753 and not is_golden;
update t_question set stem = $qt$用下列语句定义 a, b, c，然后执行 b = a、c = 'b' + b，则 b, c 的值是（）.

txt
long a=0xffffffff;
int b; char c;$qt$, option_json = $qt${"A": "0ffffff 和 0x61", "B": "-1和98", "C": "-1和97", "D": "指向同一地址"}$qt$, analysis = $qt$a 低 32 位赋给 int b 得 −1；c='b'+b=98−1=97，故选 C。$qt$ where id = 372759 and not is_golden;
update t_question set stem = $qt$若 a 是 float 型变量, b 是 unsigned 型变量, 以下输入语句中合法的是().$qt$, option_json = $qt${"A":"scanf(\"%6.2f%d\", &a, &b);","B":"scanf(\"%f%n\",&a,&b);","C":"scanf(\"%f%3o\", &a, &b);","D":"scanf(\"%f%f\",&a,&b);"}$qt$, analysis = $qt$a 用 %f、b 用 %3o（八进制）合法（%n 非输入项、%6.2f 不允许），故选 C。$qt$ where id = 372761 and not is_golden;
update t_question set stem = $qt$int a=1, b=2, c=3;

if (a > c)b = a; a = c; c = b; 则 c 的值为（）.$qt$, option_json = $qt${"A": "1", "B": "2", "C": "3", "D": "不一定"}$qt$, analysis = $qt$if 只管 b=a；a=c=3；c=b=2 → c=2。$qt$ where id = 372763 and not is_golden;
update t_question set stem = $qt$以下运算符中,优先级最高的运算符是().$qt$, option_json = $qt${"A":"?:","B":"++","C":"&&","D":","}$qt$, analysis = $qt$++ 优先级最高。$qt$ where id = 372765 and not is_golden;
update t_question set stem = $qt$int a=1, b=2, c=3; 执行语句 a=b=c; 后 a 的值是 ____.$qt$, analysis = $qt$a=b=c：c=3→b=3→a=3。$qt$ where id = 372770 and not is_golden;
update t_question set stem = $qt$假设有条件 int x=1, y=2, z=3; 则表达式 z+=x>y?++x:++y 的值是 ____.$qt$, analysis = $qt$同 371061：x>y 假取 ++y=3，z=6。$qt$ where id = 372773 and not is_golden;
update t_question set stem = $qt$对 for(表达式 1; ;表达式 3) 可理解为$qt$, option_json = $qt${"A":"for(表达式1;0;表达式3)","B":"for(表达式 1;1;表达式 3)","C":"for(表达式 1; 表达式 1; 表达式 3)\n式 3)","D":"for(表达式 1; 表达式 3; 表达"}$qt$, analysis = $qt$for(表达式1;;表达式3) 等价于 for(表达式1;1;表达式3)，故选 B。$qt$ where id = 372778 and not is_golden;
update t_question set stem = $qt$下列运算符中是 C 语言关系运算符的是$qt$, option_json = $qt${"A":"~","B":"!","C":"&","D":"!="}$qt$, analysis = $qt$!= 是 C 语言关系运算符（~ 位运算、! 逻辑、& 位运算），故选 D。$qt$ where id = 372780 and not is_golden;
update t_question set stem = $qt$下列数据中,为字符串常量的是（ ）$qt$, option_json = $qt${"A":"'A'","B":"“house”","C":"How do you do","D":"' \\abc'"}$qt$, analysis = $qt$“house”是字符串常量。$qt$ where id = 372783 and not is_golden;
update t_question set stem = $qt$若有定义:int a = 8, b = 5, c；，执行语句 c = a / b + 0.4；后，c 的值为（）$qt$, option_json = $qt${"A": "1.4", "B": "1", "C": "2.0", "D": "2"}$qt$, analysis = $qt$8/5=1，1+0.4=1.4 赋给 int 截断为 1，故选 B。$qt$ where id = 372784 and not is_golden;
update t_question set stem = $qt$设有 int x=11；则表达式 (x++*1/3) 的值为（）$qt$, option_json = $qt${"A": "3", "B": "4", "C": "11", "D": "12"}$qt$, analysis = $qt$x++ 取 11（后 x=12）：11*1/3=3，故选 A。$qt$ where id = 372785 and not is_golden;
update t_question set stem = $qt$设有语句 int a=3；则执行了语句 a+=a-=a*a ；后，变量 a 的值是 ____$qt$, option_json = $qt${"A": "3", "B": "0", "C": "9", "D": "-12"}$qt$, analysis = $qt$a-=a*a 后 a=3−9=−6；a+=(−6) 得 −12，故选 D。$qt$ where id = 372792 and not is_golden;
update t_question set stem = $qt$整型变量 X 和 Y 的值相等, 且为非 0 值, 则以下选项中, 结果为 0 的表达式是 ( ) 。$qt$, option_json = $qt${"A":"x | y","B":"x | y","C":"x&y","D":"x^y"}$qt$, analysis = $qt$x 与 y 相等非 0 时，x^y（按位异或）的结果为 0，故选 D。$qt$ where id = 372800 and not is_golden;
update t_question set stem = $qt$设有定义: float a = 2, b = 4, h = 3; 以下 C 语言表达式与代数式 (a + b) / 2 × h 计算结果不相符的是 ( )。$qt$, option_json = $qt${"A":"(1/2)*(a+b)*h","B":"h / 2*(a + b)","C":"(a + b)*h / 2","D":"(a + b)*h * 1 / 2"}$qt$, analysis = $qt$(1/2)=0 使整个表达式为 0，与原式不符。$qt$ where id = 372803 and not is_golden;
update t_question set stem = $qt$设变量 t 为 int 型，下列选项中不正确的赋值语句是（）。$qt$, option_json = $qt${"A":"++t;","B":"n1 = (n2 = (n3 = 0))","C":"k=i==m;","D":"a=b+c=1 ;"}$qt$, analysis = $qt$a=b+c=1 中 b+c 非左值。$qt$ where id = 372804 and not is_golden;
update t_question set stem = $qt$设已定义 char c[8] = "Tianjin" 和 int j, 则下面的输出函数调用中错误的是 ( )。$qt$, option_json = $qt${"A":"printf( \"%s\" ,c);","B":"for(j=0; j<8; j++) printf( \"%c\" ,c[j]);","C":"puts(c);","D":"for(j=0; j<8; j++) puts(c[j]); ```"}$qt$, analysis = $qt$puts 参数应是字符串，c[j] 是字符。$qt$ where id = 372807 and not is_golden;
update t_question set stem = $qt$设 a = 12，且 a 定义为整型变量。执行语句 a += a -= a *= a；后 a 的值为（）。$qt$, option_json = $qt${"A": "12", "B": "144", "C": "0", "D": "132"}$qt$, analysis = $qt$a*=a=144；a-=144=0；a+=0=0。$qt$ where id = 372809 and not is_golden;
update t_question set stem = $qt$设有宏定义命令:#define RES 30-5 则表达式 RES*5+30 的值为（ ）。$qt$, option_json = $qt${"A":"60","B":"35","C":"45","D":"25 解析: \\mathrm { R E S ^ { * } } 5 { + } 3 0 = 3 0 { - } 5 ^ { * } 5 { + } 3 0 = 3 0 { - } 2 5 { + } 3 0 { = } 3 5 。选 B。"}$qt$, analysis = $qt$#define RES 30-5：RES*5+30 展开为 30−5*5+30=35，故选 B。$qt$ where id = 372813 and not is_golden;
update t_question set stem = $qt$字符串 bodyCs 在内存中占用的字节数是（ ）。$qt$, option_json = $qt${"A": "3", "B": "4", "C": "6", "D": "7"}$qt$, analysis = $qt$字符串 bodyCs 含 6 个字符加结束符，共占用 7 个字节，故选 D。$qt$ where id = 372821 and not is_golden;
update t_question set stem = $qt$若变量已正确定义并赋值，下列符合 C 语言语法的表达式是（ ）。$qt$, option_json = $qt${"A":"a:=b+1","B":"int ^ { 1 8 . 5 + 3 }","C":"a{=}a{+}7{=}c{+}b","D":"\\mathsf { a } { = } \\mathsf { b } { = } \\mathsf { c } { + } \\mathsf { 2 }"}$qt$, analysis = $qt$a=b=c+2 符合 C 语言语法（链式赋值），故选 D。$qt$ where id = 372822 and not is_golden;
update t_question set stem = $qt$（ ）是合法的用户自定义标识符。$qt$, option_json = $qt${"A":"b-b","B":"float","C":"<fr>","D":"_isw"}$qt$, analysis = $qt$_isw 合法。$qt$ where id = 372824 and not is_golden;
update t_question set stem = $qt$C 语言中运算对象必须是整型的运算符是（ ）。$qt$, option_json = $qt${"A":"/","B":"%","C":"=","D":"<="}$qt$, analysis = $qt$%（取余）的运算对象必须为整型，故选 B。$qt$ where id = 372830 and not is_golden;
update t_question set stem = $qt$有输入语句: s c a n f (a= % d , b= % d , c= % d , & a , & b , & c); ;为使变量 a 为 11，b 为 12，c 为 13，则从键盘输入数据的正确形式应当是（ ）。$qt$, option_json = $qt${"A": "11 12 13", "B": "a=11,b=12,c=13", "C": "a = 11 b = 12 c = 13", "D": "11,12,13"}$qt$, analysis = $qt$输入形式为 a=11,b=12,c=13（与格式串非格式字符匹配），故选 B。$qt$ where id = 372832 and not is_golden;
update t_question set stem = $qt$若有定义 int a[3][4]，下列对数组 a 的引用中正确的是（ ）。$qt$, option_json = $qt${"A":"a [ 1 / 2 ] [ 0 ] { = } 0","B":"int\n\na[1][1]=0","C":"a[2][4]=0","D":"a[0][4]=0"}$qt$, analysis = $qt$a[1/2][0]=a[0][0] 合法。$qt$ where id = 372839 and not is_golden;
update t_question set stem = $qt$str1[20]=what\backslashn ,则 strlen(str1)的结果为（ ）。$qt$, option_json = $qt${"A": "5", "B": "6", "C": "7", "D": "0"}$qt$, analysis = $qt$what\n 共 5 字符。$qt$ where id = 372842 and not is_golden;
update t_question set stem = $qt$若要定义一个指针变量 p，并让它指向整型变量，则下列语句正确的是（ ）。$qt$, option_json = $qt${"A":"\\mathbf { f l o a t }   \\mathrm { ^ { * } p ; }   \\mathrm { i n t } \\mathrm { a ; }   \\mathrm { p { = } 8 a ; }","B":"int p, a ; ^ { * } p { = } 8 a ;","C":"int * _ { \\mathbf { p } , \\mathbf { a } ; } ^ { * } \\mathrm { p } = \\mathrm { g } a ;","D":"int ^ { * } \\mathtt { p } , \\mathtt { a } ; \\mathtt { p } { = } \\mathtt { & } \\mathtt { a } ;"}$qt$, analysis = $qt$int *p, a; p=&a; 使 p 指向整型变量（A/B/C 语句形式错误），故选 D。$qt$ where id = 372847 and not is_golden;
update t_question set stem = $qt$下列语句定义 pt 为指向 int 类型变量 t 的指针，（ ）是正确的。$qt$, option_json = $qt${"A":"int t , * \\mathrm { p t } { = } t ;","B":"int ^ { * } \\mathrm { p t } { = } \\mathrm { g } _ { \\mathrm { t } } , \\mathrm { t } ;","C":"int ^ { * } \\mathrm { p t } = \\mathrm { g t } ;","D":"int t ^ { * } \\mathrm { p t } = 0 ;"}$qt$, analysis = $qt$int *pt=&t; 定义 pt 为指向 int 变量 t 的指针，故选 C。$qt$ where id = 372848 and not is_golden;
update t_question set stem = $qt$若有定义:int x=1,^{*}p=&x; ；则语句 prinf(% d \backslash n, * p); 的输出结果是（ ）。$qt$, option_json = $qt${"A": "1", "B": "p 的地址", "C": "x 的地址", "D": "0 答案:选 A。"}$qt$, analysis = $qt$p 指向 x：*p 即 x 的值 1，故选 A。$qt$ where id = 372849 and not is_golden;
update t_question set stem = $qt$若有说明语句:int *p, a;则能通过 scanf 语句正确给输入项读入数据的程序段是（ ）。$qt$, option_json = $qt${"A":"^{*} p=8a; scanf(%d,p);","B":"p=8a;scanf(%d,p) ;","C":"^{*}p=8a;scanf(%d,^{*}p); ;","D":"p= 8 a ; scanf (% d , *p) ;"}$qt$, analysis = $qt$先使 p 指向 a 再输入：p=&a; scanf("%d",p);，故选 B。$qt$ where id = 372850 and not is_golden;
update t_question set stem = $qt$若定义 char t[10], *p=t;则在下面表达式中表示 t[1]的地址的是（ ）。$qt$, option_json = $qt${"A":"p+1","B":"^ * ( \\mathtt { p } + 1 )","C":"* _ { \\mathbf { p } + \\mathbf { 1 } }","D":"\\mathbf { & p + 1 }"}$qt$, analysis = $qt$p+1 即 &t[1]（*(p+1) 是值、&p+1 非法形式），故选 A。$qt$ where id = 372851 and not is_golden;
update t_question set stem = $qt$若 int \mathtt { a [ ] { = } { 1 , 2 , 3 , 4 , 5 } , ^ { * } p { = } a ; } ^{*}(p+3) 的值为（ ）。$qt$, option_json = $qt${"A": "2", "B": "3", "C": "4", "D": "5"}$qt$, analysis = $qt$*(p+3) 即 a[3]=4，故选 C。$qt$ where id = 372852 and not is_golden;
update t_question set stem = $qt$若已定义:int a[ ]={0,1,2,3,4,5,6,7,8,9}, *p=a, i; 其中 0≤i≤9，则对 a 数组元素不正确的引用是（ ）。$qt$, option_json = $qt${"A":"a[p-a]","B":"*(&a[i])","C":"p[i]","D":"a[10]"}$qt$, analysis = $qt$a[10] 越界（下标 0~9），是不正确的引用，故选 D。$qt$ where id = 372853 and not is_golden;
update t_question set stem = $qt$若 \mathtt { p 1 , } \mathtt { p 2 } 都是整形指针，p1 已经指向变量 x，要使 p2 也指向 x，（ ）是正确的。$qt$, option_json = $qt${"A":"\\mathtt { p 2 { = } p 1 ; }","B":"p2 = * * p1;","C":"\\mathbf { p 2 } = \\mathbf { & p 1 } ;","D":"p2 = * p1; 1"}$qt$, analysis = $qt$p2=p1 使两指针同指。$qt$ where id = 372854 and not is_golden;
update t_question set stem = $qt$若指针 p 已正确定义并指向如图所示存储单元:则执行语句 + + \mathbf { p } ; 后，*p 的值是（ ）。

a[0] a[1] a[2] a[3] a[4]
10 20 30 40 50
P$qt$, option_json = $qt${"A": "20", "C": "21 ``` ```txt", "B": "30", "D": "31 ```"}$qt$, analysis = $qt$++p 后 p 指向 a[1]，*p=20，故选 A。$qt$ where id = 372857 and not is_golden;
update t_question set stem = $qt$设 int *p, x, a[5]={1, 2, 3, 4, 5}; p=a;能使 x 的值为 3 的语句是（ ）。$qt$, option_json = $qt${"A":"x = a[3]; ;","B":"x = \\Lambda^* (p + 2) ;","C":"\\mathbf { x } = ^ { * } \\mathbf { a } ;","D":"\\mathsf{a} + + ; \\mathsf{x} = ^* (\\mathsf{a} + 1) );"}$qt$, analysis = $qt$*(a+2)=3。$qt$ where id = 372858 and not is_golden;
update t_question set stem = $qt$若要创建一个二进制文件，则在使用 fopen 打开文件时的打开方式应该是（ ）。$qt$, option_json = $qt${"A":"\"w\"","B":"\"rb+\"","C":"\"w+\"","D":"\"wb+\""}$qt$, analysis = $qt$wb+ 创建二进制文件。$qt$ where id = 372860 and not is_golden;
update t_question set stem = $qt$假设有定义: float x = 16/5/2.0, y = 16/5.0/2 ；则 x 和 y 的值分别为（ ）$qt$, option_json = $qt${"A": "1.5 1.6", "B": "1.6 1.6", "C": "1.5 1.5", "D": "1.6 1.5"}$qt$, analysis = $qt$16/5/2.0=1.5；16/5.0/2=1.6。$qt$ where id = 372865 and not is_golden;
update t_question set stem = $qt$若已定义 int a,则表达式 a=10,a+10,a++ 的值是（ ）$qt$, option_json = $qt${"A": "20", "B": "10", "C": "21", "D": "11"}$qt$, analysis = $qt$逗号表达式取末 a++=10。$qt$ where id = 372868 and not is_golden;
update t_question set stem = $qt$阅读下面的程序

c
#include
void main()
{
 int i,j;
 scanf("%3d%2d",&i,&j);
 printf("i=%d,j=%d\n",i,j);
}

如果从键盘上输入 1234567,则程序的运行结果是（ ）$qt$, option_json = $qt${"A":"123,j=4567","B":"1234,j=567","C":"\\scriptstyle { \\dot { \\mathbf { i } } } = 1 , { \\dot { \\mathbf { j } } } = 2","D":"i=123,j=45"}$qt$, analysis = $qt$%3d=123、%2d=45。$qt$ where id = 372869 and not is_golden;
update t_question set stem = $qt$设 a=1,b=2,c=3,d=4,则表达式 a<b?a:c<d?a:d 的结果是( )$qt$, option_json = $qt${"A":"4","B":"3","C":"D . 1","D":"1"}$qt$, analysis = $qt$红色解析：「解析： 基本问号表达式运算」。$qt$ where id = 372887 and not is_golden;
update t_question set stem = $qt$while(!x)中的____与下面表达式（）等价$qt$, option_json = $qt${"A":"x == 0","B":"x==1","C":"x!=5","D":"x!=0"}$qt$, analysis = $qt$while(!x) 中 !x 等价于 x==0，故选 A。$qt$ where id = 372895 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是（）

c
Mian(){
Int x= 1, y=2;
Void swap(int x,int y);
Swap(y,x);
Printf("x=%d,y=%d\n",x,y);
}
Void swap(int x ,int y)
{
Printf("x=%d,y=%d\n",x,y);
X=3,y=4;
}$qt$, option_json = $qt${"A":"X=1,Y=2 X=1,Y=2","B":"X = 1,Y = 2 X = 3,Y = 4","C":"X = 2,Y = 1 X = 3,Y = 4","D":"X = 2,Y = 1 X = 1,Y = 2"}$qt$, analysis = $qt$形参值传递：swap 内打印 x=2,y=1；主函数 x、y 不变，再打印 x=1,y=2，故选 D。$qt$ where id = 372896 and not is_golden;
update t_question set stem = $qt$在 Excel 中正确的算术运算符是____等。$qt$, option_json = $qt${"A":"+ - * / >=","B":"== <>","C":"+ - * /","D":"+ - * / &"}$qt$, analysis = $qt$Excel 算术运算符 + - * /。$qt$ where id = 372903 and not is_golden;
update t_question set stem = $qt$有以下程序段，char c[5] = ['a', b', \0', c', \0'}；

printf ("%s", c): 则运行的结果（）$qt$, option_json = $qt${"A":"'a' 'b'","B":"ab","C":"ab c","D":"'a' 'b' '\\0' 'c' '\\0'"}$qt$, analysis = $qt$char c[5]={'a','b','\0','c','\0'} 中前两个字符为 a、b；printf("%s") 遇 '\0' 结束输出 ab（选项 B），故选 B。$qt$ where id = 375683 and not is_golden;
update t_question set stem = $qt$已知二维数组 int a[3][4]; 则四个表达式中不同的一项是 ____。 A a[1]+2 B ^{*}(a+1)+2 C &a[1][2] D ^{*}(a[1]+2)$qt$, option_json = $qt${"A":"a[1]+2","B":"*(a+1)+2","C":"&a[1][2]","D":"*(a[1]+2)"}$qt$, analysis = $qt$*(a[1]+2) 是值，其余为地址。$qt$ where id = 375709 and not is_golden;
update t_question set stem = $qt$下面描述正确的是（）。$qt$, option_json = $qt${"A":"两个字符串所包含的字符个数相同时，才能比较字符串","B":"字符个数多的字符串比字符少的字符串大","C":"字符串\"STOP\"与\"stop\"相等","D":"字符串\"That\"小于字符串\"The\""}$qt$, analysis = $qt$（AI 补答）'That' 与 'The' 第二字符 'a'<'e'，故 'That' 小于 'The'，D 正确，故选 D。$qt$ where id = 376450 and not is_golden;
update t_question set stem = $qt$下列四组字符串中都可以用作 C 语言程序中的用户标识符的是( )$qt$, option_json = $qt${"A":"print_3d db8 aBc","B":"ham one half start\\it 3pai","C":"str_1 Cpp pow while","D":"Pxq My->book line# His.age"}$qt$, analysis = $qt$print_3d、db8、aBc 均可用作用户标识符（其余各组含非法字符或关键字），故选 A。$qt$ where id = 376845 and not is_golden;
update t_question set stem = $qt$下列四组字符串中都可以用作 C 语言程序中的标识符的是（）。$qt$, option_json = $qt${"A":"print _3d\n\ndb8 aBc","B":"I\\am one_half\n\nstart\\it 3pai","C":"str_1 Cpp\n\npow while","D":"Pxq My->book\n\nline# His.age"}$qt$, analysis = $qt$print_3d、db8、aBc 均可用作用户标识符（其余各组含非法字符或关键字），故选 A。$qt$ where id = 377069 and not is_golden;
update t_question set stem = $qt$已知: x = y = z = 4; 执行语句: x = y = = z; 后, x 的值为 ____。$qt$, analysis = $qt$y==z 即 4==4 为真（值 1），赋给 x 后 x=1，故填 1。$qt$ where id = 377362 and not is_golden;
update t_question set stem = $qt$执行语句 \mathsf { c h a r } \; \mathsf { s t r } [ 8 1 ] { = } \mathsf { a b c d e f } ；后，字符串 str 结束标志存储在 str[ _]。$qt$, analysis = $qt$6 个字符后 str[6] 存 '\0'。$qt$ where id = 377563 and not is_golden;
update t_question set stem = $qt$若有以下定义下:

#define E 5

int A=16;double B = 5.5; char C='A':

则下列语句中正确的是()。$qt$, option_json = $qt${"A":"(A + B) + +","B":"B = A + 0","C":"++C=A+1=E","D":"E++"}$qt$, analysis = $qt$B = A + 0 合法（double 可接收 int）；(A+B)++、E++（常量自增）、++C=A+1=E（给常量赋值）均非法，故选 B。$qt$ where id = 377614 and not is_golden;
update t_question set stem = $qt$已知:char str1[10],str2[10]={"books"};则在程序中能够将字符串"books"赋给数组 str1 的正确语句是（）。$qt$, option_json = $qt${"A":"str1 = {\"Books};","B":"strcpy (str1,str2);","C":"str1 = str2;","D":"strcpy (str2,str1);"}$qt$, analysis = $qt$字符串赋值用 strcpy(str1,str2);。$qt$ where id = 377658 and not is_golden;
update t_question set stem = $qt$若有 int ⅰ=10，j=0；则执行完语句:if (j=0) i++; else i--; i 的值为 11。 （$qt$, analysis = $qt$j=0 使 if 条件为假，执行 else 的 i--，i 的值为 9 而非 11，故该说法错误。$qt$ where id = 377986 and not is_golden;
update t_question set stem = $qt$语句 x - = y + 8 等价于 x = x - y + 8。（）$qt$, analysis = $qt$x-=y+8 等价于 x=x-(y+8)，不是 x=x-y+8，故该说法错误。$qt$ where id = 378055 and not is_golden;
update t_question set stem = $qt$设 a = 2, b = 3, x = 3.5, y = 2.5，则 (float) (a + b)/2 + (int) x% (int) y 为（）$qt$, option_json = $qt${"A": "3", "B": "3.0", "C": "3.5", "D": "2.5"}$qt$, analysis = $qt$(float)(a+b)/2=2.5，(int)x%(int)y=3%2=1，合计 3.5，故选 C。$qt$ where id = 378063 and not is_golden;
update t_question set stem = $qt$以下正确的函数形式是 ____。$qt$, option_json = $qt${"A":"double fun(int x,int y){\n z=x+y;\n return z;\n}","B":"fun(int x,y){\n int z;\n return z;\n}","C":"fun(x,y){\nint x,y;\ndouble z; z=x+y\nreturn z;\n}","D":"double fun(int x,int y){\n double z;\n z=x+y;\n return z;\n}"}$qt$, analysis = $qt$double fun(int x,int y){ double z; z=x+y; return z; } 形式正确（A 未定义 z、B 形参无类型、C 形参声明位置错），故选 D。$qt$ where id = 378084 and not is_golden;
update t_question set stem = $qt$tt\a 是一个不合法的标识符（）$qt$, analysis = $qt$标识符只能由字母、数字和下划线组成，不能含 ，「tta」不合法，故该说法正确。$qt$ where id = 378101 and not is_golden;
update t_question set stem = $qt$下列选项中合法的字符常量是（）。$qt$, option_json = $qt${"A":"\"X\"","B":"'X'","C":"'abC'","D":"\"56\""}$qt$, analysis = $qt$合法字符常量是 'X'（"X"、"56" 为字符串、'abC' 为多字符常量），故选 B。$qt$ where id = 378117 and not is_golden;
update t_question set stem = $qt$下列字符常量,不合法的是____。$qt$, option_json = $qt${"A":"'x41'","B":"“t","C":"'\\t'","D":"'\\101'"}$qt$, analysis = $qt$“t 不合法（引号不对）。$qt$ where id = 378128 and not is_golden;
update t_question set stem = $qt$C语句 x* = y + 2；还可以写成（）$qt$, option_json = $qt${"A":"x = x*y + 2;","B":"y=x=2+y*x","C":"x = x*(y + 2)","D":"x=y+2*x ;"}$qt$, analysis = $qt$x*=y+2 即 x=x*(y+2)。$qt$ where id = 378139 and not is_golden;
update t_question set stem = $qt$有定义语句:int a = 1, b = 2, c = 3, x，则以下选项中各程序段执行后，x 的值不等于 3 的是 ____。$qt$, option_json = $qt${"A":"if(c<3)x=1; else if(b<2)x=2; else x=3;","B":"if(a<2)x=3; else if(a<1)x=2; else x=1;","C":"if(a<3)x=3; if(a<2)x=2; if(a<1)x=1;","D":"if(a<2)x=b; if(b<3)x=c; if(c<1)x=a;"}$qt$, analysis = $qt$C 段 x=2 ≠3。$qt$ where id = 378142 and not is_golden;
update t_question set stem = $qt$以下非法的赋值语句是（）$qt$, option_json = $qt${"A":"n = (i = 2, ++i);","B":"j++;","D":"x = j > 0;","C":"++(i+1);"}$qt$, analysis = $qt$++ 的操作数必须是变量（左值），++(i+1) 非法；其余均为合法语句，故选 C。$qt$ where id = 378149 and not is_golden;
update t_question set stem = $qt$设有如下定义:

struct sk
{ int a;
float b;
}data;
int *p;

若要使P指向data中的a域，正确的赋值语句是$qt$, option_json = $qt${"A":"p=&a;","B":"p=data.a;","C":"p=&data.a;","D":"*p=data.a;"}$qt$, analysis = $qt$使 p 指向 data 中的 a 域：p=&data.a;（选项 C），故选 C。$qt$ where id = 378740 and not is_golden;
update t_question set stem = $qt$下列不正确的定义是（ ）。$qt$, option_json = $qt${"A":"int *p=&i, i;","B":"int *p, i;","C":"int i, *p=&i;","D":"int i, *p;"}$qt$, analysis = $qt$int *p=&i, i; 在声明 p 时用 &i 初始化，而 i 尚未声明，定义不正确，故选 A。$qt$ where id = 378741 and not is_golden;
update t_question set stem = $qt$若有说明语句 “int a[5], *p=a;”，则对数组元素的正确引用是（）。$qt$, option_json = $qt${"A":"a[p]","B":"p[a]","C":"*(p + 2)","D":"p+2"}$qt$, analysis = $qt$对数组元素的正确引用是 *(p+2)（选项 C），故选 C。$qt$ where id = 378743 and not is_golden;
update t_question set stem = $qt$在 C 语言中，以作为字符串结束标志$qt$, option_json = $qt${"A":"'\\n'","B":"' ,'","C":"' 0'","D":"'\\0'"}$qt$, analysis = $qt$C 语言中以 '\0' 作为字符串结束标志（选项 D），故选 D。$qt$ where id = 378744 and not is_golden;
update t_question set stem = $qt$下列数据中属于“字符串常量”的是（）。$qt$, option_json = $qt${"A":"“a”","B":"{ABC}","C":"'abc\\0'","D":"'a'"}$qt$, analysis = $qt$属于“字符串常量”的是 "a"（'a' 为字符常量、'abc\0' 非法），故选 A。$qt$ where id = 378745 and not is_golden;
update t_question set stem = $qt$若 short a = 1000; char b='A'; long c; c=a+b; 则C的值是()$qt$, option_json = $qt${"A": "1000", "B": "100A", "C": "1065", "D": "-1065"}$qt$, analysis = $qt$short a=1000、char b='A'(65)：c=a+b=1065（选项 C），故选 C。$qt$ where id = 378806 and not is_golden;
update t_question set stem = $qt$设 a = 2, b = 3, x = 3.5, y = 2.5，则 (float) (a + b)/2 + (int) x% (int) y 为（）$qt$, option_json = $qt${"A": "3", "B": "3.0", "C": "3.5", "D": "2.5"}$qt$, analysis = $qt$(float)(a+b)/2=2.5，(int)x%(int)y=3%2=1，合计 3.5（选项 C），故选 C。$qt$ where id = 378807 and not is_golden;
update t_question set stem = $qt$下列四组选项中，均是合法转义字符的选项是（）。$qt$, option_json = $qt${"A":"'\\)', '\\)', '\\n'","B":"\\', '\\017', \"\\'\"","C":"\\'018', \\\"f\", '\\xab'","D":"'\\10', '\\101', '\\1f'"}$qt$, analysis = $qt$合法转义字符组为 '\10'、'\101'、'\1f'（八进制转义，选项 D），故选 D。$qt$ where id = 378820 and not is_golden;
update t_question set stem = $qt$设有:int a=1, b=2, c=3, d=4, m=2, n=2；执行 (m=a>b) && (n=c>d) 后 n 的值为（）。$qt$, option_json = $qt${"A": "1", "B": "2", "C": "3", "D": "4"}$qt$, analysis = $qt$```txt
(m=a>b)&&(n=c>d)
= (m=1>2) &&(n=c>d)
= 0&&&(n=c>d) 出现短路了,所以 n=c>d 不会被执行
n 还是原来的值,2.
```$qt$ where id = 378826 and not is_golden;
update t_question set stem = $qt$已知 int x=10, y=20, z=30; 以下语句执行后 x, y, z 的值是() if (x>y) z=x, x=y; y=z;$qt$, option_json = $qt${"A":"x = 10 ， y = 20 ， z = 30","B":"x = 20 ， y = 30 ， z = 30","C":"x = 10 ， y = 30 ， z = 30","D":"x = 20 ， y = 30 ， z = 20"}$qt$, analysis = $qt$if(x>y)

z=x, x=y;

y=z;

先执行 10>20，不满足条件，不执行 z=x,x=y;

然后再执和 y=z=30;

x, z 的值没有变化。$qt$ where id = 378827 and not is_golden;
update t_question set stem = $qt$C 语句“ x^{*}=y+2 ；”还可以写成()$qt$, option_json = $qt${"A":"x=x*y+2;","B":"x=2+y*x;","C":"x = x^{*}(y + 2);","D":"x=y+2*x;"}$qt$, analysis = $qt$x*=y+2 即 x=x*(y+2)。$qt$ where id = 378831 and not is_golden;
update t_question set stem = $qt$已知int x=10,y=20,z=30;以下语句执行后x,y,z的值是()

if(x>y) z=x, x=y; y=z;

-$qt$, option_json = $qt${"A":"x = 10, y = 20, z = 30","B":"x=20, y=30, z=30","C":"x=10, y=30, z=30","D":"x = 20, y = 30, z = 20 正确答案:C"}$qt$, analysis = $qt$javascript if(x>y) z=x, x=y; y=z; 先执行 10>20，不满足条件，不执行z=x,x=y; 然后再执和y=z=30; x，z的值没有变化。$qt$ where id = 378839 and not is_golden;
update t_question set stem = $qt$设 a 、 b 、 c 为整型数, 且 a = 2 、 b = 3 、 c = 4, 则执行完以下语句: a^{*} = 16 + (b++) - (++c); 后, a 的值是( )$qt$, option_json = $qt${"A": "28", "B": "32", "C": "31", "D": "34"}$qt$, analysis = $qt$16+(b++)-(++c)=14，a*=14 → 28。$qt$ where id = 378846 and not is_golden;
update t_question set stem = $qt$已知 int x=10, y=20, z=30; 以下语句执行后 x, y, z 的值是( )。

\text {if} (x > y)

z = x; x = y; y = z;$qt$, option_json = $qt${"A":"x = {10},y = {20},z = {30}","B":"x = 20, y = 30, z = 30","C":"x = 20, y = 30, z = 10","D":"x = 20, y = 30, z = 20"}$qt$, analysis = $qt$x>y 为假，仅执行 x=y、y=z：x=20,y=30,z=30（选项 B），故选 B。$qt$ where id = 378847 and not is_golden;
update t_question set stem = $qt$执行下列语句后 a 的值为( ),b 的值为( )。

\text {int} a, b, c;

a = b = c = 1;

| + + a | | + + b & & + + c;$qt$, option_json = $qt${"A": "1 1", "B": "2 2", "C": "2 1 D/1 1"}$qt$, analysis = $qt$(++a) 真短路 ++b → a=2,b=1。$qt$ where id = 378848 and not is_golden;
update t_question set stem = $qt$以下定义语句中正确的是()$qt$, option_json = $qt${"A":"int a=b=1;","B":"char A=65+1,b='b';","C":"int arr[1]=1;","D":"double a=0.0 ; b=1.1;"}$qt$, analysis = $qt$char A=65+1,b='b'; 正确。$qt$ where id = 378850 and not is_golden;
update t_question set stem = $qt$以下选项中,非法的字符常量是( )。$qt$, option_json = $qt${"A":"'\\t'","B":"'\\17'","C":"\"n\"","D":"'\\xaa'"}$qt$, analysis = $qt$"n" 是字符串不是字符常量。$qt$ where id = 378857 and not is_golden;
update t_question set stem = $qt$设 a,b,c 为整型数,且 a = 2,b = 3,c = 4 ,则执行完以下语句: a^{*} = {16} + ( {b + + }) - ( {+ + c}) ；后， a 的值是()

|$qt$, option_json = $qt${"A": "28", "B": "32", "C": "31", "D": "34"}$qt$, analysis = $qt$同 378846：a=28。$qt$ where id = 378863 and not is_golden;
update t_question set stem = $qt$已知 int x=10, y=20, z=30; 以下语句执行后 x, y, z 的值是( )。

if(x>y)

z = x; x = y; y = z;$qt$, option_json = $qt${"A":"x = 10,y = 20,z = 30","B":"x=20, y=30, z=30","C":"x = 20,y = 30,z = 10","D":"x = 20,y = 30,z = 20"}$qt$, analysis = $qt$if 条件为假仅执行 x=y、y=z，结果 x=20,y=30,z=30（选项 B），故选 B。$qt$ where id = 378864 and not is_golden;
update t_question set stem = $qt$以下关于引用头文件描述，正确的是（）。$qt$, option_json = $qt${"A":"只能使用<>来引用头文件","B":"只能使用\"\"来引用头文件","C":"<>和\"\"都可以用来引用头文件","D":"<>优先去当前目录下找"}$qt$, analysis = $qt$<>和""都可以用于头文件引用， <>优先去标准库（系统目录）里找；""优先在项目所属于目录(当前目录)下找，如果没有再去系统目录下找。$qt$ where id = 378866 and not is_golden;
update t_question set stem = $qt$以下是正确 C 语言标识符的是____。$qt$, option_json = $qt${"A":"-3","B":"#3","C":"&3","D":"_3"}$qt$, analysis = $qt$_3 合法。$qt$ where id = 378870 and not is_golden;
update t_question set stem = $qt$以下程序段中，与语句:k=a>b?(b>c?1:0):0;功能相同的是____。$qt$, option_json = $qt${"A":"if((a>b)&&(b>c)) k=1;     else k=0;","C":"if(a<=b) k=0;     else if(b<=c) k=1;","B":"if((a>b)||(b>c)) k=1;     else k=0;","D":"if(a>b) k=1     else if(b>c) k=1; else k=0;"}$qt$, analysis = $qt$k=a>b?(b>c?1:0):0 等价于 if((a>b)&&(b>c)) k=1; else k=0;（选项 A），故选 A。$qt$ where id = 378872 and not is_golden;
update t_question set stem = $qt$以下定义语句中，错误的是____。$qt$, option_json = $qt${"A":"int b[] = {1,0,2};","B":"char ch;","C":"char c[]=\"word\";","D":"short m =3;a[m];"}$qt$, analysis = $qt$a未声明，D错误。$qt$ where id = 378874 and not is_golden;
update t_question set stem = $qt$设有定义:int a[10]={0,1,2,3,4,5,6,7,8,9},i,, 若

0 <=slant i <=slant 9, 则对 a 数组元素的引用可能存在错误的是 ____$qt$, option_json = $qt${"A": "a[a[i]]", "B": "a[i]", "C": "a[a[i]+a[i]]", "D": "a[9]"}$qt$, analysis = $qt$选项A，当i=9时， a[i]=a[9]=9;a[a[i]]=a[a[9]]=a[9]=9; 当i=0，a[i]=a[0]=0;a[a[i]]=a[a[0]]=a[0]=0;.... 选项B， 当i =[0,9]; a[i]即 a[0]~a[9] 选项C, 当i = 9时， a[i]=a[9]=9, a[a[i]+a[i]] = a[a[9]+a[9]]=a[9+9]=a[18]，下标越界。 选项C，a[9]=9; ### 二、判断题$qt$ where id = 378875 and not is_golden;
update t_question set stem = $qt$设有定义:int a[10] ={0,1,2,3,4,5,6,7,8,9}, 若 0 <=slant i <=slant 9, 则对 a 数组元素的引用可能存在错误的是 ____。$qt$, option_json = $qt${"A":"a[a[i]]","B":"a[i]","C":"a[a[i] + a[i]]","D":"a[9]"}$qt$, analysis = $qt$选项A，当i=9时， a[i]=a[9]=9;a[a[i]]=a[a[9]]=a[9]=9; 当i=0，a[i]=a[0]=0;a[a[i]]=a[a[0]]=a[0]=0;.... 选项B， 当i =[0,9]; a[i]即 a[0]~a[9] 选项C, 当i = 9时， a[i]=a[9]=9, a[a[i]+a[i]] = a[a[9]+a[9]]=a[9+9]=a[18]，下标越界。 选项C，a[9]=9; ### 二、判断题$qt$ where id = 378920 and not is_golden;
update t_question set stem = $qt$下列字符常量,不合法的是____。$qt$, option_json = $qt${"A":"'\\x41'","B":"“t”","C":"&&","D":"!="}$qt$, analysis = $qt$“t”是字符串常量而非字符常量（'\x41' 为合法字符常量），故选 B。$qt$ where id = 378925 and not is_golden;
update t_question set stem = $qt$若有以下定义下:

#define E 5

int A=16; double B = 5.5; char C='A';

则下列语句中正确的是（）$qt$, option_json = $qt${"A":"(A+B) ++","B":"B = A + +","C":"++C=A+1=E","D":"E++"}$qt$, analysis = $qt$B = A + 0 合法；(A+B)++、E++（常量自增）、++C=A+1=E（给常量赋值）均非法，故选 B。$qt$ where id = 378928 and not is_golden;
update t_question set stem = $qt$以下关于引用头文件描述，正确的是（）$qt$, option_json = $qt${"A":"只能用<>来引用头文件","B":"只能使用“”来引用头文件","C":"<>和“”都可以来引用头文件","D":"<>优先到目录里寻找"}$qt$, analysis = $qt$<>和""都可以用于头文件引用， <>优先去标准库（系统目录）里找；""优先在项目所属于目录(当前目录)下找，如果没有再去系统目录下找。$qt$ where id = 378950 and not is_golden;
update t_question set stem = $qt$main(）

{ \begin{array}{l} int x =023 ; \end{array} .

prift ( % d \backslash n^{\prime \prime}, -- x );}$qt$, option_json = $qt${"A": "17", "B": "18", "C": "23", "D": "24"}$qt$, analysis = $qt$（AI 补答）023 是八进制即 19，前置自减得 18，故选 B。$qt$ where id = 378953 and not is_golden;
update t_question set stem = $qt$while(!x)中的!x与下面表达式 (  ) 等价$qt$, option_json = $qt${"A":"x==0","B":"x==1","C":"x!=5","D":"x!=0"}$qt$, analysis = $qt$原图选项 D 写作「D.x! =0」（! 与 = 间有空格），按图保留。$qt$ where id = 379152 and not is_golden;
update t_question set stem = $qt$数学关系式 x<=y<=z 可以用 c 语言的表达式表示为 (  )$qt$, option_json = $qt${"A":"(x<=y) &&(y<=z)","B":"(x<=y) and(y<=z)","C":"(x<=y <=z)","D":"(x<=y)"}$qt$, analysis = $qt$原图选项 D 折行为「D. (x<=y)」「&(y<=z)」。本图上半页仅见题干与答案标注 (A)，选项在图片下半页。$qt$ where id = 379155 and not is_golden;
update t_question set stem = $qt$tta 是一个不合法的标识符$qt$, analysis = $qt$标识符不能含  字符，「tta」不合法，故该说法正确。$qt$ where id = 379185 and not is_golden;
update t_question set stem = $qt$下列定义变量的语句错误的是$qt$, option_json = $qt${"A":"int _int;","B":"double int_;","C":"char For;","D":"float US;"}$qt$, analysis = $qt$float US; 中  不是合法标识符字符，定义语句错误（选项 D），故选 D。$qt$ where id = 379245 and not is_golden;
update t_question set stem = $qt$设变量均已正确定义，若要通过
scanf("%d%c%d%c", &a1,&c1,&a2,&c2);语句为变量
a1 和 a2 赋数值 10 和 20，为变量 c1 和 c2 赋字符 X 和 Y。以下所示的输入形式中正
确的是（注： □代表空格字符）$qt$, option_json = $qt${"A":"10□X□20□Y<回车>","B":"10□X20□Y<回车>","C":"10□X<回车>\n20□Y<回车>","D":"10X<回车>\n20Y<回车>"}$qt$, analysis = $qt$原图题干「正确的」被折行分印为「正」「确的是」；选项 A/B 位于下边缘仅上半可见，文字按可见部分抄录，uncertain: true。$qt$ where id = 379269 and not is_golden;
update t_question set stem = $qt$设变量 m 为 float 类型，变量 n 为 int 类型，则以下能实现将 m 中的数值保留小数点后两位，第三位进行五入运算的表达式是____。$qt$, option_json = $qt${"A":"n=m*100+0.5 , m=n/100.0","B":"m=(m*100+0.5)/100.0","C":"n=m/100+0.5, m=n*100.0","D":"m=m*100+0.5/100.0"}$qt$, analysis = $qt$保留两位小数并第三位四舍五入：n=m*100+0.5, m=n/100.0（选项 A），故选 A。$qt$ where id = 379334 and not is_golden;
update t_question set stem = $qt$若变量 a 是 int 类型，并执行了语句: a = 'A' + 1.6 ;，则正确叙述是____。$qt$, option_json = $qt${"A":"a的值是字符C","B":"a的值是浮点型","C":"不允许字符型和浮点型相加","D":"a 的值是字符'A'的 ASCII 值加上 1"}$qt$, analysis = $qt$'A'+1.6=66.6 → 66 = 'A'+1。$qt$ where id = 379335 and not is_golden;
update t_question set stem = $qt$在 C 语言中,以下（）全是双目运算的符$qt$, option_json = $qt${"A":"!,+,-,||,%","B":"--,++,&&,||","C":"*,|,<<,%","D":"~,!,/,*"}$qt$, analysis = $qt$*,|,<<,% 全是双目运算符。$qt$ where id = 379337 and not is_golden;
update t_question set stem = $qt$若有定义语句：int x=10;，则表达式 x-=x+x 的值为 ____。$qt$, analysis = $qt$由于赋值运算符按"自右至左"的结合顺序，所以先计算"x+x"为 20，再计算"x-=20"，相当于"x=x-20"，所以最后结果是-10。$qt$ where id = 379343 and not is_golden;
update t_question set stem = $qt$若有定义：double x;，则表达式： x=0,x+10,x+1 值是____$qt$, option_json = $qt${"A": "11.0", "B": "10.0", "C": "0.0", "D": "1.0"}$qt$, analysis = $qt$逗号表达式 (x=0,x+10,x+1) 的值为最后一个表达式 x+1=1.0（选项 D），故选 D。$qt$ where id = 379353 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main(){ int a;

a = (\text {int}) 1. 9 9 * 3;

\operatorname{printf} (% d \backslash n, a)

}
程序的运行结果是____。$qt$, analysis = $qt$(int)1.99*3=1*3=3。$qt$ where id = 379358 and not is_golden;
update t_question set stem = $qt$设 a, b, c 已定义为整型变量，以下选项中不正确的赋值表达式是____。$qt$, option_json = $qt${"A":"a = 3 = (b = 2) = 1 :","B":"a = (b = 0)*c + 1;","C":"a = b = c / 1.0;","D":"a = 10% (b = c = 2);"}$qt$, analysis = $qt$赋值表达式的形式为:变量名=表达式。赋值号的左边必须是一个代表某一存储单元的变量名，赋值号的右边必须是 C 语言中合法的表达式。由于选项 A 中"(b=2)=1"赋值运算符左边"(b=2)"不是变量，而是表达式，所以选项 A 不正确。所以本题答案选 A。$qt$ where id = 379359 and not is_golden;
update t_question set stem = $qt$设有定义:int x=7,y=12;，则以下表达式值为 3 的是____。$qt$, option_json = $qt${"A":"(y%=x)-(x%=5)\na=4","B":"y%= (x%=5)\na=3","C":"y%= x-x%b\na=3.5","D":"y%= (x-x%5)\na=2"}$qt$, analysis = $qt$(y%=7)-(x%=5)=5-2=3。$qt$ where id = 379360 and not is_golden;
update t_question set stem = $qt$设 a = 2, b = 3, x = 3.5, y = 2.5，则 (float) (a + b)/2 + (int) x% (int) y 为（）$qt$, option_json = $qt${"A":"3","B":"3.0","C":"3.5","D":"2.5\nprintf(\"%2d,%2d\\n\",x,y);\n}"}$qt$, analysis = $qt$(float)(a+b)/2=2.5，(int)x%(int)y=3%2=1，合计 3.5（选项 C），故选 C。$qt$ where id = 379362 and not is_golden;
update t_question set stem = $qt$以下选项中, 当 x 为大于 1 的奇数时, 值为 0 的表达式是____。$qt$, option_json = $qt${"A": "x%2==1", "B": "x/2", "C": "x%2!=0", "D": "x%2==0"}$qt$, analysis = $qt$x 为大于 1 的奇数时 x%2==0 恒为假（值 0）（选项 D），故选 D。$qt$ where id = 379364 and not is_golden;
update t_question set stem = $qt$设有定义:float a = 2, b = 4, h = 3，以下 C 语言表达式中与代数式 1/2(a + b)h 计算结果不相符的是 ____。$qt$, option_json = $qt${"A":"(a+b)*h/2","B":"(1/2)*(a+b)*h","C":"(a+b)*h*1/2","D":"h/2*(a+b)"}$qt$, analysis = $qt$(1/2)*(a+b)*h 中 1/2 为整数除法得 0，结果恒为 0，与 ½(a+b)h 不相符（选项 B），故选 B。$qt$ where id = 379365 and not is_golden;
update t_question set stem = $qt$设 n = {10},i = 4 ,则赋植运算 n% = i + 1 执行后, n 的值是( )。$qt$, option_json = $qt${"A": "0", "B": "3", "C": "2", "D": "1"}$qt$, analysis = $qt$10%(4+1)=0。$qt$ where id = 379372 and not is_golden;
update t_question set stem = $qt$设有定义:int k=0; 表达式 k++ 与 k+-1 的值是相同的。$qt$, analysis = $qt$B：k++值为0、k+=1值为1，不同。$qt$ where id = 379374 and not is_golden;
update t_question set stem = $qt$若有定义语句:int a = 10 ;double b=3.14, 则表达式'A'+a+b 值的类型是____。$qt$, analysis = $qt$char+int+double 提升为 double。$qt$ where id = 379376 and not is_golden;
update t_question set stem = $qt$假定 X 和 Y 为 double 型，则表达式 X = 2, Y = X + 3/2 的值是 ____。（小数只保留一位）$qt$, analysis = $qt$3/2=1（整除），Y=2+1=3.0。$qt$ where id = 379377 and not is_golden;
update t_question set stem = $qt$有以下程序

# \text {include} < \text {stdio.h}

\text {main} () {\text {int} a = 3;

\text {printf} (% d \backslash n, (a + = a - = a * a));

}
程序运行后的输出结果是____。$qt$, analysis = $qt$a-=a*a 后 a=-6；a+=a 后 a=-12（输出 -12）。$qt$ where id = 379381 and not is_golden;
update t_question set stem = $qt$有以下程序段
int a=3, b;
b=a+3;
{ int c=2; a*=c+1;}
printf("%d\n",a) ;$qt$, option_json = $qt${"A":"这段程序的输出是9","B":"这段程序中存在有语法错误的语句","C":"这段程序的输出是7","D":"可执行语句 b = a + 3; 后，不能再定义变量 c"}$qt$, analysis = $qt$a*=c+1=3*3=9。$qt$ where id = 379386 and not is_golden;
update t_question set stem = $qt$有以下程序

\text {main} ()

{char a1='M',a2='m';
printf("%c\n",(a1,a2));
}$qt$, option_json = $qt${"A": "程序输出大写字母M", "B": "程序输出小写字母 m", "C": "格式说明符不足，编译出错", "D": "程序运行时产生出错信息"}$qt$, analysis = $qt$(a1,a2) 取 a2='m'。$qt$ where id = 379388 and not is_golden;
update t_question set stem = $qt$有以下程序

# \text {include} < \text {stdio.h} >

main(){ int a=5,b=1,t;
 t=(a<<2)||b;printf("%d\n",t);
}
程序运行后的输出结果是____。$qt$, analysis = $qt$(a<<2)||b 即 20||1：20 非零为真、逻辑或短路，t=1，故填 1。$qt$ where id = 379389 and not is_golden;
update t_question set stem = $qt$a = b = 58 是正确的赋值语句。$qt$, analysis = $qt$A：a=b=58右结合，是合法赋值语句。$qt$ where id = 379390 and not is_golden;
update t_question set stem = $qt$设 a 、 b 都是 int 型变量, 且都被赋值。现在 a+=b; b=a-b; a=a-b;该系列语句功能仅是相互赋值运算。$qt$, analysis = $qt$这三句（a+=b;b=a-b;a=a-b）实现的是交换 a、b 的值，不是单纯的相互赋值，故该说法错误。$qt$ where id = 379392 and not is_golden;
update t_question set stem = $qt$设 ch 是 char 型变量，其值为 A，且有下面的表达式 ch=(ch>='A' &&ch<='Z')?(ch+32):ch;
上面语句中 ch 的值是 ____。(引号不用填写)$qt$, analysis = $qt$'A' 是大写字母，表达式取 ch+32=97，即字符 a（引号不填），故填 a。$qt$ where id = 379394 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main(){ int a,b,k;
k=1,m=8;
a = / * k - m; b + = m;
printf("%d ",a); printf("%d\n",b);
}
编译时编译器提示错误信息，你认为出错的语句是____。$qt$, analysis = $qt$a=/*k-m;——/* 被当作注释开始，属语法错误。$qt$ where id = 379398 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main(){ int c,d;

\dot {c} = 1 0 \mid 5; d = 1 0 + 5;

\operatorname{printf} (^ {\prime \prime} % d, % d \backslash n ^ {\prime \prime}, c, d)

}
程序的运行结果是____。
}
程序运行后的输出结果是____。$qt$, analysis = $qt$10|5=15（按位或）；d=15；输出 15,15。$qt$ where id = 379400 and not is_golden;
update t_question set stem = $qt$有如下程序
#include <stdio.h>
main(){
int a = 16, b;
b = (a >> 2)% 2;
printf("%d,%d\n", a, b);
程序运行后的输出结果是____。$qt$, analysis = $qt$16>>2=4，4%2=0；输出 16,0。$qt$ where id = 379401 and not is_golden;
update t_question set stem = $qt$若想通过键盘输入, 使得 a1 的值为 12 , a2 的值为 34 , c1 的值为字符 a, c2 的值为字符 b, 程序输出结果是: 12,a,34,b 则正确的输入格式是 (以下 \sqcup 代表空格, <CR>代表回车) ____。$qt$, option_json = $qt${"A":"12a34b<CR>","B":"12LlaL34Lb<CR>","C":"12,a,34,b<CR>","D":"12L|a34L|b<CR>"}$qt$, analysis = $qt$输入 12a34b。$qt$ where id = 379405 and not is_golden;
update t_question set stem = $qt$当变量 c 的值不为 2、4、6 时，值也为“真”的表达式是____。$qt$, option_json = $qt${"A":"(c==2)||(c==4)||(c==6)","B":"(c>=2&&c<=6)||(c!=3)||(c!=5)","C":"(c>=2&&c<=6)&&!(c%2)","D":"(c>=2&&&c<=6)&&(c%2!=1)"}$qt$, analysis = $qt$（AI 补答）c!=3 与 c!=5 至少一真，B 对任意 c 恒真，故选 B。$qt$ where id = 379422 and not is_golden;
update t_question set stem = $qt$有如下嵌套的 if 语句
if(a<b)

\begin{array}{l} \text {if (a < c) k = a ;} \ \text {else k = c ;} \end{array}

else

\begin{array}{l} \text {if(b < c) k = b;} \ \text {else k = c;} \end{array}

以下选项中与上述 if 语句等价的语句是$qt$, option_json = $qt${"A": "k=(a<b)?a:b;k=(b<c)?b:c;", "B": "k=(a<b)?((b<c)?a:b):((b>c)?b:c);", "C": "k=(a<b)?((a<c)?a:c):((b<c)?b:c);", "D": "k=(a<b)?a:b;k=(a<c)?a:c;"}$qt$, analysis = $qt$本题是[if嵌套](https://zhida.zhihu.com/search?content_id=180764522&content_type=Article&match_order=1&q=if%E5%B5%8C%E5%A5%97&zhida_source=entity)与三目运算嵌套等价转换，if …else…可以用一个表达式1？表达式2：表达式3；来转换，if后面还有嵌套一个if…else…可以再使得？：转换。，放位置放于表达式2位置。else后面的也转换一个，放于表达式3位置。$qt$ where id = 379425 and not is_golden;
update t_question set stem = $qt$表示关系式 x <=slant y <=slant z 的 C 语言表达式的是 ____。$qt$, option_json = $qt${"A":"(x<=y<=z)","B":"(x<=y)\\parallel(y<=z)","C":"(x<=y)&&(y<=z)","D":"(x<=y)!(y<=z)"}$qt$, analysis = $qt$表示关系式x≤y≤z在C语言中可表示为：(x<=y)&&(y<=z)。$qt$ where id = 379426 and not is_golden;
update t_question set stem = $qt$对于浮点变量 x 和 y，表达式:x == y 是非法的，会出编译错误。$qt$, analysis = $qt$B：浮点相等比较合法。$qt$ where id = 379428 and not is_golden;
update t_question set stem = $qt$以下不可以做为 case 后面值的是 ( )$qt$, option_json = $qt${"A":"'a'","B":"0","C":"2,2","D":"'A'"}$qt$, analysis = $qt$case 后不能是'2,2'逗号表达式。$qt$ where id = 379446 and not is_golden;
update t_question set stem = $qt$以下与数学表达式“0<x<5 且 x≠2”不等价的言逻辑表达式是____。$qt$, option_json = $qt${"A":"0 < x && x < 5 && x!= 2","B":"x > 0 && x < 5 && x!= 2","C":"(x>0 && x<2) || (x>2 && x<5)","D":"(0<x<5) && (x!=2)"}$qt$, analysis = $qt$(0<x<5) 恒真，与题意不等价。$qt$ where id = 379450 and not is_golden;
update t_question set stem = $qt$有语句:k=x<y?(y<z?1:0):0；，以下选项中，与此语句功能相同的是____。$qt$, option_json = $qt${"A":"if(x<y) if(y<z) k=1;else k=0;","B":"if(x<y) k=0; else if(y<z) k=1;","C":"if(x<y && y<z) k=1; else k=0;","D":"if(x<y || y<z) k=1; else k=0;"}$qt$, analysis = $qt$k=x<y ?(y<z?1:0):0 表达式功能是:x<y 为真时，执行(y<z?1:0)表达式，在该表达式中，若 y<z 为真，k=1，若为假，k=0；x<y 为假时，k=0，只有选项 C 与题目中的表达式功能一样。$qt$ where id = 379467 and not is_golden;
update t_question set stem = $qt$有定义语句:int a = 1, b = 2, c = 3, x，则执行完如下代码，x 的结果____。
if (c<3) x=3;
else if (a<2) x=2;
else x=b;$qt$, analysis = $qt$行执行 c<3,条件不成立，再执行 a<2,条件成立，x=2。$qt$ where id = 379482 and not is_golden;
update t_question set stem = $qt$对于循环语句:for(i=0;i<=10;i++) { ; }下面项的叙述中错误的是$qt$, option_json = $qt${"A":"省略 i=0 ,可引起无限循环","B":"省略 i<=10, 可引起无限循环","C":"省略 i++, 可引起无限循环","D":"圆括号()内三个表达式都省略，可引起无限"}$qt$, analysis = $qt$C语言中for循环语句的一般形式为：for(表达式1;表达式2;表达式3) 语句部分。其执行过程为：表达式1首先执行且只执行一次；然后执行表达式2，通常都是一个用于判定条件的表达式，如果表达式2条件成立，就执行(需要执行的语句)；然后再执行表达式3；再判断表达式2，执行(需要执行的语句)；再执行表达式3......一直到表达式2不成立时，跳出循环。 ### 二、判断题$qt$ where id = 379495 and not is_golden;
update t_question set stem = $qt$给定程序中，函数 fun 的功能是: 将十进制正整数 m 转换成 k(2 <=slant k <=slant 9) 进制数，并按位输出。例如，若输入 8 和 2，则应输出 1000(即十进制数 8 转换成二进制表示是 1000)。请补全代码。

#include <conio.h>
#include <stdio.h>
void fun( int m, int k ){
 int aa[20], i;
 for( i = 0; m; i++ ) {
 aa[i] = ________;
 m /= k;
 }
 for(i-=1; ________; i-- )
 printf( "%d", aa[i]);$qt$, analysis = $qt$aa[i]=m%k（取余数）；倒序输出条件 i>=0。$qt$ where id = 379503 and not is_golden;
update t_question set stem = $qt$阅读以下函数
fun(char *sl,char *s2){ int i=0;

\text {while} (sl [ i ] = = s2 [ i ] & & s2 [ i ]! = ` \backslash 0 ^ {\prime}) i + +;

\text {return} (sl[i] = =^ {\prime} \backslash 0 ^ {\prime} & & s2[i] = =^ {\prime} \backslash 0 ^ {\prime});

}$qt$, option_json = $qt${"A": "将 s2 所指字符串赋给 s1", "B": "比较 s1 和 s2 所指字符串的大小，若 s1 比函数值为 1，否则函数值为 0", "C": "比较 s1 和 s2 所指字符串是否相等，若相等值为 1，否则函数值为 0", "D": "比较 s1 和 s2 所指字符串的长度，若 s1 比函数值为 1，否则函数值为 0"}$qt$, analysis = $qt$比较两串是否相等。$qt$ where id = 379509 and not is_golden;
update t_question set stem = $qt$有以下程序
main()
{ int i=0,s=0;
do{
if(i%2){i++;continue;}

i + + ;

s + = i;

} \text {while} (i < 7);

\operatorname{printf} (% d \backslash n, s)

}$qt$, option_json = $qt${"A": "16", "B": "12", "C": "28", "D": "21"}$qt$, analysis = $qt$本题中，当i=0时，i%2=0，为假不执行{i++;continue;}，接着往下执行i++，此时i=1，s=s+i=1，因为i=1符合条件i<7继续循环执行，i=1时以此类推，直到i>=7时结束循环。最后得出s=16。 ### 【2023版及以前】【第12题】答案：C 解析：do-while执行的过程是当while后一对括号中表达式的值为非0时，转去执行循环体，当值为0时，退出循环。本题定义了一个指针变量s，并使得s指向字符串"ABC"的首地址，即把字符A的地址赋给s，因为do-while语句是先执行循环体再进行循环条件的判断，因此先执行printf语句，"s%10"是s对10的取模运算，第一字符A的ASCII码为65，故"65%10"取模运算结果为5，因此输出5，接着执行s++，s指向字符串的下一个字符，当字符串中字符没有循环完时，继续执行do-while语句，以此类推，B和C的分别为6和7。 ### 【2024版】【第12题】答案：C 解析：do-while执行的过程是当while后一对括号中表达式的值为非0时，转去执行循环体，当值为0时，退出循环。因为do-while语句是先执行循环体再进行循环条件的判断， 执行printf语句，"s[i++]%10"，i在前，所以是s[0]对10的取模运算，第一字符A的ASCII码为65，故"65%10"取模运算结果为5，因此输出5，接着$qt$ where id = 379511 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main(){char s[]={"ABC"};

\text {int} i = 0;

\text {do} {  \operatorname{printf} (% d", s [ i + + ] % 1 0);

} \text {while} (s [ i ]! = ^ {\prime} \backslash 0 ^ {\prime});

}
注意:字母 A 的 ASCII 码值为 65。程序运行后的果是____。$qt$, option_json = $qt${"A": "5670", "B": "656667", "C": "567", "D": "ABC"}$qt$, analysis = $qt$（AI 补答）'A''B''C''\0' 的 ASCII 模 10 依次为 5、6、7、0，输出 5670，故选 A。$qt$ where id = 379513 and not is_golden;
update t_question set stem = $qt$以下程序段中，循环次数不超过 10 的是$qt$, option_json = $qt${"A":"int i=10; do{i=i+1;} while(i<0);","B":"int i=5; do{i+=1;} while(i>0);","C":"int i=1; do{i+=2;} while(i!=10);","D":"int i=6; do{i-=2;} while(i!=1);"}$qt$, analysis = $qt$A选项的循环次数为：0；B、C、D选项的循环次数为无数次。$qt$ where id = 379514 and not is_golden;
update t_question set stem = $qt$以下程序段中的变量已正确定义

\text {for} (i = 0; i < 3; i + +, i + +)

\text {for} (j = 1; j < 3; j + +); \text {printf} (#);$qt$, option_json = $qt${"A": "#", "B": "##", "C": "####", "D": "####"}$qt$, analysis = $qt$本题中，要需要注意的是 printf 函数之前有；了，说明 printf 函数不是循环体内容。循环体是空语句。最后只输出#。$qt$ where id = 379534 and not is_golden;
update t_question set stem = $qt$有以下程序

\begin{array}{l} \text {#include< stdio.h> main()} \end{array}

{\text {int} k, m, n = 1;

\text {for} (k = 1; k < 4; k + + ) {.

for(m=3;m>0;m--)
{if(k*m>5) break;
 n*=k*m;
}
}
printf("n=%d\n",n);
}
程序运行后的输出结果是____。$qt$, option_json = $qt${"A": "n=1", "B": "n=2", "C": "n=4", "D": "n=6"}$qt$, analysis = $qt$跟踪程序（n初值1）：k=1时内层 m=3、2、1 均不满足 k·m>5，n 依次乘3、2、1得6；k=2时 m=3 使 k·m=6>5，立即 break；k=3时同样立即 break；最终 n=6，故选D。$qt$ where id = 379536 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是____。
main() {
int a[4][4] = {{1,3,5},{2,4,6},{3,5,7}};
printf("%d%d%d%d\n",a[0][3],a[1][2],a[2][1],a[3][0]);$qt$, option_json = $qt${"A": "0650", "B": "1470", "C": "5430", "D": "输出值不定"}$qt$, analysis = $qt$对未给出初始值的整数数组元素，被缺省初始化为零。$qt$ where id = 379548 and not is_golden;
update t_question set stem = $qt$对于长度为 n 的线性表，在最坏情况下，$qt$, option_json = $qt${"A":"冒泡排序为 n/2","B":"冒泡排序为n","C":"快速排序为 n","D":"快速排序为 n(n - 1) / 2"}$qt$, analysis = $qt$假设线性表的长度为n，则在最坏情况下，[冒泡排序](https://zhida.zhihu.com/search?content_id=180770080&content_type=Article&match_order=1&q=%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F&zhida_source=entity)需要经过n/2遍的从前往后扫描和n/2遍的从后往前扫描，需要比较次数为n(n-1)/2。快速排序法的最坏情况比较次数也是n(n-1)/2。$qt$ where id = 379569 and not is_golden;
update t_question set stem = $qt$函数 f 的功能是计算如下数学公式的前 n 项。若 x=2, n=3 时，函数值为:6.333333。请补全代码。

f (x) = 1 + x + \frac {x ^ {2}}{2 !} + ... + \frac {x ^ {n}}{n !}

#include <stdio.h>
double fun(double x, int n)
{ double f, t;
 int i;
 f = 1.0;
 t = ________;
 for (i= _______; i<=n; i++){
 t *= ________;
 f += t;
 }

return f;
}
main()
{ double x, y;
 x=2;
 y = fun(x, 3);
 printf("\n 计算结果 :\n");
 printf("x=%-10.6f y=%-10.6f\n", x, y);
 system("pause");
}$qt$, analysis = $qt$依次填 1.0、1、x/i（t=t*x/i 逐项累乘：x 的 i 次幂除以 i!）。$qt$ where id = 379602 and not is_golden;
update t_question set stem = $qt$以下程序中, 函数 fun 的功能是统计所有小于等于 n(n > 2) 的素数的个数, 素数的个数作为函数返回值。请根据描述, 补全代码。

#include <stdio.h>
int fun(int n){
 int i,j, cnt=0;
 printf("\n 素数从 3 至 %d\n", n);
 for (i=3; i<=n; i++) {
 for (j=_______; j<i; j++)
 if (i%j == 0)

break;
if (j>=_) {
 cnt ++;
 printf( cnt %10? "%4d":"\n%4d",i);
}
}
return cnt;

}
main(){ int num=50, r;
 r = ______;$qt$, analysis = $qt$首先要明白素数是仅可以被1和自己整除的，不能被在2至自己-1之间的任意整数整除的数。第一空，外循环是进行从3至n进行找，内循环是从2至i-1之间的数进行取余，如果发现被整除了，就break。即填2。第二空，下面有cnt++，即统计素数，j>=i时则进行统计，因为如果内循环中途break出来，说明j会是<i的，只有一直循环到j=i时候，会退出。第三空，这里缺少的是有关调用函数语句，即fun(num);$qt$ where id = 379617 and not is_golden;
update t_question set stem = $qt$下面程序的功能是实现表达式 z = (x >= y ? x : y)，请将程序填写完整。

#include"stdio.h"
main( ){
 int x, y, z;
 printf("Please input x,y:");
 scanf("%d%d",&x,&y);
 if (__________) z=x;
 else z=y;
 printf("z=%d",z);
}$qt$, analysis = $qt$填x >= y或者y<=x ---$qt$ where id = 379619 and not is_golden;
update t_question set stem = $qt$有以下程序:
float fun(int x,int y)

{\text {return} (x + y); }

\text {main} () {\text {int} a = 2, b = 5, c = 8;

\begin{array}{l} \text {printf("%3.0f\n",fun((int)fun(a + c,b),a - c));} \ } \end{array}

程序运行后的输出结果是____。$qt$, analysis = $qt$fun(a+c,b)=fun(10,5)=15；内层 (int)15 后再调 fun(15,-6)=9，%3.0f 输出 9，故填 9。$qt$ where id = 379623 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是____。

int f(){ static int i=0;
 int s=1;
S+=i;i++;
return s;}
main(){ int i,a=0;
for(i=0;i<5;i++) a+=f();
printf("%d\n",a);
}$qt$, analysis = $qt$f 中静态 i 保持：五次调用返回 1、2、3、4、5，a 累加得 15，故填 15。$qt$ where id = 379634 and not is_golden;
update t_question set stem = $qt$为表示关系 x >=slant y >=slant z, 应使用 C 语言表达式 ____。

}
}$qt$, analysis = $qt$x>=y && y>=z。$qt$ where id = 379653 and not is_golden;
update t_question set stem = $qt$函数 NOW() 返回的结果是（）。$qt$, option_json = $qt${"A":"系统的当前日期","B":"系统的当前时间","C":"系统\n的当前日期和时间","D":"系统的当前用户"}$qt$, analysis = $qt$NOW() 返回当前日期和时间。$qt$ where id = 379782 and not is_golden;
update t_question set stem = $qt$求使用二维数组将一个 3 × 4 的矩阵中所有元素的最大值及其下标获取。

#include <stdio.h>
int main(){
 int ________;
 int i,j,max,max_i=0,max_j=0;
 for(i=0;i<3;i++)
 for(j=0;j<4;j++)
 scanf("%d",___________);
 max=a[0][0];
 for(i=0;i<3;i++)
 for(j=0;j<4;j++)
 if(__________) {
 max=a[i][j];
 max_i=i;
 max_j=j;
 }
 printf("max=a[%d][%d]=%d\n",max_i,max_j,max);
 return 0;
}$qt$, analysis = $qt$int a[3][4]；scanf("%d",&a[i][j])；随后比较 if(a[i][j]>max){max=a[i][j];max_i=i;max_j=j;}。$qt$ where id = 379986 and not is_golden;
update t_question set stem = $qt$若有 int a[][4]={0,0};则下面说法不正确的是()$qt$, option_json = $qt${"A":"数组 a 的每个元素都可得到初值0","B":"二维数组 a 的第一维大小为1","C":"初始化列表元素个数除以第二维数组大小可以得到行数，元素个数为2除以4得到商是0，即1行。","D":"只有元素 a[0][0] 和 a[0][1] 可得到初值 0，其余元素均无法得到初值 0"}$qt$, analysis = $qt$其余元素自动为 0，D 错误。$qt$ where id = 379995 and not is_golden;
update t_question set stem = $qt$若有条件表达式(exp)?a++: b++,则以下表达式中能完全等价于表达式(exp)的是()$qt$, option_json = $qt${"A":"(\\exp == 0)","B":"(exp!=0)","C":"(exp==1)","D":"(exp!=1)"}$qt$, analysis = $qt$(exp) 等价 exp!=0。$qt$ where id = 379997 and not is_golden;
update t_question set stem = $qt$若 x 和 y 代表整型数，以下表达式中不能正确表示的数学关系式 |x-y|<10 的是 ____。$qt$, option_json = $qt${"A":"abs(x-y)<10","B":"x-y>-10&& x-v<10","C":"!(x-y)<-10||!(y-x)>10","D":"(x-y)*(x-y)<100"}$qt$, analysis = $qt$A、B、D 均等价于 |x−y|<10；C 式逻辑结构错误、不能正确表示该关系，故选 C。$qt$ where id = 380011 and not is_golden;
update t_question set stem = $qt$设有程序段，下述正确的是()
t=0;
while (printf("*")){
t++;
if(t<3) break;
}$qt$, option_json = $qt${"A":"其中循环控制表达式与0等价","B":"其中循环控制表达式与'0'等价","C":"其中循环控制表达式是不合法的","D":"以上说法都不对"}$qt$, analysis = $qt$printf 返回值非 0，以上都不对。$qt$ where id = 380014 and not is_golden;
update t_question set stem = $qt$以下函数值的类型是（）。
fun(float x){
float y;
y=3*x-4;
return y;
}$qt$, option_json = $qt${"A": "int", "B": "void", "C": "float", "D": "不确定"}$qt$, analysis = $qt$fun 未定义返回类型，隐含为 int（选项 A），故选 A。$qt$ where id = 380016 and not is_golden;
update t_question set stem = $qt$利用以下语句计算自由落体运动的位移 s = 1 / 2 * g * t * t; 设上述变量均定义为 double 型, 则关于变量 s 的说法正确的是( )。$qt$, option_json = $qt${"A": "s 的值和类型均为未知", "B": "s 的值为 0，类型为 double", "C": "s 的值未知，因 g 和 t 的值未知,类型为 double", "D": "s 的值为 0, 类型为 int"}$qt$, analysis = $qt$题目中说了，以上变量均定义为 double,说明 s 的类型是 double

s = 1 / 2 * g ^ {\prime} t ^ {\prime} t

s = 0 ^ {*} g ^ {*} t ^ {*} t,

s = 0;$qt$ where id = 380026 and not is_golden;
update t_question set stem = $qt$若 i 为整型变量，则一下循环执行的次数是( )

\text {for} (i = 2; i = = 0;) \operatorname{printf} (% d ^ {\prime \prime}, i - -;)$qt$, option_json = $qt${"A": "0次", "B": "1次", "C": "2次", "D": "3次"}$qt$, analysis = $qt$i==0 首判即假 → 0 次。$qt$ where id = 380040 and not is_golden;
update t_question set stem = $qt$在 C 语言中，对于函数的目的，以下正确的说法是()$qt$, option_json = $qt${"A":"提高程序的执行效率\nDouble","B":"提高程序的可读性\n提高程序的可读性","C":"减少程序的篇幅\n减少程 2、C语言提供的合法的数据类型关键字是____。","D":"减少程序文件所占内容 2、C语言提供的全读的难度提高程序的执行效率"}$qt$, analysis = $qt$函数提高可读性。$qt$ where id = 380057 and not is_golden;
update t_question set stem = $qt$假定所有变量均已正确说明，以下程序段运行后的输出结果是。
int i,s=0;

\text {for} (i = 1; i < 1 0; i + = 2)

s + = i + 1;

printf("%d\n",s);$qt$, option_json = $qt${"A": "自然数1~9的累加和", "B": "自然数1~10的累加和", "C": "自然数1~9中奇数之和", "D": "自然数1~10中偶数之和"}$qt$, analysis = $qt$i=1,3,5,7,9 → 2+4+6+8+10=30（1~10 偶数之和）。$qt$ where id = 380060 and not is_golden;
update t_question set stem = $qt$已知字母 a 的 ASCII 码为十进制数 97，且设 ch 为字符型变量，则表达式 ch = 'a' + '8' - '3' 的值为 ____。$qt$, analysis = $qt$'a'+'8'-'3'=97+5=102，即字符 f，故填 f。$qt$ where id = 380067 and not is_golden;
update t_question set stem = $qt$下述程序运行后输出结果是()
main(){
int n[3],i,j,k;
for(i=0;i<3;i++) n[i]=0;
k=2;
for (i=0;i<k;i++)
for(j=0;j<k;j++) n[j]=n[i]+1;
printf("%d\n ",n[1]);
}$qt$, option_json = $qt${"A":"2","B":"1","C":"0","D":"3\n}"}$qt$, analysis = $qt$双重循环逐次更新后 n[1]=3（选项 D），故选 D。$qt$ where id = 380100 and not is_golden;
update t_question set stem = $qt$有如下程序:

\begin{array}{l} \text {main () } { \ \text {int} y = 3, x = 3, z = 1; \ \end{array}

printf ("%d,%d\n",(++x,y++),z+2);
}
运行该程序的输出结果是____。$qt$, analysis = $qt$(++x,y++) 值为 3；z+2=3，输出 3,3。$qt$ where id = 380109 and not is_golden;
update t_question set stem = $qt$以下程序段____。
x=-1;
do {x = x * x; } while (!x);$qt$, option_json = $qt${"A": "循环体执行一次", "B": "循环体执行两次", "C": "循环体执行无数次", "D": "系统将提示有语法错误"}$qt$, analysis = $qt$x=−1 平方得 1，!1 为假：do-while 循环体执行一次（选项 A），故选 A。$qt$ where id = 380113 and not is_golden;
update t_question set stem = $qt$设有定义 double payment;下列语句中能将键盘输入的数值正确赋给变量的语句是____。$qt$, option_json = $qt${"A":"scanf(\"%f\", &payment);","B":"scanf(\"%f5.2\",&payment);","C":"scanf(\"%lf\", payment);","D":"scanf(\"%lf\", &payment);"}$qt$, analysis = $qt$double 型变量输入须用 %lf 且取地址：scanf("%lf", &payment);（选项 D），故选 D。$qt$ where id = 380114 and not is_golden;
update t_question set stem = $qt$设 a 、 b 、 c 为整型数, 且 a = 2, b = 3, c = 4 则执行完以下语句: a* = 16 + (b++) - (++c); 后, a 的值是____。$qt$, analysis = $qt$16+(3)-(5)=14，a=2*14=28。$qt$ where id = 380145 and not is_golden;
update t_question set stem = $qt$下列程序段执行后 k 值为()。
int k=0,i,j; .

\text {for} (i = 0; i < 5; i + +)

\text {for} (j = 0; j < 3; j + +)

k = k + 1 ;$qt$, option_json = $qt${"A": "15", "B": "3", "C": "8", "D": "5"}$qt$, analysis = $qt$5×3=15。$qt$ where id = 380150 and not is_golden;
update t_question set stem = $qt$若有下列程序段:
int n=13;

\text {switch} (n / 3) {

\text {case 4: n + + ; break;}

\text {default:} n - - ;$qt$, option_json = $qt${"A":"5","B":"3","C":"14","D":"12\n}\n则上述语句执行后,变量 n 的值为____。"}$qt$, analysis = $qt$13/3=4 → case4 使 n=14。$qt$ where id = 380151 and not is_golden;
update t_question set stem = $qt$设变量 a 是 int 型，f 是 float 型，i 是 double 型，则表达式 10 + 'a' + i * f 值的数据类型为()。$qt$, option_json = $qt${"A": "int", "B": "float", "C": "double", "D": "不确定"}$qt$, analysis = $qt$含 double 运算 → double。$qt$ where id = 380152 and not is_golden;
update t_question set stem = $qt$以下程序的功能是计算函数 F(x,y,z) = (x + y) / (x - y) + (z + y) / (z - y) 的值，则①和②空分别是（）
#include <stdio.h>
main(){
float x,y,z,sum;
scanf("%f %f %f",&x,&y,&z);
sum=f(①)+f(②);
printf("sum=%f\n",sum);
}
float f(float a,float b){
float value;
value=a/b;
return(value);
}$qt$, option_json = $qt${"A":"① x-y,x+y ② x-y,x+y","C":"① z+y,z-y ② x-y,x+y","B":"①  x+y,x-y  ②  z+y,z-y ①  z+y,z-y  ②  z+y,\\bar{z}-y"}$qt$, analysis = $qt$①x+y,x-y ②z+y,z-y。$qt$ where id = 380155 and not is_golden;
update t_question set stem = $qt$以下有关循环结构的描述中，正确的是（）。$qt$, option_json = $qt${"A":"由于 do-while 循环中循环体语句只能是一条可执行语句，所以循环体内不能使用复合语句。","B":"do-while 循环由 do 介绍,用 while 结束,在 while(表达式)后面不能写分号。","C":"在 do-while 循环体中, 一定要有能使 while 后面表达式的值变为零(\"假\")的操作。","D":"do-while 循环中，根据情况可以省略 while。"}$qt$, analysis = $qt$循环体须有使 while 条件变 0 的操作。$qt$ where id = 380181 and not is_golden;
update t_question set stem = $qt$下面程序的运行结果是( )
#include"stdio.h"
main( ){
int i;
for( i=1;i<=5;i++) {
if (i%2==0) printf("*");
else continue;
printf("#");
}
printf("\");
}$qt$, option_json = $qt${"A":"*#*#\\","B":"#*#*#*\\","C":"*#*#*\\","D":"#*#*\\"}$qt$, analysis = $qt$i=2,4 打印 *# → *#*#。$qt$ where id = 380207 and not is_golden;
update t_question set stem = $qt$以下函数，（）是真正地没有返回值。$qt$, option_json = $qt${"A":"int a(){int a=2;return (a);}","B":"void b(){printf(\"c\");}","C":"int a(){int a=2;return a;}","D":"int a(){float a=2;return (int)a;}"}$qt$, analysis = $qt$void b(){printf("c");} 真正没有返回值（其余函数均返回 int 值），故选 B。$qt$ where id = 380209 and not is_golden;
update t_question set stem = $qt$若k是int型变量，且有下面的程序片段 k=-3； if(k<=0) printf("####") else printf("&&&&"); 上面程序片段的输出结果是____。$qt$, option_json = $qt${"A":"####","B":"&&&&","C":"####&&&&","D":"有语法错误,无输出结果"}$qt$, analysis = $qt$printf("####") 后缺分号，存在语法错误、无输出结果（选项 D），故选 D。$qt$ where id = 380305 and not is_golden;
update t_question set stem = $qt$下列定义变量的语句中错误的是____。$qt$, option_json = $qt${"A":"int _int","B":"double int_","C":"char For","D":"float US\\"}$qt$, analysis = $qt$float US; 中  非法，定义语句错误（选项 D），故选 D。$qt$ where id = 380310 and not is_golden;
update t_question set stem = $qt$以下4组用户定义标识符中，全部合法的一组是____。$qt$, option_json = $qt${"A": "_main enclude sin", "B": "If -max turbo", "C": "txt REAL 3COM", "D": "int  k_2 _001"}$qt$, analysis = $qt$_main、enclude、sin 均为合法标识符（If-组含减号、3COM 数字开头、int 为关键字），故选 A。$qt$ where id = 380312 and not is_golden;
update t_question set stem = $qt$以下定义语句中正确的是____。$qt$, option_json = $qt${"A":"char a='A' b='B';","B":"float a=b=10.0;(正解a=10.0 b=10.0)","C":"int a=10,*b=&a;","D":"float *a,b=&a;？？？"}$qt$, analysis = $qt$int a=10,*b=&a; 定义正确（其余缺类型或多重复合赋值），故选 C。$qt$ where id = 380313 and not is_golden;
update t_question set stem = $qt$以下不能定义为用户标识符的是____。$qt$, option_json = $qt${"A": "scanf", "B": "Void", "C": "_3com_", "D": "int"}$qt$, analysis = $qt$int 是关键字，不能作标识符（选项 D），故选 D。$qt$ where id = 380317 and not is_golden;
update t_question set stem = $qt$当c的值不为0时，在下列选项中能正确将c的值赋给变量a、b的是____。$qt$, option_json = $qt${"A":"c=b=a;","B":"(a=c)‖(b=c);","C":"(a=c)&&(b=c);","D":"a=c=b;"}$qt$, analysis = $qt$(a=c)&&(b=c); 能在 c≠0 时把 c 的值赋给 a、b（选项 C），故选 C。$qt$ where id = 380319 and not is_golden;
update t_question set stem = $qt$以下选项中非法的表达式是____。$qt$, option_json = $qt${"A":"0<=x<100","B":"i=j==0","C":"(char)(65+3)","D":"x+1=x+1"}$qt$, analysis = $qt$x+1=x+1 中左值为表达式，非法（选项 D），故选 D。$qt$ where id = 380320 and not is_golden;
update t_question set stem = $qt$C语言中运算对象必须是整型的运算符是____。$qt$, option_json = $qt${"A":"%=","B":"/","C":"=","D":"<="}$qt$, analysis = $qt$运算对象必须是整型的运算符是 %=（选项 A），故选 A。$qt$ where id = 380334 and not is_golden;
update t_question set stem = $qt$设有如下程序段

int x=2002,y=2003;

printf("%d\n",(x,y));

则以下叙述中正确的是____。$qt$, option_json = $qt${"A": "输出语句中格式说明符的个数少于输出项的个数，不能正确输出", "B": "运行时产生错误信息", "C": "输出值为2002", "D": "输出值为2003"}$qt$, analysis = $qt$(x,y) 取逗号表达式值 y=2003，输出 2003（选项 D），故选 D。$qt$ where id = 380340 and not is_golden;
update t_question set stem = $qt$设函数fun的定义形式为 void fun(char ch,float x) {……} 则以下对函数fun的调用语句中，正确的是____。$qt$, option_json = $qt${"A":"fun(\"abc\",3.0);","B":"t=fun('D',16.5);","C":"fun ('65',2.8);","D":"fun(32,32);"}$qt$, analysis = $qt$fun(32,32)：实参可隐式转换为 char、float，调用合法（其余类型或 void 赋值错误），故选 D。$qt$ where id = 380358 and not is_golden;
update t_question set stem = $qt$合法的数组定义是____。$qt$, option_json = $qt${"A":"int a[]=\"string\";","B":"int a[5]={0,1,2,3,4,5};","C":"char s=\"string\";","D":"char a[]={0,1,2,3,4,5};"}$qt$, analysis = $qt$char a[]={0,1,2,3,4,5}; 定义合法（int 数组不能用字符串初始化、初值个数超界、char a 只能存单字符），故选 D。$qt$ where id = 380381 and not is_golden;
update t_question set stem = $qt$以下能正确定义一维数组的选项是____。$qt$, option_json = $qt${"A":"int a[5]={0,1,2,3,4,5};","B":"char a[]={0,1,2,3,4,5};","C":"char a={'A','B','C'};","D":"int a[5]=\"0123\";"}$qt$, analysis = $qt$数组的常量表达式中可以包括整型常量和符号常量，不能包括变量。也就是说，C 不允许对数组的大小作动态定义，即数组的大小不依赖于程序运行过程中变量的值，所以选项A 不正确。而选项 B 事先定义一个字符常量 N，所以可以在数组中作常量表达式，选项 B 正确。而选项 C 中不能用区间表示数组大小；在 D 中 N 虽然被赋为 100，但 N 仍然为变量，所以不对。$qt$ where id = 380382 and not is_golden;
update t_question set stem = $qt$以下叙述正确的是____。$qt$, option_json = $qt${"A": "do-while语句构成的循环不能用其它语句构成的循环来代替", "B": "do-while语句构成的循环只能用break语句退出", "C": "用do-while语句构成的循环，在while后的表达式为非零时结束循环", "D": "用do-while语句构成的循环，在while后的表达式为零时结束循环"}$qt$, analysis = $qt$do-while 构成的循环在 while 后的表达式为零时结束循环（选项 D），故选 D。$qt$ where id = 380396 and not is_golden;
update t_question set stem = $qt$有定义语句：int b;char c[10];，则正确的输入语句是____。$qt$, option_json = $qt${"A":"scanf(\"%d%s\",&b,&c);","B":"scanf(\"%d%s\",&b,c);","C":"scanf(\"%d%s\",b,c);","D":"scanf(\"%d%s\",b,&c);"}$qt$, analysis = $qt$scanf("%d%s", &b, c); 正确（数组名 c 即地址）（选项 B），故选 B。$qt$ where id = 380398 and not is_golden;
update t_question set stem = $qt$有定义语句：int x,y;，若要通过scanf("%d,%d",&x,&y);语句使变量x得到数据11，变量y得到数值12，下面四组输入形式中，错误的是____。$qt$, option_json = $qt${"A":"11 12<回车>","B":"11,12<回车>","C":"11, 12<回车>","D":"11,<回车>12<回车>"}$qt$, analysis = $qt$scanf("%d,%d") 要求以逗号分隔，“11 12”缺逗号、错误（选项 A），故选 A。$qt$ where id = 380403 and not is_golden;
update t_question set stem = $qt$下列叙述中正确的是____。$qt$, option_json = $qt${"A": "C语言中既有逻辑类型也有集合类型", "B": "C语言中没有逻辑类型但有集合类型", "C": "C语言中有逻辑类型但没有集合类型", "D": "C语言中既没有逻辑类型也没有集合类型"}$qt$, analysis = $qt$C 语言中既没有逻辑类型也没有集合类型（选项 D），故选 D。$qt$ where id = 380412 and not is_golden;
update t_question set stem = $qt$设a为整型变量，不能正确表达数学关系:10<a<15的C语言表达式是____。$qt$, option_json = $qt${"A":"10<a<15","B":"a==11||a==12||a==13||a==14","C":"a>10 && a<15","D":"!(a<=10)&&!(a>=15)"}$qt$, analysis = $qt$10<a<15 等价于 (10<a)<15 恒为真，不能正确表示该数学关系（选项 A），故选 A。$qt$ where id = 380413 and not is_golden;
update t_question set stem = $qt$若变量c为char类型，能正确判断出c为小写字母的表达式是____。$qt$, option_json = $qt${"A":"'a'<=c<='z'","B":"(c>='a')||(c<='z')","C":"('a'<=c)and('z'>=c)","D":"(c>='a')&&(c<='z')"}$qt$, analysis = $qt$判断小写字母的正确表达式是 (c>='a')&&(c<='z')（选项 D），故选 D。$qt$ where id = 380417 and not is_golden;
update t_question set stem = $qt$设有定义：int a=2,b=3,c=4;，则以下选项中值为0的表达式是____。$qt$, option_json = $qt${"A":"(!a==1)&&(!b==0)","B":"(a<b)&&!c||1","C":"a&&b","D":"a||(b+b)&&(c-a)"}$qt$, analysis = $qt$(!a==1)&&(!b==0) 即 (0==1)&&…=0（其余表达式为 1）（选项 A），故选 A。$qt$ where id = 380421 and not is_golden;
update t_question set stem = $qt$若要求在if后一对圆括号中表示a不等于0的关系，则能正确表示这一关系的表达式为____。$qt$, option_json = $qt${"A":"a<>0","B":"!a","C":"a=0","D":"a"}$qt$, analysis = $qt$if 后表示 a≠0 的表达式为 a（选项 D），故选 D。$qt$ where id = 380422 and not is_golden;
update t_question set stem = $qt$能正确表示a和b同时为正或同时为负的逻辑表达式是____。$qt$, option_json = $qt${"A":"(a>=0‖b>=0)&&(a<0‖b<0)","B":"(a>=0&&b>=0)&&(a<0&&b<0)","C":"(a+b>0)&&(a+b<=0)","D":"a*b>0"}$qt$, analysis = $qt$同时为正或同时为负等价于 a*b>0（选项 D），故选 D。$qt$ where id = 380424 and not is_golden;
update t_question set stem = $qt$若有定义int x,y; 并已正确给变量赋值，则以下选项中与表达式(x-y)?(x++):(y++)中的条件表达式(x-y)等价的是____。$qt$, option_json = $qt${"A":"(x-y>0)","B":"(x-y<0)","C":"(x-y<0||x-y>0)","D":"(x-y==0)"}$qt$, analysis = $qt$与 (x−y) 等价的是 (x−y<0||x−y>0)（选项 C），故选 C。$qt$ where id = 380427 and not is_golden;
update t_question set stem = $qt$以下程序段中与语句 k=a>b?(b>c?1:0):0; 功能等价的是____。$qt$, option_json = $qt${"A":"if((a>b)&&(b>c)) k=1;else k=0;","B":"if((a>b)||(b>c)) k=1;else k=0;","C":"if(a<=b) k=0;else if(b<=c) k=1;","D":"if(a>b) k=1;else if(b>c) k=1;else k=0;"}$qt$, analysis = $qt$k=a>b?(b>c?1:0):0 等价于 if((a>b)&&(b>c)) k=1;else k=0;（选项 A），故选 A。$qt$ where id = 380429 and not is_golden;
update t_question set stem = $qt$设变量已正确定义，则以下能正确计算f=n!的程序段是____。$qt$, option_json = $qt${"A":"f=0;for(i=1;i<=n;i++) f*i;","B":"f=1;for(i=1;i<n;i++) f*=i;","C":"f=1;for(i=n;i>1;i++) f*i;","D":"f=1;for(i=n;i>=2;i--) f*=i;"}$qt$, analysis = $qt$正确计算 n!：f=1;for(i=n;i>=2;i--) f*=i;（选项 D），故选 D。$qt$ where id = 380440 and not is_golden;
update t_question set stem = $qt$若有如下程序段，其中s、a、b、c均已定义为整型变量，且a、c 均已赋值（c大于0）

s=a;

for(b=1;b<=c;b++) s=s+1;
则上述程序段功能等价的赋值语句是______。$qt$, option_json = $qt${"A": "s=a+b;", "B": "s=a+c;", "C": "s=s+c;", "D": "s=b+c;"}$qt$, analysis = $qt$s=a+c（循环 c 次每次加 1）：等价于 s=a+c（选项 B），故选 B。$qt$ where id = 380441 and not is_golden;
update t_question set stem = $qt$要求通过while循环不断读入字符，当读入字母N时结束循环。若变量已正确定义，以下正确的程序段是____。$qt$, option_json = $qt${"A":"while((ch=getchar())!='N' printf(\"%c\",ch) ;","B":"while(ch=getchar()!='N' printf(\"%c\",ch) ;","C":"while(ch=getchar())=='N' printf(\"%c\",ch);","D":"while((ch=getchar())=='N' printf(\"%c\",ch);"}$qt$, analysis = $qt$while((ch=getchar())!='N') printf("%c",ch);（选项 A），故选 A。$qt$ where id = 380450 and not is_golden;
update t_question set stem = $qt$函数调用：strcat(strcpy(str1,str2),str3)的功能是____。$qt$, option_json = $qt${"A": "将串str1复制到串str2中后再连接到串str3之后", "B": "将串str1连接到串str2之后再复制到串str3之后", "C": "将串str2复制到串str1中后再将串str3连接到串str1之后", "D": "将串str2连接到串str1之后再将串str1复制到串str3中"}$qt$, analysis = $qt$strcat(strcpy(str1,str2),str3)：先将 str2 复制到 str1，再将 str3 连到 str1 后（选项 C），故选 C。$qt$ where id = 380458 and not is_golden;
update t_question set stem = $qt$以下正确定义字符串的语句是____。$qt$, option_json = $qt${"A":"char str[]={'\\064'}；","B":"char str=\"\\x43\";","C":"char str=''；","D":"char str[]=\"\\0\";"}$qt$, analysis = $qt$char str[]="\0"; 正确定义了字符串（其余为单字符或类型错误），故选 D。$qt$ where id = 380459 and not is_golden;
update t_question set stem = $qt$已定义c为字符型变量，则下列语句中正确的是____。$qt$, option_json = $qt${"A":"c='97';","B":"c=\"97\" ;","C":"c=97;","D":"c=\"a\";"}$qt$, analysis = $qt$c=97; 合法（字符变量可赋 ASCII 值；c='97' 与加引号形式错误），故选 C。$qt$ where id = 380462 and not is_golden;
update t_question set stem = $qt$若变量a是int类型，并执行了语句：a='A'+1.6;，则正确的叙述是______。$qt$, option_json = $qt${"A":"a的值是字符C","B":"a的值是浮点型","C":"不允许字符型和浮点型相加","D":"a的值是字符'A'的ASCII值加上1"}$qt$, analysis = $qt$'A'+1.6=66 → 'A'+1。$qt$ where id = 380465 and not is_golden;
update t_question set stem = $qt$要求以下程序的功能是计算：s=1+1/2+1/3+...+1/10 main() { int n; float s; s=1.0; for(n=10;n>1;n--) s=s+1/n; printf("%6.4f\n",s); } 程序运行后输出结果错误，导致错误结果的程序运行是____。$qt$, option_json = $qt${"A":"s=1.0;","B":"for(n=10;n>1;n--);","C":"s=s+1/n;","D":"printf(\"%6.4f\\n\",s);"}$qt$, analysis = $qt$s=s+1/n 中 1/n 为整数除法（n>1 时恒为 0），导致结果错误（选项 C），故选 C。$qt$ where id = 380474 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是______。 #include <stdio.h> main() { int i; for(i=1;i<5;i++) { if(i%2) printf("*"); else continue; printf("#"); } printf("\\n"); } A、*#*#*# B、#*#*#* C、*#*# D、#*#*\$qt$, analysis = $qt$i=1、3 时输出 *#，i=2、4 时 continue 跳过 # 只输出 *，序列为 *#*#*#，故选 C。$qt$ where id = 380477 and not is_golden;
update t_question set stem = $qt$下列条件语句中，功能与其他语句不同的是____。$qt$, option_json = $qt${"A":"if(a) printf(\"%d\\n\",x); else printf(\"%d\\n\",y);","B":"if(a==0) printf(\"%d\\n\",y); else printf(\"%d\\n\",x);","C":"if(a!=0) printf(\"%d\\n\",x); else printf(\"%d\\n\",y);","D":"if(a==0) printf(\"%d\\n\",x); else printf(\"%d\\n\",y);"}$qt$, analysis = $qt$if(a==0) printf x; else printf y; 与其他三条功能相反（选项 D），故选 D。$qt$ where id = 380483 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是____。$qt$, option_json = $qt${"A": "C程序中注释部分可以出现在程序中任意合适的地方", "B": "花括号“{”和“}”只能作为函数体的定界符", "C": "构成C程序的基本单位是函数，所有函数名都可以由用户命名", "D": "分号是C语言之间的分隔符，不是语句的一部分"}$qt$, analysis = $qt$C 程序中注释部分可以出现在程序中任意合适的地方（选项 A），故选 A。$qt$ where id = 380489 and not is_golden;
update t_question set stem = $qt$下面选项中正确的赋值语句是(设 char a[5],*p＝a;)（ ）。$qt$, option_json = $qt${"A":"p=\"abcd\";","B":"a=\"abcd\";","C":"*p=\"abcd\";","D":"*a=\"abcd\";"}$qt$, analysis = $qt$p="abcd"; 正确（指针可指向字符串常量；数组名不可赋值），故选 A。$qt$ where id = 380529 and not is_golden;
update t_question set stem = $qt$设有以下程序段，则值为6的表达式是（ ）。 struct st { int n; struct st *next;}; static struct st a[3]={5,&a[1],7,&a[2],9,0 }，*p; p=&a[0];$qt$, option_json = $qt${"A":"p++->n","B":"++p->n","C":"p->n++","D":"(*p).n++"}$qt$, analysis = $qt$++p->n 使 p->n 由 5 变为 6（其余表达式值为 5）（选项 B），故选 B。$qt$ where id = 380530 and not is_golden;
update t_question set stem = $qt$若有以下程序段，则值为6的表达式是（ ）。 struct st{ int n;struct st *next;}; static struct st a[3]={5,&a[1],7,&a[2],9,‘\0’},*p; p=&a[0];$qt$, option_json = $qt${"A":"p++->n","B":"p->n++","C":"(*p).n++","D":"++p->n"}$qt$, analysis = $qt$++p->n 使 p->n 由 5 变为 6（其余表达式值为 5）（选项 D），故选 D。$qt$ where id = 380565 and not is_golden;
update t_question set stem = $qt$若有下面的变量定义，以下语句中合法的是（ ）。 int i，a[10]，*p；$qt$, option_json = $qt${"A":"p=a+2;","B":"p=a[5];","C":"p=a[2]+2;","D":"p=&(i+2);"}$qt$, analysis = $qt$p=a+2 合法。$qt$ where id = 380598 and not is_golden;
update t_question set stem = $qt$若有以下的定义和语句，则值为12的表达式是（ ）。 struct wc{ int a；int *b；}*p；int x0[]={11，12}，x1[]={31，32}； static struct wc x[2]={100，x0，300，x1}； p=x； A *++p->b B ++p->a C p->b D *(p++)->b$qt$, option_json = $qt${"A":"*++p->b","B":"++p->a","C":"p->b","D":"*(p++)->b"}$qt$, analysis = $qt$*++p->b 指向 x0[1]=12。$qt$ where id = 380599 and not is_golden;
update t_question set stem = $qt$要打开一个已存在的非空文件＂file＂用于修改，选择正确的语句（ ）。 (A) fp＝fopen("file","r"); (B) fp=fopen("file","w"); (C) fp=fopen("file","r+"); (D) fp=fopen("file","w+");$qt$, option_json = $qt${"A":"fp＝fopen(\"file\",\"r\");","B":"fp=fopen(\"file\",\"w\");","C":"fp=fopen(\"file\",\"r+\");","D":"fp=fopen(\"file\",\"w+\");"}$qt$, analysis = $qt$打开已存在的非空文件用于修改应选择 r+ 方式（选项 C），故选 C。$qt$ where id = 380620 and not is_golden;
update t_question set stem = $qt$若有以下定义和语句，则值为12的表达式是（ ）。 struct wc{ int a；int *b；}*p； int x0[]={11，12}，x1[]={31，32}； static struct wc x[2]={100，x0，300，x1}； p=x； A *++p->b B ++p->a C p->b D *(p++)->b$qt$, option_json = $qt${"A":"*++p->b","B":"++p->a","C":"p->b","D":"*(p++)->b"}$qt$, analysis = $qt$同 380599：12。$qt$ where id = 380635 and not is_golden;
update t_question set stem = $qt$要打开一个已存在的非空文件“file”用于修改，选择正确的语句（ ）。$qt$, option_json = $qt${"A":"fp＝fopen(\"file\",\"r\");","B":"fp=fopen(\"file\",\"w\");","C":"fp=fopen(\"file\",\"r+\");","D":"fp=fopen(\"file\",\"w+\");"}$qt$, analysis = $qt$fopen r+ 修改已存在文件。$qt$ where id = 380636 and not is_golden;
update t_question set stem = $qt$具有相同类型的指针类型变量p与数组a,不能进行的操作是（ ）。 A p=a; B *p=a[0]; C p=&a[0]; D p=&a;$qt$, option_json = $qt${"A":"p=a;","B":"*p=a[0];","C":"p=&a[0];","D":"p=&a;"}$qt$, analysis = $qt$p=&a 类型不符（数组地址）。$qt$ where id = 380664 and not is_golden;
update t_question set stem = $qt$以下选项中，____是不正确的 C 语言字符型常量。$qt$, option_json = $qt${"A":"'a'","B":"'\\x41'","C":"'\\101'","D":"\"a\""}$qt$, analysis = $qt$"a" 是字符串常量，不是正确的字符型常量（'a'、'\x41'、'\101' 均合法），故选 D。$qt$ where id = 380695 and not is_golden;
update t_question set stem = $qt$设 f是实型变量，下列表达式中不是逗号表达式的是____。$qt$, option_json = $qt${"A":"f= 3.2, 1.0","B":"f>0, f<10","C":"f=2.0, f>0","D":"f=(3.2, 1.0)"}$qt$, analysis = $qt$f=(3.2, 1.0) 是赋值表达式而非逗号表达式（选项 D），故选 D。$qt$ where id = 380707 and not is_golden;
update t_question set stem = $qt$C 语言中，要求运算对象只能为整数的运算符是____。$qt$, option_json = $qt${"A":"%","B":"/","C":">"}$qt$, analysis = $qt$要求运算对象只能为整数的运算符是 %（选项 A），故选 A。$qt$ where id = 380711 and not is_golden;
update t_question set stem = $qt$要为字符型变量 a赋初值，下列语句中哪一个是正确的____。$qt$, option_json = $qt${"A":"char a=\"3\";","B":"char a=’3’;","C":"char a=%;","D":"char a=*;"}$qt$, analysis = $qt$char a='3'; 为字符变量正确赋初值（选项 B），故选 B。$qt$ where id = 380714 and not is_golden;
update t_question set stem = $qt$下列不正确的转义字符是____$qt$, option_json = $qt${"A":"\\\\","B":"\\'","C":"074","D":"\\0"}$qt$, analysis = $qt$074 没有反斜杠前缀，不是正确的转义字符（选项 C），故选 C。$qt$ where id = 380715 and not is_golden;
update t_question set stem = $qt$对字符数组进行初始化，( )形式是错误。$qt$, option_json = $qt${"A":"char c1[ ]={'1', '2', '3'};","B":"char c2[ ]=123;","C":"char c3[ ]={ '1', '2', '3', '\\0'};","D":"char c4[ ]=\"123\";"}$qt$, analysis = $qt$char c2[]=123 非法。$qt$ where id = 380730 and not is_golden;
update t_question set stem = $qt$合法的数组定义是( )。$qt$, option_json = $qt${"A":"char a[ ]= \"string \" ;","B":"int a[5] ={0,1,2,3,4,5};","C":"char a= \"string \" ;","D":"char a[ ]={0,1,2,3,4,5}"}$qt$, analysis = $qt$char a[]="string"; 合法。$qt$ where id = 380736 and not is_golden;
update t_question set stem = $qt$下列语句中，正确的是 ( )。$qt$, option_json = $qt${"A":"char a[3][ ]={'abc', '1'};","B":"char a[ ][3] ={'abc', '1'};","C":"char a[3][ ]={'a', \"1\"};","D":"char a[ ][3] ={ \"a\", \"1\"};"}$qt$, analysis = $qt$char a[][3]={"a","1"…} 合法。$qt$ where id = 380737 and not is_golden;
update t_question set stem = $qt$下列各语句定义了数组，其中哪一个是不正确的( )。$qt$, option_json = $qt${"A":"char a[3][10]={\"China\",\"American\",\"Asia\"};","B":"int x[2][2]={1,2,3,4};","C":"float x[2][ ]={1,2,4,6,8,10};","D":"int m[][3]={1,2,3,4,5,6};"}$qt$, analysis = $qt$float x[2][] 第二维不能省。$qt$ where id = 380739 and not is_golden;
update t_question set stem = $qt$下面哪一项是不正确的字符串赋值或赋初值的方式( )。 C$qt$, option_json = $qt${"A":"char *str; str=\"string\"","B":"char str[7]={'s','t','r','i','n','g'}","C":"char str1[10];str1=\"string\"","D":"char str1[]=\"string\",str2[]=\"12345678\""}$qt$, analysis = $qt$str1="string" 不能给数组赋值。$qt$ where id = 380742 and not is_golden;
update t_question set stem = $qt$若有以下说明和语句，则输出结果是( )。 C char str[]="\"c:\\abc.dat\""; printf("%s",str)$qt$, option_json = $qt${"A":"字符串中有非法字符","B":"\\\"c:\\\\abc.dat\\\"","C":"\"c:\\abc.dat\"","D":"\"c:\\\\abc.dat\""}$qt$, analysis = $qt$输出 "c:\abc.dat" 转义后为引号包裹。$qt$ where id = 380745 and not is_golden;
update t_question set stem = $qt$以下 函数，真正地没有返回值。$qt$, option_json = $qt${"A":"int a(){int a=2;return (a);}","B":"void b(){printf(\"c\");}","C":"int a(){int a=2;return a;}","D":"以上都是"}$qt$, analysis = $qt$void 函数无返回值。$qt$ where id = 380765 and not is_golden;
update t_question set stem = $qt$若有定义：int x,*pb；则以下正确的表达式是____$qt$, option_json = $qt${"A":"pb=&x","B":"pb=x","C":"*pb=&x","D":"*pb=*x"}$qt$, analysis = $qt$int x,*pb; 时 pb=&x 正确（选项 A），故选 A。$qt$ where id = 380795 and not is_golden;
update t_question set stem = $qt$设有如下定义: struct sk {int a;float b;}data,*p; 若有p=&data;，则对data中的a域的正确引用是____。 A)(*p).data.a B)(*p).a C)p->data.a D)p.data.a$qt$, option_json = $qt${"A":"(*p).data.a","B":"(*p).a","C":"p->data.a","D":"p.data.a"}$qt$, analysis = $qt$p=&data 后引用成员 a 的正确形式为 (*p).a（选项 B），故选 B。$qt$ where id = 380814 and not is_golden;
update t_question set stem = $qt$若有以下说明及语句，则值为6的表达式是____。 struct st{int n;struct st *next;}; struct st a[3],*p; a[0].n=5;a[0].next=&a[1];a[1].n=7;a[1].next=&a[2]; a[2].n=9;a[2].next=’\0’;p=&a[0];$qt$, option_json = $qt${"A":"p++->n","B":"p->n++","C":"(*p).n++","D":"++p->n"}$qt$, analysis = $qt$++p->n 使 p->n 由 5 变为 6（其余表达式值为 5）（选项 D），故选 D。$qt$ where id = 380817 and not is_golden;
update t_question set stem = $qt$有以下说明和定义语句 struct student { int age; char num[8];}; struct student stu[3]={{20,"200401"},{21,"200402"},{10\9,"200403"}}; struct student *p=stu; 以下选项中引用结构体变量成员的表达式错误的是____。 A) (p++)->num B) p->num C) (*p).num D) stu[3].age$qt$, option_json = $qt${"A":"(p++)->num","B":"p->num","C":"(*p).num","D":"stu[3].age"}$qt$, analysis = $qt$stu[3].age 下标越界，引用错误（选项 D），故选 D。$qt$ where id = 380821 and not is_golden;
update t_question set stem = $qt$下面程序的功能是实现两个字符变量互换值，若为 ch1 输入 a，ch2 输入 b，则程序运行时正确的输入是 #include <stdio.h> void main() { char ch1,ch2,ch; scanf("%c%c",&ch1,&ch2); ch=ch1;ch1=ch2;ch2=ch; printf("ch1=%c,ch2=%c\n",ch1,ch2); }$qt$, option_json = $qt${"A":"a,b","B":"a<空格>b","C":"ab","D":"a<回车>b"}$qt$, analysis = $qt$scanf("%c%c") 不能有分隔符：为 ch1 输 a、ch2 输 b 时应输入 ab（选项 C），故选 C。$qt$ where id = 380922 and not is_golden;
update t_question set stem = $qt$以下能正确计算 1 ^ { * } 2 ^ { * } 3 ^ { * } 4 ^ { * } 5 ^ { * } 6 ^ { * } 7 ^ { * } 8 ^ { * } 9 ^ { * } 1 0 的程序段是 do{i=1;s=1; s=s*i; i++; }while(i<=10);$qt$, option_json = $qt${"A":"do{i=1;s=1;s=s*i;i++;}while(i<=10);","B":"do{i=1;s=0; s=s*i; i++; }while(i<=10);","C":"i=1;s=1; do{ s=s*i; i++; }while(i<=10);","D":"i=1;s=0; do{ s=s*i; i++; }while(i<=10);"}$qt$, analysis = $qt$正确计算 1×2×…×10：i=1;s=1; do{s=s*i; i++;}while(i<=10);（选项 C），故选 C。$qt$ where id = 380930 and not is_golden;
update t_question set stem = $qt$有以下程序段 int k=0; while(k=1) k++; \mathrm { w h i l e } 循环执行的次数是$qt$, option_json = $qt${"A": "无限次", "B": "1 次", "C": "语法错误，不能执行", "D": "一次也不执行"}$qt$, analysis = $qt$while(k=1) 恒真，循环执行无限次（选项 A），故选 A。$qt$ where id = 380931 and not is_golden;
update t_question set stem = $qt$下列程序段的功能是给数组所有的元素输入数据,然后输出，请选择正确答案填空 #include <stdio.h> void main() { int a[10],i=0; while(i<10) scanf("%d", _ for(i=0;i<10;i++) printf("%4d",a[i]); }$qt$, option_json = $qt${"A":"a + ( i + + )","B":"& a[i+1]","C":"a+i","D":"Ca[++i]"}$qt$, analysis = $qt$填 a+(i++)：取 &a[i] 的地址并使 i 自增（其余缺少取址或使 i 不递增）（选项 A），故选 A。$qt$ where id = 380934 and not is_golden;
update t_question set stem = $qt$C 语言程序中必须有的函数是（）。 |$qt$, option_json = $qt${"A":"#include \"stdio.h\" |","B":"main | | --- | --- | |","C":"printf |","D":"scanf |"}$qt$, analysis = $qt$必须有 main。$qt$ where id = 381221 and not is_golden;
update t_question set stem = $qt$若 a, b 均为 int 型变量, 且 a = 100, 则关于循环语句 for (b = 100; a! = b; ++a, ++b) printf ("---------"); 的正确说法是 ( )。$qt$, option_json = $qt${"A": "循环体只执行一次", "B": "死循环", "C": "循环体一次也不执行", "D": "输出----"}$qt$, analysis = $qt$a=100=b → 首判即假 → 0 次。$qt$ where id = 381226 and not is_golden;
update t_question set stem = $qt$‘A’ + 3 的结果是（）。$qt$, option_json = $qt${"A":"' A'","B":"'D'的ASC II码","C":"65","D":"3"}$qt$, analysis = $qt$'A'+3='D' 的 ASCII 码。$qt$ where id = 381229 and not is_golden;
update t_question set stem = $qt$当 a = 1, b = 2, c = 3 时，执行以下程序段后 b = ____. if (a>c) b=a; a=c; c=b;$qt$, analysis = $qt$a>c 假；a=c=3；c=b=2，b=2。$qt$ where id = 381243 and not is_golden;
update t_question set stem = $qt$执行下列语句后，b 的十进制值是 ____。 int x=240, y=15, b; char z='A'; b=((x&&y)&&(z<'a')) ;$qt$, analysis = $qt$240&&15=1，'A'<'a'=1，b=1。$qt$ where id = 381244 and not is_golden;
update t_question set stem = $qt$当 a = 3, b = 2, c = 1; 时, 执行以下程序段后 a = ____. if (a>b) a=b; if (b>c) b=c; else c=b; c=a;$qt$, analysis = $qt$a>b 则 a=2；b>c 则 b=1；c=a=2，a=2。$qt$ where id = 381245 and not is_golden;
update t_question set stem = $qt$用下列语句定义 a, b, c，然后执行 b = a、c = 'b' + b，则 b, c 的值是（）. long a=0xffffffff; int b; char c;$qt$, option_json = $qt${"A": "0ffffff 和 0x61", "B": "-1和98", "C": "-1和97", "D": "指向同一地址"}$qt$, analysis = $qt$long 0xffffffff 截断赋给 int 得 −1；c='b'+(−1)=97（'a'）：b=−1、c=97（选项 C），故选 C。$qt$ where id = 381251 and not is_golden;
update t_question set stem = $qt$以下对一维整型数组 a 的正确说明是().$qt$, option_json = $qt${"A":"int a(10);","B":"int n=10, a[n];","C":"int n; scanf(\"%d\",&n); int a[n];","D":"#define SIZE 10 (换行) int a[SIZE];"}$qt$, analysis = $qt$#define SIZE 10 后 int a[SIZE];。$qt$ where id = 381257 and not is_golden;
update t_question set stem = $qt$若有以下数组 a, 数组元素: a[0] ~ a[9], 其值为 9 4 12 8 2 10 7 5 1 3 该数组中下标最大的元素的值是____。$qt$, analysis = $qt$a[9]=3。$qt$ where id = 381259 and not is_golden;
update t_question set stem = $qt$int a[10]; 给数组 a 的所有元素分别赋值为 1、2、3、……的语句是$qt$, option_json = $qt${"A":"for (i=1; i<11; i++) a[i]=i;","B":"for (i=1; i<11; i++) a[i-1]=i;","C":"for (i=1; i<11; i++) a[i+1]=i;","D":"for (i=1; i<11; i++) a[0]=1;"}$qt$, analysis = $qt$a[i-1]=i 赋 1~10。$qt$ where id = 381265 and not is_golden;
update t_question set stem = $qt$若 k 为 int 型变量, 则以下程序段的执行结果是 k=-8567; printf("k=|%06D|\n");$qt$, option_json = $qt${"B":"输出为 k = |%06D|","C":"输出为 |0-8567|","D":"输出为 -8567","A":"格式描述符不合法, 输出无定值"}$qt$, analysis = $qt$缺输出参数 → 原样输出 %06D。$qt$ where id = 381266 and not is_golden;
update t_question set stem = $qt$下列数据中,为字符串常量的是（ ） 。$qt$, option_json = $qt${"A":"'A'","B":"“house”","C":"How do you do.","D":"' \\abc'"}$qt$, analysis = $qt$“house”。$qt$ where id = 381268 and not is_golden;
update t_question set stem = $qt$若有定义:int a = 8, b = 5, c；，执行语句 c = a / b + 0.4；后，c 的值为（）。$qt$, option_json = $qt${"A": "1.4", "B": "1", "C": "2.0", "D": "2"}$qt$, analysis = $qt$a/b=1（整型除法），1+0.4=1.4 截断为 1（选项 B），故选 B。$qt$ where id = 381269 and not is_golden;
update t_question set stem = $qt$设有 int x=11；则表达式 (x++*1/3) 的值为（）。$qt$, option_json = $qt${"A": "3", "B": "4", "C": "11", "D": "12"}$qt$, analysis = $qt$x++ 取 11：11*1/3=3（选项 A），故选 A。$qt$ where id = 381270 and not is_golden;
update t_question set stem = $qt$执行 x = 5 > 1 + 2& & 2 \mid 2*4 < 4 - !0 后，x 的值为（）。$qt$, option_json = $qt${"A": "-1", "B": "0", "C": "1", "D": "5"}$qt$, analysis = $qt$5>3=1、2|8=10、4-1=3 → 1&&0=0。$qt$ where id = 381271 and not is_golden;
update t_question set stem = $qt$以下变量 x、y、z 均为 double 类型且已正确赋值，不能正确表示数学式子: (x)/(y × z) 的 c 语言表达式是（）。$qt$, option_json = $qt${"A":"x/y*z","B":"x*(1 / (y*z))","C":"x/y*1/z","D":"x/y/z"}$qt$, analysis = $qt$x/y*z 即 (x/y)·z，不能正确表示 x/(y·z)（选项 A），故选 A。$qt$ where id = 381272 and not is_golden;
update t_question set stem = $qt$假定 w、x、y、z、m 均为 int 型变量；有如下程序段:  \begin{array}{l} w=1;x=2;y=3;z=4; \ m=(w < x)?w:x;   m=(m < y)?m:y;   m=(m< z)?m:z; \end{array}  则该程序段执行后，m 的值是（）。$qt$, option_json = $qt${"A": "4", "B": "3", "C": "2", "D": "1"}$qt$, analysis = $qt$依次取小值：m=1（选项 D），故选 D。$qt$ where id = 381273 and not is_golden;
update t_question set stem = $qt$下列程序执行后的输出结果是（ ） 。 main() { char arr[2][4]; strcpy(arr, "you"); strcpy(arr[1], "me"); arr[0][3]='&'; printf("%s\n", arr); }$qt$, option_json = $qt${"A":"you&me","B":"you","C":"me","D":"err"}$qt$, analysis = $qt$strcpy 后输出 you。$qt$ where id = 381275 and not is_golden;
update t_question set stem = $qt$以下程序的运行情况是（）。 main() {int i=1,sum=0; while(i<10) sum=sum+1; i++; printf("i=%d,sum=%d", i,sum); }$qt$, option_json = $qt${"A":"i = 10 ，sum=9","B":"i = 9, sum = 9","C":"i = 2 ，sum=1","D":"运行出现错误"}$qt$, analysis = $qt$while 后分号使 i 不变 → 死循环（运行出错）。$qt$ where id = 381277 and not is_golden;
update t_question set stem = $qt$语句 while(!E) { ……} 中的条件！E 等价于____$qt$, option_json = $qt${"A":"E==0","B":"E!=1","C":"E!=0","D":"~ E"}$qt$, analysis = $qt$!E 等价 E==0。$qt$ where id = 381285 and not is_golden;
update t_question set stem = $qt$若有以下类型说明语句: char w; int x; float y; double z; 则表达式 w*x+z-y 的结果为____类型。$qt$, option_json = $qt${"A": "float", "B": "double", "C": "int", "D": "char"}$qt$, analysis = $qt$含 double → double。$qt$ where id = 381286 and not is_golden;
update t_question set stem = $qt$设 x、y、z 和 k 都是 int 型变量，则执行下列表达式后，变量 x 的值为 ____。 x = (y = 4, z = 16, k = 32);$qt$, option_json = $qt${"A": "4", "B": "16", "C": "32", "D": "52"}$qt$, analysis = $qt$逗号表达式取末值 32。$qt$ where id = 381288 and not is_golden;
update t_question set stem = $qt$假定有以下变量定义:int k=7, x=12; 则能使值为 3 的表达式是 ____$qt$, option_json = $qt${"A":"x%=(k%=5)","B":"x%=(k-k%5)","C":"x%=(k-k%5)","D":"(x%=k)-(k%=5)"}$qt$, analysis = $qt$(x%=k)-(k%=5)=5-2=3。$qt$ where id = 381294 and not is_golden;
update t_question set stem = $qt$当 a = 1, b = 3, c = 5, d = 4 时，执行下面一段程序后，x 的值为 ____ if (a<b) if(c<d) x=1; else if(a<c) if(b<d) x=2; else x=3; else x=6; else x=7;$qt$, option_json = $qt${"A": "1", "B": "2", "C": "3", "D": "6"}$qt$, analysis = $qt$内层均真 → x=1。$qt$ where id = 381299 and not is_golden;
update t_question set stem = $qt$下列程序是求 1+1/2+1/4+·s+1/50 的值。 #include "stdio.h" main( ) { int i=2; float sum=1; while (__(1)__) { sum=sum+1.0/i; ____(2)__; } printf( "sum=%f" , sum); }$qt$, analysis = $qt$while(i<=50){sum+=1.0/i; i+=2;}。$qt$ where id = 381304 and not is_golden;
update t_question set stem = $qt$若变量 c 为 char 类型,能正确判断出 c 为小写字母的表达式是（）。$qt$, option_json = $qt${"A":"'a' <= c <= 'z'","B":"(c >= 'a') || (c <= 'z')","C":"('a'<=c) and ('z'>=c)","D":"(c>='a') && (c<='z')"}$qt$, analysis = $qt$判断小写字母：(c>='a')&&(c<='z')（选项 D），故选 D。$qt$ where id = 381321 and not is_golden;
update t_question set stem = $qt$设 int a=12; 则表达式 a=a+a 的值是 ____。$qt$, analysis = $qt$a=a+a=24。$qt$ where id = 381391 and not is_golden;
update t_question set stem = $qt$若 a = 5, b = 6, c = 7, d = 8 则表达式 d = a / 2 & & b == c || a 的值为 ____。$qt$, analysis = $qt$5>20… 5/2=2；b==c=0；2&&0=0；0||a=1。$qt$ where id = 381392 and not is_golden;
update t_question set stem = $qt$以下不构成无限循环的语句或者语句组是____。$qt$, option_json = $qt${"A":"n = 0 ,do {+n;} while (n <= 0)","B":"n = 0; while(1){n++;}","C":"n=10; while(n); {n-,}","D":"for (n=0, i=1, ,i++) n+=i;"}$qt$, analysis = $qt$do{++n}while(n<=0) 有限循环。$qt$ where id = 381407 and not is_golden;
update t_question set stem = $qt$异或运算:运算符 (\oplus) :相同为0，否则（相异）为1。$qt$, analysis = $qt$逻辑乘法（逻辑与运算）：运算符（and ∧）、运算规则：按位运算，全1为1，否则0； 逻辑加法（逻辑或运算）：运算符（or V）、运算规则：按位运算，全0为0 ，否则为1； 逻辑否定（逻辑非运算）：运算符（not —）、运算规则：按拉运算，1取反为0 ，0取反为1。 异或运算：运算符（⊕）：相同为0，否则（相异）为1。$qt$ where id = 381429 and not is_golden;
update t_question set stem = $qt$逻辑乘法（逻辑与运算）:运算符（and \Lambda）、运算规则:按位运算，全1为1，否则0；$qt$, analysis = $qt$逻辑乘法（逻辑与运算）：运算符（and ∧）、运算规则：按位运算，全1为1，否则0； 逻辑加法（逻辑或运算）：运算符（or V）、运算规则：按位运算，全0为0 ，否则为1； 逻辑否定（逻辑非运算）：运算符（not —）、运算规则：按拉运算，1取反为0 ，0取反为1。 异或运算：运算符（⊕）：相同为0，否则（相异）为1。$qt$ where id = 381430 and not is_golden;
update t_question set stem = $qt$关于C语言的函数描述，以下说法错误的是o$qt$, option_json = $qt${"A":"一个C程序有且只有一个主函数","B":"除了主函数之外，C语言还允许用户定义函数","C":"C语言的主函数的位置可以随意放 #include <stdio.h>\nmain()\n{\nprintf(\"programming!\\n\");\n}","D":"用户自定义函数只能出现在主函数前"}$qt$, analysis = $qt$C 语言允许用户自定义函数，这些函数可以放在主函数之前，也可以放在主函数之后。选项 D 描述有误。本题答案选项 D。$qt$ where id = 381447 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是$qt$, option_json = $qt${"A":"C程序中注释部分可以出现在程序中任意合适的地方","B":"花括号\"{\"和\"\"只能作为函数体的定界符","C":"构成C程序的基本单位是函数，所有函数名都可以由用户命名","D":"分号是C语句之间的分隔符，不是语句的一部分"}$qt$, analysis = $qt$选项 A，C 程序中/*……*/和//表示注释部分，注释只是给人看的，对编译和运行不起作用，可以加在程序中任何位置，所以选项 A 是对的；选项 B，函数体是函数的主体，从左花括号开始，到与之匹配的右花括号结束。选项 C，一个 C 程序中必须有且只能有一个由"main"命名的主函数，其他函数由用户自行命名。 选项 D，C 语句是组成 C 程序的基本单位，具有独立的程序功能。所有的 C 语句都以分号结尾。故本题答案为 A。$qt$ where id = 381458 and not is_golden;
update t_question set stem = $qt$以下叙述中错误的是 0$qt$, option_json = $qt${"A":"在程序中凡是以\"#\"开始的语句行都是预处理命令行","B":"预处理命令行的最后不能以分号表示结束","C":"#defineMAX是合法的宏定义命令行","D":"C程序对预处理命令行的处理是在程序执行的过程中进行的"}$qt$, analysis = $qt$预处理命令不是 C 语言本身的组成部分，不能直接对它进行编译（因为编译程序不能识别它们），必须在对程序进行通常的编译之前，先对程序中这些特殊的命令进行"预处理"，经过预处理后程序不再包括预处理命令了，最后再由编译程序对预处理后的程序进行通常的编译。故本题答案为 D。$qt$ where id = 381464 and not is_golden;
update t_question set stem = $qt$以下选项中，合法的C语言常量是$qt$, option_json = $qt${"A":"1.234","B":"C++","C":"\"\\2.0","D":"2Kb"}$qt$, analysis = $qt$所谓常量是指在程序运行过程中，其值不能被改变的量。常量可以分为数值型常量和符号常量，数值型常量又可分为整型常量和实型常量，整型常量是由数字组成，实型常量是由小数点和数字组成，符号常量的命名要复合标识符的命名规则。故本题答案为 A。$qt$ where id = 381473 and not is_golden;
update t_question set stem = $qt$可以将变量名命名为 \mathsf { s c a n f } _ { \circ } ☑正确错误$qt$, analysis = $qt$scanf 为标准库函数名也是预定义标识符一种，可以被定义成变量名，但是会失去原有含义。$qt$ where id = 381484 and not is_golden;
update t_question set stem = $qt$不能正确表示数学式 \frac { a · b } { c } 的表达式是$qt$, option_json = $qt${"A":"a / b \\ast c","B":"a \\ast b / c","C":"a / c \\ast b","D":"a × ( b / c )"}$qt$, analysis = $qt$由题意可知 c 是除数，A 中 b 是除数，故 A 错。故本题答案为 A。$qt$ where id = 381487 and not is_golden;
update t_question set stem = $qt$设有定义:int x=11,y=12,z=0; ，以下表达式值不等于12的是$qt$, option_json = $qt${"A":"(z,x,y)","B":"( z = x , y )","C":"z = ( x , y )","D":"z = ( x == y )"}$qt$, analysis = $qt$A 选项中 x==y 不为真，表达式的值为:0。故本题答案为 D。$qt$ where id = 381488 and not is_golden;
update t_question set stem = $qt$若有C语言表达式 2+3×4+7/3 结果$qt$, option_json = $qt${"A": "15", "B": "16", "C": "9", "D": "16.5"}$qt$, analysis = $qt$*/运算符高于+。所以 3*4=12，7/3=2（除法运算符两边都为整数时，结果截去小数部分，只保留整数）。2+12+2=16。故本题答案为 B。$qt$ where id = 381489 and not is_golden;
update t_question set stem = $qt$设变量 m 为 float 类型，变量 n 为 int 类型，则以下能实现将 m 中的数值保留小数点后两位，第三位进行四舍五入运算的表达式是$qt$, option_json = $qt${"A":"n=m × 100+0.5, m=n/100.0","B":"m=(m×100+0.5)/100.0","C":"n=m/100+0.5,m=n×100.0","D":"m=m × 100+0.5/100.0"}$qt$, analysis = $qt$A 选项中 m*100 是将原数扩大 100 倍，加上 0.5 是对第三位进行四舍五入，并转换为整型赋值给 n，最后除以 100.0 是保留两位小数点并转换为 float 型；B 选项中未执行四舍五入操作，故 B 选项错误；C 选项并不是对第三位进行四舍五入，故 C 选项错误；D 选项中将原数扩大了 100 倍还要+0.0005，与原题不符，故 D 选项错误。故本题答案为 A。$qt$ where id = 381490 and not is_golden;
update t_question set stem = $qt$设变量a.b和ch已正确定义并赋初值，则以下叙述中错误的是$qt$, option_json = $qt${"A":"逗号表达式的值是最后一个表达式的运算结果","B":"运算符%的运算对象只能是整数类型","C":"语句 \\mathsf { c h } { = } ( \\mathsf { u n s i g n e d i n t } ) \\mathsf { a } { + } \\mathsf { b } ; 是对a与b之和进行强制类型转换，结果赋值给变量ch","D":"复合运算: a = b + c h 是将变量 b、ch之和与 a相乘，结果再给a赋值"}$qt$, analysis = $qt$语句 ch=(unsigned int)a+b;是对 a 进行强制类型转换，再对 a 和 b 求和，将值赋给变量 ch。所以本题答案选 C。$qt$ where id = 381491 and not is_golden;
update t_question set stem = $qt$以下选项中，能够正确利用随机函数 \mathsf { r a n d } ( ) , \mathrm { 产 } 生一个英文字母的表达式是$qt$, option_json = $qt${"A":"rand()%26 + A^{\\prime}R\\alpha Rrand()%26 + a^{\\prime}","B":"rand()%26+A^{\\prime}\\|rand()%26+a^{\\prime}","C":"rand() %2==0 ? rand() %26+^{·}A^{·}; rand() %26+^{·}a^{·}","D":"rand() %2 == 0.7 rand() %A':rand() %a'"}$qt$, analysis = $qt$||是或运算符，&&是与运算符，表达式运算结果为布尔型数据真或假，不能产生英文字母。条件 ? 表达式 1 : 表达式 2。如果条件为真，则执行表达式 1，如果条件为假，则执行表达式 2。rand()%26+'A'的结果为一个整数和 A 的 ASCII 码值的和，rand()%26 的取值范围为 0~25 之间，所以该表达式的取值范围为'A'到'Z'之间，可以得到任意大写英文字母。同理rand()%26+'a'可以得到任意小写英文字母。$qt$ where id = 381492 and not is_golden;
update t_question set stem = $qt$与数学式子 3 乘以× 的 n 次方/(2x-1)对应的 C 语言表达式是$qt$, option_json = $qt${"A":"3 × x × n / ( 2 × x - 1 )","B":"3 × x × n / ( 2 × x - 1 )","C":"3 \\star p o w ( x , n ) \\star ( 1 / ( 2 \\star x - 1 ) )","D":"3 × \\mathsf { p o w } ( \\mathsf { n } , \\mathsf { x } ) / ( 2 × \\mathsf { x } - 1 )"}$qt$, analysis = $qt$函数 pow(x,y)的功能是计算 x 的 y 次方的值，在 C 语言中没有选项 A 和选项 B 的表示方式，选项 D 中 pow(n,x)是求 n 的 x 次方值，不合题意。故本题答案为 C。$qt$ where id = 381493 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main()
{ int a;
a = (int)(-1.53*3);
printf("%d\n", a);
}
程序的运行结果是$qt$, option_json = $qt${"A":"-3","B":"-4","C":"-5","D":"结果\n不确定"}$qt$, analysis = $qt$-1.53*3=-4.59，(int)(-1.53*3)强制类型转换为整型，故 a=(int)(-1.53*3)=-4。故本题的答案为 B。$qt$ where id = 381506 and not is_golden;
update t_question set stem = $qt$若有定义:double x;，则表达式:
x=0,x+10,x++ 的值是$qt$, option_json = $qt${"A": "11.0", "B": "10.0", "C": "0.0", "D": "1.0"}$qt$, analysis = $qt$x 被定义为 double 类型，赋值过程中会出现强制类型转换。逗号表达式中，最后一个表达式的值就是此逗号表达式的值，所以整个表达式的值为 x++的值，x=0,x+10,x++表达式值为 0.0(变量在前先把变量拿出来用，然后变量再进行自增赋值操作)，最后 x 的值为 1.0，故选项 C 正确。所以本题答案选 C。$qt$ where id = 381507 and not is_golden;
update t_question set stem = $qt$若有定义语句:int x=12,y=8,z;，在其后执行语句 z = 0.9 + x / y 则z的值为$qt$, option_json = $qt${"A": "1.9", "B": "1", "C": "2", "D": "2.4"}$qt$, analysis = $qt$如果参与"/"运算的数都是整数，则运算结果为整数。因此 x/y 的运算结果为 1，再将x/y 的结果与 0.9 相加，结果为 1.9。如果赋值运算符两侧的类型不一致，但都是数值型或字符型时，在赋值时要进行类型转换。将实型数据赋给整型变量时，舍弃实数的小数部分。因此 z 的值为 1。故本题答案为 B。$qt$ where id = 381509 and not is_golden;
update t_question set stem = $qt$若有以下程序段:
int a;
a = (int)((double)(3/2) + 0.5 + (int)1.99*2);
printf("a=%d\n",a);
执行后输出结果是$qt$, option_json = $qt${"A": "a=4", "B": "a=3", "C": "a=3.5", "D": "a=2"}$qt$, analysis = $qt$a 整型，最终结果也会是整型，3/2=1 ，（double）1=1.0，1.0+0.5+1*2=3.5,最后（int）3.5=3。$qt$ where id = 381510 and not is_golden;
update t_question set stem = $qt$若有定义语句: \mathsf{int}x = 12, y = 8, z; ，在其后执行语句 z = 0.9 + x / y ，则z的值为$qt$, option_json = $qt${"A": "1.9", "B": "1", "C": "2", "D": "2.4"}$qt$, analysis = $qt$如果参与"/"运算的数都是整数，则运算结果为整数。因此 x/y 的运算结果为 1，再将x/y 的结果与 0.9 相加，结果为 1.9。如果赋值运算符两侧的类型不一致，但都是数值型或字符型时，在赋值时要进行类型转换。将实型数据赋给整型变量时，舍弃实数的小数部分。因此 z 的值为 1。$qt$ where id = 381520 and not is_golden;
update t_question set stem = $qt$设a,b,c已定义为整型变量，以下选项中不正确的赋值表达式是$qt$, option_json = $qt${"A":"a = 3 = (b = 2) = 1;","B":"a = (b = 0) * c + 1;","C":"a = b = c / 1.0;","D":"a = 10 % (b = c = 2);"}$qt$, analysis = $qt$赋值表达式的形式为:变量名=表达式。赋值号的左边必须是一个代表某一存储单元的变量名，赋值号的右边必须是 C 语言中合法的表达式。由于选项 A 中"(b=2)=1"赋值运算符左边"(b=2)"不是变量，而是表达式，所以选项 A 不正确。所以本题答案选 A。$qt$ where id = 381521 and not is_golden;
update t_question set stem = $qt$设有定义:float a=2,b=4,h=3;，以下 C 语言表达式中与代数式1/2(a+b)h 计算结果不相符的是
( a + b ) × h / 2$qt$, option_json = $qt${"A":"(a+b)*h/2","B":"( 1 / 2 ) × ( a + b ) × h","C":"(a+b)*h*1/2","D":"h/2*(a+b)"}$qt$, analysis = $qt$两个整数相除结果为整数，如 5/3 的结果为 1，舍去小数部分。如果参加运算的两个数中有一个数为实数，则结果是 double 型，因为所有实数都按 double 型进行运算。根据运算符优先级，先计算括号内的，故选项 B 中(1/2)=0，整个表达式的值为 0。故本题答案为 B。
## 视频讲解:$qt$ where id = 381523 and not is_golden;
update t_question set stem = $qt$设变量已正确定义并赋值，以下正确的表达式是$qt$, option_json = $qt${"A":"x = y × 5 = x + z","B":"int(15.8%5)","C":"x=y+z+5,++y","D":"x=25%5.0"}$qt$, analysis = $qt$由赋值运算符将一个变量和一个表达式连起来的式子称为"赋值表达式"，由于选项 A相当于"x=y*5"和"y*5=x+z"两个赋值表达式，且"y*5=x+z"由于赋值运算符左边不是变量，而是表达式，所以选项 A 不正确；由于求余运算符"%"两侧均要求为整型数据，所以选项 B、D不正确。选项 C 是一个正确的逗号表达式。故本题答案为 C。$qt$ where id = 381524 and not is_golden;
update t_question set stem = $qt$有以下定义:int a;long b;double x,y;则以下选项中正确的表达式是$qt$, option_json = $qt${"A":"a%(int)(x-y)","B":"a = x != y ;","C":"(a*y)%b","D":"y = x + y = x"}$qt$, analysis = $qt$%运算符两侧必须是整型数据，选项 A 中，%左侧的 a 是整型，右侧(int)(x-y)是将 x-y的值强制转换为整型，所以选项 A 正确。选项 B 中，x!=y 是一个关系表达式，关系表达式的值是 0 或非 0 的整型值，因此 x!=y 的值可以赋值给整型变量 a，但是选项 B 末有一个分号，所以选项 B 是一个语句而不是表达式，所以选项 B 错误。选项 C 的%左侧(a*y)是 double型，不是 int，所以选项 C 错误。赋值运算符左边必须是一个变量，右边可以是常量、变量或表达式。选项 D 中，y=x+y=x 看似一个表达式，但在 x+y=x 中，赋值号左侧是一个表达式，所以选项 D 错误。故本题答案为 A。$qt$ where id = 381526 and not is_golden;
update t_question set stem = $qt$以下选项中，与 k = n + + 完全等价的表达式是 O$qt$, option_json = $qt${"A":"k = n , n = n + 1","B":"n = n + 1, k = n","C":"k = + + n","D":"k + = n + 1"}$qt$, analysis = $qt$n++是自增运算，是先使用，然后再使 n 加 1，分开来写即为: k = n , n = n + 1 。故本题答案为 A。$qt$ where id = 381527 and not is_golden;
update t_question set stem = $qt$设有定义:int k=0; 表达式 k++与 k + = 1 的值是相同的。正确错误$qt$, analysis = $qt$表达式 k++的值是 0，而 k+=1 的值是 1。$qt$ where id = 381533 and not is_golden;
update t_question set stem = $qt$若有定义语句: \mathsf { i n t } \; \mathsf { a } { = } \mathsf { 1 0 } ; \mathsf { d o u b l e } \; \mathsf { b } { = } \mathsf { 3 . 1 4 } ，则表达式 A^{\prime} + a + b 值的类型是$qt$, analysis = $qt$不同类型的数据在进行运算时，要先转换成同一类型，然后进行运算。转换的规则是char,short->int->unsigned->long->double。本题的'A'+a+b 运算次序为（1）进行'A'+a 的运算，先将'A'转换为整型，运算结果为整型。（2）'A'+a 的和与 b 相加，先将'A'+a 的和转换为 double 型，然后与 b 相加，运算结果为 double。$qt$ where id = 381537 and not is_golden;
update t_question set stem = $qt$假定×和Y为double型，则表达式 x = 2 , Y = x + 3 / 2 的值是 。(小数只保留一位)$qt$, analysis = $qt$Y=2+3/2=2+1=3.0，Y 是浮点型。$qt$ where id = 381538 and not is_golden;
update t_question set stem = $qt$若有定义语句: \mathsf{int} \mathsf{k}1 = 10, \mathsf{k}2 = 20; ，执行表达式 ( k 1 = k 1 > k 2 ) & & ( k 2 = k 2 > k 1 ) 后，k1 和 k2 的值分别是0$qt$, analysis = $qt$当括号与逻辑运算符混合运算时，其运算优先级为先括号，后逻辑运算符。另外注意"&&"和"||"的"短路"运算。当运算符"&&"左边表达式的值为 0 时，则右边表达式就不再进行运算，整个表达式的值即为 0。本题先运算 k1>k2，结果为 0，因此 k1=0，对于与运算符"&&"，右边的表达式则不用运算了。因此 k1 和 k2 的值分别为 0 和 20。$qt$ where id = 381541 and not is_golden;
update t_question set stem = $qt$若有定义语句: \mathsf{int} \mathsf{a} = 3, \mathsf{b} = 2, \mathsf{c} = 1; 以下选项中错误的赋值表达式是$qt$, option_json = $qt${"A":"a=(b=4)=3;","B":"a=b=c+1;","C":"a=(b=4)+c;","D":"a=1+(b=c=4);"}$qt$, analysis = $qt$C 语言中，赋值号"="是一个运算符，称为赋值运算符。由赋值运算符组成的表达式称为赋值表达式。表达式的形式为:变量名=表达式。赋值号的左边必须是一个代表某一存储单元的变量名，赋值号的右边必须是 C 语言中合法的表达式。由于选项 A 相当于"x=(b=4)"和"(b=4)=3"两个赋值表达式，且由于"(b=4)=3"赋值运算符左边"(b=4)"不是变量，而是表达式，所以选项 A 不正确。故本题答案为 A。$qt$ where id = 381544 and not is_golden;
update t_question set stem = $qt$有以下程序段
int a=3, b;
b=a+3;
int c=2;
a*=c+1;
}
\min ( % d \ln a )
下面关于此段程序的说法，正确的是$qt$, option_json = $qt${"A": "这段程序的输出是9", "B": "这段程序中存在有语法错误的语句", "C": "这段程序的输出是7", "D": "可执行语句b=a+3;后，不能再定义变量c"}$qt$, analysis = $qt$a 的值为 3，a*=c+1 等同于 a=a*(c+1)，则 a 最后输出的值为 9。故本题答案为 A。$qt$ where id = 381545 and not is_golden;
update t_question set stem = $qt$有以下程序
main()
{ \mathsf { c h a r } \; \mathsf { a } 1 = \mathsf { M } ^ { \prime } , \mathsf { a } 2 = \mathsf { m } ^ { \prime } ;
prinf ( %c/n, (a1, a2) )
以下叙述中正确的是$qt$, option_json = $qt${"A": "程序输出大写字母M", "B": "程序输出小写字母m", "C": "格式说明符不足，编译出错", "D": "程序运行时产生出错信息"}$qt$, analysis = $qt$在逗号表达式（表达式 1，表达式 2）中，其运算方法是先求表达式 1 的值，然后求表达式 2 的值，整个逗号表达式的值是表达式 2 的值。故本题输出的是 a2 的值 m。$qt$ where id = 381546 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main()
{ int a=5,b=1,t;

t = (a < < 2) | b; \text {printf} (% d \backslash n", t);

}
程序运行后的输出结果是$qt$, option_json = $qt${"A": "21", "B": "11", "C": "6", "D": "1"}$qt$, analysis = $qt$先将变量 a，b 的值转换为 2 进制数，a=00000101，b=00000001，a 先左移 2 位结果为 00010100，再与 b 按位或运算，结果为 00010101，转换为十进制数为 21。故本题答案为 A。$qt$ where id = 381547 and not is_golden;
update t_question set stem = $qt$设 a、b 都是int 型变量，且都被赋值。现在 a + = b ; b = a - b ; a = a - b ; 该系列语句功能仅是相互赋值运算。
☑正确☑错误$qt$, analysis = $qt$解析；本题中的语句的功能是交换两个变量的值。除了本题给出的还有使用第三个变量来做为中间变量进行交换，比 t = a ; a = b ; b = t ;$qt$ where id = 381552 and not is_golden;
update t_question set stem = $qt$C语言允许同一行不可以写多条语句。正确错误$qt$, analysis = $qt$一行可以写多条，比如 a + = b ; b = a - b ; a = a - b ; 这样写也是正确的。$qt$ where id = 381553 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main()
{ int a=0,b=0,c=0;
c=(a-=a-5);(a=b,b+=4);
printf("%d,%d,%d\n",a,b,c);
}
程序运行后的输出结果是 0$qt$, analysis = $qt$c = (a - - 2 - 5) "相当于 c = a - ( a - 5 ) ^ { n } ，由于算术运算符优先于赋值运算符，要先计算 a-5 = 0 - 5 = - 5 ，再计算 a=a-(-5)=0-(-5)=5 ，然后 c = a = 5 , ( a = b , b = 4 ) "是一个逗号表达式，先计算 a = b = 0 ，再计算 b+=4，b+=4 相当于 b=b+4=0+4=4 。所以输出结果为 0,4,5。$qt$ where id = 381557 and not is_golden;
update t_question set stem = $qt$设 ch 是 char 型变量，其值为 A，且有下面的表达式

ch = (ch > = ^ {\prime} A ^ {\prime} & & ch < = ^ {\prime} Z ^ {\prime})? (ch + 3 2): ch;

上面语句中 ch 的值是 。(引号不用填写)$qt$, analysis = $qt$三目运算表达式的值赋值给变量 ch。赋值运算符的优先级最低，先计算三目运算符表达式结果。ch>='A'&&ch<='Z'是判断 ch 是否为 A~Z 之间字符，如果是则进行 ch+32，转成对应的小写字母，否则就是原来自己。本题中原 ch 值是’A’，则满足条件，需要进行小写转换，即‘a‘。$qt$ where id = 381558 and not is_golden;
update t_question set stem = $qt$设int a=12，则执行完语句 a+=a-=a*a；后，a的值是 o$qt$, analysis = $qt$a + = a - = a × a ; a = a + ( a - = a × a ) = a + ( a - a - ( a × a ) ) ;赋值运算都是右结合性，所以先要计算 a = \alpha - ( \partial \star \partial ) = 12 - 12 × 12 = -132; \partial = -132 + ( -132 ) = -264.$qt$ where id = 381559 and not is_golden;
update t_question set stem = $qt$设有语句 \mathsf{char}a = \backslash 072 ，则变量包含_个字符。$qt$, analysis = $qt$本题中 char 是字符，只能存放一个字符。\XXX 这个是八进制字符表示，只算一个字符,本题中是对应 ASCII 码中的:值的表示。记住‘\072‘和’\72‘表示一样的。$qt$ where id = 381560 and not is_golden;
update t_question set stem = $qt$设有如下语句:int \mathsf{k}=0;\mathsf{k}=\mathsf{p}\mathsf{r}\mathsf{i}\mathsf{n}\mathsf{t}\mathsf{f}(\mathsf{O}\mathsf{K}\mathsf{h}\mathsf{n}) ;则以下叙述中正确的是$qt$, option_json = $qt${"A": "变量k得到的是输出的可见字符个数2", "B": "变量k得到的是输出字符的总个数3", "C": "printf必须作为独立语句出现", "D": "变量k仍保持初值0"}$qt$, analysis = $qt$k=printf("OK\n") 的值为输出字符的总个数 3（选项 B），故选 B。$qt$ where id = 381562 and not is_golden;
update t_question set stem = $qt$若变量已正确定义为 int 型，要通过语句 scanf ("%d,%d,%d",&a,&b,&c);给 a 赋值 1、给 b 赋值 2、给 c 赋值3，以下输入形式中错误的是。(代表一个空格符)$qt$, option_json = $qt${"A":"441,2,3<回车>","B":"1山23<回车>","C":"1,442, 3<回车>","D":"1,2,3<回车>"}$qt$, analysis = $qt$选项“1山23”缺少逗号分隔，不能按 %d,%d,%d 正确赋值，故选 B。（选项文字系转换乱码）$qt$ where id = 381563 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是 O$qt$, option_json = $qt${"A": "空语句就是指程序中的空行", "B": "花括号对{能用来表示函数的开头和结尾，不能用于其他目的", "C": "scanf 从键盘输入数据时，每行数据在没按下回车键(Enter键)前，可以任意修改", "D": "复合语句在语法上包含多条语句，其中不能定义局部变量"}$qt$, analysis = $qt$在 C 语言中，由&&或||构成的逻辑表达式，在特定的情况下会产生"短路"现象；数学表达式 0 < x < 1 0 完全等价于 C 语言的关系表达式:(0<x) && (x<10)；逻辑运算符与赋值运算符、算术运算符、关系运算符之间从高到低的运算优先级次序是:!（逻辑"非"）、算数运算符、关系运算符、&&（逻辑"与"）、||（逻辑"或"）、赋值运算符。$qt$ where id = 381568 and not is_golden;
update t_question set stem = $qt$设有定义:double x;，以下选项中不能将输入数据3.14 读入赋给变量×的是$qt$, option_json = $qt${"A":"scanf(%41^{\\prime\\prime}, &x);","B":"\\mathsf{scanft}(\\forall \\theta \\mid \\mathsf{f}^m, \\theta, x);","C":"\\mathsf{scanf(%le, & x);}","D":"scanf(\"%4.2f\",&x);"}$qt$, analysis = $qt$scanf 的格式串不能带精度："%4.2f" 不能将 3.14 正确读入（选项 D），故选 D。$qt$ where id = 381569 and not is_golden;
update t_question set stem = $qt$设有定义:double x=3.33;，以下不能完整输出变量×值的语句是$qt$, option_json = $qt${"A":"print(x = % \\land n, x);","B":"printf(\"x=%f\\n\",x);","C":"printf(\"x=%4.0f\\n\",x);","D":"prinf(x = % 0.5 \\land n, x);"}$qt$, analysis = $qt$printf("x=%4.0f") 只能输出 3，不能完整输出 3.33（选项 C），故选 C。$qt$ where id = 381570 and not is_golden;
update t_question set stem = $qt$若有定义:char c; int d;，程序运行时输入:1,2 <回车>，能把值1输入给变量C、值2输入给变量d的输入语句是scanf("%d,%f", \mathsf { R c , } \mathsf { R d ) } 。正确☑错误$qt$, analysis = $qt$数据 1 是字符型，数据 2 是整型，对应的格式控制形式为%c、%d。正确的输入语句是scanf(“%c,%d”,&c,&d);$qt$ where id = 381574 and not is_golden;
update t_question set stem = $qt$下列条件语句中，输出结果与其他语句不同的是$qt$, option_json = $qt${"A":"if(a) printf(\" %d\\n\",x); else print(\"%d\\n\".y)","B":"if(a==0) printf(\" %d\\n\",y); else print(\"%d\\n\",x);","C":"if(a!=0) printf(\" %d\\n\",x); else print(\"%d\\n\".y)","D":"if(a==0) printf(\" %d\\n\",x); else print(\"%d\\n\",y);"}$qt$, analysis = $qt$选项 A:如果 a 为非 0，则输出 x，否则输出 y _ { \circ } 。选项 B:如果 a 为 0，则输出 y，否则输出 \mathsf { X } _ { \circ } 选项 C:如果 a 为非 0，则输出 x，否则输出 y _ { \circ } 选项 D:如果 a 为 0，则输出 x，否则输出 y。故本题答案为 D。$qt$ where id = 381588 and not is_golden;
update t_question set stem = $qt$设变量×和y均已正确定义并赋值。以下if语句中，在编译时将产生错误信息的是$qt$, option_json = $qt${"A":"if(x++);","B":"if(x>y && y!=0);","C":"if(x>0) x--\nelse y++;","D":"if(y<0) {;} else x++;"}$qt$, analysis = $qt$C 选项中，x—缺少；$qt$ where id = 381589 and not is_golden;
update t_question set stem = $qt$执行以下程序段后，w的值为
int w='A',x=14,y=15; w = ( ( x | | y ) & & ( w < a ) )$qt$, option_json = $qt${"A": "-1", "B": "NULL", "C": "1", "D": "0"}$qt$, analysis = $qt$当括号与逻辑运算符混合运算时，其运算优先级为先括号，后逻辑运算符。另外注意"&&"和"||"的"短路"运算。当运算符" 8 8 左边表达式的值为 0 时，则右边表达式就不再进行运算，整个表达式的值即为 0；当运算符"||"左边表达式的值为非零时，则右边表达式就不再进行运算，整个表达式的值为 1。本题先运算表达式"x||y"，由于 x=14、y=15 均为非零，所以 x \| y { = } 1 。则对于与运算符"&&"，还必须运算其右边的表达式" w < a ，由于 A 的 ASCII 码是 65，a 的 ASCII 码是 97，所以 w { <= } { \mathsf { a } } ^ { \mathsf { r } } 的值为 1，故整个表达式的值为 1。$qt$ where id = 381590 and not is_golden;
update t_question set stem = $qt$设有定义:inta=1,b=2,c=3;，以下语句中执行效果与其它三个不同的是$qt$, option_json = $qt${"A":"if(a>b) c=a,a=b,b=c;","B":"if(a>b) {c=a,a=b,b=c;}","C":"if(a>b) c=a;a=b;b=c;","D":"\\mathsf { i f } ( \\mathsf { a } \\mathsf { > } \\mathsf { b } ) { \\mathsf { c } \\mathsf { = } \\mathsf { a } \\mathsf { ; } \\mathsf { a } \\mathsf { = } \\mathsf { b } \\mathsf { ; } \\mathsf { b } \\mathsf { = } \\mathsf { c } \\mathsf { ; } }"}$qt$, analysis = $qt$选项 A 的 if 语句中是个逗号表达式，在逗号表达式（表达式 1，表达式 2，表达式 3）中，其运算方法是先求表达式 1 的值，然后求表达式 2 的值，再求表达式 3 的值，整个逗号表达式的值是表达式 3 的值，即为 1，但本题中的 if 条件并未满足，所以后面的逗号表达式并未执行。选项 B 的 if 语句后较选项 A 多了个大括号，即将 if 的语句体用大括号括起来了，由于大括号内只有一个逗号表达式作为 if 的语句体，所以其执行效果与选项 A 是相同的。选项 D 的语句体同样是三个表达式，所以执行效果与选项 A、B 相同。选项 C 中的语句体没有加大括号，所以只有"c=a;"是 if 的语句体，程序没有执行"c=a;"却继续执行" a = b ; b = c ; ，故选项 C 与其他三个的执行效果不同。$qt$ where id = 381591 and not is_golden;
update t_question set stem = $qt$设有条件表达式: ( \exp ) ? x + + ; y - - ，则以下表达式中与(exp)完全等价的是$qt$, option_json = $qt${"A": "( exp ==0)", "B": "(exp!=0)", "C": "(exp ==1)", "D": "(exp!=1)"}$qt$, analysis = $qt$exp 为真时执行 x++否则执行 y--。exp!=0 时才为真。$qt$ where id = 381593 and not is_golden;
update t_question set stem = $qt$有如下嵌套的if语句
if(a<b)
if(a<c) k=a;
else k=c;
else
if(b<c) k=b;
else k=c;
以下选项中与上述if语句等价的语句是$qt$, option_json = $qt${"A":"k=(a<b)?a:b;k=(b<c)?b:c;","B":"k=(a<b)?((b<c)?a:b);((b>c)?b:c);","C":"k=(a<b)?((a<c)?a:c);((b<c)?b:c);","D":"k=(a<b)?a:b;k=(a<c)?a:c;"}$qt$, analysis = $qt$本题是 if 嵌套与三目运算嵌套等价转换，if …else…可以用一个表达式 1？表达式 2:表达式 3；来转换，if 后面还有嵌套一个 if…else…可以再使得？:转换。，放位置放于表达式2 位置。else 后面的也转换一个，放于表达式 3 位置。$qt$ where id = 381594 and not is_golden;
update t_question set stem = $qt$表示关系式 x <= y <= z 的C 语言表达式的是$qt$, option_json = $qt${"A":"(x<=y<=z)","B":"(x<=y)|(y<=z)","C":"(x<=y)&&(y<=z)","D":"(x <= y) \\mid (y <= z)"}$qt$, analysis = $qt$表示关系式 x≤y≤z 在 C 语言中可表示为:(x<=y)&&(y<=z)。$qt$ where id = 381595 and not is_golden;
update t_question set stem = $qt$对于浮点变量×和y，表达式: x = - y 是非法的，会出编译错误。正确错误$qt$, analysis = $qt$合法的表达式。$qt$ where id = 381598 and not is_golden;
update t_question set stem = $qt$对于逻辑表达式: a + + 8 8 b + + 设a的值为0. 则求解表达式的值后，b的值会发生改变。正确错误$qt$, analysis = $qt$本题&&出现短路现象，所以 b 的值不会发生改变。$qt$ where id = 381603 and not is_golden;
update t_question set stem = $qt$有以下程序
main()
{ int i;
for(i=1;i<=40;i++)
{ if(i++%5==0)
if(++i%8==0) printf ("%d",i);
}
printf("\n");
}
执行后的输出结果是$qt$, analysis = $qt$在满足 for 语句条件下，第一个 if 语句的条件是指 i 先对 5 取余后，再自行加 1；第二个 if语句的条件是指: \mathsf { i } { \equiv } \mathsf { i } { + } 1 后，再对 8 取余。设可以满足第一个 if 语句的值为:x，那么可以满足第二个 if 语句的值为: x { + } 2 ，转换为方程组:

{ \begin{array}{l} x % 5 = 0 \ (x + 2) % 8 = 0 \end{array} .

解方程组: x = 3 2$qt$ where id = 381607 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main()
{ int a=1,b=2,c=3,d=0;
if (a==1 && b++==2)
if(b!=2||c--!=3)
printf("%d,%d,%d\n",a,b,c);
else printf("%d,%d,%d\n",a,b,c);
else printf("%d,%d,%d\n",a,b,c);
}
程序运行后的输出结果是$qt$, analysis = $qt$需要注意"&&"和"||"的"短路"运算。当运算符"&&"左边表达式的值为 0 时，则右边表达式就不再进行运算，整个表达式的值即为 0；当运算符"||"左边表达式的值为非零时，则右边表达式就不再进行运算，整个表达式的值为 1。程序首先对变量 a、b、c、d 初始化，然后执行第一个 if 语句，计算表达式" a = 1 × 8 b + + = 2 的值，因为 a { \mathrm { = } } 1 ，所以左边表达式的值为 1，因此接着判断 b + + = = 2 是否成立，由于 b++表示在使用后再将 b 加 1，因此 b + + = = 2的值为 1。所以表达式 a==1 && b + + = = 2 的值为 1，即 if 语句的条件成立。接着执行第二个 if 语句，计算表达 b ! = 2 \vert \vert c - - \vert = 3 的值，因 b { = } 3 ，所以 b!=2 的值为 1，则表达式 c -- 1 = 3 就不再进行运算，整个表达式的值为 1，因为第二个 if 语句的条件成立，执行其后的printf("%d,%d, \forall a d \ln ( a , b , c ) ;语句，输出变量 a、b、c 的值，此时 a=1, b=1, c=3 ，因此输出1,3,3。
## 视频讲解$qt$ where id = 381608 and not is_golden;
update t_question set stem = $qt$若以下选项中的变量全部为整型变量，且已正确定义并赋值，则语法正确的switch语句是$qt$, option_json = $qt${"A":"switch(a+9)\n{ case c1:y=a-b;\ncase c2:y=a+b;\n}","B":"switch a*b\n{ case 10:x=a+b;\ndefault :y=a-b;\n}","C":"switch (a+b)\n{ case1:case3:y=a+b;break;\ncase0:case4:y=a-b;\n}","D":"switch (a*a+b*b)\n{ default:break;\ncase 3: y=a+b; break;\ncase 2: y=a-b; break;\n}"}$qt$, analysis = $qt$选项 A 中，若 c1、c2 的值相等，则 switch 语句是不成立的。选项 B 中，a*b 需要使用一对圆括号括起来。选项 C 中，在关键字 case 与 1、3、0、4 之间一定要有空格。$qt$ where id = 381609 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main()
{ int s=0,n;
for(n=0;n<3;n++)
{ switch(s)
{ case 0:
case 1: s+=1;
case 2: s+=2; break;
case 3: s+=3;
default: s+=4;
}
printf("%d,",s);
}
}
程序运行后的输出结果是____。$qt$, analysis = $qt$本程序执行过程如下:当 n=0 时，此时 s=0，则执行 case 0，再执行 case 1 后面的语句 s+=1，即 s=s+1=0+1=1，接着执行 case 2 后面的语句 s+=2，即 s=s+2=1+2=3 ，跳出该 switch 语句体，输出 3。当 n=1 时，此时 s=3，则执行 case 3 后面的语句 s+=3，即s=s+3=3+3=6 ，接着执行 default 后面的语句 s+=4，即 s=s+4=6+4=10 ，跳出该 switch 语句体，输出 10。当 n=2 时，此时 s=10，则执行 default 后面的语句 s+=4，即 s=s+4=10+4=14跳出该 switch 语句体，输出 14。当 n=3 时，不满足 for 循环条件，结束循环。$qt$ where id = 381624 and not is_golden;
update t_question set stem = $qt$若有定义:int a=0,b=0,c=0,d=0；，有 C 语言表达式(a++ && b++)？c++:d++，以下关于其执行顺序的叙述正确是$qt$, option_json = $qt${"A":"先执行b++，表达式 b++的值为1；再执行 a++，表达式 a++的值为 1，由此可确定(a++ && b++)值为1. 因此执行c++","B":"先执行a++，表达式a++的值为0；再执行b++，表达式b++的值为0，由此可确定(a++ &&b++)值为0. 因此执行d++","C":"先执行 a++，表达式a++的值为1；再执行b++，表达式b++的值为1，由此可确定(a++ &&b++)值为 1，因此执行 c++","D":"先执行a++，表达式 a++的值为0，由此即可确定 ( a + + 8 & b + + ) 值为0，因此执行d++"}$qt$, analysis = $qt$表达式 (a++ && b++) ? c++ : d++中&&左边的表达式为假，则不必执行&&右边的表达式，直接执行 d++语句，表达式执行后:a=1，b=0，c=0，d=1。$qt$ where id = 381626 and not is_golden;
update t_question set stem = $qt$若有定义:inta=0,b=0,c=0,d=0;，以下关于C语言表达式: ( + + a | | + + b ) ? + + c : + + d 执行顺序的叙述正确的是$qt$, option_json = $qt${"A": "先执行++a，表达式++a的值为1，由此可确定(++a∥++b)值为1，因此执行++c", "B": "先执行++a，表达式++a的值为1；再执行++b，表达式++b的值为1，由此可确定(++a∥++b)值为1，因此执行++c", "C": "先执行++b，表达式++b的值为1；再执行++a，表达式++a的值为1，由此可确定(++a∥++b)值为1，因此执行++c", "D": "先执行++a，++b，++c，++d，使得 的值都为1，由此可确定(++a∥++b)值为1，因此执行++c"}$qt$, analysis = $qt$先执行++a，表达式++a 的值为 1，由此可确定(++a||++b)值为 1，不必执行++b 语句，直接执行++c 语句。$qt$ where id = 381627 and not is_golden;
update t_question set stem = $qt$有语句: k = x < y ? (y < z ? 1 : 0) ; 0; ，以下选项中，与此语句功能相同的是$qt$, option_json = $qt${"A":"if(x<y) if(y<z) k=1;else k=0;","B":"\\mathsf{if}(\\mathsf{x} < \\mathsf{y})   \\mathsf{k} = 0;   \\mathsf{else}   \\mathsf{if}(\\mathsf{y} < \\mathsf{z})   \\mathsf{k} = 1;","C":"if(x<y && y<z) k=1; else k=0;","D":"if(x<y ∥ y<z) k=1; else k=0;"}$qt$, analysis = $qt$k=x<y ?(y<z?1:0):0 表达式功能是:x<y 为真时，执行(y<z?1:0)表达式，在该表达式中，若 y<z 为真，k=1，若为假，k=0；x<y 为假时，k=0，只有选项 C 与题目中的表达式功能一样。$qt$ where id = 381628 and not is_golden;
update t_question set stem = $qt$若i和 k都是 int 类型变量，有以下 for 语句: \mathsf { f o r } ( \mathsf { i } { = } 0 \mathsf { , } \mathsf { k } { = } 0 \mathsf { ; } \mathsf { k } { = } 1 \mathsf { ; } \mathsf { k } { + } { + } ) \mathsf { p r i n t f ( = = = } \mathsf { \backslash n } \mathsf { ) } ; 下面关于语句执行情况的叙述中正确的是$qt$, option_json = $qt${"A": "循环体执行两次", "B": "循环体执行一次", "C": "循环体一次也不执行", "D": "构成无限循环"}$qt$, analysis = $qt$本题的 for 循环条件 k=1 是一个赋值表达式，则循环条件每次都是成立的，所以构成无限循环。$qt$ where id = 381644 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是
main(){
int i, k, a[10], p[3];
k=5;
for(i=0;i<10;i++) a[i]=i;
for(i=0;i<3;i++) p[i]=a[i*(i+1)];
for(i=0;i<3;i++) k+=p[i]*2;
printf("%d\n",k);
}$qt$, option_json = $qt${"A": "20", "B": "21", "C": "22", "D": "23"}$qt$, analysis = $qt$按照程序的流程运行一遍，我们可以得到， \mathsf{p}[0]=0,\mathsf{p}[1]=2,\mathsf{p}[3]=6; ；执行三次 k+=p[i]*2，相当于 k=5+0*2+2*2+6*2=21。$qt$ where id = 381648 and not is_golden;
update t_question set stem = $qt$对干循环语句:for(i=0;i<=10;i++){；}下面各选项的叙述中错误的是 o$qt$, option_json = $qt${"A":"省略i=0,可引起无限循环","B":"省略i<=10,可引起无限循环","C":"省略i++,可引起无限循环","D":"圆括号()内三个表达式都省略，可引起无限循环"}$qt$, analysis = $qt$C 语言中 for 循环语句的一般形式为:for(表达式 1;表达式 2;表达式 3) 语句部分。其执行过程为:表达式 1 首先执行且只执行一次；然后执行表达式 2，通常都是一个用于判定条件的表达式，如果表达式 2 条件成立，就执行(需要执行的语句)；然后再执行表达式 3；再判断表达式 2，执行(需要执行的语句)；再执行表达式 3......一直到表达式 2 不成立时，跳出循环。$qt$ where id = 381651 and not is_golden;
update t_question set stem = $qt$给定程序中，函数 fun的功能是:将十进制正整数 m 转换成 k(2≤k≤9)进制数，并按位输出。例如，若输入8和2，则应输出1000(即十进制数8转换成二进制表示是1000)。请补全代码。
#include <conio.h>
#include <stdio.h>
void fun( int m, int k )
{
int aa[20], i;
for( i = 0; m; i++ ) {
aa[i] = ________;
m /= k;
}
for(i -= 1; ________; i -- )
printf( "%d", aa[i]);
}
main(){
int b, n;
printf( "\nPlease enter a number and a base:\n" );
scanf( "%d %d", &n, &b );
fun( n, b );
printf("\n"); getchar();
system("pause");
}$qt$, analysis = $qt$十进制转换成其他进制（2，3，4 等），整数除以其他进制基数（2，3，4）逆取余。
第一空处:从已知的代码中，aa 数组中存放余数，但是从下标 0 开始存放，即正序存放，意味着输出时要倒序输出；m 是十进制，k 其他进制数，取余使用%即填定 m%k；第二空处:
第二个 for 循环是处理输出，这里处理的是倒序输出，从第一 for 循环的变量 i 是被+1 之后，以 for 第一表达式处理了-1 操作，那中间判断条件是倒序至下标为 0。所以 \mathrm { i { > } { = } 0 ; }$qt$ where id = 381663 and not is_golden;
update t_question set stem = $qt$在以下给出的表达式中，与while(EXP)中的(EXP)不等价的表达式是$qt$, option_json = $qt${"A":"(!EXP==0)","B":"(EXP >0|| EXP <0)","C":"(EXP==0)","D":"(EXP!=0)"}$qt$, analysis = $qt$while(表达式)语句用来实现"当型"循环结构，当表达式为非 0 值时，执行 while 语句中的内嵌语句。选项 A 非零即为 1，选项 B 与选项 D 的结果也为 1，只有选项 C 为 0。$qt$ where id = 381666 and not is_golden;
update t_question set stem = $qt$以下能够实现计算 10! 的程序段，请补全。
int fac=1,k=0;
do{ k++; _______; } while(k<____);$qt$, analysis = $qt$10!=1*2*3*4*5*6*7*8*9*10。
第一处缺少累乘代码，fac*=k,也可以写成 fac=fac*k；
第二处是判断边界的，最的一次执行循环体时，k++，k = 10 ,fac*=10,然后判断 k<10,即 1 0 { < } 1 0不满足条件，即退出 do while 循环。$qt$ where id = 381686 and not is_golden;
update t_question set stem = $qt$函数fun的功能是:逆置数组元素中的值。例如:若a所指数组中的数据依次为:1、2、3、4、5、6、7、8、9. 则逆置后依次为:9、8、7、6、5、4、3、2、1。形参n给出数组中数据的个数。请在程序的下划线处填入正确的内容。
#include <stdio.h>
void fun(int a[], int n){ int i,t;
i=0;
while(i<____){
t=a[i];
a[i] = a[n-1-____];
a[____] = t;
______;
}}
main()
{ int b[9]={1,2,3,4,5,6,7,8,9}, i;$qt$, analysis = $qt$要逆置一个含有 n 个元素的数组 a，只要依次做下列操作:将 a[0]与 a[n-1]交换，将 a[1]与 a[n-2]交换，……，这样一共要交换 n/2 对元素，故第一空应填 n/2;对于第 i( i < - n / 2 ) 个元素，它应与 a[n-1-i]交换，故第二空应填 i;在本题中，交换两个数是通过中间变量来实现的，假设要交换的数据为 a, b，我们可以利用中间变量 t 来完成交换，执行语句如下:t=a;a=b ; b=t;，根据该思想，第三处应填入的语句为 a[n-1-i]或其等效形式。第四处，缺少循环变量变量即 i++。$qt$ where id = 381687 and not is_golden;
update t_question set stem = $qt$有如下程序段

\text {for} (i = 0; i < 2 0; i + +)

\text {if (i < = 10) break;}

则循环结束后i的值为$qt$, option_json = $qt${"A": "10", "B": "6", "C": "1", "D": "0"}$qt$, analysis = $qt$当 i=0 时，i <= 10 满足条件，执行 break 语句，跳出循环，循环结束，i 的值还是为0。$qt$ where id = 381688 and not is_golden;
update t_question set stem = $qt$有以下程序
main()
{int a=1,b;
for(b=1;b<=10;b++)
{if(a>=8) break;
if(a%2==1){a+=5;continue;}
a-=3;
}
printf("%d\n",b);
}
程序运行后的输出结果是$qt$, option_json = $qt${"A": "3", "B": "4", "C": "5", "D": "6"}$qt$, analysis = $qt$break 和 continue 的区别是:continue 语句只结束本次循环，而不是终止整个循环的执行；而 break 语句则是结束整个循环过程，不再判断执行的条件是否成立。本题具体执行过程如下:a=1,b=1:a>=8 不成立，判断 a%2==1 成立，a+=5 则 a=6，continue，执行下一次循环； a=6,b=2:a>=8 不成立，判断 a%2==1 不成立，a-=3 则 a=3，执行下一次循环；a=3,b=3; \; a>=8 不成立，判断 a%2==1 成立，a+=5 则 a=8，continue，执行下一次循环；a=8,b=4;a>=8 成立，break，结束整个循环，输出 b 的值 4。$qt$ where id = 381691 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main()
{ int x=8; for(;x>0;x--)
{if(x%3) {printf("%d,",x--);continue;}
printf("%d,",--x);
1
程序的运行结果是$qt$, option_json = $qt${"A": "7,4,2,", "B": "8,7,5,2,", "C": "9,7,6,4,", "D": "8,5,4,2,"}$qt$, analysis = $qt$continue 语句的功能是结束本次循环，即跳过循环体中下面尚未执行的语句，接着进行下次是否执行循环的判定。本题执行过程如下:x=8:判断表达式 x>0，值为真，执行 for循环，判断条件表达式 x%3，值为真，输出 x--，即先输出 x 再减 1，即输出 8，然后 x 减 1，此时 x=7;遇到 continue，跳过下面的语句，判断 for 语句的表达式，由于循环表达式使得 x减 1，所以此时 x 再次减 1，即 x = 6; x = 6; 判断表达式 x>0，值为真，执行 for 循环，判断条件表达式 x%3，值为假，跳过 if 语句，执行下面的 printf 语句，输出--x，即 x 先减 1，再输出，此时输出的 x 为 5，判断 for 语句的表达式，由于循环表达式使得 x 减 1，所以此时 x再次减 1，即 x = 4; x = 4; 判断表达式 x>0，值为真，执行 for 循环，判断条件表达式 x%3，值为真，输出 x--，即先输出 x 再减 1，即输出 4，然后 x 减 1，此时 x=3;遇到 continue，跳过下面的语句，判断 for 语句的表达式，由于循环表达式使得 x 减 1，所以此时 x 再次减 1，即 x=2；x=2:判断表达式 x>0，值为真，执行 for 循环，判断条件表达式 x%3，值为真，输出 x--，即先输出 x 再减 1，即输出 2，然后 x 减 1，此时 x=1;遇到 continue，跳过下面的语句，判断 for 语句的表达式，由于循环表达式使得 x 减 1，所以此时 x 再次减 1，即 x=0；x=0:判断表达式 x>0，值为假，退出 for 循环。$qt$ where id = 381692 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
main(){
int i;
for( i=1; i<= 5; i++ )
{ if( i % 2) printf( "*" );
else continue;
printf( "#" );
一
printf( "\\n");
1
程序运行后的输出结果是$qt$, option_json = $qt${"A":"*#*#*#\\","B":"*#*#*\\","C":"*#*#\\","D":"*#*#*#*\\"}$qt$, analysis = $qt$continue 语句的作用是跳过本次循环体中余下尚未执行的语句，立刻进行下一次的循环条件判断，可以理解为仅结束本次循环。当 i=1 时，i % 2==1 为真，输出*#；当 i=2 时，i % 2==0 为假，执行 continue 语句，结束本次循环；当 i=3 时，i % 2==1 为真，输出*#；当i=4 时，i % 2==0 为假，执行 continue 语句，结束本次循环；当 i=5 时，i % 2==1 为真，输出*#；当 i=6 时，不满足条件，终止循环，执行 printf( "\\n" )语句，输出:\。$qt$ where id = 381694 and not is_golden;
update t_question set stem = $qt$以下程序段中的变量已正确定义

\text {for} (i = 0; i < 3; i + +, i + +)

\text {for} (j = 1; j < 3; j + +); \text {printf} (#);

程序段的输出结果是$qt$, option_json = $qt${"A": "#", "B": "##", "C": "###", "D": "####"}$qt$, analysis = $qt$本题中，要需要注意的是 printf 函数之前有；了，说明 printf 函数不是循环体内容。循环体是空语句。最后只输出#。$qt$ where id = 381707 and not is_golden;
update t_question set stem = $qt$有以下程序

# \text {include}< \text {stdio.h> }

\text {main} ()

{\text {int} k, m, n = 1;

\text {for} (k = 1; k < 4; k + +) {. .

for(m=3;m>0;m--)
{if(k*m>5) break;
n*=k*m;
}
}
printf("n=%d\n",n);
}
程序运行后的输出结果是$qt$, option_json = $qt${"A": "n=1", "B": "n=2", "C": "n=4", "D": "n=6"}$qt$, analysis = $qt$外循环 k=1 时，m=3 至 1。k=1，m=3 时， k × m = 1 × 3 > 5 不成立， n × = k × m = 1 × 3 = 3自减 1，m=2;

k = 1, m = 2, k * m = 1 * 2 > 5 \text {不成立，} n * = k * m = 3 * 2 = 6, m \text {自减} 1, m = 1;

k=1,m=1,k × m=1 × 1>5 不成立， n × = k × m = 6 × 1 = 8 自减 1，m=0，不成立循环条件退出内层循环，外循环 k 自增 1，k=2;
k=2,m=3,k × m=2 × 3=6>5 成立，break，退出内层循环，k++=3,之后 k*m 都是大于 5 所以最后 n 的值是 6。$qt$ where id = 381708 and not is_golden;
update t_question set stem = $qt$有以下程序

\text {main} ()

{\text {int} i, j, s = 0;

\text {for} (i = 0; i < 2; i + +)

{s + +;

\text {for} (j = 0; j < = 3; j + +)

{\text {if(j%2) continue;}

s + + ;

} . }

s + +;

} . }

\operatorname{printf} (" s = % d \backslash n", s);

程序执行后的输出结果是$qt$, analysis = $qt$continue 语句的作用是用于结束本次循环，即跳过循环体中下面尚未执行的语句，接着进行下一次是否执行循环的判定。当外层循环 for(i=0;i<2;i++) 满足条件的情况下执行循环体，循环体中包含了嵌套的内层循环 for(j=0;j<=3,j++){·s·s} 在内层循环中，当 if 条件语句不成立时执行 continue 语句，其作用是跳过"x++;"，继续执行内层循环的 for 语句，直到内层循环条件不满足，则执行跳出内层循环，执行外层循环的"x++;"语句，然后再对 i 进行判断，直到外层循环条件不满足，跳出外层循环，执行输出语句，结果为 8。$qt$ where id = 381714 and not is_golden;
update t_question set stem = $qt$以下能正确定义一维数组的选项是$qt$, option_json = $qt${"A":"int n☑","B":"#define N 100\nint n[N]","C":"int n[0..100]","D":"int N=100; int n[N]"}$qt$, analysis = $qt$数组的常量表达式中可以包括整型常量和符号常量，不能包括变量。也就是说，C 不允许对数组的大小作动态定义，即数组的大小不依赖于程序运行过程中变量的值，所以选项A 不正确。而选项 B 事先定义一个字符常量 N，所以可以在数组中作常量表达式，选项 B 正确。而选项 C 中不能用区间表示数组大小；在 D 中 N 虽然被赋为 100，但 N 仍然为变量，所以不对。$qt$ where id = 381719 and not is_golden;
update t_question set stem = $qt$已有定义: char a \square = xyz, b \square = {x', y', z'}; ，以下叙述中正确的是$qt$, option_json = $qt${"A": "数组a和 b的长度相同", "B": "a数组长度小于b数组长度", "C": "a数组长度大于b数组长度", "D": "上述说法都不对"}$qt$, analysis = $qt$C 语言规定'\0'为字符串结束标志，系统对字符串常量自动加一个'\0'为结束符。所以"char a[]="xyz""的数组长度为 4，而"b[]={'x','y','z'};"的数组长度为 3（此处的数组长度与 strlen函数所求的长度不同，此处的长度是指数组占内存空间的大小），故 a 数组长度大于 b 数组长度。$qt$ where id = 381720 and not is_golden;
update t_question set stem = $qt$设有一个M*N的矩阵已经存放在一个M行N列的数组x中，且有以下程序段sum=0;

\text {for} (i = 0; i < M; i + +)   \text {sum} + = x [ i ] [ 0 ] + x [ i ] [ N - 1 ];

\text {for} (j = 1; j < N - 1; j + +) \text {sum} + = x [ 0 ] [ j ] + x [ M - 1 ] [ j ];

以上程序段计算的是$qt$, option_json = $qt${"A": "矩阵所有靠边元素之和", "B": "矩阵所有不靠边元素之和", "C": "矩阵所有元素之和", "D": "矩阵两条对角线元素之和"}$qt$, analysis = $qt$x[i][0]代表着每一行的第一个元素，x[i][N-1]代表着每一行的最后一个元素；因为 j>=1 and j<=N-1 即 j 是代表着除了第一列和最后一列的其他列，x[0][j]代表着第 j 列的第一个元素，x[M-1][j]代表着第 j 列的最后一个元素。故本程序段的结果是矩阵所有靠边元素之和。$qt$ where id = 381737 and not is_golden;
update t_question set stem = $qt$若有以下程序
#include <stdio.h>
main()
{ char w[20], a[5][10]={"abcdef", "ghijkl",
"mnopq", "rstuv", "wxyz"};
int p[6][2]={{0,1},{1,5},{0,0},{0,2},{1,4},{4,4}}, i;
for (i=0; i<6; i++) w[i]=a[ p[i][0 ][ p[i][1] ];
puts(w);
}
则程序的输出结果是$qt$, analysis = $qt$当 \mathsf{i}=0,  \mathsf{w}[1]=\mathsf{a}[0][1]=\mathsf{b}; 当 i=1，w[1]=a[1][5]=l；当 i=2， \mathsf{w}[2]=\mathsf{a}[0][0]=\mathsf{a}; ；当 i=3，w[3]=a[0][2]=c； 当 i=4，w[4]=a[1][4]=k；当 i=5，w[5]=a[4][4]= '\0。$qt$ where id = 381749 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
#define N 4
int fun( int a[][N] )
{ int i,j,x=0;
for(i=0;i<N;i++)
for(j=0;j<N;j++)
if (i == j)
x += a[N-1-j][i];
return x;
}
main( )
{ int x[N][N]={{1,2,3,4}, {5,6,7,8},
{9,10,11,12},
{13,14,15,17}}, y;
y = fun(x);
printf("%d\n",y);
}
程序运行后的输出结果是$qt$, analysis = $qt$程序中，条件为 i==j 有 4 种情况分别是 \mathsf{i}{=}0, \mathsf{j}{=}0; \mathsf{i}{=}1, \mathsf{j}{=}1; \mathsf{i}{=}2, \mathsf{j}{=}2; \mathsf{i}{=}3, \mathsf{j}{=}3 。 \mathsf { i } { = } 0 , \mathsf { j } { = } 0 时，x=x+a[3][0]，x=13；i=1，j=1 时，x=13+10=23；i=2，j=2 时， x=23+7=30 i=3，j=3 时，x=30+4=34。$qt$ where id = 381750 and not is_golden;
update t_question set stem = $qt$设有: static char str[]=Non \log Sh; 则执行printf("%d\n",strlen(strcpy(str,"JiangSu")));后的输出结果为 o$qt$, option_json = $qt${"A": "7", "B": "8", "C": "9", "D": "10"}$qt$, analysis = $qt$在执行 printf()函数前，数组 str 的长度是 10，但是使用 strcpy()函数将新的值赋给 str后，strlen()函数返回的应当是现在的 str 字符串的字符个数，即是 7。$qt$ where id = 381753 and not is_golden;
update t_question set stem = $qt$设有如下的程序段
char str[]="Hello";
char *ptr;
ptr=str;
执行完上面的程序段后， \star ( \mathrm { p t r } + 5 ) 和 str[5]值为$qt$, option_json = $qt${"A":"\" _{ O } \"","B":"NO^{\\prime}","C":"不确定的值","D":"\"  O \"  的地址"}$qt$, analysis = $qt$ptr=str 实际上是将串 str 的首地址赋给了指针变量 ptr，所以 ptr+5 将指向 str 串的第六个数组元素，即是串的隐含结束标志'\0'， \star (ptr + 5) = str[5] = \backslash 0 ，最后的结果为'\0'。$qt$ where id = 381756 and not is_golden;
update t_question set stem = $qt$下列选项中正确的语句组是$qt$, option_json = $qt${"A":"\\mathsf { c h a r } \\; \\mathsf { s } [ 8 ] { ; } \\mathsf { s } { = } { \\mathsf { N a n l i n g } }","B":"\\mathsf { c h a r } × \\mathsf { s } ; \\mathsf { s } { = } { \\mathsf { N a n j i n g } }","C":"\\mathsf { c h a r } \\; \\mathsf { s } [ 8 ] { ; } \\mathsf { s } { = } \\mathsf { N a n j i n g }","D":"\\mathsf { c h a r } \\star \\mathsf { s } ; \\mathsf { s } = \\mathsf { N a n j i n g }"}$qt$, analysis = $qt$选项 A、C 是对字符数组初始化，可以是逐个字符赋给数组中各元素，也可以对整个字符串赋初值.所以选项 A、C 都不对。
选项 B、D 是想通过字符指针来实现，正确的格式是 \mathsf { c h a r } \star \mathsf { s } ; \mathsf { s } { = } \mathsf { N a n j i n g }
正确的初始化字符数组:

\text {char} s [ 8 ] = {\text {"NanJing"} };

\text {char s[]} = \text {"NanJing";}

\text {char} s [ 8 ] = " \text {Nanjing}";

\text {char} s [ 8 ] = {\prime N ^ {\prime}, ^ {\prime} a ^ {\prime}, ^ {\prime} n ^ {\prime}, ^ {\prime} J ^ {\prime}, ^ {\prime} i ^ {\prime}, ^ {\prime} n ^ {\prime}, ^ {\prime} g ^ {\prime} }; / / \text {未指数组的元素，默认是} 0 = ^ {\prime} \backslash 0 ^ {\prime}

\text {char s[ ] = = {^{\prime} N^{\prime},^{\prime} a^{\prime},^{\prime} n^{\prime},^{\prime} J^{\prime},^{\prime} i^{\prime},^{\prime} n^{\prime},^{\prime} g^{\prime},^{\prime} \setminus 0^{\prime}}}; / ^ {\prime} \setminus 0^{\prime}必须要加，不然输出会有问题$qt$ where id = 381759 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <string.h>
main()
{ char p[]={'a','b','c'},q[10]={'a','b','c'};
printf("%d %d\n",strlen(p),strlen(q));
}
以下叙述中正确的是$qt$, option_json = $qt${"A": "在给p和q 数组置初值时，系统会自动添加字符串结束符，故输出的长度都为3", "B": "由于p数组中没有字符串结束符，长度不能确定；但q数组中字符长度为3", "C": "由于q数组中没有字符串结束符，长度不能确定；但p数组中字符长度为3", "D": "由于p和q数组中没有字符串结束符，故长度都不能确定"}$qt$, analysis = $qt$strlen 是计算以"\0"结束的字符串的长度的函数，函数的值为字符串中实际长度，不包括"\0"。题中 q[10]={a',b',c'} 虽然给出了数组大小，即数组实际分配的存储空间，但此字符串只占用前 3 个存储单元，其余存储单元系统自动加上"\0"，故数组 q 的长度为 3；由于p 数组中没有字符串结束符，故字符串的长度不能确定。$qt$ where id = 381760 and not is_golden;
update t_question set stem = $qt$在进行排序时，经常会用到交换变量值的算法，已知 int a,b,t;//a，b为要交换的变量；请写使用 C 语言实现交换语句 o$qt$, analysis = $qt$三个变量方法交换: t = a ; a = b ; b = t ;$qt$ where id = 381786 and not is_golden;
update t_question set stem = $qt$交换变量值的算法，除了使用第个变量进行交换，还一种方法是直接在两个变量上操作进行交换，请写出相关语句$qt$, analysis = $qt$除了使用辅助变量交换变量值，以外还可以使用 a + = b ; b = a - b ; a = a - b ;$qt$ where id = 381787 and not is_golden;
update t_question set stem = $qt$如下代码中bubble函数是冒泡排序实现代码，需要实现降序。冒泡的排序算法原理:
如果排序是升序，则从前面往后开始，依此比较相邻的两个元素的大小，较大的下沉，较小的上升。第一轮过后，最大的元素就放在最后一位了。第二轮过后，次大的元素排序到倒第二个，以此类推。
如果排序是降序，则从前面往后开始，依此比较相邻的两个元素的大小，较小的下沉，较大的上升。第一轮过后，最小的元素就放在最后一位了。第二轮过后，次小的元素就放在倒数第二位了，之后依此类推。
#include <stdio.h>
#define SWAP(A,B) A=A+B;B=A-B;A=A-B
#define ARRLEN(arr) (sizeof(arr)/sizeof(arr[0]))
void bubble(int a[],int len);// 冒泡排序
void print(int a[], int len);//输出数组元素
int main() {
int arr[] = { 789,345,20,34,234,12,0,134,567,56};
int length = ARRLEN(arr);
printf("排序前:\n");
print(arr, length);
bubble(arr, length); // 冒泡排序
printf("排序后:\n");
print(arr, length);
return 0;
}
/*
实现数据的排序 (降序)
*/
void bubble(int a[],int len) {
int i, j;
for (i = 0; i < len - 1; i++) {
for (j = 0; j < _______; j++) {
if (__________) {
________;
}
}
}
}
void print(int a[], int len) {
int i;
for (i = 0; i < len; i++) {
printf("a[%d]=%d ", i, a[i]);
}
printf("\n");
system("pause");
}$qt$, analysis = $qt$其实冒泡排序可以用一个公式总结:如果有 N 个数需要排序，首先考虑两重循环外层循环 for(int i=0;i<N-1;i++)，内层循环 for(int)=0; j<N-j-1; j++) 即内层循环数=N-外层循环计数-1。第一空填 len-i-1。第二空是需要判断，决定是升序还是降序，冒泡比较的是相邻两个元素，所以是 a[j]与 a[j+1]。当 a[j]<a[j+1]即降序，把小的往下沉；当 a[j]>a[j+1]即升序，把大的往下沉。第三空是填的关于交换语句的，程序开头有预处理的带参宏 SWAP 用于交换，即填 SWAP(a[j],a[j+1])。$qt$ where id = 381790 and not is_golden;
update t_question set stem = $qt$二分查找的基本思想是将n个元素分成大致相等的两部分，取a[n/2]与×做比较，如果x=a[n/2],则找到x,算法中止；如果 x<a[n/2],则只要在数组 a的左半部分继续搜索 x,如果 x>a[n/2],则只要在数组 a 的右半部搜索x。请补全以下代码。
#include <stdio.h>
#include <stdlib.h>
//二分查找，找不到返回-1，找到了返回元素值。
int binary_search(int list[],int len,int target){
int low = 0;
int hight = len-1;
int middle;
while(low <= hight){
middle = ________;
if(__________)
printf("已找到该值，数组下标
为:%d\n",middle);
return list[middle];
}else if(list[middle] > target){
hight = middle -1;
}else if(list[middle] < target){
low = ________;
}
}
printf("未找到该值");
return -1;
}
int main(){
int arr[] = {1,2,3,5,7,9,12,14,18,19,20};
int b =
binary_search(arr,sizeof(arr)/sizeof(arr[0]),1);
printf("要找的元素=%d\n",b);
system("pause");
return 0;
}$qt$, analysis = $qt$第一空填 middle 的计算式，middle=(low+hight)/2；第二空填的是 \mathsf { l i s t } [ \mathsf { m i d d l e } ] = = target，判断 middle 所在下标的元素是否是目标值。第三空要填的 low 的变化计算公式，middle+1。$qt$ where id = 381791 and not is_golden;
update t_question set stem = $qt$设有以下程序段:int y； y=rand() % 25+1;则变量y 的取值范围是$qt$, option_json = $qt${"A":"0≤y≤25 0≤y≤25","B":"0<y≤25 0<y≤25","C":"1<y<25","D":"1<y≤25"}$qt$, analysis = $qt$rand 函数产生的随机数范围是 0-32767，本题中 rand()%25+1，范围是[1,25]，可以写成 1≤y≤25 或 0＜y≤25 或 1≤y＜26 或 0＜y＜26。$qt$ where id = 381793 and not is_golden;
update t_question set stem = $qt$有以下程序:
float fun(int x,int y)
{return(x+y); }
main() {int a=2,b=5,c=8;
printf("%3.0f\n",fun((int)fun(a+c,b),a-c));
}
程序运行后的输出结果是$qt$, analysis = $qt$函数 \tan ( ( \ln t ) \tan ( a + c , b ) , a - c ) 的返回值为 ( \operatorname { f l o a t } ) ( ( \operatorname { i n t } ) \operatorname { f u n } ( a + c , b ) + ( a - c ) ) ，因为 ( \mathsf { i n t } ) \mathsf { f u n } ( a + c , b )的返回值为 (a+c)+b=10+5=15 ，所以 fun((int)fun(10,5),-6)的返回值为 15+(-6)=9 。$qt$ where id = 381844 and not is_golden;
update t_question set stem = $qt$以下程序中，函数fun的功能是:从3 个红球，5 个白球，6个黑球中任意取出8个为一组，进行输出。每组中可以没有黑球，但必须有红球和白球。组合数作为函数值返回。
#include <stdio.h>
int fun()
{ int i,j,k,sum=0;
printf("\nThe result :\n\n");
for(i=____; i<=3; i++){
for(j=1; j<=5; j++){
_________;
if(k>=0 ____ k<=6){
sum=sum+1;
printf("red:%4d white:%4d black:%4d\n",i,j,k);
}}}
return sum;}
main(){ int sum;
sum=fun();
printf("sum =%4d\n\n",sum);
getchar();
system("pause");}$qt$, analysis = $qt$从已知代码中，可能得到 k 表示是黑球，i 表进红球，j 表示是白球。因为红球和白球必须所以，i 需要从 1 开始，所以第一空填 1。第二空是需要填有关 k 的计算表达式。每组是 8 个，减少去红球和白球，剩下就是黑球数，k=8-i-j 或 k=8-j-i 或 k=8-(i+j)或 k = 8 - ( j + i )第三空是判断黑球是否在 0 至 6 之间，需要使用逻辑与&&来联接。$qt$ where id = 381847 and not is_golden;
update t_question set stem = $qt$以下程序中，函数fun的功能是，求整数×的次方的低3位值。
#include <stdio.h>
#pragma warning (disable:4996)
long fun(int x,int y,long *p )
{ int i;
long t=____(1)__;
for(i=1;____(2)____; i++)
t=t*x;
*p=t;
t=____(3)____;
return t;}
main(){ long t,r; int x,y;
printf("\nInput x and y: "); scanf("%ld%ld",&x,&y);
t=fun(x,y,&r);
printf("\n\nx=%d, y=%d, r=%ld, last=%ld\n\n",x,
y,r,t );
system("pause");
}$qt$, analysis = $qt$t 用于计算 x*x*…，所以初始值应该是 1。第一空填 1。第二空需要填有关循环边界值，y 个 x 相乘，所以 \mathsf { i } { < } \mathsf { = } \mathsf { y } _ { \circ } 。第三空，最后返回的是 t，t 应该需要重复赋值为计算结果的后三位数，通过 t%1000 来获取后三位数。$qt$ where id = 381848 and not is_golden;
update t_question set stem = $qt$有以下程序
int f1(int x,int y){return x>y?x:y;}
int f2(int x,int y){return x>y?y:x;}
main(){

\begin{array}{l} \text {int} a = 4, b = 3, c = 5, d = 2, e, f, g; \ e = f2(f1(a,b),f1(c,d)); \ \end{array}

f=f1(f2(a,b),f2(c,d));
g=a+b+c+d-e-f;
printf("%d,%d,%d\n",e,f,g);
}程序运行后的输出结果是 0$qt$, analysis = $qt$函数 f1 的功能是返回两个数中比较大的值，f2 的功能是返回两个数中比较小的值。具体执行过程如下:1、f1(a,b):即 f1(4,3)，返回值为 4；2、f1(c,d):即 f1(5,2)，返回值为 5；3、e=f2(f1(a,b),f1(c,d)):即 f2(4,5)，返回值为 4；4、f2(a,b):即 f2(4,3)，返回值为 3；5、f2(c,d):即 f2(5,2)，返回值为 2；6、f=f1(f2(a,b),f2(c,d)):即 f1(3,2)，返回值为 3；7、 g = a + b + c + d - e - f;:即 g=7。$qt$ where id = 381857 and not is_golden;
update t_question set stem = $qt$如以下阶乘公式，使用递归函数计算。

n! = { \begin{array}{c c} 1 & (n = 0, 1) \ n * (n - 1)! & (n > 1) \end{array} .

include <stdio.h>
//求 n 的阶乘
long factorial(int n) {
if (n == 0__(1)____n == 1) {
return 1;
}
else {
return ____(2)____; // 递归调用
}}
int main() { int a;
printf("Input a number: ");
scanf("%d", &a);
printf("Factorial(%d) = %ld\n", a, factorial(a));
return 0;
}$qt$, analysis = $qt$从公式上可以看出，n=0 或 1 时结果为 1，第一空填||。第二空是填写递归调用语句，n>=2 时，等 n*(n-1)*……，递归调用语句 factorial(n-1)*n。$qt$ where id = 381864 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是 C
int x=3;
main(){ int i;
for(i=1;i<x;i++) incre();
}
incre(){ static int x=1;
x*=x+1;
printf("%d",x);}$qt$, analysis = $qt$incre()中定义一个静态局部变量 x,它的作用范围仅限于本函数中，而不会影响 main()函数中的 x 值，所以 main()中执行两次 for 循环，第一次调用 incre()函数时，函数中 x 的初值是 1， x ^ { \star } = x + 1 语句可以写成 x = x × ( x + 1 ) ,结果 x 的值变成 2,随后输出值 2；在第二次调用incre()函数时，x 的值继承了上次调用的运行结果，变成了 2，执行了 x × = x + 1 后，x 的值是6,故又输出了数字 6。$qt$ where id = 381878 and not is_golden;
update t_question set stem = $qt$有以下程序
int a=3;
main() {int s=0;
{int a=5;s+=a++;}
s+=a++; printf("%d\n",s);
}
程序运行后的输出结果是$qt$, analysis = $qt$在本题中，a 为全局变量，s 为局部变量。 \mathsf{S}=\mathsf{S}+\mathsf{a}++=5,\mathsf{S}+=\mathsf{a}++ ，此时 s=s+a++=5+3=8$qt$ where id = 381879 and not is_golden;
update t_question set stem = $qt$有以下程序
#include <stdio.h>
int a=1;
int f(int c){ static int a=2;
c=c+1;
return (a++)+c;
}
main(){int i,k=0;
for(i=0;i<2;i++) {int a=3;k+=f(a);}
k+=a;
printf("%d\n",k);
}程序的运行结果是$qt$, analysis = $qt$本题定义的 \lim_{a \to 1} a = 1. "中的全局变量 a，其作用范围是从定义此变量的位置开始到本源文件结束；"static int a { = } 2 ; 中的静态局部变量 a 的作用范围是其所在的函数 f，并对其只赋一次初值，以后每次调用函数时不再重新赋初值，而只是保留上次函数调用结束时的值。在主函数中，执行第一次 for 循环， \mathsf{i}=1:\mathsf{k}=\mathsf{k}+\mathsf{f}(3) ，其中 f(3)的值为调用函数 f 后返回的值，即(a + +) + c 的值，由于此时的值为 2 + 4 = 6 ，所以第一次 for 循环结束后， k = 6,  a = 3;  i = 2; k = 6 + f(3) f(3)的值同样为 ( a + + ) + c 的值，由于在 f 函数中 a 是静态变量，所以第二次调用 f函数时 a 的值为第一次调用 f 函数结束时的值 3，故 (a + +) + c = 3 + 4 ，所以第二次 for 循环结束后， k = 6 + 7 ，即 k 的值为 13；for 循环执行两次结束后，执行 k + = a ，由于此时的 a 的值是全局变量的值，所以 k=k+a=13+1=14 。故程序运行后的结果为 14。$qt$ where id = 381881 and not is_golden;
update t_question set stem = $qt$有以下程序
int a=2;
int f(int n){static int a=3;
int t=0;
if(n%2){ static int a=4;t+=a++;
}
else { static int a=5;t+=a++;
}
return t+a++;
}
main(){int s=a,i;
for(i=0;i<3;i++) s+=f(i); printf("%d\n",s);
}
程序运行后的输出结果是____。$qt$, analysis = $qt$解本题要弄清楚这样几点:1、定义 \lim_{a \to 2} a = 2 中的全局变量 a，其作用范围是从定义此变量的位置开始到本源文件结束； 2、\mathsf{static}\mathsf{int}a=3; 中的静态局部变量 a 的作用范围是其所在的函数 f，并对其只赋一次初值，以后每次调用函数时不再重新赋初值，而只是保留上次函数调用结束时的值；3、复合语句"{ static int a=4;t+=a++; }"和"{ \mathsf { s t a t i c i n t a } { = } 5 ; \mathsf { t } { + } { = } \mathsf { a } { + } { + } ;中定义的两个变量 a 属于复合语句中定义的变量，作用范围只在其本身所在的复合语句内。对于本程序来讲，第三行定义的静态局部变量并不会对四、五两行的复合语句产生作用，这是因为复合语句中也定义了与其同名的静态局部变量。$qt$ where id = 381882 and not is_golden;
update t_question set stem = $qt$若有条件表达式(exp)? a++: b++, 则以下表达式中能完全等价于表达式(exp)的是()$qt$, option_json = $qt${"A":"(\\exp == 0)","B":"(exp!=0)","C":"(exp==1)","D":"(exp!=1)"}$qt$, analysis = $qt$(exp) 等价 exp!=0。$qt$ where id = 382445 and not is_golden;
update t_question set stem = $qt$若 x 和 y 代表整型数，以下表达式中不能正确表示的数学关系式|x-y|<10 的是____。$qt$, option_json = $qt${"A":"abs(x-y)<10","B":"x-y>-10&&x-y<10","C":"!(x-y)<-10||!(y-x)>10","D":"(x-y)*(x-y)<100"}$qt$, analysis = $qt$A、B、D 均等价于 |x−y|<10；C 式逻辑结构错误、不能正确表示（选项 C），故选 C。$qt$ where id = 382451 and not is_golden;
update t_question set stem = $qt$利用以下语句计算自由落体运动的位移 s = 1 / 2 * g^{-t} * t^{*}，设上述变量均定义为 double 型，则关于变量 s 的说法正确的是()。$qt$, option_json = $qt${"A": "s的值和类型均为未知", "B": "s的值为0，类型为double", "C": "s 的值未知，因 g 和 t 的值未知,类型为 double", "D": "s 的值为 0, 类型为 int"}$qt$, analysis = $qt$题目中说了，以上变量均定义为 double,说明 s 的类型是 double

s = 1 / 2 * g ^ {\prime} t ^ {\prime} t

s = 0 ^ {*} g ^ {*} t ^ {*} t,

s = 0;$qt$ where id = 382453 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是( )
main(){
int x,y,z,

x = y = 1;

z = (x + +, y + +), + + y;

\text {printf} (" % d, % d, % d \backslash n", x, y z);

}$qt$, option_json = $qt${"A": "2,3,3", "B": "2,3,2", "C": "2,3,1", "D": "2,2,1"}$qt$, analysis = $qt$z=(x++,y++)=1；++y 后 y=3 → 2,3,1。$qt$ where id = 382459 and not is_golden;
update t_question set stem = $qt$假定所有变量均已正确说明，以下程序段运行后的输出结果是 。

\text {int} i, s = 0;

\text {for} (i = 1; i < 1 0; i + = 2)

s + = i + 1;

\operatorname{printf} (% d \backslash n ^ {\prime}, s)$qt$, option_json = $qt${"A": "自然数1~9的累加和", "B": "自然数1~10的累加和", "C": "自然数1~9中奇数之和", "D": "自然数1~10中偶数之和"}$qt$, analysis = $qt$i=1,3,5,7,9 → 2+4+6+8+10（1~10 偶数之和）。$qt$ where id = 382466 and not is_golden;
update t_question set stem = $qt$以下程序段的输出结果是____。

\begin{array}{l} \text {int} i = 0, \text {sum} = 1; \ do { \ \end{array}

\begin{array}{l} \text {sum} + = i + +; \ } \text {while} (i < 5); \ \text {printf} (% d \backslash n, \text {sum}); \ \end{array}$qt$, analysis = $qt$（AI 补答）sum=1+0+1+2+3+4=11。$qt$ where id = 382467 and not is_golden;
update t_question set stem = $qt$以下能对一维数组 a 进行初始化的语句是:()$qt$, option_json = $qt${"A": "int a[5]=(0,1,2,3,4;)", "B": "int a(5)={};", "C": "int a[3]={0,1,2};", "D": "int a{5}={10*1};"}$qt$, analysis = $qt$int a[3]={0,1,2}; 能对一维数组正确初始化（选项 C），故选 C。$qt$ where id = 382473 and not is_golden;
update t_question set stem = $qt$下述程序运行后输出结果是()
main(){
int n[3],i,j,k;
for(i=0;i<3;i++) n[i]=0;
k=2;
for (i=0;i<k;i++)
 for(j=0;j<k;j++) n[j]=n[i]+1;
printf("%d\n ",n[1]);$qt$, option_json = $qt${"A":"2","B":"1","C":"0","D":"3\n}"}$qt$, analysis = $qt$双重循环逐次更新后 n[1]=3（选项 D），故选 D。$qt$ where id = 382475 and not is_golden;
update t_question set stem = $qt$有如下程序:

\text {main () } {

\text {int} y = 3, x = 3, z = 1;

printf ("%d,%d\n",(++x,y++),z+2);
}
运行该程序的输出结果是____。$qt$, analysis = $qt$输出 3,3。$qt$ where id = 382476 and not is_golden;
update t_question set stem = $qt$下面程序的运行结果是()
#include"stdio.h"
main( ){
 int i;
 for( i=1;j<=5;i++){
 if (i%2==0 ) printf("*");
 else continue;
 printf("#");$qt$, option_json = $qt${"A":"*#*#\\","B":"#*#*#*\\","C":"*#*#*\\","D":"#*#*\\"}$qt$, analysis = $qt$i=2,4 输出 *# → *#*#。$qt$ where id = 382507 and not is_golden;
update t_question set stem = $qt$对 C 语言来说，下列标识符中哪些是合法的？$qt$, option_json = $qt${"A":"total","B":"_debug","C":"Large&Tall","D":"Counter1","E":"begin_","F":"SUM","G":"5S","H":"max"}$qt$, analysis = $qt$无$qt$ where id = 382540 and not is_golden;
update t_question set stem = $qt$若有定义:int x=0;，则执行赋值语句: x = (x = 3 + 5, x * 5) ; 后，变量 x 中的值是 。$qt$, analysis = $qt$无$qt$ where id = 382544 and not is_golden;
update t_question set stem = $qt$设 float m=4.0, n=4.0; 使 m 为 10.0 的表达式是（ ）$qt$, option_json = $qt${"A":"m-n^{*}2.5","B":"m = n + 9","C":"m^{*} = n - 6","D":"m+=n+2"}$qt$, analysis = $qt$m+=n+2=4+6=10。$qt$ where id = 382559 and not is_golden;
update t_question set stem = $qt$设变量定义为 int a,b;执行下列语句时,输入( ),则 a 和 b 的值都是 10 scanf( `` % d, % d '', & a, & b )$qt$, option_json = $qt${"A":"10 10","B":"10,10","C":"a=10 b=10","D":"a=10,b=10"}$qt$, analysis = $qt$输入 10,10。$qt$ where id = 382562 and not is_golden;
update t_question set stem = $qt$有如下程序段:  \text {int} a = 3, b = 1 5;   \text {float} f = 7. 5;   \text {printf} (^ {\prime \prime} %. 1 f ^ {\prime}, (\text {float}) a + b / 2 + (\text {int}) f % 3);  执行该程序段后,运算结果为:（ ）$qt$, option_json = $qt${"A": "11.5", "B": "11.0", "C": "11", "D": "12.0"}$qt$, analysis = $qt$（AI 补答）b/2 为整数除法得 7，(int)f%3=1，3.0+7+1=11.0，故选 B。$qt$ where id = 382563 and not is_golden;
update t_question set stem = $qt$数字字符 0 的 ASCII 值为 48,若有以下程序 \operatorname* { m i n } ( ) { char a='1',b='2'; printf("%c,",b++); printf("%d\n",b-a); } 程序运行后的输出结果是 （ ）$qt$, option_json = $qt${"A": "3,2", "B": "50,2", "C": "2,2", "D": "2,50"}$qt$, analysis = $qt$b++ 输出 '2'（b 变 '3'）；b−a=2：输出 2,2（选项 C），故选 C。$qt$ where id = 382564 and not is_golden;
update t_question set stem = $qt$有以下程序 main() { int m,n,p; scanf("m=%dn=%dp=%d",&m,&n,&p); printf("%d%d%d\n",m,n,p); } 若想从键盘上输入数据,使变量 m 中的值为 123,n 中的值为 456,p 中的值为 789,则正确的输入是（ ）$qt$, option_json = $qt${"A":"m=123n=456p=789","B":"m=123 n=456 p=789","C":"m=123,n=456,p=789","D":"123 456 789"}$qt$, analysis = $qt$scanf("m=%dn=%dp=%d") 中 n=、p= 为普通字符须原样输入：m=123n=456p=789（选项 A），故选 A。$qt$ where id = 382566 and not is_golden;
update t_question set stem = $qt$设 int a=3,b=5; float x=7.5,y=3.5 ；则表达式:(float)a+b/2+(int)x%(int)y 是值是 。$qt$, analysis = $qt$(float)a=3，b/2=2，(int)x%(int)y=1，和 6。$qt$ where id = 382568 and not is_golden;
update t_question set stem = $qt$代数式 \frac { 3 + a b } { c + d } 表示成 C 表达式为$qt$, analysis = $qt$(3+a*b)/(c+d)。$qt$ where id = 382570 and not is_golden;
update t_question set stem = $qt$若有定义: intx = 2, y = 3, z = 4; 则表达式 (x + y) + z - 1 && y + z % 2 的值为（ ）$qt$, option_json = $qt${"A": "4", "B": "0", "C": "1", "D": "2"}$qt$, analysis = $qt$8 真 && 3 真 → 1。$qt$ where id = 382572 and not is_golden;
update t_question set stem = $qt$设 int \scriptstyle { \mathsf { a } } = 0 , { \mathsf { b } } = 0 , { \mathsf { c } } = 0 ; { \mathsf { c } } = + + { \mathsf { a } } ||b++;则 a、b、c 值分别为（ ）$qt$, option_json = $qt${"A": "0 1 0", "B": "1 1 1", "C": "1 1 0", "D": "1 0 1"}$qt$, analysis = $qt$（AI 补答）++a 为真短路 b 不自增；a=1、b=0、c=1，故选 D。$qt$ where id = 382573 and not is_golden;
update t_question set stem = $qt$执行语句 :int a=1,b=0,c;c=a>0\parallel ++b; 后,b 的值为( )$qt$, option_json = $qt${"A": "0", "B": "1", "C": "2", "D": "不确定"}$qt$, analysis = $qt$a>0 真短路 ++b → b=0。$qt$ where id = 382574 and not is_golden;
update t_question set stem = $qt$？若变量已正确定义,语句” if(x>y)z=0;elsez=1 和( )等价。$qt$, option_json = $qt${"A":"z=(x>y)?1:0","B":"z=x>y;","C":"z=x<=y;","D":"x<=y?0:1"}$qt$, analysis = $qt$z=x<=y 与 if-else 等价。$qt$ where id = 382575 and not is_golden;
update t_question set stem = $qt$设 inta = 5, b = 4; 则表达式 (a = b + +)? + + a : b + +) 的值是（ ）$qt$, option_json = $qt${"A": "4", "B": "5", "C": "6", "D": "3"}$qt$, analysis = $qt$a=b++=4 真 → ++a=5。$qt$ where id = 382578 and not is_golden;
update t_question set stem = $qt$?下列( ) 循环不是无限循环$qt$, option_json = $qt${"A":"for(y=0; x=1 ; ++y);","B":"for(; ; x=0);","C":"while (x=1) {x=1; }","D":"for(y=0,x=1;x>++y;x++) ，"}$qt$, analysis = $qt$D 项非无限循环。$qt$ where id = 382590 and not is_golden;
update t_question set stem = $qt$下列对 C 语言中语句 “while [P] S;” 的解释中，正确的是 ____。$qt$, option_json = $qt${"A":"先执行语句 S，然后根据 P 的值决定是否再执行语句 S","B":"语句S不会被执行两次以上","C":"若条件 P 的值为真，则重复执行语句S，直到 P 的值为假","D":"语句S至少会被执行一次"}$qt$, analysis = $qt$while P 真重复执行 S 直到假。$qt$ where id = 383201 and not is_golden;
update t_question set stem = $qt$下面程序段的运行结果是( ).  \text {for} (y = 1; y < 10;) y = ((x = 3 ^ {*} y, x + 1), x - 1);   \text {printf} ( " x = % d, y = % d" , x, y );$qt$, analysis = $qt$逐轮求值：x=15、y=14 时退出。$qt$ where id = 384447 and not is_golden;
update t_question set stem = $qt$合法的C语言长整型常量为: \underline{CA}$qt$, option_json = $qt${"A":"OL","B":"234345","C":"1454D","D":"3666&"}$qt$, analysis = $qt$0L 是长整型常量。$qt$ where id = 384454 and not is_golden;
update t_question set stem = $qt$以下数组定义中不正确的是 {7}。$qt$, option_json = $qt${"A": "int a[2][3];", "B": "int b[ j][3]=(0,1,2,3).", "C": "int c[100][100]={0}", "D": "int d[3][j] = {(1,2), (1,2,3), (1,2,3,4)};"}$qt$, analysis = $qt$C 语言中多维数组赋初值时可以部分赋值，如果对全部元素赋初值，则定义数组时对第一维的长度可以不指定，但第二维的长度不能省。$qt$ where id = 384460 and not is_golden;
update t_question set stem = $qt$下面程序的输出是() #include<stdio.h> int main(){$qt$, option_json = $qt${"A":"5 int i=0;","B":"6 while(i++<5);","C":"无输出 printf(\"%d\",i);","D":"其他 return 0;"}$qt$, analysis = $qt$考点：C语言自增运算与空循环体while。程序还原为 int i=0; while(i++<5); printf("%d",i);：先取i当前值比较再自增，比较序列为0,1,2,3,4,5，第6次判断5<5不成立且i已自增为6，故输出6，即B。A(5)、C(无输出)、D(其他)均不符合循环语义。$qt$ where id = 384576 and not is_golden;
update t_question set stem = $qt$有以下程序 #include <stdio.h> main(){ int a = 0, b = 0; /* 给 a 赋值 a=10; b=20; 给 b 赋值 */ printf("a+b=%d\n",a+b); /* 输出计算结果 */ } 程序运行后的输出结果是$qt$, analysis = $qt$注释内容中变量赋值是不会被执行到的，仅是内容解释和说明用。所以输出的值还是原来a,b中值相加之后的结果，原来a,b都是0；所以a+b=0。 ### 视频讲解 ![图片](images/v2-d3d07bc71fedcf7b0bb13e611758fb0d.jpg)02:56 ---$qt$ where id = 384717 and not is_golden;
update t_question set stem = $qt$若有以下程序: main() {int k=2,i=2,m; m=(k+=i*=k);printf("%d,%d\n",m,i); } 执行后的输出结果是$qt$, analysis = $qt$在赋值符"="之前加上其它运算符，可以构成复合的运算符。此运算为右结合性，即从右往左计算。i*=k 即 i=i*k=2*2=4， k = k + 1 = 2 + 4 = 6 ，然后将 k 的值赋给 m。$qt$ where id = 384731 and not is_golden;
update t_question set stem = $qt$写出下面脚本实现的功能，并将下面脚本的功能利用for循环实现（5分） #!/bin/bash num=1 while [ \num –le 100 ] do m=\expr \num % 2  if [ \m –eq 0 ] then echo \num fi num=\expr \num + 1 done$qt$, analysis = $qt$功能：输出 1~100 之间的所有偶数。for 改写：for((num=1;num<=100;num++)); do m=`expr num % 2`; if [ m -eq 0 ]; then echo num; fi; done$qt$ where id = 384788 and not is_golden;
update t_question set stem = $qt$设 x、y、z、t 的值均为 int 变量, 且初值都为 -1 , 则执行语句 “t=++x&&++y||++z;”后, x 的值为——, y 的值为——, z 的值为——, t 的值为——$qt$, analysis = $qt$++x 得 0（假）使 && 短路（++y 不执行、y 仍 -1），|| 右侧 ++z 得 0，t=0，故填 0、-1、0、0。$qt$ where id = 384875 and not is_golden;
update t_question set stem = $qt$设 x、y、z、t 均为 int 整型变量，初值都为 -1，则执行语句“ t=++x||++y&&++z ”后，xd 的值——，y 的值——，Z 的值——，t 的值——$qt$, analysis = $qt$++x 得 0（假），|| 右侧 ++y 得 0（假）使 && 短路（++z 不执行），t=0，故填 0、0、-1、0。$qt$ where id = 384878 and not is_golden;
update t_question set stem = $qt$有以下程序 #include <stdio.h> main(){ int a = 0, b = 0; /* 给 a 赋值 a=10; b=20; 给 b 赋值 */ printf("a+b=%d\n",a+b); /* 输出计算结果 */ } 程序运行后的输出结果是$qt$, analysis = $qt$赋值语句在注释中未执行，a、b 保持 0；输出 a+b=0。$qt$ where id = 384886 and not is_golden;
update t_question set stem = $qt$以下代码中，函数 funDel 的功能是:从给的字str 中删除全部字母'f'或'F'。请根据已知的代码进行空。  # \text {include} < \text {stdio.h} >   \text {void funDel(char *str)}   {\text {int} i, j;   \text {for} (i = j = 0; \text {str} [ i ]! = ^ {\prime} \backslash 0 ^ {\prime}; i + +)   \text {if} (\operatorname{str} [ i ]! = ^ {\prime} f _ _ _ _ \text {str} [ i ]! = ^ {\prime} F ^ {\prime})   str [ _ ] = str [ i ];   str [ _ ] = ^ {\prime} \backslash 0 ^ {\prime};   } . }   \text {main} ()   {\text {char str[100]};   \text {printf} (" \text {请输入一个字符串：}); \text {gets(str)};   \text {printf} (" \text {原字符串:}); \text {puts(str)};   \text {funDel} (\text {str}); / / \text {调用 del 函数}$qt$, analysis = $qt$本题函数删除原理就是一个一个字符判断，过滤字母f和F。将不是这两个字符往前移，结尾再加上结束符。所以一第空是填有关[逻辑运算符](https://zhida.zhihu.com/search?content_id=180769777&content_type=Article&match_order=1&q=%E9%80%BB%E8%BE%91%E8%BF%90%E7%AE%97%E7%AC%A6&zhida_source=entity)的，同时不为f和F才进行移动，是且的关系，填&&。第二空填是j++，需要将后面字符往前移，使用j变量从0开始计数一个一个数组元素赋值。第三个空填j最后加上‘\0’。 ---$qt$ where id = 384888 and not is_golden;
update t_question set stem = $qt$以下程序中, 函数 fun 的功能是: 从 3 个红球, 5 个白球, 6 个黑球中任意取出 8 个为一组, 进行输出。每组中可以没有黑球, 但必须有红球和白球。组合数作为函数值返回。 #include <stdio.h> int fun() { int i,j,k,sum=0;  printf(\The result: \n\n);   \text {tor} (i = _ _; i < = 3; i + +)}   \text {for} (j = 1; j < = 5; j + +)}   S _ {i} = \frac {1}{2} (\frac {1}{2}) ^ {2}.   \text {if} (k > = 0 _ k < = 6) {}   \text {sum} = \text {sum} + 1;   \text {printf} (" \text {red}: % 4 \text {d white}: % 4 \text {d black}: % 4 \text {d} \backslash \text {n}", i, j, k);  }}  \text {return sum;} }   \text {main} () {\text {int sum;}   \text {sum = fun();}   \operatorname{printf} (" \text {sum} = % 4 d \backslash n \backslash n", \text {sum});  getchar();$qt$, analysis = $qt$从已知代码中，可能得到k表示是黑球，i表进红球，j表示是白球。因为红球和白球必须所以，i需要从1开始，所以第一空填1。第二空是需要填有关k的计算表达式。每组是8个，减少去红球和白球，剩下就是黑球数，k=8-i-j或k=8-j-i或k=8-(i+j)或k=8-(j+i)。第三空是判断黑球是否在0至6之间，需要使用逻辑与&&来联接。$qt$ where id = 384892 and not is_golden;
update t_question set stem = $qt$下列运算符中优先级最高的算符是____。$qt$, option_json = $qt${"A":"!","B":"%","C":"=","D":"&&"}$qt$, analysis = $qt$所列运算符中优先级最高的是 !（选项 A），故选 A。$qt$ where id = 385153 and not is_golden;
update t_question set stem = $qt$系统提供的头文件是____。$qt$, option_json = $qt${"A":"main","B":"<stdio.h>","C":";","D":"printf"}$qt$, analysis = $qt$系统提供的头文件是 <stdio.h>（选项 B），故选 B。$qt$ where id = 385155 and not is_golden;
update t_question set stem = $qt$下列指令为预处理指令的是____。$qt$, option_json = $qt${"A":"main","B":"#include <stdio.h>","C":"<stdio.h>","D":"include <stdio.h>"}$qt$, analysis = $qt$预处理指令是 #include <stdio.h>（选项 B），故选 B。$qt$ where id = 385159 and not is_golden;
update t_question set stem = $qt$下列语句中，句法错误的是（不考虑语义）____$qt$, option_json = $qt${"A":"while (x=y) 5 ;","B":"do  x^{++}  while (x==10);","C":"while (0);","D":"do 2; while (a==b);"}$qt$, analysis = $qt$do x++ while (x==10); 缺少语句结束分号，句法错误（选项 B），故选 B。$qt$ where id = 385167 and not is_golden;
update t_question set stem = $qt$设整型变量 x、y、z 均为 5，执行 “ x% = y + z ” 后，x= ____。$qt$, analysis = $qt$x%=(y+z) 即 5%10=5，故填 5。$qt$ where id = 385172 and not is_golden;
update t_question set stem = $qt$以下语句中有语法错误的是()。$qt$, option_json = $qt${"A":"printf(\"%d\",0xAB);","B":"printf(\"%f\",3.45E2.5);","C":"printf(\"%d\",037);","D":"printf(\"%c\",\\\");"}$qt$, analysis = $qt$printf("%f",3.45E2.5) 中指数 2.5 非法，存在语法错误（选项 B），故选 B。$qt$ where id = 385190 and not is_golden;
update t_question set stem = $qt$已有声明“int x=5,y;float z=2；”，以下表达式中语法正确的是()。$qt$, option_json = $qt${"A":"y=x%z","B":"x>0?y=x:y=-x","C":"y=x/2=z","D":"y=x=z/2"}$qt$, analysis = $qt$y=x=z/2 语法正确。$qt$ where id = 385191 and not is_golden;
update t_question set stem = $qt$抹下选项中,非法的字符常量是()。$qt$, option_json = $qt${"A":"'1r'","B":"'17'","C":"\"n\"","D":"'xaa'"}$qt$, analysis = $qt$"n" 双引号是字符串。$qt$ where id = 385201 and not is_golden;
update t_question set stem = $qt$下列C程序段的时间复杂度是（

count=0;
for(k=1; k<=n; k*=2)
for(j=1; j<=n; j++)
count++;$qt$, option_json = $qt${"A":"0(n2)","B":"0(nlog2n)","C":"0(n)","D":"0(log2n)"}$qt$, analysis = $qt$外循环 k*=2（log2n 次）× 内循环 n 次：时间复杂度 O(nlog2n)（选项 B），故选 B。$qt$ where id = 385236 and not is_golden;
update t_question set stem = $qt$下列C程序段的时间复杂度是（）

count=0;

for (k=1; k<=n; k*=2)

for ( j=1; j<=n; j++)

count++;$qt$, option_json = $qt${"A":"0(n2)","B":"0(nlog2n)","C":"0 (n)","D":"0(\\log 2n)"}$qt$, analysis = $qt$双重循环次数为 n·log2n：O(nlog2n)（选项 B），故选 B。$qt$ where id = 385247 and not is_golden;
update t_question set stem = $qt$为表示关系 x >=slant y >=slant z，应使用 C^2 语言表达式为（）$qt$, option_json = $qt${"A":"(x >= y) AND (y >= z)","B":"(x >= y)  &  (y >= z)","C":"(x>=y)  &&  (y>=z)","D":"(x >= y >= z)"}$qt$, analysis = $qt$(x>=y)&&(y>=z)。$qt$ where id = 385251 and not is_golden;
update t_question set stem = $qt$下列表达式的 -25% 3 值为是(°)$qt$, option_json = $qt${"A": "0", "B": "-1", "C": "1", "D": "-2"}$qt$, analysis = $qt$-25%3=-1。$qt$ where id = 385260 and not is_golden;
update t_question set stem = $qt$在 C 语言中，不合法的常量的是()$qt$, option_json = $qt${"A":"3.E+02","B":"O12","C":"\\012'","D":"0xFF"}$qt$, analysis = $qt$O12 中 O 非 0。$qt$ where id = 385277 and not is_golden;
update t_question set stem = $qt$设变量均已正确定义并且赋值，以下与其他 3 组输出结构不同的一组语句是()。$qt$, option_json = $qt${"A":"x++;printf(\"%d\\n\",x);","B":"n=x++;printf(\"%d\\n\",n);","C":"++x;printf(\"%d\\n\",x);","D":"n=++x;printf(\"%d\",n);"}$qt$, analysis = $qt$B 打印原值与其他不同。$qt$ where id = 385278 and not is_golden;
update t_question set stem = $qt$下面的运算符优先级最高的是（）$qt$, option_json = $qt${"A":"+=","B":"==","C":">=","D":"^{*}="}$qt$, analysis = $qt$关系 >= 高于相等 ==。$qt$ where id = 385284 and not is_golden;
update t_question set stem = $qt$以下表达式中有语法错误的是

____。（所有变量已定义和初始化）$qt$, option_json = $qt${"A":"c + = 5","B":"c = c b+b","C":"a = 5, b = a*a","D":"a > 0 & b<0"}$qt$, analysis = $qt$c=c b+b 缺运算符。$qt$ where id = 385290 and not is_golden;
update t_question set stem = $qt$若有定义 int a[4][8];，则以下选项中对数组元素 a[i][j](0<=j<4,0<=j<8) 的错误引用是（）$qt$, option_json = $qt${"A":"*(&a[0][0]+8*i+j)","B":"a[i][j]","C":"*(a+j)[i]","D":"*(a[i]+j)"}$qt$, analysis = $qt$*(a+j)[i] 引用错误。$qt$ where id = 385294 and not is_golden;
update t_question set stem = $qt$根据下面的程序及数据的输入和输出形式，程序中输入语句的正确形式应该为()。

main(){
    char ch1,ch2,ch3;
    //输入语句
    printf("%c %c %c",ch1,ch2,ch3);
}

输入形式:A B C

输出形式:ABC$qt$, option_json = $qt${"A":"scanf(\"%c%c%c\",&ch1,&ch2,&ch3);","B":"scanf(\"%c,%c,%c\",&ch1,&ch2,&ch3);","C":"scanf(\"%c %c %c\",&ch1,&ch2,&ch3);","D":"scanf(\"%c%c\",&ch1,&ch2,&ch3);"}$qt$, analysis = $qt$（AI 补答）输入含空格，scanf 格式串中以空格跳过空白符，故选 C。$qt$ where id = 385296 and not is_golden;
update t_question set stem = $qt$若有语句:int a = 10; if(a<100) printf("杭州智狐科技！"); 以下有关程序设计语言成分描述错误的是（）$qt$, option_json = $qt${"A":"a<b 是运算成分","B":"if 是控制成分","C":"printfprint(\"杭州智狐科技！\"); 是传输成分","D":"int 是传输成分"}$qt$, analysis = $qt$int 是数据成分。$qt$ where id = 385322 and not is_golden;
update t_question set stem = $qt$下列 for 循环的次数为____。for(int i=0, x=0; !x&&i<=10; i++);$qt$, option_json = $qt${"A":"10","B":"11","C":"1","D":"无限\n\n## 5、对于下面程序\n\nint main() {\n\n\\begin{array}{l} \\text {int} a = 5, b = 0, c = 0; \\ \\text {if} (a = b + c) \\operatorname{printf} (\" * * * \\backslash n\"); \\ \\text {else}   \\operatorname{printf} (\"  \\ \\backslash n\"); \\ \\text {return} 0; \\ \\end{array}\n\n说法正确的是（）"}$qt$, analysis = $qt$11 次（i 从 0 到 10；!x 恒为真）。$qt$ where id = 385348 and not is_golden;
update t_question set stem = $qt$已知有声明为 int x=2，下列表达式中值不为 8 的是（）$qt$, option_json = $qt${"A":"x+=2,x*2","B":"x+=x*=x","C":"(x+7)/2*(((x+1)%2+1)","D":"x*7.2/x+1"}$qt$, analysis = $qt$x+=x*=x → 4→6 ≠8。$qt$ where id = 385390 and not is_golden;
update t_question set stem = $qt$设变量 x 为 float 型且已赋值，则以下语句中能将 x 中的数值保留到小数点后三位，并将第四位四舍五入的是 ____。$qt$, option_json = $qt${"A":"x = (int)(x^{*}1000 + 0.5) / 1000.0;","B":"x=(x*1000+0.5)/1000.0;","C":"x=x*1000+0.5/1000.0;","D":"x=(x/1000+0.5)*1000.0;"}$qt$, analysis = $qt$(x*1000+0.5)/1000.0 保留三位。$qt$ where id = 385520 and not is_golden;
update t_question set stem = $qt$有以下程序运行后的输出结果是____。

main(){
    char a[7]="a0\0a0\0"; int i,j;
    i=sizeof(a); j=strlen(a);
    printf("%d %d\n",i,j);
}$qt$, option_json = $qt${"A":"2 2","B":"76","C":"7 2","D":"6 2"}$qt$, analysis = $qt$sizeof=7、strlen=2。$qt$ where id = 385523 and not is_golden;
update t_question set stem = $qt$要求通过 while 循环不断读入字符，当读入字母 N 时结束循环。若变量已正确定义，以下正确的程序段是（）。$qt$, option_json = $qt${"A":"while((ch=getchar())!='N') printf(\"%c\",ch);","B":"while(ch=getchar()!='N') printf(\"%c\",ch);","C":"while(ch=getchar()=='N') printf(\"%c\",ch);","D":"while((ch=getchar())=='N') printf(\"%c\",ch);"}$qt$, analysis = $qt$不断读入字符、遇 N 结束：while((ch=getchar())!='N') printf("%c",ch);（选项 A），故选 A。$qt$ where id = 385533 and not is_golden;
update t_question set stem = $qt$以下不合法的用户标识符是______。$qt$, option_json = $qt${"A":"j2_KEY","B":"Double","C":"4d","D":"_8_"}$qt$, analysis = $qt$4d 以数字开头，不是合法的用户标识符（选项 C），故选 C。$qt$ where id = 385538 and not is_golden;
update t_question set stem = $qt$有以下程序

#include <stdio.h>

main(){
    int a1,a2; char c1,c2;
    scanf("%d%c%d%c",&a1,&c1,&a2,&c2);
    printf("%d,%c,%d,%c",a1,c1,a2,c2);
}

若想通过键盘输入，使得a1的值为12，a2的值为34，c1的值为字符a，c2的值为字符b，程序输出结果是:12，a，34，b则正确的输入格式是( ) . （以下_代表空格，<CR>代表回车）$qt$, option_json = $qt${"A":"12a34b","B":"12_a_34_b","C":"12,a,34,b","D":"12_a34_b\n\n:A : A\n\n答案解析:\n\n选项A 可以正常输入数据。\n\n空格 %c是可以接收的。"}$qt$, analysis = $qt$12a34b 输入（源答案 A）。$qt$ where id = 385546 and not is_golden;
update t_question set stem = $qt$下列表达式的 -25% 3 值为是（）$qt$, option_json = $qt${"A": "0", "B": "-1", "C": "1", "D": "-2"}$qt$, analysis = $qt$-25%3=-1。$qt$ where id = 385566 and not is_golden;
update t_question set stem = $qt$对应于语句 “scanf("x=%dy=%c", &x, &y);”，应通过键盘输入的内容是()$qt$, option_json = $qt${"A":"20 90","B":"10, c","C":"x = 20, y = c","D":"x = 2y = 2"}$qt$, analysis = $qt$按 x=20y=c 输入。$qt$ where id = 385567 and not is_golden;
update t_question set stem = $qt$设变量均已正确定义并且赋值，以下与其他 3 组输出结构不同的一组语句是

()。$qt$, option_json = $qt${"A":"x++;printf(\"%d\\n\",x);","B":"n=x++,printf(\"%d\\n\",n);","C":"++x;printf(\"%d\\n\", x);","D":"n=++x, printf(\"%d\", n);"}$qt$, analysis = $qt$B 打印原值不同。$qt$ where id = 385584 and not is_golden;
update t_question set stem = $qt$以下表达式中有语法错误的是____。$qt$, option_json = $qt${"A":"c += 5","B":"c = c b + b","C":"a = 5, b = a*a","D":"a > 0 & b<0"}$qt$, analysis = $qt$c=c b+b 缺运算符。$qt$ where id = 385596 and not is_golden;
update t_question set stem = $qt$若有定义 int a[4][8];，则以下选项中对数组元素 a[i][j](0<=j<4,0<=j<8) 的错误引用是（）$qt$, option_json = $qt${"A":"*(&a[0][0]+8*i+j)","B":"a[i][j]","C":"*(a+j)[i]","D":"*(a[i]+j)"}$qt$, analysis = $qt$*(a+j)[i] 错误。$qt$ where id = 385599 and not is_golden;
update t_question set stem = $qt$根据下面的程序及数据的输入和输出形式，程序中输入语句的正确形式应该为()。

main(){

char ch1,ch2,ch3;

//输入语句

printf("%c %c %c",ch1,ch2,ch3);

}

输入形式:A B C

输出形式:A B C$qt$, option_json = $qt${"A":"scanf(\"%c%c%c\",&ch1,&ch2,&ch3);","B":"scanf(\"%c,%c,%c\",&ch1,&ch2,&ch3);","C":"scanf(\"%c %c %c\",&ch1,&ch2,&ch3);","D":"scanf(\"%c%c\",&ch1,&ch2,&ch3);"}$qt$, analysis = $qt$（AI 补答）同上题，scanf("%c %c %c")，故选 C。$qt$ where id = 385601 and not is_golden;
update t_question set stem = $qt$a，b 为整型变量，二者均不为 0，以下关系表达式中恒成立的是（ ）。$qt$, option_json = $qt${"A":"\\mathsf{a}^{*}\\mathsf{b}/\\mathsf{a}^{*}\\mathsf{b}==1","B":"a / b ^ { * } b / a { = } { = } 1","C":"a/b^{*}b+a%b==a","D":"a / b ^ { * } b == a"}$qt$, analysis = $qt$a/b*b+a%b==a 恒成立。$qt$ where id = 385642 and not is_golden;
update t_question set stem = $qt$若有以下定义:char s='\092'；则该语句____。$qt$, option_json = $qt${"A":"使 s 的值包含1个字符","B":"使 s 的值包含 4 个字符","C":"使 s 的值包含 3 个字符","D":"定义不合法，s 的值不确定"}$qt$, analysis = $qt$'\092' 定义不合法。$qt$ where id = 385652 and not is_golden;
update t_question set stem = $qt$下列代码中循环一次都不执行的是$qt$, option_json = $qt${"A":"unshort char    x=0;\nwhile(--x>=0)\n{...}","B":"signed char x=0;\ndo{...}while(--x>=0);","C":"signed char x=1;\nwhile(--x){...}","D":"signed char x=0;\nfor(--x>=0;;){...}"}$qt$, analysis = $qt$while(--x) 条件为 0 → 0 次。$qt$ where id = 385660 and not is_golden;
update t_question set stem = $qt$以下数组定义中不正确的是().$qt$, option_json = $qt${"A":"int a[2][3];","B":"int b[ ] [3] = {0, 1, 2, 3};","C":"int c[100][100] = {0};","D":"int d[3][= { {1,2}, {1,2,3}, {1,2,3,4} };"}$qt$, analysis = $qt$C 语言中多维数组赋初值时可以部分赋值，如果对全部元素赋初值，则定义数组时对第一维的长度可以不指定，但第二维的长度不能省。$qt$ where id = 385674 and not is_golden;
update t_question set stem = $qt$已有定义语句: int   a = 3, b = 4; 则执行(a++==4)&&(b++==5)表达式后，变量 b 的值是:（ ）$qt$, option_json = $qt${"A": "3", "B": "4", "C": "5", "D": "6"}$qt$, analysis = $qt$a++==4 假短路 → b=4。$qt$ where id = 385685 and not is_golden;
update t_question set stem = $qt$以下关于运算符优先顺序的描述正确的是（ ）$qt$, option_json = $qt${"A":"关系运算符<算术运算符<赋值运算符<逻辑与运算符","B":"逻辑与运算符<关系运算符<算术运算符<赋值运算符","C":"赋值运算符<逻辑与运算符<关系运算符<算术运算符","D":"算术运算符<关系运算符<赋值运算符<逻辑与运算符"}$qt$, analysis = $qt$赋值 < 逻辑与 < 关系 < 算术。$qt$ where id = 385686 and not is_golden;
update t_question set stem = $qt$设 x、y 和 z 是 int 型变量，且 x=3, y=4, z=5，则下面表达式中值为 0 是（）。$qt$, option_json = $qt${"A":"'x'&&'y'","B":"x<=y","C":"x|y+z&&y-z","D":"!((x<y)&&!z | | 1)"}$qt$, analysis = $qt$!((x<y)&&!z||1)=0。$qt$ where id = 385743 and not is_golden;
update t_question set stem = $qt$判断 char 型变量 cl 是否为小写字母的正确表达式为（）$qt$, option_json = $qt${"A":"'a' <=c1<=f'z'","B":"(c1>=a)&&(c1<=z)","C":"（‘a’ >=c1）（‘z’ <=c1）","D":"(c1>= 'a') && (c1<= 'z')"}$qt$, analysis = $qt$(c1>='a')&&(c1<='z')。$qt$ where id = 385744 and not is_golden;
update t_question set stem = $qt$若二维数组a有m列，则在a[j]前面的元素个数为（）$qt$, option_json = $qt${"A":"j^{*}m+i","B":"i*m+j","C":"i*m+j-1","D":"i*m+j+1"}$qt$, analysis = $qt$a[j] 前有 i*m+j 个元素。$qt$ where id = 385748 and not is_golden;
update t_question set stem = $qt$要求当 A 的值为奇数时，表达式的值为真；A 的值为偶数时，表达式的值为假，以下不满足要求的表达式是（）$qt$, option_json = $qt${"A":"A%2==1","B":"! (A%2==0)","C":"! (A%2)","D":"A%2"}$qt$, analysis = $qt$!(A%2) 奇数时得 0 不满足。$qt$ where id = 385760 and not is_golden;
update t_question set stem = $qt$判断 char 型变量 ch 是否为小写字母的正确表达式是（）$qt$, option_json = $qt${"A":"‘a’ <=ch< ‘z’","B":"（‘a’ <=ch） AND（‘z’ >=ch)","C":"(ch>= 'a') & (ch<= 'z')","D":"(ch>= ‘a’) && (ch<= ‘z’)"}$qt$, analysis = $qt$同 385744。$qt$ where id = 385761 and not is_golden;
update t_question set stem = $qt$以下关于C语言标识符的描述中，正确的是（）$qt$, option_json = $qt${"A":"标识符可以由汉字组成;","B":"标识符只能以字母开头;","C":"关键字可以作为用户标识符；","D":"Area 与 area 是不同的标识符。"}$qt$, analysis = $qt$Area 与 area 不同。$qt$ where id = 385762 and not is_golden;
update t_question set stem = $qt$设x,y和z都是int型变量，则执行表达式 x=(y=1,z=4,y+(++z)) 后，x,y,z的值是（）$qt$, option_json = $qt${"A":"1,4,5","B":"4,4,5","C":"4,1,6","D":"6,1,5\n\n答案:D\n\n答案解析: x = (y = 1, z = 4, y + (+z)) ；逗号表达从左向右依次执行，整个逗号表达的值就是最后一个表达式的值。\n\n行执行y=1;\n再执行z=4;\n再执行y+(++z) = 1+ (z=z+1) = 1+ (z=4+1) = 1+5 = 6\nx=最后一个表达式值即y+(++z) = 6\nx=6,y=1,z=5\n\n难度: 易\n\n知识点:"}$qt$, analysis = $qt$逗号表达式 x=(y=1,z=4,y+(++z))：z→5，x=1+5=6，即 x=6,y=1,z=5（选项 D），故选 D。$qt$ where id = 385766 and not is_golden;
update t_question set stem = $qt$在C语言中，表达式1？表达式2:表达式3；如果表达式1为真是，会执行（）$qt$, option_json = $qt${"A":"表达式1","B":"表达式2","C":"表达式3","D":"先执行表达式1，然后再执行表达式2\n\n答案:B\n\n答案解析:三目运算符:表达式1？表达式2:表达式3；若表达式1结果为真时，执行表达2；若表达式1结果为假时，执行表达3；\n\n难度: 易"}$qt$, analysis = $qt$表达式1为真时执行表达式2（选项 B），故选 B。$qt$ where id = 385768 and not is_golden;
update t_question set stem = $qt$若有int x = 1,y = 2,z = 4；则执行 x|| + y + z 的之后，x,y,z 的值（）$qt$, option_json = $qt${"A":"1, 2, 4","B":"1, 3, 4","C":"1, 2, 6","D":"1, 3, 3\n\n答案:A\n\n答案解析:x||++y+z；这里出现短路现象。x是非0即真，所以++y+z不执行了\n\n难度: 易\n\n知识点:"}$qt$, analysis = $qt$x||++y+z：x 非 0 即真，短路后 ++y+z 不执行，y、z 保持 2、4（选项 A），故选 A。$qt$ where id = 385769 and not is_golden;
update t_question set stem = $qt$若有 int a = 5, b = 6, c = 7, d = 8, m = 2, n = 2; 执行完 (m = a < b) ||(n = c > d); 之后，m 和 n 值是（）$qt$, option_json = $qt${"A":"0, 0","B":"0, 1","C":"1, 1","D":"1, 2\n\n答案:D\n\n答案解析: (m=a<b) ||(n=c>d);\n先计算m=a<b\na<b = 》 5<6 为真，则真值为1;\nm=1 即真，||这个时候出现了短路现象。\n(n=c>d)则不需再执行。\nm=1,n=2;\n\n难度: 易\n\n知识点:"}$qt$, analysis = $qt$(m=a<b)||(n=c>d)：a<b(5<6) 为真使 m=1，|| 短路 n 不执行保持 2（选项 D），故选 D。$qt$ where id = 385770 and not is_golden;
update t_question set stem = $qt$若有运算符<<,sizeof,^{\wedge},&=，则按优先级由高到低的排序是（）$qt$, option_json = $qt${"A":"sizeof,^,<<,&=","B":"sizeof,<<,^&=","C":"^,sizeof,<<,&=","D":"^,sizeof,&=,<<\n\n答案:B\n\n答案解析:sizeof,<<,^&=\n\n难度: 易\n\n知识点:"}$qt$, analysis = $qt$优先级由高到低：sizeof、<<、^&=（选项 B），故选 B。$qt$ where id = 385771 and not is_golden;
update t_question set stem = $qt$设a和b均为double型常量，且 a = 5.5 、 b = 2.5 ，则表达式（int)a+b/b的值（）$qt$, option_json = $qt${"A":"6.500000","B":"6","C":"5.500000","D":"6.000000\n\n答案:D\n\n答案解析:(int)a+b/b;表达式的结果是double类型，选项B排除。\n\n(int)a = (int)5.5 = 5.0\n\n按%的结果就是6.000000\n\n难度: 易\n\n知识点:"}$qt$, analysis = $qt$(int)a+b/b=(int)5.5+2.5/2.5=5+1.0=6.000000（double）（选项 D），故选 D。$qt$ where id = 385772 and not is_golden;
update t_question set stem = $qt$若有 int a; a=10.0/3; 执行之后a的值是（）$qt$, option_json = $qt${"A":"3.3","B":"3.0","C":"3","D":"0\n\n答案:C\n\n答案解析:a整型，会对10.0/3的结果进行取整（截取小数部分），所以 a = 3\n\n难度: 易\n\n知识点:"}$qt$, analysis = $qt$a=10.0/3 赋给 int 取整截断为 3（选项 C），故选 C。$qt$ where id = 385773 and not is_golden;
update t_question set stem = $qt$有以下程序}程序的运行结果是____。

<div class="docvortex-algorithm" style="white-space: pre-wrap; font-family:monospace;">
#include <stdio.h>
main(){ int a=0, b=0;
    for( ;a<5; a++ )
    {   if (a%2==0) continue;
        b += a;
    }

printf("%d \n", b);$qt$, option_json = $qt${"A": "4", "B": "10", "C": "0", "D": "15"}$qt$, analysis = $qt$（AI 补答）continue 跳过偶数，b=1+3=4，故选 A。$qt$ where id = 385784 and not is_golden;
update t_question set stem = $qt$不能把字符串 “Hello!” 赋给数组 b 的语句是( )。$qt$, option_json = $qt${"A":"char b[10] = { 'H' , 'e' , 'l' , 'l' , 'o' , '!' };","B":"char b[10];b=\" Hello!\";","C":"char b[10]; strcpy(b,\" Hello!\") ;","D":"char b[10]=\" Hello!\";"}$qt$, analysis = $qt$b=" Hello!"; 不能给数组赋值。$qt$ where id = 385828 and not is_golden;
update t_question set stem = $qt$设 j 为 int 型变量，则下面 for 循环语句的执行结果是（）。

for (j=10; j>3; j--)
{   if(j%3)  j--;
    --j;--j;
    printf( "%d ", j);
}$qt$, option_json = $qt${"A":"6 3","B":"7 4","C":"62","D":"7 3\n\nM 迈成教育 MAI CHENG EDUCATION\n\n## 【MySQL 数据库题目】"}$qt$, analysis = $qt$j=10 打印 7；j=6 打印 4 → 7 4。$qt$ where id = 385830 and not is_golden;
update t_question set stem = $qt$以下定义语句中正确的是______。$qt$, option_json = $qt${"A":"char a='A' b='B';","B":"float a=b=10.0;(正解a=10.0 b=10.0)","C":"int a=10,*b=&a;","D":"float *a,b=&a;？？？\n\n知识点：常量、变量和标识符"}$qt$, analysis = $qt$int a=10,*b=&a; 定义正确（选项 C），故选 C。$qt$ where id = 385840 and not is_golden;
update t_question set stem = $qt$下列叙述中正确的是______。$qt$, option_json = $qt${"A":"C语言编译时不检查语法","B":"C语言的子程序有过程和函数两种","C":"C语言的函数可以嵌套定义","D":"C语言所有函数都是外部函数\n\n知识点：库函数"}$qt$, analysis = $qt$C 语言所有函数都是外部函数（选项 D），故选 D。$qt$ where id = 385854 and not is_golden;
update t_question set stem = $qt$以下数组定义中错误的是______。$qt$, option_json = $qt${"A":"int x[][3]={0}；","B":"int x[2][3]={{1,2},{3,4},{5,6}};","C":"int x[][3]={{1,2,3},{4,5,6}};","D":"int x[2][3]={1,2,3,4,5,6};\n\n知识点：二维数组的定义和二维数组元素的引用"}$qt$, analysis = $qt$选项 D 位于图片下边缘，仅上半可见，文字按可见部分抄录，uncertain: true。$qt$ where id = 385858 and not is_golden;
update t_question set stem = $qt$以下数组定义中不正确的是______。$qt$, option_json = $qt${"A":"int a[2][3];","B":"int b[][3]={0,1,2,3};","C":"int c[100][100]={0};","D":"int d[3][]={{1,2},{1,2,3},{1,2,3,4}};\n\n知识点：二维数组的定义和二维数组元素的引用"}$qt$, analysis = $qt$C 语言中多维数组赋初值时可以部分赋值，如果对全部元素赋初值，则定义数组时对第一维的长度可以不指定，但第二维的长度不能省。$qt$ where id = 385859 and not is_golden;
update t_question set stem = $qt$以下能正确定义一维数组的选项是______。$qt$, option_json = $qt${"A":"int a[5]={0,1,2,3,4,5};","B":"char a[]={0,1,2,3,4,5};","C":"char a={'A','B','C'};","D":"int a[5]=\"0123\"; 知识点：一维数组的定义和一维数组元素的引用"}$qt$, analysis = $qt$数组的常量表达式中可以包括整型常量和符号常量，不能包括变量。也就是说，C 不允许对数组的大小作动态定义，即数组的大小不依赖于程序运行过程中变量的值，所以选项A 不正确。而选项 B 事先定义一个字符常量 N，所以可以在数组中作常量表达式，选项 B 正确。而选项 C 中不能用区间表示数组大小；在 D 中 N 虽然被赋为 100，但 N 仍然为变量，所以不对。$qt$ where id = 385861 and not is_golden;
update t_question set stem = $qt$以下正确定义字符串的语句是______。$qt$, option_json = $qt${"A":"char str[]={'\\064'}；","B":"char str=\"\\x43\";","C":"char str=''；","D":"char str[]=\"\\0\";"}$qt$, analysis = $qt$char str[]="\0"; 正确定义了字符串（选项 D），故选 D。$qt$ where id = 385873 and not is_golden;
update t_question set stem = $qt$以下叙述中错误的是______。$qt$, option_json = $qt${"A":"C语句必须以分号结束","B":"复合语句在语法上被看作一条语句","C":"空语句出现在任何位置都不会影响程序运行","D":"赋值表达式末尾加分号就构成赋值语句\n\n知识点：概念"}$qt$, analysis = $qt$空语句出现在不该出现的位置会影响程序运行，C 叙述错误（选项 C），故选 C。$qt$ where id = 385880 and not is_golden;
update t_question set stem = $qt$以下叙述中正确的是______。$qt$, option_json = $qt${"A":"C程序中注释部分可以出现在程序中任意合适的地方","B":"花括号“{”和“}”只能作为函数体的定界符","C":"构成C程序的基本单位是函数，所有函数名都可以由用户命名","D":"分号是C语言之间的分隔符，不是语句的一部分\n\n填空 复习题"}$qt$, analysis = $qt$C 程序中注释部分可以出现在程序中任意合适的地方（选项 A），故选 A。$qt$ where id = 385881 and not is_golden;
update t_question set stem = $qt$以下选项中正确的语句组是（）$qt$, option_json = $qt${"A":"char s[];s=\"BOOK!\";","B":"char *s;s={\"BOOK!\"};","C":"char s[10];s=\"BOOK!\";","D":"char *s;s=\"BOOK!\";\n\n【解析】字符数组名是地址常量，不能赋值给数组名，故 A、C 项错误，D 项指针 s 是个变量，将字符串常量赋值给 s，是正确的。B 项中给 s 赋值时不能用花括号将字符串串括起来。"}$qt$, analysis = $qt$char *s;s="BOOK!"; 正确。$qt$ where id = 385941 and not is_golden;
update t_question set stem = $qt$以下正确的函数形式是 ____。

<div class="docvortex-algorithm" style="white-space: pre-wrap; font-family:monospace;">$qt$, option_json = $qt${"A":"double fun(int x,int y){\n    z=x+y;\n    return z;\n}","C":"fun(x,y){\n    int x,y;\n    double z; z=x+)\n    return z;\n}\n\n程序运行后的输出结果是()。","B":"fun(int x,y){\n  int z;\n  return z;\n}","D":"double fun(int x,int y){\n  double z;\n  z=x+y;\n  return z:\n}"}$qt$, analysis = $qt$double fun(int x,int y){double z;…}。$qt$ where id = 386038 and not is_golden;
update t_question set stem = $qt$C 语言中计算 a<sup>3</sup> 的正确表达式是（ ）$qt$, option_json = $qt${"A":"\\mathbf { a } ^ { \\wedge 3 }","B":"\\mathbf { a } ^ { * * } 3","C":"\\mathbf { p o w } ( \\mathbf { a } , 3 )","D":"\\mathrm { p o w e r } ( \\mathrm { a } , \\mathrm { 3 } )"}$qt$, analysis = $qt$pow(a,3) 计算 a³。$qt$ where id = 386053 and not is_golden;
update t_question set stem = $qt$以下数组定义中不正确的是

<div class="docvortex-algorithm" style="white-space: pre-wrap; font-family:monospace;">$qt$, option_json = $qt${"A":"int a[2][3];","B":"int b[][3]={0,1,2};","C":"int c[100][100]={0};","D":"int d[3][]={{1,2},{1,2,3},{1,2,3,4}};"}$qt$, analysis = $qt$int d[3][] 省略了第二维，数组定义不正确（选项 D），故选 D。$qt$ where id = 386062 and not is_golden;
update t_question set stem = $qt$以下程序的输出结果是

<div class="docvortex-algorithm" style="white-space: pre-wrap; font-family:monospace;">
main() {
    int a[4][4]={{1,3,5},{2,4,6},{3,5,7}};
    printf("%d%d%d%d\n",a[0][3],a[1][2],a[2][1],a[3][0]
);}$qt$, option_json = $qt${"A":"0650","B":"1470","C":"5430","D":"输出值不定"}$qt$, analysis = $qt$a[0][3]a[1][2]a[2][1]a[3][0]=0650。$qt$ where id = 386063 and not is_golden;
update t_question set stem = $qt$以下能对一维数组 a 进行正确初始化的语句是( )$qt$, option_json = $qt${"A": "int a[10] = (0, 0, 0, 0, 0);", "B": "int a[10] = { 0 };", "C": "int b=4,a[b] = {1,2,3,4};", "D": "int a[10] = {10*a};"}$qt$, analysis = $qt$int a[10]={0}; 正确。$qt$ where id = 386099 and not is_golden;
update t_question set stem = $qt$设 x、y 和 z 是 int 型变量, 且 x=3, y=4, z=5 则下面表达式中值为 0 的是( )。$qt$, option_json = $qt${"A":"!(x < y, &&!2","B":"'x' && 'y'","C":"x \\mid y + z && y - z","D":"x <= y"}$qt$, analysis = $qt$A 表达式值为 0。$qt$ where id = 386101 and not is_golden;
update t_question set stem = $qt$下面程序段的运行结果是( )。

for( y=1;y<10 ;) y=(( x=3*y,x+1),x-1);
printf("x=%d,y=%d" , x,y );$qt$, option_json = $qt${"A":"x = {27},y = {27}","B":"x = {12},y = {13}","C":"x=15, y=14","D":"x = y = 2"}$qt$, analysis = $qt$y=2→5→14，x=15。$qt$ where id = 386118 and not is_golden;
update t_question set stem = $qt$C 语言中，关系表达式和逻辑表达式的值是（$qt$, option_json = $qt${"A":"0","B":"0 或 1","C":"1","D":"‘T’ 或’ F’"}$qt$, analysis = $qt$关系表达式和逻辑表达式的值是 0 或 1（选项 B），故选 B。$qt$ where id = 386133 and not is_golden;
update t_question set stem = $qt$设整型变量 a = 2，则执行下列语句后，浮点型变量 b 的值不为 0.5 的是（）$qt$, option_json = $qt${"A":"b = 1.0 / a","B":"b = (float)(1 / a)","C":"b = 1 / (float)a","D":"b = 1 / (a*1.0)"}$qt$, analysis = $qt$b=(float)(1/a)：1/2 整数除法得 0，转 float 仍为 0，不为 0.5（选项 B），故选 B。$qt$ where id = 386134 and not is_golden;
update t_question set stem = $qt$若有以下四个变量的定义:char a; int b; float c; double d;，则表达式 \mathbf { a } * \mathbf { b } - \mathbf { d } + \mathbf { c } 的值的类型为 。$qt$, analysis = $qt$char+int+float 提升为 double。$qt$ where id = 386215 and not is_golden;
update t_question set stem = $qt$下面的 C 语言运算符，优先级最高的是（ ）。$qt$, option_json = $qt${"A":"&","B":"+","C":"&&","D":">="}$qt$, analysis = $qt$+ 优先级最高。$qt$ where id = 386218 and not is_golden;
update t_question set stem = $qt$若 \mathbf { x } { = } \mathbf { 3 } ，逗号表达式 x^{*}5,x=x-1,x+10 的值为（ ）。$qt$, option_json = $qt${"A":"10","B":"15","C":"12","D":"13\n\n课时四 c 程序的输入输出\n\n<table><tr><td>考点</td><td>重要程度</td><td>分值</td><td>常见题型</td></tr><tr><td>1. printf 输出语句</td><td rowspan=\"2\">必考</td><td rowspan=\"2\">2~5</td><td rowspan=\"2\">与所有程序题结合</td></tr><tr><td>2. scanf 输入语句</td></tr></table>\n\n## 1. printf 语句"}$qt$, analysis = $qt$逗号表达式取末值 x+10=12。$qt$ where id = 386220 and not is_golden;
update t_question set stem = $qt$有输入语句: s c a n f (``a= %  d , b= %  d , c= %  d , & a , & b , & c); ;为使变量 a 为 11，b 为 12，c 为 13，则从键盘输入数据的正确形式应当是（ ）。$qt$, option_json = $qt${"A":"11 12 13","B":"^ { \\mathrm { a } = 1 1 , \\mathrm { b } = 1 2 , \\mathrm { c } = 1 3 }","C":"a = 11  b = 12  c = 13","D":"11,12,13 答案:选 B。"}$qt$, analysis = $qt$按 a=11,b=12,c=13 原样输入（源答案 B）。$qt$ where id = 386221 and not is_golden;
update t_question set stem = $qt$调用一个函数时，当实参和形参都是普通变量时，它们之间的数据传递方式是（ ）。$qt$, option_json = $qt${"A":"地址传递","C":"双向值传递","B":"单向值传递","D":"由用户定义传递方式\n\n答案:选 B。"}$qt$, analysis = $qt$普通变量传参=单向值传递（源答案 B）。$qt$ where id = 386226 and not is_golden;
update t_question set stem = $qt$设有如下定义，则对 d 中的 year 的成员正确引用的是（ ）。

struct Date{int year;
        int month;
        int day} d, *p=&d;$qt$, option_json = $qt${"A":"(*p).d.year","B":"(*p).year","C":"p->d.year","D":"p.d.year"}$qt$, analysis = $qt$(*p).year 正确引用。$qt$ where id = 386230 and not is_golden;
update t_question set stem = $qt$在 C 语言中，设有数组声明" int a [10]:"，能正确取得数组第一个元素的表达式是（ ）。$qt$, option_json = $qt${"A":"a[0]","B":"a","C":"a(0)","D":"a[1]"}$qt$, analysis = $qt$取得数组第一个元素的表达式是 a[0]（选项 A），故选 A。$qt$ where id = 390348 and not is_golden;
update t_question set stem = $qt$在 C 语言中，能正确判断字符变量 x 为数字字符的表达式是$qt$, option_json = $qt${"A":"'0' <=x<='9'","D":"(x>='0') && (x<='9')","B":"(x>='0')\\mid\\mid(x<'-9')","C":"('0' <=x) and ('9' >=x)"}$qt$, analysis = $qt$判断数字字符的正确表达式为 (x>='0') && (x<='9')（选项 D），故选 D。$qt$ where id = 390467 and not is_golden;
update t_question set stem = $qt$在 C 语言中, 设有 float m; int n; scanf("%f, %d", &m, &n); 下列为正确的输入是$qt$, option_json = $qt${"A":"3.6,4","B":"3.64","C":"m = 3.6, n = 4","D":"m = 3.6 n = 4"}$qt$, analysis = $qt$scanf("%f, %d") 的正确输入为 3.6,4（选项 A），故选 A。$qt$ where id = 390468 and not is_golden;

do $$
begin
  if (select count(*) from t_question where id in (364565,364602,365045,365047,365064,365082,365083,365087,365109,365467,365468,365470,365472,365473,365474,365781,365783,365785,365792,365805,365941,366101,366102,366104,366136,366203,366206,366317,366359,366373,366386,366395,366396,366484,366501,366502,366505,366515,366549,366551,366624,366693,366735,366752,366760,366768,366769,366779,366789,366791,366795,366798,366804,366805,366813,366822,366823,366829,366838,366845,366847,366848,366849,366851,366854,366862,366864,366865,366868,366885,366887,366888,366889,366898,366899,366905,366937,366942,366953,366959,367442,367609,367840,367845,367850,367970,367971,367974,367975,367978,367979,367985,367986,367987,367996,367997,368284,368286,368287,368291,368297,368299,368300,368301,368302,368303,368304,368306,368308,368316,368317,368318,368319,368356,368361,369428,369717,370144,370376,370388,370539,370551,370554,370573,370574,370584,370596,370603,370606,370609,370616,370628,370634,370636,370638,370640,370649,370651,370668,370681,370696,370700,370702,370740,370741,370750,370763,370765,370766,370768,370769,370770,370772,370774,370775,370776,370785,370789,370790,370801,370802,370805,370811,370812,370818,370820,370821,370822,370824,370844,370854,370867,370869,370870,370872,370890,370898,370911,370921,370922,370923,370926,370932,370935,370937,370938,370946,370957,370960,370966,370968,370969,370973,370992,370993,370994,371005,371007,371009,371011,371015,371016,371028,371029,371038,371039,371040,371044,371050,371061,371084,371085,371086,371111,371122,371191,371193,371194,371195,371196,371198,371203,371204,371207,371219,371231,371240,371248,371256,371267,371268,371271,371287,371306,371324,371326,371327,371330,371332,371337,371338,371340,371342,371343,371345,371346,371348,371350,371351,371352,371356,371357,371358,371368,371371,371385,371388,371391,371394,371443,371494,371495,371497,371578,371582,371597,371606,371621,371645,371647,371648,371663,371679,371680,371695,371733,371735,371736,371743,371756,371759,371768,371770,371799,371816,371818,371820,371823,371827,371838,371847,371849,371851,371855,371866,371867,371872,371873,371884,371892,371893,371896,371898,371901,371909,371911,371920,371921,371923,371926,371941,371944,371945,371946,371949,371950,371964,371965,371971,371972,371977,371979,372009,372011,372014,372017,372039,372048,372049,372056,372066,372071,372099,372104,372131,372136,372140,372147,372164,372166,372178,372179,372197,372205,372213,372218,372221,372224,372227,372229,372230,372231,372233,372236,372238,372239,372240,372246,372250,372252,372253,372261,372262,372263,372264,372265,372266,372269,372276,372283,372288,372296,372298,372301,372308,372317,372319,372320,372322,372323,372325,372326,372333,372335,372338,372339,372346,372349,372351,372362,372363,372375,372378,372392,372393,372400,372424,372426,372428,372430,372438,372439,372440,372446,372471,372473,372498,372503,372510,372511,372512,372513,372514,372524,372534,372535,372536,372537,372538,372539,372540,372542,372548,372549,372550,372551,372552,372554,372560,372569,372572,372576,372577,372578,372584,372587,372591,372592,372594,372596,372597,372598,372617,372618,372619,372620,372623,372624,372625,372628,372629,372630,372631,372633,372635,372636,372640,372642,372643,372650,372651,372654,372655,372656,372661,372662,372663,372664,372665,372677,372684,372696,372703,372712,372715,372718,372719,372722,372723,372725,372728,372729,372732,372735,372742,372745,372746,372747,372749,372750,372753,372759,372761,372763,372765,372770,372773,372778,372780,372783,372784,372785,372792,372800,372803,372804,372807,372809,372813,372821,372822,372824,372830,372832,372839,372842,372847,372848,372849,372850,372851,372852,372853,372854,372857,372858,372860,372865,372868,372869,372887,372895,372896,372903,375683,375709,376450,376845,377069,377362,377563,377614,377658,377986,378055,378063,378084,378101,378117,378128,378139,378142,378149,378740,378741,378743,378744,378745,378806,378807,378820,378826,378827,378831,378839,378846,378847,378848,378850,378857,378863,378864,378866,378870,378872,378874,378875,378920,378925,378928,378950,378953,379152,379155,379185,379245,379269,379334,379335,379337,379343,379353,379358,379359,379360,379362,379364,379365,379372,379374,379376,379377,379381,379386,379388,379389,379390,379392,379394,379398,379400,379401,379405,379422,379425,379426,379428,379446,379450,379467,379482,379495,379503,379509,379511,379513,379514,379534,379536,379548,379569,379602,379617,379619,379623,379634,379653,379782,379986,379995,379997,380011,380014,380016,380026,380040,380057,380060,380067,380100,380109,380113,380114,380145,380150,380151,380152,380155,380181,380207,380209,380305,380310,380312,380313,380317,380319,380320,380334,380340,380358,380381,380382,380396,380398,380403,380412,380413,380417,380421,380422,380424,380427,380429,380440,380441,380450,380458,380459,380462,380465,380474,380477,380483,380489,380529,380530,380565,380598,380599,380620,380635,380636,380664,380695,380707,380711,380714,380715,380730,380736,380737,380739,380742,380745,380765,380795,380814,380817,380821,380922,380930,380931,380934,381221,381226,381229,381243,381244,381245,381251,381257,381259,381265,381266,381268,381269,381270,381271,381272,381273,381275,381277,381285,381286,381288,381294,381299,381304,381321,381391,381392,381407,381429,381430,381447,381458,381464,381473,381484,381487,381488,381489,381490,381491,381492,381493,381506,381507,381509,381510,381520,381521,381523,381524,381526,381527,381533,381537,381538,381541,381544,381545,381546,381547,381552,381553,381557,381558,381559,381560,381562,381563,381568,381569,381570,381574,381588,381589,381590,381591,381593,381594,381595,381598,381603,381607,381608,381609,381624,381626,381627,381628,381644,381648,381651,381663,381666,381686,381687,381688,381691,381692,381694,381707,381708,381714,381719,381720,381737,381749,381750,381753,381756,381759,381760,381786,381787,381790,381791,381793,381844,381847,381848,381857,381864,381878,381879,381881,381882,382445,382451,382453,382459,382466,382467,382473,382475,382476,382507,382540,382544,382559,382562,382563,382564,382566,382568,382570,382572,382573,382574,382575,382578,382590,383201,384447,384454,384460,384576,384717,384731,384788,384875,384878,384886,384888,384892,385153,385155,385159,385167,385172,385190,385191,385201,385236,385247,385251,385260,385277,385278,385284,385290,385294,385296,385322,385348,385390,385520,385523,385533,385538,385546,385566,385567,385584,385596,385599,385601,385642,385652,385660,385674,385685,385686,385743,385744,385748,385760,385761,385762,385766,385768,385769,385770,385771,385772,385773,385784,385828,385830,385840,385854,385858,385859,385861,385873,385880,385881,385941,386038,386053,386062,386063,386099,386101,386118,386133,386134,386215,386218,386220,386221,386226,386230,390348,390467,390468) and not deleted and not is_golden) <> 969 then
    raise exception 'C 题目清洗条目数异常';
  end if;
end $$;
commit;
