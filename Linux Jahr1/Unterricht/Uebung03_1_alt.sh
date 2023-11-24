#!/bin/bash -e

X=
Y=
# Variablen (zur Sicherheit) leeren

X=$1
Y=$2
# Variablen besetzt durch Parameterübergabe bei Skriptaufruf

echo "Die angegebenen Zahlen sind $X und $Y."
# Ausgabe übergebene Parameter (bzw. hier schon zugewiesen zu $X und $Y)

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

