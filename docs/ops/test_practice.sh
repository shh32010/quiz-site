#!/bin/bash
# 刷题闭环端到端测试
set -u
B=http://127.0.0.1:8080

echo "=== 1. 登录 ==="
if [ -z "${QUIZ_TEST_USER:-}" ] || [ -z "${QUIZ_TEST_PASS:-}" ]; then
  echo "请先通过环境变量设置测试账号：QUIZ_TEST_USER / QUIZ_TEST_PASS"
  exit 1
fi
LOGIN_BODY=$(python3 -c 'import json,os; print(json.dumps({"username":os.environ["QUIZ_TEST_USER"],"password":os.environ["QUIZ_TEST_PASS"]}))')
TOKEN=$(curl -s -X POST $B/api/auth/login -H 'Content-Type: application/json' \
  -d "$LOGIN_BODY" \
  | python3 -c 'import sys,json; print(json.load(sys.stdin).get("token",""))')
echo "token 长度: ${#TOKEN}"
if [ -z "$TOKEN" ]; then echo "登录失败"; exit 1; fi

echo "=== 2. 开始章节练习（章节 1，限 5 题）==="
START=$(curl -s -X POST $B/api/practice/start -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' -d '{"mode":"chapter","target":"1","limit":5}')
echo "$START"
SID=$(echo "$START" | python3 -c 'import sys,json; print(json.load(sys.stdin).get("sessionId",""))')
if [ -z "$SID" ]; then echo "建会话失败"; exit 1; fi

echo "=== 3. 取第一题 ==="
NEXT=$(curl -s -H "Authorization: Bearer $TOKEN" "$B/api/practice/$SID/next")
echo "${NEXT:0:260}"
QID=$(echo "$NEXT" | python3 -c 'import sys,json; d=json.load(sys.stdin); print(d["question"]["id"] if d.get("kind")=="question" else "")')
echo "questionId=$QID"

echo "=== 4. 提交作答 A ==="
curl -s -X POST "$B/api/practice/$SID/answer" -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' -d "{\"questionId\":$QID,\"answer\":\"A\"}"
echo

echo "=== 5. 复盘（应只在作答后可读）==="
curl -s -H "Authorization: Bearer $TOKEN" "$B/api/practice/$SID/review/$QID" | head -c 200
echo

echo "=== 6. 交卷 ==="
curl -s -X POST "$B/api/practice/$SID/finish" -H "Authorization: Bearer $TOKEN"
echo

echo "=== 7. 未登录访问（应 403）==="
curl -s -o /dev/null -w 'HTTP %{http_code}\n' "$B/api/practice/$SID/next"
