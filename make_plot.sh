#!/bin/bash
rm /home/pi/workspace/nfc_cats/amelia.dat
rm /home/pi/workspace/nfc_cats/bug.dat
rm /home/pi/workspace/nfc_cats/tucker.dat
sync
awk -f /home/pi/workspace/nfc_cats/plot_prep.awk < /home/pi/workspace/nfc_cats/cat.dat 
gnuplot < /home/pi/workspace/nfc_cats/cat.gnu

