# Paso 4 · Escribir

**Objetivo:** escribir tu tesis con formato APA 7 automático: portada, índice, tablas numeradas y referencias que se generan solas.

## ¿Por qué Typst y no Word?

- Las **referencias se arman solas** desde Zotero. Si citas a alguien, aparece en la lista; si dejas de citarlo, desaparece.
- El **formato no se rompe** al mover un capítulo o pegar una tabla.
- Es gratuito, rápido y mucho más simple que LaTeX.

¿Tu programa exige Word? Escribe y organiza igual con el kit, y al final exporta tu bibliografía desde Zotero a Word con su plugin. Typst es recomendado, no obligatorio.

## Archivos

| Archivo | Qué es |
|---|---|
| [`plantilla-tesis.typ`](plantilla-tesis.typ) | Tu tesis: portada, resumen, índice, 5 capítulos y referencias |
| [`referencias.bib`](referencias.bib) | Ejemplo. Reemplázalo por el que exporta Zotero |
| [`USO-ETICO-IA.md`](USO-ETICO-IA.md) | Cómo usar IA en tu escritura sin poner en riesgo tu tesis |

## Tres formas de compilar (elige una)

### A · En el navegador, sin instalar nada (la más fácil)
1. Entra a [typst.app](https://typst.app) y crea una cuenta gratuita.
2. Crea un proyecto vacío y sube `plantilla-tesis.typ` y `referencias.bib`.
3. Escribe a la izquierda, ve el PDF a la derecha.

### B · En tu computador con un editor
1. Instala [VS Code](https://code.visualstudio.com/) (gratuito).
2. En VS Code, extensiones → busca **Tinymist Typst** → Instalar.
3. Abre `plantilla-tesis.typ` y pulsa el ícono de vista previa.

### C · Desde la terminal
```bash
typst compile plantilla-tesis.typ
```
Para que el PDF se actualice solo cada vez que guardas:
```bash
typst watch plantilla-tesis.typ
```

## Lo básico de Typst en 2 minutos

```typst
= Capítulo                       // título de capítulo (empieza página nueva)
== Sección
=== Subsección

Texto normal. *Negrita*, _cursiva_.

Según la literatura @garcia2020.          // → (García, 2020)
#cite(<garcia2020>, form: "prose") dice…  // → García (2020) dice…
Varios a la vez @garcia2020 @lopez2021.

- Lista con viñetas
+ Lista numerada
```

Más ejemplos (tablas, figuras, notas al pie) en el capítulo de muestra de [`demo/`](../demo/).

## Con el asistente IA (opcional)

```
Revisa la coherencia entre mis objetivos (en Mapa de la tesis) y
la estructura del capítulo de metodología. No reescribas: señala problemas.
```

```
Dame retroalimentación de estilo sobre este párrafo: claridad,
repeticiones y frases demasiado largas. Explica cada sugerencia.
```

Lee antes [`USO-ETICO-IA.md`](USO-ETICO-IA.md).
