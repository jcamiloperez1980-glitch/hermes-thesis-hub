#!/usr/bin/env bash
#=============================================================================
# Hermes Thesis Hub — Instalador Automático
#=============================================================================
# Este script instala todo el ecosistema Hermes Thesis Hub:
#   - Hermes Agent (si no está instalado)
#   - API key de OpenRouter (se configura en ~/.hermes/.env)
#   - Skills: Ponytail, Humanizer, Find-Skills, PowerPoint-PPT, OpenAlex
#   - Aplicaciones: Obsidian, Zotero
#   - Herramientas: Typst, python-pptx, Himalaya
#   - Plantillas: Typst APA, vault Obsidian
#   - Presentación PowerPoint de bienvenida
#=============================================================================

set -e

GREEN='\033[0;32m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'
BOLD='\033[1m'

HUB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$HOME/.agents/skills"
OBSIDIAN_VAULT="$HOME/Documents/Hermes Thesis Hub"
HERMES_ENV="$HOME/.hermes/.env"

echo -e "${PURPLE}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║                                                          ║"
echo "║   🎓  Hermes Thesis Hub  🎓                              ║"
echo "║   Tu ecosistema completo de investigación               ║"
echo "║                                                          ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# ── 1. Verificar / Instalar Hermes ──
echo -e "\n${BOLD}${CYAN}[1/10]${NC} Verificando Hermes Agent..."
if command -v hermes &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} Hermes $(hermes --version 2>/dev/null | head -1) detectado"
else
    echo -e "  ${YELLOW}⚠${NC} Hermes no está instalado. Instalando..."
    curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
    echo -e "  ${GREEN}✓${NC} Hermes instalado"
fi

# ── 2. Configurar API key de OpenRouter ──
echo -e "\n${BOLD}${CYAN}[2/10]${NC} Configurando API key de OpenRouter..."
mkdir -p "$HOME/.hermes"
touch "$HERMES_ENV"
if grep -q "OPENROUTER_API_KEY" "$HERMES_ENV" 2>/dev/null; then
    echo -e "  ${GREEN}✓${NC} OPENROUTER_API_KEY ya configurada en Hermes"
else
    if [ -z "$OPENROUTER_API_KEY" ]; then
        # Pedirla en pantalla si la terminal es interactiva
        if [ -t 0 ]; then
            read -r -p "  Pega la API key de OpenRouter (sk-or-...): " OPENROUTER_API_KEY
        fi
    fi
    if [ -n "$OPENROUTER_API_KEY" ]; then
        echo "OPENROUTER_API_KEY=$OPENROUTER_API_KEY" >> "$HERMES_ENV"
        echo -e "  ${GREEN}✓${NC} OPENROUTER_API_KEY guardada en $HERMES_ENV"
    else
        echo -e "  ${YELLOW}⚠${NC} No se configuró la key. Hazlo luego con:"
        echo -e "     echo 'OPENROUTER_API_KEY=sk-or-...' >> $HERMES_ENV"
    fi
fi

# ── 3. Skills via npx skills ──
echo -e "\n${BOLD}${CYAN}[3/10]${NC} Instalando skills del ecosistema..."
SKILLS=(
    "practicalswan/agent-skills@powerpoint-ppt"
    "blader/humanizer"
    "wanshuiyin/auto-claude-code-research-in-sleep@openalex"
)

for skill in "${SKILLS[@]}"; do
    name=$(echo "$skill" | cut -d'@' -f2-)
    if [ -d "$SKILLS_DIR/$name" ]; then
        echo -e "  ${GREEN}✓${NC} $name ya instalado"
    else
        echo -e "  ${YELLOW}→${NC} Instalando $name..."
        npx skills add "$skill" 2>/dev/null && echo -e "  ${GREEN}✓${NC} $name instalado" || echo -e "  ${RED}✗${NC} Error instalando $name"
    fi
done

# Find-Skills (repo oficial vercel-labs/skills)
if [ -d "$SKILLS_DIR/find-skills" ]; then
    echo -e "  ${GREEN}✓${NC} find-skills ya instalado"
else
    echo -e "  ${YELLOW}→${NC} Instalando find-skills..."
    npx skills add https://github.com/vercel-labs/skills --skill find-skills 2>/dev/null \
        && echo -e "  ${GREEN}✓${NC} find-skills instalado" \
        || echo -e "  ${RED}✗${NC} Error instalando find-skills"
fi

