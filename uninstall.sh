#!/usr/bin/env bash
# Uninstaller — Hermes Thesis Hub
set -e

echo "🧹 Desinstalando Hermes Thesis Hub..."

# Remove skills
for skill in ponytail humanizer openalex find-skills; do
    npx skills remove "$skill" 2>/dev/null && echo "  ✓ $skill removido" || true
done

# Remove Hermes plugins
hermes plugins disable ponytail 2>/dev/null || true
hermes plugins remove ponytail 2>/dev/null || true

# Remove packages
python -m pip uninstall python-pptx -y 2>/dev/null || true

echo ""
echo "✅ Hermes Thesis Hub desinstalado."
echo "Para remover el vault de Obsidian, elimina: ~/Documents/Hermes Thesis Hub"