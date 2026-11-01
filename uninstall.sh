#!/usr/bin/env bash
# Kit de tesis doctoral — desinstala los componentes del asistente IA.
# NO borra tu vault (tus notas) ni Obsidian, Zotero o Typst.

echo "Desinstalando componentes del asistente del Kit de tesis doctoral..."
for skill in openalex humanizer powerpoint-ppt; do
  npx -y skills remove "$skill" </dev/null >/dev/null 2>&1 && echo "  ✓ skill $skill removido" || true
done
rm -rf "$HOME/.agents/skills/kit-tesis-doctoral" && echo "  ✓ skill del kit removido"

echo
echo "Listo. Se conservaron:"
echo "  • Tu vault (Documentos/Mi Tesis) — bórralo a mano solo si de verdad quieres."
echo "  • Obsidian, Zotero y Typst — desinstálalos como cualquier aplicación."
echo "  • Hermes y tu API key en ~/.hermes/.env — ver https://hermes-agent.nousresearch.com"
