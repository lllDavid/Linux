#!/bin/bash

icon_file=$1

outfile=$2

ending=$3

iside=$4

ofx=$5
ofy=$6

stx=$7
sty=$8

if [[ $# -lt 8 ]]; then
    echo "Keine oder nicht genug Parameter!"
    echo "Benutzung: $0 inputfile outputfile filetype iconsize"
    echo "xiconoffset yiconoffset xstartoff, ystartoff"
    exit 1
fi

# Finde die Bildgröße in Pixel
width=$(identify -format '%w' $1)
height=$(identify -format '%h' $1)
echo "Bild-Dimensionen: $width x $height"

px=$stx
py=$sty
# Pixel-Counter an Startposition setzen (also NACH linkem und oberem Rand)

sum=0
# Zähler, wieviele Icons insgesamt produziert werden

# Haupt-Loop: "Rastere" das Bild (mins linkem/oberem Rand) ab; von links nach
# rechts; Zeile für Zeile, bis das Bild in der Breite / in der Höhe "zu Ende"
# ist!

# Counter initialisieren:
i=0
j=0

# erst von oben nach unten
while [[ $(($py + $iside + $ofy)) -le $height ]]; do
    # ... dann von links nach rechts
    while [[ $(($px + $iside + $ofx)) -le $width ]]; do
        convert $icon_file -crop "$iside"x"$iside"\+$px\+$py \
            "$outfile$i$j$ending"
        # px weiterzählen sowie i und sum
        px=$(($px + $iside + $ofx))
        i=$(($i + 1))
        sum=$(($sum + 1))
    done
    # px wieder nach links an den anfang schieben
    px=$stx
    i=0
    j=$(($j + 1))
    # py eine Zeile weiter
    py=$(($py + $iside + $ofy))
done

echo "Insgesamt $sum Icons rausgeschnitten!"
exit 0

