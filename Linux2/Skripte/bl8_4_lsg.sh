#!/bin/bash

# Skript zum Einrichten von temporären Accounts. Diese Accounts müssen (1 pro
# Zeile) mit ihrem Usernamen in der Datei "accounts.txt" zu finden sein!

while read s; do                    # Schleife liest jede Zeile aus der Datei accounts.txt
    pw=$s"-1234"                   # Erstellt das Passwort als Kombination aus Benutzername und "-1234"
    useradd $s                      # Fügt den Benutzer hinzu (angenommen, der Benutzername ist in $s gespeichert)
    echo -e "$pw\n$pw" | passwd --stdin $s  # Setzt das Passwort für den Benutzer auf das generierte Passwort
    chage -d 0 -E 2024-05-31 $s     # Legt das Datum fest, an dem das Passwort geändert werden muss (erstes Login am 31. Mai 2024)
done < accounts.txt                # Weiterlesen der nächsten Zeile aus accounts.txt
