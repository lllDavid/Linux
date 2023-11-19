#!/bin/bash -e
echo "Ich berechne x * y!"
echo -n "Gib x ein: "
read x
echo -n "Gib y ein: "
read y
echo "x * y = $x*$y = $[x*y]"

