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
    <h1 class="text-2xl font-bold text-slate-900">随机组卷</h1>
    <p class="text-slate-600">按大纲题型配比与难度分布（易 30% / 中 50% / 难 20%）随机生成。</p>
    <p v-if="error" class="text-sm text-red-600">{{ error }}</p>

    <div class="grid gap-4 sm:grid-cols-2">
      <button class="rounded-xl border border-slate-200 p-6 text-left transition hover:border-blue-400"
              :disabled="loading !== 0" @click="create(4)">
        <p class="text-lg font-semibold text-slate-800">理论卷 · 150 分</p>
        <p class="mt-1 text-sm text-slate-500">判断 10 + 单选 50 + 多选 10 + 填空 10（课程 A 60% / B 40%）</p>
        <p class="mt-2 text-xs text-blue-600">{{ loading === 4 ? '生成中…' : '开始生成 ›' }}</p>
      </button>

      <button class="rounded-xl border border-slate-200 p-6 text-left transition hover:border-blue-400"
              :disabled="loading !== 0" @click="create(5)">
        <p class="text-lg font-semibold text-slate-800">实操卷 · 80 分</p>
        <p class="mt-1 text-sm text-slate-500">单选 20 + 判断 8 + 填空 10 + 综合 2（按技能占比分配）</p>
        <p class="mt-2 text-xs text-blue-600">{{ loading === 5 ? '生成中…' : '开始生成 ›' }}</p>
      </button>
    </div>
  </section>
</template>
