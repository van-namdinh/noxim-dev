for proj_name in default_configBaseline default_configBfly \
	default_configMeshNoHUB default_configMesh default_configOmega \
	default_config testdelta 
do
gnuplot << EOF
set term postscript eps color blacktext "Throughput" 24
set out "${proj_name}_Average_throughput.eps"
set title "Dataout Throughput (flits/cycle/ip)"
set xlabel "Package injection rate %"
set ylabel "Average throughput"
set xrange [0:150]
set grid
plot "outoffinal_${proj_name}_throughput.dat" using 1:2 notitle
set output
quit
EOF
done
