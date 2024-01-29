#!/bin/bash -e

O=
# Options-Variable zur Sicherheit leeren

echo -n "Gib eine Programmoption ein (von 1-3): "
read O

if [[ -z $O ]]; then
    echo "Fehlerhafte Eingabe! Abbruch!"
    exit 1
fi
# wie gehabt: Eingabe Options-Var; Test auf NULL

case $O in
    1) echo "Option 1 ausgewählt";;
    2) echo "Option 2 ausgewählt";;
    3) echo "Option 3 ausgewählt";;
    *) echo "Nichts vernünftiges angegeben!";;
esac
# Case-Konstrukt: Test auf (viele?) einzelne Werte, ein Default-Zweig mit
# "*)" ist auch vorhanden, um evtl. "Müll" einzufangen!

exit 0
# "Ordentlicher" Programmabschluss mit Exit-Code 0
