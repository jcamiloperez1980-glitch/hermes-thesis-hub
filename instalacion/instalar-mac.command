#!/bin/bash
# Doble clic en este archivo para instalar el Kit de tesis doctoral en Mac.
# Si macOS dice que no puede abrirlo: clic derecho → Abrir → Abrir.
cd "$(dirname "$0")/.." || exit 1
bash install.sh
echo
read -r -p "Pulsa Enter para cerrar esta ventana..." _
