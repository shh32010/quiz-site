# -*- coding: utf-8 -*-
"""对低置信度的章直属题做全 69 节复核（允许跨章纠正）。

输入：
  direct_questions.json  章直属题
  sections.json          全部节
  direct_results.jsonl   第一轮结果
输出：
  direct_recheck.jsonl   复核结果（断点续跑）
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
FIRST = BASE / 'direct_results.jsonl'
RESULTS = BASE / 'direct_recheck.jsonl'
TYPL = {1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合'}

SECS = json.loads(SECTIONS.read_text(encoding='utf-8'))
SEC_BY_CODE = {s['code']: s for s in SECS}
SEC_TEXT = '\n'.join('%s｜%s %s｜%s' % (s['code'], s['parent_code'], s['parent_name'], s['name'])
                     for s in SECS)
CODES = set(SEC_BY_CODE)

SYSTEM = """你是江苏专转本（计算机专业大类）的命题与分类专家。
请为题目选择最合适的一个「节」。必须从给定清单中选择，不要输出 none。
如果题目当前所在章明显不合适，可以选择其他章的节；按主要考点选最接近的节。
只输出 JSON：{"section":"A1-1.1","confidence":"high|medium|low","reason":"不超过20字"}"""


def build_prompt(q):
    optext = ''
    if q.get('option_json'):
        try:
            o = json.loads(q['option_json'])
            optext = '\n'.join('%s. %s' % (k, o[k]) for k in list(o.keys())[:6])
        except Exception:  # noqa: BLE001
            optext = str(q['option_json'])[:300]
    parts = [
        '【当前章】%s %s' % (q['chapter_code'], q['chapter_name']),
        '【全部可选节】',
        SEC_TEXT,
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
    parts.append('请从全部节中选一个最合适的节代码，只输出 JSON。')
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


def valid(obj):
    code = str((obj or {}).get('section') or '').strip().upper()
    code = re.sub(r'\s+', '', code)
    if code in CODES:
        return code
    raise ValueError('section 非法: %r' % (obj or {}).get('section'))


def ask(channel, prompt):
    if channel == 'buddy':
        return call_buddy(SYSTEM, prompt, timeout=300)
    return call_opencode(prompt)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--channel', choices=['buddy', 'opencode'], default='buddy')
    ap.add_argument('--concurrency', type=int, default=8)
    ap.add_argument('--limit', type=int, default=0)
    args = ap.parse_args()

    qs = {q['id']: q for q in json.loads(QUESTIONS.read_text(encoding='utf-8'))}
    first = {}
    for line in FIRST.read_text(encoding='utf-8').splitlines():
        r = json.loads(line)
        first[r['id']] = r
    # 只复核低置信度、非金标的题
    todo = [qs[qid] for qid, r in first.items()
            if r.get('confidence') == 'low' and not qs[qid]['is_golden']]
    done = set()
    if RESULTS.exists():
        for line in RESULTS.read_text(encoding='utf-8').splitlines():
            try:
                done.add(json.loads(line)['id'])
            except Exception:  # noqa: BLE001
                pass
    todo = [q for q in todo if q['id'] not in done]
    if args.limit:
        todo = todo[:args.limit]
    print('复核待跑 %d | 已完成 %d | 通道 %s | 并发 %d' % (len(todo), len(done), args.channel, args.concurrency))

    lock = __import__('threading').Lock()
    t0 = time.time()
    n_ok = n_fail = 0
    with RESULTS.open('a', encoding='utf-8') as out:
        def work(q):
            for attempt in range(3):
                try:
                    obj = ask(args.channel, build_prompt(q))
                    code = valid(obj)
                    return {'id': q['id'], 'section': code, 'confidence': obj.get('confidence'),
                            'reason': obj.get('reason'), 'channel': args.channel,
                            'model': A.CB_MODEL if args.channel == 'buddy' else A.OC_MODEL}
                except Exception as e:  # noqa: BLE001
                    err = '%s: %s' % (type(e).__name__, str(e)[:160])
                    if attempt == 2:
                        return {'id': q['id'], 'section': first[q['id']]['section'],
                                'confidence': 'fallback', 'reason': '复核失败，保留首轮结果',
                                'channel': args.channel, 'error': err}
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
