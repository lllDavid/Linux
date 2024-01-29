#!/bin/bash

# Pfad zur /proc/stat Datei
proc_stat="/proc/stat"

# Lese die CPU-Statistik aus und extrahiere die Werte
cpu_stats=$(cat $proc_stat | grep '^cpu ')

# Extrahiere die Werte
user=$(echo $cpu_stats | cut -d ' ' -f 2)
nice=$(echo $cpu_stats | cut -d ' ' -f 3)
system=$(echo $cpu_stats | cut -d ' ' -f 4)
idle=$(echo $cpu_stats | cut -d ' ' -f 5)
iowait=$(echo $cpu_stats | cut -d ' ' -f 6)
irq=$(echo $cpu_stats | cut -d ' ' -f 7)
softirq=$(echo $cpu_stats | cut -d ' ' -f 8)

# Gib die Werte aus
echo "User: $user"
echo "Nice: $nice"
echo "System: $system"
echo "Idle: $idle"
echo "I/O Wait: $iowait"
echo "IRQ: $irq"
echo "SoftIRQ: $softirq"
