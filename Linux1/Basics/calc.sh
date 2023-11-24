#!/bin/bash

# Eingabe von 3 Werten; zwei Zahlen und ein Buchstabe aus der Menge [a/s/d/m]
x=
y=

echo -n "Gib eine Zahl ein: "
read x
echo -n "Gib die zweite Zahl ein: "
read y

rechenart=

echo -n "Nun gib eine Rechenart ein! [a/s/d/m]: "
read rechenart

# Test, ob mind. eine der Zahlen NULL ist. -> Abbruch
if [ -z "$x" -o -z "$y" ]; then
    echo "Zahl(en) NULL! Abbruch!"
    exit 1
fi

# Ergebnisvariable schonmal leeren (eigentlich überflüssig)
erg=

# Unterscheidung der $rechenart mittels case; Dazu noch der Default-Fall "*)"
# für falsche eingaben mit Hinweis auf die richtige Eingabe
# Dann die jeweilige Berechnung mit $((...)) und Ausgabe des Ergebnisses
case $rechenart in
    a)
        erg=$(($y + $x))
        echo "$y plus $x ergibt $erg"
    ;;
    s)
        erg=$(($y - $x))
        echo "$y minus $x ergibt $erg"
    ;;
    d)
        erg=$(($x / $y))
        echo "$x geteilt durch $y ergibt $erg"
    ;;
    m)
        erg=$(($x * $y))
        echo "$x mal $y ergibt $erg"
    ;;
    *)
        echo "Falsche Eingabe zur Rechenart! [a/s/d/m]"
    ;;
esac

# sauberer Exit-Code
exit 0

