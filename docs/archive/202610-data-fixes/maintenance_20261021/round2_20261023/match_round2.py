# -*- coding: utf-8 -*-
"""第二轮补挂：q_deleted（题→知识点）/ kp_noq（知识点→题），buddy 逐条复核。"""
import argparse
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
NODE = shutil.which('node')
CB_BIN = r'D:\Program Files\nodejs\node_global\node_modules\@tencent-ai\codebuddy-code\bin\codebuddy'
MODEL = 'deepseek-v4.1-flash'

SYS_Q = """你是江苏专转本计算机题库的审题专家。给定一道题和若干候选知识点，选出这道题真正考查的知识点。
只能从候选 id 中选，最多 3 个；都不相关就返回空数组。只输出 JSON：{"ids":[1,2],"confidence":"high|medium|low"}"""
SYS_KP = """你是江苏专转本计算机题库的审题专家。给定一个知识点和若干候选题，选出真正考查该知识点的题目。
只能从候选 id 中选，最多 3 个；都不相关就返回空数组。只输出 JSON：{"ids":[1,2],"confidence":"high|medium|low"}"""


def call_buddy(system, user, timeout=300):
    full = system + '\n\n' + user
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
    ap = argparse.ArgumentParser()
    ap.add_argument('--task', choices=['q_deleted', 'kp_noq'], required=True)
    ap.add_argument('--concurrency', type=int, default=12)
    args = ap.parse_args()

    if args.task == 'q_deleted':
        items = json.loads((BASE / 'q_deleted.json').read_text(encoding='utf-8'))
        cand = json.loads((BASE / 'q_deleted_candidates.json').read_text(encoding='utf-8'))
        out_file = BASE / 'q_deleted_results.jsonl'
        system = SYS_Q

        def prompt(it):
            lines = ['【题目】', '题干：%s' % (it.get('stem') or '')[:600],
                     '答案：%s' % (it.get('correct') or ''), '', '【候选知识点】']
            for c in cand.get(str(it['id']), []):
                lines.append('[%s] %s' % (c['id'], c.get('title') or ''))
            lines.append('')
            lines.append('选出这道题真正考查的知识点 id（最多 3 个，没有就空数组），只输出 JSON。')
            return '\n'.join(lines)
    else:
        kps = json.loads((BASE / 'kp_noq.json').read_text(encoding='utf-8'))
        cand = json.loads((BASE / 'kp_noq_candidates.json').read_text(encoding='utf-8'))
        out_file = BASE / 'kp_noq_results.jsonl'
        system = SYS_KP
        items = kps

        def prompt(it):
            lines = ['【知识点】', '标题：%s' % (it.get('title') or ''),
                     '正文：%s' % (it.get('content') or '')[:600], '', '【候选题】']
            for c in cand.get(str(it['id']), []):
                lines.append('[%s] %s' % (c['id'], c.get('stem') or ''))
            lines.append('')
            lines.append('选出真正考查该知识点的题目 id（最多 3 个，没有就空数组），只输出 JSON。')
            return '\n'.join(lines)

    done = set()
    if out_file.exists():
        for line in out_file.read_text(encoding='utf-8').splitlines():
            try:
                r = json.loads(line)
                if not r.get('error') and r.get('confidence') != 'fallback':
                    done.add(int(r['id']))
            except Exception:
                pass
    todo = [x for x in items if int(x['id']) not in done and cand.get(str(x['id']))]
    print('待跑 %d | 已完成 %d | task %s' % (len(todo), len(done), args.task))

    lock = __import__('threading').Lock()
    t0 = time.time()
    ok = fail = 0
    with out_file.open('a', encoding='utf-8') as out:
        def work(it):
            allowed = {int(c['id']) for c in cand.get(str(it['id']), [])}
            for attempt in range(3):
                try:
                    obj = call_buddy(system, prompt(it))
                    ids = [int(x) for x in (obj.get('ids') or []) if int(x) in allowed][:3]
                    return {'id': it['id'], 'ids': ids,
                            'confidence': obj.get('confidence'), 'error': None}
                except Exception as e:
                    if attempt == 2:
                        return {'id': it['id'], 'ids': [], 'confidence': 'fallback',
                                'error': str(e)[:120]}
                    time.sleep(1.5 * (attempt + 1))
        with ThreadPoolExecutor(max_workers=args.concurrency) as ex:
            futs = {ex.submit(work, it): it for it in todo}
            for i, fut in enumerate(as_completed(futs), 1):
                r = fut.result()
                with lock:
                    out.write(json.dumps(r, ensure_ascii=False) + '\n')
                    out.flush()
                    if r.get('error'):
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
