#!/bin/bash
rm /home/pi/workspace/nfc_cats/sadie.dat
rm /home/pi/workspace/nfc_cats/oliver.dat
awk -f /home/pi/workspace/nfc_cats/plot_prep.awk < /home/pi/workspace/nfc_cats/cat.dat 
gnuplot < /home/pi/workspace/nfc_cats/cat.gnu

