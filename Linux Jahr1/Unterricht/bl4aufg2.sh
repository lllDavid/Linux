#!/bin/bash
# mins: Aus Kdo.zeilen-Parameter
mins=$1
# Standard-Check auf Nicht-Leer-Sein
if [[ -z $mins ]]; then
    echo "Keine Zahl(en) eingegeben! Abbruch!"
    exit 1
fi

time=$(date '+%-H %-M')
# Zeit aus "date" auslesen: Optionen bedeuten, dass nur H und M ausgelesen
# werden, ohne führende Nullen

hour=$(echo -n $time | cut -d" " -f1)
minute=$(echo -n $time | cut -d" " -f2)
# Auftrennen in H und M mittels "cut"

org_hour=$hour
org_minute=$minute
# Speichern der Originalzeit

hourdiff=0
mindiff=0
# Stunden, Minutendifferenz

if (( $mins >= 60 )); then
# Runde Klammern für Zahlenvergleiche: Hier funktioniert z.B. ">="!
    hourdiff=$(($mins / 60))
    mindiff=$(($mins % 60))
# Stunden: Ganzzahldivision durch 60; Minuten: Modulo 60
elif [[ $mins -le -60 ]]; then
    hourdiff=$(( $mins / 60))
    mindiff=$(( $mins % 60))
else
    hourdiff=0
    mindiff=$mins
fi

if [[ $(($minute + $mindiff)) -ge 60 ]]; then
# Falls sich Minuten und Differenz nochmals auf über 60 addieren:
    hour=$(( $hour + $hourdiff + 1 ))
# Teile nochmals in +1H und Minuten auf
    minute=$(( $minute + $mindiff - 60 ))
# Abschließende Zeit ausrechnen
elif [[ $(($minute + $mindiff)) -lt 0 ]]; then
    hour=$(( $hour + $hourdiff - 1 ))
    minute=$(( $minute + $mindiff + 60 ))
else
    hour=$(( $hour + $hourdiff ))
    minute=$(( $minute + $mindiff ))
fi

echo -n "Uhrzeit $org_hour Uhr $org_minute, verändert um "
echo "$mins Minuten ergibt $hour Uhr $minute"
# Ausgabe Alte und neue Zeit

exit 0


