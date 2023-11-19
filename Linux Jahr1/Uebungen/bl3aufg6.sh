#!/bin/bash -e
# Schaltjahr-Tester
# Eingabe und Test einer Zahl: Darf nicht leer bleiben
N=

# Jahreszahl einlesen
echo -n "Bitte eine Jahreszahl eingeben! "
read N

# Check, ob Jahreszahl leer geblieben ist -> Programmende
if [ -z $N ]; then
    echo "keine gültige Zahl! Abbruch!"
    exit 1
fi

# Äußerer Check, ob Jahreszahl durch 4 teilbar
# ( mod 4 muss 0 ergeben)
if [ $(($N % 4)) -eq 0 ]; then
    # Jahreszahlen teilbar duch 100 sind KEINE Schaltjahre
    if [ $(($N % 100)) -eq 0 ]; then
        # ...jedoch sind Jahreszahlen teilbar durch 400 doch wieder Sch.J.
        if [ $(($N % 400)) -eq 0 ]; then
            echo "$N ist ein Schaltjahr!"
            # Jeweils Programmende mit "Erfolgreich"-Exit code
            exit 0
        else
            echo "$N ist kein Schaltjahr!"
            exit 0
        fi
    else
        echo "$N ist ein Schaltjahr!"
        exit 0
    fi
else
# Alle anderen Fälle: Kein Schaltjahr!
    echo "$N ist kein Schaltjahr!"
    exit 0
fi

