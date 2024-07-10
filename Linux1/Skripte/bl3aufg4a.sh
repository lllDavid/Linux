#!/bin/bash -e
N=      # N löschen
# neues N auslesen
echo -n "Zahl eingeben, bis zu der aufsummiert werden soll:"
read N

# Check, ob $N leer (geblieben) ist
if [ -z "$N" ]; then
    echo "Zahl nicht vorhanden! Abbruch!"
    exit 1
fi

# Summenvariable
sum=0

# Summierungs-Schleife; seq $N liefert Zahlen zwischen 1 und $N zurück
# Kommandosubstitution mittels $(...) bei seq;
# Arithmetik (Rechnen) nur möglich innerhalb $((...))
for i in $(seq "$N"); do
# for ((i=1;i<=$N;i++)); do
# Alternative: C/C++/C# - like For-Schleife (nur da funktioniert "<=" und "++")
    sum=$(($sum + $i))
done

# Ausgabe (echo -n : Ausgabe ohne Zeilenumbruch)
echo -n "Die Summe der Zahlen von 1 bis $N ist: "
echo $sum

# sauberer exit-code
exit 0
