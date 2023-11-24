#Regular Expressions

werden verwendet z.B. im Serial editor __sed__ oder auch im Text-Suchtool
__grep__; hier muss eventuell die Option __-E__ (extended regular Expressions)
angegeben werden!

- Eine Suche nach einem einfachen String liefert genau die Vorkommen dieses
  Strings zurück, also auch mit vorangehenden oder folgenden Zeichen.
- Der Punkt "." ist ein einfacher Platzhalter für **ein** beliebiges Zeichen.
  Wiederholt hintereinander stehende Punkte stehen für die entsprechende Anzahl
  von beliebigen Zeichen.
- Zeichen, die in eckigen Klammern angegeben werden (z.B. "[abc]") stehen für
  eine 'Auswahl' aus diesen Zeichen; eines davon muss zum Suchwort passen. Es
  gibt auch die Möglichkeit, "Bereiche" anzugeben, z.B. [A-F], [f-p], [0-8] etc.
  Man kann diese Bereiche auch kombinieren (z.B. [a-c2-5xy]) und auch
  "negieren"- das heißt die Auswahl innerhalb der eckigen Klammer umkehren -
  [^e] heißt dann: Suche alle Zeichen **außer** dem "e".
  Utilities wie __grep__ haben evtl. Erweiterungen, die man in der Form
  [[:digit:]] etc. einsetzen kann!
- Multiplikatoren:
    - Ein Asterisk "\*" steht für die Wiederholung des vorangegangenen
      Zeichens/Zeichenmenge - beliebig oft, inklusive **null-mal**!
    - Ein Plus "+" steht für die Wiederholung **ein-** oder mehrmals
    - Das Fragezeichen "?" steht für **null-** oder **einmalige** Wiederholung
    - Genaue Wiederholungszahlen können in geschweiften Klammern angegeben
      werden, wobei auch Bereiche zulässig sind.
      "z{3}, z{1,3}, z{2,}" stehen also für "dreimal 'z' hintereinander, 'z'
      einmal bis dreimal hintereinander und 'z' mind. zweimal hintereinander mit
      nach oben offener Grenze"
    - Per Default erfasst z.B. "\*" die maximal mögliche Anzahl an Charakteren
      ("greedy matching"). Man kann durch Dahinterstellen von "?" (also z.B.
      ".\*?") ein non-greedy matching erzwingen, die die minimal mögliche Anzahl
      an Charakteren erfasst. Dies funktioninert in __grep__ aber nur mit der
      Option "-P" (Perl-Style-Matching).
- Diese funktionalen Metacharaktere können auch "escaped" werden, falls die
  ursprüngliche Bedeutung gebraucht wird. Ein Punkt wird also nur zu einem Punkt
  (im Gegensatz zum "beliebigen Zeichen"-Metacharakter), indem man ihm einen
  Backslash voranstellt, also "\\." Analoges gilt auch für z.B. "?, +", etc.
- Es gibt auch noch "Shortcuts" für gewisse Charakterklassen:
    - "\s" steht für alles, was "Whitespace" ist
    - "\d" steht für alle Ziffern. Äquivalent zu [0-9]
    - "\w" steht für aller "Wort"-Charaktere. Äquivalent zu [a-zA-Z0-9_]
    - Die drei Buchstaben oben können auch groß geschrieben werden. Dann dreht
      sich ihre Wirkung genau um - also **kein** Whitespace, **keine** Ziffer
      und **kein** Wort-Charakter.
    Whitespaces:
    - "\t" steht für Tabulatoren
    - "\r" für "Carriage Return"
    - "\n" für "Line Feed/Newline"
- Ankerzeichen
    - "^" steht für den Anfang einer Zeile. "^D" sucht also nach einem "D" am
      Anfang der Zeile
    - "$" steht für das Zeilenende; "r$" sucht nach einem "r" am Zeilenende
- Wortanfang oder Wortende kann markiert werden mit "\b". Es gäbe auch noch
  "\\>" und "\\<", die spezifisch für Wortanfang bzw. Wortende stehen. Diese
  beiden werden aber nicht überall unterstützt, so dass "\b" die sicherere Wahl
  ist.
- Runde Klammern "()" dienen zum Gruppieren von Zeichen. Dies ermöglicht es,
  solche Gruppen separat in der Suche zu behandeln und z.B. ein- oder
  auszuschließen. Ein wichtiger Punkt dabei ist unter anderem, auf die richtige
  Anzahl von Leerzeichen zu achten. "Karl (Friedrich )?Huber" findet sowohl
  "Karl Huber" als auch "Karl Friedrich Huber"; wichtig ist das Leerzeichen in
  der Gruppierung, da in "Karl Friedrich Huber" __zwei__ Leerzeichen vorkommen!
  Weiteres Beispiel: IP-Addressen lassen sich schneller finden mit Gruppen:
  `\b(\d{1,3}\.){3}\d{1,3}\b`, wobei die Gruppe "ein bis drei Ziffern gefolgt
  von einem Punkt" dreimal wiederholt wird (und dann die letzten ein bis drei
  Ziffern __ohne__ folgenden Punkt gesucht werden).
- Referenzieren von Klammern "()": Gesetzte Runde Klammern im Ausdruck können zu
  einem späteren Zeitpunkt mit "\N" referenziert werden, wobei N für 1,2,3...
  steht. Beispielsweise findet "Gigabit (Ethernet)\\.\*Fast \1" alle Strings,
  die in einer Zeile sowohl "Gigabit Ethernet" als auch "Fast Ethernet"
  beinhalten. "\2" würde dann die zweite eingeklammerte Gruppe referenzieren
  usw.
- Das Pipe-Symbol "|" lässt Unterscheidungen zu: "dog|cat" trifft sowohl "dog"
  als auch "cat". Dies ist auch möglich mit mehreren Unterscheidungen wie z.B.
  "dog|cat|bird".
- "Negative Lookahead": z.B. matcht "(?!00)" __nicht__, wenn "danach" zwei
  Nullen folgen ("!" steht hier für den Negationsoperator). "[1-9](?\!00)\d\d"
  matcht alle Zahlen von 101 - 999; die 100 (zwei aufeinanderfolgende Nullen)
  wird hier durch den "negative Lookahead" ausgeschlossen.
- "Positive Lookahead": Umgekehrte Version; "(?=00)" matcht z.B. __alles__, wenn
  danach zwei Nullen folgen!. Beim obigen Beispiel, nun mit "Positive Lookahead"
  wäre es wie folgt: "[1-9](?=00)\d\d" matcht nun die Zahlen 100, 200, 300 etc.
  bis 900 - aber __nicht__ mehr z.B. 802 (keine zwei aufeinanderfolgenden Nullen
  nach der ersten Ziffer!).
- "Lookbehinds (positive/negative)": Man kann auch "zurück schauen" mit
  "(?<=XXX)" und "(?<\!XXX)" (positiv/negativ). "(?<=Mono|Multi)mode-Glasfaser"
  matcht also den String "mode-Glasfaser", aber nur, wenn entweder "Mono" oder
  "Multi" davor steht. Umgekehrt matcht "(?<\!Mono)mode-Glasfaser"
  "mode-Glasfaser, wenn "Multi" davor steht, nicht aber, wenn "Mono" davor
  steht!
