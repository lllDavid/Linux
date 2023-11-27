# Linux INFO2 Übungsblatt 5 Lösungen

## Aufgabe 1

### a)
`grep -E "Datei" netzwerk.md`

### b)
`grep -E " Datei " netzwerk.md`

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

## Aufgabe 2
### a)
grep "^##" dateien.md

### b)
grep "^- " dateien.md | wc -l

### c)
grep "[\.\!]$" dateien.md

### d)
grep "[Dd]efault" dateien.md       -- triviale Lösung

grep "\b[Dd]efault\b" dateien.md   -- gleiches Ergebnis; zeigt aber, dass
"Wortbegrenzungen" nicht nur Whitespace sind.

### e)
grep "\bwerden.*einem\b" dateien.md  -- triviale Lösung

grep -E "\bwerden\b (\b\S*\b )*\beinem\b" dateien.md

### f)
grep -E "([0-9]{1,3}\.)\1\1([0-9]{1,3})" netzwerk.md

funktioniert so nicht richtig wegen "greedy matching" - weitere Analyse notwendig

### g)
grep -E "([Uu]ser).*\1" dateien.md

### h)
grep -E "\bDatei-(Endungen|Erkennung|Typen)\b" dateien.md

### i)
grep -E "^- (Setuid|Setgid|Sticky)-bit" dateien.md

"Am Zeilenanfang steht ein Bindestrich, gefolgt von einem Leerzeichen, gefolgt von den drei zu suchenden Begriffen"


