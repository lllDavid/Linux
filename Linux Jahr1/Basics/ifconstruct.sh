#!/bin/bash -e

N=
# Zur Sicherheit: N soll leer sein (könnte ja vorher schon auf der Shell
# benutzt worden sein
echo -n "Bitte gib eine Zahl ein: "
read N

if [ -z $N ]; then
# "[": Test-Symbol in der bash, für Vergleiche (True/False);
# "-z": Testet auf leere Variablen - hier also: Ist $N leer?

    echo "Fehler! Abbruch!"
    exit 1
    # exit beendet das Skript sofort mit einem Fehlercode: 0: erfolgreich;
    # alles andere: Fehler

else

    echo "Die eingegebene Zahl ist: $N"

fi

if [ $N -gt 23 ]; then
    echo "$N ist ganz schön groß!"
# -gt: greater than
# -ge: greater than or equal
# -le: lesser than or equal
# -lt: lesser than
# -eq: is equal to
# -ne: not equal to
# in bash: Innerhalb von doppelten Klammern lassen sich doch die
# Vergleichsoperatoren verwenden; z.B. (("$a" < "$b"))
# logische Operatren zur Verknüpfung: -a (oder &&) für AND; -o (oder ||) für
# OR
# nochmal speziell in bash: Doppelte eckige Klammern "[[ ]]" als
# Test-Bedingung lassen "einfachere" String-Vergleiche zu. Beispiele:
# [[ $a == z* ]]   -> a startet mit "z"
# [[ "$a" < "$b" ]]  -> a ist im Alphabet vor b
# -z: String/Variable ist Null, also hat Null Länge
# -n: String/Variable ist nicht Null.
#
# und verschiedenste File-Test-Operatoren, z.B.
# -e: Datei existiert
# -f: Datei ist eine normale Datei
# -d: Datei ist ein Verzeichnis
# usw.
fi

exit 0

