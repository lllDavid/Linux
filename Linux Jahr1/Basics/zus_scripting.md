# Zusammenfassung Scripting in Linux (bash)

## Shell-Variablen
* Erstellt mit `var=xxx`
* Beachte: Leerzeichen vor oder nach dem `=` führen zu anderen Variablennamen
  oder -Inhalten!
* Ausgabe des Variablenwertes grundsätzlich mit `$var`; also:
  Erstellen/Eintragen ohne "$"; Abruf mit "$"
* bash kann nicht von selbst rechnen; so etwas wie `erg=3+4`funktioniert
  nicht! Dazu muss die Rechnung folgendermaßen lauten: `erg=$((3+4))`
* Kommandosubstitution: Damit man die Ausgabe eines Programms/Utility erhält,
  muss man folgende Schreibweise verwenden: `a=$(pwd)`
* Es gibt auch in der bash eine Unterscheidung zwischen lokalen und globalen
  Variablen. Variablen mit dem gleichen Namen innerhalb einer Kontrollstruktur
  muss nicht unbedingt identisch zu einer vorher definierten anderen Variable
  sein! Insbesondere: Bei jedem Skript-aufruf wird eine neue bash gestartet!
  Dort fallen also lokal ("normal") definierte Variablen sowieso weg. Aber:
  Variablen die mit `export var` zu einer globalen Variablen gemacht wurden,
  bleiben bestehen!
* Vordefinierte Variablen in bash: z.B. `$0` für den Skriptnamen, `$1-$9` für
  auf der Kommandozeile übergebene Parameter (siehe Buch S. 348)

## Felder/Arrays (noch nicht Schulaufgaben-relevant!)
* zusammenhängende Daten werden oftmals mit Arrays/Vektoren verwendet.
* Defnition: `x=();x[0]=a;x[1]=b...` oder `x=('a', 'b', ...)`
* Abruf: `echo ${x[1]}` oder für alle Elemente: `echo ${x[@]}`
* Assoziative Arrays (key-value-Paare): `declare -A y; y[abc]=1`

## Starten von Skripten
* auf der Kommandozeile: `bash script.sh`. -> Programm: bash (neue Shell!); als
  Parameter: Skriptname. Man kann das Skript aber auch ausführbar machen
  (chmod!); dann kann es auch "alleine" gestartet werden: `./script.sh`
* Innerhalb des Skriptes (1. Zeile!) sollte sich ein sogenannter "shebang"
  befinden, der die Shell angibt, mit der das Skript gestartet werden soll.
  Bsp. (bei uns immer): `\#!/bin/bash`.
* Beachte: Skripte lassen sich auch ohne shebang mit z.B. `bash script.sh`
  starten, da man da ja explizit die bash vorher startet

## Einlesen von (User-) Daten
* Eine Möglichkeit: Übergabe von Parametern bei Skriptaufruf; dann Abfrage von
  `$1, $2,...`
* Oder: Funktion `read x`: Lese Daten vom User (interaktiv) ein und
  speichere die in der Variable x

## Programmier/Kontrollstrukturen
* `if [...]; then...; elsif [...]; then...; else ... fi`
  Entscheidung: Wenn eine Bedingung in den eckigen Klammern (die für
  `test`stehen, erfüllt ist, folge diesem Weg.
* Bedingungen: Inhalt zwischen den eckigen Klammern (`[...]` oder in bash:
  `[[...]]`). Dies kann einen Vergleich, einen Test auf NULL oder ähnliches
  beinhalten. Auch mehrere verknüpfte Vergleiche sind möglich
  Beispiele: `$a -gt $b` - a "greater than" b ?
  `$a -le $b` - a "less than or equal" b?
  ` -z $a ` - ist a gleich NULL?
* case-Verzweigungen: Mehrere Verzweigungen, die sich anhand einfacher
  Muster/Zeichen entscheiden lassen, sind geeignet für case. Bsp:
  ` case $i in 1) opt="Option1";; 2) opt="Option2";; *) opt="Fehler!";; esac`
* for-Schleife: Mehrere Durchläufe mit definiertem Beginn und definiertem Ende.
  Bsp: `for i in {1..10}; do echo $i; done` oder `for ((i=1;i<=10;i++)); do
  echo $i; done`. Nötig sind also die Angabe eines zu durchlaufenden
  "Bereiches" oder "Start/Ende/HochHerunterzählweise"
* while-Schleife: Führe Code aus, solange die angegebene Bedingung gültig
  bleibt. Bsp: `while [[ $i -le 5 ]]; do echo $i; i=$((i + 1)); done` (hier
  muss die "Schleifenvariable" manuell hoch/herunter- gezählt werden!)
* until-Schleife: Führe Code aus, **bis** die angegebene Bedingung zutrifft!
  Bsp: `until [[ $i -gt 5 ]]; do echo $i; i=$((i+1)); done`

## Funktionen (nicht Thema der aktuellen SA)
* Code, den man wiederverwenden will, kann man in einer sogenannten Funktion
  deklarieren und implementieren: `function myfunc {...}`. Abruf: `myfunc`
  Dabei können auch Parameter übergeben werden, die ähnlich der
  Parameterübergabe im ganzen Skript funktionieren! `function myfunc {$1=...}`;
  Abruf: `myfunc "abc"`. Beachte: Dies ist eine **lokale** $1-Variable; sie
  bleibt unberührt zu den evtl **global** definierten $1 etc. Dasselbe gilt für
  $0, $2 etc.
* `exit` wäre eine solche (bereits eingebaute) Funktion: Sie beendet das Skript
  sofort und gibt (optional) noch einen "Fehlercode" zurück!
