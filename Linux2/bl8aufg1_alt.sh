#!/bin/bash

N=$1

if [[ -z $N ]]; then
    echo "No upper bound specified! Cancelling..."
    exit 1
fi

numbers=()

array_remove_item () {
# function to remove an array item from a global Array.
# $1 is the positional number of the entry in the array
# i.e. if you want to remove the 4th entry from the numbers, it is:
# "array_remove_item 3" (Yes, 3 because we start counting with 0).
local numArray=()
local length=${#numbers[@]}
for ((i=0; i<=$length; i++)); do
    if [[ $i -lt $1 ]]; then
        numArray[$i]=${numbers[$i]}
    else
        numArray[$i]=${numbers[$i+1]}
    fi
done

numbers=(${numArray[@]})
}

# populate the array
for ((k=0; k<=$N; k++)); do
    numbers[$k]=$k
done

#.. and remove 0 and 1 (they're just causing complications) so that the array
# starts with "2".
array_remove_item 0
array_remove_item 0

# result array, should hold all the primes from 1 to N (at the start)
primenumbers=()
# arbitrary setting values for first indices (see above) so that the array
# has no holes
primenumbers[0]=0
primenumbers[1]=1

# outer loop: for each new-found prime (${numbers[0]})...
for (( l=2; l<=$N; l++)); do
    # make a variable and find out current array length
    currentprime=${numbers[0]}
    numlength=${#numbers[@]}

    # later iterations produce a NULL value (for now) - exclude them
    if [[ ! -z $currentprime ]]; then
        # entry into result array
        primenumbers[$l]=$currentprime
        # work through the remaining(!, thefore $numlength) array if
        # dividable by $currentprime
        for (( j=0; j<$numlength; j++ )); do
            # if yes, remove that item from the numbers array and reduce
            # array length by one
            if [[ $(( ${numbers[$j]} % $currentprime )) -eq 0 ]]; then
                array_remove_item $j
                numlength=$(($numlength - 1))
            fi
        done
    fi
done

# Output the primes with a nice headline
echo "Die Primzahlen von 1 bis $N sind:"
# start at 2; entries 0 and 1 are not relevant (see above)
for (( m=2; m<=$N; m++ )); do
    # exclude NULL values (at the end)
    if [[ ! -z ${primenumbers[$m]} ]]; then
        echo ${primenumbers[$m]}
    fi
done

exit 0

