# =============================================================================
#  Kit de tesis doctoral - Instalador para Windows 10/11
# =============================================================================
#  Lo mas facil: doble clic en "instalar-windows.bat" (en esta misma carpeta).
#
#  Que hace:
#    1. Instala Obsidian, Zotero y Typst con winget (el instalador oficial de Windows)
#    2. Crea tu vault de tesis en Documentos\Mi Tesis con todas las plantillas
#    3. (Opcional) Instala el asistente IA Hermes y sus skills
#
#  Es seguro ejecutarlo varias veces: nunca sobrescribe tu vault.
# =============================================================================

$ErrorActionPreference = 'Continue'
$KitDir = Split-Path -Parent $PSScriptRoot
$Docs   = [Environment]::GetFolderPath('MyDocuments')
$Vault  = Join-Path $Docs 'Mi Tesis'
$Pendientes = New-Object System.Collections.ArrayList

function Ok($m)   { Write-Host "  [OK] $m" -ForegroundColor Green }
function Aviso($m){ Write-Host "  [!]  $m" -ForegroundColor Yellow }
function Paso($n, $m) { Write-Host ""; Write-Host "[$n] $m" -ForegroundColor Cyan }

Write-Host ""
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host "      Kit de tesis doctoral - Instalador"      -ForegroundColor Magenta
Write-Host "  ============================================" -ForegroundColor Magenta
Write-Host "  Tu vault quedará en: $Vault"

# --- 1. Aplicaciones -----------------------------------------------------------
Paso '1/3' 'Instalando Obsidian, Zotero y Typst'
$HayWinget = [bool](Get-Command winget -ErrorAction SilentlyContinue)
if (-not $HayWinget) {
    Aviso 'No encontré winget. Instala "Instalador de aplicación" (App Installer) desde Microsoft Store y vuelve a ejecutar.'
    [void]$Pendientes.Add('Obsidian: https://obsidian.md/download')
    [void]$Pendientes.Add('Zotero: https://www.zotero.org/download/')
    [void]$Pendientes.Add('Typst (opcional): usa https://typst.app en el navegador')
}

function Instalar-App($Id, $Nombre, $Url) {
    if (-not $HayWinget) { return }
    winget list --id $Id -e --accept-source-agreements *> $null
    if ($LASTEXITCODE -eq 0) { Ok "$Nombre ya instalado"; return }
    Write-Host "  -> Instalando $Nombre (puede tardar unos minutos)..."
    winget install --id $Id -e --silent --accept-package-agreements --accept-source-agreements *> $null
    if ($LASTEXITCODE -eq 0) { Ok "$Nombre instalado" }
    else { Aviso "No se pudo instalar $Nombre"; [void]$Pendientes.Add("$Nombre`: descárgalo en $Url") }
}

Instalar-App 'Obsidian.Obsidian'     'Obsidian' 'https://obsidian.md/download'
Instalar-App 'DigitalScholar.Zotero' 'Zotero'   'https://www.zotero.org/download/'
Instalar-App 'Typst.Typst'           'Typst'    'https://typst.app (versión web)'

# --- 2. Vault ------------------------------------------------------------------
Paso '2/3' 'Creando tu vault de tesis'
if (Test-Path $Vault) {
    Ok "Ya existe $Vault - no lo toco (tus notas están a salvo)"
} else {
    Copy-Item -Path (Join-Path $KitDir '3-organizar-obsidian\vault-plantilla') -Destination $Vault -Recurse
    Get-ChildItem -Path $Vault -Recurse -Force -Filter '.gitkeep' | Remove-Item -Force
    Copy-Item (Join-Path $KitDir '4-escribir\plantilla-tesis.typ')       (Join-Path $Vault '04 - Escritura\tesis.typ')
    Copy-Item (Join-Path $KitDir '4-escribir\referencias.bib')           (Join-Path $Vault '04 - Escritura\referencias.bib')
    Copy-Item (Join-Path $KitDir '5-presentar\plantilla-defensa.pptx')   (Join-Path $Vault '06 - Defensa\plantilla-defensa.pptx')
    Ok "Vault creado en: $Vault"
}

# --- 3. Asistente IA (opcional) -----------------------------------------------
Paso '3/3' 'Asistente IA (opcional)'
Write-Host '  El asistente IA (Hermes) busca literatura, revisa tus notas y crea presentaciones.'
Write-Host '  Necesita una API key de OpenRouter (pago por uso). Todo lo demás del kit funciona sin él.'
$Resp = Read-Host '  ¿Instalarlo ahora? (s/n)'
if ($Resp -match '^[sSyY]') {
    if ($HayWinget) {
        if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
            Write-Host '  -> Instalando Git (incluye Git Bash)...'
            winget install --id Git.Git -e --silent --accept-package-agreements --accept-source-agreements *> $null
        }
        if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
            Write-Host '  -> Instalando Node.js...'
            winget install --id OpenJS.NodeJS.LTS -e --silent --accept-package-agreements --accept-source-agreements *> $null
        }
        # Recargar PATH para ver lo recién instalado
        $env:Path = [Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [Environment]::GetEnvironmentVariable('Path','User')
    }
    $Bash = @("$env:ProgramFiles\Git\bin\bash.exe", "${env:ProgramFiles(x86)}\Git\bin\bash.exe", "$env:LOCALAPPDATA\Programs\Git\bin\bash.exe") |
            Where-Object { $_ -and (Test-Path $_) } | Select-Object -First 1
    if ($Bash) {
        $env:VAULT = $Vault
        & $Bash (Join-Path $KitDir 'install.sh') --solo-ia
    } else {
        Aviso 'No encontré Git Bash. Instala Git desde https://git-scm.com y vuelve a ejecutar.'
        [void]$Pendientes.Add('Asistente IA: ver instalacion\INSTALAR-WINDOWS.md, sección "Asistente IA"')
    }
} else {
    Ok 'Saltado. Puedes instalarlo después ejecutando de nuevo este instalador.'
}

# --- Resumen -------------------------------------------------------------------
Write-Host ''
Write-Host '  ============================================' -ForegroundColor Magenta
Write-Host '   Listo.' -ForegroundColor Green
Write-Host '  ============================================' -ForegroundColor Magenta
Write-Host "  Tu vault: $Vault"
Write-Host "  Siguiente paso: abre Obsidian -> 'Abrir carpeta como vault' -> elige 'Mi Tesis'."
Write-Host '  Luego sigue GUIA-RAPIDA.md (30 minutos).'
if ($Pendientes.Count -gt 0) {
    Write-Host ''
    Write-Host '  Pendientes:' -ForegroundColor Yellow
    foreach ($p in $Pendientes) { Write-Host "   - $p" }
}
Write-Host ''
