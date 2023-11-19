#!/bin/bash

N=

read -p "Gib eine Zahl ein, bis zu der aufsummiert werden soll: " N
# "fortgeschrittenes" read: Option -p liefert gleich den Eingabe-Prompt

if [[ -z $N ]]; then
    echo "Keine vernünftige Eingabe!"
    exit 1
fi
# Standard-Test auf NULL

i=1
ergebnis=0
# Variablen, die initialisiert werden müssen vor der while-Schleife

while [[ $i -le $N ]]; do
# "Solange i <= $N, durchlaufe die Schleife (-le = less than or equal)"
    ergebnis=$(($ergebnis + $i))
    # Neues ergebnis berechnen
    echo "i=$i; ergebnis=$ergebnis"
    # Test-Echo
    i=$(($i + 1))
    # Inkrementieren von i (wichtig, sonst ergibt sich eine Endlos-Schleife!)
done

echo "Die Zahlen aufsummiert von 1 bi $N ergeben $ergebnis"
exit 0
# Ausgabe & Exit-Code

