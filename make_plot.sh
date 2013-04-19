#!/bin/bash
rm /home/$USER/workspace/nfc_cats/amelia.dat
rm /home/$USER/workspace/nfc_cats/bug.dat
rm /home/$USER/workspace/nfc_cats/tucker.dat
sync
awk -f /home/$USER/workspace/nfc_cats/plot_prep.awk < /home/$USER/workspace/nfc_cats/cat.dat 
gnuplot < /home/$USER/workspace/nfc_cats/cat.gnu

