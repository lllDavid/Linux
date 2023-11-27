# Regular Expressions

werden verwendet z.B. im Serial Editor __sed__ oder auch im Text-Suchtool
__grep__; hier muss eventuell die Option _-E_ oder _-P_ (extended bzw.
Perl-style regular expressions) angegeben werden!

* Eine Suche nach einem einfachen String liefert genau die Vorkommen dieses
  Strings zurück - also auch mit vorangehenden oder folgenden Zeichen
* Der Punkt __"."__ ist ein einfacher Platzhalter für _ein_ beliebiges
  Zeichen. Wiederholt hintereinander stehende Punkte stehen für die
  entsprechende Anzahl von Zeichen.
* Zeichen, die in eckigen Klammern angegeben werden (z.B. "[abc]") stehen für
  eine _Auswahl_ aus diesen Zeichen; eines davon muss für ein Match zum
  Suchwort passen. Man kann auch Bereiche angeben; z.B. [A-F], [f-p], [0-8]
  etc. Dies lässt sich auch kombinieren (z.B. [a-c2-5xy]) und auch "negieren"
  (verneinen) - d.h. die Auswahl in den eckigen Klammern umzukehren. [^e]
  heißt dann: Suche alle Zeichen _außer_ dem "e". Utilities wie __grep__
  haben evtl. Erweiterungen, die man in der Form [[:digit:]] (Bsp: Ziffern)
  etc. einsetzen kann.
* Multiplikatoren:
    - Ein Asterisk "\*" steht für die Wiederholung des vorangegangenen Zeichens
      (oder auch der Zeichenmenge) - beliebig of, inklusive _null-mal_!
    - Ein Plus "\+" steht für die Wiederholung _ein_ - oder mehrmals
    - Das Fragezeichen "\?" steht für die _null_ - oder _einmalige_ Wiederholung
    - Genaue Wiederholzungszahlen können in geschweiften Klammern angegeben
      werden, wobei auch Bereiche zulässig sind. "z{3}, z{1,3}, z{2,} stehen
      also für "dreimal z", "z ein - bis dreimal" und "z mind. zweimal
      hintereinander, nach oben offen"
    - Per Default erfasst z.B: "\*" die maximal mögliche Anzahl an Charakteren
      ("greedy matching"). Man kann durch Dahinterstellen von "\?" (also z.B.
      "\*\?") ein non-greedy matching erzwingen, die die minimal mögliche Anzahl
      an Charakteren erfasst. Dies funktioniert in grep aber nur mit der Option
      "__-P__" (Perl-Style-Matching)
* Diese funktionalen Metacharaktere können auch "escaped" werden, falls die
  ursprüngliche Bedeutung gebraucht wird. Ein Punkt wird also nur zu einem Punkt
  (im Gegensatz zu: beliebiges Zeichen), indem man ihm einen Backslash
  voranstellt, also "\.". Analoges gilt auch für z.B. "?, +" etc.
* Es gibt auch "Kurzversionen" von Zeichen-Klassen, die mit einem Backslash
  beginnen:
  - \s erfasst alles, was "Whitespace" ist (Leerzeichen, Tabulatoren)
  - \S erfasst das Gegenteil - alle non-Whitespaces
  - \d erfasst alle Ziffern - analog zu [0-9]
  - \D erfasst das Gegenteil - analog zu [^0-9]
  - \w erfasst alle "Wort"-Charaktere - analog zu [a-zA-Z0-9]
  - \W erfasst das Gegenteil - analog zu [^a-zA-Z0-9]. Damit können gezielt
    Sonderzeichen gesucht werden!
* Erfassen von non-printable characters:
  - \t für Tabulatoren
  - \r für Carriage Return (Wagenrücklauf)
  - \n für Line Feed (Zeilenvorschub)
  Bemerkung: Eine neue Zeile wird, je nach OS, anders gekennzeichnet:
  - Windows: \r\n
  - MacOS: \r
  - Linux/Unix: \n
* Ankerzeichen:
  Man kann Zeichenketten am Anfang oder am Ende der Zeile suchen:
  `^` für den Anfang der Zeile
  `$` für das Ende der Zeile
* Wortbegrenzungen:
  - \< repräsentiert den Anfang eines Wortes
  - \> steht für das Ende des Wortes
  - \b entweder Anfang oder Ende eines Wortes
* Gruppierungen:
Gruppen können in runde Klammern eingefaßt werden, um sie weiter mit Regex
verarbeiten zu können. `John (Reginald )?Smith` findet sowohl "John Smith" als
auch "John Reginald Smith". `John (Reginald)?Smith` findet allerdings nicht den
vollen ausgeschriebenen Namen, da dann ein Leerzeichen (hinter "Reginald")
fehlt!
* Referenzen zu Klammern:
Einmal gesetzt, können Regex-Teile in runden Klammern auch weiter verwendet bzw.
referenziert werden mit `\1, \2, ` etc; das erste Klammerpaar wird mit `\1`
angesprochen usw.
* Alternation
Verschiedene Begriffe können als Alternativen gesucht werden mit z.B.
`hund|katze`. Dabei kann eines oder mehrere davon zutreffen. Auch mehrfache
Auswahl ist möglich; z.B. `hund|katze|maus`.
* Lookahead
Durch Negative/positive Look-aheads lassen sich Dinge ausschließen oder
beschränken, die im folgenden Regex eigentlich zulässig wären.
Beispiel: `\b4(?!000)\d\d\d\b` findet (vierstellige) Zahlen, die mit einer "4"
beginnen, schließt aber "4000" aus. Obiges Regex lässt sich also lesen wie:
"Wortbeginn, dann eine 4, dann, wenn drei Nullen folgen, schließe diese Zahl
aus, ansonsten können drei beliebige Ziffern folgen. Danach Wortende."
Die zu verwendende Syntax ist also `(?!x)` für einen negativen Lookahead wie
gerade beschrieben.
Ein Positive Lookahead funktioniert genau andersherum; `(?=x)` schließt eben nur
die Sachen ein, die mit "x" gematched werden.
* Lookbehind
Negative/positive Look-behinds funktionieren ähnlich wie die Look-aheads; es
lassen sich Ergebnisse ausschließen, denen bestimmte Regex-Muster
**vorangehen**!.
Beispiel: `(?<=[A-Z]\w* )Smith` findet z.B. "Harold Smith", nicht aber "going to
Smith Francis" - d.h. Smith als Nachname wird gefunden; Smith als Beruf aber
nicht!
Negative Lookbehinds funktioniert wiederum andersherum; `(?<!x)` (im Gegensatz
zu vorher: `(?<=x)`) liefert Ergebnisse, bei denen der Regex im Vorfeld nicht
zutrifft!

