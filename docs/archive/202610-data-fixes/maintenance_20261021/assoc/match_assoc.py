# -*- coding: utf-8 -*-
"""用 CodeBuddy 复核候选，补知识点↔题目关联。

用法：
  python match_assoc.py --task kp   # 无题知识点 → 找题目
  python match_assoc.py --task q    # 无知识点题目 → 找知识点
"""
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
KPS_NO_Q = {k['id']: k for k in json.loads((BASE / 'kps_no_q.json').read_text(encoding='utf-8'))}
KPS_ALL = {k['id']: k for k in json.loads((BASE / 'all_kps.json').read_text(encoding='utf-8'))}
QS = {q['id']: q for q in json.loads((BASE / 'questions_no_kp.json').read_text(encoding='utf-8'))}
KP_CAND = {int(k): v for k, v in json.loads((BASE / 'kp_candidates.json').read_text(encoding='utf-8')).items()}
Q_CAND = {int(k): v for k, v in json.loads((BASE / 'q_candidates.json').read_text(encoding='utf-8')).items()}
NODE = shutil.which('node')
CB_BIN = r'D:\Program Files\nodejs\node_global\node_modules\@tencent-ai\codebuddy-code\bin\codebuddy'
MODEL = 'deepseek-v4.1-flash'
OC_EXE = r'D:\Program Files\nodejs\node_global\node_modules\opencode-ai\bin\opencode.exe'
OC_MODEL = 'opencode/deepseek-v4.1-flash-free'
CHANNEL = 'buddy'

SYS_KP = """你是江苏专转本计算机题库的审题专家。给定一个知识点和若干候选题，选出真正考查该知识点的题目。
只能从候选 id 中选，最多 3 个；都不相关就返回空数组。只输出 JSON：{"ids":[1,2],"confidence":"high|medium|low"}"""
SYS_Q = """你是江苏专转本计算机题库的审题专家。给定一道题和若干候选知识点，选出这道题真正考查的知识点。
只能从候选 id 中选，最多 3 个；都不相关就返回空数组。只输出 JSON：{"ids":[1,2],"confidence":"high|medium|low"}"""


def call(system, prompt, timeout=300):
    full = system + '\n\n' + prompt
    if CHANNEL == 'opencode':
        r = subprocess.run([OC_EXE, 'run', '-m', OC_MODEL],
                           input=full.encode('utf-8'), capture_output=True, timeout=timeout)
        out = re.sub(r'\x1b\[[0-9;]*m', '', (r.stdout or b'').decode('utf-8', 'replace')).strip()
    else:
        env = {k: v for k, v in os.environ.items()
               if k.lower() not in ('https_proxy', 'http_proxy', 'all_proxy')}
        r = subprocess.run([NODE, CB_BIN, '-p', '--model', MODEL, '--tools', '',
                            '--no-session-persistence'],
                           input=full.encode('utf-8'), capture_output=True, timeout=timeout, env=env)
        out = (r.stdout or b'').decode('utf-8', 'replace').strip()
    if r.returncode != 0:
        raise RuntimeError('%s exit %s' % (CHANNEL, r.returncode))
    if out.startswith('```'):
        out = re.sub(r'^```[a-zA-Z]*\s*|\s*```$', '', out)
    m = re.search(r'\{.*\}', out, re.S)
    return json.loads(m.group(0) if m else out)


def prompt_kp(kp):
    lines = ['【知识点】', '标题：%s' % (kp.get('title') or ''),
             '正文：%s' % (kp.get('content') or '')[:600], '', '【候选题】']
    for qid in KP_CAND.get(kp['id'], []):
        q = QS[qid]
        lines.append('[%s] %s' % (qid, (q.get('stem') or '')[:160]))
    lines.append('')
    lines.append('选出真正考查该知识点的题目 id（最多 3 个，没有就空数组），只输出 JSON。')
    return '\n'.join(lines)


def prompt_q(q):
    lines = ['【题目】', '题干：%s' % (q.get('stem') or '')[:600],
             '答案：%s' % (q.get('correct') or ''), '', '【候选知识点】']
    for kid in Q_CAND.get(q['id'], []):
        k = KPS_ALL[kid]
        lines.append('[%s] %s' % (kid, k.get('title') or ''))
    lines.append('')
    lines.append('选出这道题真正考查的知识点 id（最多 3 个，没有就空数组），只输出 JSON。')
    return '\n'.join(lines)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--task', choices=['kp', 'q'], required=True)
    ap.add_argument('--channel', choices=['buddy', 'opencode'], default='buddy')
    ap.add_argument('--concurrency', type=int, default=6)
    args = ap.parse_args()
    global CHANNEL
    CHANNEL = args.channel

    if args.task == 'kp':
        items = list(KPS_NO_Q.values())
        cand = KP_CAND
        system, prompt, out_file = SYS_KP, prompt_kp, BASE / 'kp_match_results.jsonl'
    else:
        items = list(QS.values())
        cand = Q_CAND
        system, prompt, out_file = SYS_Q, prompt_q, BASE / 'q_match_results.jsonl'

    done = set()
    if out_file.exists():
        for line in out_file.read_text(encoding='utf-8').splitlines():
            try:
                r = json.loads(line)
                # fallback / error 的结果不算完成，下次重跑
                if not r.get('error') and r.get('confidence') != 'fallback':
                    done.add(r['id'])
            except Exception:  # noqa: BLE001
                pass
    todo = [x for x in items if x['id'] not in done and cand.get(x['id'])]
    print('待跑 %d | 已完成 %d | task %s | channel %s' % (len(todo), len(done), args.task, args.channel))

    lock = __import__('threading').Lock()
    t0 = time.time()
    ok = fail = 0
    with out_file.open('a', encoding='utf-8') as out:
        def work(it):
            allowed = set(cand.get(it['id'], []))
            for attempt in range(3):
                try:
                    obj = call(system, prompt(it))
                    ids = [int(x) for x in (obj.get('ids') or []) if int(x) in allowed][:3]
                    return {'id': it['id'], 'ids': ids,
                            'confidence': obj.get('confidence'), 'error': None}
                except Exception as e:  # noqa: BLE001
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
