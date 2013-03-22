#!/bin/bash
while true
do
    result=`nfc-poll 2>/dev/null| grep "UID (NFCID1):"` 
    if [[ $? -eq 0 ]] 
    then
        ts=`date +%s`
        id=`echo $result | awk -f who_is_it.awk`
        #'BEGIN {FS = " "} {hex=sprintf("0X%s%s%s%s\n", $3,$4,$5,$6);print strtonum(hex)}'`
        echo "$ts $id"
    fi
done

