# 🎓 Kit de tesis doctoral

**Un sistema completo para llevar tu tesis de la primera búsqueda bibliográfica a la defensa, sin perder fuentes, notas ni semanas peleando con el formato.**

Hecho para doctorandos y maestrandos de Latinoamérica, por Research AI Lab, a partir de años de asesorar tesis.

---

## Qué resuelve

- Tienes PDFs en cinco carpetas distintas y no recuerdas cuál decía qué.
- Lees mucho pero, cuando te sientas a escribir, no encuentras la idea que subrayaste hace dos meses.
- Pierdes días ajustando las normas APA a mano.
- Tu director(a) te pregunta "¿qué avanzaste?" y no tienes un registro claro.

El kit te da **un flujo de trabajo probado** con herramientas gratuitas, plantillas listas y, si quieres, un asistente IA que te acompaña en cada paso.

## El flujo, paso a paso

| Paso | Qué haces | Herramienta | Guía |
|---|---|---|---|
| **1. Buscar literatura** | Plan de búsqueda y búsquedas sistemáticas con DOI verificable | OpenAlex, Redalyc, SciELO | [1-buscar-literatura](1-buscar-literatura/) |
| **2. Leer y anotar** | Guardar cada fuente con un clic, subrayar con un código de colores | Zotero | [2-leer-y-anotar](2-leer-y-anotar/) |
| **3. Organizar** | Fichas de lectura, conceptos y matriz de literatura, todo enlazado | Obsidian | [3-organizar-obsidian](3-organizar-obsidian/) |
| **4. Escribir** | Tesis con APA 7 automático: portada, índice, tablas y referencias | Typst | [4-escribir](4-escribir/) |
| **5. Presentar** | Plantilla de defensa y preparación para el tribunal | PowerPoint / Keynote / Google Slides | [5-presentar](5-presentar/) |

## Qué incluye

- **Instalador** para Windows y Mac: doble clic y listo.
- **Vault de Obsidian** con carpetas para cada etapa y 6 plantillas: resumen de paper, concepto, nota diaria, reunión de asesoría, matriz de literatura y plan de búsqueda.
- **Plantilla de tesis en Typst** con formato APA 7: portada, resumen, índice, capítulos y referencias automáticas desde Zotero.
- **Plantilla de defensa** (13 diapositivas) con notas del orador sobre qué decir y cuánto tiempo dedicar.
- **Guías paso a paso** para cada etapa, pensadas para quien no es experto en tecnología.
- **Guía de uso ético de IA** para no poner en riesgo tu tesis.
- **Vault de demostración** con una tesis ficticia ya en marcha, para que veas cómo se usa.
- **Asistente IA (opcional):** Hermes Agent con skills para buscar en OpenAlex, revisar estilo y crear presentaciones.

## Empieza aquí

1. **Instala el kit:**
   - Windows → [instalacion/INSTALAR-WINDOWS.md](instalacion/INSTALAR-WINDOWS.md)
   - Mac → [instalacion/INSTALAR-MAC.md](instalacion/INSTALAR-MAC.md)
2. **Sigue la [Guía rápida](GUIA-RAPIDA.md):** tus primeros 30 minutos con el kit.
3. **Mira la [demo](demo/)** para ver un vault de tesis en uso.

## ¿Necesito el asistente IA?

No. Todo el flujo funciona con Obsidian, Zotero y Typst, que son gratuitos. El asistente IA ahorra tiempo en búsquedas y tareas repetitivas, pero requiere una API key de OpenRouter con costo por uso (lo pagas tú directamente a OpenRouter según lo que uses).

## Requisitos

- Windows 10/11 o macOS reciente.
- Conexión a internet para instalar.
- Para el asistente IA: una cuenta en [OpenRouter](https://openrouter.ai) con saldo.

## Estructura de esta carpeta

```
📁 Kit de tesis doctoral
├── README.md                ← estás aquí
├── GUIA-RAPIDA.md           ← tus primeros 30 minutos
├── 📁 instalacion/          ← instaladores y guías de Windows y Mac
├── 📁 1-buscar-literatura/
├── 📁 2-leer-y-anotar/
├── 📁 3-organizar-obsidian/ ← incluye vault-plantilla/
├── 📁 4-escribir/           ← plantilla Typst + guía de uso ético de IA
├── 📁 5-presentar/          ← plantilla de defensa
├── 📁 demo/                 ← vault de ejemplo (contenido ficticio)
├── install.sh               ← instalador para Mac y Linux
└── 📁 skills/ hooks/        ← componentes del asistente IA (no necesitas tocarlos)
```

## Desinstalar

Tus notas nunca se borran solas. Para quitar los componentes del asistente IA en Mac/Linux: `bash uninstall.sh`. Obsidian, Zotero y Typst se desinstalan como cualquier aplicación.

## Licencia

Licencia de uso personal: puedes usar y modificar el kit para tu propia tesis, y **todo lo que escribas con él es tuyo**. No puedes compartir ni revender los archivos del kit. Detalles en [LICENCIA.md](LICENCIA.md). Reembolsos: [REEMBOLSOS.md](REEMBOLSOS.md).

Obsidian, Zotero, Typst, Hermes y los skills de terceros tienen sus propias licencias.
