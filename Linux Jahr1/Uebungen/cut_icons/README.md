# cutout\_icons
### Bash contraption for divifying Icon collection Images

This is a bash script that performs, auto-magically, a seperation (many croppings, actually) of picture/icon collection images into individual, smaller images, specified by the user.

### Requirements
1. This script is written in the Bash dialect, so a Bash shell is required,  I guess.
2. The script needs to have the **imagemagick** toolkit installed. It makes use of:
 * convert (-crop) to crop out the individual files
 * identify (-format) to find out the dimensions of the base image

### Usage
Use the script as follows:
`./cutout_icons.sh`, followed by eight(8) parameters, in the following order:
* input filename
* output filename root
* output filename ending (must be a graphics format, e.g. `.jpg`)
* square side length of output icon files in pixels (currently, only square-sized output files are possible)
* x separation between icons, in pixels (0 if nonexistent)
* y separation between icons, in pixels (0 if nonexistent)
* x offset, starting on the left, in pixels (0 if nonexistent)
* y offset, starting on the top, in pixels (0 if nonexistent)

Alternatively, since this can get kinda messy, you can, of course, use standard linux stdin/out/err behaviour and put these parameters in a file, in the right order and separated by whitespace (e.g. Newlines).
Then, you can call the script with:
`cutout_icons.sh $(< parameter_file.txt)`. An example parameter file is provided.

### File list
* `ci_sample_options.txt` -Sample options for processing the provided image file
* `cutout_icons.sh`-main shell script for separating images into smaller ones
* `raw_icons.png` -Sample image file with 100 little icons, to be cut into individual ones
* `README.md` -This file
* `SENSE_icon_display.py` -Small python script for displaying said icons on an RPi with a SenseHAT module

### To-Do-List
* general script cleanup
* making the script more efficient
* also, more user-friendly-ness

### Credits
Script written and maintained by Stede Bonnet (Github: stedebonnet08). Usage allowed for private purposes. Enjoy!
