#!/bin/bash -e

x=
y=
# Variablen leeren

echo "Skript zum Bestimmen der größeren von zwei Zahlen"

echo -n "Erste Zahl: "
read x
# Eingabe der beiden Zahlen

echo -n "Zweite Zahl: "
read y

if [[ -z $x || -z $y ]]; then
# Test auf leeres $x ODER leeres $y; "||" steht hier für OR. || möglich wegen
# bash-freundlichen Test-Klammern "[[...]]", die dies zulassen. Bei einfachen
# Test-Klammern "[...]" wäre "-o" nötig
    echo "Ungültige Zahl(en)! Abbruch!"
    exit 1
fi

if [[ $x -gt $y ]]; then
# Falls $x größer als $y, dann gebe dies aus
    echo "$x ist größer als $y!"
elif [[ $x -lt $y ]]; then
# andernfalls: Falls NUN $x kleiner als $y, dann Ausgabe
    echo "$x ist kleiner als $y!"
else
# letzte verbliebene Möglichkeit (deshalb ohne Test-Klammern): $x und $
# gleich groß! Gib dies aus!
    echo "$x und $y sind gleich groß!"
fi

exit 0

