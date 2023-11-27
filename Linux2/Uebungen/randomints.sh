#!/bin/bash

read -p "Bitte eingeben, wie viele Zahlen generiert werden sollen: " N
if [[ -z $N ]]; then
    echo "Keine passende Eingabe"
    exit 1
fi

for ((i=1; i<=$N;i++)); do
    echo $RANDOM
done

exit 0