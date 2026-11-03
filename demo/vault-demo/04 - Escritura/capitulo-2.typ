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

// DEMO: capítulo de ejemplo generado con 4-escribir/plantilla-tesis.typ.
// Todo el contenido y las referencias son FICTICIOS.

// ─────────────────────────── TUS DATOS ───────────────────────────
#let titulo       = "Tutorías entre pares y permanencia estudiantil en el primer año universitario"
#let autor        = "Lucía Andrade (personaje ficticio)"
#let grado        = "Avance de tesis para optar al grado de Doctora en Educación"
#let universidad  = "Universidad Andina Demo"
#let programa     = "Programa de Doctorado en Educación"
#let director     = "Dra. Directora Ficticia"
#let ciudad-anio  = "Ciudad, 2026"
#let palabras-clave = ("tutoría entre pares", "permanencia estudiantil", "integración académica", "educación superior")
#let resumen = [
  DOCUMENTO DE DEMOSTRACIÓN: la autora, la universidad y todas las fuentes
  citadas son ficticias. Este avance presenta el marco teórico de una tesis
  sobre la relación entre la participación en tutorías entre pares y la
  permanencia de estudiantes de primer año en universidades públicas de la
  región andina.
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

= Marco teórico

== La permanencia estudiantil como problema

En las universidades públicas de la región, una parte importante de los
estudiantes abandona sus estudios durante el primer año. En esta tesis
entendemos la permanencia como la matrícula activa en el tercer semestre,
siguiendo la definición operativa de #cite(<morales2021>, form: "prose"),
lo que permite comparar nuestros resultados con evidencia regional previa.

== La integración académica como mecanismo

El modelo de #cite(<herrera2019>, form: "prose") sostiene que la permanencia
depende de la integración académica y social, y que en universidades públicas
latinoamericanas la primera tiene un peso mayor, porque muchos estudiantes
trabajan y disponen de poco tiempo para la vida social del campus. La
integración académica se entiende aquí como la percepción de ser capaz y
legítimo dentro de la vida académica @herrera2019.

== Tutoría entre pares: evidencia previa

La evidencia cuantitativa muestra que asistir a cinco o más sesiones de
tutoría entre pares se asocia con una mayor permanencia, en especial entre
estudiantes de primera generación universitaria @morales2021. Los estudios
cualitativos sugieren por qué: el tutor es percibido como un par cercano que
normaliza la dificultad y sirve de puente hacia otros servicios
institucionales @ortiz2023.

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: left,
    table.hline(),
    table.header([*Fuente*], [*Diseño*], [*Aporte principal*]),
    table.hline(stroke: 0.5pt),
    [Herrera (2019)], [Teórico], [Modelo de integración académica y social],
    [Morales y Quispe (2021)], [Cohorte, _n_ = 2.340], [Umbral de cinco sesiones],
    [Ortiz et al. (2023)], [Entrevistas, _n_ = 24], [Cercanía, normalización y puente],
    table.hline(),
  ),
  caption: [Síntesis de los antecedentes principales (fuentes ficticias)],
)

== Vacío de investigación

Ningún estudio previo combina la medición de la permanencia, controlando la
autoselección, con la comprensión de los mecanismos desde la voz de los
estudiantes. Esta tesis propone un diseño mixto secuencial explicativo para
atender ese vacío.

// ═══════════════════ REFERENCIAS ═══════════════════
#set par(first-line-indent: 0pt, hanging-indent: 1.27cm)
#bibliography("referencias.bib", title: "Referencias", style: "apa")
