# 每周从阿里云 ECS 拉取题库备份到本机 D:\Backups\quiz-aliyun
# 由 Windows 计划任务 QuizBackupPull 调用
$ErrorActionPreference = 'Stop'
$dest = 'D:\Backups\quiz-aliyun'
$log = Join-Path $dest 'pull.log'
$ssh = 'C:\Windows\System32\OpenSSH\ssh.exe'
$scp = 'C:\Windows\System32\OpenSSH\scp.exe'
$target = 'root@101.37.14.222'
$key = 'C:\Users\002\.ssh\aliyun.pem'
$known = 'C:\Users\002\.ssh\known_hosts'
$sshArgs = @('-i', $key, '-o', 'BatchMode=yes', '-o', 'StrictHostKeyChecking=accept-new',
    '-o', "UserKnownHostsFile=$known")
New-Item -ItemType Directory -Force -Path $dest | Out-Null
$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
try {
    # get latest remote paths first
    $latestDump = (& $ssh @sshArgs $target "ls -1t /opt/quiz-backups/quiz-*.dump 2>/dev/null | head -1").Trim()
    $latestAssets = (& $ssh @sshArgs $target "ls -1t /opt/quiz-backups/assets-*.tar.gz 2>/dev/null | head -1").Trim()
    if (-not $latestDump) { throw "远程没有 quiz-*.dump" }

    & $scp @sshArgs -q "${target}:$latestDump" $dest
    if ($LASTEXITCODE -ne 0) { throw "scp dump 失败，exit $LASTEXITCODE" }

    # 图片包每周日才生成；没有时跳过，不视为整体失败
    $assetCode = 'none'
    if ($latestAssets -ne '') {
        & $scp @sshArgs -q "${target}:$latestAssets" $dest
        $assetCode = $LASTEXITCODE
    }

    # 本地保留：数据库 30 天，图片包 56 天
    Get-ChildItem $dest -Filter 'quiz-*.dump' |
        Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } |
        Remove-Item -Force
    Get-ChildItem $dest -Filter 'assets-*.tar.gz' |
        Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-56) } |
        Remove-Item -Force

    $dumps = (Get-ChildItem $dest -Filter 'quiz-*.dump' | Measure-Object).Count
    $assets = (Get-ChildItem $dest -Filter 'assets-*.tar.gz' | Measure-Object).Count
    "$ts OK dumps=$dumps assets=$assets asset_scp_exit=$assetCode" |
        Out-File -Append -Encoding utf8 $log
} catch {
    "$ts FAIL: $($_.Exception.Message)" | Out-File -Append -Encoding utf8 $log
    exit 1
}
