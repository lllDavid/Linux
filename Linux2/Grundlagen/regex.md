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

## Dinge, die bei Regular Expressions zu beachten sind

### 1) Sonderzeichen berücksichtigen
Sonderzeichen müssen berücksichtigt werden; sowohl innerhalb als auch außerhalb
der RegEx.
Zunächst müssen also z.B. Punkte, Fragezeichen etc. "escaped" werden, nach dem
tatsächlichen Buchstaben gesucht werden soll. Ein Beispiel ist die Suche nach
IP-Addressen: '\d+\.' findet den "tatsächlichen" Punkt in den IP-Addressen.
Außerdem müssen eventuelle Sonderzeichen der Umgebung (Shell) beachtet werden!
Klammern "()" haben zum Beispiel eine eigene Funktion in der (bash)Shell; sie
starten einen darin enthaltenen Befehl innerhalb einer neuen Unter-Shell.
Zur Benutzung in RegEx müssen diese also ebenfalls escaped werden.
Tip: Dazu gibt es allerdings verschiedene "Durchlässigkeits"-Level, je nachdem
welche Anführungszeichen man benutzt, um die RegEx auf der Shell aufzubauen.
Doppelte Anführungszeichen "" lassen noch die meisten Shell-Sonderzeichen durch
(und müssen daher in der RegEx escaped werden), während einfache
Anführungszeichen '' so gut wie alles "wörtlich" sehen. (Ausnahme: ein einfaches
Anführungszeichen kann dann nicht in der RegEx selbst vorkommen, da dieses nicht
(aus der Shell) escaped werden kann!)
**Also sollte man, soweit möglich, einfache Anführungszeichen verwenden, um
RegEx auf der Shell aufzubauen!**

### 2) verschiedene RegEx-Dialekte!
Es gibt verschiedene RegEx-Dialekte, die sich zuweilen nach der Sprache richten,
in der man RegEx benutzt (C++ - Dialekt, Python-Dialekt etc.). Während dort die
Unterschiede meist gering sind, gibt es wesentlche Unterschiede in anderen
Dialekten, die hier hierarchisch aufgelistet sind:
* POSIX BRE (Basic Regex; POSIX=Portable Operating System Interface; garantiert
  einen gewissen Minimal-Standard an Kompatibilität zwischen Betriebssystemen;
  wird meist als Minimal-Unix/Linux-Standard angesehen)
  Dieser RegEx Standard supportet, wie gesagt, die Basics. Wiederholungszeichen,
  eckige Klammern, geschweifte Klammern, Zeilenanfang/ende und
  ODER-Verknüpfungen mit dem Pipe-Symbol "|" (alles siehe oben),
* GNU BRE und ERE (Extended RegEx) beinhaltet außerdem Wort-Grenzen-Operatoren
  (z.B.\b) und weitere Kurz-Klassen (z.B.\d,\w,\s); alles wiederum siehe oben
+ PCRE (Perl-compatible RegEx) liefert den umfangreichsten Satz an
  RegEx-Möglichkeiten; zusätzlich zu allem vorangehendem liefern PCRE auch noch
  die Lookahead- und Lookbehind-Operatoren und(!) den Umschalt-Operator zwischen
  "Greedy"- und non - "greedy" Verhalten der RegEx,

PCRE liefert also die meiste Funktionalität, ist aber auch von der Laufzeit her
am anspruchsvollsten. Bei RegEx in umfangreichen Dateien bleibt durchaus die
Überlegung, auf einen "einfacheren" Dialekt umzuschalten.

### 3) RegEx hat Grenzen!
Für "einfachere" Such- und Ersatz-Operationen sind RegEx sehr gut geeignet. Dies
stößt aber auch an Grenzen. Klammerungen und Back-References "()" und "\1" etc.
können beispielsweise nicht verschiedene Such-Ergebnisse referenzieren (siehe
dazu Uebung05_lsg.md, Aufgabe 2f): "127.", das zuerst gefunden wird, kann nicht
mit "\1" referenziert werden, um die nachfolgende "0." zu finden!).
An Grenzen stößt man auch, wenn man versucht, z.B. alle HTML-Tags in einer Datei
zu entfernen (es gibt einen berühmten StackOverflow-Post hierzu!). Dazu ist es
besser, eine fortgeschrittene Programmiersprache (Python etc., oder auch awk)
oder einen Parser zu benutzen!
