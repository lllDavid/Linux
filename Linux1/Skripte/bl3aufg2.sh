#!/bin/bash -e
echo "Gib nacheinander x und y ein: "
read x
read y

if [ "$x" -gt "$y" ]; then
    echo "$x ist größer als $y"
elif [ "$x" -lt "$y" ]; then
    echo "$x ist kleiner als $y"
else
    echo "$x ist gleich $y"
fi

