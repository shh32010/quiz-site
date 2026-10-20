<script setup lang="ts">
// 首页：渲染时从后端拿健康状态，验证前后端连通
const { data: health } = await useFetch('/api/health')
</script>

<template>
  <section class="space-y-6">
    <h1 class="text-2xl font-bold text-slate-900">专转本计算机刷题</h1>
    <p class="text-slate-600">章节练习 · 真题模考 · 错题复习</p>

    <div class="rounded-xl border border-slate-200 p-5">
      <h2 class="mb-2 text-sm font-semibold text-slate-700">系统状态</h2>
      <pre class="overflow-x-auto rounded bg-slate-50 p-3 text-xs text-slate-700">{{ health }}</pre>
    </div>
  </section>
</template>
