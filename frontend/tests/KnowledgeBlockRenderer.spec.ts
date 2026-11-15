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

  it('列表与提示卡支持 \\(...\\) 行内数学公式渲染', () => {
    const blocks: KbBlock[] = [
      {
        id: 'math-list',
        t: 'list',
        imp: 'core',
        items: ['②、二分法查找：最坏比较次数为：\\(\\log_2 n\\) 次。'],
      },
      {
        id: 'math-trap',
        t: 'callout',
        kind: 'trap',
        imp: 'core',
        title: '高频易错陷阱：二分查找比较次数',
        text: '严格上界为 \\(\\lfloor \\log_2 n \\rfloor + 1\\)。',
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    const maths = wrapper.findAll('.kb-math')
    expect(maths).toHaveLength(2)
    expect(wrapper.html()).toContain('<sub>2</sub><var>n</var>')
    expect(wrapper.text()).not.toContain('\\(')
  })

  it('callout 卡片保留 \\n 多要点换行与三色高亮渲染', () => {
    const blocks: KbBlock[] = [
      {
        id: 'co-multiline',
        t: 'callout',
        kind: 'tip',
        imp: 'core',
        title: '考向复习提示：软件测试两大方法',
        text: '测试方法分类：\n• ==静态测试（不运行程序）==；\n• ==动态测试（运行程序）==。',
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    const prose = wrapper.find('.kb-callout .kb-prose p')
    expect(prose.exists()).toBe(true)
    expect(prose.text()).toContain('\n• 静态测试（不运行程序）；\n• 动态测试（运行程序）。')
    expect(wrapper.findAll('.kb-mark')).toHaveLength(2)
  })

  it('img 区块正确渲染 alt 属性与含行内标记的 figcaption', () => {
    const blocks: KbBlock[] = [
      {
        id: 'img-cap',
        t: 'img',
        src: '/kb-assets/refinement/b523-donut-chart.png',
        w: 1320,
        h: 780,
        alt: '甜甜圈图各组成部分比例对比示例',
        caption: '甜甜圈图与 ==`Donut Plot`== 组成部分比例示例',
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    const img = wrapper.find('img')
    expect(img.attributes('alt')).toBe('甜甜圈图各组成部分比例对比示例')
    const figcap = wrapper.find('figcaption')
    expect(figcap.exists()).toBe(true)
    expect(figcap.text()).toBe('甜甜圈图与 Donut Plot 组成部分比例示例')
    expect(figcap.find('code').text()).toBe('Donut Plot')
    expect(figcap.find('.kb-mark').exists()).toBe(true)
  })

  it('callout 标题中的行内反引号代码能正确解析为 code 标签', () => {
    const blocks: KbBlock[] = [
      {
        id: 'trap-code-title',
        t: 'callout',
        kind: 'trap',
        imp: 'core',
        title: '高频易错陷阱：if 条件中赋值号 `=` 误写代替等于号 `==`！',
        text: '应使用 `if (a == 0)` 判断相等。',
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    const heading = wrapper.find('.kb-callout h4')
    expect(heading.text()).toBe('if 条件中赋值号 = 误写代替等于号 ==！')
    expect(heading.findAll('code').map(c => c.text())).toEqual(['=', '=='])
  })

  it('重点注意事项 (warn) 卡片拥有专属琥珀色渐变容器、图钉图标与独立徽标', () => {
    const blocks: KbBlock[] = [
      {
        id: 'warn-1',
        t: 'callout',
        kind: 'warn',
        imp: 'important',
        title: '重点注意事项：Windows 快捷键与路径规范',
        text: '注意 ^^绝对路径与相对路径^^ 的区别。',
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    const callout = wrapper.find('.kb-callout')
    expect(callout.exists()).toBe(true)
    expect(callout.classes().some(c => c.includes('border-amber'))).toBe(true)
    expect(callout.classes()).toContain('border-l-warn-fg')
    expect(callout.text()).toContain('📌')
    expect(callout.find('h4').text()).toBe('Windows 快捷键与路径规范')
    expect(callout.text()).toContain('重点注意事项')
  })

  it('普通讲义块按 important=绿色、hard=琥珀色 渲染徽章与左边框', () => {
    const blocks: KbBlock[] = [
      {
        id: 'blk-imp',
        t: 'p',
        imp: 'important',
        title: '绿色重点块',
        text: '^^重点内容^^',
      },
      {
        id: 'blk-hard',
        t: 'p',
        imp: 'hard',
        title: '黄色难点块',
        text: '@@难点内容@@',
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    const cards = wrapper.findAll('.kb-block')
    expect(cards).toHaveLength(2)
    expect(cards[0].classes()).toContain('border-l-success-fg')
    expect(cards[1].classes()).toContain('border-l-warn-fg')
  })

  it('行内公式正确渲染度数、省略号、逻辑符号与函数复合且 ° 不嵌套 <sup>', () => {
    const blocks: KbBlock[] = [
      {
        id: 'math-ext-p',
        t: 'p',
        imp: 'hard',
        text: '@@角度与弧度换算（\\(\\pi = 180^\\circ\\)）@@，直角为 \\(90^{\\circ}\\)，复合函数 \\(f \\circ g\\)。',
      },
      {
        id: 'math-ext-list',
        t: 'list',
        imp: 'normal',
        items: [
          '自然数序列：\\(0, 1, 2, \\dots\\)',
          '逻辑运算：析取 \\(\\lor\\) 与否定 \\(\\neg\\)',
        ],
      },
    ]

    const wrapper = mount(KnowledgeBlockRenderer, {
      props: { blocks },
    })

    // 校验 @@...@@ 高亮与 \pi = 180^\circ 渲染结果
    const hardMark = wrapper.find('.kb-hard')
    expect(hardMark.exists()).toBe(true)
    expect(hardMark.find('.kb-math').text()).toBe('π=180°')

    // 校验所有行内公式都不含多余的 <sup>（避免 ° 双重缩小上漂）以及原始命令字样
    expect(wrapper.find('.kb-math sup').exists()).toBe(false)
    expect(wrapper.text()).toContain('90°')
    expect(wrapper.text()).toContain('0,1,2,…')
    expect(wrapper.text()).toContain('∨')
    expect(wrapper.text()).toContain('¬')
    expect(wrapper.text()).toContain('f∘g')
    expect(wrapper.text()).not.toContain('circ')
    expect(wrapper.text()).not.toContain('dots')
    expect(wrapper.text()).not.toContain('lor')
    expect(wrapper.text()).not.toContain('neg')
    // 校验 \circ 与 \lor 具备二元运算符语义类
    const bins = wrapper.findAll('.kb-math .kb-math-bin').map(node => node.text())
    expect(bins).toContain('∘')
    expect(bins).toContain('∨')
  })
})
