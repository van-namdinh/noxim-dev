# -----------------------------------------------------------------------------
# Project name   :
# File name      : noxim_run_v10.sh
# Created date   : Th11 28 2019
# Author         : Van-Nam DINH
# Last modified  : Th11 28 2019 14:28
# Guide          :
# -----------------------------------------------------------------------------
#!/bin/bash


# description: This srcript will create a system of comparing between various
# algorithms from default configure file "default_conf.yaml"

export PROJECT_DIR=`pwd`
rm -rf ${PROJECT_DIR}/tmpconfigv10/
mkdir ${PROJECT_DIR}/tmpconfigv10/
#Step 1: copy and create the individual config files from original source code
for algos in XY DELTA WEST_FIRST NORTH_LAST NEGATIVE_FIRST ODD_EVEN DYAD
do
	cp ../config_examples/default_configMesh.yaml ${PROJECT_DIR}/tmpconfigv10/default_conf_${algos}.yaml
done
#Step 2: fix the algorithm
for algos in XY DELTA WEST_FIRST NORTH_LAST NEGATIVE_FIRST ODD_EVEN DYAD
do
	sed s/routing_algorithm:\ TABLE_BASED/routing_algorithm:\ ${algos}/g \
		${PROJECT_DIR}/tmpconfigv10/default_conf_${algos}.yaml > \
		${PROJECT_DIR}/tmpconfigv10/${algos}.yaml
done

rm -r ${PROJECT_DIR}/temconfigv10/
for algos in XY DELTA WEST_FIRST NORTH_LAST NEGATIVE_FIRST ODD_EVEN DYAD
do
	mkdir ${PROJECT_DIR}/temconfigv10
	mkdir ${PROJECT_DIR}/${algos}_algoriv10
	for ((i=1; i<1000; i++))
	do
		cp ${PROJECT_DIR}/tmpconfigv10/${algos}.yaml \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}$i.yaml
	done
	#./script1to9.sh
	for ((i=1; i<10; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.00$i/g \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}$i.yaml > \
		${PROJECT_DIR}/temconfigv10/${algos}$i.yaml;
	done
	
	for((i=10; i<100; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.0$i/g \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}$i.yaml > \
		${PROJECT_DIR}/temconfigv10/${algos}$i.yaml;
	done
	#./script10to100.sh
	for ((i=100; i<1000; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.$i/g \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}$i.yaml > \
		${PROJECT_DIR}/temconfigv10/${algos}$i.yaml;
	done
	#cd defaultconfiguration/
	mkdir ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results
	for ((i=1; i<1000; i++))
	do
		./noxim -config ${PROJECT_DIR}/temconfigv10/${algos}$i.yaml > \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/result_$i.txt
		cat ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/result_$i* \
		   	| grep Average\ IP | sort >> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out_${algos}_throughput.dat
		cat ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/result_$i* \
		   	| grep Global | sort >> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out_${algos}_latency.dat
		cat ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/result_$i* \
			| grep Total\ energy | sort >> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out_${algos}_energy.dat

		#out pof Enerygy
		awk '{gsub("% Total energy", ""); print}' \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out_${algos}_energy.dat	\
		> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out2_${algos}_energy.dat
		awk '{gsub(/[(J):]/,""); print}' \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out2_${algos}_energy.dat \
		> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/outof_${algos}_energy.dat 
		awk '{print NR "\t" $s}' \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/outof_${algos}_energy.dat \
		> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/outoffinal_${algos}_energy.dat 

		#out of Latency
		awk '{gsub("% Global average delay", ""); print}' \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out_${algos}_latency.dat \
		> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out2_${algos}_latency.dat
		awk '{gsub(/[(cycles):]/,""); print}' \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out2_${algos}_latency.dat \
		> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/outof_${algos}_latency.dat
		awk '{print NR "\t" $s}' \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/outof_${algos}_latency.dat \
		> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/outoffinal_${algos}_latency.dat 

		#out of Throughput
		awk '{gsub("% Average IP throughput", ""); print}' \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out_${algos}_throughput.dat \
		> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out2_${algos}_throughput.dat
		awk '{gsub(/[(flits/cycle/IP):]/,""); print}' \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/out2_${algos}_throughput.dat \
		> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/outof_${algos}_throughput.dat 
		awk '{print NR "\t" $s}' \
		${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/outof_${algos}_throughput.dat \
		> ${PROJECT_DIR}/${algos}_algoriv10/${algos}_results/outoffinal_${algos}_throughput.dat 
	done
done
