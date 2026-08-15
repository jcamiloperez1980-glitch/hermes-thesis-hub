// ═══════════════════════════════════════════
// Plantilla Tesis — APA 7 · Hermes Thesis Hub
// ═══════════════════════════════════════════
// Uso: typst compile tesis.typ

#import "@preview/apa7-ish:0.3.0": *

#show: apa7.with(
  title: [
    Título de tu Tesis Doctoral
  ],
  authors: (
    (
      name: "Tu Nombre",
      affiliation: "Tu Universidad",
      email: "tu@email.com",
      orcid: "0000-0000-0000-0000",
    ),
  ),
  abstract: [
    Resumen de tu tesis en no más de 250 palabras.
    Aquí describes el problema, la metodología y los
    hallazgos principales.
  ],
  keywords: ("palabra clave 1", "palabra clave 2", "palabra clave 3"),
  anonymous: false,
)

// ═══════════════════════════════════════════
// CAPÍTULO 1: INTRODUCCIÓN
// ═══════════════════════════════════════════

= Introducción

Planteamiento del problema y justificación de la investigación.
Cita tus fuentes en APA 7 automáticamente @referencia-ejemplo.

// ═══════════════════════════════════════════
// CAPÍTULO 2: MARCO TEÓRICO
// ═══════════════════════════════════════════

= Marco Teórico

Revisión de la literatura relevante para tu investigación.

== Antecedentes

Contexto histórico y conceptual del problema.

== Bases teóricas

Principales teorías que sustentan tu investigación.

// ═══════════════════════════════════════════
// CAPÍTULO 3: METODOLOGÍA
// ═══════════════════════════════════════════

= Metodología

Descripción del diseño de investigación, población,
instrumentos y procedimiento de análisis.

=== Diseño

// === Participantes (para estudios cuantitativos)

=== Instrumentos

// ═══════════════════════════════════════════
// CAPÍTULO 4: RESULTADOS
// ═══════════════════════════════════════════

= Resultados

Presentación de los hallazgos de la investigación.

// Ejemplo de tabla APA
#figure(
  table(
    columns: 3,
    toprule,
    table.header([Variable], [Media], [Desviación]),
    midrule,
    [Variable 1], [3.45], [1.23],
    [Variable 2], [4.12], [0.98],
    bottomrule,
  ),
  caption: [
    *Ejemplo de tabla.* Estadística descriptiva de las variables.
  ],
)

// ═══════════════════════════════════════════
// CAPÍTULO 5: DISCUSIÓN Y CONCLUSIONES
// ═══════════════════════════════════════════

= Discusión

Interpretación de los resultados y su relación con la literatura existente.

= Conclusiones

Principales conclusiones, limitaciones y recomendaciones para
investigaciones futuras.

// ═══════════════════════════════════════════
// REFERENCIAS
// ═══════════════════════════════════════════

// Las referencias se generan automáticamente desde tu archivo .bib
// Exporta desde Zotero en formato BibLaTeX
#bibliography("referencias.bib", style: "apa")

// ═══════════════════════════════════════════
// EJEMPLOS DE REFERENCIA (eliminar al escribir)
// ═══════════════════════════════════════════

// Para citar en el texto usa @clave
// Ejemplo: Según @garcia2020, la teoría... (cita narrativa)
// Ejemplo: La teoría es fundamental @garcia2020 (cita parentética)

// En el archivo referencias.bib:
// @article{garcia2020,
//   author = {García, Juan},
//   title = {Título del artículo},
//   journal = {Revista},
//   year = {2020},
//   volume = {10},
//   number = {2},
//   pages = {100-120},
//   doi = {10.xxxx/xxxxx}
// }