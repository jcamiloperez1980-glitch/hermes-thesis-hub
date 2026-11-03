// ═══════════════════════════════════════════════════════════════
//  PLANTILLA DE TESIS · estilo APA 7 · Kit de tesis doctoral
// ═══════════════════════════════════════════════════════════════
//
//  Cómo usarla:
//    1. Cambia los datos de la sección "TUS DATOS" (lo que está entre comillas).
//    2. Escribe tus capítulos debajo de "TU TESIS EMPIEZA AQUÍ".
//    3. Compila:  typst compile plantilla-tesis.typ   (o usa typst.app)
//
//  No necesita internet ni paquetes externos. Las referencias salen de
//  "referencias.bib", que exportas desde Zotero (ver 2-leer-y-anotar/).
//
//  Atajos de Typst:
//    = Título de capítulo      == Sección      === Subsección
//    *negrita*   _cursiva_     @clave  → cita (García, 2020)
//    #cite(<clave>, form: "prose")  → cita narrativa: García (2020)
// ═══════════════════════════════════════════════════════════════

// ─────────────────────────── TUS DATOS ───────────────────────────
#let titulo       = "Título de tu tesis doctoral"
#let autor        = "Tu nombre completo"
#let grado        = "Tesis para optar al grado de Doctor(a) en ..."
#let universidad  = "Nombre de tu universidad"
#let programa     = "Programa de Doctorado en ..."
#let director     = "Dr(a). Nombre del director(a)"
#let ciudad-anio  = "Ciudad, 2026"
#let palabras-clave = ("palabra clave 1", "palabra clave 2", "palabra clave 3")
#let resumen = [
  Escribe aquí tu resumen (máximo 250 palabras). Describe el problema,
  el objetivo, la metodología, los hallazgos principales y la conclusión.
]
// ─────────────────────────────────────────────────────────────────


// ═════════════ FORMATO (no necesitas tocar esta parte) ═════════════
#set document(title: titulo, author: autor)
#set text(font: ("Times New Roman", "Liberation Serif", "Libertinus Serif"), size: 12pt, lang: "es")
#set page(paper: "a4", margin: 2.54cm)
#set par(leading: 1.3em, spacing: 1.3em, first-line-indent: 1.27cm, justify: false)

// Títulos al estilo APA 7
#set heading(numbering: none)
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  set text(size: 12pt, weight: "bold")
  align(center, block(above: 0pt, below: 1.5em, it.body))
}
#show heading.where(level: 2): it => block(above: 1.5em, below: 1em, text(size: 12pt, weight: "bold", it.body))
#show heading.where(level: 3): it => block(above: 1.5em, below: 1em, text(size: 12pt, weight: "bold", style: "italic", it.body))

// Tablas y figuras: número y título arriba, como pide APA
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.caption: it => align(left)[*#it.supplement #context it.counter.display(it.numbering)* \ #emph(it.body)]
#set table(stroke: none, inset: (x: 8pt, y: 5pt))
#show table: set par(leading: 0.65em, first-line-indent: 0pt)

// ──────────── Portada ────────────
#page(numbering: none)[
  #set par(first-line-indent: 0pt)
  #align(center)[
    #v(1fr)
    #text(weight: "bold", upper(universidad)) \
    #programa
    #v(2fr)
    #text(size: 14pt, weight: "bold", titulo)
    #v(1fr)
    #grado
    #v(1fr)
    #autor
    #v(1em)
    Director(a): #director
    #v(2fr)
    #ciudad-anio
  ]
]

// ──────────── Resumen e índice ────────────
#set page(numbering: "i")
#counter(page).update(1)

#align(center, text(weight: "bold")[Resumen])
#par(first-line-indent: 0pt, resumen)
#v(1em)
#par(first-line-indent: 1.27cm)[_Palabras clave:_ #palabras-clave.join(", ")]

#pagebreak()
#outline(title: [Índice], indent: auto)

#set page(numbering: "1")
#counter(page).update(1)


// ═══════════════════ TU TESIS EMPIEZA AQUÍ ═══════════════════

= Introducción

Planteamiento del problema y justificación. Así se cita entre paréntesis
@apellido2020, y así de forma narrativa: #cite(<apellido2020>, form: "prose")
muestra que...

== Pregunta y objetivos de investigación

Escribe tu pregunta de investigación y tus objetivos.

= Marco teórico

== Antecedentes

Contexto conceptual e histórico del problema.

== Bases teóricas

Teorías que sustentan tu investigación.

= Metodología

== Diseño

=== Participantes

=== Instrumentos

=== Procedimiento y análisis

= Resultados

#figure(
  table(
    columns: 3,
    table.hline(),
    table.header([Variable], [_M_], [_DE_]),
    table.hline(stroke: 0.5pt),
    [Variable 1], [3.45], [1.23],
    [Variable 2], [4.12], [0.98],
    table.hline(),
  ),
  caption: [Estadística descriptiva de las variables del estudio],
)

= Discusión

Interpreta tus resultados a la luz de la literatura.

= Conclusiones

Conclusiones, limitaciones y líneas de investigación futura.

// ═══════════════════ REFERENCIAS ═══════════════════
// Se generan solas con las fuentes que citaste.
#set par(first-line-indent: 0pt, hanging-indent: 1.27cm)
#bibliography("referencias.bib", title: "Referencias", style: "apa")
