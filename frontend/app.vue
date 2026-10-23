<script setup lang="ts">
// 全局登录态：用于右上角显示「登录 / 退出登录」
const api = useApi()
const loggedIn = useState('logged_in', () => false)

onMounted(() => { loggedIn.value = api.hasToken() })

function logout() {
  api.clearToken()
  loggedIn.value = false
  navigateTo('/login')
}
</script>

<template>
  <div class="min-h-screen bg-white text-slate-800">
    <header class="border-b border-slate-200">
      <div class="mx-auto flex max-w-5xl items-center gap-4 px-4 py-3">
        <NuxtLink to="/" class="shrink-0 text-lg font-semibold text-blue-600">专转本刷题</NuxtLink>
        <nav class="flex min-w-0 flex-1 gap-3 overflow-x-auto whitespace-nowrap py-1 text-sm text-slate-600">
          <NuxtLink to="/" class="hover:text-blue-600">首页</NuxtLink>
          <NuxtLink to="/chapters" class="hover:text-blue-600">按章节</NuxtLink>
          <NuxtLink to="/knowledge" class="hover:text-blue-600">知识点</NuxtLink>
          <NuxtLink to="/papers" class="hover:text-blue-600">真题</NuxtLink>
          <NuxtLink to="/compose" class="hover:text-blue-600">组卷</NuxtLink>
          <NuxtLink to="/wrong" class="hover:text-blue-600">错题本</NuxtLink>
          <NuxtLink to="/history" class="hover:text-blue-600">做题历史</NuxtLink>
          <NuxtLink to="/report" class="hover:text-blue-600">学习报告</NuxtLink>
          <NuxtLink to="/search" class="hover:text-blue-600">搜索</NuxtLink>
          <NuxtLink to="/favorites" class="hover:text-blue-600">收藏</NuxtLink>
          <NuxtLink to="/account" class="hover:text-blue-600">账号</NuxtLink>
        </nav>
        <div class="flex shrink-0 items-center text-sm">
          <button v-if="loggedIn" class="text-slate-500 hover:text-blue-600" @click="logout">退出登录</button>
          <NuxtLink v-else to="/login" class="text-blue-600 hover:underline">登录</NuxtLink>
        </div>
      </div>
    </header>
    <main class="mx-auto max-w-5xl px-4 py-6">
      <NuxtPage />
    </main>
  </div>
</template>
