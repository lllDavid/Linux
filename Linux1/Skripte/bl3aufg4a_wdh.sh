#!/bin/bash

N=$1
# N geholt aus Kommandozeilenparameter

# Startwerte
i=1
ergebnis=0
# Haupt-Schleife: Zähle i zum Ergebnis hinzu; zähle i eins weiter
# solange i <= ( -le; lesser than or equal) N
while [ $i -le $N  ]; do
    ergebnis=$(($ergebnis + $i))
    i=$(($i + 1))
done

# Ausgabe Ergebnis
echo "Die Summe aus 1 bis $N ergibt $ergebnis"

