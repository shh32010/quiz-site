<script setup lang="ts">
// 章节树：理论按课程 A/B 分组，实操按技能一~六；未归类节点单独折叠
import { THEORY_COURSES as COURSES, SKILLS } from '~/utils/constants'

interface Node {
  id: number
  subjectId: number
  code: string | null
  name: string
  level: number
  questionCount: number
  children: Node[]
}

const { data: theory } = await useFetch<Node[]>('/api/chapters/tree', {
  query: { subject: 4 },
})
const { data: practical } = await useFetch<Node[]>('/api/chapters/tree', {
  query: { subject: 5 },
})

const route = useRoute()
const api = useApi()
const progress = ref<Record<string, { answered: number; total: number; pct: number }>>({})

onMounted(async () => {
  if (!api.hasToken()) return
  try {
    const rows = await api.get<any[]>('/api/report/chapters')
    const map: Record<string, { answered: number; total: number; pct: number }> = {}
    for (const r of rows ?? []) {
      if (!r.code) continue
      const total = Number(r.total ?? 0)
      const answered = Number(r.answered ?? 0)
      map[String(r.code)] = {
        answered,
        total,
        pct: total > 0 ? Math.min(100, Math.round(answered / total * 100)) : 0,
      }
    }
    progress.value = map
  } catch { /* 未登录/网络失败时不显示进度 */ }
})

function progressOf(code: string | null) {
  return code ? progress.value[code] : undefined
}

const open = ref<Record<number, boolean>>({})
function toggle(id: number) {
  open.value[id] = !open.value[id]
}

function sortByCode(nodes: Node[]): Node[] {
  return [...nodes].sort((a, b) =>
    (a.code ?? '').localeCompare(b.code ?? '', 'en', { numeric: true }))
}

/** 理论课程 A/B：各自名下的章 */
const theoryCourses = computed(() => COURSES.map(c => {
  const nodes = sortByCode((theory.value ?? []).filter(n =>
    n.code != null && /^[AB]\d/.test(n.code) && n.code.startsWith(c.code) && n.questionCount > 0))
  return { ...c, nodes, total: nodes.reduce((s, n) => s + n.questionCount, 0) }
}))

/** 实操技能 S1~S6 */
const skills = computed(() => SKILLS.map(s => ({
  ...s,
  node: (practical.value ?? []).find(n => n.code === s.code) ?? null,
})))

/** 未归入课程 A/B 或技能一~六的节点（保留原有分类与入口） */
const otherNodes = computed(() => {
  const t = (theory.value ?? [])
    .filter(n => n.questionCount > 0 && !(n.code != null && /^[AB]\d/.test(n.code)))
    .map(n => ({ ...n, bank: '理论' }))
  const p = (practical.value ?? [])
    .filter(n => n.questionCount > 0 && !(n.code != null && /^S[1-6]$/.test(n.code)))
    .map(n => ({ ...n, bank: '实操' }))
  return [...sortByCode(t), ...sortByCode(p)]
})
const otherTotal = computed(() => otherNodes.value.reduce((s, n) => s + n.questionCount, 0))

/** 展开全部/收起全部：首页课程树移走后保留一键展开能力 */
function collectIds(nodes: Node[], out: number[] = []): number[] {
  for (const n of nodes) {
    if (n.children?.length) {
      out.push(n.id)
      collectIds(n.children, out)
    }
  }
  return out
}
const allIds = computed(() => [...collectIds(theory.value ?? []), ...collectIds(practical.value ?? [])])
const allExpanded = computed(() => allIds.value.length > 0 && allIds.value.every(id => open.value[id]))
function toggleAll() {
  const next = !allExpanded.value
  for (const id of allIds.value) open.value[id] = next
}

/** 首页课程卡跳转：/chapters?course=A#course-A 时展开并定位到对应课程/技能 */
const FOCUS_CODES = new Set(['A', 'B', 'S1', 'S2', 'S3', 'S4', 'S5', 'S6'])
const focusCourse = computed(() => {
  const raw = route.query.course
  const value = Array.isArray(raw) ? raw[0] : raw
  const code = String(value ?? '').trim().toUpperCase()
  return FOCUS_CODES.has(code) ? code : ''
})

