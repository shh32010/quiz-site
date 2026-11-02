# -*- coding: utf-8 -*-
"""为无知识点题目生成候选（同章 + 全量知识点 + 字符二元组相似度）。"""
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
KPS = json.loads((BASE / 'all_kps.json').read_text(encoding='utf-8'))
QS = json.loads((BASE / 'questions_no_kp.json').read_text(encoding='utf-8'))


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
    kp_by_root = defaultdict(list)
    for kp in KPS:
        kp_by_root[kp['root_code']].append(kp)
    out = {}
    for q in QS:
        pool = [(k['id'], grams((k.get('title') or '') + (k.get('content') or '')))
                for k in kp_by_root.get(q['root_code'], [])]
        tg = grams((q.get('stem') or '') + (q.get('correct') or ''))
        out[q['id']] = topk(tg, pool, 8)
    (BASE / 'q_candidates.json').write_text(json.dumps(out, ensure_ascii=False), encoding='utf-8')
    print('questions', len(out), 'with_cand', sum(1 for v in out.values() if v))


if __name__ == '__main__':
    main()
