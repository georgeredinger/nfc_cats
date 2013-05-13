#!/bin/bash
ts=$1
id=$2
human=`date -d @"$ts"`
result="$human $id"
echo $result >> ./cat.txt
./make_plot.sh
echo "<div id=\"plot\"> <img src=\"cat.png\"></div> " > ./index.html 
echo "<div id=\"plot_total\"> <img src=\"cat_total.png\"></div> <pre>" >> ./index.html 
tac  ./cat.txt >> ./index.html 
echo "</pre>" >> ./index.html 
./make_totals_plot.sh
cp ./index.html  "$PAGE_DESTINATION" 

