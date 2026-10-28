<script setup lang="ts">
// 首页：入口导航 + 题库概况
import { ALL_COURSES as COURSE_META } from '~/utils/constants'

useHead({ title: '专转本计算机刷题' })

const { loggedIn } = useAuth()
const api = useApi()
const resume = ref<any>(null)
const totalProgress = ref<{ total: number; answered: number; pct: number } | null>(null)

onMounted(async () => {
  if (!api.hasToken()) return
  try {
    const [r, p] = await Promise.all([
      api.get<{ session: any }>('/api/practice/resume'),
      api.get<{ total: number; answered: number; pct: number }>('/api/report/progress'),
    ])
    resume.value = r.session
    totalProgress.value = p
  } catch { /* 未登录/网络失败时不显示进度 */ }
})

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

/** 课程/技能卡：首页只汇总课程级题数，完整章节树统一放在 /chapters */
const courseCards = computed(() => COURSE_META.map(m => {
  const roots = (tree.value ?? []).filter(root => {
    const code = root.code ?? ''
    if ((root.questionCount ?? 0) <= 0) return false
    if (m.code === 'A') return root.subjectId === 4 && /^A\d/.test(code)
    if (m.code === 'B') return root.subjectId === 4 && /^B\d/.test(code)
    return root.subjectId === 5 && code === m.code
  })
  const isSkill = m.code.startsWith('S')
  return {
    ...m,
    bank: isSkill ? '实操' : '理论',
    count: isSkill ? (roots[0]?.children?.length ?? 0) : roots.length,
    unit: isSkill ? '节' : '章',
    total: roots.reduce((s, n) => s + (n.questionCount ?? 0), 0),
  }
}))

const entries = [
  { to: '/chapters',  title: '按章节刷题', desc: '理论 A/B、实操技能一~六，逐章推进', tone: 'blue' },
  { to: '/knowledge', title: '知识点阅读', desc: '按课程连续阅读，支持目录、搜索和自测', tone: 'cyan' },
  { to: '/papers',    title: '历年真题',   desc: '27 套真题，按卷面分节练习',      tone: 'indigo' },
  { to: '/compose',   title: '随机组卷',   desc: '按大纲配比与难度生成一套卷',    tone: 'violet' },
  { to: '/wrong',     title: '错题本',     desc: '自动收录，按间隔复习',          tone: 'amber' },
  { to: '/report',    title: '学习报告',   desc: '正确率、章节掌握度、错题周报',  tone: 'emerald' },
]
</script>

<template>
  <section class="space-y-8">
    <ResumeCard v-if="resume" :session="resume" />

    <div class="rounded-2xl border border-line-subtle border-l-4 border-l-brand bg-surface-card p-5 sm:p-6">
      <div class="flex flex-wrap items-start justify-between gap-4">
        <div>
          <h1 class="text-2xl font-bold tracking-tight text-fg-primary">专转本计算机刷题</h1>
          <p class="mt-1.5 text-sm text-fg-secondary">章节练习 · 真题模考 · 错题复习 · AI 答疑</p>
        </div>
        <div class="flex flex-wrap gap-2">
          <NuxtLink to="/chapters"
                    class="inline-flex min-h-11 items-center rounded-lg bg-brand px-4 text-sm font-medium text-white hover:bg-brand-hover">
            开始刷题
          </NuxtLink>
          <NuxtLink v-if="!loggedIn" to="/login"
                    class="inline-flex min-h-11 items-center rounded-lg border border-line-strong px-4 text-sm text-fg-primary hover:border-brand">
            登录 / 注册
          </NuxtLink>
          <NuxtLink v-else to="/report"
                    class="inline-flex min-h-11 items-center rounded-lg border border-line-strong px-4 text-sm text-fg-primary hover:border-brand">
            我的学习报告
          </NuxtLink>
        </div>
      </div>
      <div class="mt-5 grid grid-cols-3 gap-2 border-t border-line-subtle pt-4">
        <div>
          <p class="text-xl font-bold tabular-nums text-brand">{{ totalQuestions.toLocaleString() }}</p>
          <p class="mt-0.5 text-xs text-fg-muted">道可练习题</p>
        </div>
        <div>
          <p class="text-xl font-bold tabular-nums text-brand">{{ paperCount }}</p>
          <p class="mt-0.5 text-xs text-fg-muted">套历年真题</p>
        </div>
        <div>
          <p class="text-xl font-bold tabular-nums text-brand">8</p>
          <p class="mt-0.5 text-xs text-fg-muted">个课程 / 技能</p>
        </div>
      </div>

      <div v-if="totalProgress" class="mt-4 border-t border-line-subtle pt-4">
        <div class="flex items-center justify-between gap-2 text-xs">
          <span class="font-medium text-fg-secondary">总进度</span>
          <span class="tabular-nums text-fg-muted">
            {{ totalProgress.answered.toLocaleString() }} / {{ totalProgress.total.toLocaleString() }} 题
            · {{ totalProgress.pct }}%
          </span>
        </div>
        <div class="mt-2 h-2 overflow-hidden rounded-full bg-surface-muted"
             role="progressbar" :aria-valuenow="totalProgress.pct" aria-valuemin="0" aria-valuemax="100">
          <div class="h-full rounded-full bg-brand transition-all"
               :style="{ width: totalProgress.answered > 0 ? `max(3px, ${totalProgress.pct}%)` : '0%' }" />
        </div>
        <p class="mt-1 text-xs text-fg-muted">按全站已做过的不同题统计，章节、真题、组卷都会计入</p>
      </div>
    </div>

    <div class="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
      <NuxtLink v-for="e in entries" :key="e.to" :to="e.to"
                class="group rounded-xl border border-line-subtle bg-surface-card p-4 transition hover:border-brand hover:shadow-sm">
        <p class="text-base font-semibold text-fg-primary group-hover:text-brand">{{ e.title }}</p>
        <p class="mt-1 text-sm text-fg-secondary">{{ e.desc }}</p>
      </NuxtLink>
    </div>

    <div class="rounded-xl border border-line-subtle bg-surface-card">
      <div class="flex items-center justify-between px-5 py-3">
        <div>
          <h2 class="text-sm font-semibold text-fg-primary">课程 / 技能</h2>
          <p class="mt-0.5 text-xs text-fg-muted">8 个课程/技能，点击进入完整章节树</p>
        </div>
        <NuxtLink to="/chapters" class="inline-flex min-h-11 items-center text-xs text-brand hover:underline">
          查看全部章节
        </NuxtLink>
      </div>
      <div class="grid gap-3 border-t border-line-subtle p-4 sm:grid-cols-2 lg:grid-cols-4">
        <NuxtLink v-for="c in courseCards" :key="c.code" :to="`/chapters?course=${c.code}#course-${c.code}`"
                  class="group rounded-lg border border-line-subtle p-3 transition hover:border-brand hover:shadow-sm">
          <div class="flex items-center gap-2">
            <span class="shrink-0 rounded bg-surface-muted px-1.5 py-0.5 text-xs text-fg-secondary">{{ c.code }}</span>
            <span class="truncate text-sm font-medium text-fg-primary group-hover:text-brand">{{ c.name }}</span>
          </div>
          <p class="mt-2 text-xs text-fg-muted">{{ c.bank }} · {{ c.count }} {{ c.unit }}</p>
          <p class="mt-1 text-sm font-semibold tabular-nums text-brand">{{ c.total.toLocaleString() }} 题 ›</p>
        </NuxtLink>
      </div>
    </div>

  </section>
</template>
