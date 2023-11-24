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

# While-Schleifenvariable
i=0
# Aufsummieren mittels while...; "-le" = "less than or equal"
# Arithmetik (Rechnen) nur möglich innerhalb $((...))
while [ $i -le $N ]; do
    sum=$(($sum + $i))
    i=$(($i + 1))
done

# Ausgabe (echo -n : Ausgabe ohne Zeilenumbruch)
echo -n "Die Summe der Zahlen von 1 bis $N ist: "
echo $sum

# sauberer exit-code
exit 0
