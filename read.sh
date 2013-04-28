#!/bin/bash

result=`/usr/local/bin/nfc-poll 2>/dev/null| grep "UID (NFCID1):"` 
if [[ $? -eq 0 ]] 
then
    ts=`date +%s`
    id=`echo $result | awk -f /home/$USER/workspace/nfc_cats/who_is_it.awk`
    echo "$ts $id" >> /home/$USER/workspace/nfc_cats/cat.dat
    /home/$USER/workspace/nfc_cats/process.sh $ts $id
else
    echo "timeout"
fi


