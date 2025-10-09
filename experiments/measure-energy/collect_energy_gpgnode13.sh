#!/bin/bash

filename=$1
filename2=$2

while [ 1 ]
do
    #cat /energy-data/intel-rapl/intel-rapl:0/energy_uj >> $filename #/sys/class/powercap/intel-rapl
    #cat /energy-data/node-c37/intel-rapl:0/intel-rapl:0:0/energy_uj >> $filename #only CPU cores 
    cat /energy-data/gpgnode13/intel-rapl:0/energy_uj >> $filename #package
    $(($(date +%s%N)/1000000)) >> $filename  
    cat /energy-data/gpgnode13/intel-rapl:0/intel-rapl:0:0/energy_uj >> $filename2 #DRAM
    $(($(date +%s%N)/1000000)) >> $filename2
    #sleep until next full second; copied from https://stackoverflow.com/questions/33204838/bash-command-wait-until-next-full-second
    sleep 0.$(printf '%04d' $((10000 - 10#$(date +%4N))))
done
