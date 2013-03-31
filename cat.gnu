set terminal png size 1024, 250 
set output '/home/pi/workspace/nfc_cats/cat.png'
set xdata time
set timefmt "%s"
set format x "%d-%H"     # or anything else
set xlabel "time"
set pointsize 2.5
plot '/home/pi/workspace/nfc_cats/oliver.dat' using ($1-8*3600):($2) with points title "Oliver", '/home/pi/workspace/nfc_cats/sadie.dat' using ($1-8*3600):($2) with points title "Sadie"


