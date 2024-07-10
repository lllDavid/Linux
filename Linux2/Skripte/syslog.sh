#!/bin/bash

syslog_path="/var/log/syslog"

# Definiere den gewünschten Zeitraum (Beispiel: letzten 24 Stunden)
start_time=$(date -d "24 hours ago" "+%b %e %H:%M:%S")
end_time=$(date "+%b %e %H:%M:%S")

# Suche nach Zeilen mit einem bestimmten Zeitraum und Meldung
search_pattern="error"

# Verwende grep, um nach Zeilen zu filtern
grep -E "$start_time|$end_time|$search_pattern" $syslog_path 
