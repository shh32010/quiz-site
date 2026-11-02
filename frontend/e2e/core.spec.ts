import { expect, test } from '@playwright/test'

test.describe('刷题站核心链路 E2E', () => {
  test('首页加载、站内公告弹出与关闭后已读持久化', async ({ page }) => {
    await page.route('**/api/announcement', async (route) => {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify({
          version: '2026-11-02-e2e',
          title: '关于这个刷题站的几句说明',
          subtitle: '测试副标题',
          date: '2026 年 11 月 2 日',
          footnote: '测试底部说明',
          items: [{ tag: '规则', title: '每天 200 题', desc: '测试说明' }],
          history: [{ date: '2026-11-02', text: '测试更新历史' }],
        }),
      })
    })
    await page.route('**/api/chapters/tree**', async (route) => {
      await route.fulfill({ status: 200, contentType: 'application/json', body: '[]' })
    })

    await page.goto('/')
    const dialog = page.getByRole('dialog')
    await expect(dialog).toBeVisible({ timeout: 5000 })
    await expect(dialog).toContainText('关于这个刷题站的几句说明')

    await page.getByRole('button', { name: '知道啦，开始学习' }).click()
    await expect(dialog).toBeHidden()

    const seenMarker = await page.evaluate(() => localStorage.getItem('quiz_announcement_daily'))
    expect(seenMarker).toContain('2026-11-02-e2e|')
  })

  test('游客模式刷题：单选点击即判分、退出触发登录提示弹窗', async ({ page }) => {
    await page.route('**/api/questions**', async (route) => {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify({
          rows: [
            {
              id: 1001,
              questionType: 1,
              stem: '1 Byte 等于多少 bit？',
              optionJson: JSON.stringify({ A: '4', B: '8', C: '16', D: '32' }),
            },
            {
              id: 1002,
              questionType: 1,
              stem: '二进制 10 对应的十进制是？',
              optionJson: JSON.stringify({ A: '1', B: '2', C: '3', D: '4' }),
            },
          ],
        }),
      })
    })
    await page.route('**/api/questions/*/knowledge', async (route) => {
      await route.fulfill({ status: 200, contentType: 'application/json', body: '[]' })
    })
    await page.route('**/api/guest/answer', async (route) => {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify({
          is_correct: false,
          score_got: 0,
          correct: 'B',
          analysis: '1 字节 = 8 比特。',
        }),
      })
    })

    await page.goto('/practice?mode=chapter&target=40')
    await expect(page.getByText('1 Byte 等于多少 bit？')).toBeVisible()

    // 单选点击错误项 A 立即判分并展示答案解析
    await page.locator('label', { hasText: 'A.' }).click()
    await expect(page.getByText('1 字节 = 8 比特。')).toBeVisible()

    // 游客点击退出按钮弹出保存进度引导
    await page.getByRole('button', { name: /退出/ }).click()
    await expect(page.getByText('登录以记录学习进度')).toBeVisible()
  })

  test('个人页我的反馈回显与联系作者反馈弹窗', async ({ page }) => {
    await page.addInitScript(() => {
      localStorage.setItem('quiz_token', 'e2e-mock-token')
      localStorage.setItem('quiz_announcement_daily', '2026-11-02-5|' + new Date().toISOString().slice(0, 10))
    })
    await page.route('**/api/announcement', async (route) => {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify({
          version: '2026-11-02-5',
          title: '站内公告',
          subtitle: '',
          date: '2026-11-02',
          footnote: '',
          items: [],
          history: [],
        }),
      })
    })
    await page.route('**/api/auth/me', async (route) => {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify({ id: 1, username: 'e2e_user', nickname: '测试同学', role: 'user' }),
      })
    })
    await page.route('**/api/feedback/mine', async (route) => {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify({
          rows: [
            {
              id: 88,
              questionId: 354502,
              type: 'analysis',
              content: '解析里进制写反了',
              status: 'handled',
              adminNote: '已修正该题解析，感谢反馈！',
              createdAt: '2026-11-02T12:00:00Z',
            },
          ],
        }),
      })
    })

    await page.goto('/me')
    await expect(page.getByText('我的反馈（1）')).toBeVisible()
    await expect(page.getByText('已修正该题解析，感谢反馈！')).toBeVisible()

    const fab = page.getByRole('button', { name: '联系作者，提交反馈' })
    await expect(fab).toBeVisible()
    await fab.click()
    await expect(page.getByRole('dialog')).toBeVisible()
  })

  test('结构化讲义页 S1-1：只看必记、搜索高亮与移动端无横向溢出', async ({ page }) => {
    await page.goto('/knowledge/section/238?hl=main')
    await expect(page.getByText('结构化讲义')).toBeVisible()
    await expect(page.getByText('已高亮搜索词')).toBeVisible()

    // 验证只看必记切换（expect.toPass 避免 SSR 水合未完成时的点击竞态）
    const coreBtn = page.getByRole('button', { name: /只看必记/ })
    await expect(coreBtn).toBeVisible()
    await expect(async () => {
      const active = await page.getByRole('button', { name: /只看必记（已开启）/ }).isVisible()
      if (!active) {
        await coreBtn.click()
      }
      expect(active).toBe(true)
    }).toPass({ timeout: 5000 })

    // 验证全页无横向溢出（360px 移动端宽表自动转为纵向卡片）
    const overflow = await page.evaluate(() =>
      document.documentElement.scrollWidth > document.documentElement.clientWidth,
    )
    expect(overflow).toBe(false)
  })
})
