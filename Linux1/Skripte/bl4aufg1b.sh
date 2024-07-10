#/bin/bash -e
# Variable (zur Sicherheit) leeren
N=
# N aus Kommandozeilenparameter Nr. 1 füllen
N=$1
# Standard-Check auf Nicht-Leer-Sein
if [ -z $N ]; then
    echo "Keine Zahl eingegeben! Abbruch!"
    exit 1
fi

# Alternatives Verfahren zur Bestimmung der Anzahl der Ziffern:
# Wiederholt durch 10 teilen bis Ergebnis < 10. Zähle gleichzeitig
# Zifferncounter hoch!
numdigits=1
erg=$N
while [ $erg -gt 9 ]; do
    erg=$((erg / 10))
    numdigits=$(($numdigits + 1))
done

echo "Numdigits: $numdigits"

# Ähnlich dann beim alternativen Verfahren zur "Zerstückelung" von $N:
# Wiederholt durch 10 teilen, aber die RESTE (Modulo) in ein Array o.ä.
# schreiben!
