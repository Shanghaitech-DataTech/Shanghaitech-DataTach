# Download external resources script
Write-Host "开始下载外部资源..."

# Create directories if they don't exist
$dirs = @("libs\bootstrap", "libs\jquery", "libs\fontawesome", "libs\threejs", "libs\fonts")
foreach ($dir in $dirs) {
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

# Download Bootstrap CSS
Write-Host "下载 Bootstrap CSS..."
try {
    Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" -OutFile "libs\bootstrap\bootstrap.min.css"
    Write-Host "✓ Bootstrap CSS 下载完成"
} catch {
    Write-Host "✗ Bootstrap CSS 下载失败: $($_.Exception.Message)"
}

# Download Bootstrap JS
Write-Host "下载 Bootstrap JS..."
try {
    Invoke-WebRequest -Uri "https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" -OutFile "libs\bootstrap\bootstrap.bundle.min.js"
    Write-Host "✓ Bootstrap JS 下载完成"
} catch {
    Write-Host "✗ Bootstrap JS 下载失败: $($_.Exception.Message)"
}

# Download jQuery
Write-Host "下载 jQuery..."
try {
    Invoke-WebRequest -Uri "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" -OutFile "libs\jquery\jquery.min.js"
    Write-Host "✓ jQuery 下载完成"
} catch {
    Write-Host "✗ jQuery 下载失败: $($_.Exception.Message)"
}

# Download Three.js
Write-Host "下载 Three.js..."
try {
    Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js" -OutFile "libs\threejs\three.min.js"
    Write-Host "✓ Three.js 下载完成"
} catch {
    Write-Host "✗ Three.js 下载失败: $($_.Exception.Message)"
}

# Download Google Font (Exo 2)
Write-Host "下载 Google Fonts CSS..."
try {
    Invoke-WebRequest -Uri "https://fonts.googleapis.com/css2?family=Exo+2:wght@800&display=swap" -OutFile "libs\fonts\exo2.css"
    Write-Host "✓ Google Fonts CSS 下载完成"
} catch {
    Write-Host "✗ Google Fonts CSS 下载失败: $($_.Exception.Message)"
}

# Download FontAwesome (we'll use a different approach for this since it's a kit)
Write-Host "为 FontAwesome 创建本地替代方案..."
try {
    # Download FontAwesome Free CSS
    Invoke-WebRequest -Uri "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" -OutFile "libs\fontawesome\all.min.css"
    Write-Host "✓ FontAwesome CSS 下载完成"
} catch {
    Write-Host "✗ FontAwesome CSS 下载失败: $($_.Exception.Message)"
}

Write-Host "所有资源下载任务完成！" 