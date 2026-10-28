<script setup lang="ts">
// 全站页脚：备案信息、隐私政策、用户协议、站内公告
const year = useState('footer-year', () => new Date().getFullYear())
const { show: showAnnouncement } = useAnnouncement()
</script>

<template>
  <footer class="mt-10 border-t border-line-subtle pt-6 text-center text-xs leading-6 text-fg-muted print:hidden">
    <p>© {{ year }} 专转本刷题 · 仅供学习交流</p>
    <p class="mt-1 flex flex-wrap items-center justify-center gap-x-3 gap-y-1">
      <a href="https://beian.miit.gov.cn/" target="_blank" rel="noopener noreferrer" class="hover:text-brand">
        苏ICP备2026082091号-1
      </a>
      <NuxtLink to="/privacy" class="hover:text-brand">隐私政策</NuxtLink>
      <NuxtLink to="/terms" class="hover:text-brand">用户协议</NuxtLink>
      <button type="button" class="hover:text-brand" @click="showAnnouncement">站内公告</button>
    </p>
  </footer>
</template>
