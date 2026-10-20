<script setup lang="ts">
// 首页：入口导航 + 题库概况
useHead({ title: '专转本计算机刷题' })

const api = useApi()
const loggedIn = ref(false)

interface Node {
  id: number
  subjectId: number
  code: string | null
  name: string
  level: number
  questionCount: number
  children: Node[]
}

// 一次取回全部章节树（subject=4 理论、subject=5 实操）
const { data: tree } = await useFetch<Node[]>('/api/chapters/tree')
const { data: papers } = await useFetch<any[]>('/api/papers')

const totalQuestions = computed(() =>
  (tree.value ?? []).reduce((s, n) => s + (n.questionCount ?? 0), 0))
const paperCount = computed(() => (papers.value?.length ?? 0))

onMounted(() => { loggedIn.value = api.hasToken() })

/** 课程/技能定义与展示顺序 */
const COURSE_META = [
  { code: 'A',  name: '计算机应用基础' },
  { code: 'B',  name: '信息技术导论' },
  { code: 'S1', name: 'C 语言程序设计' },
  { code: 'S2', name: '数据库（MySQL）' },
  { code: 'S3', name: 'UML 建模' },
  { code: 'S4', name: '局域网组建' },
  { code: 'S5', name: 'Windows 10 管理' },
  { code: 'S6', name: 'CentOS 7 管理' },
]

interface Section { id: number; code: string | null; name: string; count: number }
interface ChapterGroup {
  id: number; code: string | null; name: string
  count: number; sections: Section[]; rest: number
}

/** 章节 code → 课程 code：A1→A，B3→B，S1→S1；X9/XA 等不算课程 */
function courseOf(code: string | null): string | null {
  if (!code) return null
  if (/^A\d/.test(code)) return 'A'
  if (/^B\d/.test(code)) return 'B'
  if (/^S[1-6]$/.test(code)) return code
  return null
}

/** 8 个课程/技能 → 章 → 节（含每节题量、章内未细分题量） */
const groups = computed(() => {
  const byCourse = new Map<string, ChapterGroup[]>()
  for (const root of tree.value ?? []) {
    if (!root.children?.length) continue
    const course = courseOf(root.code)
    if (!course) continue
    // 理论树只要 A/B 章；实操树只要 S1~S6 技能（A/B 零散根节点不展示）
    if (root.subjectId === 4 && course !== 'A' && course !== 'B') continue
    if (root.subjectId === 5 && !course.startsWith('S')) continue

    const sections = root.children.map(s => ({
      id: s.id, code: s.code, name: s.name, count: s.questionCount,
    }))
    const secSum = sections.reduce((a, s) => a + s.count, 0)
    const list = byCourse.get(course) ?? []
    list.push({
      id: root.id, code: root.code, name: root.name,
      count: root.questionCount, sections,
      rest: Math.max(0, root.questionCount - secSum),
    })
    byCourse.set(course, list)
  }
  return COURSE_META.map(m => {
    const chapters = (byCourse.get(m.code) ?? [])
      .sort((a, b) => (a.code ?? '').localeCompare(b.code ?? '', 'en', { numeric: true }))
    return { ...m, chapters, total: chapters.reduce((a, c) => a + c.count, 0) }
  })
})

/** 展开状态；默认展开第一门课 */
const open = ref<Record<string, boolean>>({ A: true })
function toggle(code: string) { open.value[code] = !open.value[code] }
const allOpen = computed(() => groups.value.every(g => open.value[g.code]))
function toggleAll() {
  const next = !allOpen.value
  for (const g of groups.value) open.value[g.code] = next
}

/** 从 code 取序号：A1-1.1 → 1.1；S1-3 → 3 */
function num(code: string | null): string {
  if (!code) return ''
  const i = code.indexOf('-')
  return i >= 0 ? code.slice(i + 1) : ''
}

const entries = [
  { to: '/chapters', title: '按章节刷题', desc: '理论 A/B、实操技能一~六，逐章推进', tone: 'blue' },
  { to: '/papers',   title: '历年真题',   desc: '27 套真题，按卷面分节练习',      tone: 'indigo' },
  { to: '/compose',  title: '随机组卷',   desc: '按大纲配比与难度生成一套卷',    tone: 'violet' },
  { to: '/search',   title: '题库搜索',   desc: '按题干关键词快速定位',          tone: 'slate' },
  { to: '/wrong',    title: '错题本',     desc: '自动收录，按间隔复习',          tone: 'amber' },
  { to: '/report',   title: '学习报告',   desc: '正确率、章节掌握度、错题周报',  tone: 'emerald' },
]
</script>

