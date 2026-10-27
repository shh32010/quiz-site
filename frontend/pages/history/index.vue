<script setup lang="ts">
// 做题历史：当前用户的历史练习会话
import { TYPE_TABS, MODE_LABEL, fmtTime, fmtDur } from '~/utils/constants'

definePageMeta({ middleware: 'auth' })
useHead({ title: '做题历史' })
const api = useApi()
const ask = useConfirm()
const toast = useToast()
const clearing = ref(false)
const rows = ref<any[]>([])
const resume = ref<any>(null)
const total = ref(0)
const totalAll = ref(0)
const page = ref(1)
const size = 20
const loading = ref(true)
const error = ref('')
const selectedType = ref(0)
const typeCounts = ref<Record<number, number>>({})

const totalPages = computed(() => Math.max(1, Math.ceil(total.value / size)))
const typeTabs = computed(() => TYPE_TABS.map(t => ({
  ...t,
  count: t.value === 0 ? totalAll.value : (typeCounts.value[t.value] ?? 0),
})))

async function load(p = page.value) {
  loading.value = true
  error.value = ''
  try {
    const typeQuery = selectedType.value ? `&type=${selectedType.value}` : ''
    const r = await api.get<any>(`/api/practice/history?page=${p}&size=${size}${typeQuery}`)
    rows.value = r.rows ?? []
    total.value = r.total ?? 0
    totalAll.value = r.totalAll ?? r.total ?? 0
    page.value = r.page ?? p
    typeCounts.value = Object.fromEntries(
      (r.typeCounts ?? []).map((x: any) => [Number(x.type), Number(x.count)]))
  } catch (e: any) {
    error.value = e.message ?? '加载失败'
  } finally {
    loading.value = false
  }
}

function switchType(t: number) {
  if (selectedType.value === t) return
  selectedType.value = t
  load(1)
}

async function clearHistory() {
  if (clearing.value) return
  if (!(await ask({
    title: '清空做题历史与进度',
    message: '将永久删除全部做题会话、答题记录和错题本进度，总进度、章节进度会归零。收藏不受影响。此操作不可恢复。',
    confirmText: '确认清空',
    cancelText: '保留',
    danger: true,
  }))) return
  clearing.value = true
  try {
    await api.del('/api/practice/history')
    rows.value = []
    total.value = 0
    totalAll.value = 0
    page.value = 1
    typeCounts.value = {}
    selectedType.value = 0
    resume.value = null
    toast.show('做题历史和进度已清空', 'success')
  } catch (e: any) {
    error.value = e.message ?? '清空失败，请重试'
  } finally {
    clearing.value = false
  }
}

onMounted(async () => {
  load(1)
  if (!api.hasToken()) return
  try {
    const r = await api.get<{ session: any }>('/api/practice/resume')
    resume.value = r.session
  } catch { /* 不影响历史列表 */ }
})
</script>

<template>
  <section class="space-y-4">
    <UiPageHeader title="做题历史" subtitle="每次练习、进度和得分">
      <template #actions>
        <NuxtLink to="/report" class="text-sm text-brand hover:underline">学习报告 →</NuxtLink>
        <UiButton v-if="!loading && (totalAll > 0 || resume)" variant="danger-outline" size="sm"
                  :loading="clearing" @click="clearHistory">清空历史与进度</UiButton>
      </template>
    </UiPageHeader>

    <ResumeCard v-if="resume" :session="resume" />

    <UiTabs :model-value="selectedType" :items="typeTabs" @update:model-value="switchType(Number($event))" />

    <UiState :loading="loading" :error="error" @retry="load(page)">
      <p v-if="!rows.length" class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-center text-sm text-fg-muted">
        {{ selectedType ? '该题型暂无做题记录。' : '还没有做题记录，去' }}
        <NuxtLink v-if="!selectedType" to="/chapters" class="text-brand hover:underline">章节练习</NuxtLink>
        <span v-if="!selectedType"> 开始吧。</span>
      </p>

      <ul v-else class="space-y-3">
        <li v-for="s in rows" :key="s.id">
          <NuxtLink :to="`/history/${s.id}`"
                    class="block rounded-xl border border-line-subtle bg-surface-card p-4 transition hover:border-brand hover:shadow-sm">
            <div class="flex flex-wrap items-start justify-between gap-2">
              <div class="min-w-0">
                <p class="truncate text-sm font-medium text-fg-primary">
                  {{ MODE_LABEL[s.mode] ?? s.mode }}
                  <span v-if="s.targetName" class="text-fg-secondary">· {{ s.targetName }}</span>
                </p>
                <p class="mt-1 text-xs text-fg-muted">
                  {{ fmtTime(s.startedAt) }} · 用时 {{ fmtDur(s.elapsedSec) }}
                </p>
              </div>
              <UiBadge :tone="s.finishedAt ? 'green' : 'amber'" class="shrink-0">
                {{ s.finishedAt ? '已完成' : '进行中' }}
              </UiBadge>
            </div>
            <div class="mt-3 flex flex-wrap items-center gap-x-5 gap-y-1 text-xs text-fg-secondary">
              <span>作答 {{ s.answeredCount }} / {{ s.questionCount }}</span>
              <span v-if="s.answeredCount">答对 {{ s.correctCount }} 题</span>
              <span v-if="s.answeredCount" class="font-semibold tabular-nums text-brand">
                正确率 {{ Math.round(s.correctCount / s.answeredCount * 100) }}%
              </span>
              <span v-if="s.finishedAt">得分 {{ s.score }} / {{ s.totalScore }}</span>
            </div>
          </NuxtLink>
        </li>
      </ul>

      <div v-if="totalPages > 1" class="flex items-center justify-center gap-2">
        <UiButton v-if="page > 1" variant="secondary" size="md" @click="load(page - 1)">上一页</UiButton>
        <span class="text-sm tabular-nums text-fg-muted">{{ page }} / {{ totalPages }}</span>
        <UiButton v-if="page < totalPages" variant="secondary" size="md" @click="load(page + 1)">下一页</UiButton>
      </div>
    </UiState>
  </section>
</template>
