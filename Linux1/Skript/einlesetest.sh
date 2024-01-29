#!/bin/bash -e
# Beispiel zum Einlesen eines (numerischen) Wertes
a=                     # a (evtl.) löschen
while [ -z "$a" ]; do  # while (test, ob $a leer ist)
    echo -n "Gib eine Zahl ein: "
    read a
    a=${a##*[^0-9, ' ',-]*}   # Zeichen(ketten) eliminieren, die
		       	      # irgendwelche Zeichen außer 0-9 am Anfang
		       	      # haben
			      # und auch keine Leer/Minuszeichen
    if [ -z "$a" ]; then
        echo "Ungültige Eingabe; bitte Eingabe wiederholen!"
    fi
done
echo $a

