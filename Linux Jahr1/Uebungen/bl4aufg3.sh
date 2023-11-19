#!/bin/bash

a=$1
b=$2
c=$3
# Parameterübergabe von der Kommandozeile

if [[ -z $a || -z $b || -z $c ]]; then
    echo "Eine oder mehrere Zahlen sind NULL!"
    exit 1
fi
# Test: ist eine der 3 Zahlen NULL?
if [[ $a -eq 0 || $b -eq 0 || $c -eq 0 ]]; then
    echo "Eine oder mehrere Zahlen sind gleich 0!"
    exit 1
fi
# zweiter Test: ist eine der drei Zahlen gleich 0? (dann ebenfalls exit)

if (( $(( $a + $b )) >= $c && $(( $b + $c )) >= $a && $(( $a + $c )) >= $b ))
# runde Klammern für arithmetische Vergleiche; Dreiecksungleichungen
then
    if (( $a == $b && $b == $c )); then
    # Fälle implementieren für gleichseitig, gleichschenklig oder anders
        echo "Dies ist ein gleichseitiges Dreieck!"
    elif (( $a == $b || $b == $c || $a == $c )); then
        echo "Dies ist ein gleichschenkliges Dreieck!"
    else
        echo "Weder ein gleichseitiges noch ein gleichschenkliges Dreieck!"
    fi
else
    echo "Daraus ergibt sich kein konstruierbares Dreieck!"
    # Ausgabe für nicht konstruierbares!
fi

exit 0

