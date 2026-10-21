# -*- coding: utf-8 -*-
"""通用 CodeBuddy 复核器：知识点去题化 / 隔离题复审。

用法：
  python review_items.py --task kp        # 79 条题目式知识点
  python review_items.py --task quarantine # 235 道隔离题（跳过金标）
输入：kt_items.json / quarantine_items.json
输出：kp_results.jsonl / quarantine_results.jsonl（断点续跑）
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
NODE = shutil.which('node')
CB_BIN = r'D:\Program Files\nodejs\node_global\node_modules\@tencent-ai\codebuddy-code\bin\codebuddy'
MODEL = 'deepseek-v4.1-flash'
TYPL = {1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合'}

SYSTEMS = {
    'kp': """你是题库数据清理助手。判断下面这条“知识点”记录是否实际上是题目、图片占位符或无意义碎片。
只输出 JSON：{"keep":true|false,"confidence":"high|medium|low","reason":"不超过20字"}""",
    'quarantine': """你是江苏专转本计算机题库的审题专家。这是一道当前被隔离的题，请重新审读题干、选项、答案和解析，
判断它是否应恢复为正常练习题。只输出 JSON：{"release":true|false,"confidence":"high|medium|low","reason":"不超过30字"}""",
}


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


def prompt_kp(it):
    return '标题：%s\n所属：%s\n正文前 600 字：\n%s' % (
        it.get('title') or '', it.get('section') or '', (it.get('content') or '')[:600])


def prompt_quarantine(it):
    opt = ''
    if it.get('option_json'):
        try:
            o = json.loads(it['option_json'])
            opt = '\n'.join('%s. %s' % (k, o[k]) for k in list(o.keys())[:6])
        except Exception:  # noqa: BLE001
            opt = str(it['option_json'])[:300]
    return '题型：%s\n题干：%s\n选项：%s\n库内答案：%s\n解析：%s\n当前标记：qc=%s answer=%s' % (
        TYPL.get(it.get('question_type'), '?'), it.get('stem') or '', opt,
        it.get('correct') or '', (it.get('analysis') or '')[:300],
        it.get('qc_grade'), it.get('answer_check'))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--task', choices=['kp', 'quarantine'], required=True)
    ap.add_argument('--concurrency', type=int, default=8)
    args = ap.parse_args()

    if args.task == 'kp':
        items = json.loads((BASE / 'kp_items.json').read_text(encoding='utf-8'))
        prompt = prompt_kp
        out_file = BASE / 'kp_results.jsonl'
    else:
        items = json.loads((BASE / 'quarantine_items.json').read_text(encoding='utf-8'))
        prompt = prompt_quarantine
        out_file = BASE / 'quarantine_results.jsonl'

    done = set()
    if out_file.exists():
        for line in out_file.read_text(encoding='utf-8').splitlines():
            try:
                done.add(json.loads(line)['id'])
            except Exception:  # noqa: BLE001
                pass
    todo = [x for x in items if x['id'] not in done]
    print('待跑 %d | 已完成 %d | task %s' % (len(todo), len(done), args.task))

    lock = __import__('threading').Lock()
    t0 = time.time()
    n_ok = n_fail = 0
    with out_file.open('a', encoding='utf-8') as out:
        def work(it):
            for attempt in range(3):
                try:
                    obj = call_buddy(SYSTEMS[args.task], prompt(it))
                    return {'id': it['id'], **obj}
                except Exception as e:  # noqa: BLE001
                    if attempt == 2:
                        return {'id': it['id'], 'error': '%s: %s' % (type(e).__name__, str(e)[:120])}
                    time.sleep(1.5 * (attempt + 1))

        with ThreadPoolExecutor(max_workers=args.concurrency) as ex:
            futs = {ex.submit(work, it): it for it in todo}
            for i, fut in enumerate(as_completed(futs), 1):
                r = fut.result()
                with lock:
                    out.write(json.dumps(r, ensure_ascii=False) + '\n')
                    out.flush()
                    if 'error' in r:
                        n_fail += 1
                    else:
                        n_ok += 1
                if i % 20 == 0 or i == len(todo):
                    el = time.time() - t0
                    print('进度 %d/%d | ok %d fail %d | %.1fs | %.2f 题/秒'
                          % (i, len(todo), n_ok, n_fail, el, i / max(el, 0.1)))
    print('完成 ok %d fail %d' % (n_ok, n_fail))


if __name__ == '__main__':
    main()
