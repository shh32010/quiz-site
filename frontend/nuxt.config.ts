// Nuxt 3 配置：SSR 渲染，后端走 /api 反代到 Spring Boot
export default defineNuxtConfig({
  compatibilityDate: '2026-10-20',
  devtools: { enabled: false },
  modules: ['@nuxtjs/tailwindcss'],
  css: ['~/assets/css/main.css'],

  // 服务端渲染（SEO 需要）
  ssr: true,

  runtimeConfig: {
    // 服务端专用（不暴露给浏览器）
    apiBase: process.env.QUIZ_API_BASE || 'http://127.0.0.1:8080',
    public: {
      siteName: '专转本刷题',
    },
  },

  nitro: {
    // 前端同源访问后端：/api/* 由 Nitro 转发
    routeRules: {
      '/api/**': { proxy: `${process.env.QUIZ_API_BASE || 'http://127.0.0.1:8080'}/api/**` },
      // 私有页依赖 localStorage 登录态，关闭 SSR，避免“服务端渲染私有内容、客户端跳登录”的水合错位
      '/account': { ssr: false },
      '/admin': { ssr: false },
      '/compose': { ssr: false },
      '/favorites': { ssr: false },
      '/history/**': { ssr: false },
      '/me': { ssr: false },
      '/report': { ssr: false },
      '/wrong': { ssr: false },
    },
    compressPublicAssets: true,
  },

  app: {
    head: {
      htmlAttrs: { lang: 'zh-CN' },
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'theme-color', content: '#F6F5F2' },
      ],
      link: [
        { rel: 'icon', type: 'image/svg+xml', href: '/favicon.svg' },
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'apple-touch-icon', href: '/apple-touch-icon.png' },
      ],
      // 在样式表前同步设置主题，避免夜间模式首屏闪白
      script: [{
        tagPosition: 'head',
        innerHTML: `(function(){try{var p=localStorage.getItem('quiz_theme_pref')||'system';var d=p==='dark'||(p==='system'&&window.matchMedia('(prefers-color-scheme: dark)').matches);var r=document.documentElement;r.classList.toggle('dark',d);r.dataset.theme=d?'dark':'light';r.style.colorScheme=d?'dark':'light';}catch(e){}})();`,
      }],
    },
  },
})
