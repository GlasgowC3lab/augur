#!/bin/bash

# system stats
lscpu | grep -E '^Thread|^Core|^Socket|^CPU\(' > props.txt

# run cpu 
sysbench cpu run --cpu-max-prime= > sysbench.txt # runs on 1 thread
7z b > 7zb.txt  # apparently better and not compiler-specific? measures MIPS
# output: CPU Usage % sum of usage for all threads
# R/U measure of instructions per second for one thread
# R measure of average instructions per second across all threads

# run io benchmark
TEST_DIR=./fiotest
fio --name=write_throughput --directory=$TEST_DIR --numjobs=1 --size=10G --time_based --runtime=30s --ramp_time=2s --ioengine=posixaio --direct=1 --verify=0 --bs=1M --iodepth=64 --rw=write --group_reporting=1 > fio_write.txt
fio --name=read_throughput --directory=$TEST_DIR --numjobs=1 --size=10G --time_based --runtime=30s --ramp_time=2s --ioengine=posixaio --direct=1 --verify=0 --bs=1M --iodepth=64 --rw=read --group_reporting > fio_read.txt
rm $TEST_DIR/read*
rm $TEST_DIR/write*
