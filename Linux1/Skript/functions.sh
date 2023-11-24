#!/bin/bash -e

# Einfache Deklaration/Implementation einer Funktion ohne Parameter
function helloworld {
echo "Hello, World!"
}

# Funktion mit lokalen(!) Funktionsparametern
function myfunc {
echo "Hello, $1"
# System-Parameter $1, $2 etc. werden (lokal!) neu vergeben innerhalb einer
# Funktion!
}

# Funktions-Aufrufe
helloworld
helloworld
helloworld

# Funktions-Aufrufe mit Übergabe der (von der Funktion geforderten)
# Parameter)
myfunc "Matthias"
myfunc "Dani"
myfunc "Fr. Bladier"

echo "Test: Parameter 1 der Funktion ist: $1"
# Tatsächlicher Systemparameter, wie vorher bekannt; Wird bei Skript-Aufruf
# vergeben!
