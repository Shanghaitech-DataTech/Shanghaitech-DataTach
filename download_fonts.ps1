# Download font files
Write-Host "Starting font download..."

# Create webfonts directory for FontAwesome
if (!(Test-Path "libs\fontawesome\webfonts")) {
    New-Item -ItemType Directory -Path "libs\fontawesome\webfonts" -Force | Out-Null
}

# Download Google Font TTF file for Exo 2
Write-Host "Downloading Exo 2 font..."
try {
    Invoke-WebRequest -Uri "https://fonts.gstatic.com/s/exo2/v25/7cH1v4okm5zmbvwkAx_sfcEuiD8jPvWcPg.ttf" -OutFile "libs\fonts\exo2.ttf"
    Write-Host "OK - Exo 2 font downloaded"
} catch {
    Write-Host "ERROR - Exo 2 font download failed: $($_.Exception.Message)"
}

# Download FontAwesome font files
$fontAwesomeFonts = @(
    @{url="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-brands-400.woff2"; file="fa-brands-400.woff2"},
    @{url="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-brands-400.ttf"; file="fa-brands-400.ttf"},
    @{url="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-regular-400.woff2"; file="fa-regular-400.woff2"},
    @{url="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-regular-400.ttf"; file="fa-regular-400.ttf"},
    @{url="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-solid-900.woff2"; file="fa-solid-900.woff2"},
    @{url="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-solid-900.ttf"; file="fa-solid-900.ttf"},
    @{url="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-v4compatibility.woff2"; file="fa-v4compatibility.woff2"},
    @{url="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/webfonts/fa-v4compatibility.ttf"; file="fa-v4compatibility.ttf"}
)

foreach ($font in $fontAwesomeFonts) {
    Write-Host "Downloading FontAwesome font: $($font.file)"
    try {
        Invoke-WebRequest -Uri $font.url -OutFile "libs\fontawesome\webfonts\$($font.file)"
        Write-Host "OK - $($font.file) downloaded"
    } catch {
        Write-Host "ERROR - $($font.file) download failed: $($_.Exception.Message)"
    }
}

Write-Host "Font download tasks completed!" 