#!/usr/bin/env bash
#=============================================================================
#  Kit de tesis doctoral — Instalador para Mac (y Linux)
#=============================================================================
#  Uso:
#     bash install.sh             instala todo (apps + plantillas + asistente IA)
#     bash install.sh --sin-ia    solo apps y plantillas (sin asistente IA)
#     bash install.sh --solo-ia   solo el asistente IA (lo usa el instalador de Windows)
#
#  Qué hace:
#     1. Revisa requisitos (Homebrew en Mac, Python, Node.js)
#     2. Instala Obsidian, Zotero y Typst
#     3. Crea tu vault de tesis en Documentos/Mi Tesis con todas las plantillas
#     4. (Opcional) Instala el asistente Hermes, su API key y sus skills
#
#  Es seguro ejecutarlo varias veces: lo que ya está instalado se salta y
#  nunca sobrescribe tu vault si ya existe.
#  En Windows usa instalacion/instalar-windows.bat (ver instalacion/INSTALAR-WINDOWS.md).
#=============================================================================


KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT="${VAULT:-$HOME/Documents/Mi Tesis}"
HERMES_ENV="$HOME/.hermes/.env"
SKILLS_DIR="$HOME/.agents/skills"

SIN_IA=false; SOLO_IA=false
for arg in "$@"; do
  case "$arg" in
    --sin-ia) SIN_IA=true ;;
    --solo-ia) SOLO_IA=true ;;
    -h|--help) sed -n '2,18p' "$0"; exit 0 ;;
  esac
done

if [ -t 1 ]; then
  G='\033[0;32m'; Y='\033[1;33m'; R='\033[0;31m'; C='\033[0;36m'; B='\033[1m'; N='\033[0m'
else
  G=''; Y=''; R=''; C=''; B=''; N=''
fi
ok()   { echo -e "  ${G}✓${N} $*"; }
warn() { echo -e "  ${Y}!${N} $*"; }
err()  { echo -e "  ${R}✗${N} $*"; }
paso() { echo -e "\n${B}${C}[$1]${N} ${B}$2${N}"; }
PENDIENTES=()

case "$(uname -s)" in
  Darwin) SO=mac ;;
  Linux)  SO=linux ;;
  MINGW*|MSYS*|CYGWIN*)
    if $SOLO_IA; then SO=windows; else
    echo "Estás en Windows. Usa instalacion/instalar-windows.bat (doble clic)."
    echo "Guía: instalacion/INSTALAR-WINDOWS.md"
    exit 1; fi ;;
  *) SO=otro ;;
esac

echo -e "${B}"
echo "  ╔════════════════════════════════════════════╗"
echo "  ║        Kit de tesis doctoral · Instalador  ║"
echo "  ╚════════════════════════════════════════════╝"
echo -e "${N}"
echo "  Sistema: $SO   ·   Vault: $VAULT"
$SIN_IA && echo "  Modo: sin asistente IA"
$SOLO_IA && echo "  Modo: solo asistente IA"

TOTAL=4; $SIN_IA && TOTAL=3

# ── 1. Requisitos ────────────────────────────────────────────────────────
paso "1/$TOTAL" "Revisando requisitos"
HAY_BREW=false
if [ "$SO" = mac ]; then
  if command -v brew >/dev/null 2>&1; then
    HAY_BREW=true; ok "Homebrew detectado"
  else
    warn "No tienes Homebrew (el instalador de apps para Mac)."
    echo "     Puedes instalarlo pegando en la Terminal la línea que aparece en https://brew.sh"
    echo "     y luego volver a ejecutar este instalador. Si no, te daré los enlaces de descarga."
  fi
