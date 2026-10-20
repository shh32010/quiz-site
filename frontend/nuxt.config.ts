// Nuxt 3 配置：SSR 渲染，后端走 /api 反代到 Spring Boot
export default defineNuxtConfig({
  compatibilityDate: '2026-10-20',
  devtools: { enabled: false },
  modules: ['@nuxtjs/tailwindcss'],

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
    },
    compressPublicAssets: true,
  },

  app: {
    head: {
      htmlAttrs: { lang: 'zh-CN' },
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      ],
    },
  },
})
