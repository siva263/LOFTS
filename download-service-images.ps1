$ErrorActionPreference = 'Stop'

$destDir = "C:\Users\SIVA\CascadeProjects\handyman-manchester\assets\images\services"
New-Item -ItemType Directory -Force -Path $destDir | Out-Null

$names = @(
  'flat-pack-assembly',
  'tv-wall-mounting',
  'bath-shower-reseal',
  'carpentry',
  'general-maintenance',
  'bathroom-fitting',
  'kitchen-repairs',
  'painting-decorating',
  'tiling-repairs'
)

foreach ($n in $names) {
  $url = "https://picsum.photos/seed/$n/1600/1200.jpg"
  $dest = Join-Path $destDir "$n.jpg"
  Write-Host "Downloading $n -> $dest"
  Invoke-WebRequest -Uri $url -OutFile $dest
}

Write-Host "\nSaved files:"
Get-ChildItem $destDir | Select-Object Name, Length
