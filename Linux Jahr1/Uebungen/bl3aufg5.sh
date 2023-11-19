#!/bin/bash -e
# Eingabe N
N=
echo -n "Eingabe: Wie weit soll gezählt werden? "
read N

# Test, ob $N leer ist
if [ -z $N ]; then
    echo "Keine gültige Zahl eingegeben! Abbruch!"
    exit 1
fi

# Zahlen testen von 1 bis $N; seq $N liefert 1 2 3 .... $N
for i in $(seq $N); do

    # Tests: Erst Modulo 15 (Reihenfolge wichtig, sonst wird dies
    # immer abgefangen von mod 3 oder mod 5) gleich 0,
    # dann mod3 = 0 und mod5 = 0. Bei keinem Treffer:
    # --> Else: Gib einfach die Zahl aus!
    if [ $(($i%15)) -eq 0 ]; then
        echo "fizzbuzz"
    elif [ $(($i%5)) -eq 0 ]; then
        echo "buzz"
    elif [ $(($i%3)) -eq 0 ]; then
        echo "fizz"
    else
        echo $i
    fi

done

# Sauberer exit-code
exit 0

