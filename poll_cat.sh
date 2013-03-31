#!/bin/bash
while true
do
    result=`/usr/local/bin/nfc-poll 2>/dev/null| grep "UID (NFCID1):"` 
    if [[ $? -eq 0 ]] 
    then
        ts=`date +%s`
        id=`echo $result | awk -f /home/pi/workspace/nfc_cats/who_is_it.awk`
        #'BEGIN {FS = " "} {hex=sprintf("0X%s%s%s%s\n", $3,$4,$5,$6);print strtonum(hex)}'`
        echo "$ts $id" >> /home/pi/workspace/nfc_cats/cat.dat

        human=`date -d @"$ts"`
        result="$human $id"
        echo $result >> /home/pi/workspace/nfc_cats/cat.txt
        /home/pi/workspace/nfc_cats/make_plot.sh
    else
      echo "timeout"
    fi
   echo "<div id=\"plot\"> <img src=\"cat.png\"></div> <pre>" > /var/www/index.lighttpd.html
   awk -f /home/pi/workspace/nfc_cats/totals.awk < /home/pi/workspace/nfc_cats/cat.dat >> /var/www/index.lighttpd.html
   tac  /home/pi/workspace/nfc_cats/cat.txt >> /var/www/index.lighttpd.html 
   echo "</pre>" >> /var/www/index.lighttpd.html
   sleep 0.5s
done

