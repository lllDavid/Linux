#!/bin/bash -e

X=
Y=
# Variablen (zur Sicherheit) leeren

echo -n "Bitte gib eine Zahl ein: "
read X
# Eingabe der Variablen; echo -n gibt einen String aus ohne Newline

echo -n "Bitte gib die zweite Zahl ein: "
read Y

if [[ -z $X ]]; then
# Test auf ein leeres $X; Wenn $X leer, dann Fehlermeldung + Abbruch
    echo "X ist unbelegt! Abbruch!"
    exit 1
fi

ergebnis=$(( $X * $Y ))
# bash kann nicht ohne weiteres rechnen; innerhalb $((...)) auch nur mit
# ganzen Zahlen!

echo "$X mal $Y ergibt $ergebnis"
# Ausgabe Ergebnis
exit 0
# "Sauberer" Exit-Code

