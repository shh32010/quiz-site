# -*- coding: utf-8 -*-
"""把挂在「章」上的题归入该章下的某个「节」。

输入：
  direct_questions.json  章直属题（6,939，含 chapter_code）
  sections.json          全部节（69）
输出：
  direct_results.jsonl   逐题结果（断点续跑）
用法：
  python classify_direct.py --limit 10 --concurrency 5 --channel buddy
  python classify_direct.py --channel buddy --concurrency 8
"""
import argparse
import json
import re
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
sys.path.insert(0, str(BASE.parent))
import audit_questions as A  # noqa: E402
from recheck_common import call_buddy  # noqa: E402

QUESTIONS = BASE / 'direct_questions.json'
SECTIONS = BASE / 'sections.json'
RESULTS = BASE / 'direct_results.jsonl'
TYPL = {1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合'}

SECS = json.loads(SECTIONS.read_text(encoding='utf-8'))
BY_PARENT = {}
for s in SECS:
    BY_PARENT.setdefault(s['parent_code'], []).append(s)
SEC_BY_CODE = {s['code']: s for s in SECS}

SYSTEM = """你是江苏专转本（计算机专业大类）的命题与分类专家。
请为题目选择最合适的一个「节」。必须从给定清单中选择，不要输出 none。
允许宽松：按主要考点选最接近的节即可。
只输出 JSON：{"section":"A1-1.1","confidence":"high|medium|low","reason":"不超过20字"}"""


def build_prompt(q):
    opts = BY_PARENT.get(q['chapter_code'], [])
    sec_text = '\n'.join('%s｜%s' % (s['code'], s['name']) for s in opts)
    optext = ''
    if q.get('option_json'):
        try:
            o = json.loads(q['option_json'])
            optext = '\n'.join('%s. %s' % (k, o[k]) for k in list(o.keys())[:6])
        except Exception:  # noqa: BLE001
            optext = str(q['option_json'])[:300]
    parts = [
        '【所属章】%s %s' % (q['chapter_code'], q['chapter_name']),
        '【可选节】',
        sec_text,
        '',
        '【题目】题型：%s' % TYPL.get(q['question_type'], '?'),
        '题干：%s' % (q.get('stem') or '')[:1200],
    ]
    if optext:
        parts.append('选项：\n%s' % optext[:600])
    if q.get('correct'):
        parts.append('正确答案：%s' % str(q['correct'])[:300])
    if q.get('analysis'):
        parts.append('解析：%s' % str(q['analysis'])[:300])
    parts.append('')
    parts.append('请从上面的节清单中选一个最合适的节代码，只输出 JSON。')
    return '\n'.join(parts)


def parse_json(text):
    t = text.strip()
    if t.startswith('```'):
        t = re.sub(r'^```[a-zA-Z]*\s*|\s*```$', '', t)
    m = re.search(r'\{.*\}', t, re.S)
    return json.loads(m.group(0) if m else t)


def call_opencode(prompt, timeout=300):
    full = SYSTEM + '\n\n' + prompt
    r = subprocess.run([A.OC_EXE, 'run', '-m', A.OC_MODEL],
                       input=full.encode('utf-8'), capture_output=True, timeout=timeout)
    if r.returncode != 0:
        raise RuntimeError('opencode exit %s: %s' % (
            r.returncode,
            re.sub(r'\x1b\[[0-9;]*m', '', (r.stderr or b'').decode('utf-8', 'replace'))[:160]))
    return parse_json(re.sub(r'\x1b\[[0-9;]*m', '', (r.stdout or b'').decode('utf-8', 'replace')))


def valid(obj, q):
    code = str((obj or {}).get('section') or '').strip().upper()
    allowed = {s['code'] for s in BY_PARENT.get(q['chapter_code'], [])}
    if code in allowed:
        return code
    code = re.sub(r'\s+', '', code)
    if code in allowed:
        return code
    raise ValueError('section 非法: %r' % (obj or {}).get('section'))


def ask(channel, prompt):
    if channel == 'buddy':
        return call_buddy(SYSTEM, prompt, timeout=300)
    return call_opencode(prompt)


def fallback(q):
    cand = BY_PARENT.get(q['chapter_code'], [])
    if not cand:
        raise ValueError('章下无节: %s' % q['chapter_code'])
    stem = (q.get('stem') or '') + (q.get('analysis') or '')
    best, best_n = cand[0], -1
    for s in cand:
        n = len(set(stem) & set(s['name']))
        if n > best_n:
            best, best_n = s, n
    return best['code']


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--channel', choices=['buddy', 'opencode'], default='buddy')
    ap.add_argument('--concurrency', type=int, default=8)
    ap.add_argument('--limit', type=int, default=0)
    args = ap.parse_args()

    qs = json.loads(QUESTIONS.read_text(encoding='utf-8'))
    done = set()
    if RESULTS.exists():
        for line in RESULTS.read_text(encoding='utf-8').splitlines():
            try:
                done.add(json.loads(line)['id'])
            except Exception:  # noqa: BLE001
                pass
    todo = [q for q in qs if q['id'] not in done]
    if args.limit:
        todo = todo[:args.limit]
    print('待跑 %d | 已完成 %d | 通道 %s | 并发 %d' % (len(todo), len(done), args.channel, args.concurrency))

    lock = __import__('threading').Lock()
    t0 = time.time()
    n_ok = n_fail = 0
    with RESULTS.open('a', encoding='utf-8') as out:
        def work(q):
            for attempt in range(3):
                try:
                    obj = ask(args.channel, build_prompt(q))
                    code = valid(obj, q)
                    return {'id': q['id'], 'section': code, 'confidence': obj.get('confidence'),
                            'reason': obj.get('reason'), 'channel': args.channel,
                            'model': A.CB_MODEL if args.channel == 'buddy' else A.OC_MODEL}
                except Exception as e:  # noqa: BLE001
                    err = '%s: %s' % (type(e).__name__, str(e)[:160])
                    if attempt == 2:
                        return {'id': q['id'], 'section': fallback(q), 'confidence': 'fallback',
                                'reason': '模型失败，规则兜底', 'channel': args.channel, 'error': err}
                    time.sleep(1.5 * (attempt + 1))

        with ThreadPoolExecutor(max_workers=args.concurrency) as ex:
            futs = {ex.submit(work, q): q for q in todo}
            for i, fut in enumerate(as_completed(futs), 1):
                r = fut.result()
                with lock:
                    out.write(json.dumps(r, ensure_ascii=False) + '\n')
                    out.flush()
                    if r.get('confidence') == 'fallback':
                        n_fail += 1
                    else:
                        n_ok += 1
                if i % 50 == 0 or i == len(todo):
                    el = time.time() - t0
                    print('进度 %d/%d | ok %d fallback %d | %.1fs | %.2f 题/秒'
                          % (i, len(todo), n_ok, n_fail, el, i / max(el, 0.1)))
    print('完成：ok %d | fallback %d | 用时 %.1fs' % (n_ok, n_fail, time.time() - t0))


if __name__ == '__main__':
    main()
