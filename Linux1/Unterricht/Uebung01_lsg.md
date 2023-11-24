#  Lösungen zum Übungsblatt 1

## Aufgabe 1
    who > eingeloggt

## Aufgabe 2
    ps -ef | grep root > rootprozesse

## Aufgabe 3
    ps -ef | grep -v root >> rootprozesse

## Aufgabe 4
    ls /etc | wc -w

wc: Word Count; Option -w steht für das Zählen der Wörter

## Aufgabe 5
    grep "/bin/bash" /etc/passwd | wc -l

/etc/passwd enthält Daten zu den Benutzern, u.a. Login-Shell
wc: Option -l zählt die Zeilen des Inputs
