#!/bin/bash
# 新站全站验收
set -u
B=http://127.0.0.1:8080
F=http://127.0.0.1:3100

echo "=== 一、页面（经前端）==="
for u in / /chapters /chapters/1 /papers /papers/280 /compose /wrong /report /login /admin /practice; do
  printf '  %-16s ' "$u"
  curl -s -o /dev/null -w '%{http_code}\n' --max-time 30 "$F$u"
done

echo "=== 二、公开接口 ==="
for u in "/api/health" "/api/chapters/tree?subject=4" "/api/courses" "/api/papers" "/api/questions?chapter=1"; do
  printf '  %-38s ' "$u"
  curl -s -o /dev/null -w '%{http_code}\n' --max-time 30 "$B$u"
done

echo "=== 三、认证与权限 ==="
TOKEN=$(curl -s -X POST $B/api/auth/login -H 'Content-Type: application/json' \
  -d '{"username":"testuser01","password":"test123456"}' \
  | python3 -c 'import sys,json; print(json.load(sys.stdin).get("token",""))')
echo "  登录 token 长度: ${#TOKEN}"
printf '  未登录 /api/wrong     '; curl -s -o /dev/null -w '%{http_code}\n' "$B/api/wrong"
printf '  已登录 /api/wrong     '; curl -s -o /dev/null -w '%{http_code}\n' -H "Authorization: Bearer $TOKEN" "$B/api/wrong"
printf '  普通用户 /api/admin   '; curl -s -o /dev/null -w '%{http_code}\n' -H "Authorization: Bearer $TOKEN" "$B/api/admin/stats"

echo "=== 四、完整刷题链路 ==="
SID=$(curl -s -X POST $B/api/practice/start -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' -d '{"mode":"chapter","target":"1","limit":3}' \
  | python3 -c 'import sys,json; print(json.load(sys.stdin).get("sessionId",""))')
echo "  会话: $SID"
QID=$(curl -s -H "Authorization: Bearer $TOKEN" "$B/api/practice/$SID/next" \
  | python3 -c 'import sys,json; d=json.load(sys.stdin); print(d["question"]["id"] if d.get("kind")=="question" else "")')
echo "  取题: $QID"
printf '  提交 A: '; curl -s -X POST "$B/api/practice/$SID/answer" -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' -d "{\"questionId\":$QID,\"answer\":\"A\"}"; echo
printf '  复盘:   '; curl -s -H "Authorization: Bearer $TOKEN" "$B/api/practice/$SID/review/$QID" | head -c 80; echo
printf '  交卷:   '; curl -s -X POST "$B/api/practice/$SID/finish" -H "Authorization: Bearer $TOKEN"; echo

echo "=== 五、组卷 / 报告 / AI ==="
printf '  组卷:   '; curl -s -X POST $B/api/compose/start -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' -d '{"subject":5}'; echo
printf '  报告:   '; curl -s -H "Authorization: Bearer $TOKEN" $B/api/report | head -c 100; echo
printf '  AI:     '; curl -s -X POST $B/api/ai/explain -H "Authorization: Bearer $TOKEN" \
  -H 'Content-Type: application/json' -d '{"questionId":334269,"mode":"explain"}' --max-time 60 \
  | python3 -c 'import sys,json; d=json.load(sys.stdin); print("cached=",d.get("cached"),"len=",len(d.get("content","")))'
