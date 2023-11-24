#!/bin/bash
# Anzeige von verschiedenen (Skript-)Dateien OHNE die Kommentarzeilen
grep -Ev '^[[:space:]]*#|^[[:space:]]*;|^$' $1

