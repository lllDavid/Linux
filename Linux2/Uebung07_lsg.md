# Lösungs-File zum Übungsblatt 7
Using: people.txt

## Aufgabe 1

### a)
awk '{print $1, $4, $3}' people.txt

### b)
awk '{print $1, $3, $4}' people.txt

### c)
awk 'BEGIN {print "Namens-Daten:\nIndex Vorname Nachname"}
    {print $1, $3, $4}' people.txt

### d)
awk 'BEGIN {print "Namens-Daten:\nIndex Vorname Nachname"}
    {print $1, $3, "going by the Name of", $4}' people.txt

### e)
awk '{print $NF, $(NF-1)}' people.txt

## Aufgabe 2

### a)
Regex: awk '/[Pp]sychologist/{print $0}' people.txt
oder
awk '/[Pp]sychologist/' people.txt

