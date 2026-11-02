import { describe, expect, it } from 'vitest'
import { buildHomeJsonLd, buildPaperDetailJsonLd, buildPaperListJsonLd } from '../utils/seo'

describe('SEO JSON-LD builders', () => {
  it('生成首页 WebSite 与 Course 列表 JSON-LD', () => {
    const ld = buildHomeJsonLd([
      { code: 'A', name: '信息技术概述与计算思维', desc: '信息、进制、软硬件基础' },
      { code: 'S1', name: '程序设计（C 语言）', desc: '语法、控制结构、数组函数指针' },
    ])
    expect(ld['@context']).toBe('https://schema.org')
    expect(ld['@type']).toBe('WebSite')
    expect(ld.name).toContain('专转本计算机刷题')
    expect(ld.hasPart).toHaveLength(2)
    expect(ld.hasPart[0]['@type']).toBe('Course')
  })

  it('生成历年真题列表 ItemList JSON-LD', () => {
    const ld = buildPaperListJsonLd([
      { id: 1, name: '2025年江苏省普通高校专转本计算机真题', questionCount: 70, score: 150 },
    ])
    expect(ld['@type']).toBe('ItemList')
    expect(ld.numberOfItems).toBe(1)
    expect(ld.itemListElement[0].url).toBe('https://quiz.teacher-wishes.asia/papers/1')
  })

  it('生成单套真题详情 Quiz JSON-LD', () => {
    const ld = buildPaperDetailJsonLd({
      id: 1,
      name: '2025年江苏省普通高校专转本计算机真题',
      questionCount: 70,
      availableCount: 68,
      score: 150,
    })
    expect(ld['@type']).toBe('Quiz')
    expect(ld.name).toBe('2025年江苏省普通高校专转本计算机真题')
    expect(ld.url).toBe('https://quiz.teacher-wishes.asia/papers/1')
  })
})
