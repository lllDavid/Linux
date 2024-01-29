#!/bin/bash

# Daten-Vektor; 3 Werte pro CPU (user/system/idle) für Gesamt und 6 Kerne
# also: cpuuse[0]=user; cpuuse[1]=system; cpuuse[2]=idle für Gesamtauslastung;
# danach folgen je drei Werte pro Kern.
cpuuse=()
# Daten für Gesamt-CPUs:
# Spalten 2, 4, 5 für user/sys/idle in /proc/stat; daraus greppen nach "cpu "
cpuuse[0]=$(cat /proc/stat | grep 'cpu ' | cut -d' ' -f3)
cpuuse[1]=$(cat /proc/stat | grep 'cpu ' | cut -d' ' -f5)
cpuuse[2]=$(cat /proc/stat | grep 'cpu ' | cut -d' ' -f6)

# Daten für die einzelnen CPU-Kerne (0 bis 5): 
for i in {0..5}; do
    # wie bei Gesamt-CPU; Spaltenzahlen sind hier aber verschoben!
    # Werte: cpuuse[4] für user auf cpu 0; cpuuse[5] für sys auf cpu 0 etc.
    cpuuse[$(($i * 3 + 3))]=$(cat /proc/stat | grep "cpu$i" | cut -d' ' -f2)
    cpuuse[$(($i * 3 + 4))]=$(cat /proc/stat | grep "cpu$i" | cut -d' ' -f4)
    cpuuse[$(($i * 3 + 5))]=$(cat /proc/stat | grep "cpu$i" | cut -d' ' -f5)
done

#  Zu debugging-Zwecken:
#echo ${cpuuse[@]}

# Überschrift
echo "--- Momentane CPU-Belastung ---"

# Berechnung der Gesamt-Belastung + Ausgabe
cpuusagetotal=$((100 * (${cpuuse[0]} + ${cpuuse[1]}) /
    (${cpuuse[0]} + ${cpuuse[1]} + ${cpuuse[2]}) ))

echo "CPU-Belastung insgesamt: $cpuusagetotal %"

# Berechnung der Belastung der einzelnen Kerne + Ausgabe
for i in {0..5}; do
    # Vorab-Berechnung der Vektoren-Indizes; dient der Übersichtlichkeit
    j=$(($i * 3 + 3))
    k=$(($i * 3 + 4))
    l=$(($i * 3 + 5))
#  Zu debugging-Zwecken:
#    echo "Indizes(jkl): $j $k $l"
#    echo "CPU user: ${cpuuse[$j]}"
#    echo "CPU sys : ${cpuuse[$k]}"
#    echo "CPU idle: ${cpuuse[$l]}"
    cpuusage=$((100 * (${cpuuse[$j]} + ${cpuuse[$k]}) /
        (${cpuuse[$j]} + ${cpuuse[$k]} + ${cpuuse[$l]}) ))

    echo "Kern $i Belastung: $cpuusage %"
done

# "ordentliches" Exit-Signal
exit 0

