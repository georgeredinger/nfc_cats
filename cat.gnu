set terminal png size 1024, 250 
set output '/home/pi/workspace/nfc_cats/cat.png'
set xdata time
set timefmt "%s"
set format x "%d-%H"     # or anything else
set xlabel "Time DD-HH"
set pointsize 2.5
set title "Who is the thirstist cat ?"
plot '/home/pi/workspace/nfc_cats/bug.dat' using ($1-7*3600):($2) with points title "Bug", '/home/pi/workspace/nfc_cats/amelia.dat' using ($1-7*3600):($2) with points title "Amelia", '/home/pi/workspace/nfc_cats/tucker.dat' using ($1-7*3600):($2) with points title "Tucker"




