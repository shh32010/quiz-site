import { describe, expect, it } from 'vitest'
import { mount } from '@vue/test-utils'
import KnowledgeBlockRenderer from '../components/KnowledgeBlockRenderer.vue'
import type { KbBlock } from '../utils/knowledge'

describe('KnowledgeBlockRenderer Callout 样式渲染测试', () => {
  it('复习提示 (tip) 卡片拥有专属渐变容器、精简标题与胶囊徽标', () => {
    const blocks: KbBlock[] = [
      {
        id: 'tip-1',
        t: 'callout',
        kind: 'tip',
        title: '考向复习提示：计算机分类与存储程序原理',
        text: '重点考查==冯·诺依曼存储程序==原理与四代演进。',
        imp: 'core',
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    const callout = wrapper.find('.kb-callout')
    expect(callout.exists()).toBe(true)
    // 验证包含浅蓝边框与亮蓝左指示边
    expect(callout.classes().some(c => c.includes('border-blue'))).toBe(true)
    // 验证灯泡图标
    expect(callout.text()).toContain('💡')
    // 验证精简后的纯净标题（已剥离冗余前缀）
    expect(callout.find('h4').text()).toBe('计算机分类与存储程序原理')
    // 验证专属胶囊徽标
    expect(callout.text()).toContain('考向复习提示')
    // 验证正文与高亮解析
    expect(callout.html()).toContain('class="kb-mark"')
  })

  it('易错陷阱 (trap) 卡片拥有专属警示容器、醒目红字标题与避坑徽标', () => {
    const blocks: KbBlock[] = [
      {
        id: 'trap-1',
        t: 'callout',
        kind: 'trap',
        title: '高频易错陷阱：五大部件中的控制器与外存混淆',
        text: '选项常将内存储器偷换为==外存储器==，切勿踩坑。',
        imp: 'core',
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    const callout = wrapper.find('.kb-callout')
    expect(callout.exists()).toBe(true)
    // 验证包含红色警示边框
    expect(callout.classes().some(c => c.includes('border-red'))).toBe(true)
    // 验证警告图标
    expect(callout.text()).toContain('⚠️')
    // 验证精简后的主题标题
    expect(callout.find('h4').text()).toBe('五大部件中的控制器与外存混淆')
    // 验证专属易错胶囊徽标
    expect(callout.text()).toContain('高频易错陷阱')
    // 验证正文三色标记
    expect(callout.html()).toContain('class="kb-mark"')
  })

  it('普通 block 不受 callout 影响，维持原有结构', () => {
    const blocks: KbBlock[] = [
      {
        id: 'list-1',
        t: 'list',
        imp: 'core',
        title: '常规考点列表',
        items: ['考点第一条', '考点第二条'],
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    expect(wrapper.find('.kb-callout').exists()).toBe(false)
    expect(wrapper.find('.kb-block').exists()).toBe(true)
    expect(wrapper.text()).toContain('常规考点列表')
  })
})
