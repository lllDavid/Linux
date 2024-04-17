# Übungsblatt 7 Linux - awk

Wir verwenden das Textfile `people.txt`, in dem persönliche Daten zu diversen
Leuten tabellarisch, durch Leerzeichen getrennt, aufgeführt sind.

## Aufgabe 1

### a)
Lasse dir Index, Last Name und First Name anzeigen

`awk '{print $1 "\t" $4 "\t" $3}' people.txt`

### b)
Verändere nun die Reihenfolge: Index, First Name und Last Name

`awk '{print $1 "\t" $4 " " $3}' people.txt`

### c)
Nun versehe das vorige Ergebnis auch noch mit einer erklärenden Überschrift

`awk -v OFS=" " 'BEGIN{print "Index" "\t" "Vorname", "Nachname"}NR>1{print $1, "\t" $3, $4}' people.txt | less`

### d)
Füge auch noch einen Zwischentext der Art "<Vorname>, der den Namen <Nachname>
trägt" zu den Zeilen hinzu

`awk -v OFS=" " 'NR>1{str1 = ", der den Namen trägt"; str2 = "trägt"; print $1, "\t" $3 str1, $4, str2}' people.txt`

### e)
Lasse dir die letzten beiden Spalten anzeigen __ohne von vorne zu zählen__

`awk '{print $NF, $(NF-1)}' people.txt`

## Aufgabe 2

### a)
Finde alle Einträge von "psychologist"s und lasse sie anzeigen

Regex: `awk '/[Pp]sychologist/{print $0}' people.txt`
oder
`awk '/[Pp]sychologist/' people.txt`

### b)
Wieviele weibliche Personen sind in der Liste? Und wie viele männliche?

`awk '/Female/{print $5}' people.txt | wc -l`
`awk '/Male/{print $5}' people.txt | wc -l`

### c)
Gib die Datensätze aus, bei denen die Nachnamen länger als 7 Zeichen sind

`awk 'length($4) > 7 {print $4}' people.txt`

### d)
Gib jeden 8-ten Eintrag aus (Überschrift kann ignoriert werden)

`awk 'BEGIN{cnt = 1}{cnt % 8} == 0{print cnt, $0; cnt++}{cnt++}' people.txt`

`awk '($1 % 8) == 0{print $0}' people.txt`

### e)
Suche alle "Nurse"s und ändere die ID/Nummer in der ersten Spalte, damit die
Nummerierung wieder fortlaufend wird

`awk 'BEGIN{cnt = 1}/[Nn]urse/{$1 = cnt; print $0; cnt++}' people.txt`

## Aufgabe 3

### a)
Benutze awk als Rechner: Berechne z.B. 28.93 * 62.34 und lasse dir das Ergebnis
korrekt formatiert mittels `printf` ausgeben

`awk 'BEGIN {a = 28.93; b = 62.34; printf "28.93 * 62.34 =%10.4f\n", (a * b) }'`

### b)
Gib alle email-Addressen aus, die auf `@example.org` enden

`awk '$6~/\w+@example.org/ {print $6}' people.txt`

`awk '/@example.org/ {print $6}' people.txt`

### c)
Bei den Telefonnummern sind manche Einträge mit runden Klammern versehen.
Entferne diese!

`awk '{gsub("[\(\)]", "", $7); print $0}' people.txt`

### d)
Mache jetzt aus `people.txt` ein `people.csv`, also ein Comma-Seperated-Value
File!

`awk -v OFS="," '{$1=$1; print $0}' people.txt. > people.csv`

`awk -F"," '{$1=$1; print $0}' people.csv > people.txt`