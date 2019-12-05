# -----------------------------------------------------------------------------
# Project name   :
# File name      : noxim_run_v13.sh
# Created date   : Th12 3 2019
# Author         : Van-Nam DINH
# Last modified  : Th12 3 2019 12:14
# Guide          :
# -----------------------------------------------------------------------------
#!/bin/bash


# This script will explore the topology Butterfly
export PROJECT_DIR=`pwd`
export PROJECT_NAME=Mesh
rm -rf ${PROJECT_DIR}/tmpconfigiles_${PROJECT_NAME}/
rm -rf ${PROJECT_DIR}/temconfigfiles_${PROJECT_NAME}/
mkdir ${PROJECT_DIR}/tmpconfigiles_${PROJECT_NAME}/
mkdir ${PROJECT_DIR}/temconfigfiles_${PROJECT_NAME}/
#Step 1: copy and create the individual config files from original source code
cp ../config_examples/default_configMesh2.yaml \
${PROJECT_DIR}/tmpconfigiles_${PROJECT_NAME}/default_conf_${PROJECT_NAME}.yaml
mkdir ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/
	#./cpconfig.sh
	for ((i=1; i<1000; i++))
	do
		cp \
		${PROJECT_DIR}/tmpconfigiles_${PROJECT_NAME}/default_conf_${PROJECT_NAME}.yaml \
		${PROJECT_DIR}/temconfigfiles_${PROJECT_NAME}/${PROJECT_NAME}$i.yaml
	done
	#./script1to9.sh
	for ((i=1; i<10; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.00$i/g \
		${PROJECT_DIR}/temconfigfiles_${PROJECT_NAME}/${PROJECT_NAME}$i.yaml > \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}$i.yaml;
	done
	
	for((i=10; i<100; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.0$i/g \
		${PROJECT_DIR}/temconfigfiles_${PROJECT_NAME}/${PROJECT_NAME}$i.yaml > \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}$i.yaml;
	done
	#./script10to100.sh
	for ((i=100; i<1000; i++))
	do
		sed s/packet_injection_rate\:\ 0\.01/packet_injection_rate:\ 0\.$i/g \
		${PROJECT_DIR}/temconfigfiles_${PROJECT_NAME}/${PROJECT_NAME}$i.yaml > \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}$i.yaml;
	done
	#cd defaultconfiguration/
	mkdir ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results
	for ((i=1; i<1000; i++))
	do
		./noxim -config \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}$i.yaml > \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/result_$i.txt
		cat ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/result_$i* \
		   	| grep Average\ IP | sort >> \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out_${PROJECT_NAME}_throughput.dat
		cat ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/result_$i* \
		   	| grep Global | sort >> \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out_${PROJECT_NAME}_latency.dat
		cat ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/result_$i* \
			| grep Total\ energy | sort >> \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out_${PROJECT_NAME}_energy.dat

		#out pof Enerygy
		awk '{gsub("% Total energy", ""); print}' \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out_${PROJECT_NAME}_energy.dat	\
		> ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out2_${PROJECT_NAME}_energy.dat
		awk '{gsub(/[(J):]/,""); print}' \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out2_${PROJECT_NAME}_energy.dat \
		> ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/outof_${PROJECT_NAME}_energy.dat 
		awk '{print NR "\t" $s}' \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/outof_${PROJECT_NAME}_energy.dat \
		> ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/outoffinal_${PROJECT_NAME}_energy.dat 

		#out of Latency
		awk '{gsub("% Global average delay", ""); print}' \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out_${PROJECT_NAME}_latency.dat	\
		> ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out2_${PROJECT_NAME}_latency.dat
		awk '{gsub(/[(cycles):]/,""); print}' \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out2_${PROJECT_NAME}_latency.dat \
		> ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/outof_${PROJECT_NAME}_latency.dat 
		awk '{print NR "\t" $s}' \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/outof_${PROJECT_NAME}_latency.dat \
		> ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/outoffinal_${PROJECT_NAME}_latency.dat 

		#out of Throughput
		awk '{gsub("% Average IP throughput", ""); print}' \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out_${PROJECT_NAME}_throughput.dat	\
		> ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out2_${PROJECT_NAME}_throughput.dat
		awk '{gsub(/[(flits/cycle/IP):]/,""); print}' \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/out2_${PROJECT_NAME}_throughput.dat \
		> ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/outof_${PROJECT_NAME}_throughput.dat 
		awk '{print NR "\t" $s}' \
		${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/outof_${PROJECT_NAME}_throughput.dat \
		> ${PROJECT_DIR}/tmpconfigilesrun_${PROJECT_NAME}/${PROJECT_NAME}_results/outoffinal_${PROJECT_NAME}_throughput.dat 
	done
