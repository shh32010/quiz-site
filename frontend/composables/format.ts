/**
 * 题库历史数据中的 HTML 片段转可读文本（仅展示用，不改库）。
 * 历史数据里出现过的标签/实体：<br/>、&quot;、&#x27;、&lt;、&gt;、&amp;
 */
export function formatText(text?: string | null): string {
  if (!text) return ''
  return text
    .replace(/<br\s*\/?>/gi, '\n')
    .replace(/&quot;/g, '"')
    .replace(/&#x27;/g, "'")
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&amp;/g, '&')
}
