# Instalación del Paquete Hermes Thesis Hub

## Opción 1: Instalador automático (recomendada)

```bash
cd hermes-thesis-hub
bash install.sh
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

# 2. Plugin Ponytail
hermes plugins install DietrichGebert/ponytail --enable

# 3. Typst
winget install Typst.Typst

# 4. python-pptx
python -m pip install python-pptx

# 5. Himalaya
curl -sLo himalaya.zip https://github.com/pimalaya/himalaya/releases/download/v2.0.0/himalaya.x86_64-windows.zip
python -c "import zipfile; zipfile.ZipFile('himalaya.zip').extractall('~/himalaya')"

# 6. Obsidian vault
mkdir -p "~/Documents/Hermes Thesis Hub"
cp -r obsidian/* "~/Documents/Hermes Thesis Hub/"
```

## Requisitos

- **Python 3.7+**
- **Node.js 18+** (para npx)
- **Git** (para clonar repos)
- Conexión a internet (primera instalación)