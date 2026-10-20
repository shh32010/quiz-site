<template>
  <div class="min-h-screen bg-white text-slate-800">
    <header class="border-b border-slate-200">
      <div class="mx-auto flex max-w-5xl items-center gap-4 px-4 py-3">
        <NuxtLink to="/" class="text-lg font-semibold text-blue-600">专转本刷题</NuxtLink>
        <nav class="flex gap-3 text-sm text-slate-600">
          <NuxtLink to="/" class="hover:text-blue-600">首页</NuxtLink>
          <NuxtLink to="/chapters" class="hover:text-blue-600">按章节</NuxtLink>
          <NuxtLink to="/papers" class="hover:text-blue-600">真题</NuxtLink>
          <NuxtLink to="/compose" class="hover:text-blue-600">组卷</NuxtLink>
          <NuxtLink to="/wrong" class="hover:text-blue-600">错题本</NuxtLink>
          <NuxtLink to="/report" class="hover:text-blue-600">学习报告</NuxtLink>
          <NuxtLink to="/search" class="hover:text-blue-600">搜索</NuxtLink>
          <NuxtLink to="/favorites" class="hover:text-blue-600">收藏</NuxtLink>
        </nav>
      </div>
    </header>
    <main class="mx-auto max-w-5xl px-4 py-6">
      <NuxtPage />
    </main>
  </div>
</template>
