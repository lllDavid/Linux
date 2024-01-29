#!/bin/bash
# Find-Befehl nach Dateien, die längstens vor 14 d geändert
# wurden; führe dann grep mit Suchtext aus
find . -type f -mtime 21 -exec grep -q $1 {} \; -print

