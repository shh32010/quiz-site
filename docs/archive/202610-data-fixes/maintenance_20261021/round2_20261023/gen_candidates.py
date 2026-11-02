# -*- coding: utf-8 -*-
"""为第二轮补挂生成候选：q_deleted（题→知识点）/ kp_noq（知识点→题）。"""
import argparse
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
ASSOC = BASE.parent / 'assoc'


def clean(s):
    s = (s or '').lower()
    return re.sub(r'[^\w一-鿿]+', '', s)


def grams(s):
    s = clean(s)
    return {s[i:i + 2] for i in range(len(s) - 1)} if len(s) > 1 else {s}


def sim(a, b):
    if not a or not b:
        return 0.0
    return len(a & b) / len(a | b)


def topk(target, pool, k=8):
    scored = []
    for item, g in pool:
        s = sim(target, g)
        if s > 0:
            scored.append((s, item))
    scored.sort(key=lambda x: -x[0])
    return [item for _, item in scored[:k]]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--task', choices=['q_deleted', 'kp_noq'], required=True)
    args = ap.parse_args()

    if args.task == 'q_deleted':
        kps = json.loads((ASSOC / 'all_kps.json').read_text(encoding='utf-8'))
        qs = json.loads((BASE / 'q_deleted.json').read_text(encoding='utf-8'))
        kp_by_root = defaultdict(list)
        for k in kps:
            kp_by_root[k.get('root_code') or ''].append(k)
        out = {}
        for q in qs:
            pool = [(str(k['id']), grams((k.get('title') or '') + (k.get('content') or '')))
                    for k in kp_by_root.get(q.get('root_code') or '', [])]
            tg = grams((q.get('stem') or '') + (q.get('correct') or ''))
            ids = topk(tg, pool, 8)
            by_id = {str(k['id']): k for k in kp_by_root.get(q.get('root_code') or '', [])}
            out[str(q['id'])] = [{'id': x, 'title': by_id[x].get('title') or ''} for x in ids]
        (BASE / 'q_deleted_candidates.json').write_text(json.dumps(out, ensure_ascii=False), encoding='utf-8')
        print('questions', len(out), 'with_cand', sum(1 for v in out.values() if v))
    else:
        qs = json.loads((BASE / 'questions_active.json').read_text(encoding='utf-8'))
        kps = json.loads((BASE / 'kp_noq.json').read_text(encoding='utf-8'))
        q_by_root = defaultdict(list)
        for q in qs:
            q_by_root[q.get('root_code') or ''].append(q)
        q_grams = {}
        for root, items in q_by_root.items():
            q_grams[root] = [(q['id'], grams(q.get('stem') or ''), q.get('stem') or '') for q in items]
        out = {}
        for kp in kps:
            root = kp.get('root_code') or ''
            pool = [(x[0], x[1]) for x in q_grams.get(root, [])]
            tg = grams((kp.get('title') or '') + (kp.get('content') or ''))
            ids = topk(tg, pool, 8)
            by_id = {x[0]: x[2] for x in q_grams.get(root, [])}
            out[str(kp['id'])] = [{'id': x, 'stem': by_id[x][:160]} for x in ids]
        (BASE / 'kp_noq_candidates.json').write_text(json.dumps(out, ensure_ascii=False), encoding='utf-8')
        print('kps', len(out), 'with_cand', sum(1 for v in out.values() if v))


if __name__ == '__main__':
    main()
