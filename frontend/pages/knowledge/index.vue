<script setup lang="ts">
// 知识点入口：课程/技能卡片 + 继续学习 + 搜索
import { ALL_COURSES } from '~/utils/constants'

useHead({ title: '知识点学习' })

interface KNode {
  id: number
  subjectId: number
  code: string | null
  name: string
  level: number
  kpCount: number
  children: KNode[]
}

const route = useRoute()
const router = useRouter()
const q = ref('')
const lastSection = ref<{ id: number; name: string; courseName: string } | null>(null)

// 兼容旧链接 /knowledge?kp=123（服务端 302，避免旧链接被当成入口页收录）
if (Number(route.query.kp)) {
  await navigateTo(`/knowledge/kp/${Number(route.query.kp)}`, { replace: true, redirectCode: 302 })
}

const { data: tree, error } = await useFetch<KNode[]>('/api/knowledge/tree')

onMounted(() => {
  try {
    const raw = localStorage.getItem('quiz_last_section')
    if (raw) lastSection.value = JSON.parse(raw)
  } catch { /* 忽略 */ }
})

function rootsFor(code: string): KNode[] {
  const all = tree.value ?? []
  if (code === 'A') return all.filter(n => n.subjectId === 4 && /^A\d/.test(n.code ?? ''))
  if (code === 'B') return all.filter(n => n.subjectId === 4 && /^B\d/.test(n.code ?? ''))
  return all.filter(n => n.subjectId === 5 && n.code === code)
}

const courseCards = computed(() => ALL_COURSES.map(course => {
  const roots = rootsFor(course.code)
  const isSkill = course.code.startsWith('S')
  return {
    ...course,
    total: roots.reduce((sum, node) => sum + node.kpCount, 0),
    units: isSkill ? (roots[0]?.children?.length ?? 0) : roots.length,
    unitLabel: isSkill ? '节' : '章',
    bank: isSkill ? '实操' : '理论',
  }
}))

const totalKp = computed(() => (tree.value ?? []).reduce((sum, node) => sum + node.kpCount, 0))

function search() {
  const text = q.value.trim()
  router.push({ path: '/knowledge/search', query: text ? { q: text } : {} })
}
</script>

<template>
  <section class="space-y-6">
    <div>
      <h1 class="text-2xl font-bold tracking-tight text-fg-primary">知识点学习</h1>
      <p class="mt-1 text-sm text-fg-secondary">
        按课程 → 章 → 节连续阅读；共 {{ totalKp.toLocaleString() }} 条知识点。选一节开始，读完后可直接练相关题。
      </p>
    </div>

    <form class="flex flex-wrap gap-2" @submit.prevent="search">
      <input v-model="q" type="search" placeholder="搜索知识点标题或内容"
             class="min-w-0 flex-1 rounded-lg border border-line-strong bg-surface-card px-3 py-2 text-base outline-none focus:border-brand sm:max-w-md sm:text-sm" />
      <button type="submit" class="min-h-11 rounded-lg bg-brand px-4 text-sm font-medium text-white hover:bg-brand-hover">
        搜索
      </button>
    </form>

    <NuxtLink v-if="lastSection" :to="`/knowledge/section/${lastSection.id}`"
              class="flex flex-wrap items-center justify-between gap-2 rounded-xl border border-brand/30 bg-brand-soft/60 px-4 py-3 hover:border-brand">
      <span class="text-sm text-fg-secondary">
        继续上次学习：<b class="text-fg-primary">{{ lastSection.name }}</b>
        <span class="ml-1 text-xs text-fg-muted">{{ lastSection.courseName }}</span>
      </span>
      <span class="text-xs font-medium text-brand">继续阅读 →</span>
    </NuxtLink>

    <p v-if="error" class="rounded-lg border border-danger-border bg-danger-bg px-3 py-2 text-sm text-danger-fg">
      知识点目录加载失败，请稍后重试。
    </p>

    <div class="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
      <NuxtLink v-for="course in courseCards" :key="course.code" :to="`/knowledge/course/${course.code}`"
                class="group rounded-xl border border-line-subtle bg-surface-card p-4 transition hover:border-brand hover:shadow-sm">
        <div class="flex items-center gap-2">
          <span class="shrink-0 rounded bg-surface-muted px-1.5 py-0.5 text-xs text-fg-secondary">{{ course.code }}</span>
          <span class="truncate text-sm font-semibold text-fg-primary group-hover:text-brand">{{ course.name }}</span>
        </div>
        <p class="mt-2 text-xs text-fg-muted">{{ course.bank }} · {{ course.units }} {{ course.unitLabel }}</p>
        <p class="mt-2 text-lg font-bold tabular-nums text-brand">{{ course.total.toLocaleString() }} <span class="text-xs font-normal text-fg-muted">条知识点</span></p>
        <p class="mt-1 text-xs text-fg-muted">进入目录 →</p>
      </NuxtLink>
    </div>

    <p class="text-xs leading-5 text-fg-muted">
      知识点内容来自题库整理，按节连续阅读；如发现内容缺失或错误，可在刷题页提交题目反馈。
    </p>
  </section>
</template>
