# -*- coding: utf-8 -*-
"""把章直属题的归类结果落库：生成 direct_map.csv 与 apply_direct.sql。

规则：
- 普通题：更新 chapter_id / subject_id / cat_l1
- 金标题：只更新 chapter_id（保留金标的分类/难度/答案等原貌）
"""
import collections
import csv
import json
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
QUESTIONS = BASE / 'direct_questions.json'
SECTIONS = BASE / 'sections.json'
RESULTS = BASE / 'direct_results.jsonl'
RECHECK = BASE / 'direct_recheck.jsonl'
MAP = BASE / 'direct_map.csv'
SQL = BASE / 'apply_direct.sql'


def main():
    qs = {q['id']: q for q in json.loads(QUESTIONS.read_text(encoding='utf-8'))}
    secs = {s['code']: s for s in json.loads(SECTIONS.read_text(encoding='utf-8'))}
    results = {}
    for line in RESULTS.read_text(encoding='utf-8').splitlines():
        if line.strip():
            r = json.loads(line)
            results[r['id']] = r
    recheck = {}
    if RECHECK.exists():
        for line in RECHECK.read_text(encoding='utf-8').splitlines():
            if line.strip():
                r = json.loads(line)
                recheck[r['id']] = r

    rows = []
    missing, bad = [], []
    conf = collections.Counter()
    by_sec = collections.Counter()
    golden = 0
    cross = 0
    for qid, q in qs.items():
        r = results.get(qid)
        if not r:
            missing.append(qid)
            continue
        # 低置信度复核：模型给出 high/medium 时采用复核结果（允许跨章）
        rr = recheck.get(qid)
        if rr and rr.get('confidence') in ('high', 'medium'):
            final = rr
            tag = '复核'
        else:
            final = r
            tag = '首轮'
        s = secs.get(final.get('section'))
        if not s:
            bad.append((qid, final.get('section')))
            continue
        if tag == '首轮' and s['parent_code'] != q['chapter_code']:
            bad.append((qid, final.get('section')))
            continue
        code = s['code']
        cat = code[0] if code[0] in 'AB' else code.split('-')[0]
        rows.append((qid, s['id'], s['subject_id'], cat, q['is_golden']))
        conf['%s/%s' % (tag, final.get('confidence'))] += 1
        by_sec[code] += 1
        if q['is_golden']:
            golden += 1
        if s['parent_code'] != q['chapter_code']:
            cross += 1

    print('待落库 %d | 缺结果 %d | 非法 %d | 其中金标 %d | 跨章纠正 %d'
          % (len(rows), len(missing), len(bad), golden, cross))
    print('置信度:', dict(conf))
    print('前 10 节:', by_sec.most_common(10))
    if bad:
        print('非法样例:', bad[:10])
    if missing or bad:
        raise SystemExit(1)

    with MAP.open('w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        for row in rows:
            w.writerow(row)

    SQL.write_text("""-- 章直属题归位（由 apply_direct.py 生成）
BEGIN;
CREATE TEMP TABLE tmp_map(id int primary key, chapter_id int, subject_id smallint,
                          cat_l1 text, is_golden boolean);
\\copy tmp_map from '/tmp/direct_map.csv' with (format csv)
-- 落库前快照
\\copy (select q.id, q.chapter_id, q.subject_id, q.cat_l1, q.is_golden from t_question q join tmp_map m on m.id = q.id order by q.id) to '/tmp/direct_reclass_backup_20261021.csv' with (format csv, header)
-- 普通题：章节 + 学科 + 课程码
UPDATE t_question q
   SET chapter_id = m.chapter_id, subject_id = m.subject_id, cat_l1 = m.cat_l1
  FROM tmp_map m
 WHERE q.id = m.id AND NOT m.is_golden;
-- 金标题：只改章节，保留其余原貌
UPDATE t_question q
   SET chapter_id = m.chapter_id
  FROM tmp_map m
 WHERE q.id = m.id AND m.is_golden;
SELECT count(*) AS mapped FROM tmp_map;
COMMIT;
""", encoding='utf-8')
    print('已生成', MAP, '和', SQL)


if __name__ == '__main__':
    main()