<template>
  <section class="space-y-8">
    <div class="rounded-2xl bg-gradient-to-r from-blue-600 to-indigo-600 px-6 py-10 text-white">
      <h1 class="text-3xl font-bold">专转本计算机刷题</h1>
      <p class="mt-2 text-blue-50">章节练习 · 真题模考 · 错题复习 · AI 答疑</p>
      <div class="mt-6 flex flex-wrap gap-6 text-sm">
        <div>
          <span class="text-2xl font-bold">{{ totalQuestions.toLocaleString() }}</span>
          <span class="ml-1 text-blue-100">道可练习题</span>
        </div>
        <div>
          <span class="text-2xl font-bold">{{ paperCount }}</span>
          <span class="ml-1 text-blue-100">套历年真题</span>
        </div>
        <div>
          <span class="text-2xl font-bold">8</span>
          <span class="ml-1 text-blue-100">个课程 / 技能</span>
        </div>
      </div>
      <div class="mt-6 flex gap-3">
        <NuxtLink to="/chapters"
                  class="rounded-lg bg-white px-5 py-2 text-sm font-medium text-blue-700">
          开始刷题
        </NuxtLink>
        <NuxtLink v-if="!loggedIn" to="/login"
                  class="rounded-lg border border-white/60 px-5 py-2 text-sm text-white">
          登录 / 注册
        </NuxtLink>
        <NuxtLink v-else to="/report"
                  class="rounded-lg border border-white/60 px-5 py-2 text-sm text-white">
          我的学习报告
        </NuxtLink>
      </div>
    </div>

    <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
      <NuxtLink v-for="e in entries" :key="e.to" :to="e.to"
                class="group rounded-xl border border-slate-200 p-5 transition hover:border-blue-400 hover:shadow-sm">
        <p class="text-base font-semibold text-slate-800 group-hover:text-blue-600">{{ e.title }}</p>
        <p class="mt-1 text-sm text-slate-500">{{ e.desc }}</p>
      </NuxtLink>
    </div>

    <div class="rounded-xl border border-slate-200">
      <div class="flex items-center justify-between px-5 py-3">
        <div>
          <h2 class="text-sm font-semibold text-slate-700">课程 / 技能</h2>
          <p class="mt-0.5 text-xs text-slate-400">展开到每一节；点节名直接开始练习</p>
        </div>
        <button class="text-xs text-blue-600 hover:underline" @click="toggleAll">
          {{ allOpen ? '收起全部' : '展开全部' }}
        </button>
      </div>
      <ul class="divide-y divide-slate-100 border-t border-slate-100">
        <li v-for="g in groups" :key="g.code">
          <button class="flex w-full items-center justify-between px-5 py-3 text-left hover:bg-slate-50"
                  @click="toggle(g.code)">
            <span class="flex items-center gap-2">
              <span class="w-4 text-slate-400">{{ g.chapters.length ? (open[g.code] ? '−' : '+') : '' }}</span>
              <span class="rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-500">{{ g.code }}</span>
              <span class="text-sm font-medium text-slate-800">{{ g.name }}</span>
            </span>
            <span class="text-xs text-slate-400">{{ g.total.toLocaleString() }} 题</span>
          </button>

          <div v-if="open[g.code] && g.chapters.length" class="bg-slate-50/60 pb-2">
            <div v-for="ch in g.chapters" :key="ch.id">
              <p v-if="g.chapters.length > 1"
                 class="flex items-center gap-2 pl-12 pr-5 pt-2 text-xs text-slate-500">
                <span class="rounded bg-white px-1.5 py-0.5 font-mono text-[11px] text-slate-400">{{ ch.code }}</span>
                <span class="font-medium">{{ ch.name }}</span>
                <span class="text-slate-400">{{ ch.count.toLocaleString() }} 题</span>
              </p>
              <ul>
                <li v-for="sec in ch.sections" :key="sec.id">
                  <NuxtLink :to="`/practice?mode=chapter&target=${sec.id}`"
                            class="flex items-center justify-between py-1.5 pr-5 hover:bg-white"
                            :class="g.chapters.length > 1 ? 'pl-20' : 'pl-12'">
                    <span class="flex min-w-0 items-center gap-2">
                      <span class="w-12 shrink-0 font-mono text-xs text-slate-400">{{ num(sec.code) }}</span>
                      <span class="truncate text-xs text-slate-600">{{ sec.name }}</span>
                    </span>
                    <span class="shrink-0 text-xs text-slate-400">{{ sec.count.toLocaleString() }} 题 ›</span>
                  </NuxtLink>
                </li>
                <li v-if="ch.rest > 0">
                  <NuxtLink :to="`/chapters/${ch.id}`"
                            class="flex items-center justify-between py-1.5 text-xs text-slate-400 hover:bg-white"
                            :class="g.chapters.length > 1 ? 'pl-20' : 'pl-12'">
                    <span>其他（未细分到节）</span>
                    <span class="pr-5">{{ ch.rest.toLocaleString() }} 题 ›</span>
                  </NuxtLink>
                </li>
              </ul>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </section>
</template>
