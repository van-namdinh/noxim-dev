#for proj_name in default_conf_testXY default_conf_testDYADONE default_conf_testDYADTWO
#do
gnuplot << EOF
#set terminal postscript color enhanced ##setting the term
set term postscript eps color enhanced "" 24
set output "multiple_files_throughput.eps"
#set autoscale
set title "Average Throughput (flits/cycle/ip)"
set xlabel "PIR %"
set xrange [0:200]
set ylabel "Average Throughput"

plot "outoffinal_default_conf_testXY_throughput.dat"  title "XY_alg" lt rgb"violet", \
"outoffinal_default_conf_testDYADONE_throughput.dat"  title "DYADONE" lt rgb "green", \
"outoffinal_default_conf_testDYADTWO_throughput.dat"  title "DYADTWO" with linespoints lt rgb "blue"

set key center ##legend placement
quit
EOF
#done
