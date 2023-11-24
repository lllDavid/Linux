#!/bin/bash

# testing bash colors
function show_colors {
    # defining passed function parameter as fore_back
    fore_back=${1}
    for i in {0..15}
    do
        # make line numbers
        # check for single-digit line number, pad with an "0" if necessary
        if (( ${i} < 10 ))
        then
            echo -n "0${i} "
        else
            echo -n "${i} "
        fi

        # inner loop, 16 items per line
        for j in {0..15}
        do
            # make column numbers
            # check for single digits, pad with "0"
            if (( $i == 0 ))
            then
                if (( $j < 10 ))
                then
                    echo -n "0${j} "
                else
                    echo -n "${j} "
                fi
            else
                k=$((${i} * ${j}))
                # get info whether FG/BG; string equality has to be tested
                # with "=="; "-eq" won't work
                if [[ ${fore_back} == "FG" ]]
                then
                    echo -n "$(tput setaf ${k})FG $(tput sgr0)"
                elif [[ ${fore_back} == "BG" ]]
                then
                    # -n option suppresses newline at the end
                    echo -n "$(tput setab ${k})BG $(tput sgr0)"
                else
                    # Break out due to error
                    echo "Something went wrong. Aborting..."
                    exit 1
                fi
            fi
        done
        # do a newline after filling each line
        echo ""
    done
}

# call function two times, one with "FG", the other one with "BG"
echo "Foreground colors:"
show_colors "FG"
echo -e "\nBackground colors:"
show_colors "BG"

exit 0