async function focusFromQuery() {
  const code = focusCourse.value
  if (!code) return
  // 实操技能默认展开一层，便于直接看到节；理论课程只定位到课程区块
  if (code.startsWith('S')) {
    const skill = skills.value.find(s => s.code === code)
    if (skill?.node) open.value[skill.node.id] = true
  }
  await nextTick()
  document.getElementById(`course-${code}`)?.scrollIntoView({ behavior: 'smooth', block: 'start' })
}

onMounted(focusFromQuery)
watch(() => route.query.course, focusFromQuery)
</script>

<template>
  <section class="space-y-6">
    <UiPageHeader title="按章节刷题"
                  subtitle="理论按课程 A/B 分组，实操按技能一~六；数字为可练习题数。">
      <template #actions>
        <button type="button"
                class="inline-flex min-h-11 items-center rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 text-sm text-fg-secondary hover:border-brand hover:text-brand"
                @click="toggleAll">
          {{ allExpanded ? '收起全部' : '展开全部' }}
        </button>
      </template>
    </UiPageHeader>

    <div class="overflow-hidden rounded-xl border border-line-subtle bg-surface-card">
      <h2 class="border-b border-line-subtle px-5 py-3 text-sm font-semibold text-fg-primary">理论题库</h2>
      <div v-for="course in theoryCourses" :key="course.code" :id="`course-${course.code}`"
           class="scroll-mt-20 border-b border-line-subtle last:border-b-0">
        <div class="flex items-center justify-between bg-surface-muted px-5 py-2.5">
          <div class="flex items-center gap-2">
            <span class="rounded bg-surface-card px-1.5 py-0.5 text-xs text-fg-secondary">课程 {{ course.code }}</span>
            <span class="text-sm font-semibold text-fg-primary">{{ course.name }}</span>
          </div>
          <span class="text-xs text-fg-muted">{{ course.total.toLocaleString() }} 题</span>
        </div>
        <ul class="divide-y divide-line-subtle">
          <ChapterTreeItem v-for="node in course.nodes" :key="node.id"
                           :node="node" :open="open" :depth="0" :progress="progressOf(node.code)"
                           @toggle="toggle" />
        </ul>
      </div>
    </div>

    <div class="overflow-hidden rounded-xl border border-line-subtle bg-surface-card">
      <h2 class="border-b border-line-subtle px-5 py-3 text-sm font-semibold text-fg-primary">实操题库</h2>
      <ul class="divide-y divide-line-subtle">
        <template v-for="s in skills" :key="s.code">
          <ChapterTreeItem v-if="s.node" :node="s.node" :open="open" :depth="0"
                           :label="s.label" :display-name="s.name" :anchor-id="`course-${s.code}`"
                           :progress="progressOf(s.node.code)" @toggle="toggle" />
        </template>
      </ul>
    </div>

    <details v-if="otherTotal > 0" class="overflow-hidden rounded-xl border border-line-subtle bg-surface-card">
      <summary class="cursor-pointer px-5 py-3 text-sm font-semibold text-fg-primary">
        其他题目（未归入课程 A/B 或技能一~六）
        <span class="ml-1 font-normal text-fg-muted">共 {{ otherTotal.toLocaleString() }} 题</span>
      </summary>
      <p class="border-t border-line-subtle px-5 py-2 text-xs text-fg-muted">
        这些题目暂未归入标准章节，按原有分类保留，可正常练习。
      </p>
      <ul class="divide-y divide-line-subtle border-t border-line-subtle">
        <ChapterTreeItem v-for="n in otherNodes" :key="`${n.bank}-${n.id}`"
                         :node="n" :open="open" :depth="0" :label="n.bank"
                         :progress="progressOf(n.code)" @toggle="toggle" />
      </ul>
    </details>
  </section>
</template>
