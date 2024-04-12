# GNU awk - Text processing auf der Kommandozeile
Awk ist ein vielseitiges und mächtiges Tool, um Textdateien auf verschiedenste
Arten und Weisen bearbeiten zu können

## Grundlegender Aufbau
Awk-Programme bestehen im Wesentlichen aus drei Teilen: Ein BEGIN-Block, eine
"Hauptschleife", in der ein Text/eine Text-Datei zeilenweise abgearbeitet wird,
und ein END-Block (siehe Bild).

![Image](awk_workflow.png "Workflow in awk")

Die Syntax der Teile:
- BEGIN {awk-Befehle}
- /pattern/ {awk-Befehle}  <- Haupt-Teil
- END {awk-Befehle}

Awk-Programme lassen sich auf der Kommandozeile (üblicherweise eingeschlossen
von einfachen Anführungszeichen) angeben - oder man schreibt selbige in ein
awk-File und ruft dann awk mit der Option __-f__ auf:
`awk -f test.awk input.txt`
Weitere interessante Optionen für awk:
- __-v__ ermöglicht es, Variablen vor der Programmausführung zu setzen:
  `awk -v name=Josef 'BEGIN{printf "Name = %s\n", name}'`
- Variablen die so oder schon standardmäßig gesetzt sind, lassen sich mit
  __--dump-variables__ anzeigen. Es wird eine Datei produziert mit den
  Variablen; standardmäßig ist ihr Name "awkvars.out".

Standardvariablen in awk:
- ARGC: Anzahl der Variablen, die awk übergeben werden (plus 1, weil "awk"
  selbst einen Parameter-Platz einnimmt)
- ARGV: Vektor: ARGV[i] beinhalten die Werte der Variablen; ARGV[0] beinhaltet
  "awk".
- CONVFMT: Umwandlungs-Format für Zahlen. Default ist __%.6g__.
- ENVIRON: Benanntes Array für Umgebungsvariablen. Bsp.: __ENVIRON["USER"]__
- FILENAME: Name des aktuell bearbeiteten Files.
- FS: (input) Field Separator. Default: " ". Kann auch "on the fly" geändert
  werden mit der Option __-F__.
- NF: "Number of Fields" auf der aktuellen Zeile
- NR: "Number of Records" auf der aktuellen Zeile. Zählt sozusagen die Zeilen
  bis zur aktuellen Zeile.
- FNR: Wie oben; der Zähler gilt aber nur für die aktuelle Datei (falls mehrere
  Dateien übergeben werden)
- OFMT: Output-Format. Default: __%.6g__.
- OFS: "Output Field Seprarator". Trennzeichen f. Felder im Output (Default:" ")
- ORS: "Output Record Separator": Trennzeichen für Records/Zeilen. Default:"\n"
- RS: "Record Separator": Trennzeichen für Input-Zeilen. Default:"\n"
- $0: Repräsentiert den ganzen Record/die ganze Zeile
- $n: Steht für das __n-te__ Feld der Zeile

## Felder oder Spalten ausgeben
Eine grundlegende Funktion in awk ist es, dass es einzelne "Spalten/Felder"
erkennen und ausgeben kann. Per default ist das Trennzeichen zwischen den
Feldern ein Leerzeichen (kann geändert werden!). Einzelne Felder lassen sich
dann durch Dollarzeichen ansprechen:
`awk '{print $3 "\t" $4}' input.txt`
Mit __$0__ kann man die ganze Zeile ansprechen/ausgeben.

## Ausgabe nach Muster
Per Default wird die ganze Zeile ausgegeben, in der ein Muster zu finden ist:
`awk '/a/ {print $0} input.txt` ist identisch zu
`awk '/a/' input.txt`

Außerdem lassen sich Variablen manipulieren und Bedingungen fordern:
`awk '/a/ {++count} END {print "Anzahl: ", count}' input.txt
`awk 'length($0) > 18' input.txt     <- äquivalent zu:
`awk 'length($0) > 18 {print}' input.txt`  oder:
`awk 'length($0) > 18 {print $0}' input.txt`   (length(x) ist eine awk-eigene
Funktion!)

## Operatoren in awk
Operatoren funktioneren in awk wie in den meisten Programmiersprachen:
`awk BEGIN {a=50; b=20; print "(a * b) = ", (a * b) }` liefert:
_(a * b) = 1000_
Der "String-concatenation"-Operator ist ein Leerzeichen:
`awk 'BEGIN {str1 = "Hello, "; str2 = "World!"; str3 = str1 str2; print str3 }'`
Ein Operator, um "on the fly" Regex-Operationen durchführen zu können, ist:
__~__ oder verneint: __!~__.

## Regular Expressions
Regex funktioniert in awk, an den passenden Stellen standardmäßig; es gelten die
gleichen Sonderzeichen wie im Regex-Abschnitt.

## Arrays in awk.
Es sind standardmäßige Arrays/Vektoren und benannte Arrays möglich:
`array[0]`
`array["Farbe1"]`

Auch mehrdimensionale Arrays sind möglich, indem man benannte Arrays
"mißbraucht":
`array["0,0"] = 100;
array["0,1"] = 200;
array["0,2"] = 300;
array["1,1"] = 400;
etc.`

## Kontrollstrukturen
Schleifen und Strukturen sind in awk meist am C-Stil ausgerichtet. Es gibt
__If..Else If..Else__, __for()__, __while()__, __do while()__ - Statements. Zum
Ausbruch aus Schleifen können __break__,__continue__ und __exit__ verwendet
werden.

## Funktionen
Funktionen können in awk mit
`function function_name(argument1, argument2,...) {}` erstellt werden.
Der Aufruf erfolgt einfach über den Funktionsnamen (C-Stil!)
awk bringt ausserdem eine Bibliothek an Standard-Funktionen mit (z.B.
__length(x)__ für die Länge eines Strings in Zeichen.)

