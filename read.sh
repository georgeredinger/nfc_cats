#!/bin/bash

result=`nfc-poll | grep "UID (NFCID1):"` 
if [[ $? -eq 0 ]] 
then
    ts=`date +%s`
    id=`echo $result | awk -f ./who_is_it.awk`
    echo "$ts $id" >> ./cat.dat
    ./process.sh $ts $id
fi

