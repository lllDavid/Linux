#!/bin/bash

N=$1

if [[ -z $N ]]; then
    echo "Please state upper bound! Cancelling..."
    exit 1
fi

# An initial Array. Its positions represent True/False values (1/0) for whether
# they're still in the prime race.
numbers=()

# populating the Array with all True values EXCEPT 0 or 1 - they're right out.
for (( i=0; i<=$N; i++ )); do
    if [[ $i -le 1 ]]; then
        numbers[$i]=0
    else
        numbers[$i]=1
    fi
done

# result array; should hold all the primes from 1 to $N (at the beginning)
primenumbers=()
# Arbitrary Setting index 0 so that the array has no holes
primenumbers[0]=1

# Defining start with prime number 2
startprime=2

# outer loop, for each new-found prime...
for (( i=1; i<=$N; i++ )); do
    # the now-starting prime is surely a prime so we put it into the result
    # array
    primenumbers[$i]=$startprime
    # inner loop: check the new-found prime against the whole numbers array, set
    # it to 0/false if a modulus 0 is found (i.e. dividable by that number)
    for (( j=1; j<=$N; j++ )); do
        if [[ $(( $j % $startprime )) -eq 0 ]]; then
            numbers[$j]=0
        fi
    done
    # find the next "start"prime: seek the first 1/true value in the numbers
    # array, set it as start prime, THEN break out of the loop (important!)
    for (( k=$startprime; k<=$N; k++ )); do
        if [[ ${numbers[$k]} -eq 1 ]]; then
            startprime=$k
            break
        fi
    done
done

# those two loops should simultaneously reduce the whole numbers() array to
# all-zeros while populationg the primenumbers() array with the primes being
# found (plus "polluting" the end of the array with repeated versions of the
# last found prime; hard to avoid with this 0/1 array method)

# Output the primes with a nice headline
echo "Die Primzahlen von 1 bis $N sind:"
# start at 1; remember array-entry 0 is not relevant and was just arbitrarily
# filled
for (( i=1; i<=$N; i++ )); do
    # check if the last prime number equals the current prime number to stop the
    # repeats occurring at the end of primenumbers()
    if [[ ${primenumbers[$i]} -ne ${primenumbers[$i-1]} ]]; then
        echo ${primenumbers[$i]}
    fi
done

exit 0

