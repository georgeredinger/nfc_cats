#!/bin/bash
rm /home/pi/workspace/nfc_cats/amelia_total.dat
rm /home/pi/workspace/nfc_cats/bug_total.dat
rm /home/pi/workspace/nfc_cats/tucker_total.dat
sync
awk -f /home/pi/workspace/nfc_cats/total_plot.awk < /home/pi/workspace/nfc_cats/cat.dat 
join <(sort /home/pi/workspace/nfc_cats/amelia_total.dat) <(sort /home/pi/workspace/nfc_cats/bug_total.dat) > /home/pi/workspace/nfc_cats/temp.dat
join  /home/pi/workspace/nfc_cats/temp.dat <(sort /home/pi/workspace/nfc_cats/tucker_total.dat) > /home/pi/workspace/nfc_cats/cat_temp.dat 
sort -n -k1,1 /home/pi/workspace/nfc_cats/cat_temp.dat > /home/pi/workspace/nfc_cats/cat_total.dat

gnuplot < /home/pi/workspace/nfc_cats/cat_total.gnu

