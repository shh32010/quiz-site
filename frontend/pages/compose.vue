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
    <UiPageHeader title="随机组卷" subtitle="按大纲题型配比与难度分布（易 30% / 中 50% / 难 20%）生成一套卷，优先抽取你未做过的题。" />
    <p v-if="error" class="text-sm text-danger-fg">{{ error }}</p>

    <div class="grid gap-4 sm:grid-cols-2">
      <button class="min-h-40 rounded-xl border border-line-subtle bg-surface-card p-6 text-left transition hover:border-brand hover:shadow-sm"
              :disabled="loading !== 0" @click="create(4)">
        <UiBadge tone="blue">理论</UiBadge>
        <p class="mt-3 text-lg font-semibold text-fg-primary">理论卷 · 150 分</p>
        <p class="mt-1 text-sm text-fg-secondary">判断 10 + 单选 50 + 多选 10 + 填空 10（课程 A 60% / B 40%）</p>
        <p class="mt-3 text-xs font-medium text-brand">{{ loading === 4 ? '生成中…' : '一键生成 →' }}</p>
      </button>

      <button class="min-h-40 rounded-xl border border-line-subtle bg-surface-card p-6 text-left transition hover:border-brand hover:shadow-sm"
              :disabled="loading !== 0" @click="create(5)">
        <UiBadge tone="green">实操</UiBadge>
        <p class="mt-3 text-lg font-semibold text-fg-primary">实操卷 · 80 分</p>
        <p class="mt-1 text-sm text-fg-secondary">单选 20 + 判断 8 + 填空 10 + 综合 2（按技能占比分配）</p>
        <p class="mt-3 text-xs font-medium text-brand">{{ loading === 5 ? '生成中…' : '一键生成 →' }}</p>
      </button>
    </div>
  </section>
</template>
