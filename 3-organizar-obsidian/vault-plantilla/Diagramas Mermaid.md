---
tags: [diagramas]
---
# Diagramas para tu tesis

Obsidian dibuja estos diagramas automáticamente. Copia el bloque, cambia los textos y listo.

## Flujo de trabajo del kit

```mermaid
graph LR
    A["1. Buscar literatura"] --> B["2. Leer y anotar"]
    B --> C["3. Organizar en Obsidian"]
    C --> D["4. Escribir"]
    D --> E["5. Presentar"]
```

## Cronograma

```mermaid
gantt
    title Plan de tesis
    dateFormat YYYY-MM-DD
    axisFormat %b %Y
    section Marco teórico
    Revisión de literatura :a1, 2026-01-15, 90d
    Redacción              :a2, after a1, 60d
    section Metodología
    Diseño e instrumentos  :b1, 2026-04-15, 45d
    Recolección de datos   :b2, after b1, 90d
    section Resultados
    Análisis               :c1, after b2, 60d
    Redacción              :c2, after c1, 45d
    section Defensa
    Preparación            :d1, after c2, 30d
```

## Mapa mental

```mermaid
mindmap
  root((Mi tesis))
    Problema
      Pregunta
      Objetivos
    Marco teórico
      Concepto A
      Concepto B
    Metodología
      Diseño
      Instrumentos
    Resultados
    Discusión
```

## Modelo conceptual (variables)

```mermaid
graph LR
    X["Variable independiente"] -->|H1| Y["Variable dependiente"]
    M["Variable mediadora"] -.-> Y
    X --> M
```

Ver también: [[Bienvenido]]
