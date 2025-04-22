---
title: Mit Pandoc von Markdown zu ansprechenden Dokumenten
subtitle: Doc(ument)s as Code (DaC)
author: Andreas Schuster
date: 2025-04-26
---

# Motivation

\fontsize{24pt}{0}\selectfont
\center
Frust!


# Problem mit klassischen Textverarbeiungs-Tools

- Merging
  - Wer hat was geändert?
  - Zusammenkopieren ist kompliziert und fehlteranfällig.
  - Layout, Referenzen, etc. funktionieren auf einmal nicht mehr.
- Versionierung
  - Diffs
  - Atomic Commits
- Uneinheitliches Layout
- Umständliche Menüs
- ...


# Docs as Code (DaC)

\vspace{1.5cm}
> "Documentation as Code (Docs as Code) refers to a philosophy that you should
> be writing documentation with the same tools as code: (...)"


\vfill
\fontsize{8pt}{0}\selectfont
\center
by Eric Holscher & the Write the Docs community:

[https://www.writethedocs.org/guide/docs-as-code/](https://www.writethedocs.org/guide/docs-as-code/)


# Docs as Code (DaC)

- Plain-Text Quelldateien
- Versionierung mit Tools wie z.B. Git
- CI/CD
  - Tests
  - Automatische Generieren des Output
  - ...


# Einwände

- Ich will meine Doktorarbeit nicht programmieren, ich will sie schreiben.
- LaTeX ist zu kompliziert zu lernen.
- Wenn ich Plain-Text verwende, kann ich das finale Ergebnis nicht sofort
  sehen.
- ...


# Requirements

- Benutzerfreundlichkeit
  - Plain-Text Quelldateien
  - Simple Markup
  - Schnelles und einfaches Generieren des Output
- Layout
  - Überschriften, (Unter-)Kapitel
  - Inhaltsverzeichnis
  - Listen
  - Code und Code-Blocks
  - Bilder und Tabellen
  - Mathematische Ausdrücke
  - Zitate, Referenzen und Links
  - Fußnoten
  - Kopf- und Fußzeile


# Setup für Dokumente

- Markdown für Plain-Text Quelldateien
- Pandoc für das Generieren von PDF-Dateien


# Demo

\fontsize{24pt}{0}\selectfont
\center
Zeit für eine Demonstration!


# QnA

\fontsize{24pt}{0}\selectfont
\center
Gibt es Fragen?


# Links

::: columns
:::: {.column width="30%"}
Meine DaC-Seite:

Vortrag GLT 2025:

Container (Github):

Container (Docker):

Pandoc:

Wirte the Docs:

::::
:::: {.column width="70%"}
[https://dac.schuam.de](https://dac.schuam.de)

[https://github.com/schuam/glt_2025](https://github.com/schuam/glt_2025)

[https://github.com/schuam/container_dac](https://github.com/schuam/container_dac)

[https://hub.docker.com/r/schuam/dac](https://hub.docker.com/r/schuam/dac)

[https://pandoc.org](https://pandoc.org)

[https://www.writethedocs.org/guide/docs-as-code](https://www.writethedocs.org/guide/docs-as-code)
::::
:::


# Kontakt: Andreas Schuster

::: columns
:::: {.column width="30%"}
Homepage:

Email:

Github:

LinkedIn:
::::
:::: {.column width="70%"}
[https://schuam.de](https://schuam.de)

[andreas@schuam.de](mailto:andreas@schuam.de)

[https://github.com/schuam](https://github.com/schuam)

[https://www.linkedin.com/in/schuam](https://www.linkedin.com/in/schuam)
::::
:::


# Vielen Dank

\fontsize{24pt}{1cm}\selectfont
\center
Vielen Dank für eure Aufmerksamkeit!

