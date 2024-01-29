#!/bin/bash -e

i=1
# "Laufvariable" für die While-Schleife

while [[ $i -le 5 ]]; do
# -le: "less than or equal"
    echo "While-Schleife: Durchlauf $i"
    i=$(($i + 1))
    # Laufvariable um 1 hochzählen (sonst: Unendlich-Schleife)
    # muss mit $((..)) gemacht werden in der bash
done

j=5
# "Laufvariable" für die Until-Schleife

until [[ $j -gt 10 ]]; do
# Until: Logisch umgekehrte While-Schleife: Führe aus, bis $j größer als 10
# ist!
# -gt: "greater than"
    echo "Until-Schleife No. $j"
    j=$(($j + 1))
done

