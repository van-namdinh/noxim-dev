##27ad81 -----------------------------------------------------------------------------
# Project name   :
# File name      : gnuplot_v8_latency.sh
# Created date   : Th11 28 2019
# Author         : Van-Nam DINH
# Last modified  : Th11 28 2019 18:32
# Guide          :
# -----------------------------------------------------------------------------
#!/bin/bash

#for proj_name in default_conf_testXY default_conf_testDYADONE default_conf_testDYADTWO
#do
gnuplot << EOF
set term postscript eps color enhanced "" 24
set output "multiple_files_v9_latency.eps"
set title "Average latency (cycles)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "cycles"

plot \
	"/home/vnd/WORK/noxim/bin/XY_algorithmv9/XY_results/outoffinal_XY_latency.dat" \
  	title "XY" lt rgb "blue", \
	"/home/vnd/WORK/noxim/bin/ODD_EVEN2_algorithmv9/ODD_EVEN2_results/outoffinal_ODD_EVEN2_latency.dat" \
	   	title "ODD EVEN2" lt rgb "grey", \
	"/home/vnd/WORK/noxim/bin/YX_algorithmv9/YX_results/outoffinal_YX_latency.dat" \
  	title "YX" lt rgb "violet"

#plot energy
set term postscript eps color enhanced "" 24
set output "multiple_files_v9_energy.eps"
set title "Average Energy (J)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Total Power Energy (J)"

plot \
	"/home/vnd/WORK/noxim/bin/XY_algorithmv9/XY_results/outoffinal_XY_energy.dat" \
  	title "XY" lt rgb "blue", \
	"/home/vnd/WORK/noxim/bin/ODD_EVEN2_algorithmv9/ODD_EVEN2_results/outoffinal_ODD_EVEN2_energy.dat" \
  	title "ODD EVEN2" lt rgb "grey", \
	"/home/vnd/WORK/noxim/bin/YX_algorithmv9/YX_results/outoffinal_YX_energy.dat" \
  	title "YX" lt rgb "violet"

#plot throughput 
set term postscript eps color enhanced "" 24
set output "multiple_files_v9_throughput.eps"
set title "Average Throughput (flits/cycle/IP)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Average Throughput"

plot \
	"/home/vnd/WORK/noxim/bin/XY_algorithmv9/XY_results/outoffinal_XY_throughput.dat" \
  	title "XY" lt rgb "blue", \
	"/home/vnd/WORK/noxim/bin/ODD_EVEN2_algorithmv9/ODD_EVEN2_results/outoffinal_ODD_EVEN2_throughput.dat" \
  	title "ODD EVEN2" lt rgb "grey", \
	"/home/vnd/WORK/noxim/bin/YX_algorithmv9/YX_results/outoffinal_YX_throughput.dat" \
  	title "YX" lt rgb "violet"

set key center ##legend placement
quit
EOF
#done
