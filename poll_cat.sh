#!/bin/bash
while true
do
    result=`nfc-poll 2>/dev/null| grep "UID (NFCID1):"` 
    if [[ $? -eq 0 ]] 
    then
        ts=`date +%s`
        id=`echo $result | awk -f /home/pi/workspace/nfc_cats/who_is_it.awk`
        #'BEGIN {FS = " "} {hex=sprintf("0X%s%s%s%s\n", $3,$4,$5,$6);print strtonum(hex)}'`
        echo "$ts $id" >> /home/pi/workspace/nfc_cats/cat.dat
        echo "$ts $id" 
        ./catfmt.sh > cat.txt
        sleep 0.5s
    else
      echo "timeout"
    fi
   echo "<pre>" > /var/www/index.lighttpd.html
   tail -n 50 /home/pi/workspace/nfc_cats/cat.txt >> /var/www/index.lighttpd.html 
   
done

