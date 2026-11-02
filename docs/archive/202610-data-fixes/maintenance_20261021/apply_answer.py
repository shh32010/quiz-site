# -*- coding: utf-8 -*-
"""把答案/质检复核结果落库（高/中置信度才改标记；答案修正确认只做高置信度）。"""
import csv
import json
import re
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
ITEMS = {x['id']: x for x in json.loads((BASE / 'answer_items.json').read_text(encoding='utf-8'))}
RESULTS = [json.loads(l) for l in (BASE / 'answer_results.jsonl').read_text(encoding='utf-8').splitlines() if l.strip()]

LETTERS = 'ABCD'


def normalize_fix(it, fix):
    fix = (fix or '').strip()
    if not fix:
        return ''
    t = it.get('question_type')
    if t in (1, 3):
        if t == 3:
            if '对' in fix and '错' not in fix:
                return 'A'
            if '错' in fix and '对' not in fix:
                return 'B'
        m = re.search(r'[A-Da-d]', fix)
        if not m:
            return ''
        letter = m.group(0).upper()
        if t == 3 and letter not in ('A', 'B'):
            return ''
        if t == 1:
            try:
                keys = set(json.loads(it.get('option_json') or '{}').keys())
            except Exception:  # noqa: BLE001
                keys = set()
            if keys and letter not in keys:
                return ''
        return letter
    if t == 2:
        letters = sorted({c.upper() for c in re.findall(r'[A-Da-d]', fix)})
        try:
            keys = set(json.loads(it.get('option_json') or '{}').keys())
        except Exception:  # noqa: BLE001
            keys = set()
        if keys and not set(letters) <= keys:
            return ''
        return ''.join(letters)
    return fix[:200]


def main():
    rows = []
    n_fix = n_flag = 0
    for r in RESULTS:
        it = ITEMS.get(r['id'])
        if not it:
            continue
        conf = r.get('confidence')
        if conf not in ('high', 'medium'):
            continue
        ans = r.get('answer')
        qua = r.get('quality')
        if ans not in ('match', 'mismatch', 'uncertain') or qua not in ('good', 'warn', 'error'):
            continue
        correct = None
        if ans == 'mismatch' and conf == 'high':
            fix = normalize_fix(it, r.get('fix'))
            if fix and fix != (it.get('correct') or ''):
                correct = fix
                n_fix += 1
                ans = 'match'
        rows.append((r['id'], correct, ans, qua))
        n_flag += 1

    with (BASE / 'answer_updates.csv').open('w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        for row in rows:
            w.writerow(['' if v is None else v for v in row])

    sql = """BEGIN;
CREATE TEMP TABLE tmp_ans(id int primary key, correct text, answer_check text, qc_grade text);
\\copy tmp_ans from '/tmp/answer_updates.csv' with (format csv)
\\copy (select q.id, q.correct, q.answer_check, q.qc_grade from t_question q join tmp_ans t on t.id = q.id order by q.id) to '/tmp/answer_review_backup.csv' with (format csv, header)
UPDATE t_question q
   SET correct = coalesce(nullif(t.correct, ''), q.correct),
       answer_check = t.answer_check,
       qc_grade = t.qc_grade
  FROM tmp_ans t
 WHERE q.id = t.id;
SELECT count(*) AS updated FROM tmp_ans;
COMMIT;
"""
    (BASE / 'apply_answer.sql').write_text(sql, encoding='utf-8')
    print('rows', len(rows), 'answers_fixed', n_fix)
    print('flags', n_flag)


if __name__ == '__main__':
    main()
