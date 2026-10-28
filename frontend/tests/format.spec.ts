import { describe, expect, it } from 'vitest'
import { formatText } from '../composables/format'

describe('format text', () => {
  it('还原历史 HTML 实体与换行', () => {
    expect(formatText('#include &lt;stdio.h&gt;<br/>a&nbsp;b &amp; c'))
      .toBe('#include <stdio.h>\na b & c')
  })
})
