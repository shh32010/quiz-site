# -*- coding: utf-8 -*-
"""把关联匹配结果写入 t_question_kp（只取 high/medium）。"""
import argparse
import csv
import json
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--task', choices=['kp', 'q'], required=True)
    args = ap.parse_args()
    src = BASE / ('kp_match_results.jsonl' if args.task == 'kp' else 'q_match_results.jsonl')
    rows = []
    for line in src.read_text(encoding='utf-8').splitlines():
        if not line.strip():
            continue
        r = json.loads(line)
        if r.get('confidence') not in ('high', 'medium'):
            continue
        owner = r['id']
        for other in r.get('ids') or []:
            kp_id, qid = (owner, other) if args.task == 'kp' else (other, owner)
            rows.append((kp_id, qid, r['confidence']))
    # 去重
    seen = set()
    uniq = []
    for row in rows:
        key = (row[0], row[1])
        if key not in seen:
            seen.add(key)
            uniq.append(row)
    out = BASE / ('kp_links.csv' if args.task == 'kp' else 'q_links.csv')
    with out.open('w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        for row in uniq:
            w.writerow(row)
    sql = """BEGIN;
CREATE TEMP TABLE tmp_link(kp_id int, question_id int, confidence text);
\\copy tmp_link from '/tmp/%s' with (format csv)
INSERT INTO t_question_kp(id, question_id, kp_id, match_source, confidence)
SELECT (SELECT coalesce(max(id), 0) FROM t_question_kp) + row_number() OVER (),
       question_id, kp_id, 'KP补挂v4_20261022', confidence
  FROM tmp_link
ON CONFLICT (question_id, kp_id) DO NOTHING;
SELECT count(*) AS input_links FROM tmp_link;
COMMIT;
""" % out.name
    (BASE / ('apply_%s_links.sql' % args.task)).write_text(sql, encoding='utf-8')
    print('links', len(uniq), 'file', out)


if __name__ == '__main__':
    main()
