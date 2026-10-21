# -*- coding: utf-8 -*-
"""为无关联的知识点/题目生成候选（按同章 + 字符二元组相似度），供 LLM 复核。"""
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
KPS = json.loads((BASE / 'kps_no_q.json').read_text(encoding='utf-8'))
QS = json.loads((BASE / 'questions_no_kp.json').read_text(encoding='utf-8'))


def clean(s):
    s = (s or '').lower()
    s = re.sub(r'[^\w一-鿿]+', '', s)
    return s


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
    q_by_root = defaultdict(list)
    for kp in KPS:
        kp_by_root[kp['root_code']].append(kp)
    for q in QS:
        q_by_root[q['root_code']].append(q)

    kp_cand = {}
    q_cand = {}
    for root, kps in kp_by_root.items():
        qpool = [(q['id'], grams((q.get('stem') or '') + (q.get('analysis') or '')[:100]))
                 for q in q_by_root.get(root, [])]
        for kp in kps:
            tg = grams((kp.get('title') or '') + (kp.get('content') or ''))
            kp_cand[kp['id']] = topk(tg, qpool, 8)
    for root, qs in q_by_root.items():
        kpool = [(k['id'], grams((k.get('title') or '') + (k.get('content') or '')))
                 for k in kp_by_root.get(root, [])]
        for q in qs:
            tg = grams((q.get('stem') or '') + (q.get('correct') or ''))
            q_cand[q['id']] = topk(tg, kpool, 8)

    (BASE / 'kp_candidates.json').write_text(json.dumps(kp_cand, ensure_ascii=False), encoding='utf-8')
    (BASE / 'q_candidates.json').write_text(json.dumps(q_cand, ensure_ascii=False), encoding='utf-8')
    print('kp', len(kp_cand), 'with_cand', sum(1 for v in kp_cand.values() if v))
    print('q', len(q_cand), 'with_cand', sum(1 for v in q_cand.values() if v))


if __name__ == '__main__':
    main()
