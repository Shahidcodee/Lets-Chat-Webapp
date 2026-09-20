$env:TMP="D:\temp"
$env:TEMP="D:\temp"
$env:npm_config_cache="D:\npm-cache"
if (!(Test-Path -Path "D:\temp")) { New-Item -ItemType Directory -Force -Path "D:\temp" | Out-Null }
if (!(Test-Path -Path "D:\npm-cache")) { New-Item -ItemType Directory -Force -Path "D:\npm-cache" | Out-Null }
npm run dev:full
