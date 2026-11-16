#!/usr/bin/env python3
"""从 22 版《理论复习.pdf》《24操作技能.pdf》提取「文字 + 颜色」基准数据。

22 版 PDF 是数字版：每段文字在 PyMuPDF 的 span 里带 RGB 颜色值，
因此不需要 OCR，也不需要看图判色，可以直接拿到逐段的红/绿/黄/黑。

用法：
    python scripts/extract22.py                        # 默认导理论篇
    python scripts/extract22.py --pdf <pdf路径> --out <输出>
    python scripts/extract22.py --pages 17-19          # 只导指定页（1 起）

输出 JSONL，每行一页：
    {"page": 17, "width": 1323, "height": 1872, "lines": [
        {"text": "键盘（字符与命令输入设备）", "runs": [["R", "键盘（字符与命令输入设备）"]]}, ...]}
"""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

import pymupdf

DEFAULT_PDF = "private/reference/Mineru-知识点笔记/理论复习.pdf"
DEFAULT_OUT = "private/agy-context/ocr22_theory_pages.jsonl"

# 颜色归类：R/G/Y/B/K
def classify(rgb: int) -> str:
    """把 span 的 sRGB 整数转成颜色码。"""
    r = (rgb >> 16) & 0xFF
    g = (rgb >> 8) & 0xFF
    b = rgb & 0xFF
    if r > 150 and g < 110 and b < 110:
        return "R"
    if g > 110 and r < 110 and b < 110:
        return "G"
    if r > 170 and g > 130 and b < 110:
        return "Y"
    if b > 120 and r < 120 and g < 160:
        return "B"
    return "K"  # 黑/灰/其它视为普通


def parse_pages(spec: str | None, total: int) -> list[int]:
    if not spec:
        return list(range(total))
    pages: list[int] = []
    for part in spec.split(","):
        part = part.strip()
        if "-" in part:
            a, b = part.split("-", 1)
            pages.extend(range(int(a) - 1, int(b)))
        elif part:
            pages.append(int(part) - 1)
    return [p for p in pages if 0 <= p < total]


def extract_page(page) -> dict:
    data = page.get_text("dict")
    lines = []
    for block in data.get("blocks", []):
        for line in block.get("lines", []):
            runs: list[list[str]] = []
            text_parts: list[str] = []
            for span in line.get("spans", []):
                text = span.get("text", "")
                if not text:
                    continue
                color = classify(int(span.get("color", 0)))
                text_parts.append(text)
                # 合并相邻同色 span
                if runs and runs[-1][0] == color:
                    runs[-1][1] += text
                else:
                    runs.append([color, text])
            text = "".join(text_parts).strip()
            if not text:
                continue
            # 去掉首尾空白后的 run 也要对齐，简单处理：整体 strip 时同步裁剪首尾 run
            if text != "".join(text_parts):
                lead = len("".join(text_parts)) - len("".join(text_parts).lstrip())
                trail = len("".join(text_parts)) - len("".join(text_parts).rstrip())
                trimmed = []
                pos = 0
                for color, seg in runs:
                    start, end = pos, pos + len(seg)
                    pos = end
                    lo = max(start, lead)
                    hi = min(end, len("".join(text_parts)) - trail)
                    if hi > lo:
                        trimmed.append([color, "".join(text_parts)[lo:hi]])
                runs = trimmed
            lines.append({"text": text, "runs": runs})
    return {
        "page": page.number + 1,
        "width": int(page.rect.width),
        "height": int(page.rect.height),
        "lines": lines,
    }


def main() -> None:
    sys.stdout.reconfigure(encoding='utf-8')
    ap = argparse.ArgumentParser(description="提取 22 版 PDF 的文字与颜色")
    ap.add_argument("--pdf", default=DEFAULT_PDF)
    ap.add_argument("--out", default=DEFAULT_OUT)
    ap.add_argument("--pages", default=None, help="如 17-19 或 17,18,20")
    args = ap.parse_args()

    pdf = Path(args.pdf)
    if not pdf.exists():
        raise SystemExit(f"PDF 不存在：{pdf}")

    doc = pymupdf.open(str(pdf))
    pages = parse_pages(args.pages, doc.page_count)

    out = Path(args.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    stats = {"R": 0, "G": 0, "Y": 0, "B": 0, "K": 0}
    with out.open("w", encoding="utf-8") as fh:
        for idx in pages:
            page = doc[idx]
            rec = extract_page(page)
            for line in rec["lines"]:
                for color, _ in line["runs"]:
                    stats[color] = stats.get(color, 0) + 1
            fh.write(json.dumps(rec, ensure_ascii=False) + "\n")

    doc.close()
    print(f"已导出 {len(pages)} 页 -> {out}")
    print("颜色段统计：", stats)


if __name__ == "__main__":
    main()
