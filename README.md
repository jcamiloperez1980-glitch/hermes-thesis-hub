# 🎓 Hermes Thesis Hub

**Tu ecosistema completo de investigación para la tesis doctoral.**

---

## 📦 ¿Qué incluye?

### 🤖 Skills para Hermes Agent

| Skill | Función |
|-------|---------|
| 🐴 **Ponytail** | Modo lazy senior dev — código mínimo y eficiente |
| ✍️ **Humanizer** | Texto natural, elimina marcas de escritura AI |
| 🔍 **Find-Skills** | Descubre e instala skills del ecosistema abierto |
| 📊 **PowerPoint-PPT** | Genera presentaciones profesionales con python-pptx |
| 📚 **OpenAlex** | Busca 250M+ artículos académicos reales con DOI |

### 🖥️ Aplicaciones

| Aplicación | Para qué |
|------------|----------|
| **Obsidian** | Notas, análisis y grafo de tu literatura |
| **Zotero** | Gestión de referencias bibliográficas |

### 🛠️ Herramientas

| Herramienta | Para qué |
|-------------|----------|
| **Typst** | Composición tipográfica moderna — como LaTeX, más simple |
| **Himalaya** | Cliente de correo desde terminal (IMAP/SMTP) |
| **python-pptx** | Biblioteca Python para generar PowerPoints |

### 📁 Recursos

| Recurso | Ubicación |
|---------|-----------|
| 🖥️ **Presentación bienvenida** | `assets/skills-hermes-tesis.pptx` |
| 📝 **Vault Obsidian** | Se crea en `~/Documents/Hermes Thesis Hub/` |
| 🦀 **Plantilla Typst APA** | `typst/plantilla-tesis.typ` |
| 📚 **Notas template Obsidian** | `obsidian/` |

---

## ⚡ Instalación Rápida

```bash
# 1. Clona o descarga el paquete
git clone https://github.com/jcamiloperez1980-glitch/hermes-thesis-hub.git
cd hermes-thesis-hub

# 2. Ejecuta el instalador (pide la API key de OpenRouter en pantalla)
bash install.sh
```

También puedes pasar la API key directo, sin prompt:

```bash
OPENROUTER_API_KEY=sk-or-... bash install.sh
```

O si prefieres instalarlo como plugin de Hermes:

```bash
hermes plugins install ./hermes-thesis-hub --enable
hermes gateway restart
```

---

## 🚀 Cómo usar cada skill

### 🐴 Ponytail
Solo habla normal. El skill se activa automáticamente.
- `/ponytail [lite | full | ultra | off]` — ajusta el nivel
- `/ponytail-review` — revisa tu código por sobreingeniería

### ✍️ Humanizer
Pega tu texto y pide que lo revise:
- "Humaniza este texto: [texto]"
- "Revisa si esto suena a AI"

### 🔍 Find-Skills
- "Encuentra un skill para hacer [algo]"
- `npx skills find [tema]`

### 📊 PowerPoint-PPT
- "Crea una presentación sobre [tema]"
- "Agrega una diapositiva con gráfico de barras"
- "Cambia el diseño a tonos azules"

### 📚 OpenAlex
- "Busca papers sobre [tema] en OpenAlex"
- "Encuentra artículos recientes con muchas citas sobre [tema]"
- "Dame los 10 papers más relevantes sobre [tema] con DOI"

---

## 🔄 Flujo de trabajo recomendado

```
Investigación  →  Organización  →  Análisis  →  Escritura  →  Presentación
(OpenAlex)       (Zotero)         (Obsidian)    (Typst)       (PowerPoint)
```

1. **Investigar**: Pídele a Hermes que busque papers con OpenAlex
2. **Organizar**: Guarda las referencias en Zotero
3. **Analizar**: Toma notas en Obsidian
4. **Escribir**: Compila tu tesis en Typst con APA 7
5. **Presentar**: Genera tu defensa con PowerPoint

---

## 📋 Próximos pasos después de instalar

1. **Abre Obsidian** y abre el vault en `~/Documents/Hermes Thesis Hub/`
2. **Configura tu correo** con Himalaya (di "configura mi correo" en Hermes)
3. **Conecta Zotero** para gestionar tus referencias
4. **Prueba Typst** generando un documento de prueba con APA 7

---

## 🗑️ Desinstalación

```bash
# Remover skills
npx skills remove ponytail
npx skills remove humanizer
npx skills remove openalex
npx skills remove find-skills

# Remover plugins Hermes
hermes plugins disable ponytail
hermes plugins remove ponytail

# Remover herramientas
pip uninstall python-pptx -y
```

---

## 📄 Licencia

MIT — haz con esto lo que quieras.

---

<p align="center">🎓 <strong>¡A investigar!</strong> 🎓</p>