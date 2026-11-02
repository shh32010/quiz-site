# -*- coding: utf-8 -*-
"""把知识点映射到大纲树的节/目（node_id）。

策略：
1. 从知识点当前 chapter_id 找到所属 L1 章（A1/B3/S1…）
2. 优先按 section/title 的数字编号匹配：1.2.2 → A1-1.2.2，找不到逐级回退到 1.2、1
3. 编号匹配不到时，按标题与章下节点名称做规范化匹配
4. 仍失败则挂到 L1 章
输出：kp_map.csv（id,node_id,method）与映射统计
"""
import csv
import json
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
KPS = json.loads((BASE / 'kps.json').read_text(encoding='utf-8'))
CHS = json.loads((BASE / 'chapters.json').read_text(encoding='utf-8'))

by_id = {c['id']: c for c in CHS}
by_code = {c['code']: c for c in CHS}
children = defaultdict(list)
for c in CHS:
    if c['parent_id'] is not None:
        children[c['parent_id']].append(c)


def root_of(cid):
    seen = set()
    while cid is not None and cid not in seen:
        seen.add(cid)
        c = by_id.get(cid)
        if not c:
            return None
        if c['parent_id'] is None:
            return c
        cid = c['parent_id']
    return None


def descendants(node):
    out = [node]
    for ch in children.get(node['id'], []):
        out.extend(descendants(ch))
    return out


def norm(s):
    s = (s or '').lower()
    s = re.sub(r'^\s*\d+(?:\.\d+)*[.、]?\s*', '', s)
    s = re.sub(r'[^\w一-鿿]+', '', s)
    return s


NUM1 = re.compile(r'^\s*(\d+(?:\.\d+)+)')
NUM2 = re.compile(r'^\s*(\d+)\s*[.、]\s*')


def numbers(text):
    t = text or ''
    m = NUM1.match(t)
    if m:
        return m.group(1)
    m = NUM2.match(t)
    if m:
        return m.group(1)
    return None


def find_by_num(root, num):
    parts = num.split('.')
    while parts:
        code = root['code'] + '-' + '.'.join(parts)
        node = by_code.get(code)
        if node:
            return node
        parts.pop()
    return None


def find_by_name(root, text):
    target = norm(text)
    if len(target) < 3:
        return None
    cands = descendants(root)
    exact = [c for c in cands if norm(c['name']) == target]
    if exact:
        return max(exact, key=lambda c: (c['level'], len(c['name'])))
    contains = [c for c in cands
                if len(norm(c['name'])) >= 4 and
                (target in norm(c['name']) or norm(c['name']) in target)]
    if contains:
        return max(contains, key=lambda c: (c['level'], len(c['name'])))
    return None


def main():
    stats = Counter()
    rows = []
    for kp in KPS:
        root = root_of(kp['chapter_id'])
        if not root:
            stats['no_root'] += 1
            rows.append((kp['id'], '', 'no_root'))
            continue
        num = numbers(kp.get('section')) or numbers(kp.get('title'))
        node = find_by_num(root, num) if num else None
        method = 'num'
        if not node:
            node = find_by_name(root, kp.get('section') or '')
            method = 'name'
        if not node:
            node = find_by_name(root, kp.get('title') or '')
            method = 'name_title'
        if not node:
            node = root
            method = 'root_fallback'
        stats['%s_L%d' % (method, node['level'])] += 1
        rows.append((kp['id'], node['id'], '%s_L%d' % (method, node['level'])))

    with (BASE / 'kp_map.csv').open('w', encoding='utf-8', newline='') as f:
        w = csv.writer(f)
        for row in rows:
            w.writerow(row)

    print('总知识点', len(rows))
    for k, v in stats.most_common():
        print(k, v)
    mapped = sum(v for k, v in stats.items() if k != 'no_root')
    print('已映射', mapped, '未映射', stats['no_root'])


if __name__ == '__main__':
    main()
