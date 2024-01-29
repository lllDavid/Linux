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
`grep -P '\s\d+\.(\d+\.)\1\d+' netzwerk.md`

oder

`grep -P '\d+\.\d+' netzwerk.md`

Es bestehen subtile Unterschiede; die zweite Lösung findet 3x 1-3 Ziffern,
gefolgt von einem Punkt, während die erste Whitespace, gefolgt von den ersten 3
Ziffern plus Punkt findet; dann in einer seperaten Suche die folgenden 3 Ziffern
plus Punkt - die "0.", die wir in diesem Falle mit Klammerung und "\1"
wiederholen können, um die zweite "0." finden zu können.
Beachte: Klammerungen und Referenzen können nicht verschiedene Dinge finden.
'(\d+\.)\1\1' funktioniert also nicht, um die ersten drei Ziffern/Punkt-Gruppen
zu markieren: Die erste Gruppe beinhaltet "127" während die anderen beiden "0"
beinhalten. Dabei kommen Regex an ihre Grenzen!

### g)
grep -E "([Uu]ser).*\1" dateien.md

### h)
grep -E "\bDatei-(Endungen|Erkennung|Typen)\b" dateien.md

### i)
grep -E "^- (Setuid|Setgid|Sticky)-bit" dateien.md

"Am Zeilenanfang steht ein Bindestrich, gefolgt von einem Leerzeichen, gefolgt von den drei zu suchenden Begriffen"


