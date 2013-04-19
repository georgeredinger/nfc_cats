#!/bin/bash
rm /home/$USER/workspace/nfc_cats/amelia_total.dat
rm /home/$USER/workspace/nfc_cats/bug_total.dat
rm /home/$USER/workspace/nfc_cats/tucker_total.dat
sync
awk -f /home/$USER/workspace/nfc_cats/total_plot.awk < /home/$USER/workspace/nfc_cats/cat.dat 
join <(sort /home/$USER/workspace/nfc_cats/amelia_total.dat) <(sort /home/$USER/workspace/nfc_cats/bug_total.dat) > /home/$USER/workspace/nfc_cats/temp.dat
join  /home/$USER/workspace/nfc_cats/temp.dat <(sort /home/$USER/workspace/nfc_cats/tucker_total.dat) > /home/$USER/workspace/nfc_cats/cat_temp.dat 
sort -n -k1,1 /home/$USER/workspace/nfc_cats/cat_temp.dat > /home/$USER/workspace/nfc_cats/cat_total.dat

gnuplot < /home/$USER/workspace/nfc_cats/cat_total.gnu

