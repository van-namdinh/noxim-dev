# -----------------------------------------------------------------------------
# Project name   :
# File name      : gnuplot_v10_latency.sh
# Created date   : Th11 28 2019
# Author         : Van-Nam DINH
# Last modified  : Th11 28 2019 18:32
# Guide          :
# -----------------------------------------------------------------------------
#!/bin/bash

#for proj_name in default_conf_testXY default_conf_testDYADONE default_conf_testDYADTWO
#do
gnuplot << EOF
#display latency
set term postscript eps color enhanced "" 24
set output "multiple_files_v11_latency.eps"
set title "Average latency (cycles)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "cycles"

plot \
"/home/vnd/WORK/noxim/bin/tmpconfigilesrun_butterfly/butterfly_results/outoffinal_butterfly_latency.dat" \
title "BUTTERFLY" lt rgb 'red'

#plot energy
set term postscript eps color enhanced "" 24
set output "multiple_files_v11_energy.eps"
set title "Average Energy (J)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Total Power Energy (J)"

plot \
"/home/vnd/WORK/noxim/bin/tmpconfigilesrun_butterfly/butterfly_results/outoffinal_butterfly_energy.dat" \
title "BUTTERFLY" lt rgb 'red'

#plot throughput 
set term postscript eps color enhanced "" 24
set output "multiple_files_v11_throughput.eps"
set title "Average Throughput (flits/cycle/IP)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Average Throughput"


plot \
"/home/vnd/WORK/noxim/bin/tmpconfigilesrun_butterfly/butterfly_results/outoffinal_butterfly_throughput.dat" \
title "BUTTERFLY" lt rgb 'red'
set key center ##legend placement
quit
EOF
#done
