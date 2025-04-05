# Grazer Linuxtage 2025

Mein Vorschlag für einen Vortrag mit dem Titel

**Mit Pandoc von Markdown zu ansprechenden Dokumenten - Doc(ument)s as Code
(DaC)**

wurde tatsächlich angenommen. Jetzt muss ich ihn wohl auch halten 😃.

Dieses Repo enthält zum einen den Sourcecode für die [Präsentation], als auch
den Sourcecode für ein [Beispieldokument], das mit [Pandoc] von Markdown in
eine PDF-Datei umgewandelt wird.

Um die Präsenstation und das Beispieldokument selber zu erstellen, müssen auf
dem Buildsystem folgende Dinge installiert sein:

- [Pandoc]
- [TeX Live]
- [pandoc-crossref]
- [lastpage]
- [koma-script]

Dies kann man entweder auf einem entsprechenden System installieren oder man
nutzt ein [docker]/[podman] Container dafür. Ich selber verwende im [Makefile]
[podman]. Das zugehörige Containerfile findet sich in meinem
[container_dac]-Repo. Es basiert auf dem offiziellen [pandoc/latex] Image und
installiert die drei letztgenannten Pakete aus der Auflistung oben, die im
offiziellen Image fehlen. Verwendest du docker, kannst du auch das fertig
gebaute [schuam/dac] Image auf dockerhub nutzen.

[Beispieldokument]: src/md/document.md
[Makefile]: Makefile
[Pandoc]: https://pandoc.org/
[Präsentation]: src/md/presentation.md
[TeX Live]: https://www.tug.org/texlive/
[container_dac]: https://github.com/schuam/container_dac
[docker]: https://www.docker.com
[koma-script]: https://ctan.org/pkg/koma-script
[lastpage]: https://ctan.org/pkg/lastpage?lang=de
[pandoc-crossref]: https://github.com/lierdakil/pandoc-crossref
[pandoc/latex]: https://hub.docker.com/r/pandoc/latex
[podman]: https://podman.io
[schuam/dac]: https://hub.docker.com/r/schuam/dac

