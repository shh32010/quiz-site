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
    await page.route('**/api/guest/questions**', async (route) => {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify({
          rows: [
            {
              id: 1001,
              questionType: 1,
              stem: '1 Byte 等于多少 bit？',
              options: { A: '4', B: '8', C: '16', D: '32' },
              correct: 'B',
              analysis: '1 字节 = 8 比特。',
            },
            {
              id: 1002,
              questionType: 1,
              stem: '二进制 10 对应的十进制是？',
              options: { A: '1', B: '2', C: '3', D: '4' },
              correct: 'B',
              analysis: '10(2)=2(10)。',
            },
          ],
        }),
      })
    })

    await page.goto('/practice?mode=chapter&target=1')
    await expect(page.getByText('1 Byte 等于多少 bit？')).toBeVisible()

    // 单选点击错误项 A 立即判分并展示答案解析
    await page.getByRole('button', { name: /A\s+4/ }).click()
    await expect(page.getByText('1 字节 = 8 比特。')).toBeVisible()

    // 游客点击退出按钮弹出保存进度引导
    await page.getByRole('button', { name: /退出/ }).click()
    await expect(page.getByText('登录以记录学习进度')).toBeVisible()
  })

  test('悬浮联系作者反馈：支持选择分类直接打开抽屉', async ({ page }) => {
    await page.route('**/api/chapters/tree**', async (route) => {
      await route.fulfill({ status: 200, contentType: 'application/json', body: '[]' })
    })
    await page.addInitScript(() => {
      localStorage.setItem('quiz_announcement_daily', 'skip')
    })

    await page.goto('/papers')
    const fab = page.getByRole('button', { name: /反馈/ }).first()
    await expect(fab).toBeVisible()
    await fab.click()
    await expect(page.getByRole('dialog')).toBeVisible()
  })
})
