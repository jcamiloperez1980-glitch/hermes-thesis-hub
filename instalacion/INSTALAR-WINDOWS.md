# Instalar el kit en Windows 10 / 11

Tiempo: 10–20 minutos (depende de tu internet). No necesitas saber programar.

## Antes de empezar

- Windows 10 (versión 1809 o posterior) o Windows 11.
- Conexión a internet.
- Permisos para instalar programas en tu computador (si es un equipo de la universidad, puede que necesites ayuda de soporte técnico).

## Paso 1 · Descarga el kit

1. Descarga el archivo `.zip` del kit (el enlace llega con tu compra).
2. Clic derecho sobre el `.zip` → **Extraer todo…** → **Extraer**.
3. Abre la carpeta extraída.

> No ejecutes el instalador desde dentro del `.zip` sin extraer: no funcionará.

## Paso 2 · Ejecuta el instalador

1. Entra a la carpeta **`instalacion`**.
2. Haz **doble clic** en **`instalar-windows.bat`**.
3. Si aparece una pantalla azul que dice *"Windows protegió su PC"*: clic en **Más información** → **Ejecutar de todas formas**. Esto pasa con cualquier programa que no viene de la Microsoft Store.
4. Si Windows pregunta *"¿Quieres permitir que esta aplicación haga cambios?"*, responde **Sí** (es para instalar Obsidian, Zotero y Typst).

El instalador:

- Instala **Obsidian**, **Zotero** y **Typst** (si ya los tienes, los salta).
- Crea tu vault en **Documentos\Mi Tesis** con todas las plantillas.
- Te pregunta si quieres instalar el **asistente IA**. Si no estás seguro(a), responde `n`: puedes instalarlo después ejecutando de nuevo el instalador.

Al final verás **Listo** y, si algo no se pudo instalar, una lista de *Pendientes* con el enlace para hacerlo a mano.

## Paso 3 · Abre tu vault

1. Abre **Obsidian** (menú Inicio → escribe "Obsidian").
2. Elige **Abrir carpeta como vault** → `Documentos` → `Mi Tesis` → **Seleccionar carpeta**.
3. Si pregunta si confías en el autor del vault: **Confiar**.

Ahora sigue la [Guía rápida](../GUIA-RAPIDA.md).

---

## Asistente IA (opcional)

El asistente es **Hermes Agent**, un programa de código abierto que conversa contigo y puede buscar literatura en OpenAlex, leer tu vault y crear presentaciones. Necesitas:

1. **Una API key de OpenRouter.** Crea una cuenta en [openrouter.ai](https://openrouter.ai), recarga saldo (pago por uso, desde unos pocos dólares) y crea una key en *Keys*. Empieza con `sk-or-`.
2. Ejecutar el instalador y responder `s` cuando pregunte por el asistente. Instalará Git y Node.js si faltan, y te pedirá pegar la key (no se ve al pegar: es normal).

> **Importante:** tu API key es como una contraseña. No la compartas ni la pegues en documentos. El kit la guarda solo en tu computador (`.hermes\.env` en tu carpeta de usuario).

Si la instalación del asistente falla en tu equipo, consulta las instrucciones oficiales de Hermes para Windows en [hermes-agent.nousresearch.com](https://hermes-agent.nousresearch.com) (según la versión, puede pedirte usar WSL). Todo el resto del kit funciona sin el asistente.

## Problemas frecuentes

| Problema | Solución |
|---|---|
| "No encontré winget" | Abre Microsoft Store, busca **Instalador de aplicación** (App Installer), instálalo o actualízalo y vuelve a ejecutar. |
| La ventana se cierra de inmediato | Clic derecho en `instalar-windows.ps1` → **Ejecutar con PowerShell**. |
| No encuentro `Documentos\Mi Tesis` | Si usas OneDrive, está en `OneDrive\Documentos\Mi Tesis`. |
| Quiero reinstalar las plantillas | Renombra tu carpeta `Mi Tesis` (por ejemplo a `Mi Tesis - respaldo`) y vuelve a ejecutar el instalador. Nunca se borra un vault existente. |
| Instalación manual | Descarga [Obsidian](https://obsidian.md/download) y [Zotero](https://www.zotero.org/download/), y copia la carpeta `3-organizar-obsidian\vault-plantilla` a Documentos con el nombre `Mi Tesis`. Para escribir, usa [typst.app](https://typst.app). |
