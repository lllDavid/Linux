#!/bin/bash

mins=$1

if [[ -z $mins ]]; then
    echo "Falsche Angabe! Benutzung: $0 [Minuten]"
    exit 1
fi

hours=$( date +'%H %M' | cut -d" " -f1 )
# Stunden und Minuten aus "date", Custom-Format
minutes=$( date +'%H %M' | cut -d" " -f2 )

old_H=$hours
old_M=$minutes
# Alte Uhrzeit speichern
if [[ $mins -ge 60 || $mins -le -60 ]]; then
    hourdiff=$(( 10#$mins / 60 ))
    mindiff=$(( 10#$mins % 60 ))
    


echo "Neue Uhrzeit: "$hours":"$minutes""
# Ausgabe

exit 0

