---
name: hermes-thesis-hub
description: 🎓 Ecosistema completo de investigación para tesis doctoral. Skills: Ponytail, Humanizer, Find-Skills, PowerPoint, OpenAlex. Tools: Typst, Himalaya, python-pptx. Incluye vault Obsidian y plantillas APA.
version: 1.0.0
author: sapamole18
license: MIT
platforms: [windows, macos, linux]
---

# Hermes Thesis Hub 🎓

Paquete completo de investigación académica para Hermes Agent.

## Skills instalados

| Skill | Uso |
|-------|-----|
| **Ponytail** | Código mínimo y eficiente — se activa solo |
| **Humanizer** | 'Humaniza este texto: ...' |
| **Find-Skills** | 'Encuentra un skill para X' |
| **PowerPoint-PPT** | 'Crea una presentación sobre X' |
| **OpenAlex** | 'Busca papers sobre X en OpenAlex' |

## Herramientas

| Herramienta | Comando |
|-------------|---------|
| Typst | `typst compile doc.typ` |
| Himalaya | `himalaya envelope list` |
| python-pptx | Generación programática de PPT |

## Flujo de trabajo

1. **Investigar** → OpenAlex busca artículos reales con DOI
2. **Organizar** → Zotero gestiona las referencias
3. **Analizar** → Obsidian vault con notas y literature review
4. **Escribir** → Typst compila PDF con APA 7
5. **Presentar** → PowerPoint genera la defensa

## Referencias

- Vault Obsidian: `~/Documents/Hermes Thesis Hub/`
- Plantilla Typst en el paquete `typst/plantilla-tesis.typ`
- Presentación en `assets/skills-hermes-tesis.pptx`