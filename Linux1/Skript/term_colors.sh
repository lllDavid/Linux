#!/bin/bash

function show_colors {

fore_back=${1}

for i in {0..15}; do
    # make line numbers
    # single-digit line numbers get a leading "0"
    if (( ${i} < 10 )); then
        echo -n "0${i} "
    else
        echo -n "${i} "
    fi

    for j in {0..15}; do
        # make column numbers; pad single digits with "0"
        if (( ${i} == 0 )); then
            if (( ${j} < 10 )); then
                echo -n "0${j} "
            else
                echo -n "${j} "
            fi
        else
            k=$((${i} * ${j}))
            # Differentiate between FG and BG function calls
            if [[ ${fore_back} == "FG" ]]; then
                echo -n "$(tput setaf ${k})FG $(tput sgr0)"
            elif [[ ${fore_back} == "BG" ]]; then
                echo -n "$(tput setab ${k})BG $(tput sgr0)"
            else
                # Break out due to error
                echo "Something went wrong! Aborting!"
                exit 1
            fi
        fi
    done
    # do a newline after each inner loop
    echo ""
done
}

# call function two times; for FG and BG
echo "Foreground colors:"
show_colors "FG"
echo "Background colors:"
show_colors "BG"

exit 0

