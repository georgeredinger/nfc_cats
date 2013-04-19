#!/bin/bash

while true
do
    result=`/usr/local/bin/nfc-poll 2>/dev/null| grep "UID (NFCID1):"` 
    if [[ $? -eq 0 ]] 
    then
        ts=`date +%s`
        id=`echo $result | awk -f /home/$USER/workspace/nfc_cats/who_is_it.awk`
        #'BEGIN {FS = " "} {hex=sprintf("0X%s%s%s%s\n", $3,$4,$5,$6);print strtonum(hex)}'`
        echo "$ts $id" >> /home/$USER/workspace/nfc_cats/cat.dat

        human=`date -d @"$ts"`
        result="$human $id"
        echo $result >> /home/$USER/workspace/nfc_cats/cat.txt
        /home/$USER/workspace/nfc_cats/make_plot.sh
        /home/$USER/workspace/nfc_cats/make_totals_plot.sh
    else
      echo "timeout"
    fi
   echo "<div id=\"plot\"> <img src=\"cat.png\"></div> " > /var/www/index.lighttpd.html
   echo "<div id=\"plot_total\"> <img src=\"cat_total.png\"></div> <pre>" >> /var/www/index.lighttpd.html
#   awk -f /home/$USER/workspace/nfc_cats/totals.awk < /home/$USER/workspace/nfc_cats/cat.dat >> /var/www/index.lighttpd.html
   tac  /home/$USER/workspace/nfc_cats/cat.txt >> /var/www/index.lighttpd.html 
   echo "</pre>" >> /var/www/index.lighttpd.html
   sleep 0.5s
done

