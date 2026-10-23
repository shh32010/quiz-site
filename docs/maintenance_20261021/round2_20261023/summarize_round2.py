# -*- coding: utf-8 -*-
"""汇总第二轮结果：生成 A/B 落库 SQL、C/D 报告。"""
import csv
import json
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent


def load(name):
    p = BASE / name
    if not p.exists():
        return []
    return [json.loads(x) for x in p.read_text(encoding='utf-8').splitlines() if x.strip()]


def conf_cn(c):
    return '高' if c == 'high' else '中' if c == 'medium' else '低'


def main():
    # A: 题 → 活跃知识点
    qrows = []
    seen = set()
    for r in load('q_deleted_results.jsonl'):
        if r.get('error') or r.get('confidence') not in ('high', 'medium'):
            continue
        for kp in r.get('ids') or []:
            key = (int(r['id']), int(kp))
            if key not in seen:
                seen.add(key)
                qrows.append((int(kp), int(r['id']), conf_cn(r['confidence'])))
    with open(BASE / 'q_deleted_links.csv', 'w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        w.writerows(qrows)
    print('q_deleted links', len(qrows), 'questions', len({x[1] for x in qrows}))

    # B: 知识点 → 活跃题
    kprows = []
    seen = set()
    for r in load('kp_noq_results.jsonl'):
        if r.get('error') or r.get('confidence') not in ('high', 'medium'):
            continue
        for q in r.get('ids') or []:
            key = (int(q), int(r['id']))
            if key not in seen:
                seen.add(key)
                kprows.append((int(q), int(r['id']), conf_cn(r['confidence'])))
    with open(BASE / 'kp_noq_links.csv', 'w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        w.writerows(kprows)
    print('kp_noq links', len(kprows), 'kps', len({x[1] for x in kprows}))

    sql = r"""BEGIN;
CREATE TEMP TABLE tmp_q(kp_id int, question_id int, confidence text);
\copy tmp_q from '/tmp/q_deleted_links.csv' with (format csv)
INSERT INTO t_question_kp(id, question_id, kp_id, match_source, confidence)
SELECT (SELECT coalesce(max(id), 0) FROM t_question_kp) + row_number() OVER (),
       question_id, kp_id, 'KP补挂v4_20261023_deletedonly', confidence
  FROM tmp_q
ON CONFLICT (question_id, kp_id) DO NOTHING;

CREATE TEMP TABLE tmp_kp(question_id int, kp_id int, confidence text);
\copy tmp_kp from '/tmp/kp_noq_links.csv' with (format csv)
INSERT INTO t_question_kp(id, question_id, kp_id, match_source, confidence)
SELECT (SELECT coalesce(max(id), 0) FROM t_question_kp) + row_number() OVER (),
       question_id, kp_id, 'KP补挂v4_20261023_kp2', confidence
  FROM tmp_kp
ON CONFLICT (question_id, kp_id) DO NOTHING;
COMMIT;
"""
    (BASE / 'apply_round2.sql').write_text(sql, encoding='utf-8')

    # C: 跨学科复核报告
    cross_items = {(int(x['questionId']), int(x['kpId'])): x
                   for x in json.loads((BASE / 'cross_subject.json').read_text(encoding='utf-8'))}
    cross_rows = []
    for r in load('cross_subject_results.jsonl'):
        if r.get('error'):
            continue
        key = (int(r['questionId']), int(r['kpId']))
        it = cross_items.get(key, {})
        cross_rows.append((r['questionId'], r['kpId'], it.get('qSubject'), it.get('kpSubject'),
                           it.get('confidence'), 'keep' if r.get('keep') else 'drop',
                           r.get('confidence'), r.get('reason')))
    with open(BASE / 'cross_subject_report.csv', 'w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        w.writerow(['questionId', 'kpId', 'qSubject', 'kpSubject', 'oldConfidence',
                    'decision', 'llmConfidence', 'reason'])
        w.writerows(cross_rows)
    print('cross report', len(cross_rows), 'drop_high',
          sum(1 for x in cross_rows if x[5] == 'drop' and x[6] == 'high'))

    # D: C4 质检复核报告
    qrows2 = []
    for r in load('quality_c4_results.jsonl'):
        if r.get('error'):
            continue
        qrows2.append((r['id'], r.get('answer'), r.get('quality'), r.get('confidence'),
                       r.get('fix'), r.get('reason')))
    with open(BASE / 'quality_c4_report.csv', 'w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        w.writerow(['id', 'answer', 'quality', 'confidence', 'fix', 'reason'])
        w.writerows(qrows2)
    print('quality report', len(qrows2))


if __name__ == '__main__':
    main()
