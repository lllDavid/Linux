#!/bin/bash

a=$1
b=$2
c=$3
# Kommandozeilen-Parameter

if [[ -z $a || -z $b || -z $c ]]; then
    echo "Eingabefehler! Abbruch!"
    exit 1
fi

if [[ $(( $a + $b )) -ge $c && $(( $b + $c )) -ge $a && $(( $a + $c )) -ge $b ]]
then
# implementieren der Dreiecksungleichungen (alle müssen gelten!)
    if [[ $a -eq $b && $b -eq $c ]]; then
    # Fall a = b = c
        echo "Das resultierende Dreieck ist ein gleichseitiges!"
    elif [[ $a -eq $b || $b -eq $c || $c -eq $a ]]; then
    # Fall a = b != c und durch-rotiert
        echo "Dies ist ein gleichschenkliges Dreieck!"
    else
        echo "Ein anderweitiges Dreieck!"
    fi
else
    # Falls sich kein Dreieck ergibt:
    echo "Dies ist kein Dreieck!"
fi

exit 0

