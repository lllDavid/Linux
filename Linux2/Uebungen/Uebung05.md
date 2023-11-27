# Linux INFO2 Übungsblatt 5

Regular Expressions; wir benutzen als Such-Datei die Datei "netzwerk.md" im
Theorie-Verzeichnis

## Aufgabe 1
### a)
Finde den String "Datei"
Lösung: grep Datei netzwerk.md

### b)
Finde nun das genaue Wort "Datei"
Lösung: grep -w "Datei" netzwerk.md

### c)
Finde alle Angaben von IPs (IP4s)
Lösung: grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' netzwerk.md

### d)
Finde die Anzahl der Vorkommen von "Addresse" (klein- und großgeschrieben)
Tip: grep -o liefert Ergebnisse einzeln auf eigenen Zeilen zurück; grep -c
liefert die Anzahl der Treffer(zeilen) zurück
Lösung: grep -w -o "[Aa]ddresse" netzwerk.md | wc -w
Lösung: grep -Po "[Aa]ddresse" netzwerk.md | wc -w

### e)
Finde alle Wörter, die ein Doppel-"t" sowie ein Doppel-"l" beinhalten
(in dieser Reihenfolge)
Lösung: grep "\w*tt\w*ll\w*" netzwerk.md

### f)
Finde alle Wörter, die mit "s" beginnen und mit "n" enden
Lösung: grep -w "[Ss]\w*[Nn]" netzwerk.md

### g)
Finde alle Strings, die eingeklammert "()" sind
Lösung grep -P "\(.+?\)" netzwerk.md



## Aufgabe 2
Zur Abwechslung suchen wir nun einmal in der Datei `dateien.md`

### a)
Finde alle Vorkommen von Markdown-Unterüberschriften - d.h. die Zeile muss mit
einem `##` anfangen!
Lösung: grep "##" dateien.md

### b)
Finde nun (übergeordnete, nicht-geschachtelte) Markdown-Listeneinträge. Wieviele
davon gibt es?
Lösung: grep "^-" dateien.md | wc -l

### c)
Finde die Zeilen, die mit einem Punkt oder einem Ausrufezeichen enden!
Lösung: grep "[\.\!]$" dateien.md

### d)
Finde die Vorkommen des Wortes "default". Dabei soll Groß/Kleinschreibung
unberücksichtigt bleiben - und es soll auch wirklich nur das Wort markiert
werden!
Lösung: grep -w "[Dd]efault" dateien.md

### e)
Finde die Strings "werden ... einem"; wobei die Punkte für "alles, was dort
dazwischen stehen kann" stehen - z.B. "werden mit einem", "werden bei einem"
usw.
Lösung: grep -E "\bwerden(.*)einem\b" dateien.md

### f)
Kurzer Rückausflug zur `netzwerk.md`: Finde die dort enthaltene IP-Addresse
nochmals, mit einer jetzt möglichst etwas verfeinerten Methode!
Lösung: `grep -P '\s\d+\.(\d+\.)\1\d+' netzwerk.md`

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
Finde alle Vorkommnisse von je zwei Strings auf einer Zeile, die "User"
oder "user" beinhalten!
Lösung: grep -E "([Uu]ser).*\1" dateien.md


### h)
Finde Vorkommen von Wörtern, die mit "Datei-" starten und mit "Endungen",
"Erkennung" oder "Typen" enden!
Lösung: grep -E "\bDatei-(Endungen|Erkennung|Typen)\b" dateien.md

### i)
Finde die Zeilen, in denen die Sticky-, Setuid- und Setgid- "bit"s vorgestellt
werden! (nur die erste Zeile!)
Lösung: grep -E "^- (Setuid|Setgid|Sticky)-bit" dateien.md


