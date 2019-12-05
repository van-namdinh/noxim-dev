#for proj_name in default_conf_testXY default_conf_testDYADONE default_conf_testDYADTWO
#do
	gnuplot << EOF
	set terminal png
	set output "Avarage_latency.png"

	set xdata time
	set timefmt "%S"
#	set xlable "time"

	set autoscale

	set ylabel "cycles"

	set xrange [0:1000]

	set title "Average Latency (cycles)"
	set xlabel "Package injection rate %"
	
	set grid

#	set style data linespoints
#	plot "outoffinal_${proj_name}_latency.dat" using 1:2 title "flow_${proj_name}"
	plot "outoffinal_default_conf_testXY_latency.dat" using 1:2 title "XY"	
	"outoffinal_default_conf_testDYADONE_latency.dat" using 1:2 title "ONE"	
	"outoffinal_default_conf_testDYADTWO_latency.dat" using 1:2 title "TWO"
	set output
quit
EOF
#done
