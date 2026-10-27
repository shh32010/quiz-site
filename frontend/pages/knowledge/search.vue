<script setup lang="ts">
// 知识点搜索：标题/内容关键词，结果跳到所在节锚点
import { plainSnippet } from '~/utils/markdown'

useHead({ title: '搜索知识点' })

const route = useRoute()
const router = useRouter()
const q = computed(() => String(route.query.q ?? '').trim())
const page = computed(() => Math.max(1, Number(route.query.page) || 1))
const size = 30
const input = ref(q.value)

watch(q, value => { input.value = value })

const { data, pending, error } = await useFetch<any>('/api/knowledge/search', {
  query: { q, page, size },
})

const totalPages = computed(() => Math.max(1, Math.ceil((data.value?.total ?? 0) / size)))

function search() {
  router.push({ path: '/knowledge/search', query: input.value.trim() ? { q: input.value.trim() } : {} })
}
</script>

<template>
  <section class="space-y-4">
    <nav class="flex items-center gap-1 text-xs text-fg-muted">
      <NuxtLink to="/knowledge" class="hover:text-brand">知识点</NuxtLink>
      <span>/</span>
      <span class="text-fg-secondary">搜索</span>
    </nav>

    <UiPageHeader title="搜索知识点" subtitle="搜索标题或正文；结果会跳到所在节的对应知识点。" />

    <form class="flex flex-wrap gap-2" @submit.prevent="search">
      <input v-model="input" type="search" placeholder="输入关键词，如“二叉树”“SQL 索引”"
             class="min-w-0 flex-1 rounded-lg border border-line-strong bg-surface-card px-3 py-2 text-base outline-none focus:border-brand sm:max-w-md sm:text-sm" />
      <button type="submit" class="min-h-11 rounded-lg bg-brand px-4 text-sm font-medium text-white hover:bg-brand-hover">
        搜索
      </button>
    </form>

    <p v-if="!q" class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-center text-sm text-fg-secondary">
      输入关键词开始搜索，或 <NuxtLink to="/knowledge" class="text-brand hover:underline">按课程浏览</NuxtLink>。
    </p>

    <p v-else-if="error" class="rounded-lg border border-danger-border bg-danger-bg px-3 py-2 text-sm text-danger-fg">
      搜索失败，请稍后重试。
    </p>

    <p v-else-if="pending" class="text-sm text-fg-muted">搜索中…</p>

    <template v-else-if="data">
      <p class="text-xs text-fg-muted">共 {{ data.total }} 条结果</p>
      <ul v-if="data.rows.length" class="divide-y divide-line-subtle overflow-hidden rounded-xl border border-line-subtle bg-surface-card">
        <li v-for="row in data.rows" :key="row.id">
          <NuxtLink :to="`/knowledge/kp/${row.id}`"
                    class="block px-4 py-3 hover:bg-surface-muted">
            <div class="flex flex-wrap items-center gap-2">
              <span v-if="row.nodeCode" class="rounded bg-surface-muted px-1.5 py-0.5 font-mono text-xs text-fg-muted">{{ row.nodeCode }}</span>
              <span class="text-sm font-medium text-fg-primary">{{ row.title }}</span>
              <span v-if="row.nodeName" class="truncate text-xs text-fg-muted">{{ row.nodeName }}</span>
            </div>
            <p class="mt-1 line-clamp-2 text-xs leading-5 text-fg-secondary">{{ plainSnippet(row.content) }}</p>
            <p class="mt-1 text-xs text-fg-muted">
              {{ row.section || '知识点' }} · {{ row.questionCount ?? 0 }} 道关联题
            </p>
          </NuxtLink>
        </li>
      </ul>
      <p v-else class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-center text-sm text-fg-secondary">
        没有找到相关知识点。试试更短的关键词，或
        <NuxtLink :to="{ path: '/search', query: { q } }" class="text-brand hover:underline">搜索题目</NuxtLink>。
      </p>

      <div v-if="totalPages > 1" class="flex items-center justify-center gap-2 text-sm">
        <NuxtLink v-if="page > 1"
                  :to="{ path: '/knowledge/search', query: { q, page: page - 1 } }"
                  class="inline-flex min-h-11 items-center rounded-lg border border-line-strong px-4">上一页</NuxtLink>
        <span class="text-fg-muted">{{ page }} / {{ totalPages }}</span>
        <NuxtLink v-if="page < totalPages"
                  :to="{ path: '/knowledge/search', query: { q, page: page + 1 } }"
                  class="inline-flex min-h-11 items-center rounded-lg border border-line-strong px-4">下一页</NuxtLink>
      </div>
    </template>
  </section>
</template>
