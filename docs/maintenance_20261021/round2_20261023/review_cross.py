# -*- coding: utf-8 -*-
"""跨学科题目-知识点关联复核（只出报告，不自动删）。"""
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
SYS = """你是江苏专转本计算机题库的审题专家。题目和知识点来自不同学科（理论/实操），这可能是误挂。
判断这道题是否真的适合作为该知识点的关联练习。只输出 JSON：
{"keep":true|false,"confidence":"high|medium|low","reason":"不超过30字"}"""


def call_buddy(user, timeout=300):
    full = SYS + '\n\n' + user
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
    items = json.loads((BASE / 'cross_subject.json').read_text(encoding='utf-8'))
    out_file = BASE / 'cross_subject_results.jsonl'
    done = set()
    if out_file.exists():
        for line in out_file.read_text(encoding='utf-8').splitlines():
            try:
                r = json.loads(line)
                if not r.get('error'):
                    done.add((int(r['questionId']), int(r['kpId'])))
            except Exception:
                pass
    todo = [x for x in items if (int(x['questionId']), int(x['kpId'])) not in done]
    print('待跑 %d | 已完成 %d' % (len(todo), len(done)))

    def prompt(it):
        return '\n'.join([
            '题目学科：%s，知识点学科：%s' % (it.get('qSubject'), it.get('kpSubject')),
            '题干：%s' % (it.get('stem') or '')[:700],
            '知识点：%s' % (it.get('kpTitle') or ''),
            '当前关联置信度：%s' % (it.get('confidence') or ''),
            '请判断是否保留这条关联。',
        ])

    lock = __import__('threading').Lock()
    t0 = time.time()
    ok = fail = 0
    with out_file.open('a', encoding='utf-8') as out:
        def work(it):
            for attempt in range(3):
                try:
                    obj = call_buddy(prompt(it))
                    return {'questionId': it['questionId'], 'kpId': it['kpId'],
                            **obj}
                except Exception as e:
                    if attempt == 2:
                        return {'questionId': it['questionId'], 'kpId': it['kpId'],
                                'error': '%s: %s' % (type(e).__name__, str(e)[:120])}
                    time.sleep(1.5 * (attempt + 1))
        with ThreadPoolExecutor(max_workers=12) as ex:
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
