# Script de Instalação de Extensões do VS Code
# Salve como install-extensions.ps1

Write-Host "Instalando extensões do VS Code..." -ForegroundColor Green

# Caminho do arquivo de extensões (pode ajustar se necessário)
$extensionsFile = "extensions.txt"

# Verificar se o arquivo existe
if (-not (Test-Path $extensionsFile)) {
    Write-Host "Arquivo $extensionsFile não encontrado!" -ForegroundColor Red
    exit 1
}

# Ler extensões do arquivo
$extensions = Get-Content $extensionsFile

# Instalar cada extensão
$total = $extensions.Count
$current = 0

foreach ($extension in $extensions) {
    $current++
    $progress = [math]::Round(($current / $total) * 100, 2)
    Write-Progress -Activity "Instalando extensões" -Status "$current de $total ($progress%)" -PercentComplete $progress -CurrentOperation "Instalando: $extension"
    
    Write-Host "Instalando: $extension" -ForegroundColor Cyan
    code --install-extension $extension
}

Write-Host "`nInstalação concluída! $total extensões foram processadas." -ForegroundColor Green
Write-Host "Pressione qualquer tecla para continuar..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")