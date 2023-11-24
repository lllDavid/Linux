# Lösungen zum Übungsblatt 2

## Aufgabe 1
    ls -l /etc | cut -d " " -f1 | grep -v "insgesamt |
    sort | uniq | wc -l

cut: -d -> Delimiter, soll hier ein Leerzeichen sein;
    -f -> Spalten, die angezeigt werden sollen
sort: Ergebnis sortieren
uniq: Doppelte Ergebnisse ausschließen

## Aufgabe 2

### a)
Fehlermeldung wird auf stderr ausgegeben

### b)
file: Tool, um Metadaten aus verschiedensten Dateien auslesen zu können

### c)
getrennter Output: erster Grep wird in Datei geschrieben (Stdout); zweiter Grep wird auf dem Bildschirm ausgegeben (Stderr, der nicht weitergeleitet wurde)

## Aufgabe 3
    ls -A | grep "^\." | wc -l

Regular Expressions in grep: Caret (^) steht für "Am Anfang der Zeile"; "." steht eigentlich für EIN beliebiges Zeichen; wenn der explizite Punkt verlangt ist, muss man ihn mittels Backslash (\) "escapen". Es wird also hier gesucht nach einem Punkt am Anfang der Zeile!

## Aufgabe 4