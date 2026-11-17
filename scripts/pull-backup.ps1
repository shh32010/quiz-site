# 每天从阿里云 ECS 拉取题库备份到本机 D:\Backups\quiz-aliyun
# 数据库 dump 每天拉最新一份；图片包只在本地没有同名文件时拉取
# 由 Windows 计划任务 QuizBackupPull 调用
$ErrorActionPreference = 'Stop'
$dest = 'D:\Backups\quiz-aliyun'
$log = Join-Path $dest 'pull.log'
$ssh = 'C:\Windows\System32\OpenSSH\ssh.exe'
$scp = 'C:\Windows\System32\OpenSSH\scp.exe'
$target = 'root@101.37.14.222'
$hostIp = '101.37.14.222'
$key = 'C:\Users\002\.ssh\aliyun.pem'
$known = 'C:\Users\002\.ssh\known_hosts'
$sshArgs = @('-i', $key, '-o', 'BatchMode=yes', '-o', 'ConnectTimeout=15',
    '-o', 'StrictHostKeyChecking=accept-new', '-o', "UserKnownHostsFile=$known")

New-Item -ItemType Directory -Force -Path $dest | Out-Null
$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'

function Write-Log([string]$message) {
    "$ts $message" | Out-File -Append -Encoding utf8 $log
}

# 计划任务可能在睡眠唤醒后立刻启动，先等网络与 22 端口就绪（最多 10 分钟）
function Wait-RemoteReady {
    $deadline = (Get-Date).AddMinutes(10)
    while ((Get-Date) -lt $deadline) {
        try {
            $probe = Test-NetConnection -ComputerName $hostIp -Port 22 -WarningAction SilentlyContinue
            if ($probe.TcpTestSucceeded) { return }
        } catch { }
        Start-Sleep -Seconds 15
    }
    throw "等待 $hostIp:22 超时（10 分钟）"
}

# 统一重试：失败后退避 20/40 秒，共 3 次
function Invoke-Retry([scriptblock]$Action, [string]$Label, [int]$Attempts = 3) {
    for ($i = 1; $i -le $Attempts; $i++) {
        try {
            $result = & $Action
            if ($null -eq $result -or ($result -is [array] -and $result.Count -eq 0) -or
                ($result -is [string] -and $result.Trim() -eq '')) {
                throw "空输出"
            }
            return $result
        } catch {
            if ($i -eq $Attempts) { throw "$Label 失败（第 $i 次）：$($_.Exception.Message)" }
            Start-Sleep -Seconds (20 * $i)
        }
    }
}

try {
    Wait-RemoteReady

    # 先取远端最新文件路径
    $latestDump = Invoke-Retry {
        $out = & $ssh @sshArgs $target "ls -1t /opt/quiz-backups/quiz-*.dump 2>/dev/null | head -1"
        if ($LASTEXITCODE -ne 0) { throw "ssh exit $LASTEXITCODE" }
        ($out | Out-String).Trim()
    } '获取远端 dump 列表'
    if (-not $latestDump) { throw "远程没有 quiz-*.dump" }

    $latestAssets = ''
    try {
        $latestAssets = (& $ssh @sshArgs $target "ls -1t /opt/quiz-backups/assets-*.tar.gz 2>/dev/null | head -1" | Out-String).Trim()
    } catch {
        $latestAssets = ''
    }

    Invoke-Retry {
        & $scp @sshArgs -q "${target}:$latestDump" $dest
        if ($LASTEXITCODE -ne 0) { throw "scp dump exit $LASTEXITCODE" }
        "ok"
    } '拉取 dump' | Out-Null

    # 图片包每周日才生成；本地已有同名文件就跳过，避免每天重复拉 40MB
    # 图片拉取失败不阻断数据库备份，只记录退出码
    $assetCode = 'none'
    $assetAction = 'none'
    if ($latestAssets -ne '') {
        $assetName = Split-Path $latestAssets -Leaf
        $localAsset = Join-Path $dest $assetName
        if (Test-Path $localAsset) {
            $assetCode = 'skip'
            $assetAction = 'exists'
        } else {
            & $scp @sshArgs -q "${target}:$latestAssets" $dest
            $assetCode = $LASTEXITCODE
            if ($LASTEXITCODE -eq 0) { $assetAction = 'pulled' } else { $assetAction = 'failed' }
        }
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
    $dumpName = Split-Path $latestDump -Leaf
    Write-Log "OK dump=$dumpName dumps=$dumps assets=$assets asset_action=$assetAction asset_scp_exit=$assetCode"
} catch {
    Write-Log "FAIL: $($_.Exception.Message)"
    exit 1
}
