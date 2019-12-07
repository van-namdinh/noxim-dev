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
	"/home/vnd/WORK/noxim/bin/DYAD_algorithmv9/DYAD_results/outoffinal_DYAD_latency.dat" \
  	title "DYAD" lt rgb "brown", \
	"/home/vnd/WORK/noxim/bin/NEGATIVE_FIRST_algorithmv9/NEGATIVE_FIRST_results/outoffinal_NEGATIVE_FIRST_latency.dat" \
  	title "NEGATIVE FIRST" lt rgb "red", \
	"/home/vnd/WORK/noxim/bin/NORTH_LAST_algorithmv9/NORTH_LAST_results/outoffinal_NORTH_LAST_latency.dat" \
  	title "NORTH LAST" lt rgb "orange", \
	"/home/vnd/WORK/noxim/bin/ODD_EVEN_algorithmv9/ODD_EVEN_results/outoffinal_ODD_EVEN_latency.dat" \
  	title "ODD EVEN" lt rgb "yellow", \
	"/home/vnd/WORK/noxim/bin/WEST_FIRST_algorithmv9/WEST_FIRST_results/outoffinal_WEST_FIRST_latency.dat" \
  	title "WEST FIRST" lt rgb "green", \
	"/home/vnd/WORK/noxim/bin/XY_algorithmv9/XY_results/outoffinal_XY_latency.dat" \
  	title "XY" lt rgb "blue" 

#plot energy
set term postscript eps color enhanced "" 24
set output "multiple_files_v9_energy.eps"
set title "Average Energy (J)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Total Power Energy (J)"

plot \
	"/home/vnd/WORK/noxim/bin/DYAD_algorithmv9/DYAD_results/outoffinal_DYAD_energy.dat" \
  	title "DYAD" lt rgb "brown", \
	"/home/vnd/WORK/noxim/bin/NEGATIVE_FIRST_algorithmv9/NEGATIVE_FIRST_results/outoffinal_NEGATIVE_FIRST_energy.dat" \
  	title "NEGATIVE FIRST" lt rgb "red", \
	"/home/vnd/WORK/noxim/bin/NORTH_LAST_algorithmv9/NORTH_LAST_results/outoffinal_NORTH_LAST_energy.dat" \
  	title "NORTH LAST" lt rgb "orange", \
	"/home/vnd/WORK/noxim/bin/ODD_EVEN_algorithmv9/ODD_EVEN_results/outoffinal_ODD_EVEN_energy.dat" \
  	title "ODD EVEN" lt rgb "yellow", \
	"/home/vnd/WORK/noxim/bin/WEST_FIRST_algorithmv9/WEST_FIRST_results/outoffinal_WEST_FIRST_energy.dat" \
  	title "WEST FIRST" lt rgb "green", \
	"/home/vnd/WORK/noxim/bin/XY_algorithmv9/XY_results/outoffinal_XY_energy.dat" \
  	title "XY" lt rgb "blue" 

#plot throughput 
set term postscript eps color enhanced "" 24
set output "multiple_files_v9_throughput.eps"
set title "Average Throughput (flits/cycle/IP)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Average Throughput"

plot \
	"/home/vnd/WORK/noxim/bin/DYAD_algorithmv9/DYAD_results/outoffinal_DYAD_throughput.dat" \
  	title "DYAD" lt rgb "brown", \
	"/home/vnd/WORK/noxim/bin/NEGATIVE_FIRST_algorithmv9/NEGATIVE_FIRST_results/outoffinal_NEGATIVE_FIRST_throughput.dat" \
  	title "NEGATIVE FIRST" lt rgb "red", \
	"/home/vnd/WORK/noxim/bin/NORTH_LAST_algorithmv9/NORTH_LAST_results/outoffinal_NORTH_LAST_throughput.dat" \
  	title "NORTH LAST" lt rgb "orange", \
	"/home/vnd/WORK/noxim/bin/ODD_EVEN_algorithmv9/ODD_EVEN_results/outoffinal_ODD_EVEN_throughput.dat" \
  	title "ODD EVEN" lt rgb "yellow", \
	"/home/vnd/WORK/noxim/bin/WEST_FIRST_algorithmv9/WEST_FIRST_results/outoffinal_WEST_FIRST_throughput.dat" \
  	title "WEST FIRST" lt rgb "green", \
	"/home/vnd/WORK/noxim/bin/XY_algorithmv9/XY_results/outoffinal_XY_throughput.dat" \
  	title "XY" lt rgb "blue" 

set key center ##legend placement
quit
EOF
#done
