# -----------------------------------------------------------------------------
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
set output "multiple_files_v8_latency.eps"
set title "Average latency (cycles)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "cycles"

plot "/home/vnd/WORK/noxim/bin/DELTA_algorithmv8/DELTA_results/outoffinal_DELTA_latency.dat" title "DELTA" lt rgb "#440154", \
"/home/vnd/WORK/noxim/bin/DYAD_algorithmv8/DYAD_results/outoffinal_DYAD_latency.dat"  title "DYAD" lt rgb "#472c7a", \
"/home/vnd/WORK/noxim/bin/NEGATIVE_FIRST_algorithmv8/NEGATIVE_FIRST_results/outoffinal_NEGATIVE_FIRST_latency.dat"  title "NEGATIVE_FIRST" lt rgb "#3b518b", \
"/home/vnd/WORK/noxim/bin/NORTH_LAST_algorithmv8/NORTH_LAST_results/outoffinal_NORTH_LAST_latency.dat"  title "NORTH_LAST" lt rgb "#2c718e", \
"/home/vnd/WORK/noxim/bin/ODD_EVEN_algorithmv8/ODD_EVEN_results/outoffinal_ODD_EVEN_latency.dat"  title "ODD_EVEN" lt rgb "#27ad81", \
"/home/vnd/WORK/noxim/bin/WEST_FIRST_algorithmv8/WEST_FIRST_results/outoffinal_WEST_FIRST_latency.dat"  title "WEST_FIRST" lt rgb "#fde725", \
"/home/vnd/WORK/noxim/bin/XY_algorithmv8/XY_results/outoffinal_XY_latency.dat"  title "XY" lt rgb "red", \
"/home/vnd/WORK/noxim/bin/YX_algorithmv8/YX_results/outoffinal_YX_latency.dat"  title "YX" lt rgb "violet"

#plot energy
set term postscript eps color enhanced "" 24
set output "multiple_files_v8_energy.eps"
set title "Average Energy (J)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Total Power Energy (J)"

plot "/home/vnd/WORK/noxim/bin/DELTA_algorithmv8/DELTA_results/outoffinal_DELTA_energy.dat"  title "DELTA" lt rgb "#440154", \
"/home/vnd/WORK/noxim/bin/DYAD_algorithmv8/DYAD_results/outoffinal_DYAD_energy.dat"  title "DYAD" lt rgb "#472c7a", \
"/home/vnd/WORK/noxim/bin/NEGATIVE_FIRST_algorithmv8/NEGATIVE_FIRST_results/outoffinal_NEGATIVE_FIRST_energy.dat"  title "NEGATIVE_FIRST" lt rgb "#3b518b", \
"/home/vnd/WORK/noxim/bin/NORTH_LAST_algorithmv8/NORTH_LAST_results/outoffinal_NORTH_LAST_energy.dat"  title "NORTH_LAST" lt rgb "#2c718e", \
"/home/vnd/WORK/noxim/bin/ODD_EVEN_algorithmv8/ODD_EVEN_results/outoffinal_ODD_EVEN_energy.dat"  title "ODD_EVEN" lt rgb "#27ad81", \
"/home/vnd/WORK/noxim/bin/WEST_FIRST_algorithmv8/WEST_FIRST_results/outoffinal_WEST_FIRST_energy.dat"  title "WEST_FIRST" lt rgb "#fde725", \
"/home/vnd/WORK/noxim/bin/XY_algorithmv8/XY_results/outoffinal_XY_energy.dat"  title "XY" lt rgb "red", \
"/home/vnd/WORK/noxim/bin/YX_algorithmv8/YX_results/outoffinal_YX_energy.dat"  title "YX" lt rgb "violet"


#plot throughput 
set term postscript eps color enhanced "" 24
set output "multiple_files_v8_throughput.eps"
set title "Average Throughput (flits/cycle/IP)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Average Throughput"

plot "/home/vnd/WORK/noxim/bin/DELTA_algorithmv8/DELTA_results/outoffinal_DELTA_throughput.dat"  title "DELTA" lt rgb "#440154", \
"/home/vnd/WORK/noxim/bin/DYAD_algorithmv8/DYAD_results/outoffinal_DYAD_throughput.dat"  title "DYAD" lt rgb "#472c7a", \
"/home/vnd/WORK/noxim/bin/NEGATIVE_FIRST_algorithmv8/NEGATIVE_FIRST_results/outoffinal_NEGATIVE_FIRST_throughput.dat"  title "NEGATIVE_FIRST" lt rgb "#3b518b", \
"/home/vnd/WORK/noxim/bin/NORTH_LAST_algorithmv8/NORTH_LAST_results/outoffinal_NORTH_LAST_throughput.dat"  title "NORTH_LAST" lt rgb "#2c718e", \
"/home/vnd/WORK/noxim/bin/ODD_EVEN_algorithmv8/ODD_EVEN_results/outoffinal_ODD_EVEN_throughput.dat"  title "ODD_EVEN" lt rgb "#27ad81", \
"/home/vnd/WORK/noxim/bin/WEST_FIRST_algorithmv8/WEST_FIRST_results/outoffinal_WEST_FIRST_throughput.dat"  title "WEST_FIRST" lt rgb "#fde725", \
"/home/vnd/WORK/noxim/bin/XY_algorithmv8/XY_results/outoffinal_XY_throughput.dat"  title "XY" lt rgb "red", \
"/home/vnd/WORK/noxim/bin/YX_algorithmv8/YX_results/outoffinal_YX_throughput.dat"  title "YX" lt rgb "violet"

set key center ##legend placement
quit
EOF
#done
