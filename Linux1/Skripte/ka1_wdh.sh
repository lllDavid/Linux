#!/bin/bash
# "Shebang"; gibt an, welche Shell das Skript interpretieren soll

#echo -n "Bitte gib die erste Zahl ein: "
#read x
x=$1

# erste Variante: Jeweils kommentierter Code (oben und unten für x und y)
# zweite Variante mit Kommandozeilenparametern: Aktueller Code oben u. unten

#echo -n "Bitte gib die zweite Zahl ein: "
#read y
y=$2

# Check auf "leere" Ein/Angaben: Wenn x oder y leer, beende Skript!
if [ -z "$x" -o -z "$y" ]; then
    echo "Keine Zahl eingegeben!"
    # Nun: Exit aus dem Skript mit Exit Code ungleich 0 (für Fehler!)
    exit 1
fi

z=$((x * y))
# $((...)) - Kommandosubstitution: Berechne/Evaluiere und gib dann das Ergebnis
# zurück!

pari=$((z % 2))
# Parität: Modulo 2; Bei Ergebnis 1 ist z ungerade; bei 0 gerade

echo "Das Ergebnis der Multiplikation ist $z"

# Test, ob $parität = 1
if [ $pari -eq 1 ]; then
    echo "Diese Zahl ist ungerade!"
else
    echo "Diese Zahl ist gerade!"
fi

# ordentlicher Exit mit Exitcode 0
exit 0

