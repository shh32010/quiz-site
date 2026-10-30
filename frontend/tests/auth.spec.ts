import { describe, expect, it } from 'vitest'
import { validateRegisterPassword } from '../utils/auth'

describe('register password confirmation', () => {
  it('确认密码为空时提示再次输入', () => {
    expect(validateRegisterPassword('secret123', '')).toBe('请再次输入密码')
  })

  it('两次密码不一致时提示不一致', () => {
    expect(validateRegisterPassword('secret123', 'secret456')).toBe('两次输入的密码不一致')
  })

  it('两次密码一致时通过', () => {
    expect(validateRegisterPassword('secret123', 'secret123')).toBe('')
  })
})
