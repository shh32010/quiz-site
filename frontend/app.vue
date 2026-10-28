<script setup lang="ts">
// 应用外壳：布局负责导航，这里只做全局登录态初始化、过期监听与 SEO 默认值
const auth = useAuth()
const theme = useTheme()
const route = useRoute()

const siteUrl = 'https://quiz.teacher-wishes.asia'
const privatePrefixes = [
  '/account', '/admin', '/compose', '/favorites', '/history', '/login',
  '/forgot', '/reset', '/report', '/wrong', '/practice', '/me', '/search', '/verify-email',
]
const isPrivate = computed(() =>
  privatePrefixes.some(p => route.path === p || route.path.startsWith(p + '/')))

useSeoMeta({
  description: '江苏专转本计算机专业大类刷题：章节练习、历年真题、随机组卷、错题复习、知识点学习。',
  ogTitle: '专转本计算机刷题',
  ogDescription: '章节练习 · 历年真题 · 随机组卷 · 错题复习 · 知识点学习',
  ogType: 'website',
  ogSiteName: '专转本刷题',
  ogUrl: () => siteUrl + route.path,
  twitterCard: 'summary',
})

useHead(() => ({
  link: [{ rel: 'canonical', href: siteUrl + route.path, key: 'canonical' }],
  meta: [{
    name: 'robots',
    content: isPrivate.value ? 'noindex, nofollow' : 'index, follow',
    key: 'robots',
  }],
}))

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
  <AnnouncementModal />
</template>
