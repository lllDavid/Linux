# Linux INFO2 Übungsblatt 5 Lösungen

## Aufgabe 1

### a)
`grep -E "Datei" netzwerk.md`

### b)
`grep -E "Datei " netzwerk.md`

### c)
`grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" netzwerk.md`

oder

`grep -P "\d+\.\d+\.\d+\.\d+" netzwerk.md`

### d)
`grep -Eo "[Aa]ddresse" netzwerk.md | wc -l`

Die Option o liefert die Ergebnisse in eigenen Zeilen zurück; wichtig fürs
Zählen, da die Wörter mehrfach in einer Zeile vorkommen können!

### e)
`grep -E "tt[a-z]*ll" netzwerk.md`

### f)
`grep -E " s[a-z]*n " netzwerk.md`

### g)
`grep -E "\(.*\)" netzwerk.md`

oder

`grep -P "\(.*?\)" netzwerk.md`

Die zweite Lösung aktiviert "non-greedy matching" durch das "?" direkt hinter
dem "\*". Default ist "greedy matching" - d.h. in diesem Fall wird jeweils bis
zur __letzten__ Klammer zu gesucht und dabei evtl einige andere übersprungen.
Dies kann man mit dem "?" hinter dem "\*" umstellen.
Dann werden auch wirklich alle Klammerungen korrekt erkannt!

