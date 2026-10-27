<script setup lang="ts">
// 收藏夹
import { TYPE_LABEL } from '~/utils/constants'

definePageMeta({ middleware: 'auth' })
const api = useApi()
const data = ref<any>(null)
const error = ref('')
const loading = ref(true)

async function load() {
  loading.value = true
  error.value = ''
  try { data.value = await api.get('/api/favorites') } catch (e: any) { error.value = e.message } finally { loading.value = false }
}

async function remove(id: number) {
  try { await api.del(`/api/favorites/${id}`); await load() } catch (e: any) { error.value = e.message }
}

onMounted(load)
</script>

<template>
  <section class="space-y-4">
    <h1 class="text-2xl font-bold text-slate-900">收藏夹</h1>

    <UiState :loading="loading" :error="error" :empty="!data?.rows?.length"
             empty-text="还没有收藏。" @retry="load">
      <p class="text-sm text-slate-500">共 {{ data?.total ?? 0 }} 题</p>
      <ul class="mt-3 divide-y divide-slate-100 rounded-xl border border-slate-200 bg-white">
        <li v-for="q in data?.rows ?? []" :key="q.questionId" class="flex items-start gap-3 px-5 py-3">
          <UiBadge class="mt-0.5 shrink-0">{{ TYPE_LABEL[q.questionType] ?? q.questionType }}</UiBadge>
          <div class="min-w-0 flex-1">
            <span class="text-sm leading-6 text-slate-800">{{ formatText(q.stem) }}</span>
            <p v-if="q.kps" class="mt-0.5 text-xs text-slate-400">知识点：{{ q.kps }}</p>
          </div>
          <NuxtLink :to="`/practice?mode=single&target=${q.questionId}&from=/favorites`"
                    class="shrink-0 text-xs font-medium text-blue-600 hover:underline">练这题 →</NuxtLink>
          <UiButton variant="ghost" size="sm" class="shrink-0" @click="remove(q.questionId)">移除</UiButton>
        </li>
      </ul>
    </UiState>
  </section>
</template>
