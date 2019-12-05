# -----------------------------------------------------------------------------
# Project name   :
# File name      : noxim_default_v1.sh
# Created date   : Th07 24 2019
# Author         : Van-Nam DINH
# Last modified  : Th07 24 2019 10:22
# Guide          :
# -----------------------------------------------------------------------------
#!/bin/bash

#NOTE
#This script will run noxim with many configurations to get the system's performance
export PROJECT_DIR=`pwd`
#Note that the algos can be
# default_config
# multi_channel
# testdelta_hops_16
# testdelta_hops_1
# testdelta_hops_2
# testdelta
rm -r temconfigfiles/
for algos in default_conf_testXY default_conf_testDYADONE default_conf_testDYADTWO
#algos=default_conf_test
do
	rm -rf ${algos}*
#	rm -rf *.dat
#	rm -rf *.eps
	export PROJECT_NAME=${algos}
	#./cpconfig.sh
	mkdir temconfigfiles
	for ((i=1; i<1000; i++))
	do
		cp ../config_examples/${algos}.yaml ${PROJECT_DIR}/temconfigfiles/${algos}$i.yaml
	done
	#./script1to9.sh
	for ((i=1; i<10; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.00$i/g \
		temconfigfiles/${algos}$i.yaml > ${algos}$i.yaml;
	done
	
	for((i=10; i<100; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.0$i/g \
		temconfigfiles/${algos}$i.yaml > ${algos}$i.yaml;
	done
	#./script10to100.sh
	for ((i=100; i<1000; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.$i/g \
		temconfigfiles/${algos}$i.yaml > ${algos}$i.yaml;
	done
	#mkdir defaultconfiguration
	mkdir ${algos} 
	#cd defaultconfiguration/
	mv ${algos}*.yaml ${algos}/
	mkdir ${algos}_results
	for ((i=1; i<1000; i++))
	do
		./noxim -config ${algos}/${algos}$i.yaml >	${algos}_results/result_$i.txt
		cat ${algos}_results/result_$i* | grep Average\ IP | sort >> out_${algos}_throughput.dat
		cat ${algos}_results/result_$i* | grep Global | sort >> out_${algos}_latency.dat
		cat ${algos}_results/result_$i* | grep Total\ energy | sort >> out_${algos}_energy.dat

		#out pof Enerygy
		awk '{gsub("% Total energy", ""); print}'  out_${algos}_energy.dat > out2_${algos}_energy.dat
		awk '{gsub(/[(J):]/,""); print}' out2_${algos}_energy.dat >  outof_${algos}_energy.dat 
		awk '{print NR "\t" $s}'  outof_${algos}_energy.dat > outoffinal_${algos}_energy.dat 

		#out of Latency
		awk '{gsub("% Global average delay", ""); print}' out_${algos}_latency.dat > out2_${algos}_latency.dat
		awk '{gsub(/[(cycles):]/,""); print}'  out2_${algos}_latency.dat > outof_${algos}_latency.dat
		awk '{print NR "\t" $s}' outof_${algos}_latency.dat > outoffinal_${algos}_latency.dat 

		#out of Throughput
		awk '{gsub("% Average IP throughput", ""); print}' out_${algos}_throughput.dat > out2_${algos}_throughput.dat
		awk '{gsub(/[(flits/cycle/IP):]/,""); print}' out2_${algos}_throughput.dat > outof_${algos}_throughput.dat 
		awk '{print NR "\t" $s}' outof_${algos}_throughput.dat > outoffinal_${algos}_throughput.dat 
	done
done
./scriptgnuplotenergyv6.sh
./scriptgnuplotlatencyv6.sh
./scriptgnuplotthroughputv6.sh
mkdir outoffinalfilesepsv6`date +%Y-%m-%d`
mkdir outoffinaldatav6`date +%Y-%m-%d`
mv *.eps outoffinalfilesepsv6`date +%Y-%m-%d`
mv *.dat outoffinaldatav6`date +%Y-%m-%d`
