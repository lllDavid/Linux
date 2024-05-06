#!/bin/bash

back_dir="/home/matthias/Backup"
# es kann auch über Dateien gelooped werden auf diese Art und Weise
for f in $back_dir/*.tar.gz; do
    # benenne Dateien um; inkludiere den Suffix "_old". Dabei helfen die in der
    # bash eingebauten String-Manipulations-Möglichkeiten: ${f%xxx} sucht das
    # kürzeste Vorkommen von "xxx" in $f, startend am Ende.
    # Effektiv wird die alte Endung abgeschnitten und die neue, inklusive "_old"
    # wieder hinzugefügt
    mv -- "$f" "${f%.tar.gz}_old.tar.gz"
done

# Starten des eigentlichen Backup-Skriptes
bash bl8_2_lsg.sh

# Find-Befehl, um Dateien (-type f), die vor 30+ Tagen zuletzt bearbeitet wurden
# (-mtime) und die die Endung ".tar.gz" aufweisen zu finden. Die execdir-Option
# des find-Befehles lässt uns die Dateien gleich weiter verarbeiten - hier also
# um sie zu löschen (Achtung: "--" heißt: hier gibt es keine (weitere) Optionen
# und ist hier nötig, um eindeutig zu bleiben.
find "$back_dir/" -type f -mtime +30 -name '*.tar.gz' -execdir rm -- '{}' \;

exit 0

