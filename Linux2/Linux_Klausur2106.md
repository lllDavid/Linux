David Wagner 

a)
awk 'BEGIN{print "Id H(in) W(pnd)"} NR>1{print $0}' height_weight.txt > height_weight2.txt

b)
awk '$3<120{print"Weight:" $3}' height_weight2.txt
awk '$2>70{print"Height" $2}' height_weight2.txt

c)
awk '{if ($3<120) {print "ID" $1 "Weight:" $3 "Mehr Essen"}  else { print "ID" $1 "Weight:" $3 "Weniger Essen"}}'  height_weight2.txt

d)
awk '{average+=$2 } END { print "Average Height = ",average/NR}' height_weight2.txt
awk '{average+=$3 } END { print "Average Weight= ",average/NR}' height_weight2.txt

e)
awk 'BEGIN{print "Id H(cm) W(kg)"} NR>1{print $0, $2*2.54, $3/0.453}' height_weight.txt > height_weight3.txt

f)
awk 'BEGIN{print "Id BMI"} NR>1{print $1 $3/$2}' height_weight.txt > height_weight3.txt

