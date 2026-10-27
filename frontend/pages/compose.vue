<script setup lang="ts">
// 随机组卷：按大纲配比 + 难度 3:5:2 生成一套卷
definePageMeta({ middleware: 'auth' })
const api = useApi()
const router = useRouter()
const loading = ref(0)
const error = ref('')

async function create(subject: number) {
  error.value = ''
  loading.value = subject
  try {
    const r = await api.post<{ sessionId: number; count: number }>('/api/compose/start', { subject })
    router.push(`/practice?session=${r.sessionId}`)
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = 0
  }
}
</script>

<template>
  <section class="space-y-5">
    <UiPageHeader title="随机组卷" subtitle="按大纲题型配比、课程占比与难度分布（易 30% / 中 50% / 难 20%）生成整套卷，优先抽取你未做过的题。" />
    <p v-if="error" class="text-sm text-danger-fg">{{ error }}</p>

    <div class="grid gap-4 sm:grid-cols-2">
      <button class="min-h-48 rounded-xl border border-line-subtle bg-surface-card p-6 text-left transition hover:border-brand hover:shadow-sm disabled:opacity-70"
              :disabled="loading !== 0" @click="create(4)">
        <UiBadge tone="blue">理论</UiBadge>
        <p class="mt-3 text-lg font-semibold text-fg-primary">理论卷 · 150 分</p>
        <p class="mt-1 text-sm text-fg-secondary">共 80 题 · 建议 100 分钟</p>
        <p class="mt-3 text-xs text-fg-muted">判断 10 · 单选 50 · 多选 10 · 填空 10</p>
        <p class="mt-1 text-xs text-fg-muted">课程 A 60% / B 40% · 只抽大纲标准分值题</p>
        <p class="mt-1 text-xs text-fg-muted">优先未做过的题，不足时用做过的题补齐</p>
        <p class="mt-4 text-xs font-medium text-brand">{{ loading === 4 ? '生成中…' : '一键生成 →' }}</p>
      </button>

      <button class="min-h-48 rounded-xl border border-line-subtle bg-surface-card p-6 text-left transition hover:border-brand hover:shadow-sm disabled:opacity-70"
              :disabled="loading !== 0" @click="create(5)">
        <UiBadge tone="green">实操</UiBadge>
        <p class="mt-3 text-lg font-semibold text-fg-primary">实操卷 · 80 分</p>
        <p class="mt-1 text-sm text-fg-secondary">共 40 题 · 建议 50 分钟</p>
        <p class="mt-3 text-xs text-fg-muted">单选 20 · 判断 8 · 填空 10 · 综合 2</p>
        <p class="mt-1 text-xs text-fg-muted">技能占比 S1 40% / S2 20% / S3–S6 各 10%</p>
        <p class="mt-1 text-xs text-fg-muted">优先未做过的题，不足时用做过的题补齐</p>
        <p class="mt-4 text-xs font-medium text-brand">{{ loading === 5 ? '生成中…' : '一键生成 →' }}</p>
      </button>
    </div>

    <p class="text-xs leading-5 text-fg-muted">
      生成后直接进入刷题页；中途退出可从首页「继续上次练习」或「做题历史」恢复。
      组卷只抽符合大纲分值的题，理论卷稳定 150 分、实操卷稳定 80 分。
    </p>
  </section>
</template>
