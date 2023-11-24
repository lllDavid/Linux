#!/bin/bash -e

N=

echo -n "Gib eine Jahreszahl ein: "
read N

if [[ -z $N ]]; then
    echo "Ungültige Zahl! Abbruch!"
    exit 1
fi
# Standard: Gib Zahl ein und Teste auf Nicht-Leere

# Durch 4 Teilbar:
if [[ $(($N % 4)) -eq 0 ]]; then
    # durch 100 teilbar:
    if [[ $(($N % 100)) -eq 0 ]]; then
        # durch 400 teilbar:
        if [[ $(($N % 400)) -eq 0 ]]; then
            # Ausgabe(n): $N ist ein/kein SJ; dann exit 0, da manche
            # "Teilbarkeiten" mehrfach vorkommen!
            echo "$N ist ein Schaltjahr!"
            exit 0
        else
            echo "$N ist kein Schaltjahr!"
            exit 0
        fi
    fi
    echo "$N ist ein Schaltjahr!"
    exit 0
else
    echo "$N ist kein Schaltjahr!"
    exit 0
fi

