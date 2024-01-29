#!/bin/bash -e

case $1 in
    --test|-t)
        echo "Dies ist die --test option"
        exit 0          # "erfolgreicher" Programmabschluss
    ;;
    --help|-h)
        echo "Help: Usage:"
        echo "$0 [--test|--help|--version]"
        exit 0
    ;;
    --version|-v)
        echo "$0 version 0.0.1"
        exit 0
    ;;
    *)
        echo "Es gibt keine solche Option!"
        echo "Usage:"
        echo "$0 [--test|--help|--version]"
        exit 1          # kein zufriedenstellender Programmabschluss
    ;;
esac
echo "Du hast '$1' als Parameter angegeben!"
