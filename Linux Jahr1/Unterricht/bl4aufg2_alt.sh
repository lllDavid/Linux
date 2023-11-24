#!/bin/bash
# mins: Aus Kdo.zeilen-Parameter
mins=$1
# Standard-Check auf Nicht-Leer-Sein
if [[ -z $mins ]]; then
    echo "Keine Zahl(en) eingegeben! Abbruch!"
    exit 1
fi

time=$(date '+%-H %-M')

hour=$(echo -n $time | cut -d" " -f1)
minute=$(echo -n $time | cut -d" " -f2)

zeit_mins=$(($hour * 60 + $minute))

echo "Aktuelle Zeit: $hour ${minute}; in Minuten: $zeit_mins"

zeit_new=$(($zeit_mins + $mins))

zeit_hour=$(($zeit_new / 60))
zeit_mins=$(($zeit_new % 60))

echo "$hour Uhr $minute, verändert um $mins Minuten"
echo "ergibt $zeit_hour Uhr $zeit_mins"

exit 0
