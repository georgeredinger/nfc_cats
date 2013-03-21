set terminal png size 1024, 250 
set output 'cat.png'
set xdata time
set timefmt "%s"
set format x "%H:%M"     # or anything else
set xlabel "time"
plot 'cat1.dat' using 1:2 with steps

