#!/bin/bash

N=

read -p "Gib eine Zahl ein, bis zu der aufsummiert werden soll: " N
# "fortgeschrittenes" read: Option -p liefert gleich den Eingabe-Prompt

if [[ -z $N ]]; then
    echo "Keine vernünftige Eingabe!"
    exit 1
fi

i=1
ergebnis=0

until [[ $i -gt $N ]]; do
# Logisch umgekehrte Bedingung: Abbruch, sobald i > $N
    ergebnis=$(($ergebnis + $i))
    echo "i=$i; ergebnis=$ergebnis"
    i=$(($i + 1))
done

echo "Die Zahlen aufsummiert von 1 bi $N ergeben $ergebnis"
exit 0

