for proj_name in default_conf_testXY default_conf_testDYADONE default_conf_testDYADTWO
do
	gnuplot << EOF
#set term postscript eps color blacktext "Latency" 24
set term postscript color noenhanced
set out "Averagelatency_v2.eps"
set title "Average Latency (cycles)"
set xlabel "Package injection rate %"
set ylabel "cycles"
#set xrange [0:200]
set grid
plot [1:5][0:200] \
   for [i=1:3] "outoffinal_${proj_name}_latency.dat" pointsize 1.3 linecolor i+4 with linespoint
set output
quit
EOF
done