# ── 4. Skills via Hermes plugins ──
echo -e "\n${BOLD}${CYAN}[4/10]${NC} Instalando plugins Hermes..."
PLUGINS=(
    "DietrichGebert/ponytail"
)
if hermes plugins list --plain --no-bundled 2>/dev/null | grep -q ponytail; then
    echo -e "  ${GREEN}✓${NC} Ponytail plugin ya instalado"
else
    hermes plugins install DietrichGebert/ponytail --enable 2>/dev/null
    echo -e "  ${GREEN}✓${NC} Ponytail plugin instalado"
fi

# ── 5. Instalar Typst ──
echo -e "\n${BOLD}${CYAN}[5/10]${NC} Instalando Typst (composición tipográfica)..."
if command -v typst &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} Typst $(typst --version) detectado"
else
    if command -v winget &>/dev/null; then
        winget install Typst.Typst 2>/dev/null && echo -e "  ${GREEN}✓${NC} Typst instalado via winget"
    else
        echo -e "  ${YELLOW}⚠${NC} Instala Typst manualmente desde: https://github.com/typst/typst/releases"
    fi
fi

# Añadir Typst al PATH si es Windows
if [ -f "$HOME/AppData/Local/Microsoft/WinGet/Packages/Typst.Typst_Microsoft.Winget.Source_8wekyb3d8bbwe/typst-x86_64-pc-windows-msvc/typst.exe" ]; then
    TYPST_PATH=$(dirname "$(find "$HOME/AppData/Local/Microsoft/WinGet/Packages" -name "typst.exe" 2>/dev/null | head -1)")
    if ! echo "$PATH" | grep -q "$TYPST_PATH"; then
        echo 'export PATH="$PATH:'"$TYPST_PATH"'"' >> "$HOME/.bashrc"
        echo -e "  ${GREEN}✓${NC} Typst añadido al PATH (~/.bashrc)"
    fi
fi

# ── 6. Instalar python-pptx ──
echo -e "\n${BOLD}${CYAN}[6/10]${NC} Instalando python-pptx (generación PowerPoint)..."
python -m pip install python-pptx 2>/dev/null && echo -e "  ${GREEN}✓${NC} python-pptx $(python -c 'import pptx; print(pptx.__version__)') instalado"

# ── 7. Instalar Himalaya (email CLI) ──
echo -e "\n${BOLD}${CYAN}[7/10]${NC} Instalando Himalaya CLI (correo)..."
if command -v himalaya &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} Himalaya $(himalaya --version 2>/dev/null | head -1) detectado"
else
    HIMALAYA_DIR="$HOME/himalaya"
    if [ ! -f "$HIMALAYA_DIR/himalaya.exe" ]; then
        mkdir -p "$HIMALAYA_DIR"
        curl -sLo "/tmp/himalaya.zip" "https://github.com/pimalaya/himalaya/releases/download/v2.0.0/himalaya.x86_64-windows.zip"
        python -c "import zipfile; zipfile.ZipFile('/tmp/himalaya.zip').extractall('$HIMALAYA_DIR')" 2>/dev/null
        echo 'export PATH="$PATH:'"$HIMALAYA_DIR"'"' >> "$HOME/.bashrc"
        echo -e "  ${GREEN}✓${NC} Himalaya instalado en $HIMALAYA_DIR"
    else
        echo -e "  ${GREEN}✓${NC} Himalaya ya instalado"
    fi
fi

# ── 8. Instalar Obsidian y Zotero ──
echo -e "\n${BOLD}${CYAN}[8/10]${NC} Instalando Obsidian y Zotero..."
if command -v winget &>/dev/null; then
    if winget list --id Obsidian.Obsidian 2>/dev/null | grep -q Obsidian; then
        echo -e "  ${GREEN}✓${NC} Obsidian ya instalado"
    else
        winget install --id Obsidian.Obsidian --accept-package-agreements --accept-source-agreements 2>/dev/null \
            && echo -e "  ${GREEN}✓${NC} Obsidian instalado" \
            || echo -e "  ${RED}✗${NC} Error instalando Obsidian — descárgalo de https://obsidian.md"
    fi
    if winget list --id DigitalScholar.Zotero 2>/dev/null | grep -q Zotero; then
        echo -e "  ${GREEN}✓${NC} Zotero ya instalado"
    else
        winget install --id DigitalScholar.Zotero --accept-package-agreements --accept-source-agreements 2>/dev/null \
            && echo -e "  ${GREEN}✓${NC} Zotero instalado" \
            || echo -e "  ${RED}✗${NC} Error instalando Zotero — descárgalo de https://www.zotero.org"
    fi
