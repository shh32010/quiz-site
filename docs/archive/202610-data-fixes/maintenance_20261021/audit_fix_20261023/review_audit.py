# -*- coding: utf-8 -*-
"""2026-10-23 审查修复：用 buddy 逐题复核试卷冲突/选项缺失/答案格式。

用法：
  python review_audit.py --task paper
  python review_audit.py --task options
  python review_audit.py --task format
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
TYPE = {1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合'}


def opts(item):
    try:
        o = json.loads(item.get('optionJson') or '{}')
        return '\n'.join('%s. %s' % (k, str(o[k])[:300]) for k in list(o.keys())[:8])
    except Exception:
        return str(item.get('optionJson') or '')[:500]


SYS_PAPER = """你是江苏专转本计算机题库的审题专家。根据试卷分节、题干、选项、答案和解析，判断正确题型和正确答案。
题型：1=单选，2=多选，3=判断，4=填空，5=综合。
规则：判断题答案只能是 A（对）或 B（错）；单选一个字母；多选字母用英文逗号分隔；填空/综合保留原文。
只输出 JSON：{"type":1,"answer":"A","confidence":"high|medium|low","reason":"不超过30字"}"""

SYS_OPTIONS = """你是江苏专转本计算机题库的审题专家。这道单选题的选项键不完整，请判断是否还能正常作答。
status 取值：
- complete：现有选项已足够（例如题干本身只有两个选项，或缺少的键是误判）
- missing：确实缺选项，无法正常作答
- repairable：可从题干/解析补出缺失选项
- unsure：无法判断
suggested：status=repairable 时给出补全后的选项 JSON 字符串（键 A/B/C/D），否则空字符串。
只输出 JSON：{"status":"complete|missing|repairable|unsure","missing":["A"],"suggested":"","confidence":"high|medium|low","reason":"不超过30字"}"""

SYS_FORMAT = """你是江苏专转本计算机题库的审题专家。核对答案格式/空数。
- 多选题：答案应为一组大写字母，用英文逗号分隔，如 A,C；根据题干、选项、解析确认正确字母。
- 填空题：根据答案和解析判断正确答案应分成几段（空数）。
只输出 JSON：{"answer":"A,C","blank_count":0,"confidence":"high|medium|low","reason":"不超过30字"}"""


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


def prompt_paper(it):
    return '\n'.join([
        '试卷分节：%s' % (it.get('sectionName') or '（非试卷题，疑似题型/答案错误）'),
        '当前题型：%s' % TYPE.get(int(it.get('questionType') or 0), '?'),
        '分节期望题型：%s' % (TYPE.get(int(it.get('expectedType') or 0), '无')),
        '题干：%s' % (it.get('stem') or '')[:800],
        '选项：\n%s' % opts(it),
        '当前答案：%s' % (it.get('correct') or ''),
        '解析：%s' % (it.get('analysis') or '')[:400],
        '请给出正确题型和正确答案。',
    ])


def prompt_options(it):
    return '\n'.join([
        '题干：%s' % (it.get('stem') or '')[:800],
        '当前选项：\n%s' % opts(it),
        '当前答案：%s' % (it.get('correct') or ''),
        '解析：%s' % (it.get('analysis') or '')[:400],
        '请判断选项是否完整、能否补全。',
    ])


def prompt_format(it):
    kind = it.get('kind')
    lines = [
        '题型：多选题' if kind == 'multi_format' else '题型：填空题',
        '题干：%s' % (it.get('stem') or '')[:800],
        '选项：\n%s' % opts(it),
        '当前答案：%s' % (it.get('correct') or ''),
        '当前空数：%s' % (it.get('blankCount') if it.get('blankCount') is not None else '无'),
        '解析：%s' % (it.get('analysis') or '')[:400],
    ]
    if kind == 'multi_format':
        lines.append('请确认正确字母并输出逗号分隔格式，blank_count 填 0。')
    else:
        lines.append('请判断正确答案应分几段，answer 保持原文，blank_count 填正确空数。')
    return '\n'.join(lines)


TASKS = {
    'paper': ('paper_items.json', 'paper_results.jsonl', SYS_PAPER, prompt_paper),
    'options': ('option_items.json', 'option_results.jsonl', SYS_OPTIONS, prompt_options),
    'format': ('format_items.json', 'format_results.jsonl', SYS_FORMAT, prompt_format),
}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--task', choices=list(TASKS), required=True)
    ap.add_argument('--concurrency', type=int, default=12)
    args = ap.parse_args()

    items_file, out_name, system, prompt = TASKS[args.task]
    items = json.loads((BASE / items_file).read_text(encoding='utf-8'))
    out_file = BASE / out_name
    done = set()
    if out_file.exists():
        for line in out_file.read_text(encoding='utf-8').splitlines():
            try:
                r = json.loads(line)
                key = '%s:%s' % (r.get('source', ''), r['id'])
                if 'error' not in r:
                    done.add(key)
            except Exception:
                pass
    todo = [x for x in items if '%s:%s' % (x.get('source', ''), x['id']) not in done]
    print('待跑 %d | 已完成 %d | task %s' % (len(todo), len(done), args.task))

    lock = __import__('threading').Lock()
    t0 = time.time()
    ok = fail = 0
    with out_file.open('a', encoding='utf-8') as out:
        def work(it):
            for attempt in range(3):
                try:
                    obj = call_buddy(system, prompt(it))
                    return {'id': it['id'], 'source': it.get('source', ''),
                            'kind': it.get('kind'), **obj}
                except Exception as e:
                    if attempt == 2:
                        return {'id': it['id'], 'source': it.get('source', ''),
                                'kind': it.get('kind'), 'error': '%s: %s' % (type(e).__name__, str(e)[:120])}
                    time.sleep(1.5 * (attempt + 1))

        with ThreadPoolExecutor(max_workers=args.concurrency) as ex:
            futs = {ex.submit(work, it): it for it in todo}
            for i, fut in enumerate(as_completed(futs), 1):
                r = fut.result()
                with lock:
                    out.write(json.dumps(r, ensure_ascii=False) + '\n')
                    out.flush()
                    if 'error' in r:
                        fail += 1
                    else:
                        ok += 1
                if i % 20 == 0 or i == len(todo):
                    el = time.time() - t0
                    print('进度 %d/%d | ok %d fail %d | %.1fs | %.2f 条/秒'
                          % (i, len(todo), ok, fail, el, i / max(el, 0.1)))
    print('完成 ok %d fail %d' % (ok, fail))


if __name__ == '__main__':
    main()
