# -*- coding: utf-8 -*-
"""数据完整性核对：Supabase（迁移前）vs 本地 PostgreSQL（迁移后）。

比对每张表的行数 + 关键列内容校验和；对 t_chapter 做逐行 diff。
"""
import hashlib
from pathlib import Path

import psycopg

ENV = Path('/opt/quiz-site/.env.local')
APP = Path('/opt/quiz-site/.dbapp.env')
REF = 'uyrmqidfxfunlhumnfsm'


def read_env(p):
    d = {}
    for line in Path(p).read_text().splitlines():
        line = line.strip()
        if line and not line.startswith('#') and '=' in line:
            k, v = line.split('=', 1)
            d[k.strip()] = v.strip().strip('"').strip("'")
    return d


env = read_env(ENV)
app = read_env(APP)

sb = psycopg.connect(host=env['SUPABASE_DB_HOST'], port=5432, user='postgres.' + REF,
                     password=env['SUPABASE_DB_PASSWORD'], dbname='postgres',
                     sslmode='require', connect_timeout=20)
lc = psycopg.connect(host='127.0.0.1', port=5432, user='quiz_app',
                     password=app['QUIZ_DB_PASSWORD'], dbname='quiz', connect_timeout=10)

TABLES = ['t_question', 't_text_content', 't_chapter', 't_exam_paper', 'exam_paper_question',
          't_knowledge_point', 't_question_kp', 't_question_image', 't_subject',
          'profiles', 'practice_session', 'practice_answer', 'wrong_question',
          'feedback', 'ai_explain_cache', 'ai_usage']

print('=== 行数比对 ===')
print('%-24s %10s %10s %s' % ('表', 'Supabase', '本地', '结论'))
for t in TABLES:
    na = sb.cursor().execute('select count(*) from ' + t).fetchone()[0]
    nb = lc.cursor().execute('select count(*) from ' + t).fetchone()[0]
    print('%-24s %10d %10d %s' % (t, na, nb, 'OK' if na == nb else 'DIFF'))

CHECKS = {
    't_question': ("select md5(string_agg(x,'|' order by x)) from (select id||'~'||coalesce(stem,'')"
                   "||'~'||coalesce(correct,'')||'~'||coalesce(chapter_id::text,'')||'~'||coalesce(qc_grade,'')"
                   "||'~'||coalesce(answer_check,'')||'~'||coalesce(review_status,'') as x from t_question) s"),
    't_chapter': ("select md5(string_agg(x,'|' order by x)) from (select id||'~'||coalesce(code,'')"
                  "||'~'||coalesce(name,'')||'~'||coalesce(level::text,'')||'~'||coalesce(parent_id::text,'') as x from t_chapter) s"),
    'exam_paper_question': ("select md5(string_agg(x,'|' order by x)) from (select paper_id||'~'||question_id"
                            "||'~'||section_no||'~'||item_order||'~'||is_active::text as x from exam_paper_question) s"),
    't_knowledge_point': "select md5(string_agg(id||'~'||coalesce(title,''),'|' order by id)) from t_knowledge_point",
    't_question_kp': "select md5(string_agg(kp_id||'~'||question_id,'|' order by kp_id,question_id)) from t_question_kp",
    't_question_image': "select md5(string_agg(id||'~'||question_id,'|' order by id)) from t_question_image",
    'profiles': "select md5(string_agg(id::text||'~'||coalesce(username,''),'|' order by id::text)) from profiles",
    'wrong_question': "select md5(string_agg(id||'~'||question_id||'~'||wrong_count::text,'|' order by id)) from wrong_question",
}

print()
print('=== 内容校验和 ===')
print('%-24s %-10s %-10s %s' % ('表', 'Supabase', '本地', '结论'))
for t, sql in CHECKS.items():
    ha = sb.cursor().execute(sql).fetchone()[0]
    hb = lc.cursor().execute(sql).fetchone()[0]
    print('%-24s %-10s %-10s %s' % (t, (ha or '')[:8], (hb or '')[:8], '一致' if ha == hb else '⚠ 不一致'))

print()
print('=== t_chapter 逐行 diff ===')
q = ("select id, coalesce(code,''), coalesce(name,''), coalesce(level,-1), coalesce(parent_id,-1)"
     " from t_chapter order by id")
a = {r[0]: r for r in sb.cursor().execute(q).fetchall()}
b = {r[0]: r for r in lc.cursor().execute(q).fetchall()}
print('仅 Supabase 有:', sorted(set(a) - set(b))[:10])
print('仅本地有:', sorted(set(b) - set(a))[:10])
diff = [i for i in set(a) & set(b) if a[i] != b[i]]
print('同 id 内容不同:', len(diff))
for i in diff[:8]:
    print('  id=%s SB=%s LC=%s' % (i, a[i], b[i]))
