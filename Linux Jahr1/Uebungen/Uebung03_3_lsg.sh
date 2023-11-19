#!/bin/bash -e

# case-Konstrukt: Auswahl aus verschiedenen (festen) Werten
case $1 in
    # mehrere "Optionen" möglich, getrennt durch das Pipe-Symbol "|"
    --test|-t)
        echo "Testlauf: Test-Option ausgewählt!"
        ;;
    --help|-h)
        echo "Verwendung: $0 --test|--help|--version|-t|-h|-v"
        ;;
    --version|-v)
        echo "$0 Version 0.0.1"
        ;;
    # * für alle anderen Eingaben
    *)
        echo "Fehler: Für Hilfe bitte $0 --help aufrufen!"
        ;;
esac

exit 0
