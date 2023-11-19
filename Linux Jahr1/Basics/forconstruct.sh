#!/bin/bash -e

for i in a b c; do
    echo "For-Schleife: Durchlauf Nummer $i"
done
# Bereichsangabe: i durchläuft alle möglichen Werte des Bereiches

for i in {1..100}; do
    echo "Zweite Schleife: Durchlauf Nr. $i"
done
# Falls Führende Nullen benötigt werden: {01..100}

for i in {01..100..10}; do
    echo "Dritte Schleife: Schrittweite 10: $i"
done
# Schrittweite kann auch angegeben werden

for ((i=1;i<=15;i++)); do
    echo "Klassische Syntax bei for: $i"
done
# Syntax bekannt aus z.B. C/C++/C#, Java etc.

