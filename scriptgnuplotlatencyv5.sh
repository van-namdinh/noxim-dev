for proj_name in default_configBaseline default_configBfly \
	default_configMeshNoHUB default_configMesh default_configOmega \
	default_config testdelta 
do
	gnuplot << EOF
set term postscript eps color blacktext "Latency" 24
set out "${proj_name}_Averagelatency.eps"
set title "Average Latency (cycles)"
set xlabel "Package injection rate %"
set ylabel "cycles"
set xrange [0:150]
set grid
plot "outoffinal_${proj_name}_latency.dat" using 1:2 notitle
set output
quit
EOF
done
