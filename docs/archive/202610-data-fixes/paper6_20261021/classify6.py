# -*- coding: utf-8 -*-
"""把 6 道无章节的卷题归入对应节（buddy 逐题，全 69 节）。"""
import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8', errors='replace')
BASE = Path(__file__).resolve().parent
SECTIONS = json.loads((BASE / 'sections.json').read_text(encoding='utf-8'))
QUESTIONS = json.loads((BASE / 'questions.json').read_text(encoding='utf-8'))
SEC_TEXT = '\n'.join('%s｜%s %s｜%s' % (s['code'], s['parent_code'], s['parent_name'], s['name'])
                     for s in SECTIONS)
CODES = {s['code'] for s in SECTIONS}
NODE = shutil.which('node')
CB_BIN = r'D:\Program Files\nodejs\node_global\node_modules\@tencent-ai\codebuddy-code\bin\codebuddy'
MODEL = 'deepseek-v4.1-flash'
TYPL = {1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合'}

SYSTEM = """你是江苏专转本（计算机专业大类）的命题与分类专家。
请为题目选择最合适的一个「节」。必须从给定清单中选择，不要输出 none。
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
        '【可选小节】（格式：节代码｜章｜节名）',
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
    parts.append('请从清单中选一个最合适的节代码，只输出 JSON。')
    return '\n'.join(parts)


def call(prompt):
    full = SYSTEM + '\n\n' + prompt
    env = {k: v for k, v in os.environ.items()
           if k.lower() not in ('https_proxy', 'http_proxy', 'all_proxy')}
    r = subprocess.run([NODE, CB_BIN, '-p', '--model', MODEL, '--tools', '',
                        '--no-session-persistence'],
                       input=full.encode('utf-8'), capture_output=True, timeout=300, env=env)
    if r.returncode != 0:
        raise RuntimeError('buddy exit %s' % r.returncode)
    out = (r.stdout or b'').decode('utf-8', 'replace').strip()
    if out.startswith('```'):
        out = re.sub(r'^```[a-zA-Z]*\s*|\s*```$', '', out)
    m = re.search(r'\{.*\}', out, re.S)
    return json.loads(m.group(0) if m else out)


def main():
    out = []
    for q in QUESTIONS:
        obj = call(build_prompt(q))
        code = str(obj.get('section') or '').strip().upper()
        if code not in CODES:
            raise SystemExit('非法节代码 %r（题 %s）' % (code, q['id']))
        out.append({'id': q['id'], 'section': code,
                    'confidence': obj.get('confidence'), 'reason': obj.get('reason')})
        print(q['id'], '->', code, obj.get('confidence'), obj.get('reason'))
    (BASE / 'results.json').write_text(json.dumps(out, ensure_ascii=False, indent=2),
                                       encoding='utf-8')


if __name__ == '__main__':
    main()
