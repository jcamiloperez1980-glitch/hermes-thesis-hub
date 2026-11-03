# Paso 2 · Leer y anotar (Zotero)

**Objetivo:** que cada fuente que lees quede guardada una sola vez, con su PDF, tus subrayados y su referencia APA lista para citar.

## Configuración única (15 minutos)

### 1. Zotero y su conector
1. Abre **Zotero** (el instalador del kit ya lo instaló; si no, descárgalo en [zotero.org](https://www.zotero.org/download/)).
2. Instala el **Zotero Connector** en tu navegador desde la misma página. Con él guardas un artículo con un clic.
3. Crea una cuenta gratuita en zotero.org y actívala en *Editar → Ajustes → Sincronización* (Mac: *Zotero → Ajustes*). Así tu biblioteca queda respaldada.

### 2. Better BibTeX (para citar desde Typst)
1. Descarga el archivo `.xpi` más reciente de [retorque.re/zotero-better-bibtex](https://retorque.re/zotero-better-bibtex/installation/).
2. En Zotero: *Herramientas → Plugins* (o *Complementos*) → engranaje → *Instalar complemento desde archivo* → elige el `.xpi`.
3. Reinicia Zotero.

### 3. Exportar tu bibliografía automáticamente
1. Clic derecho en la colección de tu tesis → **Exportar colección…**
2. Formato: **Better BibLaTeX**. Marca **Mantener actualizado**.
3. Guárdalo como `referencias.bib` dentro de `04 - Escritura` de tu vault.

Desde ahora, cada artículo que agregues a esa colección aparece solo en tu tesis. La clave de cita (por ejemplo `garcia2020`) la ves en la columna *Citation Key* de Zotero.

## Organiza tu biblioteca así

```
📁 Mi tesis
   📁 01 Marco teórico
   📁 02 Metodología
   📁 03 Antecedentes empíricos
   📁 Por leer
```

Usa etiquetas para el estado: `por-leer`, `leído`, `clave`.

## Cómo leer un artículo sin perder tiempo

1. **Primera pasada (10 min):** resumen, introducción (último párrafo), figuras, conclusiones. ¿Sirve? Si no, etiquétalo `descartado` y sigue.
2. **Segunda pasada:** abre el PDF en Zotero y subraya con colores fijos:
   - 🟨 Amarillo: ideas centrales
   - 🟩 Verde: metodología
   - 🟥 Rojo: limitaciones o puntos discutibles
   - 🟦 Azul: citas textuales que quizá uses
3. **Ficha:** pasa a Obsidian y llena la plantilla *Resumen de paper* con tus palabras.

## Llevar tus anotaciones a Obsidian (opcional)

El plugin comunitario **Zotero Integration** de Obsidian importa tus subrayados automáticamente:

1. En Obsidian: *Ajustes → Plugins comunitarios → Explorar* → busca **Zotero Integration** → Instalar → Activar.
2. Requiere Better BibTeX (paso 2 de arriba).
3. En sus ajustes, agrega un formato de importación con carpeta `01 - Literatura`.

Si prefieres no instalar plugins, copia a mano los subrayados que importan: es más lento, pero también te obliga a decidir qué vale la pena.

## Con el asistente IA (opcional)

```
Lee mi ficha de [[Autor 2021]] y dime qué preguntas debería poder
responder sobre este artículo antes de citarlo.
```

```
Compara la metodología de estas tres fichas y arma una matriz
de literatura con la plantilla "Matriz de literatura".
```
