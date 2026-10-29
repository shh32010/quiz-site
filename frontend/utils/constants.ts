/** 课程/技能、题型、会话模式的共享定义，避免各页面重复维护。 */

export interface CourseMeta {
  code: string
  name: string
  /** 实操技能的展示前缀，如「技能一」 */
  label?: string
}

export const THEORY_COURSES: CourseMeta[] = [
  { code: 'A', name: '计算机应用基础' },
  { code: 'B', name: '信息技术导论' },
]

export const SKILLS: CourseMeta[] = [
  { code: 'S1', name: 'C 语言程序设计', label: '技能一' },
  { code: 'S2', name: '数据库（MySQL）', label: '技能二' },
  { code: 'S3', name: 'UML 建模', label: '技能三' },
  { code: 'S4', name: '局域网组建', label: '技能四' },
  { code: 'S5', name: '操作系统配置与管理（Windows 10）', label: '技能五' },
  { code: 'S6', name: 'Linux 配置与管理（CentOS7）', label: '技能六' },
]

/** 理论 A/B + 实操 S1~S6，共 8 个课程/技能 */
export const ALL_COURSES: CourseMeta[] = [...THEORY_COURSES, ...SKILLS]

export const TYPE_LABEL: Record<number, string> = {
  1: '单选',
  2: '多选',
  3: '判断',
  4: '填空',
  5: '综合',
}

export const TYPE_TABS = [
  { value: 0, label: '全部' },
  { value: 1, label: '单选' },
  { value: 2, label: '多选' },
  { value: 3, label: '判断' },
  { value: 4, label: '填空' },
  { value: 5, label: '综合' },
]

export const MODE_LABEL: Record<string, string> = {
  chapter: '章节练习',
  chapter_random: '章节随机卷',
  paper: '真题练习',
  kp: '知识点练习',
  single: '单题练习',
  course: '课程练习',
  wrong: '错题复习',
  random: '随机组卷',
  exam: '模拟考试',
  random_exam: '随机模考',
}

/** 历史/报告的短时间格式：月-日 时:分 */
export function fmtTime(v: string): string {
  if (!v) return ''
  return new Date(v).toLocaleString('zh-CN', {
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
  })
}

/** 用时格式：X 分 Y 秒 / Y 秒 */
export function fmtDur(sec: number): string {
  if (!sec || sec <= 0) return '—'
  const m = Math.floor(sec / 60)
  const s = sec % 60
  return m > 0 ? `${m} 分 ${s} 秒` : `${s} 秒`
}
