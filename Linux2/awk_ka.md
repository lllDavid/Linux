Linux Kurzarbeit David Wagner 19.04.2024

Aufgabe
a)

awk -F"," '{$1=$1; print $0}' customers.csv > customers.txt

b)

awk -v OFS=" " '{$1=$1; print $1, $4, $5, $6, $7, $8, $9, $10, $11, $12, $15, $16, $17, $18}' customers.txt > customers2.txt

c)

awk -v OFS=" " 'BEGIN{print "Id" "\t" "Fname" "\t" "Lname" "\t" "Phone"}NR>1{print $1, "\t" $2, $3, $4,$5,$6, $7, $8, $9, $10, $11, $12}' customers2.txt > customers3.txt

d)

 awk -v OFS=" " 'BEGIN{print "Id" "\t" "Fname" "\t" "Lname" "\t" "Phone"}NR>500 && NR<512 {print $1, "\t" $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12}' customers2.txt > customers3.txt


e)

awk '(($1 % 3) == 0) {print}' customers3.txt


f)

awk '$3 == "Thomas"' customers.txt


