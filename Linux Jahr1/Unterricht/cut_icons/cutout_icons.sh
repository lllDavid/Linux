#!/bin/bash

############################################################################
###                                                                      ###
###                 Icon cutting tool by Stede Bonnet                    ###
###                                                                      ###
###         for cutting images with icon collections into single         ###
###                           icon files                                 ###
###         Requirements: Needs to have imagemagick pack installed       ###
### Usage of this script: scriptname followed by 8 parameters,           ###
### seperated by whitespaces, in the following order:                    ###
### icon filename, output filename pattern, output filename ending       ###
### (must be a graphics format), square pixel size of output icons,      ###
### x separation between icons, y separation beween icons, x offset,     ###
### y offset.                                                            ###
### Alternatively, put those parameters in a file                        ###
### (seperated by whitespace)                                            ###
### and call script by scriptname $(< parameter_file.txt).               ###
############################################################################

# input file
icon_file="${1}"

# output filename pattern
outfile="${2}"

# output filename ending
ending="${3}"

# icon size in pixels squared (i.e. iside * iside)
iside=${4}

# horizontal offset in between icons x pixels and y pixels
ofx=${5}
ofy=${6}

# starting offset x pixels y pixels
stx=${7}
sty=${8}

# Testing for missing parameters:
if [[ ${#} -lt 8 ]]
then
    echo "No or not enough parameters given!"
    echo -n "Usage: ${0} inputfile outputpattern outputfiletype
    iconsize"
    echo "xiconoffset yiconoffset xconrneroffset ycorneroffset"
    # exit with error code
    exit 1
fi

# find out picture dimensions
width=$(identify -format '%w' ${1})
height=$(identify -format '%h' ${1})
echo "Picture Width: ${width}"
echo "Picture Height: ${height}"

# initializing pixel count in x-direction
# somewhat redundant for y-direction, done for clarity
px=${stx}
py=${sty}

# initialize loop variables
i=0
j=0
# initialize summary counter
sum=0

# main loop: run down so long as pixelcount plus another icon's height
# doesn't exceed height
# last icon in the column doesn't need $ofy any more, so there's probably
# room for improvement
# $(()) necessary for arithmetic calculations
while [[ $((${py} + ${iside} + ${ofy})) -le ${height} ]]
do
    # ...and run across so long as pixelcount plus another icon's width
    # doesn't exceed width
    while [[ $((${px} + ${iside} + ${ofx})) -le ${width} ]]
    do
        # execute convert tool, see imagemagick convert manual:
        # cropping whole file to pixels needed for 1 icon
        convert ${icon_file} -crop ${iside}x${iside}\+${px}\+${py} \
                "${outfile}${i}${j}${ending}"
        # go to next x coordinate/icon no./increment sum
        px=$((${px} + ${iside} + ${ofx}))
        i=$((${i} + 1))
        sum=$((${sum} + 1))
    done
    # reset x offset for next line of icons/go to next y icon no.
    px=${stx}
    j=$((${j} + 1))
    i=0
    # next y coordinate
    py=$((${py} + ${iside} + ${ofy}))
done

# Print out success message
echo "Cut out ${sum} icons"
