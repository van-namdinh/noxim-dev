#for proj_name in default_conf_testXY default_conf_testDYADONE default_conf_testDYADTWO
#do
gnuplot << EOF
#set terminal postscript color enhanced ##setting the term
set term postscript eps color enhanced "Latency" 24
set output "multiple_files_latency.eps"
#set autoscale
set title "Average latency (cycles)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "cycles"

plot "outoffinal_default_conf_testXY_latency.dat"  title "XY_alg" lt rgb"violet", \
"outoffinal_default_conf_testDYADONE_latency.dat"  title "DYADONE" lt rgb "green", \
"outoffinal_default_conf_testDYADTWO_latency.dat"  title "DYADTWO" with linespoints lt rgb "blue"

set key center ##legend placement
quit
EOF
#done
