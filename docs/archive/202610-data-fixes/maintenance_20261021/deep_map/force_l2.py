# -*- coding: utf-8 -*-
"""强制把剩余的章级知识点落到「节」（L2），不再允许停在章。"""
import json
import os
import re
import shutil
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
KPS = json.loads((BASE / 'kps_l1.json').read_text(encoding='utf-8'))
CHS = json.loads((BASE / 'chapters.json').read_text(encoding='utf-8'))
BY_CODE = {c['code']: c for c in CHS}
CHILDREN = {}
for c in CHS:
    if c['parent_id'] is not None:
        CHILDREN.setdefault(c['parent_id'], []).append(c)
RESULTS = BASE / 'force_l2_results.jsonl'

NODE = shutil.which('node')
CB_BIN = r'D:\Program Files\nodejs\node_global\node_modules\@tencent-ai\codebuddy-code\bin\codebuddy'
MODEL = 'deepseek-v4.1-flash'
SYSTEM = """你是江苏专转本（计算机专业大类）的命题与知识体系专家。
请把知识点归入本章的某个「节」。必须从给定节清单中选一个，不能返回章；
即使不完全贴合，也选最接近的节（允许宽松）。只输出 JSON：{"section":"A1-1.1","confidence":"high|medium|low","reason":"不超过20字"}"""


def candidates(kp):
    # 同名根节点（理论 A1 / 实操 A1）取子节最多的那个
    best = []
    for root in [c for c in CHS if c['code'] == kp['root_code']]:
        cands = [c for c in CHILDREN.get(root['id'], []) if c.get('level') == 2]
        if len(cands) > len(best):
            best = cands
    return best


def build_prompt(kp):
    cands = candidates(kp)
    lines = ['【所属章】%s %s' % (kp['root_code'], kp['root_name']), '【必须从中选一个节】']
    for c in cands:
        lines.append('%s %s' % (c['code'], c['name']))
    lines += ['', '【知识点】', '标题：%s' % (kp.get('title') or ''),
              '正文前 600 字：%s' % (kp.get('content') or '')[:600], '',
              '选一个最接近的节代码，只输出 JSON。']
    return '\n'.join(lines)


def call(prompt, timeout=300):
    full = SYSTEM + '\n\n' + prompt
    env = {k: v for k, v in os.environ.items()
           if k.lower() not in ('https_proxy', 'http_proxy', 'all_proxy')}
    r = subprocess.run([NODE, CB_BIN, '-p', '--model', MODEL, '--tools', '',
                        '--no-session-persistence'],
                       input=full.encode('utf-8'), capture_output=True, timeout=timeout, env=env)
    if r.returncode != 0:
        raise RuntimeError('buddy exit %s' % r.returncode)
    out = (r.stdout or b'').decode('utf-8', 'replace').strip()
    if out.startswith('```'):
        out = re.sub(r'^```[a-zA-Z]*\s*|\s*```$', '', out)
    m = re.search(r'\{.*\}', out, re.S)
    return json.loads(m.group(0) if m else out)


def main():
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument('--concurrency', type=int, default=8)
    args = ap.parse_args()
    done = set()
    if RESULTS.exists():
        for line in RESULTS.read_text(encoding='utf-8').splitlines():
            try:
                done.add(json.loads(line)['id'])
            except Exception:  # noqa: BLE001
                pass
    todo = [k for k in KPS if k['id'] not in done and candidates(k)]
    print('待跑 %d | 已完成 %d' % (len(todo), len(done)))
    lock = __import__('threading').Lock()
    t0 = time.time()
    ok = fail = 0
    with RESULTS.open('a', encoding='utf-8') as out:
        def work(kp):
            cands = candidates(kp)
            allowed = {c['code'] for c in cands}
            for attempt in range(3):
                try:
                    obj = call(build_prompt(kp))
                    code = str(obj.get('section') or '').strip().upper()
                    if code not in allowed:
                        raise ValueError('非法节: %r' % code)
                    return {'id': kp['id'], 'section': code,
                            'confidence': obj.get('confidence'), 'reason': obj.get('reason')}
                except Exception as e:  # noqa: BLE001
                    if attempt == 2:
                        return {'id': kp['id'], 'section': cands[0]['code'],
                                'confidence': 'fallback', 'error': str(e)[:120]}
                    time.sleep(1.5 * (attempt + 1))
        with ThreadPoolExecutor(max_workers=args.concurrency) as ex:
            futs = {ex.submit(work, k): k for k in todo}
            for i, fut in enumerate(as_completed(futs), 1):
                r = fut.result()
                with lock:
                    out.write(json.dumps(r, ensure_ascii=False) + '\n')
                    out.flush()
                    if 'error' in r:
                        fail += 1
                    else:
                        ok += 1
                if i % 50 == 0 or i == len(todo):
                    el = time.time() - t0
                    print('进度 %d/%d | ok %d fail %d | %.1fs | %.2f 条/秒'
                          % (i, len(todo), ok, fail, el, i / max(el, 0.1)))
    print('完成 ok %d fail %d' % (ok, fail))


if __name__ == '__main__':
    main()
