#!/bin/bash

# Skript zur Auftrennung von Iconsammlungen in einzelne Dateien. Beispiel-Aufruf
# in ci_sample_options.txt; Aufruf: ./Icon_cut.sh $(< ci_sample_options.sh)

# input file
icon_file=$1

# output file-Muster
outfile=$2

# output Dateiendung
ending=$3

# Icon-Größe in "Quadratpixel" (also iconseite * iconseite)
iside=$4

# Offset zwischen den Icons: x Pixel und y Pixel
ofx=$5
ofy=$6

# Start-Offset x Pixel und y Pixel
stx=$7
sty=$8

# Test: Fehlen Parameter?
if [[ $# -lt 8 ]]; then
    echo "Keine oder nicht genug Parameter!"
    echo -n "Benutzung: $0 inputfile outputmuster, outputendung, icongroesse"
    echo "xiconoffset yiconoffset xeckeoffset yeckeoffset"
    exit 1
fi

#Finde Bildgroesse heraus
width=$(identify -format '%w' $1)
height=$(identify -format '%h' $1)

echo "Bildbreite: $width"
echo "Bildhöhe: $height"

# Nochmaliges Speichern der Koordinaten (notwendig, um nachher zur nächsten
# Zeile zu gelangen
px=$stx
py=$sty

# initialisiere Laufvariablen
i=0
j=0
# Summen-Counter:
sum=0

# Haupt-Schleife: Laufe in Y-Richtung nach unten, so lange bis kein neues Icon
# mehr in "height" passt
while [[ $(( $py + $iside + $ofy )) -le $height ]]; do
    # innere Schleife: Laufe von links nach rechts bis die Breite überschritten
    # ist
    while [[ $(( $px + $iside + $ofx )) -le $width ]]; do
        # imagemagick-Befehl: Crop Image auf die angegebenen Koordinaten!
        convert $icon_file -crop ${iside}x${iside}\+${px}\+${py} \
            "${outfile}${i}${j}${ending}"
        # nächste X-Koordinate berechnen: Startwert + Iconbreite + Zw.raum
        px=$(( $px + $iside + $ofx ))
        i=$(( $i + 1 ))
        sum=$(( $sum + 1))
    done
    # Koordnaten zurücksetzen: Nächste Zeile!
    px=$stx
    j=$(( $j + 1 ))
    i=0
    py=$(( $py + $iside + $ofy ))
done

# Erfolgsmeldung
echo "$sum Icons ausgeschnitten!"

exit 0


