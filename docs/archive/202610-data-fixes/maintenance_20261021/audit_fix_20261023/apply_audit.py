# -*- coding: utf-8 -*-
"""把 buddy 复核结果转成待落库变更（只取 high；选项 triage 只出报告）。"""
import csv
import json
import re
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent


def load_jsonl(name):
    p = BASE / name
    if not p.exists():
        return []
    return [json.loads(x) for x in p.read_text(encoding='utf-8').splitlines() if x.strip()]


def load_items(name):
    return json.loads((BASE / name).read_text(encoding='utf-8'))


def option_keys(it):
    try:
        return set(json.loads(it.get('optionJson') or '{}').keys())
    except Exception:
        return set()


def norm_multi(ans, it):
    letters = re.findall(r'[A-H]', (ans or '').upper())
    if not letters:
        return None
    keys = option_keys(it)
    if keys and any(x not in keys for x in letters):
        return None
    return ','.join(sorted(set(letters)))


def valid_answer(ans, qtype, it):
    ans = (ans or '').strip()
    if qtype == 1:
        return ans.upper() if re.fullmatch(r'[A-H]', ans.upper() or '') else None
    if qtype == 2:
        return norm_multi(ans, it)
    if qtype == 3:
        return ans.upper() if ans.upper() in ('A', 'B') else None
    if qtype in (4, 5):
        return ans if ans else None
    return None


def main():
    paper_items = {(x['source'], int(x['id'])): x for x in load_items('paper_items.json')}
    format_items = {int(x['id']): x for x in load_items('format_items.json')}
    changes = {}  # id -> dict(type, answer, blank)
    skipped = []
    manual_multi = []

    # 1) 试卷题型/答案
    for r in load_jsonl('paper_results.jsonl'):
        if r.get('error') or r.get('confidence') != 'high':
            continue
        it = paper_items.get((r.get('source'), int(r['id'])))
        if not it:
            continue
        cur_type = int(it.get('questionType') or 0)
        expected = it.get('expectedType')
        new_type = r.get('type')
        try:
            new_type = int(new_type)
        except Exception:
            continue
        if new_type not in (1, 2, 3, 4, 5):
            continue
        if expected is not None and new_type != int(expected):
            skipped.append((r['id'], 'type_not_expected', new_type, expected))
            continue
        new_ans = r.get('answer')
        ans_val = valid_answer(new_ans, new_type, it)
        ch = changes.setdefault(int(r['id']), {})
        if new_type != cur_type:
            ch['question_type'] = new_type
        if ans_val is not None and ans_val != (it.get('correct') or ''):
            ch['correct'] = ans_val
        if not ch:
            changes.pop(int(r['id']), None)

    # 2) 多选格式 / 填空空数
    for r in load_jsonl('format_results.jsonl'):
        if r.get('error') or r.get('confidence') != 'high':
            continue
        it = format_items.get(int(r['id']))
        if not it:
            continue
        ch = changes.setdefault(int(r['id']), {})
        if it.get('kind') == 'multi_format':
            cur = set(re.findall(r'[A-H]', (it.get('correct') or '').upper()))
            new = set(re.findall(r'[A-H]', (r.get('answer') or '').upper()))
            if cur != new:
                # 答案语义变了：不自动改，留给人工复核
                manual_multi.append((r['id'], ','.join(sorted(cur)), ','.join(sorted(new)),
                                     r.get('reason') or ''))
                changes.pop(int(r['id']), None)
                continue
            val = norm_multi(r.get('answer'), it)
            if val and val != (it.get('correct') or ''):
                ch['correct'] = val
        else:
            try:
                bc = int(r.get('blank_count'))
            except Exception:
                bc = None
            if bc is not None and 1 <= bc <= 20 and bc != int(it.get('blankCount') or 0):
                ch['blank_count'] = bc
        if not ch:
            changes.pop(int(r['id']), None)

    # 合并冲突：同一题既有 type 又有 answer 时按最终 type 再校验
    rows = []
    for qid, ch in sorted(changes.items()):
        it = next((x for x in list(paper_items.values()) + list(format_items.values()) if int(x['id']) == qid), {})
        qtype = ch.get('question_type') or int(it.get('questionType') or 0)
        if 'correct' in ch and not valid_answer(ch['correct'], qtype, it):
            ch.pop('correct')
        rows.append((qid, ch.get('question_type', ''), ch.get('correct', ''), ch.get('blank_count', '')))

    with open(BASE / 'audit_fix_changes.csv', 'w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        w.writerow(['id', 'question_type', 'correct', 'blank_count'])
        w.writerows(rows)

    sql = r"""BEGIN;
CREATE TEMP TABLE tmp_fix(id int, question_type smallint, correct text, blank_count smallint);
\copy tmp_fix from '/tmp/audit_fix_changes.csv' with (format csv, header true, null '')
\copy (select q.id, q.question_type, q.correct, q.blank_count from t_question q join tmp_fix f on f.id=q.id order by q.id) to '/tmp/audit_fix_backup_20261023.csv' with (format csv, header true)
UPDATE t_question q
   SET question_type = coalesce(f.question_type, q.question_type),
       correct = coalesce(f.correct, q.correct),
       blank_count = coalesce(f.blank_count, q.blank_count)
  FROM tmp_fix f
 WHERE q.id = f.id;
COMMIT;
"""
    (BASE / 'apply_audit_fix.sql').write_text(sql, encoding='utf-8')

    # 3) 选项 triage 报告
    opt_rows = []
    for r in load_jsonl('option_results.jsonl'):
        if r.get('error'):
            continue
        opt_rows.append((r['id'], r.get('status'), r.get('missing'), r.get('suggested'),
                         r.get('confidence'), r.get('reason')))
    with open(BASE / 'option_report.csv', 'w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        w.writerow(['id', 'status', 'missing', 'suggested', 'confidence', 'reason'])
        w.writerows(opt_rows)

    with open(BASE / 'manual_multi_review.csv', 'w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        w.writerow(['id', 'current', 'proposed', 'reason'])
        w.writerows(manual_multi)

    print('changes', len(rows), 'skipped', len(skipped), 'manual_multi', len(manual_multi))
    print('option_rows', len(opt_rows))
    for x in skipped[:10]:
        print('skip', x)


if __name__ == '__main__':
    main()