else
    echo -e "  ${YELLOW}⚠${NC} winget no disponible. Instala manualmente:"
    echo -e "     Obsidian: https://obsidian.md  |  Zotero: https://www.zotero.org"
fi

# ── 9. Crear vault de Obsidian ──
echo -e "\n${BOLD}${CYAN}[9/10]${NC} Creando vault de Obsidian..."
if [ ! -d "$OBSIDIAN_VAULT/.obsidian" ]; then
    mkdir -p "$OBSIDIAN_VAULT"
    # Copy template notes
    if [ -d "$HUB_DIR/obsidian" ]; then
        cp -r "$HUB_DIR/obsidian/"* "$OBSIDIAN_VAULT/" 2>/dev/null
    fi
    echo -e "  ${GREEN}✓${NC} Vault creado en: $OBSIDIAN_VAULT"
    echo -e "  ${YELLOW}ℹ${NC} Ábrelo en Obsidian: Administrar Vaults → Abrir → $OBSIDIAN_VAULT"
else
    echo -e "  ${GREEN}✓${NC} Vault ya existe en $OBSIDIAN_VAULT"
fi

# Export OBSIDIAN_VAULT_PATH al .env de Hermes
if ! grep -q "OBSIDIAN_VAULT_PATH" "$HERMES_ENV" 2>/dev/null; then
    echo "OBSIDIAN_VAULT_PATH=$OBSIDIAN_VAULT" >> "$HERMES_ENV"
    echo -e "  ${GREEN}✓${NC} OBSIDIAN_VAULT_PATH configurado en Hermes"
fi

# ── 10. Copiar presentación PowerPoint ──
echo -e "\n${BOLD}${CYAN}[10/10]${NC} Copiando presentación de bienvenida..."
if [ -f "$HUB_DIR/assets/skills-hermes-tesis.pptx" ]; then
    cp "$HUB_DIR/assets/skills-hermes-tesis.pptx" "$HOME/Desktop/Hermes Thesis Hub.pptx" 2>/dev/null || true
    echo -e "  ${GREEN}✓${NC} Presentación copiada al escritorio"
fi

echo -e "\n${PURPLE}══════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}${BOLD}  ✅  Hermes Thesis Hub instalado con éxito!${NC}"
echo -e "${PURPLE}══════════════════════════════════════════════════════════${NC}"
echo -e ""
echo -e "  ${BOLD}Skills instalados:${NC}"
echo -e "  ${GREEN}•${NC} Ponytail     — Código mínimo y eficiente"
echo -e "  ${GREEN}•${NC} Humanizer    — Texto natural sin marcas AI"
echo -e "  ${GREEN}•${NC} Find-Skills  — Descubridor de skills"
echo -e "  ${GREEN}•${NC} PowerPoint   — Presentaciones profesionales"
echo -e "  ${GREEN}•${NC} OpenAlex     — 250M+ artículos académicos reales"
echo -e ""
echo -e "  ${BOLD}Aplicaciones:${NC}"
echo -e "  ${GREEN}•${NC} Obsidian     — Notas y análisis de literatura"
echo -e "  ${GREEN}•${NC} Zotero       — Gestión de referencias"
echo -e ""
echo -e "  ${BOLD}Herramientas:${NC}"
echo -e "  ${GREEN}•${NC} Typst        — Composición tipográfica + APA 7"
echo -e "  ${GREEN}•${NC} Himalaya     — Correo desde terminal"
echo -e "  ${GREEN}•${NC} python-pptx  — Generación de PowerPoints"
echo -e ""
echo -e "  ${BOLD}Recursos:${NC}"
echo -e "  ${GREEN}•${NC} Vault Obsidian en: $OBSIDIAN_VAULT"
echo -e "  ${GREEN}•${NC} Presentación en: $HOME/Desktop/Hermes Thesis Hub.pptx"
echo -e "  ${GREEN}•${NC} Plantillas Typst en: $HUB_DIR/typst/"
echo -e "  ${GREEN}•${NC} API key OpenRouter en: $HERMES_ENV"
echo -e ""
echo -e "  ${YELLOW}📌  Próximo paso: abre Obsidian y apunta al vault creado.${NC}"
echo -e "  ${YELLOW}📌  Para configurar correo: escribe 'configura mi correo' en Hermes.${NC}"
echo -e ""
echo -e "${PURPLE}══════════════════════════════════════════════════════════${NC}"
echo -e "${CYAN}  🎓  ¡A investigar!${NC}"
echo -e "${PURPLE}══════════════════════════════════════════════════════════${NC}"
