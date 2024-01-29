#!/bin/bash -e
# Variable (zur Sicherheit) leeren
N=
# N aus Kommandozeilenparameter Nr. 1 füllen
N=$1
# Standard-Check auf Nicht-Leer-Sein
if [ -z $N ]; then
    echo "Keine Zahl eingegeben! Abbruch!"
    exit 1
fi

# Rausfinden der Anzahl der Ziffern über "wc-c"
numdigits=$(echo -n $N | wc -c)

# Array anlegen für die Ziffern, dann per "cut -b$i" - utility füllen
# bis volle Anzahl der Ziffern erreicht ist
digit=()
for ((i=1;i<=$numdigits;i++)); do
    digit[i]=$(echo -n $N | cut -b$i)
done

# Anlegen einer Ergebnis-Variable
result=0

# Berechnen der Armstrong-Zahl: result=result + digit^numdigits (wiederholt)
for ((i=1;i<=$numdigits;i++)); do
    result=$(($result+${digit[i]}**$numdigits))
done

# Ausgabe
echo "Die Armstrong-Zahl von $N ist:"
echo $result


exit 0
