<script setup lang="ts">
// 收藏夹
const api = useApi()
const data = ref<any>(null)
const error = ref('')

async function load() {
  if (!api.hasToken()) { error.value = '请先登录'; return }
  try { data.value = await api.get('/api/favorites') } catch (e: any) { error.value = e.message }
}

async function remove(id: number) {
  try { await api.del(`/api/favorites/${id}`); await load() } catch (e: any) { error.value = e.message }
}

onMounted(load)
const TYPE_LABEL: Record<number, string> = { 1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合' }
</script>

<template>
  <section class="space-y-4">
    <h1 class="text-2xl font-bold text-slate-900">收藏夹</h1>
    <p v-if="error" class="text-sm text-red-600">
      {{ error }} <NuxtLink to="/login" class="ml-2 text-blue-600 hover:underline">去登录</NuxtLink>
    </p>

    <template v-else-if="data">
      <p class="text-sm text-slate-500">共 {{ data.total }} 题</p>
      <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
        <li v-for="q in data.rows" :key="q.questionId" class="flex items-start gap-3 px-5 py-3">
          <span class="mt-0.5 shrink-0 rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">
            {{ TYPE_LABEL[q.questionType] ?? q.questionType }}
          </span>
          <span class="min-w-0 flex-1 text-sm leading-6 text-slate-800">{{ formatText(q.stem) }}</span>
          <button class="shrink-0 text-xs text-slate-400 hover:text-red-600" @click="remove(q.questionId)">移除</button>
        </li>
        <li v-if="!data.rows.length" class="px-5 py-6 text-sm text-slate-500">还没有收藏。</li>
      </ul>
    </template>

    <p v-else class="text-sm text-slate-500">加载中…</p>
  </section>
</template>
