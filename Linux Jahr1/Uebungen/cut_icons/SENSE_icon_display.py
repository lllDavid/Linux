#!/usr/bin/env python3

# import senseHAT lib
from sense_hat import SenseHat
import time
import glob

# create SenseHAT instance
sense = SenseHat()

# Rotate picture on LED matrix by 180deg.
sense.set_rotation(180)

# get all jpg files in directory, make a clear, show image
# and sleep(display image) for 10 seconds
for filename in glob.glob("*.jpg"):
    sense.clear()
    sense.load_image(filename)
    time.sleep(10)

# another clear at program's end
sense.clear()
