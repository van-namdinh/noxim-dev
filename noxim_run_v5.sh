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
#Note that the proj_name can be
# 256_12h
# 256_16h_4channels
# 256_16h
# 256_4h_2channels
# 256_4h
# 256_8h
# article.yaml //not available
# configWirelessCore2CoreBfly // not run
# default_configBaseline
# default_configBfly
# default_configMeshNoHUB
# default_configMesh
# default_configOmega
# default_config
# multi_channel
# testdelta_hops_16
# testdelta_hops_1
# testdelta_hops_2
# testdelta
rm -r temconfigfiles/
for proj_name in default_configBaseline default_configBfly \
	default_configMeshNoHUB default_configMesh default_configOmega \
	default_config testdelta 
#proj_name=default_configMesh
do
	rm -rf ${proj_name}*
#	rm -rf *.dat
#	rm -rf *.eps
	export PROJECT_NAME=${proj_name}
	#./cpconfig.sh
	mkdir temconfigfiles
	for ((i=1; i<1000; i++))
	do
		cp ../config_examples/${proj_name}.yaml ${PROJECT_DIR}/temconfigfiles/${proj_name}$i.yaml
	done
	#./script1to9.sh
	for ((i=1; i<10; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.00$i/g \
		temconfigfiles/${proj_name}$i.yaml > ${proj_name}$i.yaml;
	done
	
	for((i=10; i<100; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.0$i/g \
		temconfigfiles/${proj_name}$i.yaml > ${proj_name}$i.yaml;
	done
	#./script10to100.sh
	for ((i=100; i<1000; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.$i/g \
		temconfigfiles/${proj_name}$i.yaml > ${proj_name}$i.yaml;
	done
	#mkdir defaultconfiguration
	mkdir ${proj_name} 
	#cd defaultconfiguration/
	mv ${proj_name}*.yaml ${proj_name}/
	mkdir ${proj_name}_results
	for ((i=1; i<1000; i++))
	do
		./noxim -config ${proj_name}/${proj_name}$i.yaml >	${proj_name}_results/result_$i.txt
		cat ${proj_name}_results/result_$i* | grep Average\ IP | sort >> out_${proj_name}_throughput.dat
		cat ${proj_name}_results/result_$i* | grep Global | sort >> out_${proj_name}_latency.dat
		cat ${proj_name}_results/result_$i* | grep Total\ energy | sort >> out_${proj_name}_energy.dat

		#out pof Enerygy
		awk '{gsub("% Total energy", ""); print}'  out_${proj_name}_energy.dat > out2_${proj_name}_energy.dat
		awk '{gsub(/[(J):]/,""); print}' out2_${proj_name}_energy.dat >  outof_${proj_name}_energy.dat 
		awk '{print NR "\t" $s}'  outof_${proj_name}_energy.dat > outoffinal_${proj_name}_energy.dat 

		#out of Latency
		awk '{gsub("% Global average delay", ""); print}' out_${proj_name}_latency.dat > out2_${proj_name}_latency.dat
		awk '{gsub(/[(cycles):]/,""); print}'  out2_${proj_name}_latency.dat > outof_${proj_name}_latency.dat
		awk '{print NR "\t" $s}' outof_${proj_name}_latency.dat > outoffinal_${proj_name}_latency.dat 

		#out of Throughput
		awk '{gsub("% Average IP throughput", ""); print}' out_${proj_name}_throughput.dat > out2_${proj_name}_throughput.dat
		awk '{gsub(/[(flits/cycle/IP):]/,""); print}' out2_${proj_name}_throughput.dat > outof_${proj_name}_throughput.dat 
		awk '{print NR "\t" $s}' outof_${proj_name}_throughput.dat > outoffinal_${proj_name}_throughput.dat 
	done
done
./scriptgnuplotenergyv5.sh
./scriptgnuplotlatencyv5.sh
./scriptgnuplotthroughputv5.sh
mkdir outoffinalfilesepsv5`date +%Y-%m-%d`
mkdir outoffinaldatav5`date +%Y-%m-%d`
mv *.eps outoffinalfilesepsv5`date +%Y-%m-%d`
mv *.dat outoffinaldatav5`date +%Y-%m-%d`
