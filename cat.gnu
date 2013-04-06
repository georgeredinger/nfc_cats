set terminal png size 1024, 250 
set output '/home/pi/workspace/nfc_cats/cat.png'
set xdata time
set timefmt "%s"
set format x "%d-%H"     # or anything else
set xlabel "time"
set pointsize 2.5
plot '/home/pi/workspace/nfc_cats/bug.dat' using ($1-8*3600):($2) with points title "Bug", '/home/pi/workspace/nfc_cats/noname.dat' using ($1-8*3600):($2) with points title "No Name"


