<script setup lang="ts">
// 管理后台（仅 admin 可见数据）
const api = useApi()
const stats = ref<any>(null)
const feedback = ref<any[]>([])
const error = ref('')
const note = ref<Record<number, string>>({})

async function load() {
  if (!api.hasToken()) { error.value = '请先登录'; return }
  try {
    stats.value = await api.get('/api/admin/stats')
    const f = await api.get<{ rows: any[] }>('/api/admin/feedback')
    feedback.value = f.rows
  } catch (e: any) {
    error.value = e.message
  }
}

async function resolve(id: number) {
  try {
    await api.post(`/api/admin/feedback/${id}/resolve`, { note: note.value[id] ?? '' })
    await load()
  } catch (e: any) {
    error.value = e.message
  }
}

onMounted(load)
</script>

<template>
  <section class="space-y-5">
    <h1 class="text-2xl font-bold text-slate-900">管理后台</h1>
    <p v-if="error" class="text-sm text-red-600">{{ error }}</p>

    <div v-if="stats" class="grid gap-3 sm:grid-cols-5">
      <div v-for="(v, k) in stats" :key="k" class="rounded-xl border border-slate-200 p-4">
        <p class="text-xs text-slate-500">{{ k }}</p>
        <p class="mt-1 text-xl font-bold text-slate-800">{{ v }}</p>
      </div>
    </div>

    <div>
      <h2 class="mb-2 text-sm font-semibold text-slate-700">待处理反馈</h2>
      <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
        <li v-for="f in feedback" :key="f.id" class="space-y-2 px-5 py-3 text-sm">
          <div class="flex items-center justify-between">
            <span class="text-slate-700">
              <b>#{{ f.questionId }}</b> · {{ f.type }} · {{ f.username ?? '匿名' }}
            </span>
            <span class="text-xs text-slate-400">{{ (f.createdAt || '').slice(0, 16).replace('T', ' ') }}</span>
          </div>
          <p class="text-slate-600">{{ f.content }}</p>
          <p class="text-xs text-slate-400">题干：{{ f.stemPreview }}</p>
          <div class="flex gap-2">
            <input v-model="note[f.id]" placeholder="处理备注" class="flex-1 rounded border px-2 py-1 text-xs" />
            <button class="rounded bg-slate-700 px-3 py-1 text-xs text-white" @click="resolve(f.id)">标记已处理</button>
          </div>
        </li>
        <li v-if="!feedback.length" class="px-5 py-6 text-sm text-slate-500">暂无待处理反馈。</li>
      </ul>
    </div>
  </section>
</template>
