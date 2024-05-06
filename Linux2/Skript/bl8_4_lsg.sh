#!/bin/bash

# Skript zum Einrichten von temporären Accounts. Diese Accounts müssen (1 pro
# Zeile) mit ihrem Usernamen in der Datei "accounts.txt" zu finden sein!

while read s; do
    pw=$s"-1234"
    useradd $s
    echo -e "$pw\n$pw" | passwd --stdin $s
    chage -d 0 -E 2024-05-31 $s
done < accounts.txt

