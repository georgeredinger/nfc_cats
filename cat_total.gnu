set terminal png size 1024, 250 
set output '/home/pi/workspace/nfc_cats/cat_total.png'
set xlabel "Day of Year"
set style fill solid border -1
set style histogram cluster gap 1
set boxwidth 0.5
set title "Laps v Julian Day"
plot '/home/pi/workspace/nfc_cats/bug_total.dat' using ($1):($2) title "Bug", '/home/pi/workspace/nfc_cats/amelia_total.dat' using ($1):($2)  title "Amelia", '/home/pi/workspace/nfc_cats/tucker_total.dat' using ($1):($2)  title "Tucker"




