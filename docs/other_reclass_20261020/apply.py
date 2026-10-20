# -*- coding: utf-8 -*-
"""把分类结果落库：生成 map.csv 与 apply.sql，并输出统计。

用法：
  python apply.py            # 只统计/生成文件
  python apply.py --check    # 额外校验覆盖情况
"""
import argparse
import collections
import csv
import json
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
QUESTIONS = BASE / 'questions.json'
SECTIONS = BASE / 'sections.json'
RESULTS = BASE / 'results.jsonl'
MAP = BASE / 'map.csv'
SQL = BASE / 'apply.sql'


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--check', action='store_true')
    args = ap.parse_args()

    qs = {q['id']: q for q in json.loads(QUESTIONS.read_text(encoding='utf-8'))}
    secs = {s['code']: s for s in json.loads(SECTIONS.read_text(encoding='utf-8'))}
    results = {}
    for line in RESULTS.read_text(encoding='utf-8').splitlines():
        if not line.strip():
            continue
        r = json.loads(line)
        results[r['id']] = r

    rows = []
    missing = []
    bad = []
    skipped_golden = []
    conf = collections.Counter()
    by_sec = collections.Counter()
    for qid, q in qs.items():
        if q['is_golden']:
            skipped_golden.append(qid)
            continue
        r = results.get(qid)
        if not r:
            missing.append(qid)
            continue
        code = r.get('section')
        s = secs.get(code)
        if not s:
            bad.append((qid, code))
            continue
        cat = code.split('-')[0]
        rows.append((qid, s['id'], s['subject_id'], cat))
        conf[r.get('confidence')] += 1
        by_sec[code] += 1

    print('待落库 %d | 缺结果 %d | 非法 %d | 跳过金标 %d'
          % (len(rows), len(missing), len(bad), len(skipped_golden)))
    print('置信度:', dict(conf))
    print('前 10 小节:', by_sec.most_common(10))
    if bad:
        print('非法样例:', bad[:10])
    if args.check and (missing or bad):
        print('缺结果 id 前 20:', missing[:20])
        raise SystemExit(1)

    with MAP.open('w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        for row in rows:
            w.writerow(row)

    SQL.write_text("""-- 其他题目归位（由 apply.py 生成）
BEGIN;
CREATE TEMP TABLE tmp_map(id int primary key, chapter_id int, subject_id smallint, cat_l1 text);
\\copy tmp_map from '/tmp/map.csv' with (format csv)
-- 落库前快照（可回滚）
\\copy (select q.id, q.chapter_id, q.subject_id, q.cat_l1 from t_question q join tmp_map m on m.id = q.id order by q.id) to '/tmp/other_reclass_backup_20261020.csv' with (format csv, header)
UPDATE t_question q
   SET chapter_id = m.chapter_id,
       subject_id = m.subject_id,
       cat_l1     = m.cat_l1
  FROM tmp_map m
 WHERE q.id = m.id AND NOT q.is_golden;
SELECT count(*) AS mapped FROM tmp_map;
COMMIT;
""", encoding='utf-8')
    print('已生成', MAP, '和', SQL)


if __name__ == '__main__':
    main()
