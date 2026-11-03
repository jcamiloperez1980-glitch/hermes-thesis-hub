# Instalar el kit en Mac

Tiempo: 10–20 minutos. No necesitas saber programar.

## Paso 1 · Descarga el kit

1. Descarga el archivo `.zip` del kit (el enlace llega con tu compra).
2. Doble clic sobre el `.zip`: se crea una carpeta. Muévela a `Documentos` si quieres tenerla a mano.

## Paso 2 · (Recomendado) Instala Homebrew

Homebrew es el instalador de aplicaciones más usado en Mac. Con él, el kit instala todo solo; sin él, te dará los enlaces para instalar a mano.

1. Abre la app **Terminal** (Cmd + Espacio → escribe "Terminal").
2. Ve a [brew.sh](https://brew.sh), copia la línea que aparece bajo *Install Homebrew*, pégala en Terminal y pulsa Enter.
3. Te pedirá la contraseña de tu Mac (no se ve al escribir: es normal). Al final, si te muestra *Next steps* con dos o tres líneas, cópialas y ejecútalas también.

## Paso 3 · Ejecuta el instalador

1. Abre la carpeta del kit → carpeta **`instalacion`**.
2. Haz **doble clic** en **`instalar-mac.command`**.
3. Si macOS dice que *no se puede abrir porque es de un desarrollador no identificado*: **clic derecho** (o Control + clic) sobre el archivo → **Abrir** → **Abrir**. En macOS recientes, si no aparece esa opción, ve a *Ajustes del Sistema → Privacidad y seguridad* y pulsa **Abrir igualmente**.

El instalador:

- Instala **Obsidian**, **Zotero** y **Typst** (si ya los tienes, los salta).
- Crea tu vault en **Documentos/Mi Tesis** con todas las plantillas.
- Instala el **asistente IA** y te pide tu API key de OpenRouter. Si todavía no la tienes, pulsa Enter para saltar y vuelve a ejecutarlo después.

¿Prefieres no instalar el asistente IA? En Terminal, dentro de la carpeta del kit:

```bash
bash install.sh --sin-ia
```

## Paso 4 · Abre tu vault

1. Abre **Obsidian**.
2. **Abrir carpeta como vault** → `Documentos` → `Mi Tesis` → **Abrir**.
3. Si pregunta si confías en el autor del vault: **Confiar**.

Ahora sigue la [Guía rápida](../GUIA-RAPIDA.md).

---

## Asistente IA (opcional)

Necesitas una **API key de OpenRouter**: crea una cuenta en [openrouter.ai](https://openrouter.ai), recarga saldo (pago por uso) y crea una key en *Keys*. Empieza con `sk-or-`.

> Tu API key es como una contraseña. El kit la guarda solo en tu Mac (`~/.hermes/.env`).

## Problemas frecuentes

| Problema | Solución |
|---|---|
| "Permiso denegado" al abrir `instalar-mac.command` | En Terminal: `cd ` (con espacio), arrastra la carpeta del kit a la ventana, Enter, y luego `bash install.sh`. |
| Pide instalar "herramientas de línea de comandos" | Acepta: es un componente gratuito de Apple que Homebrew necesita. |
| Quiero reinstalar las plantillas | Renombra tu carpeta `Mi Tesis` y vuelve a ejecutar. Nunca se borra un vault existente. |
| Instalación manual | Descarga [Obsidian](https://obsidian.md/download) y [Zotero](https://www.zotero.org/download/), y copia la carpeta `3-organizar-obsidian/vault-plantilla` a Documentos con el nombre `Mi Tesis`. Para escribir, usa [typst.app](https://typst.app). |
