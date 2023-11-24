#!/bin/bash

N=

read -p "Gib eine Zahl ein zur Berechnung der Armstrong-Zahl: " N

if [[ -z $N ]]; then
    echo "N gleich NULL! Abbruch!"
    exit 1
fi
# N einlesen und auf NULL testen

length=$(echo -n $N | wc -c)
# Länge bestimmen: dieses mal durch Utilities: wc -c liefert einzelne
# byte/char-counts!

ergebnis=0

for((i=0;i<$length;i++)); do
# For-Schleife, zählend von 0 (!) bis $length - 1 (1)
    ergebnis=$(( $ergebnis + ${N:$i:1} ** $length ))
    # Ergebnis aufsummieren; ${N:$i:1} heißt: Nimm von der Variable $N das $i-te
    # Zeichen (Länge: 1!; startend bei 0!). "**"= potenzieren (hier: mit
    # $length)
    echo "i=$i; Ziffer[$i] = ${N:$i:1}; ergebnis=$ergebnis"
    # Test-Ausgabe zu Debugging-Zwecken
done

echo "Die Armstrong-Zahl von $N ist $ergebnis!"
exit 0
# Ausgabe & Exit-Code
