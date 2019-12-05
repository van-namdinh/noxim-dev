#!/bin/sh
#proj_name=default_configMesh
for proj_name in default_conf_testXY default_conf_testDYADONE default_conf_testDYADTWO
do
gnuplot << EOF
set term postscript eps color blacktext "Energy" 24
set out "${proj_name}_Total_Energy.eps"
set title "dataout energy (J)"
set xlabel "Package injection rate %"
set ylabel "Total power energy (J)"
set xrange [0:150]
set grid
plot "outoffinal_${proj_name}_energy.dat" using 1:2 notitle
set output
quit
EOF
done
