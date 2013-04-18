#!/bin/bash
rm /home/pi/workspace/nfc_cats/amelia_total.dat
rm /home/pi/workspace/nfc_cats/bug_total.dat
rm /home/pi/workspace/nfc_cats/tucker_total.dat
sync
awk -f /home/pi/workspace/nfc_cats/plot_total_prep.awk < /home/pi/workspace/nfc_cats/cat.dat 
gnuplot < /home/pi/workspace/nfc_cats/cat_totals.gnu

