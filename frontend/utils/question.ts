/** 解析题目选项；判断题没有 optionJson 时与练习页一致，用 A/B 表示正确/错误 */
export function parseQuestionOptions(questionType: number, raw: unknown): [string, string][] {
  try {
    if (raw) {
      const obj = typeof raw === 'string' ? JSON.parse(raw) : raw
      if (obj && typeof obj === 'object') {
        const entries = Object.entries(obj as Record<string, unknown>)
          .filter(([, value]) => value !== null && value !== undefined)
          .map(([key, value]) => [key, String(value)] as [string, string])
        if (entries.length) return entries.sort(([a], [b]) => a.localeCompare(b))
      }
    }
  } catch {
    // 选项 JSON 异常时走判断题/兜底选项
  }
  if (questionType === 3 || questionType === 1) return [['A', '正确'], ['B', '错误']]
  return []
}
