#!/bin/sh
#proj_name=default_configMesh
for proj_name in default_configBaseline default_configBfly \
	default_configMeshNoHUB default_configMesh default_configOmega \
	default_config testdelta 
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
