#!/bin/bash

# Funktion zur Primzahlprüfung
is_prime() {
    local num=$1
    if [ $num -le 1 ]; then
        echo "$num ist keine Primzahl."
        return
    fi
    for ((i = 2; i * i <= num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            echo "$num ist keine Primzahl."
            return
        fi
    done
    echo "$num ist eine Primzahl."
}

# Hauptprogramm
read -p "Geben Sie eine Zahl ein, um zu prüfen, ob sie eine Primzahl ist: " number
is_prime $number

exit 0
