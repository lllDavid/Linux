#!/bin/bash

# Standard-Test: ist $1 vorhanden?
if [[ -z $1 ]]; then
    echo "Bitte Angeben, wie lange das Skript laufen soll (in Minuten)!"
    exit 1
fi

# Start-Ausgabe
echo "Sleep-Skript Start!"

# for-Schleife mit $1 durchläufen; jeweils sleep für 1min. + Status-Ausgabe
for ((i=0;i<$1;i++)); do
# an der Stelle evtl. besser, wenn i=1 als Startwert!
    sleep 1m
    # Hier muss i um 1 hochgezählt werden, da i=0 als Startwert!
    echo "$(($i + 1))te Minute abgelaufen"
done

# End-Ausgabe
echo "Skript beendet!"
exit 0

