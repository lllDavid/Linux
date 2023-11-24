#!/bin/bash

mins=$1

if [[ -z $mins ]]; then
    echo "Minutenzahl NULL! Abbruch!"
    exit 1
fi

hours=$( date +'%-H %-M' | cut -d" " -f1 )
minutes=$( date +'%-H %-M' | cut -d" " -f2 )

old_H=$hours
old_M=$minutes

hourdiff=0
mindiff=0

if [[ $mins -ge 60 || $mins -lt -60 ]]; then
    hourdiff=$(( $mins / 60 ))
    mindiff=$(( $mins % 60 ))
else
    hourdiff=0
    mindiff=$(( $mins % 60 ))
fi

if [[ $(( $minutes + $mindiff )) -ge 60 ]]; then
    hours=$(( $hours + $hourdiff + 1 ))
    minutes=$(( $minutes + $mindiff - 60 ))
elif [[ $(( $minutes + $mindiff )) -lt 0 ]]; then
    hours=$(( $hours + $hourdiff - 1 ))
    minutes=$(( $minutes + $mindiff + 60 ))
else
    hours=$(( $hours + $hourdiff ))
    minutes=$(( $minutes + $mindiff ))
fi

echo "Alte Zeit: $old_H $old_M"
echo "Zu verändern: $mins Minuten, also $hourdiff H, $mindiff M"
echo "Neue Zeit: $hours $minutes"
