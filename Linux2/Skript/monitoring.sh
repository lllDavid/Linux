#!/bin/bash

# E-Mail für Warnmeldungen
recipient="admin@example.com"

# Log-Datei
log_file="/var/log/system_monitor.log"

# Funktion zur Überwachung der Systemressourcen
monitor_system() {
    echo "Monitoring system resources..." >> "$log_file"
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    disk_usage=$(df / | grep / | awk '{print $5}' | sed 's/%//')

    echo "CPU Usage: $cpu_usage%" >> "$log_file"
    echo "Memory Usage: $memory_usage%" >> "$log_file"
    echo "Disk Usage: $disk_usage%" >> "$log_file"

    # Beispielhafte Alarmbedingungen
    if (( $(echo "$cpu_usage > 80" | bc -l) )); then
        echo "High CPU usage detected! Sending alert..." >> "$log_file"
        echo "Subject: High CPU Usage Alert" | sendmail -t $recipient
    fi

    if (( $(echo "$memory_usage > 80" | bc -l) )); then
        echo "High Memory usage detected! Sending alert..." >> "$log_file"
        echo "Subject: High Memory Usage Alert" | sendmail -t $recipient
    fi

    if (( $(echo "$disk_usage > 80" | bc -l) )); then
        echo "High Disk usage detected! Sending alert..." >> "$log_file"
        echo "Subject: High Disk Usage Alert" | sendmail -t $recipient
    fi

    echo "System monitoring complete." >> "$log_file"
}

# Hauptprogramm
monitor_system

exit 0