fi
if command -v python3 >/dev/null 2>&1; then ok "Python $(python3 --version 2>&1 | cut -d' ' -f2)"; else warn "Python 3 no encontrado (solo lo necesita el asistente para crear PowerPoints)"; fi
if ! $SIN_IA; then
  if command -v npx >/dev/null 2>&1; then
    ok "Node.js $(node --version 2>/dev/null)"
  elif $HAY_BREW; then
    echo "  → Instalando Node.js (lo necesita el asistente IA)..."
    brew install node >/dev/null 2>&1 && ok "Node.js instalado" || warn "No se pudo instalar Node.js"
  else
    warn "Node.js no encontrado. Descárgalo (versión LTS) en https://nodejs.org y vuelve a ejecutar el instalador."
  fi
fi

if ! $SOLO_IA; then
# ── 2. Aplicaciones ──────────────────────────────────────────────────────
paso "2/$TOTAL" "Instalando Obsidian, Zotero y Typst"

app_mac() { # $1 = nombre .app  $2 = cask  $3 = url manual
  if [ -d "/Applications/$1.app" ] || [ -d "$HOME/Applications/$1.app" ]; then
    ok "$1 ya instalado"
  elif $HAY_BREW; then
    echo "  → Instalando $1..."
    brew install --cask "$2" >/dev/null 2>&1 && ok "$1 instalado" || { err "No se pudo instalar $1"; PENDIENTES+=("Descarga $1 en $3"); }
  else
    PENDIENTES+=("Descarga e instala $1 desde $3"); warn "$1: instálalo desde $3"
  fi
}

if [ "$SO" = mac ]; then
  app_mac "Obsidian" "obsidian" "https://obsidian.md/download"
  app_mac "Zotero"   "zotero"   "https://www.zotero.org/download/"
else
  for app in obsidian zotero; do
    if command -v "$app" >/dev/null 2>&1 || flatpak list 2>/dev/null | grep -qi "$app"; then ok "$app ya instalado"
    else PENDIENTES+=("Instala $app (en Linux, recomendado vía Flathub / tu tienda de software)"); warn "$app: instálalo desde tu tienda de software o Flathub"; fi
  done
fi

if command -v typst >/dev/null 2>&1; then
  ok "Typst $(typst --version | cut -d' ' -f2) ya instalado"
elif $HAY_BREW; then
  echo "  → Instalando Typst..."
  brew install typst >/dev/null 2>&1 && ok "Typst instalado" || { err "No se pudo instalar Typst"; PENDIENTES+=("Typst: usa https://typst.app en el navegador"); }
else
  warn "Typst no instalado. No pasa nada: puedes escribir en https://typst.app desde el navegador."
  PENDIENTES+=("Typst (opcional): usa https://typst.app o instálalo desde https://github.com/typst/typst/releases")
fi

# ── 3. Vault de tesis ────────────────────────────────────────────────────
paso "3/$TOTAL" "Creando tu vault de tesis"
if [ -d "$VAULT" ]; then
  ok "Ya existe $VAULT — no lo toco (tus notas están a salvo)"
else
  mkdir -p "$VAULT"
  cp -R "$KIT_DIR/3-organizar-obsidian/vault-plantilla/." "$VAULT/"
  find "$VAULT" -name ".gitkeep" -delete
  cp "$KIT_DIR/4-escribir/plantilla-tesis.typ" "$VAULT/04 - Escritura/tesis.typ"
  cp "$KIT_DIR/4-escribir/referencias.bib"     "$VAULT/04 - Escritura/referencias.bib"
  cp "$KIT_DIR/5-presentar/plantilla-defensa.pptx" "$VAULT/06 - Defensa/plantilla-defensa.pptx"
  ok "Vault creado en: $VAULT"
fi

fi # fin de pasos 2-3

