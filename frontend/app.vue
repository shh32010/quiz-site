<script setup lang="ts">
// 应用外壳：布局负责导航，这里只做全局登录态初始化与过期监听
const auth = useAuth()
const theme = useTheme()

// 监听要在页面请求前就绪；登录态/主题则等挂载后再同步，避免 SSR 水合错位
if (import.meta.client) auth.bindAuthExpired()
onMounted(() => {
  auth.init()
  theme.init()
})
onUnmounted(() => auth.unbindAuthExpired())
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
  <UiConfirmHost />
  <UiToastHost />
</template>
