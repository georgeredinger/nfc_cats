#!/bin/bash
while read line
  do 
  d=`echo $line | cut -d ' ' -f 1`
  human=`date -d @"$d"`
  rest=`echo $line | cut -d ' ' -f 2,3,4,5`
  result="$human $rest"
  echo $result
done < cat.dat

