# -----------------------------------------------------------------------------
# Project name   :
# File name      : gnuplot_v8_energy.sh
# Created date   : Th11 28 2019
# Author         : Van-Nam DINH
# Last modified  : Th11 28 2019 18:32
# Guide          :
# -----------------------------------------------------------------------------
#!/bin/bash

#for proj_name in default_conf_testXY default_conf_testDYADONE default_conf_testDYADTWO
#do
gnuplot << EOF
#set terminal postscript color enhanced ##setting the term
set term postscript eps color enhanced "" 24
set output "multiple_files_v8_energy.eps"
#set autoscale
set title "Average energy (J)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Total power enerygy (J)"

plot "home/vnd/WORK/noxim/bin/DELTA_algorithm/DELTA_results/outoffinal_DELTA_energy.dat"  title "DELTA" lt rgb "#440154", \
"home/vnd/WORK/noxim/bin/DYAD_algorithm/DYAD_results/outoffinal_DYAD_energy.dat"  title "DYAD" lt rgb "#472c7a", \
"home/vnd/WORK/noxim/bin/NEGATIVE_FIRST_algorithm/NEGATIVE_FIRST_results/outoffinal_NEGATIVE_FIRST_energy.dat"  title "NEGATIVE_FIRST" lt rgb "#3b518b",\
"home/vnd/WORK/noxim/bin/NORTH_LAST_algorithm/NORTH_LAST_results/outoffinal_NORTH_LAST_energy.dat"  title "NORTH_LAST" lt rgb "#2c718e",\
"home/vnd/WORK/noxim/bin/ODD_EVEN_algorithm/ODD_EVEN_results/outoffinal_ODD_EVEN_energy.dat"  title "ODD_EVEN" lt rgb "#27ad81", \
"home/vnd/WORK/noxim/bin/WEST_FIRST_algorithm/WEST_FIRST_results/outoffinal_WEST_FIRST_energy.dat"  title "WEST_FIRST" lt rgb "#fde725", \
"home/vnd/WORK/noxim/bin/XY_algorithm/XY_results/outoffinal_XY_energy.dat"  title "XY" lt rgb "red", \
"home/vnd/WORK/noxim/bin/YX_algorithm/YX_results/outoffinal_YX_energy.dat"  title "YX" lt rgb "violet"
set key center ##legend placement
quit
EOF
#done
# reference link for colors from 
# http://www.gnuplotting.org/?s=color