# ── 4. Asistente IA (opcional) ───────────────────────────────────────────
if ! $SIN_IA; then
  paso "4/$TOTAL" "Asistente IA (Hermes)"
  if command -v hermes >/dev/null 2>&1; then
    ok "Hermes ya instalado"
  else
    echo "  → Instalando Hermes con su instalador oficial..."
    if curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash; then
      ok "Hermes instalado"
      export PATH="$HOME/.local/bin:$PATH"
    else
      err "No se pudo instalar Hermes"; PENDIENTES+=("Instala Hermes: https://hermes-agent.nousresearch.com")
    fi
  fi

  mkdir -p "$(dirname "$HERMES_ENV")"; touch "$HERMES_ENV"; chmod 600 "$HERMES_ENV"
  if grep -q "^OPENROUTER_API_KEY=" "$HERMES_ENV" 2>/dev/null; then
    ok "API key de OpenRouter ya configurada"
  else
    KEY="${OPENROUTER_API_KEY:-}"
    if [ -z "$KEY" ] && [ -t 0 ]; then
      echo "  El asistente necesita una API key de OpenRouter (https://openrouter.ai/keys)."
      echo "  Pégala y pulsa Enter (no se verá en pantalla). Enter vacío = configurar luego."
      read -r -s -p "  API key: " KEY; echo
    fi
    if [ -n "$KEY" ]; then
      echo "OPENROUTER_API_KEY=$KEY" >> "$HERMES_ENV"; ok "API key guardada en $HERMES_ENV"
    else
      warn "Sin API key por ahora"; PENDIENTES+=("Agrega tu API key: vuelve a ejecutar bash install.sh")
    fi
  fi
  grep -q "^OBSIDIAN_VAULT_PATH=" "$HERMES_ENV" || echo "OBSIDIAN_VAULT_PATH=$VAULT" >> "$HERMES_ENV"

  if command -v npx >/dev/null 2>&1; then
    # nombre-carpeta|origen
    for s in \
      "openalex|wanshuiyin/auto-claude-code-research-in-sleep@openalex" \
      "humanizer|blader/humanizer" \
      "powerpoint-ppt|practicalswan/agent-skills@powerpoint-ppt"; do
      nombre="${s%%|*}"; origen="${s#*|}"
      if [ -d "$SKILLS_DIR/$nombre" ]; then ok "Skill $nombre ya instalado"
      else
        echo "  → Instalando skill $nombre..."
        npx -y skills add "$origen" </dev/null >/dev/null 2>&1 && ok "Skill $nombre instalado" || { err "Skill $nombre no se pudo instalar"; PENDIENTES+=("Skill $nombre: npx skills add $origen"); }
      fi
    done
    mkdir -p "$SKILLS_DIR/kit-tesis-doctoral"
    cp "$KIT_DIR/skills/hermes-thesis-hub/SKILL.md" "$SKILLS_DIR/kit-tesis-doctoral/SKILL.md" && ok "Skill del kit instalado"
  else
    PENDIENTES+=("Instala Node.js (https://nodejs.org) y vuelve a ejecutar el instalador para los skills del asistente")
  fi

  if command -v python3 >/dev/null 2>&1; then
    if python3 -c "import pptx" 2>/dev/null; then ok "python-pptx ya instalado"
    elif python3 -m pip install --user --quiet python-pptx 2>/dev/null; then ok "python-pptx instalado"
    else warn "python-pptx no se pudo instalar (solo afecta a crear PowerPoints con el asistente)"; fi
  fi
fi

# ── Resumen ──────────────────────────────────────────────────────────────
echo -e "\n${B}══════════════════════════════════════════════${N}"
echo -e "${G}${B}  Listo.${N}"
echo -e "${B}══════════════════════════════════════════════${N}"
echo "  Tu vault: $VAULT"
echo "  Siguiente paso: abre Obsidian → 'Abrir carpeta como vault' → elige 'Mi Tesis'."
echo "  Luego sigue GUIA-RAPIDA.md (30 minutos)."
if [ ${#PENDIENTES[@]} -gt 0 ]; then
  echo -e "\n  ${Y}${B}Pendientes:${N}"
  for p in "${PENDIENTES[@]}"; do echo "   • $p"; done
fi
echo
