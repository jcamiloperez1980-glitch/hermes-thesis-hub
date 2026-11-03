# Demo · un vault de tesis ya en marcha

Esta carpeta muestra cómo se ve el kit **después de unas semanas de uso**, con una tesis de ejemplo.

> ⚠️ **Todo es ficticio.** La estudiante, la universidad, los autores, los artículos y los DOI (`10.0000/demo…`) fueron inventados para la demostración. No los cites.

**Tesis de ejemplo:** *Tutorías entre pares y permanencia estudiantil en el primer año universitario* — Lucía Andrade (personaje ficticio), Doctorado en Educación, Universidad Andina Demo.

## Cómo verla

1. Abre Obsidian → **Abrir carpeta como vault** → elige `demo/vault-demo`.
2. Empieza por **Bienvenida a la demo** y luego **Mapa de la tesis**.
3. Abre la **Vista de grafo** (ícono de nodos en la barra izquierda) para ver cómo se conectan fuentes y conceptos.
4. Mira [`tesis-demo.pdf`](tesis-demo.pdf): el capítulo de ejemplo compilado con la plantilla Typst del kit.

## Qué mirar

| Nota | Qué muestra |
|---|---|
| `01 - Literatura/` | Tres fichas de lectura completas con la plantilla *Resumen de paper* |
| `01 - Literatura/Matriz de literatura` | Comparación de las fuentes en una tabla |
| `02 - Conceptos/` | Conceptos definidos con palabras propias y enlazados a las fuentes |
| `00 - Diario/` | Cómo se ve el registro diario |
| `05 - Asesorías/` | Una reunión con la directora, con acuerdos y tareas |
| `04 - Escritura/capitulo-2.typ` | Capítulo escrito en Typst con citas a `referencias.bib` |
| `06 - Defensa/Preguntas probables` | Preparación para el tribunal |

Para compilar el capítulo: `typst compile "04 - Escritura/capitulo-2.typ" tesis-demo.pdf` desde `demo/vault-demo`, o súbelo a [typst.app](https://typst.app) junto con `referencias.bib`.
