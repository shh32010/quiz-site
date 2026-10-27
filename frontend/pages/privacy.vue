<script setup lang="ts">
// 隐私政策：说明收集的信息、用途、存储与用户权利
useHead({
  title: '隐私政策',
  meta: [{ name: 'description', content: '专转本刷题隐私政策：账号、邮箱、学习记录、日志等信息的收集与使用说明。' }],
})
</script>

<template>
  <article class="mx-auto max-w-3xl space-y-5 text-sm leading-7 text-fg-secondary">
    <UiPageHeader title="隐私政策" subtitle="最后更新：2026-10-27" />

    <p>本政策说明“专转本刷题”（以下称“本站”）在提供刷题、真题、知识点和学习报告等服务时，如何收集、使用、存储和保护你的信息。使用本站即表示你已阅读并理解本政策。</p>

    <h2 class="text-base font-semibold text-fg-primary">一、我们收集的信息</h2>
    <ul class="list-disc space-y-1 pl-5">
      <li><b>账号信息</b>：用户名、密码哈希、邮箱（如填写）、昵称、注册时间和最近登录 IP/时间。</li>
      <li><b>学习记录</b>：练习会话、作答内容、得分、错题、收藏、学习进度和学习报告。</li>
      <li><b>反馈与 AI 问答</b>：你提交的题目反馈内容，以及使用 AI 讲解/变式时发送的题目信息。</li>
      <li><b>设备与日志</b>：访问日志、IP 地址、浏览器类型、错误日志和安全审计记录。</li>
      <li><b>匿名访问统计</b>：页面路径、浏览器本地生成的匿名访客标识、来源域名、是否移动端；不记录 IP 或原始 User-Agent，仅用于了解页面使用情况。</li>
      <li><b>本地存储</b>：登录令牌、主题偏好和匿名访客标识保存在浏览器 localStorage，用于维持登录态、界面主题和访问统计。</li>
    </ul>

    <h2 class="text-base font-semibold text-fg-primary">二、我们如何使用信息</h2>
    <ul class="list-disc space-y-1 pl-5">
      <li>提供登录、练习、判分、错题复习、学习报告等核心功能。</li>
      <li>发送邮箱验证、找回密码等必要的账号通知。</li>
      <li>处理题目反馈、修复数据问题、改进题库和产品体验。</li>
      <li>保障服务安全，排查滥用、攻击和故障。</li>
    </ul>

    <h2 class="text-base font-semibold text-fg-primary">三、存储与保护</h2>
    <p>数据存储于本站使用的云服务器和数据库中，密码以 BCrypt 哈希保存，接口通过 HTTPS 传输。我们采取访问控制、备份和日志审计等措施，但互联网服务不存在绝对安全，请妥善保管账号密码。</p>

    <h2 class="text-base font-semibold text-fg-primary">四、第三方服务</h2>
    <ul class="list-disc space-y-1 pl-5">
      <li>AI 讲解/变式使用 DeepSeek API，发送内容限于题目和必要的上下文。</li>
      <li>邮件发送使用阿里云邮件推送，用于邮箱验证和找回密码。</li>
      <li>服务器、数据库、对象存储和备份由阿里云提供；外部可用性监控使用 UptimeRobot。</li>
    </ul>
    <p>除法律法规要求或保障服务安全所必需外，我们不会出售你的个人信息。</p>

    <h2 class="text-base font-semibold text-fg-primary">五、你的权利</h2>
    <p>你可以在“账号设置”中修改密码、绑定或解绑邮箱，在“做题历史”中清空练习进度。如需查询、更正或删除其他个人信息，或注销账号，可通过站内题目反馈渠道联系运营者；我们会在核实身份后处理。</p>

    <h2 class="text-base font-semibold text-fg-primary">六、未成年人</h2>
    <p>本站面向备考学习者。未成年人应在监护人指导下使用；如监护人发现未成年人未经同意提交了个人信息，可联系我们删除。</p>

    <h2 class="text-base font-semibold text-fg-primary">七、政策更新</h2>
    <p>我们可能根据功能或法规变化更新本政策，更新后在本页公布。继续使用本站视为接受更新后的政策。</p>

    <h2 class="text-base font-semibold text-fg-primary">八、联系方式</h2>
    <p>如对本政策有疑问，可通过站内题目反馈渠道联系运营者。</p>
  </article>
</template>
