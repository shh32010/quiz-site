<script setup lang="ts">
// 旧知识点深链：/knowledge?kp=123 或 /knowledge/kp/123 → 所在节锚点（保留 ?hl= 高亮词）
import type { KNode } from '~/utils/knowledge'

const route = useRoute()
const id = computed(() => Number(route.params.id))
const { data: kp } = await useFetch<any>(() => `/api/knowledge/${id.value}`)
const { data: tree } = await useFetch<KNode[]>('/api/knowledge/tree')

useHead({ title: '知识点阅读' })

function findSection(nodes: KNode[], target: number, parentL2: number | null = null): number | null {
  for (const node of nodes) {
    const nextParent = node.level === 2 ? node.id : parentL2
    if (node.id === target) return node.level === 2 ? node.id : parentL2
    const found = findSection(node.children ?? [], target, nextParent)
    if (found) return found
  }
  return null
}

const sectionId = computed(() => {
  if (!kp.value?.nodeId) return null
  return findSection(tree.value ?? [], Number(kp.value.nodeId))
})

if (sectionId.value) {
  const hl = String(route.query.hl ?? '').trim()
  const qs = hl ? `?hl=${encodeURIComponent(hl)}` : ''
  await navigateTo(`/knowledge/section/${sectionId.value}${qs}#kp-${id.value}`, {
    replace: true,
    redirectCode: 302,
  })
}
</script>

<template>
  <section class="mx-auto max-w-2xl space-y-4 py-8">
    <p class="text-sm text-fg-secondary">正在定位知识点…</p>
    <template v-if="kp === null || !kp">
      <p class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-sm text-fg-secondary">
        知识点不存在或已下架。<NuxtLink to="/knowledge" class="text-brand hover:underline">返回知识点首页</NuxtLink>
      </p>
    </template>
    <template v-else-if="!sectionId">
      <p class="rounded-xl border border-amber-200 bg-amber-50 px-5 py-8 text-sm text-amber-800">
        这个知识点暂未归入标准章节，无法定位到节阅读页。
        <NuxtLink to="/knowledge" class="underline">返回知识点首页</NuxtLink>
      </p>
    </template>
  </section>
</template>
