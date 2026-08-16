# Instalación del Paquete Hermes Thesis Hub

## Opción 1: Instalador automático (recomendada)

```bash
cd hermes-thesis-hub
bash install.sh
```

El instalador pide la API key de OpenRouter en pantalla. También puedes pasarla directo:

```bash
OPENROUTER_API_KEY=sk-or-... bash install.sh
```

## Opción 2: Plugin de Hermes

```bash
hermes plugins install ./hermes-thesis-hub --enable
hermes gateway restart
```

## Opción 3: Manual

```bash
# 1. Skills
npx skills add practicalswan/agent-skills@powerpoint-ppt
npx skills add blader/humanizer
npx skills add wanshuiyin/auto-claude-code-research-in-sleep@openalex
npx skills add https://github.com/vercel-labs/skills --skill find-skills

# 2. Plugin Ponytail
hermes plugins install DietrichGebert/ponytail --enable

# 3. API key de OpenRouter
echo "OPENROUTER_API_KEY=sk-or-..." >> ~/.hermes/.env

# 4. Typst
winget install Typst.Typst

# 5. python-pptx
python -m pip install python-pptx

# 6. Himalaya
curl -sLo himalaya.zip https://github.com/pimalaya/himalaya/releases/download/v2.0.0/himalaya.x86_64-windows.zip
python -c "import zipfile; zipfile.ZipFile('himalaya.zip').extractall('~/himalaya')"

# 7. Obsidian y Zotero
winget install --id Obsidian.Obsidian
winget install --id DigitalScholar.Zotero

# 8. Obsidian vault
mkdir -p "~/Documents/Hermes Thesis Hub"
cp -r obsidian/* "~/Documents/Hermes Thesis Hub/"
```

## Requisitos

- **Python 3.7+**
- **Node.js 18+** (para npx)
- **Git** (para clonar repos)
- Conexión a internet (primera instalación)