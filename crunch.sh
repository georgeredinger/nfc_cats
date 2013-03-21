#!/bin/bash
awk 'BEGIN {last = 0;FS=" "} {delta = $1-last;if(last !=0) print $1,delta;last=$1}' cat.dat > cat1.dat
gnuplot < cat.gnu
