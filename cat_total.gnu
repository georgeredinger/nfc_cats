set terminal png size 1024, 250 
set output '/home/pi/workspace/nfc_cats/cat_total.png'
set boxwidth 0.75 absolute
set style fill solid 1.00 border -1
set style data histogram
set style histogram cluster gap 1
set xtics 1000 nomirror
set ytics 100 nomirror
set mxtics 2
set mytics 2
set ytics 10
set ylabel "Laps pre Day"
set xlabel "Day  number"

plot '/home/pi/workspace/nfc_cats/cat_total.dat' using 2 t "Amelia", '' using 3 t "Bug", '' using 4:xtic(1) t "Tucker"




